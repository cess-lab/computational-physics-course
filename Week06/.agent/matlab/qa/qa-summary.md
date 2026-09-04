# Week 06 MATLAB QA Summary

## Fresh-session execution

- Lecture demonstration: PASS.
- Student practical baseline: PASS.
- Hidden practical reference: PASS.
- Learning-note figure generation: PASS.

Locked lecture results from the fresh-session run:

- analytic velocity at `t0 = 1.0 s`: `10.19 m/s`;
- forward estimate with `h = 0.50 s`: `7.7375 m/s`;
- forward estimate with `h = 0.20 s`: `9.2090 m/s`;
- forward estimate with `h = 0.10 s`: `9.6995 m/s`;
- forward estimate with `h = 0.05 s`: `9.94475 m/s`;
- smallest-step absolute error: `0.24525 m/s`;
- smallest-step relative error: `2.4068%`;
- central-difference Working-exposure result: `10.19 m/s` to floating-point precision.

Hidden practical reference checks pass for the vertical-motion step-size trend, denominator-defect diagnosis, electric-field sign/reference comparison, cooling-rate sign/reference comparison, and central-versus-forward comparison.

## MATLAB Code Analyzer

`Week06_Practical_AI_Enabled_Numerical_Differentiation_Challenge_Set.m` returns no Code Analyzer messages.

`Week06_Lecture_Demonstration_Numerical_Differentiation_of_Vertical_Motion.m` returns only `NOPTS` suggestions to add semicolons. These are intentional because named numerical outputs and evidence tables are displayed for teaching. No substantive Code Analyzer defect is reported.

## Plain-text Live Script structure

Both student-facing `.m` files contain exactly one blank line immediately before the `%[appendix]` block, use the required heading directives, and remain plain-text Live Scripts rather than `.mlx` files.

## Runtime note

The local MATLAB R2026b prerelease launcher emits a non-fatal startup prelude concerning its application path and a protected directory. MATLAB nevertheless exits successfully with status 0 and all Week 06 assertions pass. The prelude is retained verbatim in the QA logs rather than hidden.
