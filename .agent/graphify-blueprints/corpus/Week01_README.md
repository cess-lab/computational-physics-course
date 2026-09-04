# PHY4605 Week 01 — Physics to Arrays and Plots

This package uses one familiar vertical-motion model to connect physical reasoning with MATLAB arrays and a labelled plot.

## Start here

Open `Week01_Lecture_Demonstration_Physics_to_Arrays_and_Plots.m` in MATLAB R2025a or later, then run its sections in order. The file is a lecture demonstration: it is complete and can be followed without entering code from a blank page.

For the practical, use `Week01_Practical_Vertical_Motion_Arrays_and_Plots.m`. It is a scaffolded group activity with five bounded tasks, a labelled graph, the initial-value validation, one controlled launch-speed change, and concise submission/AI-decision evidence.

The learning note, `Week01_Physics_to_Arrays_and_Plots.pdf`, gives the same model and sequence in handout form. The lecture deck presents the same route visually.

## Locked model

For a ball launched vertically upward, with upward positive and air resistance neglected:

`y(t) = y0 + v0 t - (1/2) g t.^2`

| Quantity | Value |
| --- | ---: |
| `y0_m` | 0 m |
| `v0_mps` | 20 m s^-1 |
| `g_mps2` | 9.81 m s^-2 |
| `t_s` | 0:0.1:4 s |

The continuous model reaches its highest point at approximately 2.04 s and 20.39 m. The required Week 01 validation is the known initial value: `y(0) = 0 m`.

## What to look for

- A physics model becomes named variables with units.
- An array stores many time values; MATLAB indexing starts at 1.
- `.*` and `.^` apply the calculation to every time sample.
- A graph needs a descriptive title, labelled axes, and units.
- A graph is evidence only when it agrees with a stated physical prediction and a check.

## Requirements and reproducibility

The lecture demonstration uses base MATLAB only. Run it from a fresh MATLAB session, from top to bottom. All hidden source, figure data, build evidence, and QA records are kept in `.agent/`; they are not student tasks.
