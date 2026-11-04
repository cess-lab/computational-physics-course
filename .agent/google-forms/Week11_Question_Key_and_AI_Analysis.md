# Week 11 Individual Check - Question Key and AI Analysis

This is a **draft question/analysis specification only**. Do not create the live Google Form or Classroom coursework until the lecturer approves the Week 11 materials and diagnostic wording.

## Suggested six-question diagnostic

1. **Physical prediction - multiple choice.** For `I = V/R` at fixed positive voltage, which resistance case gives the largest current? **Key:** the smallest resistance; for the supplied cases, `95 ohm` gives the largest current.
2. **Units/scaling - multiple choice.** In `x = F/k` with `F` in newtons and `k` in N/m, what is the unit of `x`? **Key:** metre, because `N/(N/m) = m`.
3. **Algorithm/code reasoning - multiple choice.** In a one-at-a-time uncertainty sweep, what must remain fixed while the selected uncertain input is changed? **Key:** the physical model, the other inputs, the units, and the baseline/comparison definition; only the named input range changes.
4. **Uncertainty-source diagnosis - multiple choice.** Which classification is correct? **Key:** resistance known only from `95–105 ohm` is parameter uncertainty; a finite timestep changing a simulation result is numerical approximation error; Hooke's law failing at large deformation is a model limitation.
5. **Validation reasoning - short response.** For the supplied `10 N` load and baseline `100 N/m` stiffness, state one independent check for the uncertainty sweep and explain what it demonstrates. **Expected answer:** calculate `10/100 = 0.10 m`, confirm the metre unit and the inverse trend, and explain that the baseline and plausible output range are consistent with the stated Hooke-law model. Accept an equivalent specific check with its purpose.
6. **Confidence - linear scale 1-5.** Use the same fixed confidence labels as other weeks; there is no correct value.

## Intended evidence

| Category | Expected response | Misconceptions to tag |
| --- | --- | --- |
| Physical prediction | Lower resistance produces larger current at fixed voltage. | Larger resistance gives larger current; changing voltage and resistance together is acceptable for an isolated comparison |
| Units/scaling | The Hooke-law output is in metres; input/output and parameter units remain attached to the range. | Treating N/m as N; reporting a dimensionless extension; ignoring units because MATLAB returns a number |
| Algorithm/code reasoning | One-at-a-time variation changes one named input and holds the rest fixed. | Confounding several uncertain inputs; treating lower/baseline/upper cases as random trials; changing the model silently |
| Uncertainty-source diagnosis | Parameter, numerical, and model limitations are distinct sources of imperfect prediction. | All discrepancy called “numerical error”; timestep changes said to remove parameter uncertainty; better precision said to repair a model limitation |
| Validation reasoning | An independent baseline, unit, trend, or range check stated with what it tests. | Long decimal treated as certainty; smooth output alone; a range reported without naming its source or limitation |
| Confidence | Use for calibration only. | High-confidence incorrect and low-confidence correct responses are both useful teaching signals |

## Suggested AI-analysis prompt

Analyse the anonymised Week 11 responses as a cohort diagnostic. Do not grade or rank individual students. Report:

1. response count and missing-data issues;
2. the percentage selecting each option for the four conceptual questions;
3. the three most common misconceptions, with response counts;
4. a short thematic coding of validation answers into baseline calculation, units, inverse trend, output-range interpretation, false precision, graph-only, and unclear;
5. confidence calibration, especially high-confidence incorrect and low-confidence correct patterns;
6. two points the lecturer should address before or during the uncertainty practical; and
7. one caution about what cannot be inferred from this ungraded diagnostic.

Do not infer misconduct, general programming ability, or overall course performance from one diagnostic. Do not reproduce names or matric numbers in the report.
