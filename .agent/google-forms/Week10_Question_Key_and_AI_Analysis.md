# Week 10 Individual Check - Question Key and AI Analysis

This is a **draft question/analysis specification only**. Do not create the live Google Form or Classroom coursework until the lecturer approves the Week 10 materials and diagnostic wording.

## Suggested six-question diagnostic

1. **Physical prediction - multiple choice.** During one detector window, `40` photons are each detected with probability `0.65`. What should be predicted? **Key:** the mean detected count is `26`, but individual 40-photon trials can differ from 26.
2. **Units/scaling - multiple choice.** For shielding, `P = exp(-mu*x)` with `mu` in `cm^-1` and `x` in cm. Which statement is correct? **Key:** `mu*x` is dimensionless and `P` is a dimensionless probability between 0 and 1.
3. **Algorithm/code reasoning - multiple choice.** In `rand(40,2000)` for the photon detector, what does one column represent? **Key:** one complete 40-photon measurement trial; the 2,000 columns are repeated trials.
4. **Numerical/defect diagnosis - multiple choice.** A shielding script uses `rand < mu*x` with `mu*x = 1.2` as its transmission rule. What is the main defect? **Key:** the exponent has been used as a probability; `1.2` is outside the valid probability range and makes every draw transmit, whereas the threshold should be `exp(-mu*x)`.
5. **Validation reasoning - short response.** State one independent validation for a Monte Carlo result and explain what it tests. **Expected answers:** compare a photon mean with `40*0.65`; compare shielding transmission with `exp(-mu*x)` as sample size changes; check random-walk coordinate means near zero and the even-integer final-position rule; or give an equivalent physical check. A fixed seed alone is reproducibility evidence, not physical validation.
6. **Confidence - linear scale 1-5.** Use the same fixed confidence labels as other weeks; there is no correct value.

## Intended evidence

| Category | Expected response | Misconceptions to tag |
| --- | --- | --- |
| Physical prediction | Mean and spread answer different questions: the expected count or symmetric centre is not the outcome of every trial. | Probability treated as a guarantee; mean confused with individual result; near-zero mean interpreted as no variability |
| Units/scaling | Exponents are dimensionless; probabilities are dimensionless and lie in `[0,1]`; step length supplies physical units to positions. | Treating `mu*x` as the probability; attaching cm to `P`; ignoring the step scale |
| Algorithm/code reasoning | Array columns or complete paths represent repeated trials, while steps/photons within a trial are the physical process. | Confusing one random draw with one trial; confusing `N` steps with `M` trials; reading array dimensions backwards |
| Numerical/defect diagnosis | `exp(-mu*x)` is required for the attenuation probability; a fixed seed reproduces both correct and incorrect code. | “Random means any threshold is acceptable”; threshold above 1 accepted; seed treated as validation |
| Validation reasoning | A model-based reference, symmetry, step-rule, or sample-size check with a stated purpose. | Histogram appearance alone; fixed-seed agreement alone; assuming larger samples force monotonic convergence |
| Confidence | Use for calibration only. | High-confidence incorrect and low-confidence correct responses are both useful teaching signals |

## Suggested AI-analysis prompt

Analyse the anonymised Week 10 responses as a cohort diagnostic. Do not grade or rank individual students. Report:

1. response count and missing-data issues;
2. the percentage selecting each option for the four conceptual questions;
3. the three most common misconceptions, with response counts;
4. a short thematic coding of validation answers into analytic/reference comparison, symmetry, discrete step-rule, sample-size effect, seed-only, visual-only, code-ran-only, and unclear;
5. confidence calibration, especially high-confidence incorrect and low-confidence correct patterns;
6. two points the lecturer should address before or during the Monte Carlo practical; and
7. one caution about what cannot be inferred from this ungraded diagnostic.

Do not infer misconduct, general programming ability, or overall course performance from one diagnostic. Do not reproduce names or matric numbers in the report.
