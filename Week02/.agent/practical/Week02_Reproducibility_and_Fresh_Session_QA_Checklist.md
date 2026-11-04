# Week 02 Reproducibility and Fresh-Session QA Checklist

## Instructor reference check

- [ ] `Week02_Practical_Reference.m` is run as a complete script in MATLAB R2025a or later with base MATLAB only.
- [ ] No result depends on a pre-existing Workspace variable, current figure, or hidden path.
- [ ] Cooling checks pass: 17 samples; `T(0)=85 °C`; `T(16 s)=26.098938 °C`; doubled `tau=8 s` gives `T(16 s)=33.120117 °C` and a slower response.
- [ ] Decay checks pass: `lambda=0.115524530 h^-1`; `N(0)=800`; `N(6 h)=400`; `N(24 h)=50`.
- [ ] Oscillator checks pass: `x(0)=0.080 m`; `x(0.40 s)≈0 m`; negative displacement is interpreted as direction, not negative distance.
- [ ] The three plots are labelled with physical quantities and units and show the expected cooling, decay, and oscillation trends.

## Student packet check

- [ ] Group identification and MATLAB release are recorded; the group code appears in its own section after each challenge as requested.
- [ ] All ten questions are present and the final copy was run top-to-bottom from a fresh session before submission.
- [ ] Q2 uses `t_cool_s=0:1:16` s and a six-step plan; Q3 traces the first two passes and labels its graph.
- [ ] Q4 changes only `tau_s`, predicts first, reruns, and includes the initial-value/long-time evidence.
- [ ] Q5 records the missing-`end` diagnostic and then restores the code; Q6 keeps defective and repaired outputs distinguishable.
- [ ] Q7 states the units of `lambda_per_h` and checks the half-life; Q8 compares the wrong sign with the corrected sign and checks 6 h.
- [ ] Q9 includes the loop, labelled plot, initial and quarter-period checks, and signed-displacement explanation.
- [ ] Q10 compares the repeated loop pattern, identifies a defect requiring physics evidence, and includes the concise AI record or `AI not used` statement.

## Record before accepting

| Field | Record |
| --- | --- |
| Group ID |  |
| Fresh-session date / MATLAB release |  |
| Reference or student run outcome | PASS / DIAGNOSIS |
| Missing or unresolved evidence |  |
| Follow-up required |  |

If a full run cannot complete, preserve the exact error, location, and surrounding line. Do not invent numerical evidence; award diagnosis evidence only when the explanation is precise.
