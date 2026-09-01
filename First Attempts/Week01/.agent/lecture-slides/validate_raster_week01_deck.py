#!/usr/bin/env python3
"""Validate the structural and source-contract properties of the Week 1 deck."""

from __future__ import annotations

import hashlib
import json
import posixpath
import sys
import zipfile
from pathlib import Path
import xml.etree.ElementTree as ET


P_NS = {
    "p": "http://schemas.openxmlformats.org/presentationml/2006/main",
    "a": "http://schemas.openxmlformats.org/drawingml/2006/main",
    "r": "http://schemas.openxmlformats.org/officeDocument/2006/relationships",
    "pr": "http://schemas.openxmlformats.org/package/2006/relationships",
}


def natural_slide_key(name: str) -> tuple[int, str]:
    stem = Path(name).stem
    digits = "".join(ch for ch in stem if ch.isdigit())
    return (int(digits or 0), name)


def sha256_bytes(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def validate(deck_path: Path, folder: Path) -> dict:
    specs_path = folder / "slide_specs.json"
    specs = json.loads(specs_path.read_text(encoding="utf-8"))
    slides = specs["slides"]
    assert len(slides) == 18, "slide_specs.json must contain 18 slides"
    assert specs["deck"]["duration_minutes"] == 120
    assert "No branding" in specs["deck"]["branding_override"]
    canvas_rule = specs["deck"]["canvas"].lower()
    assert "pure white" in canvas_rule and "no outer border" in canvas_rule
    assert "no mesh" in canvas_rule and "locked roboto condensed bold" in canvas_rule

    with zipfile.ZipFile(deck_path) as archive:
        bad_member = archive.testzip()
        assert bad_member is None, f"ZIP CRC failure: {bad_member}"
        names = set(archive.namelist())
        slide_names = sorted(
            (n for n in names if n.startswith("ppt/slides/slide") and n.endswith(".xml")),
            key=natural_slide_key,
        )
        notes_names = sorted(
            (n for n in names if n.startswith("ppt/notesSlides/notesSlide") and n.endswith(".xml")),
            key=natural_slide_key,
        )
        media_names = sorted(n for n in names if n.startswith("ppt/media/") and not n.endswith("/"))
        assert len(slide_names) == 18, f"expected 18 slide XML files, found {len(slide_names)}"
        assert len(notes_names) == 18, f"expected 18 notes XML files, found {len(notes_names)}"
        assert len(media_names) == 18, f"expected 18 media files, found {len(media_names)}"
        assert all(n.lower().endswith(".png") for n in media_names), media_names

        presentation = ET.fromstring(archive.read("ppt/presentation.xml"))
        slide_size = presentation.find("p:sldSz", P_NS)
        assert slide_size is not None
        expected_cx = int(slide_size.attrib["cx"])
        expected_cy = int(slide_size.attrib["cy"])
        assert (expected_cx, expected_cy) == (12192000, 6858000), (expected_cx, expected_cy)

        checks = []
        referenced_media = []
        note_texts = []
        for index, slide_name in enumerate(slide_names, 1):
            root = ET.fromstring(archive.read(slide_name))
            pic_count = len(root.findall(".//p:pic", P_NS))
            shape_count = len(root.findall(".//p:sp", P_NS))
            graphic_frame_count = len(root.findall(".//p:graphicFrame", P_NS))
            connector_count = len(root.findall(".//p:cxnSp", P_NS))
            group_count = len(root.findall(".//p:grpSp", P_NS))
            assert pic_count == 1, (slide_name, pic_count)
            assert shape_count == 0, (slide_name, shape_count)
            assert graphic_frame_count == 0, (slide_name, graphic_frame_count)
            assert connector_count == 0, (slide_name, connector_count)
            assert group_count == 0, (slide_name, group_count)

            pic = root.find(".//p:pic", P_NS)
            xfrm = pic.find(".//a:xfrm", P_NS) if pic is not None else None
            off = xfrm.find("a:off", P_NS) if xfrm is not None else None
            ext = xfrm.find("a:ext", P_NS) if xfrm is not None else None
            assert off is not None and ext is not None
            assert (int(off.attrib["x"]), int(off.attrib["y"])) == (0, 0), (slide_name, off.attrib)
            assert (int(ext.attrib["cx"]), int(ext.attrib["cy"])) == (expected_cx, expected_cy), (slide_name, ext.attrib)

            rels_name = f"ppt/slides/_rels/slide{index}.xml.rels"
            rels = ET.fromstring(archive.read(rels_name))
            image_rels = [
                rel.attrib["Target"]
                for rel in rels.findall("pr:Relationship", P_NS)
                if rel.attrib.get("Type", "").endswith("/image")
            ]
            assert len(image_rels) == 1, (rels_name, image_rels)
            media_path = posixpath.normpath(posixpath.join("ppt/slides", image_rels[0]))
            assert media_path in names, (slide_name, media_path)
            referenced_media.append(media_path)

            notes_root = ET.fromstring(archive.read(notes_names[index - 1]))
            text = " ".join(t.text or "" for t in notes_root.findall(".//a:t", P_NS)).strip()
            assert "Timing:" in text and "Checkpoint/question:" in text and "Transition:" in text, notes_names[index - 1]
            note_texts.append(text)
            checks.append({
                "slide": index,
                "pic": pic_count,
                "native_shapes": shape_count,
                "graphic_frames": graphic_frame_count,
                "connectors": connector_count,
                "full_slide_emu": [int(ext.attrib["cx"]), int(ext.attrib["cy"])],
                "media": media_path,
            })

        assert len(set(referenced_media)) == 18, "media files are not one-to-one with slides"
        for index, media_path in enumerate(referenced_media, 1):
            source_path = folder / "raster" / f"slide-{index:02d}.png"
            assert source_path.exists(), source_path
            assert sha256_bytes(archive.read(media_path)) == sha256_bytes(source_path.read_bytes()), (index, media_path)

    table = specs["approved_values"]["timestep_table"]
    assert table == [
        ["2.0", "0.2310", "0.042735", "31.62%", "12"],
        ["1.0", "0.1155", "0.052536", "15.94%", "24"],
        ["0.5", "0.0578", "0.057505", "7.99%", "48"],
        ["0.1", "0.0116", "0.061499", "1.60%", "240"],
    ]
    required_terms = ["T_half_h", "tMax_h", "lambda_per_h", "0.0625", "responsible AI", "Lab 01"]
    visual_source = json.dumps(specs, ensure_ascii=False)
    visual_source_lower = visual_source.lower()
    assert all(term.lower() in visual_source_lower for term in required_terms), required_terms

    return {
        "zip_integrity": "passed",
        "slides": len(slide_names),
        "notes": len(notes_names),
        "media": len(media_names),
        "one_full_slide_png_per_slide": True,
        "native_visible_objects": 0,
        "source_raster_hash_matches": True,
        "checks": checks,
        "notes_have_timing_checkpoint_transition": all(bool(t) for t in note_texts),
        "approved_values_and_terms": "passed",
    }


if __name__ == "__main__":
    root = Path(__file__).resolve().parent
    package_root = root.parents[1]
    deck = package_root / "Lecture_Slides_Week01.pptx"
    try:
        result = validate(deck, root)
    except Exception as exc:  # pragma: no cover - command-line failure report
        print(f"VALIDATION FAILED: {exc}", file=sys.stderr)
        raise
    print(json.dumps(result, indent=2))
