# Week 09 — Data Fitting and Uncertainty

Use a small physical dataset to fit a model, interpret fitted parameters and units, inspect residuals, and report uncertainty without false precision.

## Materials

- [Learning note](Week09_Learning_Note_Data_Fitting_and_Uncertainty.pdf): Ohm's-law fitting, parameter interpretation, residuals, validation, and cautious uncertainty.
- [Lecture demonstration](Week09_Lecture_Demonstration_Ohms_Law_Data_Fitting.m): complete lecturer-led fit of voltage-current measurements for a nominal 47 ohm resistor.
- [Group practical](Week09_Practical_AI_Enabled_Data_Fitting_Challenge_Set.m): ten progressive challenges across spring calibration, cart motion, and pendulum data.
- Lecture-slide outline: prepared under `.agent/lecture-slides/codex-ppt/outline.md` for later lecturer approval. No Week 09 slide images or PPTX have been created.

## Learning Focus

The Core route has three new ideas: fit a supplied simple physical relationship; calculate and read residuals; and state fitted-parameter uncertainty cautiously using a supplied repeatability range. Students must distinguish measured quantities from fitted parameters and keep units attached to every parameter. Supplied fit-quality statistics and comparison of two plausible simple models are Working exposure. Weighted/nonlinear fitting and formal confidence intervals remain Stretch material.

## Lecture Model

The lecture uses measured current `I` and voltage `V` for a nominal 47 ohm resistor. The proposed relationship is

`V = R I + b`,

where the fitted slope `R` has unit V/A = ohm and the fitted intercept `b` has unit V. The locked dataset is:

| Current (A) | Voltage (V) |
| ---: | ---: |
| 0.01 | 0.48 |
| 0.02 | 0.93 |
| 0.03 | 1.43 |
| 0.04 | 1.86 |
| 0.05 | 2.36 |
| 0.06 | 2.83 |
| 0.07 | 3.28 |
| 0.08 | 3.77 |

Base-MATLAB `polyfit` gives `R = 47.0000 ohm` and `b = 0.0025 V`. The residual RMSE is about `0.0130 V`, with largest absolute residual `0.0225 V`. The fit lies inside the nominal 47 ohm, 5% component range of `44.65–49.35 ohm`.

Three supplied repeat runs give fitted slopes about `47.00`, `47.06`, and `47.27 ohm`. Treat `47.0–47.3 ohm` as a simple repeatability range for this teaching dataset. It is not a formal confidence interval and is not the same thing as the manufacturer's component tolerance.

## Running the MATLAB Materials

Open the `.m` files in MATLAB R2025a or later as plain-text Live Scripts. The Week 09 Core files use base MATLAB only; no fitting toolbox is required. Run sections from top to bottom in a fresh MATLAB session. Local execution was checked using MATLAB R2026b Prerelease Update 3.

The lecture file is a complete demonstration with no student submission fields. The practical provides runnable fitting scaffolds and bounded group evidence entries.

## Practical Evidence and AI Use

Work in groups of two or three. The practical contexts are Hooke-law spring calibration, a cart whose residuals reveal that a constant-speed model is inadequate, and a linearised pendulum relationship used to infer gravitational acceleration. Record the proposed model, fitted parameter and unit, residual evidence, one independent check, and a physical interpretation. Record material AI decisions rather than full chat histories.

Google Classroom is the official submission record. Complete and lock the group evidence before the question slot and individual defender are drawn. Follow the rotation rule and arrange a make-up defence for an absence. The Week 09 practical includes a compact capstone process checkpoint but introduces no new graded capstone milestone.

The individual pre-practical diagnostic is drafted locally but has not been published.

## Instructor Sources

Hidden `.agent/` folders retain the learning-note LaTeX and rendered QA, strict MATLAB fitting evidence and plots, practical reference answers and defence records, the draft diagnostic, and the lecture-slide outline. The slide-production folder contains only the outline at this stage.
