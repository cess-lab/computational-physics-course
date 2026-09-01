# Week 01 Validation Record

Validated on 28 August 2026 using MATLAB R2026b Prerelease Update 3 and the bundled presentation/PDF runtimes.

## Plain-text Live Script source

- `Week01_Lecture_Demonstration_Model_to_Computation.m`: instructor-led worked demonstration with no student `TODO`, submission field, or laptop dependency during the lecture. A new MATLAB batch process completed with `LECTURE_FRESH_SESSION_OK`; all decay assertions passed.
- `Week01_Practical_Onramp_Diagnostic.m`: group practical begins with the course-wide individual Google Form and does not duplicate its individual questions. A separate MATLAB batch process completed with `PRACTICAL_FRESH_SESSION_OK`; all cooling assertions passed.
- Each file contains exactly one blank line, immediately before its `%[appendix]` block.
- Neither file uses `clear`, `clearvars`, `close all`, `clc`, explicit `figure`, or `fprintf`.
- MATLAB Code Analyzer reported only intentional missing-semicolon information messages where Live Editor output is meant to remain visible; it reported no warnings or errors.
- No student-facing `.mlx` file remains in `Week01/`.

## Individual Google Form

- Reused the existing canonical form rather than creating a duplicate: form ID `16-g-BvSQNx-U-VcAm5UiLimAa6Jz_Jsl0O9H7TRcOww`.
- Verified 23 items: shared full name, matric number, and required Week 01–14 dropdown; 14 existing page-break sections; and six required Week 1 diagnostic questions.
- Verified every dropdown option still routes to its original weekly section ID.
- Week 1 includes physical prediction, units/scaling, array reasoning, numerical behaviour, a short validation response, and a fixed 1–5 confidence item.
- Confirmed that the form had no responses before its structure was revised.
- Stored the canonical URLs, item IDs, question IDs, section IDs, update policy, answer key, misconception tags, and anonymised AI-analysis prompt under the course-level `.agent/google-forms/` directory.

## Baseline numerical evidence

- Decay lecture: final Forward Euler relative errors for `dt = [2, 1, 0.5, 0.1] h` were approximately `[31.624, 15.942, 7.992, 1.601]%`.
- Cooling diagnostic: first stored time within `1 degC` was `52 min`; analytical final temperature was approximately `22.477 degC`; Euler final temperature was approximately `22.310 degC`; maximum grid difference was approximately `1.833 degC`.

## Lecture deck

- Rebuilt `Lecture_Slides_Week01.pptx` from 18 full-slide raster sources.
- ZIP integrity, slide count, speaker-note count, one-image-per-slide contract, full-canvas placement, and source-raster hashes passed.
- Rendered the rebuilt deck to an 18-page, 16:9 PDF using LibreOffice.
- Visually inspected rendered slides 2, 6, and 18 after revision; text was legible, uncropped, and consistent with the revised Week 1 practical.
- Recreated all 18 raster slides using the PHY4605 borderless-white visual system: no outer slide frame, corner ornament, mesh/network motif, texture, gradient, watermark, or decorative background.
- Standardised the title band across the deck using the same navy condensed-bold sans-serif treatment, upper-left anchor, sentence case, and charcoal subtitle treatment; the opening slide retains only the approved larger-size exception.
- Pixel-level perimeter inspection found zero dark pixels on the outermost raster edges of every slide.
- Rebuilt and rendered the final borderless PPTX, then visually inspected the complete 18-slide rendered contact sheet for title consistency, crop safety, background cleanliness, and scientific reading order.

## Learning note

- Recompiled `Week01_Model_to_Computation.pdf` from the hidden LaTeX source as a six-page A4 note.
- Removed the retired gallons/pints warm-up and replaced it with the Newton-cooling Onramp bridge.
- Corrected the plotted analytical quantity to `N_exact/N0`, aligned the AI decision record and practical handoff with the current package, and removed stale `clearvars`/`close all` guidance.
- Rendered and visually inspected all six pages; no clipping, overlap, broken table, or unreadable glyph was found.
