# Week 05 MATLAB QA Summary

## Fresh-session execution

- Lecture demonstration: PASS.
- Student practical baseline: PASS.
- Hidden practical reference: PASS.
- MATLAB residual-plot generation: PASS.

Final locked lecture results from the fresh-session run:

- `f(20 degree) = -8.7905 m` approximately;
- `f(40 degree) = +5.1553 m` approximately;
- bisection root `29.5679 degree`, residual `+4.1164e-4 m`, 13 recorded iterations;
- Newton root `29.5673 degree`, residual `-7.1308e-7 m`, 4 recorded evaluations;
- substituted model range `35.0004 m`.

Hidden practical reference checks also pass for the projectile bisection/Newton agreement, bad same-sign bracket diagnosis, thin-lens image-distance root, and RC threshold-time root.

## MATLAB Code Analyzer

`Week05_Practical_AI_Enabled_Root_Finding_Challenge_Set.m` returns no Code Analyzer messages.

`Week05_Lecture_Demonstration_Root_Finding_for_Projectile_Range.m` returns only `NOPTS` suggestions to add semicolons. These are intentional because the lecture Live Script exposes named numerical outputs and trace tables as teaching evidence. No substantive Code Analyzer defect was reported.

## Runtime note

The local prerelease MATLAB launcher emits a non-fatal startup prelude concerning the application path before normal execution. MATLAB still exits successfully with status 0 and all Week 05 assertions pass; the messages are retained verbatim in the QA logs rather than suppressed.
