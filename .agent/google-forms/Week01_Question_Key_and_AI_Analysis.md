# Week 01 Individual Check — Question Key and AI Analysis

## Intended evidence

| Category | Expected response | Misconceptions to tag |
| --- | --- | --- |
| Physical prediction | Temperature decreases rapidly at first, then more slowly, approaching `22 °C` from above. | Linear cooling; oscillation; crossing below the environment merely because the derivative is negative |
| Units and scaling | `k` has units `min^-1`; `kt` is dimensionless. | Treating the rate constant as time, temperature rate, or dimensionless |
| Array reasoning | `0:2:60` stores 31 values and represents 30 intervals. | Confusing stored values with intervals; ignoring the inclusive zero endpoint |
| Numerical reasoning | Reducing the Euler timestep should move the result closer to the reference for this baseline case while increasing the number of updates. | Assuming smaller timestep is automatically exact; believing more samples create more error; confusing an unchanged model with an unchanged numerical result |
| Validation reasoning | Accept any specific, relevant check linked to what it tests: initial value, long-time limit, monotonic trend, physical bounds, units, reference comparison, or timestep convergence. | “The code ran”; visual plausibility alone; a check named without explaining its purpose |
| Confidence | Use the fixed 1–5 scale for calibration; there is no correct value. | High-confidence incorrect responses and low-confidence correct responses are both pedagogically useful patterns |

## Suggested AI-analysis prompt

Analyse the anonymised Week 01 responses as a cohort diagnostic. Do not grade or rank individual students. Report:

1. response count and missing-data issues;
2. the percentage selecting each option for the four conceptual questions;
3. the three most common misconceptions, supported by response counts;
4. a short thematic coding of the validation answers into initial condition, limiting behaviour, physical bounds, units, reference comparison, convergence, visual-only evidence, code-ran-only evidence, and unclear;
5. confidence calibration, especially high-confidence incorrect and low-confidence correct patterns;
6. two points the lecturer should revisit immediately during the practical; and
7. one caution about what cannot be inferred from this unmarked, honesty-based digital check.

Do not infer misconduct, programming ability, or overall course performance from a single response. Do not reproduce names or matric numbers in the report.
