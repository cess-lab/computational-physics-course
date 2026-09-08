# Week 03 lecture-deck diff-comment revision record — 2026-09-08

## User comments addressed

1. Slide 03 now uses one circuit anchor only. The left- and right-loop explanations are separate text lanes around that single circuit, so the same loop drawing is not repeated.
2. Slide 06 now uses one explicit colour map throughout the matrix audit: blue for `A11`/`A22`, ochre for `A12`, and sage for `A21`. The cell fill, coefficient value, connector, and physical-origin row use the same mapping.
3. Slide 12, and the matching bridge activity on Slide 13, now use the corrected bridge asset. The diagonal `Rb` follows the diagonal branch, the source polarity is marked, and the clockwise `I1`, `I2`, and `I3` arrows sit inside their actual mesh faces.

## Specialist review

- Reviewer: Sol specialist, agent `01a08115-08dd-7f32-91cc-41172ef8649a` (`gpt-5.6-sol`, `medium` reasoning), explicitly requested for the bridge-circuit correction.
- Topology advice applied: `R7` couples meshes 1–2; diagonal `Rb` couples meshes 2–3; meshes 1 and 3 share no branch, so the eventual 3×3 system has no direct 1–3 coupling.
- Notation advice applied: use `I1`, `I2`, `I3` for continuity with the two-loop lecture notation; label the symbolic block as a coefficient matrix and write the unknown vector as `[I1,I2,I3]^T`.
- Geometry advice applied: rotate the centre resistor about `36.9°` clockwise so it follows the diagonal branch, and keep every mesh arrow within its face.

## Strict asset correction

- Source updated: `assets/strict/bridge_mesh_model.tex`.
- Source updated: `assets/strict/bridge_matrix_scaffold.tex`.
- Recompiled strict PNGs: `assets/strict/bridge_mesh_model.png` and `assets/strict/bridge_matrix_scaffold.png`.
- The corrected strict assets were passed as inputs to the Slide 12 and Slide 13 built-in image generations.

## Revision generation evidence

- Revision specification: `deck_spec.json`.
- Revision prompt jobs and results: `slide_jobs.json`.
- Revision state: `slide_run_state.json`, status `slides_recorded`.
- Backend: built-in image tool / `image_gen`, edit mode, using the approved Slide 02 Teaching Courseware sample as the style reference.
- Four revision jobs were dispatched and recorded: Slides 03, 06, 12, and 13. Each result records its worker ID, prompt path and SHA-256, selected source and SHA-256, backend match, and QA note.
- Worker IDs: Slide 03 `01a08123-2ca3-7560-a33d-14423d1ceef4`; Slide 06 `01a08123-2de2-7532-9360-b72243985dc7`; Slide 12 `01a08123-2d2d-7c52-8d80-95a86081b56b`; Slide 13 `01a08123-2eda-73c3-a13c-696b686d8044`.
- No new sample gate was needed for this comment pass: the previously approved Slide 02 style reference was reused, while the four affected slides were regenerated and visually inspected.

## Final assembly and QA

- The four recorded revision images replaced the corresponding canonical `origin_image` files before assembly.
- Final student-facing artifact: `/Users/khairuladib/MATLAB-Drive/Kuliah/computational-physics-course/Week03/Lecture_Slides_Week03.pptx`.
- Final hidden canonical artifact: `/Users/khairuladib/MATLAB-Drive/Kuliah/computational-physics-course/Week03/.agent/lecture-slides/codex-ppt/Lecture_Slides_Week03.pptx`.
- Full-size visual inspection passed for revised Slides 03, 06, 12, and 13.
- `unzip -t` passed.
- `officecli validate` passed.
- OpenXML inspection passed: 15 slide XML files, 15 notes pages, 15 media images, one full-slide picture per slide, non-empty notes, and 9144000 × 5143500 EMU (16:9).
- All 15 canonical origin images remain 1672 × 941.
- The three assembled PPTX copies have the same SHA-256 after final assembly; the final hash is recorded in `qa/delivery_record.md`.

## Scope

The learning note, MATLAB Live Script, and practical remain unchanged. Existing uncommitted Week 03 work was preserved.

## Follow-up arrow correction

- Follow-up user comment: Slide 06 arrows were still judged incorrect and semantically unclear.
- Sol-medium diagnosis: the original green `A21` path visibly began on the `A22` edge and merged with the blue `A22` anchor. The required fix was four independent entry-to-row mappings, each with its own source dot and arrowhead.
- First follow-up render was rejected during parent QA because it leaked an internal production instruction into the footer and added an unnecessary duplicate equation list. It was not recorded into the canonical deck.
- Final retry packet: `slide06-arrow-fix-v2/deck_spec.json`, `slide06-arrow-fix-v2/prompts/slide_06.json`, `slide06-arrow-fix-v2/slide_jobs.json`, and `slide06-arrow-fix-v2/slide_run_state.json`.
- Final retry worker: `01a0813d-27da-7132-af54-aa066d79def9` (`gpt-5.6-luna` / inherited `max`), built-in image tool edit mode. Its recorded image SHA-256 is `19ee73132843840eee4b092e130ab15f5420531403e9985543d3119d1974a84b`.
- Final Slide 06 inspection confirms: `A11→row 1`, `A12→row 2`, `A21→row 3`, and `A22→row 4`; target dots sit beside the matching `Entry` labels; no shared segments, crossings, or ambiguous junctions; original student-facing footer preserved.
- The final deck was reassembled after this retry. Final SHA-256: `b3237f7a3218bf2f4e76de460a935d94551b9c1286f1c83f0bd9e68b90e28ca9`.
