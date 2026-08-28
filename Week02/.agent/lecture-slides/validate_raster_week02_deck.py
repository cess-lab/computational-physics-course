#!/usr/bin/env python3
"""Validate the raster-only structure and speaker-note contract of Week 2."""

from __future__ import annotations

import hashlib
import json
import posixpath
import sys
import zipfile
from pathlib import Path
import xml.etree.ElementTree as ET


NS = {
    "p": "http://schemas.openxmlformats.org/presentationml/2006/main",
    "a": "http://schemas.openxmlformats.org/drawingml/2006/main",
    "pr": "http://schemas.openxmlformats.org/package/2006/relationships",
}


def natural_key(name: str) -> tuple[int, str]:
    digits = "".join(ch for ch in Path(name).stem if ch.isdigit())
    return (int(digits or 0), name)


def digest(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def validate(deck_path: Path, folder: Path) -> dict:
    specs = json.loads((folder / "slide_specs.json").read_text(encoding="utf-8"))
    assert specs["deck"]["slide_count"] == len(specs["slides"]) == 18
    assert specs["deck"]["duration_minutes"] == 120
    canvas = specs["deck"]["canvas"].lower()
    assert "pure white" in canvas and "no outer border" in canvas and "no mesh" in canvas
    assert "locked roboto condensed bold" in canvas

    with zipfile.ZipFile(deck_path) as archive:
        assert archive.testzip() is None
        names = set(archive.namelist())
        slide_names = sorted(
            (n for n in names if n.startswith("ppt/slides/slide") and n.endswith(".xml")),
            key=natural_key,
        )
        note_names = sorted(
            (n for n in names if n.startswith("ppt/notesSlides/notesSlide") and n.endswith(".xml")),
            key=natural_key,
        )
        media_names = sorted(n for n in names if n.startswith("ppt/media/") and not n.endswith("/"))
        assert len(slide_names) == len(note_names) == len(media_names) == 18
        assert all(n.lower().endswith(".png") for n in media_names)

        presentation = ET.fromstring(archive.read("ppt/presentation.xml"))
        slide_size = presentation.find("p:sldSz", NS)
        assert slide_size is not None
        expected = (int(slide_size.attrib["cx"]), int(slide_size.attrib["cy"]))
        assert expected == (12192000, 6858000)

        referenced_media = []
        for index, slide_name in enumerate(slide_names, 1):
            root = ET.fromstring(archive.read(slide_name))
            assert len(root.findall(".//p:pic", NS)) == 1
            assert len(root.findall(".//p:sp", NS)) == 0
            assert len(root.findall(".//p:graphicFrame", NS)) == 0
            assert len(root.findall(".//p:cxnSp", NS)) == 0
            assert len(root.findall(".//p:grpSp", NS)) == 0
            xfrm = root.find(".//p:pic//a:xfrm", NS)
            assert xfrm is not None
            off = xfrm.find("a:off", NS)
            ext = xfrm.find("a:ext", NS)
            assert off is not None and ext is not None
            assert (int(off.attrib["x"]), int(off.attrib["y"])) == (0, 0)
            assert (int(ext.attrib["cx"]), int(ext.attrib["cy"])) == expected

            rels = ET.fromstring(archive.read(f"ppt/slides/_rels/slide{index}.xml.rels"))
            targets = [
                rel.attrib["Target"]
                for rel in rels.findall("pr:Relationship", NS)
                if rel.attrib.get("Type", "").endswith("/image")
            ]
            assert len(targets) == 1
            media_path = posixpath.normpath(posixpath.join("ppt/slides", targets[0]))
            assert media_path in names
            referenced_media.append(media_path)

            note_root = ET.fromstring(archive.read(note_names[index - 1]))
            note_text = " ".join(t.text or "" for t in note_root.findall(".//a:t", NS))
            assert "Timing:" in note_text
            assert "Checkpoint/question:" in note_text
            assert "Transition:" in note_text

        assert len(set(referenced_media)) == 18
        for index, media_path in enumerate(referenced_media, 1):
            source = folder / "raster" / f"slide-{index:02d}.png"
            assert digest(archive.read(media_path)) == digest(source.read_bytes())

    source_text = json.dumps(specs, ensure_ascii=False).lower()
    required = [
        "springconstant_n_per_m",
        "0.0576 j",
        "wrong velocity sign",
        "one passing test",
        "responsible",
        "projectile",
    ]
    assert all(term in source_text for term in required)
    return {
        "zip_integrity": "passed",
        "slides": 18,
        "notes": 18,
        "media": 18,
        "one_full_slide_png_per_slide": True,
        "native_visible_objects": 0,
        "source_raster_hash_matches": True,
        "approved_values_and_terms": "passed",
    }


if __name__ == "__main__":
    root = Path(__file__).resolve().parent
    deck = root.parents[1] / "Lecture_Slides_Week02.pptx"
    try:
        result = validate(deck, root)
    except Exception as exc:
        print(f"VALIDATION FAILED: {exc}", file=sys.stderr)
        raise
    print(json.dumps(result, indent=2))
