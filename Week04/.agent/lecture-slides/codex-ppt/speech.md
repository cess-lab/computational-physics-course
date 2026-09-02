# Week 04 speaker notes

## Slide 1: Change one parameter, see the physics

This week treats a parameter sweep as a controlled computational experiment. The cover stays intentionally light: one spring, one force direction, and the compact relation `x = F/k` establish the physical theme without previewing the full workflow.

The detailed reasoning chain begins on the next slides. For now, invite students to notice the question implied by the title: how does changing one parameter change the physical response?

## Slide 2: Predict before MATLAB

Begin with the model rather than the code. Hooke's law gives `F = kx`, so `x = F/k`. For a fixed positive force, a smaller stiffness must produce a larger extension. Therefore the 50 N/m curve should be steepest, the 100 N/m case is the baseline, and the 200 N/m curve should be shallowest.

At 10 N, the predicted extensions are 0.20 m, 0.10 m, and 0.05 m. At zero force, every ideal-spring case should give zero extension. These predictions will become checks on the numerical result and graph.

## Slide 3: A sweep is a controlled experiment

A fair sweep changes one named parameter and holds the model, force array, units, and other assumptions fixed. Here the deliberately changed quantity is spring stiffness `k`. The common input is the applied-force array `F_N`.

If force and stiffness change together, the output difference is confounded. We can no longer say that stiffness alone caused the observed change. The flow on this slide is the control logic that makes the later graph interpretable.

## Slide 4: Start with the model, variables, and units

Use an ideal linear spring in its elastic range. The model is `F = kx`, rearranged as `x = F/k`. State the computational variables before using them: `F_N` is force in newtons, `k_Npm` is stiffness in newtons per metre, and `extension_m` is extension in metres. The named baseline is 100 N/m.

The unit relation is a quick audit: N divided by N/m gives m. If the code or a result violates this dimensional structure, the model translation needs attention even if MATLAB accepts the expression.

## Slide 5: Plan the computation in plain language

Before MATLAB syntax, describe the algorithm. The upper checklist has been removed so the eight-step path can be read at a larger scale. It still covers the full sequence: state the model and assumptions, select one swept parameter, define a small case array, hold the force array and equation fixed, evaluate every case, store the results, overlay the cases on common labelled axes, check a known or limiting case, and explain the trend.

The phrase to keep repeating is “same model, one controlled change.” The expanded control panel makes that rule visible without adding another dense block of text.

## Slide 6: Store the cases explicitly

The supplied code names the common force array, the three stiffness cases, and the baseline. The units in the variable names make the intended physical quantities visible while we read the code.

Ask students to identify what is fixed and what is swept. `F_N` is common to all cases. `k_Npm` contains the values that will change from row to row. `baseline_k_Npm` identifies the comparison case that we will trace later.

## Slide 7: Evaluate the same model for every case

The result array is preallocated with one row for each stiffness value and one column for each force value. On each loop pass, only `k_Npm(case_id)` changes. The model remains `x = F/k`, implemented with element-wise division.

The row mapping matters: row 1 belongs to 50 N/m, row 2 to 100 N/m, and row 3 to 200 N/m. This is the bridge between the code and the physical cases. A later plot can only be interpreted if this mapping is retained.

## Slide 8: Read one row before plotting

Read the final force column before looking at the graph. At `F = 10 N`, the 50 N/m, 100 N/m, and 200 N/m cases give 0.20 m, 0.10 m, and 0.05 m. The baseline is the middle row, 0.10 m.

This is a same-input comparison: one force value, three stiffness cases. It is more informative than comparing points taken at different forces, because the only intended physical difference is the stiffness.

## Slide 9: Overlay every case on common axes

The plot uses the same force array for all three curves and labels both physical axes. The stored result has one row per case, so the transpose in `extension_m.'` supplies the plotting arrangement without changing the numerical values or physics.

Keep the supplied MATLAB-generated plot as the evidence. The legend identifies each stiffness. A common set of axes lets us compare the extension at the same applied force rather than relying on visual impressions from separate plots.

## Slide 10: The graph is a physics statement

The curves are straight because the ideal Hooke model makes extension proportional to force. Their slope is `1/k`. Increasing stiffness therefore reduces the slope, so the same force produces less extension.

The graph supports the prediction: the 50 N/m spring has the largest extension, the 100 N/m spring is intermediate, and the 200 N/m spring has the smallest extension. This conclusion depends on the controlled comparison and agrees with `x = F/k`.

## Slide 11: Validate a known limiting case

At `F = 0`, the model predicts `x = 0` for every positive stiffness. The code reads the first column of `extension_m` and checks that its largest absolute value is below `1e-12`.

This is a physical expectation converted into a reproducible test. It checks all swept cases at once and confirms the model evaluation, not merely that MATLAB executed without an error.

## Slide 12: A runnable calculation can still be wrong

The expression `x = F.*k` is syntactically valid, but it does not represent Hooke's law. Its units are N times N/m rather than metres, and it reverses the expected stiffness trend: a larger `k` would appear to produce a larger extension.

Pause after identifying those defects. The next slide supplies the numerical comparison and a short repair path. Separating detection from repair gives students room to explain why the result is wrong, not merely copy the corrected operator.

## Slide 13: Repair the expression, then recheck the physics

Use the `F = 10 N` comparison to make the defect concrete. The correct model gives 0.20 m, 0.10 m, and 0.05 m for the three stiffnesses. The wrong expression produces 500, 1000, and 2000 N^2/m, so both the scale and the units are physically wrong.

Follow the repair sequence: start from `x = F/k`, check the units, check the zero-force limiting case, check the expected stiffness trend, and then implement `correct_baseline_extension = F_N./baseline_k_Npm;`. The lesson is that numerical output becomes trustworthy only after the model and its physical checks agree.

## Slide 14: Working exposure: compare selected inputs

The selected-force table gives another view of the same sweep at `F = [2 5 8] N`. Each row compares all three stiffness cases at one common force. The ordering is unchanged: smaller stiffness gives larger extension.

This is working exposure rather than a new required method. The point is to see that a table and a graph can report the same controlled experiment, provided the case order and units remain explicit.

## Slide 15: Exit ticket — explain a fair sweep to a future you

Close by asking students to state the six pieces of evidence: predict the trend from the equation; identify the one parameter that changes; name the inputs that stay fixed; read a labelled common-axis plot; perform a known or limiting check; and explain the physical result.

The practical will transfer this reasoning chain to supplied Ohmic-resistor, vertical-motion, and small-angle-pendulum contexts. The equation changes, but the discipline remains: control the comparison, preserve units, validate, and interpret.
