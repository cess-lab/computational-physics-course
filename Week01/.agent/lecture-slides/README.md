# PHY4605 Week 1 lecture package

## Teaching purpose

This folder is the self-contained Week 1 package for the approved 120-minute teaching context:

`physical question → MATLAB fundamentals → radioactive-decay model → exact reference → Euler time stepping → timestep experiment → error/convergence → validation/reproducibility → practical bridge`

The final deck contains 18 slides. Its visible content is raster-only: every slide is one complete fresh ImageGen visual. The 18 project raster assets are normalized to exact 16:9 PNG files at `1920×1080`; normalization changes only pixel dimensions and adds no visible content.

The user explicitly overrode the no-branding rule for this deck. Branding and software logos are therefore permitted in generated slide images. The one-full-slide-raster rule, scientific accuracy requirements, and no-native-overlay rule remain mandatory.

The older top-level PNGs in this folder are preserved existing assets for context only. They are not embedded in the final PPTX. Slide 2 is the fresh ImageGen-generated overview with the 120-minute teaching context.

## Contents

- `Week01/Lecture_Slides_Week01.pptx` — final 18-slide raster-only deck with speaker notes on every slide.
- `raster/slide-01.png` … `raster/slide-18.png` — normalized fresh full-slide raster sources used by the PPTX.
- `raster_gen_v5/` and `raster_v5/` — ImageGen outputs and normalized v5 build inputs retained for traceability.
- `normalize_raster_week01.py` — deterministic post-processing that fits ImageGen outputs to the locked 1920×1080 white canvas and title anchor without adding visible content.
- `slide_specs.json` — slide content, approved numerical values, archetypes, and speaker-note metadata.
- `build_raster_week01_deck.js` — deterministic PPTX builder; it adds one full-slide image and non-visible notes per slide.
- `validate_raster_week01_deck.py` — ZIP/XML validator for slide count, notes, image geometry, native-object absence, source-image hashes, and required terms.
- `legacy-copies/` — byte-identical copies of the source and approved artefacts retained for traceability.
- `rendered_raster_v5/` — final headless PDF/PNG render, title contact sheet, full contact sheet, and structural validation evidence used for visual QA.

## Rebuild the PPTX

Run from the course root with the bundled Node runtime and `pptxgenjs` dependency:

```bash
NODE_PATH=/Users/khairuladib/.cache/codex-runtimes/codex-primary-runtime/dependencies/node/node_modules \
  /Users/khairuladib/.cache/codex-runtimes/codex-primary-runtime/dependencies/node/bin/node \
  "Week01/.agent/lecture-slides/build_raster_week01_deck.js"
```

The builder reads `slide_specs.json` and `raster/slide-01.png` through `raster/slide-18.png`, then writes the final deck to `Week01/Lecture_Slides_Week01.pptx`. Image generation itself was performed with the required `scientific-educational-image-slides` and ImageGen workflows; the checked raster files are the stable rebuild inputs.

## Render and inspect

The final render was produced with:

```bash
mkdir -p "Week01/.agent/lecture-slides/rendered_raster_v5"
/Users/khairuladib/.cache/codex-runtimes/codex-primary-runtime/dependencies/bin/override/soffice \
  --headless --convert-to pdf \
  --outdir "Week01/.agent/lecture-slides/rendered_raster_v5" \
  "Week01/Lecture_Slides_Week01.pptx"
/opt/homebrew/bin/pdftoppm -png -r 144 \
  "Week01/.agent/lecture-slides/rendered_raster_v5/Lecture_Slides_Week01.pdf" \
  "Week01/.agent/lecture-slides/rendered_raster_v5/slide"
```

`rendered_raster_v5/Lecture_Slides_Week01.pdf` has 18 pages at 960.009 × 540 pt (16:9). The title contact sheet, full contact sheet, and full-size checks cover all slides; checks included the title/overview, code slides, Lab 01 conversion, parameter map, loop, convergence table, responsible-AI, and recap slides.

## Validation record

Run:

```bash
/Users/khairuladib/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/bin/python3 \
  "Week01/.agent/lecture-slides/validate_raster_week01_deck.py"
```

The final run passed:

- ZIP integrity; 18 slide XML files; 18 speaker-note XML files; 18 PNG media files.
- Exactly one `p:pic` per slide; zero native `p:sp`, `p:graphicFrame`, `p:cxnSp`, or `p:grpSp` visible objects.
- Every image is positioned at `(0, 0)` with exact wide-slide extent `12192000 × 6858000` EMU.
- Every embedded image SHA-256 matches its corresponding `raster/slide-XX.png` source.
- Every slide has timing, checkpoint/question, and transition speaker notes.
- Approved values and required terms are present in `slide_specs.json`, including `T_half_h = 6.0 h`, `tMax_h = 24 h`, `lambda_per_h ≈ 0.1155 1/h`, exact `N/N0 = 0.0625`, and the locked timestep table.

The approved Live Script was also run from a fresh MATLAB R2026b batch session using the final package copy. MATLAB reported the expected decay values, the four timestep rows, `Validation checks passed for the chosen parameters.`, and the stability warning for `dt = 10.0 h`.

The four approved artifacts were checked with `cmp` and SHA-256 against their originals. All four pairs were identical.

No deployment, publication, commit, push, pull request, external message, or worktree was performed.
