# Week 08 Individual Check - Question Key and AI Analysis

This is a **draft question/analysis specification only**. Do not create the live Google Form or Classroom coursework until the lecturer approves the Week 08 materials and diagnostic wording.

## Suggested six-question diagnostic

1. **Physical prediction - multiple choice.** A `12 V` capacitor discharges through `R = 1000 ohm` and `C = 0.002 F` using `dV/dt = -V/(RC)`. What should happen initially? **Key:** the voltage decreases from `12 V` with an initial rate of `-6 V/s` and approaches `0 V`.
2. **Units/scaling - multiple choice.** In the same model, which statement is dimensionally correct? **Key:** `R*C` has unit seconds and `-V/(R*C)` has unit volts per second, so `dt*(dV/dt)` is a voltage change.
3. **Algorithm/code reasoning - multiple choice.** In an Euler loop, which storage pattern correctly represents one step? **Key:** calculate the rate from the current state `V(n)` and write the next state to `V(n+1)`; index 1 stores the initial value at `t = 0`.
4. **Numerical/defect diagnosis - multiple choice.** A passive-discharge loop uses `+V(n)/(R*C)` instead of `-V(n)/(R*C)`. What is the main defect? **Key:** a physical/logical sign defect that makes the voltage grow away from zero even though MATLAB can run the code.
5. **Validation reasoning - short response.** State one Core validation for an Euler ODE trajectory and explain what it tests. **Expected answers:** compare equal-final-time results for smaller supplied timesteps with the exact/reference solution; check the initial value and the expected physical trend or bound; or use an equivalent check with a clear purpose. A response should distinguish numerical accuracy from merely obtaining a smooth graph.
6. **Confidence - linear scale 1-5.** Use the same fixed confidence labels as other weeks; there is no correct value.

## Intended evidence

| Category | Expected response | Misconceptions to tag |
| --- | --- | --- |
| Physical prediction | A positive discharge voltage falls toward zero; the initial rate is negative and has unit V/s. | Positive derivative for a discharge; constant voltage drop per interval; voltage and rate treated as the same quantity |
| Units/scaling | `R*C` is a time constant in seconds; rate is V/s; rate times timestep is V. | Treating `R*C` as dimensionless; reporting rate in V; adding a rate directly to a voltage without multiplying by time |
| Algorithm/code reasoning | Read the current state, calculate its current rate, and store the next state; index 1 is the initial condition. | Reusing the initial state at every step; writing to `n` instead of `n+1`; confusing timestep with final time |
| Numerical/defect diagnosis | The wrong sign reverses the physical direction and can be exposed by a trend/bound check before an exact comparison. | Syntax-only diagnosis; “the code ran”; assuming the initial-value check alone validates the trajectory |
| Validation reasoning | A specific initial/trend, reference, or timestep-refinement check linked to the claim being tested. | Smooth graph as proof; smaller timestep automatically exact; checking only the starting value |
| Confidence | Use for calibration only. | High-confidence incorrect and low-confidence correct responses are both useful teaching signals |

## Suggested AI-analysis prompt

Analyse the anonymised Week 08 responses as a cohort diagnostic. Do not grade or rank individual students. Report:

1. response count and missing-data issues;
2. the percentage selecting each option for the four conceptual questions;
3. the three most common misconceptions, with response counts;
4. a short thematic coding of validation answers into initial condition, physical trend/bound, exact/reference comparison, timestep refinement, smooth-graph-only, code-ran-only, and unclear;
5. confidence calibration, especially high-confidence incorrect and low-confidence correct patterns;
6. two points the lecturer should address before or during the ODE practical; and
7. one caution about what cannot be inferred from this ungraded diagnostic.

Do not infer misconduct, general programming ability, or overall course performance from one diagnostic. Do not reproduce names or matric numbers in the report.
