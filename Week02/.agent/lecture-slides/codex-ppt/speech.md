# Week 02 speaker notes

## Slide 1: From one calculation to a traceable loop

Week 01 gave us a physical equation and a set of values. This week asks a different question: how do we repeat the same reasoning without losing track of what each result means? A loop is useful only when its order is visible and its output can still be checked.

Keep the central chain in view: physical question, recipe, loop, evidence, explanation. We are not learning punctuation for its own sake. We are making a calculation traceable enough that another person can follow it and challenge it.

## Slide 2: Predict the motion before asking MATLAB to repeat anything

Start with the physical picture. Take upward as positive. The object begins at the launch level, rises while its upward velocity is positive, reaches one maximum, and then falls. Ask students to predict the shape before any code appears.

That prediction is not decoration. It becomes a debugging reference. If the output never turns over, turns over twice, or begins away from the launch level, we have evidence to investigate.

## Slide 3: Fix the model, then ask what repeats

The model is the familiar one-dimensional vertical launch: y(t) = y0 + v0 t - (1/2) g t^2. Upward is positive, air resistance is neglected, and gravity is constant. For this lecture use y0_m = 0 m, v0_mps = 20 m s^-1, g_mps2 = 9.81 m s^-2, and t_s = 0:0.5:4 s.

The physics stays fixed while the sampled time changes. That distinction is the key to the algorithm: each pass reads one current time, evaluates the same model, and stores one corresponding position.

## Slide 4: One calculation is four small jobs

Break one pass into four jobs: identify the input, perform the calculation, store the output, and make a check. The point of the cards is to give every loop pass a traceable structure.

For the vertical-motion example, the input is one time value, the calculation is the model equation, the output is one position slot, and the check can begin with the known initial value. Ask students which job would be hardest to debug if it were left implicit.

## Slide 5: Turn the jobs into a repeatable recipe

Write the algorithm in plain language before showing MATLAB punctuation. Make an output slot per input time; start at the first index; read the current time; calculate and store one position; move to the next index; stop after the last time.

Point to the loop-back arrow. The recipe repeats the middle steps, not the setup and not the stopping point. Have students say the five loop ideas aloud: start, current, update, next, stop.

## Slide 6: The index is a storage address, not a time

MATLAB arrays use one-based indexing. The index tells us which stored element to read or write; it is not itself a time in seconds. In this example, sample_index = 1 selects t_s(1), which is 0 s, while sample_index = 2 selects t_s(2), which is 0.5 s.

The variable current_time_s is the physical value used in the equation. Keeping sample_index and current_time_s separate prevents a common category error: confusing where a value is stored with what that value represents.

## Slide 7: Trace two passes before trusting the whole loop

Trace the first two iterations by hand. On the first pass, sample_index = 1, t_s(1) = 0 s, and the model gives y_m(1) = 0 m. On the second pass, sample_index = 2, t_s(2) = 0.5 s, and the model gives y_m(2) = 8.77375 m.

The trace links index, physical input, calculation, and output slot. If a student's table cannot show those four links, the full loop will be difficult to debug. This is a small habit with a large payoff.

## Slide 8: Write the MATLAB loop that matches the recipe

Now map each plain-language step to MATLAB. The loop should read `current_time_s = t_s(sample_index)`, calculate `current_position_m` with the locked model, and assign `y_m(sample_index) = current_position_m`.

Read the code as a trace rather than as a block to memorise. The `for` line controls the index; the indexing expression selects the current physical input; the assignment puts the result in the matching output slot. The code is trustworthy only because its structure matches the algorithm.

## Slide 9: Complete one line, then say what it does

A missing line is an invitation to reason, not a memory test. The missing assignment must store the current position in the slot that matches the current index: `y_m(sample_index) = current_position_m`.

Ask students to explain the consequence in plain language. If the line is omitted, the calculation may still run but the output array does not receive the value. If the index is wrong, values can be misplaced even when the formula itself is correct.

## Slide 10: Change one input, predict one consequence

Change one input only: reduce the launch speed from 20 m s^-1 to 15 m s^-1 while keeping y0_m, g_mps2, and t_s fixed. Before looking at the output, predict the consequence: a lower launch speed should produce a lower peak and reach that peak earlier.

The supplied comparison is about controlled reasoning. One changed parameter makes the comparison interpretable. It is not evidence for every possible projectile model; it is evidence for this model under these assumptions.

## Slide 11: Read the plot as evidence, not decoration

Use this conceptual sketch to name the observations before looking at exact numbers. Both cases begin at 0 m, and the lower launch speed produces a lower sampled peak. The sketch is deliberately labelled as conceptual rather than numerical, so students do not confuse an explanatory trend with measured MATLAB output.

Point students to the exact MATLAB output in the Live Script for the numerical comparison: labels and units make the graph interpretable, while the stated assumptions limit the claim. A graph is evidence about the implemented model and sampled times; physical interpretation explains what that evidence means.

## Slide 12: Diagnose the defect before editing the code

Use three defect categories. A syntax defect prevents MATLAB from reading the instruction. An indexing or operator defect changes which element is selected or how arrays are combined. A physical or logical defect lets the code run but represents the wrong model or order of operations.

Do not guess from the colour of a line. Locate the reported error or the suspicious output, then inspect the surrounding line and compare it with the physical prediction and the algorithm. Ask students to name the evidence before proposing an edit.

## Slide 13: One check can pass while the model is still wrong

The known initial value is a good first check: y(0) = 0 m for this setup. It tests the starting point and can expose a misplaced initial condition. But a single passing check does not prove the whole loop or model is correct.

For example, an incorrect sign in the gravity term could still pass through the correct initial point. Pair the known value with a physical or output check: the curve should rise to one maximum and the changed launch speed should lower the sampled peak. Validation is a reasoned claim with a stated limit.

## Slide 14: Exit ticket — explain the loop to a future you

Close by asking for four short pieces of evidence. Put input, calculation, output, and check in order. Explain what `t_s(sample_index)` selects. Identify one defect and the evidence that reveals it. State one validation and one physical conclusion.

The same reasoning chain will organise the next familiar model, a 2 x 2 circuit system. The physics will change, but the habits remain: define the model, expose the algorithm, trace the code, validate the result, and explain the physical meaning.
