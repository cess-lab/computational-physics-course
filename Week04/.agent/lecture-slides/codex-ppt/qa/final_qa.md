# Week 04 Lecture Deck Final QA

**Status:** PASS

**Assembly:** The Codex-PPT assembler created the hidden canonical deck from 15 final `origin_image/slide_XX.png` files and wrote English presenter notes from `speech.md`.

**Student-facing deck:** `/Users/khairuladib/MATLAB-Drive/Kuliah/computational-physics-course/Week04/Lecture_Slides_Week04.pptx`

**Canonical hidden deck:** `/Users/khairuladib/MATLAB-Drive/Kuliah/computational-physics-course/Week04/.agent/lecture-slides/codex-ppt/codex-ppt.pptx`

**Artifact integrity:** Both deck copies have SHA-256 `5b7bf09a1c44eef19f21223aa1a9391095e4f5541dbcff90fa903876de87e955`.

**Structural checks:**

- 15 slides present; no numeric slide gap.
- Every final raster is 1672 x 941 pixels (16:9).
- PowerPoint dimensions are 10.0 x 5.625 inches (16:9).
- 15 speaker-note XML parts are present; `python-pptx` reports non-empty notes for 15/15 slides.
- Each slide contains one full-slide raster image, as required by the image-based deck contract.

**Rendered checks:** The assembled PPTX was rendered with LibreOffice to `qa/rendered-pptx-revision10/codex-ppt.pdf`; `pdfinfo` reports 15 pages at 720 x 405.014 points. Slide 10 was re-inspected at full page resolution: the graph, graph labels, direct leader-line annotations, title, bullets, equation, and interpretation strip are one cohesive ImageGen canvas; the blue, orange, and ochre F = 5 N markers are centred on their corresponding curves. Titles are readable, separators extend nearly across the content width, and no clipping, frame, slide number, or watermark was observed.

**Content checks:** Hooke's-law equations, units, MATLAB variable names, strict code assets, strict numerical plot/table assets, zero-force limiting-case check, wrong-model diagnosis, repaired Slide 13 comparison at `F = 10 N`, and transfer contexts were visually checked against the locked Week 04 source specification. The Week 04 capstone markdown file was not used as a content reference.

**Revision checks:** Slide 1 is intentionally sparse; Slide 5 removes the upper checklist, uses the reclaimed vertical space for the expanded algorithm/control layout, and contains no downward arrows between numbered rows; Slide 8 now uses one clean, symmetric, uniformly stroked rounded rectangle around the baseline row; Slides 12 and 13 split diagnosis from repair/recheck; Slide 2 shows k = 50 N/m as the longest spring, k = 100 N/m as intermediate, and k = 200 N/m as shortest; Slide 10 was regenerated as one full ImageGen canvas using the MATLAB graph as a numerical reference, with integrated direct labels instead of the previous chart-plus-box composition, and its F = 5 N markers are at x = 0.10 m, 0.05 m, and 0.025 m on their corresponding curves; the former Slides 13 and 14 are carried forward as Slides 14 and 15.

**Worker method:** Revised slides 1, 5, 12, 13, 2, and 8 were generated one per native worker, with `fork_context: true`, omitted model/reasoning overrides, and the built-in `image_gen` edit backend. Slide 10 was then regenerated as a complete single-canvas built-in ImageGen output using the MATLAB plot as a reference, after the user requested removal of the previous chart-plus-box composition. Unchanged slides were carried forward from the previously inspected approved deck and recorded through the state scripts. Worker dispatch and result evidence are in `qa/worker_dispatch_ledger.md` and `slide_jobs.json`.
