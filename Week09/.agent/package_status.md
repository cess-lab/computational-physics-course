# Week 09 production record

Request: prepare Week 09 course materials except the lecture slide deck; prepare only the deck outline, 2026-09-05.

## Completed package

- Student README describing scope, model, execution, practical evidence, and AI-use expectations.
- Five-page A4 learning note on data fitting and uncertainty, with hidden LaTeX source and rendered QA.
- Complete lecturer-led plain-text Live Script using the locked Ohm's-law dataset.
- AI-enabled ten-challenge group practical across spring, cart, and pendulum contexts.
- Hidden practical answer/reference script, diagnostic draft, A/B variant bank, defence rubric, event ledger, and member summary.
- Fourteen-slide lecture outline under the Codex-PPT project folder.

## Locked Week 09 lecture evidence

The model is `V = R I + b` for a nominal 47 ohm resistor. The locked eight-point dataset fits to `R = 47.0000 ohm`, `b = 0.0025 V`, residual RMSE `0.0129904 V`, and largest absolute residual `0.0225 V`. The nominal 5% component range is `44.65–49.35 ohm`. Three supplied repeat runs yield a simple observed fitted-slope span of about `47.0–47.3 ohm`; materials explicitly distinguish this repeatability evidence from manufacturer tolerance and formal confidence intervals.

## Verification

- Learning note: Tectonic compilation exit 0; five A4 pages; all five final rendered pages visually inspected; title wrapping and orphaned final callout repaired; extracted text and numerical labels retained.
- Lecture Live Script: fresh MATLAB process exit 0 with `WEEK09_LECTURE_FRESH_RUN_PASSED`; base MATLAB only.
- Practical Live Script: fresh MATLAB process exit 0 with `WEEK09_PRACTICAL_FRESH_RUN_PASSED`; hidden reference emits `WEEK09_PRACTICAL_REFERENCE_PASSED`.
- Strict reference asset generator emits `WEEK09_REFERENCE_ASSETS_PASSED` and retains raw-data, fit, residual plots, CSV data, and fit summary under `.agent/matlab/`.
- Plain-text Live Script structure passed H1/depth/appendix checks for both student `.m` files.
- Canonical weekly Form mapping checked: only Week01 and Week02 are currently registered; Week09 diagnostic remains local and unpublished.

## Slide production boundary

The Week 09 Codex-PPT folder contains only `outline.md` plus MATLAB Drive metadata. There is no `deck_spec.json`, `speech.md`, prompt directory, slide job state, generated slide image, or Week 09 PPTX. The outline is a draft awaiting lecturer approval before any later slide-production gate can advance.

## Existing work

Unrelated repository modifications and MATLAB Drive metadata present before this task were preserved.
