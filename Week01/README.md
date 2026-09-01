# PHY4605 Week 01 — Physics to Arrays and Plots

The lecture materials use one familiar vertical-motion model to connect physical reasoning with MATLAB arrays and a labelled plot. The practical deliberately transfers the same computational literacy to supplied RC-circuit, mass-spring, and radioactive-decay contexts.

## Start here

Open `Week01_Lecture_Demonstration_Physics_to_Arrays_and_Plots.m` in MATLAB R2025a or later, then run its sections in order. The file is a lecture demonstration: it is complete and can be followed without entering code from a blank page.

For the practical, use `Week01_Practical_AI_Enabled_Array_Challenge_Set.m`. It is an AI-enabled group challenge set with ten progressive questions, supplied analogous models, labelled plots, validation checks, concise AI decision evidence, and a post-submission random individual defence. Generative AI may be used to write or debug code; every group member must still be able to explain, verify, and interpret the submitted work.

The learning note, `Week01_Physics_to_Arrays_and_Plots.pdf`, gives the same model and sequence in handout form. The final [Week 01 lecture deck](Lecture_Slides_Week01.pptx) presents the route as a 16:9 image-based Teaching Courseware deck using the Muted Academic Blue + Sage direction. Ochre/yellow is used only as an occasional semantic accent, not as a repeated prompt-card element.

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

## Practical transfer and assessment

The practical supplies all equations, assumptions, variables, units, and reference checks. It asks groups to apply Week 01 array, indexing, element-wise operation, and plotting ideas to a different physics context, rather than reproduce the lecture's vertical-motion example.

All ten practical questions must be completed before the group submission is locked. After submission, the instructor assigns a question slot and, where needed, a parameter or defect variant; one eligible group member is selected at random to explain the model, code/output, validation, and physical conclusion. The practical portfolio consists of a 12% group-evidence component and a 3% cumulative individual defence component.

Record only the AI tool used, the material request, what your group accepted/modified/rejected, and the independent checks performed. Do not submit a full chat history.

## Requirements and reproducibility

The lecture demonstration and practical baseline use base MATLAB only. Run the practical from a fresh MATLAB session, from top to bottom, before adding group code and again before submitting. All hidden source, reference solution, question variants, defence rubric, rotation ledger, build evidence, and QA records are kept in `.agent/`; they are not student tasks.
