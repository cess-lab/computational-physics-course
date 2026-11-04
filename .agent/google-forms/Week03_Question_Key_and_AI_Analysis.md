# Week 03 Individual Check - Question Key and AI Analysis

This is a **draft question/analysis specification only**. Do not create the live Google Form or Classroom coursework until the lecturer approves the Week 03 materials and diagnostic wording.

## Suggested six-question diagnostic

1. **Physical prediction - multiple choice.** In the supplied two-loop sensor circuit, both source rises are positive, the left loop has `4 ohm` private resistance, the right loop has `6 ohm`, and the shared resistance is `2 ohm`. With both mesh currents defined clockwise, what is the best prediction? **Key:** both mesh currents should be positive, and the left mesh current should be larger.
2. **Units/scaling - multiple choice.** In `A*x=b` when `x` contains mesh currents in amperes and `b` contains source voltages in volts, what unit must the resistance-matrix coefficients carry? **Key:** ohm, because `ohm * A = V`.
3. **Matrix/code reasoning - multiple choice.** For `x_sensor = A_sensor\b_sensor` with the unknown order `[Ia; Ib]`, what does `x_sensor(2)` represent? **Key:** the right-loop mesh current `Ib` in amperes, with its sign interpreted relative to the chosen clockwise direction.
4. **Defect diagnosis - multiple choice.** A student changes one off-diagonal shared-resistance coefficient from `-Rs` to `+Rs`. MATLAB still returns finite numbers. What is the main diagnosis? **Key:** a physical/model sign error; the solved currents must be tested in the original KVL equations rather than accepted because the code ran.
5. **Validation reasoning - short response.** State one direct-substitution check for a two-equation Kirchhoff system and explain what it demonstrates. **Expected answer:** rebuild both original KVL left-hand sides from the solved currents and compare them with the supplied source voltages; near-zero voltage differences show that the solved values satisfy the equations represented by the circuit model. Accept an equivalent signed current-balance check when the student clearly states the node/branch equation it tests.
6. **Confidence - linear scale 1-5.** Use the same fixed confidence labels as other weeks; there is no correct value.

## Intended evidence

| Category | Expected response | Misconceptions to tag |
| --- | --- | --- |
| Physical prediction | Positive clockwise mesh currents, with the left current larger for the supplied circuit. | A negative current is automatically an error; source voltage alone determines current; mesh current and branch current are interchangeable |
| Units/scaling | Matrix coefficients in ohms, unknown currents in amperes, and source vector in volts. | Treating the matrix as unitless; using volts for coefficients; confusing ohms with amperes or siemens |
| Matrix/code reasoning | The vector order maps `x(1)` to `Ia` and `x(2)` to `Ib`; backslash solves the stated system. | One-based index mistaken for a physical value; unknown order forgotten; treating `A\b` as a replacement for deriving the equations |
| Defect diagnosis | A finite result can still encode the wrong shared-resistor sign; original-equation substitution is the first repair check. | “The code ran”; sign error treated as syntax; accepting plausible currents without checking the circuit equations |
| Validation reasoning | Reconstruct both original KVL equations and report voltage mismatches near zero, with the purpose of the check. | Checking only finiteness; checking only one equation; graph-only evidence; naming residuals without explaining what they test |
| Confidence | Use for calibration only. | High-confidence incorrect and low-confidence correct responses are both useful teaching signals |

## Suggested AI-analysis prompt

Analyse the anonymised Week 03 responses as a cohort diagnostic. Do not grade or rank individual students. Report:

1. response count and missing-data issues;
2. the percentage selecting each option for the four conceptual questions;
3. the three most common misconceptions, with response counts;
4. a short thematic coding of validation answers into direct KVL substitution, current-balance, units, residual-only, visual-only, code-ran-only, and unclear;
5. confidence calibration, especially high-confidence incorrect and low-confidence correct patterns;
6. two points the lecturer should address before or during the circuit practical; and
7. one caution about what cannot be inferred from this ungraded, honesty-based digital check.

Do not infer misconduct, general programming ability, or overall course performance from one diagnostic. Do not reproduce names or matric numbers in the report.
