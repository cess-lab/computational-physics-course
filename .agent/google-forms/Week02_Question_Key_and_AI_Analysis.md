# Week 02 Individual Check — Question Key and AI Analysis

## Intended evidence

| Category | Expected response | Misconceptions to tag |
| --- | --- | --- |
| Physical prediction | Horizontal velocity is constant, vertical velocity decreases linearly, and the ideal trajectory is parabolic. | Gravity reduces horizontal velocity; both components are constant; zero vertical velocity throughout flight |
| Units and array operations | `g.*t.^2` has units of metres, and `.^2` squares each stored time value. | Confusing displacement with velocity; treating an array power as a matrix operation; losing dimensions |
| Array reasoning | `0:0.02:2.48` stores 125 values and represents 124 intervals. | Confusing stored values with intervals; omitting the zero endpoint; treating numerical values as counts |
| Defect diagnosis | `sin` and `cos` interpret `40` as radians; convert degrees with `deg2rad` or use degree-based functions deliberately. | Believing a variable name performs a unit conversion; treating the issue as cosmetic; mixing angular and time units |
| Validation reasoning | Accept a specific independent check linked to a defect it could expose: initial position, initial velocity components, constant horizontal velocity, `v_y = 0` at the peak, analytical peak/range, final `y = 0`, units, aligned arrays, or finite values. | “The code ran”; visual plausibility alone; naming a check without explaining what it can reveal |
| Confidence | Use the fixed 1–5 scale for calibration; there is no correct value. | High-confidence incorrect and low-confidence correct responses are both pedagogically useful patterns |

## Suggested AI-analysis prompt

Analyse the anonymised Week 02 responses as a cohort diagnostic. Do not grade or rank individual students. Report:

1. response count and missing-data issues;
2. the percentage selecting each option for the four conceptual questions;
3. the three most common misconceptions, with response counts;
4. a short thematic coding of validation answers into initial condition, units, horizontal-velocity check, peak condition, endpoint/ground condition, analytical reference, array/finite-value check, visual-only evidence, code-ran-only evidence, and unclear;
5. confidence calibration, especially high-confidence incorrect and low-confidence correct patterns;
6. two points the lecturer should address before or during group debugging; and
7. one caution about what cannot be inferred from this unmarked, honesty-based digital check.

Do not infer misconduct, general programming ability, or overall course performance from one diagnostic. Do not reproduce names or matric numbers in the report.
