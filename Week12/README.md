# Week 12 — Integrated Method Selection and Capstone Studio

Use familiar methods to answer a physical question, audit supplied code, and prepare a result that another person can reproduce and each group member can explain. No new numerical method is introduced.

## Materials

- [Learning note](Week12_Learning_Note_Integrated_Method_Selection_and_Capstone_Studio.pdf): method recognition, a worked cooling-code audit, validation, and capstone preparation.
- [Lecture slides](Lecture_Slides_Week12.pptx): 14-slide Teaching Courseware deck covering method selection, Euler tracing, validation, controlled modification, capstone evidence, and defence rehearsal.
- [Lecture demonstration](Week12_Lecture_Demonstration_Integrated_Method_Selection.m): complete lecturer-led MATLAB example with Euler timesteps and a supplied exact cooling reference.
- [Formative practical and capstone studio](Week12_Practical_Integrated_Method_Selection_and_Capstone_Studio.m): ten progressive challenges using projectile range, RC charging and radioactive decay, followed by completion and defence rehearsal using the group's approved capstone starter.

## Learning Focus

1. Match the required physical output to a learned method, its inputs, and one limitation.
2. Trace a supplied computation, identify a clear defect, and justify a validation check.
3. Complete the capstone evidence and rehearse the individual explanation.

The lecture uses `dT/dt = -(T-Tenv)/tau`, with initial temperature `80 deg C`, surroundings `20 deg C`, cooling time `100 s`, and final time `200 s`. Euler steps of `20 s` and `10 s` are compared with the supplied exact solution. The isolated plus-sign example deliberately represents incorrect physics.

## Capstone Studio

Week 12 is a **formative checkpoint** leading to the Week 13 presentation, defence and handoff. It does not add a graded portfolio packet or a new assessment weight.

Use the already approved model and starter. Prepare the physical question, assumptions and units, pseudocode, one justified modification, one principal labelled output, **the required validation check plus one chosen check**, a physical conclusion, one limitation, and a reproducibility record. Every member should rehearse a relevant code trace and a physics or validation follow-up.

Generative AI may support the work. Record what was requested, accepted, changed or rejected, and the independent checks used. A complete chat history is not required. Google Classroom remains the official submission and feedback record; follow the lecturer's posted coursework and deadline.

## MATLAB and Reproducibility

The plain-text Live Scripts require MATLAB R2025a or later and use base MATLAB. Run from the first section in a fresh session. Keep the edited capstone script and all required inputs together; record the MATLAB release, parameters with units, numerical settings and validation outcomes.

## Slide Availability

The lecture deck is complete. It was assembled from 14 full-slide images with English presenter notes embedded, then patched with a native dark-blue horizontal rule below each title; the approved slide 9 graph redraw retains the supplied MATLAB numerical reference.
