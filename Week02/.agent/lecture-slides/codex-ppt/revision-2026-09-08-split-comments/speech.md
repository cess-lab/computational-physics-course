# Week 02 speaker notes

## Slide 1: Numerical Algorithms: Turn physical reasoning into pseudocode, loops, and fixes

Week 01 gave us a familiar physical equation and a set of values. This week asks a different question: how do we repeat the same reasoning without losing track of what each result means? A loop is useful only when its order is visible and its output can still be checked.

Keep the reasoning chain visible: physical question, prediction, recipe, loop, evidence, explanation. The focus is not memorising punctuation. It is making a calculation traceable enough that another person can follow it and challenge it.

## Slide 2: Predict the motion before asking MATLAB to repeat anything

Take upward as positive. The object begins at the launch level, rises while its upward velocity is positive, reaches one maximum, and then falls. Ask students to predict this shape before any code appears.

That prediction is a debugging reference. If the output never turns over, turns over twice, or begins away from the launch level, there is evidence to investigate. The physical story comes before the loop.

## Slide 3: Fix the model, then ask what changes

Use the locked one-dimensional model `y(t) = y0 + v0 t - (1/2) g t^2`. Upward is positive, air resistance is neglected, and gravity is constant. For this lecture, `y0_m = 0 m`, `v0_mps = 20 m s^-1`, `g_mps2 = 9.81 m s^-2`, and `t_s = 0:0.5:4 s`.

The physics stays fixed while the selected time changes. The algorithm therefore reads one `current_time_s`, evaluates the same model, and produces one corresponding position. Make clear that a scalar value inside a loop is not the whole input array.

## Slide 4: One calculation is four small jobs

Break one pass into four jobs: identify the input, perform the calculation, store the output, and make a check. For vertical motion, the input is one time, the calculation is the position equation, the output is one position slot, and the first check can use the known initial value.

Ask which job would be hardest to debug if it were left implicit. The purpose of the map is to give every pass a traceable structure before MATLAB syntax enters.

## Slide 5: An index traces both selection and storage

MATLAB indexing starts at 1. The index is a storage address, not a time in seconds. `sample_index = 1` selects `t_s(1) = 0 s`; `sample_index = 2` selects `t_s(2) = 0.5 s`. The same index identifies the matching output slot.

Trace the two cards. Pass 1 gives `y = 0 m`. Pass 2 gives `y = 8.77375 m`. The important connection is index -> current physical value -> calculation -> matching storage location. Keeping `sample_index` and `current_time_s` conceptually separate prevents a common category error.

## Slide 6: Calculate one value; store it in the matching slot

Read the code as a partial implementation of the four-job recipe. Preallocation creates one output slot for each time. The `for` line controls the index. `current_time_s = t_s(sample_index)` selects the physical scalar, and the model produces `current_position_m`.

Pause before storage. Ask: where should this scalar go so that the input and output remain aligned? The next slide deliberately leaves that action to students.

## Slide 7: Your turn: complete the storage line

The intended completion is `y_m(sample_index) = current_position_m`. Do not reveal this before students commit to an answer. Ask them to justify both sides: the right side is the value just calculated, and the left side is the output slot paired with the current index.

Use the first-value check as a quick physical test. At the first pass, the current time is 0 s, so the stored result should remain 0 m. A fixed `y_m(1)` would overwrite the same slot and is an indexing defect even if MATLAB executes the line.

## Slide 8: Change one input, predict one consequence

Now change only `v0_mps` from 20 to 15. Keep `y0_m`, `g_mps2`, and the common grid `t_s = 0:0.5:4` fixed. Ask for the prediction before showing the evidence: the lower launch speed should produce a lower sampled peak and reach it earlier.

Read the exact sampled evidence. For 20 m s^-1, the highest sampled point is 20.38 m at 2.0 s and `y(4 s) = 1.52 m`. For 15 m s^-1, the highest sampled point is 11.46375 m at 1.5 s and `y(4 s) = -18.48 m`. The no-impact model continues to 4 s; `y = 0` is the launch reference, not an automatic stopping rule. Emphasise that the comparison is controlled because one parameter changed.

## Slide 9: A second process can use the same loop logic

Radioactive decay is a supplied transfer context, not a new derivation. Use `N(t) = N0 exp(-lambda t)` with `lambda = log(2)/half_life_h`, `N0_counts = 800`, `half_life_h = 6.0`, and `t_decay_h = 0:1:24`.

The physical prediction is monotonic decrease. The half-life provides a useful reference: at 6 h the count should be 400, and at 24 h — four half-lives — it should be 50. Keep this structural: input, current time, calculate, store, check. Do not introduce a differential equation or stochastic counting model here.

## Slide 10: Transfer challenge — write the loop in plain language first

Before MATLAB syntax, ask groups to state the decay algorithm in plain language. Input the supplied parameters and hourly times; select the current time; calculate one count; store it in the matching output slot; check the 6 h result; stop at 24 h.

The expected physical check is `N(6 h) = 400`. Keep the slide unsolved. The aim is to transfer the algorithm pattern, not to test whether students can memorise a function or derive a new method.

## Slide 11: Diagnose the defect before editing the code

Use three practical categories. A syntax defect stops MATLAB reading the intended structure, such as a missing `end`. An indexing or operator defect can run while selecting or storing the wrong thing, such as `y_m(1)` inside every pass or `t_s^2` where `t_s.^2` is required for an array. A physical or logical defect can produce plausible numbers with wrong physics, such as the wrong gravity sign or a time supplied in the wrong units.

The first question is not “what edit should I try?” It is “what evidence do I have?” The code running is not a correctness test.

## Slide 12: Use evidence to locate the first bad pass

Give students a repair routine: record the symptom; locate the line and the first bad pass; compare the line with the pseudocode or physical model; change one item; rerun; then perform numerical and physical checks.

The first bad pass is often more useful than staring at the final number. A wrong loop bound, fixed output index, element-wise operator, sign, or unit may leave a recognisable trace. One change at a time keeps the evidence interpretable. Keep this slide focused on the repair sequence; the next slide will slow down over the evidence that confirms a repair.

## Slide 13: Confirm the fix with numerical and physical evidence

Now inspect the evidence produced after the repair. The first-bad-pass table shows where the wrong output begins, while the code comparison makes the sign error visible. The numerical check is `y(0.5 s) = 8.77375 m` for the correct upward-positive model; the physical check is that the trajectory rises to one maximum and then falls.

The point is not to collect more output. It is to make two independent questions visible: does the implementation match the model, and does the result behave physically? Once these checks are in place, we can discuss what a single passing check still cannot prove.

## Slide 14: A passing check can still miss wrong physics

`y(0) = 0 m` and `assert(y_m(1) == y0_m)` are useful known-value checks. They check the initial condition and the first stored result. But a wrong gravity sign can still pass at `t = 0`, because both the correct and incorrect expressions share the same starting point.

That is why validation is layered: check the model, check the code/output, and check the physical meaning. The trajectory should rise to one maximum and then fall under the stated assumptions. A check is a reasoned claim with a limit, not a guarantee that every line is correct.

## Slide 15: Exit ticket — explain the loop to a future you

Close with four short responses. Put input, calculation, output, and check in order. Explain what `t_s(sample_index)` selects. Identify one defect and the evidence that reveals it. State one validation and one physical conclusion.

Preview Week 03 with a 2 x 2 circuit model. The physics will change, but the habits remain: define the model, expose the algorithm, trace the code, validate the result, and explain the physical meaning.
