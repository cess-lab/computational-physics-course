# Week 09 production record

Request: prepare Week 09 course materials except the lecture slide deck; prepare only the deck outline, 2026-09-05. This is a historical preparation boundary and was superseded by the later local Codex-PPT production record dated 2026-09-07.

## Completed package

- Student README describing scope, model, execution, practical evidence, and AI-use expectations.
- Five-page A4 learning note on data fitting and uncertainty, with hidden LaTeX source and rendered QA.
- Complete lecturer-led plain-text Live Script using the locked Ohm's-law dataset.
- AI-enabled ten-challenge group practical across spring, cart, and pendulum contexts.
- Hidden practical answer/reference script, diagnostic draft, A/B variant bank, defence rubric, event ledger, and member summary.
- Fourteen-slide lecture outline under the Codex-PPT project folder.
- Current student-facing lecture deck: `Week09/Lecture_Slides_Week09.pptx`.

## Locked Week 09 lecture evidence

The model is `V = R I + b` for a nominal 47 ohm resistor. The locked eight-point dataset fits to `R = 47.0000 ohm`, `b = 0.0025 V`, residual RMSE `0.0129904 V`, and largest absolute residual `0.0225 V`. The nominal 5% component range is `44.65–49.35 ohm`. Three supplied repeat runs yield a simple observed fitted-slope span of about `47.0–47.3 ohm`; materials explicitly distinguish this repeatability evidence from manufacturer tolerance and formal confidence intervals.

## Verification

- Learning note: Tectonic compilation exit 0; five A4 pages; all five final rendered pages visually inspected; title wrapping and orphaned final callout repaired; extracted text and numerical labels retained.
- Lecture Live Script: fresh MATLAB process exit 0 with `WEEK09_LECTURE_FRESH_RUN_PASSED`; base MATLAB only.
- Practical Live Script: fresh MATLAB process exit 0 with `WEEK09_PRACTICAL_FRESH_RUN_PASSED`; hidden reference emits `WEEK09_PRACTICAL_REFERENCE_PASSED`.
- Strict reference asset generator emits `WEEK09_REFERENCE_ASSETS_PASSED` and retains raw-data, fit, residual plots, CSV data, and fit summary under `.agent/matlab/`.
- Plain-text Live Script structure passed H1/depth/appendix checks for both student `.m` files.
- Canonical weekly Form mapping checked: only Week01 and Week02 are currently registered; Week09 diagnostic remains local and unpublished.

## Slide production status

- Historical boundary: the earlier statement that the Codex-PPT folder contained only a draft outline and no deck is retained as preparation-stage provenance and is not current.
- Current Codex-PPT directory: `Week09/.agent/lecture-slides/codex-ppt/`.
- Current student-facing artifact: `Week09/Lecture_Slides_Week09.pptx`.
- Current hidden assembled artifact: `Week09/.agent/lecture-slides/codex-ppt/codex-ppt.pptx`.
- Current verified state: `slide_run_state.json` and `slide_jobs.json` record `slides_recorded` with one accepted sample, 13 recorded slides, and no pending or blocked jobs. The deck contains 14 slides, 14 non-empty presenter-note sections, and one full-slide picture per slide.
- Current final-QA evidence: `Week09/.agent/lecture-slides/codex-ppt/qa/final-qa.md` records successful rendering and inspection; the verified SHA-256 is `1cbd94cbbf053e4c5ed6c51bccfd045075a8eb75249a6fedd00f16c90d535b6e`.
- Approval caveat: the current QA record states that the Slide 08 sample gate was accepted before dispatch, but this package status does not independently establish a lecturer-approval record for the completed deck. Retain that approval gate unless separately recorded.

## Existing work

Unrelated repository modifications and MATLAB Drive metadata present before this task were preserved.
