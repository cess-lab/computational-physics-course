# Week 11 Lecture Slide Outline - Sensitivity and Uncertainty Propagation

Status: draft outline awaiting lecturer approval. This file is the only Week 11 slide-production artefact prepared at this stage. No deck specification, speaker notes, prompt jobs, slide images, run state, or PPTX should be created before the outline gate is approved.

Locked lecture model: ideal Hooke's law `x = F/k`; Core force `F = 10 N`; baseline stiffness `k = 100 N/m`; plausible stiffness range `95-105 N/m` represented by `[95, 100, 105] N/m`. Working exposure compares force `[9.8, 10.0, 10.2] N` at fixed `k = 100 N/m`.

## Slide 1: Sensitivity and Uncertainty Propagation

- Key points: Week 11 title; one physical question: how uncertain is a model prediction when one input is not known exactly?; physics-first chain from input range to output range.
- Visual idea: simple spring-load sketch paired with a compact `input range -> model -> output range` flow.
- Layout role: cover / physical context.
- Required source images: none.

## Slide 2: One Familiar Model, a New Question

- Key points: reuse Hooke's law `x = F/k`; fixed load `10 N`; Week 4 varied stiffness deliberately for comparison; Week 11 treats `k = 95-105 N/m` as plausible uncertainty around a `100 N/m` baseline.
- Visual idea: three stiffness values shown on a number line with `100 N/m` highlighted as baseline.
- Layout role: concept bridge from Week 4.
- Required source images: none; exact equation and units are strict content facts.

## Slide 3: Predict Before Computing

- Key points: lower `k` should give larger extension; higher `k` should give smaller extension; output range should straddle `0.10 m`; prediction comes from `x = F/k` before MATLAB.
- Visual idea: three small spring states ordered `95 -> 100 -> 105 N/m` with decreasing extension.
- Layout role: prediction.
- Required source images: none.

## Slide 4: Baseline, Lower, and Upper Values

- Key points: uncertain input needs a plausible range; use lower/baseline/upper cases; hold force, equation, units, and assumptions fixed; this is a controlled one-at-a-time comparison.
- Visual idea: compact table showing `k` cases and what remains fixed.
- Layout role: experimental-control explanation.
- Required source images: none.

## Slide 5: One-at-a-Time Algorithm

- Key points: define baseline and plausible range; hold the model and all other inputs fixed; evaluate lower/baseline/upper cases; collect the output range and validate the baseline; interpret the range without false precision.
- Visual idea: five-step horizontal algorithm with one highlighted changing input.
- Layout role: process / algorithm.
- Required source images: none.

## Slide 6: Trace the MATLAB Scaffold

- Key points: `stiffness_cases_Npm = [95 100 105]`; `extension_cases_m = force_baseline_N./stiffness_cases_Npm`; `min` and `max` produce the reported range; array shape and element-wise division reminder.
- Visual idea: short code block with arrows from input array to output array.
- Layout role: code tracing.
- Required source: `../../../Week11_Lecture_Demonstration_Hookes_Law_Uncertainty.m`, lines 23-27; strict text input preserving identifiers, operators, and units.

## Slide 7: What Range Does the Model Predict?

- Key points: baseline `0.10000 m`; range approximately `0.09524-0.10526 m`; smaller stiffness gives larger extension; the graph represents controlled parameter cases, not random repeated trials.
- Visual idea: quantitative graph with baseline marker and lower/upper stiffness cases.
- Layout role: data evidence.
- Required source images:
  - `../../matlab/week11_hooke_stiffness_uncertainty.png` - strict numerical reference for axes, units, values, curve/marker geometry, and baseline/range relationships; reference-only input for a future full-slide ImageGen redraw.

## Slide 8: Report the Result Without False Precision

- Key points: `0.10000 m` alone hides the supplied input range; practical statement should include load, stiffness range, predicted extension range, and model qualifier; extra decimal places do not reduce parameter uncertainty.
- Visual idea: side-by-side weak report versus defensible range-based report.
- Layout role: interpretation / communication.
- Required source images: none.

## Slide 9: Core Validation - Check the Baseline

- Key points: hand calculation `10/100 = 0.10 m`; unit check `N/(N/m) = m`; trend check lower `k` -> higher `x`; smooth output alone is not validation.
- Visual idea: green check card linking hand calculation, units, and trend.
- Layout role: validation.
- Required source images: none.

## Slide 10: Three Different Reasons a Prediction Can Be Imperfect

- Key points: parameter uncertainty = uncertain input value; numerical approximation error = finite timestep/grid/iteration; model limitation = equation assumptions do not fully represent reality; the direct Hooke calculation here has no timestep/grid/iteration approximation error; keep these categories separate.
- Visual idea: three-column comparison using spring examples.
- Layout role: concept comparison.
- Required source images: none.

## Slide 11: Working Exposure - Compare a Second Uncertain Input

- Key points: student modification: hold `k = 100 N/m` and vary `F = 9.8-10.2 N`; output range `0.098-0.102 m`; compare its full span with the stiffness-driven span; the supplied stiffness uncertainty produces the larger effect for these particular input ranges, not universally.
- Visual idea: two-bar comparison of output spans.
- Layout role: comparison / data evidence.
- Required source images:
  - `../../matlab/week11_one_at_a_time_comparison.png` - strict numerical reference for relative bar heights, axis units, and comparison; reference-only input for a future full-slide ImageGen redraw.

## Slide 12: Working Exposure - Percentage Sensitivity

- Key points: supplied normalized measure `S approx (Delta x/x0)/(Delta p/p0)`; near the baseline `S_k approx -1` and `S_F = +1`; sign gives direction while magnitude gives fractional responsiveness; interpretation only, no derivation required.
- Visual idea: two compact sensitivity cards with `-1` and `+1` and arrows indicating opposite/same direction.
- Layout role: Working-exposure concept.
- Required source images: none; formula and values are strict content facts.

## Slide 13: Working Exposure - Supplied First-Order Propagation

- Key points: supplied relation `u_x/x approx sqrt((u_F/F)^2 + (u_k/k)^2)` for independent small uncertainties; use `u_F = 0.2 N`, `u_k = 5 N/m`; combined estimate about `5.39%`, or `u_x approx 0.00539 m`; formula is supplied rather than derived.
- Visual idea: equation-to-numbers map with each relative uncertainty term labelled.
- Layout role: Working-exposure worked example.
- Required source images: none; equation, assumptions, units, and values are strict content facts.

## Slide 14: Exit Ticket - What Can You Defend?

- Key points: identify one uncertain input and plausible range; state what must stay fixed in a one-at-a-time sweep; name the output range; distinguish parameter uncertainty from numerical error and model limitation; state one practical conclusion without false precision.
- Visual idea: three response cards for range, source classification, and physical conclusion.
- Layout role: summary / exit ticket.
- Required source images: none.

## Required Source-Image Mapping

| Slide | Asset | Role | Treatment |
| --- | --- | --- | --- |
| 7 | `../../matlab/week11_hooke_stiffness_uncertainty.png` | Quantitative stiffness-to-extension evidence | Strict numerical reference only; preserve axes, units, values, ordering, and marker relationships in any later redraw. |
| 11 | `../../matlab/week11_one_at_a_time_comparison.png` | Quantitative comparison of supplied one-at-a-time output spans | Strict numerical reference only; preserve relative magnitudes, units, and category meaning in any later redraw. |

No generated slide image or PPTX is authorized by this outline. Future production must stop here until the lecturer approves the outline and source-image mapping.
