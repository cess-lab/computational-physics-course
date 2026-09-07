# Week 10 Production Record

Request: prepare Week 10 course materials except the lecture slide deck; prepare only the lecture-deck outline, 2026-09-05.

## Completed package

- Student README describing scope, locked model, execution, practical evidence, and AI-use expectations.
- Five-page A4 learning note on random sampling and Monte Carlo simulation, with hidden LaTeX source and rendered QA.
- Complete lecturer-led plain-text Live Script using a locked one-dimensional symmetric random walk.
- AI-enabled ten-challenge group practical across photon detection, radiation shielding, and a two-dimensional random walk.
- Hidden practical reference, diagnostic draft, A/B variant bank, defence rubric, event ledger, and member summary.
- Fourteen-slide lecture outline under the Codex-PPT project folder.

## Locked Week 10 lecture evidence

One trial is a 100-step symmetric 1D walk from `x=0 mm`, with `a=1 mm` and equal `+1/-1 mm` step probabilities. Seed `4605` gives 10,000-trial mean final position `-0.128 mm` and spread `9.9423 mm`; the supplied ideal spread reference is `10 mm`. The sample-size means for 100/1,000/10,000 trials are `0.040`, `0.066`, and `-0.128 mm`, demonstrating that finite random convergence need not be monotonic. Symmetry and even-integer final-position checks pass.

## Verification

- Learning note: Tectonic compilation exit 0; five A4 pages; final rendered pages visually inspected; the initially orphaned preparation callout was repaired; final compile has no overfull or underfull box warning.
- Lecture Live Script: fresh MATLAB process exit 0 with `WEEK10_LECTURE_FRESH_RUN_PASSED`; base MATLAB only.
- Practical Live Script: fresh MATLAB process exit 0 with `WEEK10_PRACTICAL_FRESH_RUN_PASSED`; hidden reference emits `WEEK10_PRACTICAL_REFERENCE_PASSED`.
- Strict reference asset generator emits `WEEK10_REFERENCE_ASSETS_PASSED` and retains plots plus CSV summaries under `.agent/matlab/`.
- Plain-text Live Script structure passed H1/depth/appendix checks for both student `.m` files; no `.mlx` student copy exists.
- Canonical weekly Form mapping checked: only Week01 and Week02 are currently registered; Week10 diagnostic remains local and unpublished.

## Slide production boundary

The Week 10 Codex-PPT folder contains only `outline.md` plus MATLAB Drive metadata. There is no `deck_spec.json`, `speech.md`, prompt directory, slide job state, generated slide image, or Week 10 PPTX. The outline is a draft awaiting lecturer approval before any later slide-production gate can advance.

## Existing work

Unrelated repository modifications and MATLAB Drive metadata present before this task were preserved.
