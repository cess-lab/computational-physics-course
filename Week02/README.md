# PHY4605 Week 02 — Numerical Algorithms: Turn physical reasoning into pseudocode, loops, and fixes

Week 02 reuses the familiar vertical-launch model so the new cognitive load is algorithmic rather than mathematical. The Core route moves from a physical prediction to pseudocode, a traceable `for` loop, one bounded modification, debugging evidence, one known-value validation, and physical interpretation.

## Student-facing files

- `Lecture_Slides_Week02.pptx` - lecture slide deck.
- `Week02_Pseudocode_Loops_and_Debugging.pdf` - learning note.
- `Week02_Lecture_Demonstration_Pseudocode_Loops_and_Debugging.m` - lecturer-guided MATLAB Live Script.
- `Week02_Practical_AI_Enabled_Loops_and_Debugging_Challenge_Set.m` - AI-enabled group practical with ten progressive micro-challenges.

## Weekly workflow

**Before:** Read the learning note, complete the Week 02 diagnostic in the corresponding Google Classroom coursework when it is released, and predict the loop output.

**During:** Follow `model -> units -> pseudocode -> loop -> validation -> interpretation`; trace the supplied MATLAB work and complete the exit ticket.

**Practical:** Work in a group of two or three through ten progressive challenges, recording the model, units, algorithm, code/output, validation, interpretation, and material AI decisions. Rerun the final work from a fresh MATLAB session.

**After:** Submit the locked packet through Google Classroom. The question slot and eligible student are drawn after submission for the individual defence. Feedback and any optional short remediation/retry are issued through Classroom.

**Portfolio status:** Week 02 is the first of the ten counted practical packets; the best eight packets count for the group component.

## Locked lecture model

The lecture demonstration uses one-dimensional vertical motion with upward positive, no air resistance, and constant gravity:

`y(t) = y0 + v0*t - 0.5*g*t^2`

- `y0_m = 0` m
- `v0_mps = 20` m s^-1
- `g_mps2 = 9.81` m s^-2
- `t_s = 0:0.5:4` s

The first stored value must be `y(0) = 0 m`. The first two loop results are `0 m` at `0 s` and `8.77375 m` at `0.5 s`.

## Core learning route

1. Decompose the task into input, calculation, output, and check.
2. Express the computation as short plain-language pseudocode.
3. Trace how a `for` loop moves through a time array and fills the matching position array.
4. Complete one bounded update line and modify one input parameter.
5. Distinguish syntax, array/indexing/operator, and physical/logical defects.
6. Use the known initial value as the Core validation and explain the output physically.

## Practical transfer

The practical deliberately changes the physics context while keeping the computational structure recognisable. The ten challenges use cooling, radioactive decay, and a mass-spring oscillator. Generative AI may assist with code, but the assessable evidence includes the model and units, algorithm/pseudocode, runnable output, validation, interpretation, and a concise AI decision record.

Run the final work from the top in a fresh MATLAB session before submission. Do not rely on hidden Workspace variables.

## Classroom diagnostic

Week 02 already has a mapped Google Form/Classroom diagnostic. Complete it through the corresponding Classroom coursework when released; do not create a duplicate. If it reveals a common misconception, the lecturer may post an optional 10–15 minute Classroom remediation with one retry and confidence check. It is not a prerequisite for the next lecture.
