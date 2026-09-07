# Week 09 Practical QA

The student-facing practical was checked with MATLAB Code Analyzer and executed from top to bottom in a separate MATLAB R2026b Prerelease Update 3 process. Code Analyzer reported only intentional unsuppressed teaching outputs. The fresh batch completed with exit code 0 and emitted `WEEK09_PRACTICAL_FRESH_RUN_PASSED`; the launcher path warnings that precede MATLAB startup are retained in `practical_baseline_validation.log`.

The hidden instructor reference also ran successfully and emitted `WEEK09_PRACTICAL_REFERENCE_PASSED` after one stale over-tight reference constant was corrected to the actual MATLAB result.

Validated reference evidence includes:

- spring fit `k = 25.0595 N/m`, offset about `0.00107 N`, residual RMSE about `0.01103 N`;
- cart linear-model RMSE about `0.17258 m` versus supplied quadratic-model RMSE about `0.01450 m`, with inferred acceleration about `0.09929 m/s^2`;
- deliberate cart data-entry defect correctly identifies the `t = 4 s` point, with largest absolute residual about `0.69036 m`;
- pendulum linearisation gives `g = 9.84135 m/s^2` with residual RMSE about `0.00885 s^2`, within `0.1 m/s^2` of the supplied `9.81 m/s^2` reference.

The practical contains ten progressive challenges across spring calibration, cart motion, and pendulum timing. The optional quadratic cart comparison is removable Working exposure. Every challenge has a defence hook; the A/B variant bank covers all ten slots; the event ledger and member summary preserve the first-defence rotation rule.

The canonical Classroom/Form mapping was checked before finalising the diagnostic draft. It currently maps Week 01 and Week 02 only, so Week 09 remains an unpublished local draft. No Google Form, Classroom item, notification, upload, or external action was performed.

Source-format checks passed: exactly one H1, no heading deeper than H3, exactly one blank line immediately before the appendix, and no `.mlx` student-facing copy.
