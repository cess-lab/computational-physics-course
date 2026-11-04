# Week 12 Individual Check - Question Key and AI Analysis

This is a **draft question/analysis specification only**. Week 12 is a formative capstone-studio checkpoint. Do not create the live Google Form or Classroom coursework until the lecturer approves the Week 12 materials, diagnostic wording, and whether a diagnostic is needed for the released activity.

## Suggested six-question diagnostic

1. **Physical prediction - multiple choice.** For `dT/dt = -(T-T_env)/tau` with an object at `80 degrees Celsius` in a `20 degrees Celsius` room, what should the trajectory do? **Key:** start at `80 degrees Celsius`, decrease toward `20 degrees Celsius`, and flatten as the temperature difference becomes smaller.
2. **Units/scaling - multiple choice.** In the Euler update `T_next = T_current + dt*[-(T_current-T_env)/tau]`, which unit statement is correct? **Key:** the rate is degrees Celsius per second, `dt*rate` is a temperature change, and it can be added to the current temperature.
3. **Method/algorithm reasoning - multiple choice.** A question asks for a temperature history from a supplied rate law and initial condition. Which learned method is the best match? **Key:** a forward Euler ODE update using the current state, current rate, timestep, and initial condition.
4. **Defect diagnosis - multiple choice.** A supplied Euler script changes the cooling rate to `+(T-T_env)/tau`. What is the main diagnosis? **Key:** a physical/model sign defect that makes a warm object heat away from the room; it is not a MATLAB syntax error.
5. **Validation reasoning - short response.** State one validation for the Week 12 cooling comparison and explain what it demonstrates. **Expected answer:** compare both Euler endpoints at the same final time with the supplied exact endpoint `28.1201 degrees Celsius`; the `10 s` timestep is closer than the `20 s` timestep for this case. Also state that this tests the numerical implementation for the supplied model and does not prove every real-world cooling assumption. Accept a specific initial-value, trend/bound, or second-check answer with its purpose.
6. **Confidence - linear scale 1-5.** Use the same fixed confidence labels as other weeks; there is no correct value.

## Intended evidence

| Category | Expected response | Misconceptions to tag |
| --- | --- | --- |
| Physical prediction | Cooling moves toward the environment, with a decreasing rate magnitude as the temperature gap shrinks. | Heating away from the room; constant drop per step; confusing final-time endpoint with the whole trajectory |
| Units/scaling | Rate in degrees Celsius per second; timestep times rate in degrees Celsius; state remains a temperature. | Adding a rate directly to a temperature; treating `tau` as dimensionless; using the final time as the step |
| Method/algorithm reasoning | A state history from a rate law maps to an Euler ODE route; current state produces next state. | Choosing a parameter sweep because an array is present; choosing integration for a rate law; ignoring the initial condition |
| Defect diagnosis | A plus sign reverses the physical direction while remaining syntactically valid. | “No error means correct”; syntax-only diagnosis; believing one initial-value check catches the sign defect |
| Validation reasoning | Same-time exact-reference comparison, refinement, initial value, or trend/bound check stated with its scope and limitation. | Reference treated as the method; endpoint agreement said to prove every intermediate state; polished graph used as sole evidence |
| Confidence | Use for calibration only. | High-confidence incorrect and low-confidence correct responses are both useful teaching signals |

## Suggested AI-analysis prompt

Analyse the anonymised Week 12 responses as a cohort diagnostic. Do not grade or rank individual students. Report:

1. response count and missing-data issues;
2. the percentage selecting each option for the four conceptual questions;
3. the three most common misconceptions, with response counts;
4. a short thematic coding of validation answers into exact/reference comparison, timestep refinement, initial condition, physical trend/bound, endpoint-only, graph-only, code-ran-only, and unclear;
5. confidence calibration, especially high-confidence incorrect and low-confidence correct patterns;
6. two points the lecturer should address during the integrated method-selection/capstone studio; and
7. one caution about what cannot be inferred from this formative, ungraded diagnostic.

Do not infer misconduct, general programming ability, or overall course performance from one diagnostic. Do not reproduce names or matric numbers in the report.
