# Week 01 targeted slide regeneration — 2026-09-02

## Scope

Regenerated only slides 10 and 13 in the published image-based Teaching Courseware deck, following the lecturer's artifact comments.

## Changes

- **Slide 10 — Compare the prediction with the plotted evidence:** replaced the strict MATLAB plot and ambiguous long leader lines with a complete built-in image-tool illustration. The new slide uses a qualitative height-versus-time curve, local labels at the launch, maximum, and return regions, and no invented numerical axes or values.
- **Slide 13 — Week 1 exit ticket:** replaced the text-only vertical list with four compact two-by-two response cards. Each card has a small labelled conceptual icon (`OUTPUT`, `INDEX`, `OPERATOR`, or `VALIDATE`) while preserving the approved questions and restrained palette.

## Production provenance

- Backend: built-in image tool (`image_gen`), parent-owned targeted regeneration.
- Style reference: approved `origin_image/slide_02.png` only for palette, typography hierarchy, and visual identity.
- Candidate images:
  - `slide_10-revision-candidate.png` — SHA-256 `ff1791924759971694e28357d110e8bfce7ed927fa9ff311706b1dec24e1376f`
  - `slide_13-revision-candidate.png` — SHA-256 `37bcc9b6972c7afd0b3d6f6550f15c96f23a74ad9c7d85fb1dc6ec25ab5aae7e`
- Final images were copied into `../../origin_image/` and the slide state was updated with the repair provenance.

## QA

- Reassembled PPTX: 13 slides, 13 embedded English notes, 16:9 dimensions.
- Structural check: every slide contains exactly one full-slide picture and no editable shape text.
- Rendered QA PDF: `../rendered-repair-2026-09-02/Lecture_Slides_Week01.pdf`.
- Full-size rendered checks completed for slides 10 and 13.
- Previous published PPTX preserved at `../../../retired-codex-ppt-run-2026-09-01/Lecture_Slides_Week01-before-slide10-13-repair.pptx`.
