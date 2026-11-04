# Week 02 Post-Submission Defence Variant Bank

Assign variants only after the group submission is locked. Use one variant per group/slot, record the exact variant code and values in the ledger, and do not combine the two variants in a row. Keep the supplied model and method unchanged apart from the one listed change.

| Slot | Variant A | Variant B | Expected follow-up evidence |
| --- | --- | --- | --- |
| Q01 | `T0_C=65` °C; keep `T_room_C=25` °C and `tau_s=4.0` s. (`Q01-A-T0`) | `T_room_C=20` °C; keep `T0_C=85` °C and `tau_s=4.0` s. (`Q01-B-Room`) | Initial value, direction of change, and long-time limit are updated without changing the model. |
| Q02 | Use `t_cool_s=0:2:16` s: 9 samples. (`Q02-A-Step2`) | Use `t_cool_s=0:1:20` s: 21 samples. (`Q02-B-End20`) | Explain how the time grid changes sample count while `time/tau` remains dimensionless. |
| Q03 | Set `tau_s=2.0` s and trace the first two passes. (`Q03-A-Tau2`) | Trace the third pass of the baseline grid: index 3, current time 2 s, and its stored value. (`Q03-B-Pass3`) | Correct index/current-time pairing and a decreasing cooling trend. |
| Q04 | Set `tau_s=2.0` s; predict a faster response before rerun. (`Q04-A-TauHalf`) | Set `T0_C=65` °C and retain `tau_s=4.0` s. (`Q04-B-T0`) | Initial-value check remains valid; only the selected parameter changes the prediction. |
| Q05 | Remove the final `end` from the decay loop. (`Q05-A-MissingEndDecay`) | Remove the final `end` from the oscillator loop. (`Q05-B-MissingEndSpring`) | Identify the incomplete `for` block, capture location/surrounding line, restore `end`, and rerun. Exact error wording is not required. |
| Q06 | Store at `T_C(sample_index+1)` to expose a final-pass index error. (`Q06-A-Offset`) | Store at `T_C(2)` on every pass to expose repeated overwrite of one slot. (`Q06-B-FixedIndex`) | Explain whether the defect is a run-time index error or a runnable logical error, then repair to `T_C(sample_index)`. |
| Q07 | Set `half_life_h=3.0` h; the correct count at 6 h is 200. (`Q07-A-Half3`) | Set `N0_counts=1600`; retain a 6 h half-life, so the count at 6 h is 800. (`Q07-B-N01600`) | Update `lambda` units and the selected known half-life result; keep the negative exponent. |
| Q08 | Use the wrong-sign version with `half_life_h=3.0` h; explain correct versus wrong at 3 h. (`Q08-A-SignHalf3`) | Replace `current_time_h` in the exponent with `t_decay_h(1)` so the wrong output is flat. (`Q08-B-FixedTime`) | Name the physical/logical defect, state why MATLAB can run it, and use a half-life/trend check to repair it. |
| Q09 | Set `period_s=0.80` s; quarter period is 0.20 s. (`Q09-A-Period08`) | Set `A_m=0.120` m; initial displacement changes but quarter-period displacement remains near zero. (`Q09-B-Amplitude12`) | Trace the assigned parameter's effect and retain the initial and quarter-period checks. |
| Q10 | Ask which check best exposes the wrong decay sign and justify it with the 6 h result. (`Q10-A-DecayCheck`) | Ask which check best exposes repeated `T_C(1)` storage and justify it using output length/zeros. (`Q10-B-IndexCheck`) | Compare contexts, name the physical evidence needed beyond an error message, and state the AI decision/check record. |

For cohorts with more groups than slots, reuse a slot only with a distinct variant and record it before the defence begins. Do not use a variant that introduces new numerical theory, an unfamiliar physical model, or a second simultaneous parameter change.
