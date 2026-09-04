# Week 06 Individual Check - Question Key and AI Analysis

This is a **draft question/analysis specification only**. Do not create the live Google Form or Classroom coursework until the lecturer approves the Week 06 materials and diagnostic wording.

## Suggested six-question diagnostic

1. **Physical prediction - multiple choice.** A projectile is still moving upward, but gravity has reduced its speed from the launch value. What sign should `dy/dt` have at that instant? **Key:** positive, because height is still increasing.
2. **Units/scaling - multiple choice.** If position is measured in metres and time in seconds, what is the unit of a numerical estimate of `dy/dt`? **Key:** m/s.
3. **Algorithm/code reasoning - multiple choice.** Which two model values are used by a forward difference at `t0` with positive step `h`? **Key:** `y(t0)` and `y(t0+h)`.
4. **Numerical/defect diagnosis - multiple choice.** A student writes `(y_next-y_now)/t0` instead of `(y_next-y_now)/h`. What is the main defect? **Key:** the change in position is divided by the target time rather than by the time interval, so the slope calculation is wrong even though the code may run.
5. **Validation reasoning - short response.** After computing a forward-difference velocity from a model with a known analytic derivative, state one Core validation and what it demonstrates. **Expected answer:** compare the numerical estimate with the analytic derivative at the same target point and report a simple error; this shows how closely the numerical approximation reproduces the known physical rate.
6. **Confidence - linear scale 1-5.** Use the same fixed confidence labels as other weeks; there is no correct value.

## Intended evidence

| Category | Expected response | Misconceptions to tag |
| --- | --- | --- |
| Physical prediction | Positive derivative while position is increasing | Treating gravity as forcing the derivative negative immediately; confusing acceleration sign with velocity sign |
| Units/scaling | m/s for position differentiated with respect to time | m/s^2; metres; unitless |
| Algorithm/code reasoning | Current value and one forward value separated by `h` | Using `t0-h`; using two arbitrary times; confusing array index with physical step size |
| Numerical/defect diagnosis | Divide by `h`, the actual input interval | Believing any denominator with seconds is acceptable; treating a runnable result as evidence of correctness |
| Validation reasoning | Compare with analytic/reference derivative at the same point and state error | "The graph looks smooth"; smaller `h` alone as proof; checking only the sign |
| Confidence | Use for calibration only | High-confidence incorrect and low-confidence correct responses are both useful teaching signals |

## Suggested AI-analysis prompt

Analyse the anonymised Week 06 responses as a cohort diagnostic. Do not grade or rank individual students. Report response count and missing data; option percentages for the four conceptual items; the three most common misconceptions; thematic coding of validation answers into analytic-reference comparison, error-aware, sign-only, graph-only, step-size-only, and unclear; confidence calibration; two points to address before group work; and one caution about what cannot be inferred from this ungraded diagnostic. Do not infer misconduct or general programming ability from one check.
