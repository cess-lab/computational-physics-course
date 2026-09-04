# Presenter notes — PHY4605 Week 01

## Slide 1: Physics to Arrays and Plots

Today we use one familiar problem to make the computational workflow visible. A ball is launched vertically upward, and we will connect the physical picture to variables, an array of times, a labelled plot, and a validation check.

The important habit is the chain across the bottom: start with the model, decide what to store, calculate the output, inspect the evidence, and check one value that physics already tells us. The code is short because the reasoning should be easy to see.

## Slide 2: Start with a physical prediction

Before MATLAB appears, make a prediction. At launch the height is zero, the ball rises, there is one highest point, and then the height decreases toward the launch level. These are not guesses about software; they are physical expectations that the computation must respect.

Ask students to describe the graph shape in words. That prediction gives us something to compare with later, and it also gives us an early way to notice a wrong sign or an unexpected parameter.

## Slide 3: The equation links each term to motion

Read the equation from left to right. The starting position contributes (y_0), the initial upward motion contributes (v_0t), and gravity contributes the negative term (-\frac{1}{2}gt^2). Each term has units of metres, so the result (y(t)) is a position.

The point is not to memorise the formula. It is to see that each part has a physical meaning and that the sign convention matters. When we translate this equation into MATLAB, we should still be able to point to the same contributions.

## Slide 4: Names and units keep the model readable

Before writing or tracing code, translate the notation. I want students to recognise the physical quantity even when they see it in MATLAB: time becomes `t_s`, position becomes `y_m`, initial velocity becomes `v0_mps`, and gravitational acceleration becomes `g_mps2`.

Keeping units visible makes later checks easier. If a term is supposed to contribute metres but the units do not work, that is evidence of a modelling or coding problem—not merely a formatting issue.

## Slide 5: Build the time array first

The model needs a time value for each height value. We can create the samples with colon notation or with `linspace`; here both routes give 41 samples from 0 to 4 seconds. The array is therefore a sampling plan for the physical motion.

Pause on the count and the endpoints. A common mistake is to think that a command such as `0:0.1:4` means “about 4 values.” It means a sequence of stored times, and every later calculation must line up with those samples.

## Slide 6: An index selects one physical moment

An index selects a location in the stored array. Since MATLAB starts indexing at 1, `t_s(1)` is the launch time. In a 0.1-second array, `t_s(11)` is 1.0 seconds, not 1.1 seconds.

Use the trajectory to make this concrete. The index has meaning because it points to a physical moment. Always read the array position first, then interpret what was happening to the ball at that moment.

## Slide 7: Dots tell MATLAB to work through an array

This is the key MATLAB repair for this week. `20 * 3` is scalar arithmetic and produces one number. When `t_s` contains many values, `v0_mps .* t_s` produces one value for every stored time, and `t_s.^2` squares every time value individually.

The dots are not decoration. They tell MATLAB to apply the operation element by element. Ask students to explain why the model line needs `.*` and `.^` before moving on; the explanation is more important than simply copying the symbols.

## Slide 8: The algorithm appears before the MATLAB syntax

Now turn the physical task into ordered steps: choose the parameters, create the time array, calculate the height for each time, plot height against time, and check the launch value. This is the algorithm in plain language.

The algorithm is useful because it gives us places to look when something goes wrong. If the graph is empty, we can ask whether the array or plot step ran. If the curve starts at the wrong height, we can inspect the model or the boundary check.

## Slide 9: Short code should expose the physics

Read this fragment in sections rather than as one block. First find the parameters, then the time array, then the line that evaluates the model, then the plot, and finally `y(1)` as the first-value check. The comments and names tell us what the lines mean physically.

The goal is not to write this from memory. It is to trace how a model becomes an output. Ask students to point to the line that creates many times, the line that creates many heights, and the line that checks the launch condition.

## Slide 10: A labelled plot turns values into evidence

Look at the plot in the same order as our prediction: it begins at zero, rises to one maximum, and then falls. The title and axis labels tell us what is being plotted, while the units tell us how to interpret the scale.

A graph is evidence only when it answers the physical question. Before accepting it, compare the shape with the prediction and check that the plotted quantities have the names and units we expect.

## Slide 11: A boundary check can reveal an error that a smooth curve hides

The model already gives us one value that must be true: at launch, (y(0)=0\) metres. In the array representation, launch is the first stored value, so we check `y_m(1)`. The `assert` statement turns the physical condition into an executable test.

This is a deliberately small check, but it is powerful. A curve can look smooth even when the equation, indexing, or initial condition is wrong. The habit we want is to state a known condition, test it, and record whether it passes.

## Slide 12: Trace one model from physics to a graph

This is the reusable Week 1 workflow. Start with the question, direction, variables, and units. Write the algorithm. Read the array operations in the code. Then compare the prediction with the labelled plot and perform the launch-value check.

Ask where a wrong sign would first become visible. Students may identify the model equation, the predicted graph shape, or the validation value; the important point is that each stage gives us another opportunity to diagnose the defect.

## Slide 13: Week 1 exit ticket

Use these questions as an individual check of understanding. The answers should be short, but they should use physical language as well as MATLAB language: name the output and its unit, interpret an index, identify the element-wise operator, and state a prediction plus a validation value.

The bridge to Week 2 is already here. We will keep the same physical model but make the algorithm and loop behaviour more explicit, so students can trace not only what is calculated but also how the calculation progresses.
