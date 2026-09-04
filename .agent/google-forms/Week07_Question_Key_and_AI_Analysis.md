# Week 07 Individual Check - Question Key and AI Analysis

This is a **draft question/analysis specification only**. Do not create the live Google Form or Classroom coursework until the lecturer approves the Week 07 materials and diagnostic wording.

## Suggested six-question diagnostic

1. **Physical prediction - multiple choice.** A force remains positive while decreasing over a time interval. What sign should the impulse `integral F(t) dt` have? **Key:** positive, because all accumulated force-time area is above zero.
2. **Units/scaling - multiple choice.** If force is measured in newtons and time in seconds, what is the unit of area under a force-time graph? **Key:** N s, equivalent to momentum unit kg m/s.
3. **Algorithm/code reasoning - multiple choice.** In one trapezoidal strip between neighbouring samples, which quantity represents the strip width? **Key:** the difference between the two neighbouring independent-variable coordinates, such as `t(i+1)-t(i)`.
4. **Numerical/defect diagnosis - multiple choice.** Samples are separated by `0.5 s`, but a student writes `trapz(F)` and reports the returned value directly as N s. What is the main defect? **Key:** MATLAB assumed unit sample spacing because the physical time coordinates or spacing were not supplied.
5. **Validation reasoning - short response.** After computing a trapezoidal integral for a model with a known analytic integral, state one Core validation and what it demonstrates. **Expected answer:** refine the sample spacing and compare with the analytic/reference integral while reporting simple error; this shows whether the numerical estimate approaches an independent value as resolution improves.
6. **Confidence - linear scale 1-5.** Use the same fixed confidence labels as other weeks; there is no correct value.

## Intended evidence

| Category | Expected response | Misconceptions to tag |
| --- | --- | --- |
| Physical prediction | Positive accumulated area for positive force | Confusing decreasing force with negative impulse; ignoring limits |
| Units/scaling | N s for force integrated over time | N/s; N; seconds; unitless area |
| Algorithm/code reasoning | Width comes from neighbouring independent-variable coordinates | Using force difference as width; confusing array index with physical spacing |
| Numerical/defect diagnosis | `trapz(F)` assumes unit spacing; use `trapz(t,F)` or apply known spacing correctly | Believing any runnable `trapz` call automatically carries the physical unit |
| Validation reasoning | Refinement plus analytic/reference comparison and simple error | "The graph looks smooth"; `trapz` ran without errors; finer sampling alone as proof |
| Confidence | Use for calibration only | High-confidence incorrect and low-confidence correct responses are both useful teaching signals |

## Suggested AI-analysis prompt

Analyse the anonymised Week 07 responses as a cohort diagnostic. Do not grade or rank individual students. Report response count and missing data; option percentages for the four conceptual items; the three most common misconceptions; thematic coding of validation answers into refinement-plus-reference, reference-only, refinement-only, units/bounds-only, graph-only, and unclear; confidence calibration; two points to address before group work; and one caution about what cannot be inferred from this ungraded diagnostic. Do not infer misconduct or general programming ability from one check.
