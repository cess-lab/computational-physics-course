# Week 12 — Method Selection: Audit a computation and prepare a reproducible capstone

Use familiar methods to answer a physical question, audit supplied code, and prepare a result that another person can reproduce and each group member can explain. No new numerical method is introduced.

## Materials

- [Learning note](Week12_Learning_Note_Integrated_Method_Selection_and_Capstone_Studio.pdf): method recognition, a worked cooling-code audit, validation, and capstone preparation.
- [Lecture slides](Lecture_Slides_Week12.pptx): 14-slide Teaching Courseware deck covering method selection, Euler tracing, validation, controlled modification, capstone evidence, and defence rehearsal.
- [Lecture demonstration](Week12_Lecture_Demonstration_Integrated_Method_Selection.m): complete lecturer-led MATLAB example with Euler timesteps and a supplied exact cooling reference.
- [Formative practical and capstone studio](Week12_Practical_Integrated_Method_Selection_and_Capstone_Studio.m): ten progressive challenges using projectile range, RC charging and radioactive decay, followed by completion and defence rehearsal using the group's approved capstone starter.

## Weekly workflow

**Before:** Read the learning note, complete the dedicated Week 12 diagnostic in Google Classroom when it is released, and identify the method, output, and validation check for each supplied case.

**During:** Follow `physical output -> method -> code audit -> validation -> controlled modification -> capstone evidence -> defence rehearsal`; run the supplied MATLAB work and complete the exit ticket.

**Studio:** Complete the formative capstone evidence in a group of two or three. Record the model, units, algorithm, modification, principal output, required and chosen checks, interpretation, limitation, reproducibility, and material AI decisions.

**After:** Submit the formative studio evidence through Google Classroom and use the lecturer's feedback to prepare Week 13. Week 12 creates no extra portfolio packet or graded defence entry.

## Learning Focus

1. Match the required physical output to a learned method, its inputs, and one limitation.
2. Trace a supplied computation, identify a clear defect, and justify a validation check.
3. Complete the capstone evidence and rehearse the individual explanation.

The lecture uses `dT/dt = -(T-Tenv)/tau`, with initial temperature `80 deg C`, surroundings `20 deg C`, cooling time `100 s`, and final time `200 s`. Euler steps of `20 s` and `10 s` are compared with the supplied exact solution. The isolated plus-sign example deliberately represents incorrect physics.

## Capstone Studio

Week 12 is a **formative checkpoint** leading to the Week 13 presentation, defence and handoff. It does not add a graded portfolio packet or a new assessment weight.

Use the already approved model and starter. Prepare the physical question, assumptions and units, pseudocode, one justified modification, one principal labelled output, **the required validation check plus one chosen check**, a physical conclusion, one limitation, and a reproducibility record. Every member should rehearse a relevant code trace and a physics or validation follow-up.

Generative AI may support the work. Record what was requested, accepted, changed or rejected, and the independent checks used. A complete chat history is not required. Google Classroom remains the official submission and feedback record; follow the lecturer's posted coursework and deadline.

## Test 2 timing

Test 2 covers Weeks 06–11 and targets academic Week 12 (28 December 2026–03 January 2027), after the Week 11 content / alongside this studio, within the broad UPM Assessment II window of academic Weeks 8–12 (30 November 2026–03 January 2027). The exact local date is to be confirmed.

## MATLAB and Reproducibility

The plain-text Live Scripts require MATLAB R2025a or later and use base MATLAB. Run from the first section in a fresh session. Keep the edited capstone script and all required inputs together; record the MATLAB release, parameters with units, numerical settings and validation outcomes.

## Slide Availability

The lecture deck is complete. It is assembled from 14 full-slide images with English presenter notes embedded, uses the normalized 16:9 raster-only format, and retains the approved slide 9 graph redraw with its supplied MATLAB numerical reference.
