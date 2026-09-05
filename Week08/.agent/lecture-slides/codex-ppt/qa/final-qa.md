# Week 08 lecture deck final QA

- Final student-facing deck: `Week08/Lecture_Slides_Week08.pptx`
- Slides: 14 image-based 16:9 slides, each sourced from a 1672 × 941 RGB PNG.
- Presenter notes: 14 headings in `speech.md`; 14 non-empty notes parts embedded in the PPTX.
- Visual system: every slide retains the approved large navy title and thin navy horizontal divider immediately below it.
- Scientific checks: cooling model, initial condition, signs, Euler updates, MATLAB indices, exact reference, endpoint values, absolute errors, timestep comparison, defect repair, parameter interpretation, and physical bounds were reviewed at full size.
- Graph QA: slides 5, 9, 10, and 11 were compared with the retained MATLAB numerical evidence. The curves, points, axes, reference line, and endpoint/error relationships are consistent.
- Assembly: `assemble_ppt.py` completed with 14 slides and 14/14 notes.
- Render verification: LibreOffice export produced a 14-page PDF at 720 × 405.014 pt. The complete rendered contact sheet was inspected for order, clipping, consistency, and divider placement.
- Final SHA-256: `b62f5aa5c7a0c8c39c206c812ed0dd5748ec039c1e49cf318329cd10c2e3103f`.
- Worker provenance: see `qa/dispatch_ledger.md`, `slide_jobs.json`, and `slide_run_state.json`.
