# Week 12 Instructor Reference and Rehearsal Variants

Local instructor support, not a student submission or a confidential examination. Week12 studio is formative. Match this guide to the final practical Live Script and use its existing group evidence record; do not require a second long report.

## Challenge Reference

| Slot | Expected evidence | Follow-up / common misconception |
| --- | --- | --- |
| 1 | A: parameter sweep; B and C: Euler ODE. The method follows the required input-output relationship. | A trajectory and a parameter sweep answer different questions, even when both produce graphs. |
| 2 | Choose one rehearsal context with inputs/output units and one stated limitation. Keep the already approved capstone choice. | RC: volts, ohms, farads and seconds; constant ideal components. Decay: expected count, hours and inverse hours; deterministic mean does not predict every random observed count. |
| 3 | Trace input -> array -> model calculation/update -> output -> check. For Euler, read current index n and write n+1. | Index 1 represents the initial time, not the first elapsed interval. |
| 4 | At 45 degrees, baseline projectile range is `18^2/9.81 = 33.027523 m`; the supplied 20 m/s variant is `40.774720 m`. Student modification to 22 m/s gives `49.337411 m`. Units: `(m/s)^2/(m/s^2)=m`. Complementary angles give equal ranges. | Range scales with the square of speed in this model; no drag and equal launch/landing heights are assumptions. |
| 5 | RC time constant is `2000*0.001=2 s`. Correct first step is `0.625 V`; wrong-sign first step is `-0.625 V`. At 8 s, corrected Euler gives `4.9303008 V`; exact reference gives `4.9084218 V`. Wrong-sign endpoint is `-211.6959141 V`, exposing the physical defect. | The supplied exact expression assumes initial voltage zero; changing initial voltage also requires the general reference `Vs+(V0-Vs)*exp(-t/tau)`. |
| 6 | Decay rate constant is `log(2)/6 per h`. At 6 h, Euler gives `489.695277` expected count versus exact `500`; fraction of initial count is `0.489695277`. Fractional discrepancy from 0.5 is `0.010304723`, below the supplied 0.03 teaching tolerance. | Fraction-of-initial discrepancy is not the relative error against 500; state which denominator is used. It is numerical approximation error, not measurement uncertainty. |
| 7 | RC absolute endpoint error is `0.021879009 V`. Exact expression is reference; Euler is approximate. Endpoint agreement alone does not test every intermediate point or physical-model assumption. | Initial-condition agreement alone cannot detect the supplied sign defect. |
| 8 | Name the lecturer-required and group-chosen checks, each with numerical or other concrete evidence and its purpose/limit. | Two labels for the same calculation do not necessarily provide distinct evidence. |
| 9 | All capstone rows link to the approved starter and existing investigation, including one modification, principal output, both checks, interpretation and limitation. | Do not replace a nearly completed capstone with a new problem in the studio. |
| 10 | Concise AI decision record, fresh-session evidence and every member's trace/follow-up. Evidence remains DRAFT until completed and explicitly locked. | An absence is pending; two-member groups mark the third row not applicable. Rehearsal is not a new graded entry. |

Numerical baseline evidence was produced in separate fresh MATLAB R2026b Prerelease Update 3 processes; CSVs and logs are in `../matlab/`. The 22 m/s reference follows direct substitution in the supplied analytic formula.

## Post-Lock Variant Bank

Draw only after evidence is locked. A variant is a short explanation or calculation, not an unannounced new investigation. Use distinct variants when reusing a slot. For more repetitions, change the named parameter within the supplied model and record the exact variant. Preserve the prior rotation ledger and pending absences.

| Slot | Variant A | Variant B |
| --- | --- | --- |
| 1 | Match displacement from supplied velocity samples to integration. | Match temperature trajectory from a supplied rate to Euler ODE. |
| 2 | State RC output units and the assumption of fixed supply. | State projectile output units and the equal-height assumption. |
| 3 | Trace the first RC step: `0+0.25*(5-0)/2=0.625 V`. | Trace the second RC step: `0.625+0.25*(5-0.625)/2=1.171875 V`. |
| 4 | Predict the 45-degree range at 22 m/s: `49.337411 m`. | Explain equality at 35 and 55 degrees from `sin(70)=sin(110)`. |
| 5 | Omit the timestep factor: the increment has units V/s rather than V. | Reverse the sign: the initially uncharged capacitor moves below 0 V. |
| 6 | With half-life 12 h, exact count at 6 h is `1000/sqrt(2)`, about `707.107`. | With initial count 2000 and half-life 6 h, exact count at 6 h is 1000. |
| 7 | Explain why checking only the initial value misses a wrong update. | Explain why an exact solution does not validate all real component assumptions. |
| 8 | Defend a bound check as the chosen check and state what it misses. | Defend timestep refinement as the chosen check and distinguish numerical from physical changes. |
| 9 | Identify exactly which input file another group needs. | Identify the one parameter modification and its predicted physical effect. |
| 10 | Explain one accepted AI suggestion and the independent check used. | Explain one modified/rejected suggestion and why the group's evidence overruled it. |

Use `Week12_Studio_Defence_Guide.md` for feedback and `Week12_Formative_Rehearsal_Ledger.csv` for readiness records. Do not populate student names, marks or attendance without real evidence.
