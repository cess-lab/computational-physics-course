# Week 08 — ODE Simulation

Learn how a first-order rate law becomes a simulated trajectory, then check how the timestep affects the result.

## Materials

- [Lecture slides](Lecture_Slides_Week08.pptx): fourteen-slide image-based deck with English presenter notes.
- [Learning note](Week08_Learning_Note_ODE_Simulation.pdf): physical model, worked Euler steps, loop reading, timestep comparison, and validation.
- [Lecture demonstration](Week08_Lecture_Demonstration_Euler_Cooling.m): complete lecturer-led Newton cooling example.
- [Group practical](Week08_Practical_AI_Enabled_ODE_Challenge_Set.m): ten progressive challenges across three supplied transfer contexts.

## Learning Focus

The Core route connects the state, rate, and initial condition to an Euler next-value rule; traces and completes a loop; compares timesteps at the same final time; and checks a reference result and a physical bound or trend. Reading a supplied `ode45` solution is Working exposure. Formal stability boundaries and Runge–Kutta derivations are not Core requirements.

## Lecture Model

The uniform object temperature obeys `dT/dt = -(T-20)/100`, where temperature is in degrees Celsius and time is in seconds. The object starts at 80 degrees Celsius, the room remains at 20 degrees Celsius, and the cooling time is 100 s. Simulate to 300 s using timesteps 50, 25, and 12.5 s.

The exact reference at 300 s is 22.9872241021 degrees Celsius. Euler endpoint errors decrease from about 2.05 to 1.09 to 0.55 degrees Celsius across the three supplied steps. With a 50 s step, the first two Euler temperatures are 50 and 35 degrees Celsius. A plausible cooling trend alone does not establish numerical accuracy.

## Running the MATLAB Materials

Open the `.m` files in MATLAB R2025a or later as plain-text Live Scripts. They use base MATLAB only. Run sections from top to bottom in a fresh MATLAB session; each file supplies its own parameters and arrays. Local execution was checked using MATLAB R2026b Prerelease Update 3.

The lecture file is a complete demonstration. The practical includes runnable starting code and bounded entries for your group's predictions, changes, checks, and explanations.

## Practical Evidence and AI Use

Work in groups of two or three. The supplied contexts are RC discharge, falling motion with linear drag, and radioactive decay. Record the model and units, trace or modify the code, retain numerical evidence, perform independent checks, and explain the physics. Record material AI decisions rather than full chat histories.

Google Classroom is the official submission record. Complete and lock the group evidence before the question slot and individual defender are drawn. Follow the rotation rule and arrange a make-up defence for an absence. Include the compact capstone progress checkpoint requested in the practical; this week introduces no new graded capstone milestone.

The individual pre-practical diagnostic is drafted but has not been published. Use the corresponding Classroom activity when it is released.

## Instructor Sources

Hidden `.agent/` folders retain learning-note LaTeX and rendered QA, MATLAB numerical evidence, practical reference answers and defence records, and the approved slide outline, prompts, source images, presenter-note source, worker ledger, and final render evidence.
