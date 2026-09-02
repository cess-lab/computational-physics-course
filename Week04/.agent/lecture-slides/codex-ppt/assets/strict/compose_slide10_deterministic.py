"""Compose the approved deterministic Slide 10 fallback.

The numerical chart is the MATLAB-generated strict source.  This small
composition step only places that source chart into the already approved
slide layout and restores the Week 3 header geometry after the image backend
could not preserve the strict chart.
"""

from pathlib import Path
import argparse
import textwrap

from PIL import Image, ImageDraw, ImageFont


ROOT = Path(__file__).resolve().parents[2]
BASE = ROOT / "origin_image" / "slide_10.png"
STRICT_PLOT = Path(__file__).resolve().parent / "week04_hooke_parameter_sweep_F5_markers.png"
DEFAULT_OUTPUT = ROOT / "qa" / "deterministic-fallback-revision9" / "slide_10.png"

NAVY = (10, 31, 82)
GREEN = (28, 91, 44)
PALE_GREEN = (250, 254, 250)
BLACK = (20, 20, 20)
WHITE = (255, 255, 255)


def font(path: str, size: int) -> ImageFont.FreeTypeFont:
    return ImageFont.truetype(path, size)


ARIAL = "/System/Library/Fonts/Supplemental/Arial.ttf"
ARIAL_BOLD = "/System/Library/Fonts/Supplemental/Arial Bold.ttf"
AVENIR_NEXT = "/System/Library/Fonts/Avenir Next.ttc"


def wrapped_lines(draw: ImageDraw.ImageDraw, value: str, face: ImageFont.FreeTypeFont, width: int) -> list[str]:
    words = value.split()
    lines: list[str] = []
    current = ""
    for word in words:
        candidate = f"{current} {word}".strip()
        if current and draw.textlength(candidate, font=face) > width:
            lines.append(current)
            current = word
        else:
            current = candidate
    if current:
        lines.append(current)
    return lines


def arrow(draw: ImageDraw.ImageDraw, start: tuple[int, int], end: tuple[int, int], fill=GREEN, width=3) -> None:
    draw.line([start, end], fill=fill, width=width)
    x0, y0 = start
    x1, y1 = end
    dx, dy = x1 - x0, y1 - y0
    length = max((dx * dx + dy * dy) ** 0.5, 1.0)
    ux, uy = dx / length, dy / length
    px, py = -uy, ux
    size = 11
    left = (int(x1 - size * ux + size * 0.65 * px), int(y1 - size * uy + size * 0.65 * py))
    right = (int(x1 - size * ux - size * 0.65 * px), int(y1 - size * uy - size * 0.65 * py))
    draw.polygon([(x1, y1), left, right], fill=fill)


def callout(
    draw: ImageDraw.ImageDraw,
    box: tuple[int, int, int, int],
    heading: str,
    body: str,
    arrow_start: tuple[int, int] | None = None,
    arrow_end: tuple[int, int] | None = None,
) -> None:
    x0, y0, x1, y1 = box
    draw.rounded_rectangle(box, radius=12, fill=PALE_GREEN, outline=GREEN, width=2)
    heading_face = font(ARIAL_BOLD, 22)
    body_face = font(ARIAL, 20)
    draw.text((x0 + 16, y0 + 12), heading, font=heading_face, fill=GREEN)
    body_lines = wrapped_lines(draw, body, body_face, x1 - x0 - 30)
    body_y = y0 + 43
    for line in body_lines:
        draw.text((x0 + 16, body_y), line, font=body_face, fill=BLACK)
        body_y += 27
    if arrow_start and arrow_end:
        arrow(draw, arrow_start, arrow_end)


def compose(output: Path) -> None:
    base = Image.open(BASE).convert("RGB")
    strict = Image.open(STRICT_PLOT).convert("RGB")
    if base.size != (1672, 941):
        raise ValueError(f"Unexpected Slide 10 base size: {base.size}")

    canvas = base.copy()
    draw = ImageDraw.Draw(canvas)

    # Match the approved Week 3 header: same top clearance, title scale, and
    # left-to-right separator position as Slide 09.
    draw.rectangle((0, 0, canvas.width, 125), fill=WHITE)
    title_face = font(AVENIR_NEXT, 76)
    draw.text((33, 9), "The graph is a physics statement", font=title_face, fill=NAVY)
    draw.rectangle((29, 118, 1639, 119), fill=NAVY)

    # Replace only the right-hand image-generated chart region.  The strict
    # MATLAB export matches the source plot canvas; the same affine resize is
    # applied to every curve and every marker, so F = 5 N remains exactly on
    # each x = F/k curve.
    chart_x, chart_y = 667, 126
    chart_w, chart_h = 970, 650
    strict_crop = strict.resize((chart_w, chart_h), Image.Resampling.LANCZOS)
    # Clear the old chart's labels as well as its plotting area; the bullet
    # column ends well before this x-position.
    draw.rectangle((530, 124, 1642, 780), fill=WHITE)
    canvas.paste(strict_crop, (chart_x, chart_y))
    draw = ImageDraw.Draw(canvas)

    # Coordinates below are in the final slide raster.  They are deliberately
    # offset from the strict marker centres so the explanatory labels do not
    # cover the data points.
    callout(
        draw,
        (720, 300, 1052, 397),
        "Lower k → larger slope",
        "and larger x at the same F.",
        arrow_start=(1035, 394),
        arrow_end=(1085, 495),
    )
    callout(
        draw,
        (1280, 179, 1450, 234),
        "Slope = 1/k",
        "",
        arrow_start=(1378, 233),
        arrow_end=(1470, 250),
    )
    callout(
        draw,
        (1194, 496, 1485, 577),
        "Same input (F = 5 N)",
        "compared across cases.",
        arrow_start=(1194, 535),
        arrow_end=(1177, 583),
    )

    output.parent.mkdir(parents=True, exist_ok=True)
    canvas.save(output, format="PNG", optimize=True)


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--output", type=Path, default=DEFAULT_OUTPUT)
    args = parser.parse_args()
    compose(args.output)
    print(args.output)


if __name__ == "__main__":
    main()
