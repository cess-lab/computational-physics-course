# Week 11 Post-Submission Variant Bank

Use variants only after the group file is locked. Assign one challenge slot and either Variant A or B below. If a slot is reused for another group, use the other variant and record the exact variant ID in the event ledger. Keep the defence on one-at-a-time parameter uncertainty, output ranges, source classification, validation, and physical meaning.

| Challenge slot | Variant A | Variant B | Expected answer guidance |
| --- | --- | --- | --- |
| 1 | Resistance range changes to `98-102 ohm`. What happens to the current range compared with `95-105 ohm`? | Baseline voltage changes from `12 V` to `10 V` while resistance range remains `95-105 ohm`. What happens to current scale? | A: narrower resistance range gives a narrower current range. B: all currents scale down with voltage; direction with resistance is unchanged. |
| 2 | At `R = 100 ohm`, calculate the hand-check current for `12 V`. | Student swaps `V/R` to `V*R`. Name two checks that expose the defect. | A: `0.12 A`. B: units and physical trend/magnitude expose it. |
| 3 | Voltage uncertainty narrows to `11.9-12.1 V`. Which one-at-a-time current span changes? | Resistance and voltage are both changed in one run. Can the output difference be attributed to one input? | A: voltage-driven span narrows. B: no; the causes are confounded for one-at-a-time attribution. |
| 4 | A calculator prints ten decimals. Does that reduce uncertainty in `R`? | A finite timestep changes a simulated current transient. Which source category is this? | A: no; display precision does not improve parameter knowledge. B: numerical approximation error. |
| 5 | Pendulum length range changes to `0.99-1.01 m`. What happens to the period range? | Length increases while `g` is fixed. Should period increase or decrease? | A: period range narrows. B: increase because `T` grows with `sqrt(L)`. |
| 6 | A large-amplitude pendulum disagrees with the small-angle formula even with exact arithmetic. Which source category? | The measured length is uncertain by `2 cm`. Which source category? | A: model limitation. B: parameter uncertainty. |
| 7 | Attenuation coefficient increases from `0.80` to `0.90 cm^-1`. Should transmitted rate rise or fall? | `mu` is entered in `m^-1` while thickness remains in cm. Which check should be made first? | A: fall. B: unit consistency before computing the exponent. |
| 8 | Thickness range doubles while `mu` range is unchanged. Which one-at-a-time span should be recomputed? | Both `mu` and thickness are changed together. What question does that answer compared with one-at-a-time analysis? | A: thickness-driven output span. B: a combined case, not the isolated contribution of either input. |
| 9 | In the supplied first-order Ohm formula, `uR/R` is larger than `uV/V`. Which term contributes more to the combined estimate? | Is the first-order formula required to complete the Core Week 11 route? | A: resistance term. B: no; it is Working exposure. |
| 10 | Choose one context and distinguish parameter uncertainty from model limitation. | Choose one capstone input and explain how a one-at-a-time check could improve Week 12 evidence. | Parameter uncertainty concerns plausible input values; model limitation concerns the adequacy/assumptions of the equation. Capstone response should name one input, held-fixed conditions, output, and evidence. |

Do not require derivative-based propagation derivations, Monte Carlo uncertainty propagation, interaction effects, global sensitivity methods, or correlated-input analysis for ordinary Week 11 defence marks.
