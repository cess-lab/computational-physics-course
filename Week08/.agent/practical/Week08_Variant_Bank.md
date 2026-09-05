# Week 08 Post-Submission Variant Bank

Use variants only after the group file is locked. Assign one challenge slot and either Variant A or B below. If a slot is reused for another group, use the other variant and record the exact variant ID in the event ledger. The expected guidance supports marking; students must still explain their own model, code, validation, and interpretation.

| Challenge slot | Variant A | Variant B | Expected answer guidance |
| --- | --- | --- | --- |
| 1 | `V0=9 V`: predict the initial slope. | `V0=6 V`: predict the initial slope. | `-4.5 V/s` for A; `-3.0 V/s` for B. Voltage decreases in both cases. |
| 2 | Use `dt=0.25 s`; trace the first two RC updates. | Use `dt=1.0 s`; trace the first two RC updates. | A: `12, 10.5, 9.1875 V`; B: `12, 6, 3 V`. |
| 3 | Set `R=2000 ohm`; compare exact voltage at 8 s. | Set `R=500 ohm`; compare exact voltage at 8 s. | A time constant is 4 s and exact `V(8)` is about `1.624 V`; B time constant is 1 s and exact `V(8)` is about `0.0040 V`. |
| 4 | Add `dt=1.0 s` to the RC refinement list. | Add `dt=0.0625 s` to the RC refinement list. | A final error is about `0.1729 V`, larger than at `0.5 s`; B must be smaller than the `0.125 s` error. |
| 5 | Replace the defect with `V(n+1)=V(n)-dt*V(n)/(R*C)`. | Reverse the sign in the model derivative only. | Both must be explained as the corrected negative slope; passive discharge cannot grow above `V0`. |
| 6 | Change drag to `0.50 kg/s`. | Change mass to `1.00 kg`. | A terminal velocity is `9.81 m/s`; B terminal velocity is `39.24 m/s`. |
| 7 | Use falling-object `dt=1.0 s`. | Use falling-object `dt=0.25 s`. | A has a larger final-time error than the `0.5 s` baseline; B error is about `0.08585 m/s`, smaller than the `0.5 s` result. |
| 8 | Change half-life to `8 s`. | Change half-life to `2 s`. | A `lambda` is about `0.08664 1/s`; B is about `0.34657 1/s`. |
| 9 | Use `N0=1200`. | Use `N0=400`. | Exact count after one half-life is `600` for A and `200` for B. |
| 10 | Choose RC discharge and state one model limitation plus a different validation check. | Choose falling velocity or decay and state one model limitation plus a different validation check. | Accept a physically accurate limitation and a usable reference, bound, initial-value, or timestep check; do not accept presentation or AI agreement alone. |

Do not require formal Euler stability boundaries, Runge-Kutta derivation, stiff-system methods, event handling, or a blank-page ODE implementation. Keep the defence on supplied first-order models, units, Euler update logic, timestep comparison, reference or bound checks, physical interpretation, and the concise AI decision record.
