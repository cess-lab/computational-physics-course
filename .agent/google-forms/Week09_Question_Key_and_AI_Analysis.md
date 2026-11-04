# Week 09 Individual Check - Question Key and AI Analysis

This is a **draft question/analysis specification only**. Do not create the live Google Form or Classroom coursework until the lecturer approves the Week 09 materials and diagnostic wording.

## Suggested six-question diagnostic

1. **Physical prediction - multiple choice.** For a spring calibration model `F = kx + b`, with extension in metres and force in newtons, what should a spring near `25 N/m` show? **Key:** a positive slope near `25 N/m`; increasing extension slightly should increase force.
2. **Units/scaling - multiple choice.** What are the units of the fitted slope `k` and intercept `b` in `F = kx + b`? **Key:** `k` in N/m and `b` in N.
3. **Data/code reasoning - multiple choice.** If `p = polyfit(x,F,1)` and `F_fit = polyval(p,x)`, what do `p(1)` and `F-F_fit` represent? **Key:** `p(1)` is the fitted slope/spring constant and `F-F_fit` is the residual in newtons.
4. **Model-diagnosis - multiple choice.** A straight-line fit has positive residuals at both ends of the time range and negative residuals in the middle. What is the best first interpretation? **Key:** a curve-like residual pattern suggests that the constant-speed model is missing curvature; the point should be investigated, not automatically deleted.
5. **Validation reasoning - short response.** State one independent check for a fitted physical parameter and explain what it demonstrates. **Expected answers:** compare a fitted resistance with the supplied nominal/tolerance range; inspect residual size and pattern; compare an inferred pendulum `g` with the supplied near-Earth reference; or use an equivalent check with units and purpose stated. Do not call a repeatability span a formal confidence interval.
6. **Confidence - linear scale 1-5.** Use the same fixed confidence labels as other weeks; there is no correct value.

## Intended evidence

| Category | Expected response | Misconceptions to tag |
| --- | --- | --- |
| Physical prediction | The fitted relationship has a positive slope with the expected physical scale. | Treating a slope as a measured force; assuming the intercept is the spring constant; ignoring the proposed model |
| Units/scaling | Slope is output/input, N/m; intercept has output unit N. | Slope labelled N; intercept labelled N/m; treating fit coefficients as unitless |
| Data/code reasoning | `polyfit(...,1)` returns slope then intercept; `measured - fitted` gives residuals in the measured-output unit. | Reversing coefficient order; residual defined with the wrong sign without interpretation; confusing fitted output with measurements |
| Model diagnosis | Structured residuals can reveal missing curvature or another systematic issue even when an overlay looks plausible. | Deleting the largest residual automatically; graph-only acceptance; equating small RMSE with proof of the model |
| Validation reasoning | A specific reference, residual-pattern, unit, or plausible-range check linked to the fitted claim. | Treating nominal tolerance as fit uncertainty; calling a repeatability range a confidence interval; “the fit ran” |
| Confidence | Use for calibration only. | High-confidence incorrect and low-confidence correct responses are both useful teaching signals |

## Suggested AI-analysis prompt

Analyse the anonymised Week 09 responses as a cohort diagnostic. Do not grade or rank individual students. Report:

1. response count and missing-data issues;
2. the percentage selecting each option for the four conceptual questions;
3. the three most common misconceptions, with response counts;
4. a short thematic coding of validation answers into physical reference/range, residual magnitude, residual pattern, units, repeatability-only, visual-only, code-ran-only, and unclear;
5. confidence calibration, especially high-confidence incorrect and low-confidence correct patterns;
6. two points the lecturer should address before or during the data-fitting practical; and
7. one caution about what cannot be inferred from this ungraded diagnostic.

Do not infer misconduct, general programming ability, or overall course performance from one diagnostic. Do not reproduce names or matric numbers in the report.
