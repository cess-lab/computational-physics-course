# Week 05 Individual Check - Question Key and AI Analysis

This is a **draft question/analysis specification only**. Do not create the live Google Form or Classroom coursework until the lecturer approves the Week 05 materials and diagnostic wording.

## Suggested six-question diagnostic

1. **Physical prediction - multiple choice.** For a projectile residual defined as `model range - target range`, a student calculates `-3.0 m`. What does this mean physically? **Key:** the model undershoots the target by 3.0 m.
2. **Units/scaling - multiple choice.** In the Week 05 projectile problem, what are the units of the root and the residual? **Key:** root in degrees; residual in metres.
3. **Algorithm/code reasoning - multiple choice.** A bisection bracket has a negative residual at the left endpoint. The midpoint residual is positive. Which half should be retained? **Key:** the interval from the left endpoint to the midpoint, because those endpoint residuals have opposite signs.
4. **Numerical/defect diagnosis - multiple choice.** A Newton implementation stores angle in degrees but uses a derivative for radians without the `pi/180` conversion. What is the main problem? **Key:** the residual slope has the wrong scale/unit for the degree-based update, so the Newton step is inconsistent.
5. **Validation reasoning - short response.** After a numerical method returns a candidate root, state the Core Week 05 validation and explain what it demonstrates. **Expected answer:** substitute the candidate back into the residual and check `abs(residual) < supplied_tolerance`; this demonstrates that the physical model output matches the target condition within the stated residual tolerance.
6. **Confidence - linear scale 1-5.** Use the same fixed confidence labels as other weeks; there is no correct value.

## Intended evidence

| Category | Expected response | Misconceptions to tag |
| --- | --- | --- |
| Physical prediction | Negative residual means model output is below the target for the defined residual. | Treating any negative value as an error; confusing undershoot with overshoot; ignoring residual definition |
| Units/scaling | Root and residual have different physical units: degree and metre in the projectile case. | Calling the root a distance; treating residual as unitless; assuming every root problem has the same root unit |
| Algorithm/code reasoning | Keep the half interval that preserves opposite endpoint signs. | Always moving the left endpoint; always choosing the smaller residual magnitude; halving without checking signs |
| Numerical/defect diagnosis | Degree-based residual evaluation requires a derivative scaled consistently in m/degree. | Believing `cosd` alone fixes the calculus conversion; assuming any finite Newton step is valid |
| Validation reasoning | Substitute the candidate root into the residual and compare its magnitude with the supplied tolerance. | "The loop stopped"; "the graph looks close"; iteration count as proof; checking the root value rather than the residual |
| Confidence | Use for calibration only. | High-confidence incorrect and low-confidence correct responses are both useful teaching signals |

## Suggested AI-analysis prompt

Analyse the anonymised Week 05 responses as a cohort diagnostic. Do not grade or rank individual students. Report response count and missing data; option percentages for the four conceptual items; the three most common misconceptions; thematic coding of validation answers into residual substitution, graph-only, loop-stopped-only, unit-aware, tolerance-aware, and unclear; confidence calibration; two points to address before group work; and one caution about what cannot be inferred from this ungraded diagnostic. Do not infer misconduct or general programming ability from one check.
