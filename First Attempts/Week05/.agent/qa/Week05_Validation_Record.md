# PHY4605 Week 05 Validation Record

Date: 28 August 2026

## Package Status

- Week 05 topic follows the assessment blueprint: nonlinear root finding, bracketing, bisection, Newton's method, stopping criteria, residuals, failure modes, MATLAB `fzero`, and quantitative method comparison.
- The physical spine is Kepler's equation for an elliptic orbit, `E - e*sin(E) - M = 0`.
- Baseline parameters are `e = 0.70` and `M = 1.00 rad` across the learning note, lecture demonstration, practical, and validator.
- The high-eccentricity stress case is `e = 0.999`, `M = 0.15 rad`, `E0 = 0` across the learning note, lecture demonstration, practical, and validator.
- The lecture slide deck is intentionally excluded. No Week 05 slide deck or slide-source directory is part of this package.

## Cross-Artifact Model and Notation

- Kepler residual: `f(E) = E - e*sin(E) - M`.
- Derivative: `f'(E) = 1 - e*cos(E)`.
- Elliptic restriction: `0 <= e < 1`.
- Analytic bracket: `[M-e, M+e]`.
- Existence argument: endpoint residuals are non-positive/non-negative respectively and the residual is continuous.
- Uniqueness argument: `f'(E) >= 1-e > 0` for `e < 1`.
- Baseline reference root: approximately `1.6946389121 rad`.
- Stress mechanism: at `e = 0.999`, `M = 0.15 rad`, `E0 = 0`, the derivative is `0.001` and the first raw Newton step is `150 rad`.

## Learning Note

- Source: `.agent/learning-notes/source/Week05_Root_Finding_Bracketing_Newton_and_Reliability.tex`.
- Intended student PDF: `Week05_Root_Finding_Bracketing_Newton_and_Reliability.pdf` at the Week 05 top level, matching the Week 04 packaging convention.
- PDF compilation status: PASS. Compiled from a clean temporary build with Tectonic on 28 August 2026; final output is a 5-page A4 PDF. Compilation produced only underfull-box warnings in the comparison table and no overfull boxes or fatal errors.
- Rendered-page visual inspection status: PASS. All five pages were rasterized at 120 dpi and inspected as a contact sheet. Margins, page numbers, callout colours, code panels, equations, tables, and the final `Three takeaways` plus `Preparation for the practical` callout are legible with no clipping or overlap. Rendered QA evidence is retained under `.agent/learning-notes/rendered/`.

## MATLAB Live Scripts and Numerical Validation

- Student-facing scripts use the project plain-text Live Script convention with `%[text]`, `%%`, and a final `%[appendix]` block.
- Fresh-session lecture demonstration run: PASS in MATLAB R2026b prerelease; process exit code 0 and `WEEK05_LECTURE_DEMO_OK` reached.
- Fresh-session practical run: PASS in MATLAB R2026b prerelease; process exit code 0 and `WEEK05_PRACTICAL_OK` reached with all provided assertions passing.
- Independent `validate_week05_model.m` run: PASS in MATLAB R2026b prerelease; process exit code 0 and `WEEK05_MODEL_VALIDATION_OK` reached.
- Source-format QA: PASS. Each student-facing Live Script has exactly one H1, one blank line immediately before the final `%[appendix]{"version":"1.0"}` block, no `clear`, `clearvars`, `close all`, `clc`, explicit `figure(...)`, or `fprintf(...)`, and no `.mlx` duplicate. The lecture demonstration contains no `TODO`; the practical retains explicit student `TODO` records and an AI decision record.
- No additional MATLAB toolbox is required; the package uses base MATLAB including `fzero`.
- MATLAB launcher note: the local R2026b prerelease launcher emitted shell/path diagnostics before the MATLAB banner because the application path contains a space, but MATLAB itself started successfully and every validation command completed with exit code 0.

## Numerical Checks Completed by the Validator

- Baseline analytic bracket signs and monotonicity/uniqueness.
- Baseline agreement among explicit bisection, explicit Newton, and `fzero`.
- Baseline residual checks and bisection interval-width stopping evidence.
- Conservative theoretical bisection iteration bound.
- Invalid-bracket detection on `[0,0.1]` for the baseline residual.
- Stress-case derivative `0.001` and first Newton step `150 rad`.
- Stress-case agreement among bisection, safeguarded Newton, and `fzero`.
- At least one safeguarded fallback in the selected stress case.
- Observed baseline iteration counts: bisection `33`, Newton `6`, `fzero` `4`.
- Observed stress-case root: approximately `0.97925 rad`; bisection and safeguarded Newton agree, and safeguarded Newton used `3` midpoint fallbacks.

## Final Integrity

- Student-facing Week 05 folder contains only the README, learning-note PDF, lecture-demonstration Live Script, and practical Live Script, apart from MATLAB Drive metadata files.
- No Week 05 `.pptx`, `.key`, `.mlx`, or slide-named file was created.
- SHA256 `Week05/README.md`: `e4a016b6b2471e4588b2e7922263a25fe38fbaf2c2e74d71ba425b228ab93a5c`.
- SHA256 `Week05/Week05_Root_Finding_Bracketing_Newton_and_Reliability.pdf`: `51ea96191769d2ec258e0e34e2b409e20a265cc5673070e622ed126957daff56`.
- SHA256 `Week05/Week05_Lecture_Demonstration_Root_Finding_and_Kepler_Orbits.m`: `8c6f8c522322ccdcb132a34bf9fb8436a90f975dd2e24886eb3c8b23af53556e`.
- SHA256 `Week05/Week05_Practical_Compare_Root_Finders_for_Kepler_Equation.m`: `64e9e65790579ccd1c08f7fbe9eb9dce21a2dc19f65ae1299bc4db046d357967`.
- SHA256 learning-note LaTeX source: `724f7a7fa6c9a5b27069d18d399d7b73e1e43bc1d2d885e80a07cec4af2d8738`.
- SHA256 independent validator: `0dbee4fd4d0a238ebfaea083f0232dcbb6b62cebb3a8301e1e986154752988a7`.
