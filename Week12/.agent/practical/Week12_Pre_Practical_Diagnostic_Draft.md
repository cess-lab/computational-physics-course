# Week 12 Pre-Practical Diagnostic — Draft for Approval

Purpose: formative readiness check for integrated method selection and capstone studio. This is a local instructor draft, not a published quiz. The canonical `.agent/google-forms/PHY4605_Classroom_Practical_Quiz_Forms.json` was checked on 6 September 2026: it contains no Week12 entry. Do not create a Form until the materials and questions are approved; recheck the mapping and live coursework before creation. Use one dedicated Week12 Form attached as native Form material to the corresponding Classroom quiz assignment. Keep Classroom ungraded. Collect verified institutional email when identification is needed; omit full-name, matric-number and week-selector questions.

Four conceptual MCQs may each carry one point inside the Form for response analysis. Short reasoning is reviewed formatively; confidence is unscored. No extra course assessment weight.

| Part | Student prompt and options | Key and misconception evidence |
| --- | --- | --- |
| Physical prediction | An object starts at 80 deg C in constant 20 deg C surroundings. The supplied model is `dT/dt=-(T-20)/100`, with time in seconds. Initially, temperature should: A rise; B fall toward 20 deg C; C stay at 80 deg C; D immediately become 20 deg C. | **B.** A suggests a sign misconception; D confuses a rate with an instantaneous change. |
| Units and scaling | The cooling rate has units deg C/s. What must multiply the rate to produce the temperature change in one Euler update? A time step in s; B temperature in deg C; C time step squared in s^2; D nothing. | **A.** Reinforce change = rate × interval. |
| Algorithm and code reasoning | Velocity samples `v` in m/s are supplied at times `t` in s. Which learned method estimates displacement over the sampled interval? A solve a linear system; B trapezoidal integration; C differentiate the velocity; D find the largest velocity. | **B.** Displacement is accumulated velocity; differentiation instead gives acceleration. |
| Defect diagnosis | At `T=80`, `dt=20`, the line `Tnext=T+dt*(T-20)/100` returns `92`. The model is `dT/dt=-(T-20)/100`. What is the clearest defect? A missing negative sign in the rate; B too many decimal places; C temperature should be in metres; D MATLAB cannot implement cooling. | **A.** A successfully executed statement can implement the wrong physical model. |
| Validation reasoning | A script produces a smooth cooling graph. Choose a check from this menu—initial condition, supplied exact-reference comparison, timestep refinement—and explain in one or two sentences what your check tests and one thing it does not establish. | Accept a correctly linked claim/check/limit: initial condition tests setup but not later updates; reference tests numerical agreement for the stated model but not real-world assumptions; refinement tests timestep sensitivity but does not by itself prove the physical model. Smoothness alone is insufficient. |
| Confidence calibration | How confident are you that you can match a familiar physical question to a method and justify one validation check? | Scale 1 (not yet confident) to 5 (very confident); unscored. Compare confidence with MCQ/reasoning evidence, not as a mark. |

## Optional Remediation — A Smooth Graph Is Not Validation

Offer only if the diagnostic exposes this misconception. Keep the planned lecture/studio schedule; this optional 10–15 minute Classroom activity is ungraded and is not a prerequisite.

1. Initial attempt: at 80 deg C, explain whether the stated cooling rate is positive or negative.
2. Worked correction: `-(80-20)/100=-0.6 deg C/s`; over 20 s the change is `-12 deg C`; the next value is `68 deg C`. The defective plus-sign line gives 92 deg C, contradicting the predicted direction even if its graph is smooth.
3. Retry: use `dt=10 s` at the same initial temperature. Predict the next temperature and name a relevant check before running code.
4. Reveal after the retry: `74 deg C`; the sign/trend check detects heating in place of cooling. An exact-reference comparison further checks numerical accuracy for the supplied model. The single Euler step need not equal the exact value.
5. Reflection: state the misconception corrected and repeat the confidence rating.

## Tutor Guidance

Use only approved course sources in NotebookLM. Ask one focused question at a time: required output -> model/units -> algorithm -> code trace -> independent validation -> physical interpretation. Give progressive hints and end with a changed-parameter transfer question. Collect the student's initial reasoning, revision, misconception and check through Classroom, not a full AI transcript. Do not upload confidential examination questions or marking schemes.
