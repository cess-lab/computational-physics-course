# Week 10 Practical QA

The student-facing practical and hidden instructor reference were executed successfully in MATLAB R2026b Prerelease. The student practical also completed in a separate fresh MATLAB process and emitted `WEEK10_PRACTICAL_FRESH_RUN_PASSED`; the log is retained in `practical_baseline_validation.log`. Code Analyzer reported only intentional visible outputs used for teaching.

Validated baseline evidence:

- photon context: expectation `26` detected photons from 40 at `p = 0.65`; seeded 2,000-trial mean `25.9320` and spread `2.9306`; resetting seed `1010` reproduced the same sequence and seed `1011` produced a different valid sequence;
- shielding context: analytic transmission `exp(-0.8*1.5) = 0.3012`; seeded estimates for 200, 2,000, and 20,000 particles are `0.3350`, `0.3140`, and `0.3065`, with final absolute error about `0.0053`; the deliberately faulty threshold `mu*x = 1.2` produces transmission fraction `1` as intended for diagnosis;
- 2D random walk: 80 steps of `0.5 mm`, 1,000 repeated paths; mean final coordinates `-0.1730 mm` and `-0.2000 mm`; RMS radial displacement `4.3822 mm` versus supplied ideal reference `4.4721 mm`;
- hidden reference emitted `WEEK10_PRACTICAL_REFERENCE_PASSED`.

The practical contains ten progressive micro-challenges across three supplied contexts, a concise AI decision record, independent checks, fresh-session confirmation, and a compact Week 10 capstone process checkpoint. The post-submission A/B variant bank, 8-mark defence rubric, event ledger, and member-summary template are retained under `.agent/practical/`.

Source-format checks passed: exactly one H1, no heading deeper than H3, exactly one blank line immediately before the appendix, and no `.mlx` student-facing copy.

The canonical weekly Form mapping was checked before drafting the diagnostic. Only Week 01 and Week 02 are currently registered; Week 10 remains a local unpublished diagnostic draft.
