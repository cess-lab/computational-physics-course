# Week 06 generator evidence — round 1

## Result

- Canonical PPTX: `Week06/Lecture_Slides_Week06.pptx`
- SHA-256: `4c2d4970396399eacacb65f20f0305430036f599ab5cb65d7178151f2065fd8f`
- Slide count: 14
- Canvas contract: 18,288,000 × 10,287,000 EMU, 20 × 11.25 in, 16:9

## Build source and assets

- Builder: `editable-build/build_week06.mjs`
- Imported approved master: `.agent/lecture-slide-system/masters/PHY4605_Editable_Slide_Master.pptx`
- Display-equation source and SVG/PNG assets: `equations/`
- MATLAB evidence: `../matlab/assets/week06_forward_difference_geometry.png` and `../matlab/assets/week06_forward_error_vs_step.png`

## Commands and checks

- Rendered all TeX assets with `render-equations-diagrams/scripts/render.mjs equation` at PNG scale 6.
- Built and finalized with the bundled Presentation runtime and `RUNTIME_NODE_MODULES` supplied for the Artifact Tool self-import check.
- Artifact Tool finalizer: passed 14-slide count, package integrity, layout, 20 × 11.25 in master geometry, editable object inspection, first-party import, and design font policy (`Nunito`, `IBM Plex Mono`).
- `officecli validate Week06/Lecture_Slides_Week06.pptx --json`: passed.
- Rendered 14 PNG slides at 1920 × 1080 under `editable-build/artifact-renders/`, with per-slide layout records and `artifact-deck-montage.webp`.
- Individually inspected slides 01–14 from the 1920 × 1080 render evidence.

## Known risks

- The deck was structurally and render-validated locally. No manual Microsoft PowerPoint editing session was performed.
