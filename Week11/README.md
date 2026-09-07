# Week 11 - Sensitivity and Uncertainty Propagation

Use one-at-a-time parameter variation to turn plausible input uncertainty into an output range, then distinguish parameter uncertainty from numerical approximation error and model limitation.

## Materials

- `Week11_Learning_Note_Sensitivity_and_Uncertainty_Propagation.pdf`: physics-first learning note using Hooke's law to connect an uncertain spring stiffness to a defensible range of predicted extension.
- `Week11_Lecture_Demonstration_Hookes_Law_Uncertainty.m`: complete lecturer-led plain-text Live Script with baseline/lower/upper cases, one-at-a-time comparison, validation, and Working-exposure sensitivity/propagation ideas.
- `Week11_Practical_AI_Enabled_Sensitivity_and_Uncertainty_Challenge_Set.m`: ten progressive group challenges across an Ohmic resistor, a small-angle pendulum, and exponential attenuation.
- Lecture-slide outline: `Week11/.agent/lecture-slides/codex-ppt/outline.md`. This is the only Week 11 slide-deck artefact prepared in this task; no slide image or PPTX is created.

## Learning Focus

The Core route is:

`physical model -> uncertain input and plausible range -> baseline/lower/upper cases -> one-at-a-time sweep -> output range -> validation -> distinguish uncertainty sources -> practical conclusion without false precision`

The lecture deliberately reuses the Week 04 Hooke's-law model. At a fixed applied force of `10 N`, spring stiffness is treated as uncertain around a `100 N/m` baseline with a plausible range from `95 N/m` to `105 N/m`. The corresponding extension spans approximately `0.09524 m` to `0.10526 m` around the `0.10000 m` baseline.

The Core message is that a range in a measured or specified parameter produces a range in the model output even when the MATLAB calculation itself is deterministic. Students also distinguish three different limitations: numerical approximation error, parameter uncertainty, and model limitation.

## Working Exposure

Working exposure compares a second uncertain input one at a time: applied force from `9.8 N` to `10.2 N` at fixed `k = 100 N/m`. This gives an extension range from `0.098 m` to `0.102 m`, smaller than the stiffness-driven range for the supplied uncertainties. A supplied normalized percentage sensitivity and a supplied first-order independent-uncertainty formula are interpreted but not derived.

## MATLAB Requirement

The editable Live Scripts use MATLAB's plain-text Live Script format and require MATLAB R2025a or later. The Week 11 Core files use base MATLAB only. Run sections from top to bottom in a fresh MATLAB session.

## Practical and AI Use

The practical is an AI-enabled group challenge set using three analogous supplied-model contexts: Ohm's law, a small-angle pendulum, and exponential attenuation. Students may use generative AI to write, debug, or improve code, but each challenge still requires the supplied model and units, a one-at-a-time uncertainty plan, reproducible evidence, validation, interpretation, and a concise AI decision record.

Google Classroom remains the official submission record. Complete and lock group evidence before the question slot and individual defender are drawn. The Week 11 practical includes a compact capstone uncertainty/limitation checkpoint but no new graded capstone milestone.

The individual pre-practical diagnostic is drafted locally under `.agent/practical/` and is not published by this package build.

## Instructor / QA Package

Hidden support materials are stored under `.agent/`:

- learning-note LaTeX source, figures, build output, and visual QA under `.agent/learning-notes/`;
- locked numerical evidence, plots, and run logs under `.agent/matlab/`;
- practical reference answers, diagnostic draft, A/B variant bank, defence rubric, rotation ledger, member summary, and practical QA under `.agent/practical/`;
- the Week 11 lecture-deck outline only under `.agent/lecture-slides/codex-ppt/`.

No Week 11 `deck_spec.json`, `speech.md`, slide prompt jobs, slide images, slide-state files, or `.pptx` are part of this task.
