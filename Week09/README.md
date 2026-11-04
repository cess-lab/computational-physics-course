# Week 09 — Data Fitting: Infer a physical parameter and read residuals with uncertainty

Use a small physical dataset to fit a model, interpret fitted parameters and units, inspect residuals, and report uncertainty without false precision.

## Materials

- [Learning note](Week09_Learning_Note_Data_Fitting_and_Uncertainty.pdf): Ohm's-law fitting, parameter interpretation, residuals, validation, and cautious uncertainty.
- [Lecture demonstration](Week09_Lecture_Demonstration_Ohms_Law_Data_Fitting.m): complete lecturer-led fit of voltage-current measurements for a nominal 47 ohm resistor.
- [Group practical](Week09_Practical_AI_Enabled_Data_Fitting_Challenge_Set.m): ten progressive challenges across spring calibration, cart motion, and pendulum data.
- [Lecture slide deck](Lecture_Slides_Week09.pptx): completed 14-slide image-based Teaching Courseware deck, with final QA and dispatch records retained under `.agent/lecture-slides/codex-ppt/qa/`.

## Weekly workflow

**Before:** Read the learning note, complete the dedicated Week 09 diagnostic in Google Classroom when it is released, and predict the fitted trend and parameter units.

**During:** Follow `measurements -> model -> fitted parameter -> residuals -> validation -> uncertainty -> interpretation`; run the supplied MATLAB work and complete the exit ticket.

**Practical:** Work in a group of two or three through ten progressive challenges, recording the model, units, algorithm, code/output, validation, interpretation, and material AI decisions. Rerun the final work from a fresh MATLAB session.

**After:** Submit the locked packet through Google Classroom. The question slot and eligible student are drawn after submission for the individual defence. Feedback and any optional short remediation/retry are issued through Classroom.

**Portfolio status:** Week 09 is one of the ten counted practical packets; the best eight packets count for the group component.

## Current slide-deck status

The current deck is locally assembled and QA-recorded: 14 slides, 14 non-empty presenter-note sections, successful LibreOffice export, and no pending or blocked slide jobs. The retained records document the approved sample gate and final deck QA, but not a separate full-deck lecturer-approval record.

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

Complete the dedicated Week 09 diagnostic through its Google Classroom coursework when released. If it reveals a common misconception, the lecturer may post an optional 10–15 minute remediation with one retry and confidence check; it is not a prerequisite for the next lecture. The local question key remains planning material until publication is approved.

## Instructor Sources

Hidden `.agent/` folders retain the learning-note LaTeX and rendered QA, strict MATLAB fitting evidence and plots, practical reference answers and defence records, the draft diagnostic, and the lecture-deck source images, prompts, speaker notes, and final QA. The current student-facing deck is `Lecture_Slides_Week09.pptx`.
