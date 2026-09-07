#!/usr/bin/env python3
"""Add native dark-blue title rules to the existing Week 12 image deck.

The generated slide images remain unchanged. This is a reversible PPTX-only
patch: one vector connector is appended to each slide below the detected title
pixel bounds.
"""

from __future__ import annotations

import argparse
import json
from pathlib import Path

from PIL import Image
from pptx import Presentation
from pptx.dml.color import RGBColor
from pptx.enum.shapes import MSO_CONNECTOR
from pptx.util import Inches, Pt


NAVY = RGBColor(13, 43, 98)
TITLE_RULE_NAME = "Week12TitleRule"


def title_groups_px(image_path: Path) -> list[list[int]]:
    """Find dark-text row groups in the upper part of the source image."""
    image = Image.open(image_path).convert("RGB")
    rows: list[int] = []
    for y in range(min(230, image.height)):
        count = 0
        for x in range(image.width):
            r, g, b = image.getpixel((x, y))
            if max(r, g, b) < 220 and min(r, g, b) < 130:
                count += 1
        if count > 5:
            rows.append(y)
    if not rows:
        raise RuntimeError(f"Could not detect a title in {image_path}")
    groups: list[list[int]] = []
    for row in rows:
        if not groups or row > groups[-1][-1] + 1:
            groups.append([row])
        else:
            groups[-1].append(row)
    return groups


def line_position_px(image_path: Path) -> tuple[int, int]:
    """Return the title bottom and a collision-free rule row in source pixels."""
    groups = title_groups_px(image_path)
    title_bottom = groups[0][-1]
    line_px = title_bottom + 14
    # Some slides place a subtitle only a few pixels below the title. In that
    # case, keep the rule in the narrow gap immediately below the title.
    if len(groups) > 1 and groups[1][0] <= line_px + 4:
        line_px = title_bottom + 4
    return title_bottom, line_px


def add_title_rules(pptx_path: Path, source_dir: Path, report_path: Path) -> None:
    prs = Presentation(str(pptx_path))
    images = sorted(source_dir.glob("slide_*.png"))
    if len(images) != len(prs.slides):
        raise RuntimeError(f"Expected one source image per slide: {len(images)} images, {len(prs.slides)} slides")

    source_width, source_height = Image.open(images[0]).size
    px_per_in = source_width / (prs.slide_width / 914400)
    margin_left = Inches(0.35)
    margin_right = prs.slide_width - Inches(0.35)
    report: list[dict[str, object]] = []

    for number, (slide, image_path) in enumerate(zip(prs.slides, images), start=1):
        bottom_px, line_px = line_position_px(image_path)
        line_y = int(line_px * prs.slide_height / source_height)
        existing = [shape for shape in slide.shapes if shape.name == TITLE_RULE_NAME]
        if existing:
            rule = existing[0]
            rule.left = margin_left
            rule.top = line_y
            rule.width = margin_right - margin_left
            rule.height = 0
            status = "repositioned"
        else:
            rule = slide.shapes.add_connector(MSO_CONNECTOR.STRAIGHT, margin_left, line_y, margin_right, line_y)
            rule.name = TITLE_RULE_NAME
            status = "added"
        rule.line.color.rgb = NAVY
        rule.line.width = Pt(2.25)
        report.append(
            {
                "slide": number,
                "status": status,
                "title_bottom_px": bottom_px,
                "line_px": line_px,
                "line_y_inches": round(line_y / 914400, 4),
                "line_color": "#0D2B62",
                "line_width_pt": 2.25,
            }
        )

    prs.save(str(pptx_path))
    report_path.write_text(json.dumps({"pptx": str(pptx_path), "rules": report}, indent=2) + "\n", encoding="utf-8")


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("pptx", type=Path)
    parser.add_argument("source_dir", type=Path)
    parser.add_argument("report", type=Path)
    args = parser.parse_args()
    add_title_rules(args.pptx, args.source_dir, args.report)


if __name__ == "__main__":
    main()
