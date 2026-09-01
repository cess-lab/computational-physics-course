# Week 01 Individual Check — Publication-Ready Question Key and AI Analysis

This is the proposed repository specification for the six-question Week 01 diagnostic. It aligns with the vertical-motion lecture route. The mapped live Google Form and Classroom coursework are intentionally unchanged until the lecturer approves publication and their live state is verified.

## Proposed Form items

1. **Physical prediction (multiple choice).** For a ball launched vertically upward with air resistance neglected, which position--time trend should you expect from `t = 0` until it returns downward?
   A. A straight line that keeps increasing.
   B. A curve that rises, has one highest point, then falls. **Correct.**
   C. A curve that starts below zero and rises forever.
   D. A horizontal line because gravity is constant.
2. **Units and scaling (multiple choice).** In `y_m = y0_m + v0_mps.*t_s - 0.5*g_mps2.*t_s.^2`, what is the unit of `g_mps2.*t_s.^2`?
   A. `m` **Correct.**
   B. `m s^-1`
   C. `m s^-2`
   D. no unit
3. **Array and indexing (multiple choice).** MATLAB stores `t_s = 0:0.1:4`. Which statement is correct?
   A. It has 40 values and `t_s(1)=0.1`.
   B. It has 41 values and `t_s(11)=1.0`. **Correct.**
   C. It has 41 values and `t_s(0)=0`.
   D. It has 40 values because the final value is excluded.
4. **Array-operator diagnosis (multiple choice).** If `t_s` is an array, which expression squares every stored time value?
   A. `t_s^2`
   B. `t_s.^2` **Correct.**
   C. `2.^t_s`
   D. `t_s./2`
5. **Validation reasoning (short response).** State one check you would use before trusting the graph, and explain in one sentence what error that check could reveal.
   Expected examples include the initial condition `y_m(1)=y0_m`, a unit check, the expected concave-down trend, a continuous peak reference, aligned array sizes, or finite values.
6. **Confidence (multiple choice).** How confident are you that you can explain the answer above?
   Use the fixed scale: 1 = not yet confident; 2 = slightly confident; 3 = somewhat confident; 4 = confident; 5 = very confident. There is no correct response.

## Intended evidence

| Category | Expected response | Misconceptions to tag |
| --- | --- | --- |
| Physical prediction | The ball rises, reaches one highest point, then descends; the position--time curve is concave downward and starts at `0 m`. | Straight-line height; upward curvature; motion that never returns downward; ignoring the initial condition |
| Units and scaling | `g_mps2.*t_s.^2` has units of metres, so it can be combined with `y0_m` and `v0_mps.*t_s`. | Treating `g t^2` as acceleration; adding quantities with incompatible units; losing the square on time |
| Array reasoning | `0:0.1:4` stores 41 values; `t_s(1)=0` and `t_s(11)=1.0`. | Confusing values with intervals; zero-based indexing; omitting the inclusive zero endpoint |
| Code/defect reasoning | `t_s^2` is a matrix-power request for an array. Use `t_s.^2` to square each stored time value. | Treating `^` and `.^` as interchangeable; blaming the physics rather than the array operation |
| Validation reasoning | Accept a specific check linked to its purpose: `y_m(1)=y0_m`, units, expected concave-down trend, continuous peak/reference value, aligned array sizes, or finite values. | “The code ran”; visual plausibility alone; a check named without explaining its purpose |
| Confidence | Use the fixed 1–5 scale for calibration; there is no correct value. | High-confidence incorrect responses and low-confidence correct responses are both pedagogically useful patterns |

## Suggested AI-analysis prompt

Analyse the anonymised Week 01 responses as a cohort diagnostic. Do not grade or rank individual students. Report:

1. response count and missing-data issues;
2. the percentage selecting each option for the four conceptual questions;
3. the three most common misconceptions, supported by response counts;
4. a short thematic coding of the validation answers into initial condition, units, curve trend, analytical reference, array/finite-value check, visual-only evidence, code-ran-only evidence, and unclear;
5. confidence calibration, especially high-confidence incorrect and low-confidence correct patterns;
6. two points the lecturer should revisit immediately during the practical; and
7. one caution about what cannot be inferred from this unmarked, honesty-based digital check.

Do not infer misconduct, programming ability, or overall course performance from a single response. Do not reproduce names or matric numbers in the report.
