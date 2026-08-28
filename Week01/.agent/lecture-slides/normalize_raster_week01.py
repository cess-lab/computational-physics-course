#!/usr/bin/env python3
"""Normalize ImageGen slide rasters without adding visible slide content.

The source images are complete ImageGen slides. This helper only removes the
generator's near-white canvas tint, preserves aspect ratio while fitting the
image inside a 1920x1080 white canvas, and adds a quiet left/top safe margin so
the locked title anchor is approximately 6% / 5.5% for the course master.
"""

from __future__ import annotations

import argparse
from pathlib import Path

import numpy as np
from PIL import Image


TARGET_W = 1920
TARGET_H = 1080
CONTENT_W = 1870
CONTENT_H = 1052
LEFT_PAD = 50
TOP_PAD = 14
TITLE_X = 110
TITLE_Y = 60


def flatten_near_white(image: Image.Image) -> Image.Image:
    """Make the generated canvas genuinely white without flattening ink."""

    rgb = image.convert("RGB")
    pixels = rgb.load()
    for y in range(rgb.height):
        for x in range(rgb.width):
            r, g, b = pixels[x, y]
            # Keep pale coloured cards, but remove the generator's neutral
            # 250–255 canvas haze and compression flecks.
            if min(r, g, b) >= 250 and max(r, g, b) - min(r, g, b) <= 3:
                pixels[x, y] = (255, 255, 255)
    return rgb


def align_title_anchor(image: Image.Image) -> Image.Image:
    """Translate the generated raster so the title band shares one anchor."""

    array = np.asarray(image.convert("RGB"))
    title_band = array[20:180]
    title_mask = (
        (title_band[:, :, 0] < 120)
        & (title_band[:, :, 1] < 135)
        & (title_band[:, :, 2] < 175)
    )
    title_y, title_x = np.where(title_mask)
    if title_x.size == 0:
        return image

    delta_x = TITLE_X - int(title_x.min())
    delta_y = TITLE_Y - int(title_y.min() + 20)
    # Keep the entire generated slide visible if a long title or a card sits
    # near an edge. The target is approximate by design, while crop safety is
    # non-negotiable.
    all_mask = np.any(array < 230, axis=2)
    all_y, all_x = np.where(all_mask)
    if all_x.size:
        delta_x = max(-int(all_x.min()), min(int(image.width - 1 - all_x.max()), delta_x))
    if all_y.size:
        delta_y = max(-int(all_y.min()), min(int(image.height - 1 - all_y.max()), delta_y))
    if delta_x == 0 and delta_y == 0:
        return image

    aligned = Image.new("RGB", image.size, (255, 255, 255))
    aligned.paste(image, (delta_x, delta_y))
    return aligned


def normalize(source: Path, destination: Path) -> None:
    image = flatten_near_white(Image.open(source))
    fitted = image.resize((CONTENT_W, CONTENT_H), Image.Resampling.LANCZOS)
    canvas = Image.new("RGB", (TARGET_W, TARGET_H), (255, 255, 255))
    canvas.paste(fitted, (LEFT_PAD, TOP_PAD))
    canvas = align_title_anchor(canvas)
    destination.parent.mkdir(parents=True, exist_ok=True)
    canvas.save(destination, format="PNG", optimize=True)


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("source_dir", type=Path)
    parser.add_argument("destination_dir", type=Path)
    args = parser.parse_args()
    for index in range(1, 19):
        source = args.source_dir / f"slide-{index:02d}.png"
        destination = args.destination_dir / source.name
        if not source.exists():
            raise FileNotFoundError(source)
        normalize(source, destination)


if __name__ == "__main__":
    main()
