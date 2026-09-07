# Week 10 Lecture Live Script QA

The student-facing lecture demonstration was checked with MATLAB Code Analyzer and executed from top to bottom in a separate fresh MATLAB R2026b Prerelease process. Code Analyzer reported only intentional unsuppressed outputs used for teaching; it reported no error or warning requiring repair.

Fresh-process validation is retained in `lecture_validation.log` and emitted `WEEK10_LECTURE_FRESH_RUN_PASSED`.

Validated locked evidence:

- model: 100 independent steps per trial, step length `1 mm`, equal left/right probability;
- teaching seed: `rng(4605,'twister')`;
- 10,000-trial mean final position: `-0.1280 mm`;
- 10,000-trial spread: `9.9423 mm`;
- ideal supplied spread reference: `10 mm`, ratio `0.9942`;
- sample-size means for 100, 1,000, and 10,000 trials: `0.040`, `0.066`, and `-0.128 mm`;
- sample-size spreads: `10.6320`, `9.8122`, and `9.9423 mm`;
- supplied standard errors of the mean: `1.0632`, `0.3103`, and `0.0994 mm`;
- symmetry check passed and every 100-step final position satisfied the even-integer step rule.

The strict reference generator emitted `WEEK10_REFERENCE_ASSETS_PASSED` and retains the trajectory, final-position histogram, sample-size plot, and CSV summaries under `.agent/matlab/`.

No separate ImageGen illustration is justified in the Live Script. Native MATLAB figures expose the random trajectory, repeated distribution, and sample-size evidence more precisely.

Source-format checks passed: exactly one H1, no heading deeper than H3, exactly one blank line immediately before the plain-text Live Script appendix, and no `.mlx` student-facing copy.
