from pathlib import Path

from PIL import Image, ImageDraw, ImageFont


root = Path(__file__).resolve().parent / "rendered-canonical-final"
paths = [root / f"slide-{i}.png" for i in range(1, 15)]
thumb_width = 900
crop_height = 520
gap_x = 24
gap_y = 18
label_height = 28
border = 1

font = ImageFont.load_default()
tiles = []
for index, path in enumerate(paths, start=1):
    image = Image.open(path).convert("RGB")
    crop = image.crop((0, 0, image.width, min(crop_height, image.height)))
    thumb_height = round(crop.height * thumb_width / crop.width)
    crop = crop.resize((thumb_width, thumb_height), Image.Resampling.LANCZOS)
    tile = Image.new("RGB", (thumb_width, thumb_height + label_height), "white")
    tile.paste(crop, (0, 0))
    draw = ImageDraw.Draw(tile)
    draw.rectangle((0, 0, thumb_width - 1, thumb_height - 1), outline="#D9E2EC", width=border)
    draw.text((10, thumb_height + 7), f"Slide {index:02d}", fill="#0B2B4C", font=font)
    tiles.append(tile)

cols = 2
rows = (len(tiles) + cols - 1) // cols
tile_width = thumb_width
tile_height = tiles[0].height
sheet = Image.new(
    "RGB",
    (cols * tile_width + (cols - 1) * gap_x, rows * tile_height + (rows - 1) * gap_y),
    "#F7FAFC",
)
for index, tile in enumerate(tiles):
    x = (index % cols) * (tile_width + gap_x)
    y = (index // cols) * (tile_height + gap_y)
    sheet.paste(tile, (x, y))

output = Path(__file__).resolve().parent / "title-region-contact-sheet.png"
sheet.save(output, optimize=True)
print(output)
