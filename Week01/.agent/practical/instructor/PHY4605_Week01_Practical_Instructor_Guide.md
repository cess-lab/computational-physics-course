# PHY4605 Week 01 Onramp Diagnostic — Instructor Guide

Keep this file under `.agent`. It supports the practical `Week01_Practical_Onramp_Diagnostic.m`, which uses Newton cooling to diagnose MATLAB Onramp fluency without turning PHY4605 into a syntax course.

## Intended evidence

Students should demonstrate that they can:

- predict a physically sensible temperature curve before computing;
- map parameters and units into readable MATLAB variables;
- construct and inspect arrays;
- use element-wise operations and logical indexing;
- explain a simple loop as a state update;
- diagnose plausible but defective AI-generated code;
- validate initial values, limits, trends, bounds, and grid choices; and
- distinguish executable code from credible physical evidence.

## Delivery and accountability

1. Ask every student to submit the `Week 01` section of the course-wide Google Form before opening MATLAB, consulting notes or AI, or discussing with the group.
2. Do not mark the individual form. Review its aggregate response pattern and use one or two common misconceptions for a short whole-class debrief.
3. Let groups of two or three continue together, rotating model, implementation, and validation roles.
4. Require group predictions before each parameter modification in the practical.
5. Ask one randomly selected student per group to explain the model, one array operation, one loop update, and one validation check.
6. Require a concise AI decision record when AI materially influenced the work.

The canonical form configuration, Week 1 answer key, misconception tags, and AI-analysis prompt are stored at the course level under `.agent/google-forms/`.

## Checkpoint prompts

### Prediction and model

- Why must the curve begin at `80 degC` and approach `22 degC`?
- Can this model cross below room temperature for the chosen positive parameters?
- Why must `k_per_min*t_min` be dimensionless?

Expected reasoning: the initial condition gives `T(0)=T0`; the exponential term tends to zero at long times; with `T0 > Tenv` and positive `k`, the analytical model remains above `Tenv`; `k` has units `1/min` and time has units `min`.

### Arrays and indexing

- How many stored samples and update intervals are in `0:2:60`?
- What does `t_min(1)` represent physically?
- Why does the reported threshold time depend on the sampling interval?

Expected reasoning: there are 31 stored samples and 30 intervals; the first element is time zero; logical indexing identifies the first stored time satisfying the condition, not the continuous crossing time.

### Loop and algorithm

- Which value is the current state, and which line produces the next state?
- Why is the Euler result different from the analytical reference?
- What prediction should be made before reducing `dt_min`?

Expected reasoning: `T_euler_C(n)` is the current value and the assignment to index `n+1` performs the update. Forward Euler approximates the continuous change over a finite step, so the error should generally decrease as the step is refined for this baseline case.

### AI-output diagnosis

The displayed candidate contains several defects. Strong responses should identify at least three of these:

- `0:60:2` creates the wrong or empty progression; the intended array is `0:2:60`;
- division by `t_min` is physically and mathematically wrong and introduces division by zero;
- the exponential should use `-k_per_min.*t_min`;
- element-wise multiplication is required for array evaluation;
- `plot(T_C,t_min)` reverses the intended axes; and
- the candidate provides no labels, units, threshold logic, or validation.

## Suggested marking guide (20 marks)

| Criterion | Marks | Evidence |
| --- | ---: | --- |
| Prediction, physical model, assumptions, and units | 4 | Group prediction record; correct limits, assumptions, and dimensionless scale |
| Onramp operations and readable implementation | 4 | Correct array, vectorised expression, indexing, labelled plot, and reproducible variables |
| Algorithm and defect diagnosis | 4 | Loop explained as a state update; candidate defects linked to consequences and corrections |
| Validation evidence | 5 | Initial value, trend, bounds, grid, reference comparison, and one additional justified check |
| Interpretation, contribution, and AI judgement | 3 | Physical conclusion, limitation, named contribution, and material-use record |

Do not award full validation marks for a smooth plot alone. Code polish and exact syntax should not outweigh the model, algorithm, evidence, and explanation.

## Baseline instructor values

For `T0_C = 80`, `Tenv_C = 22`, `k_per_min = 0.08`, `tMax_min = 60`, and `dt_min = 2`:

| Quantity | Baseline value |
| --- | ---: |
| Stored samples | 31 |
| Update intervals | 30 |
| Exact temperature at 60 min | approximately `22.477 degC` |
| First stored time within `1 degC` of the room | `52 min` |
| Continuous analytical crossing of the `1 degC` threshold | approximately `50.76 min` |
| Euler temperature at 60 min | approximately `22.310 degC` |
| Maximum Euler-reference difference on the grid | approximately `1.833 degC` |

## Validation record

The companion `.agent/practical/source/validate_onramp_diagnostic.m` checks the grid, dimensionless scale, analytical initial value, long-time trend and bounds, threshold index, Euler finiteness, and the baseline numerical values. Course-wide and artefact-level QA outcomes are recorded in `.agent/qa/Week01_Validation_Record.md`.
