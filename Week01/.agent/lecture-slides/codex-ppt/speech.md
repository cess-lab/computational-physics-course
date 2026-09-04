## Slide 1: Physics to Arrays and Plots

This week begins with a physics situation that is already familiar: a ball launched vertically upward. The important question is not whether we can memorise a MATLAB command. It is whether we can keep the physical question connected to the computation all the way to a defensible graph.

The route at the bottom is the habit I want you to practise: start with the model, represent the chosen times as an array, produce a plot, check a known condition, and then explain the physical result. MATLAB is useful because it lets us repeat a calculation clearly, but the physics still decides what the variables mean and what a sensible result should look like. We will use the same model repeatedly so that our attention can move to the computational reasoning. Let us begin with the prediction we would make before opening MATLAB.

## Slide 2: Before MATLAB, sketch what must happen

Before we write a line of code, describe the motion in words. The ball begins at the launch height, moves upward, reaches one highest point, and then moves downward. In this model, upward is positive and air resistance is neglected, so the graph should have one smooth maximum rather than a collection of unrelated values.

The labels on the diagram are deliberately direct. They give us a prediction that we can later compare with the computed evidence. Notice the small note at the right: prediction comes first. We are not trying to guess every numerical value yet; we are deciding what qualitative behaviour the computation must preserve. The colours are only visual accents; the labels, not a colour key, explain the physical states. Keep that sketch in mind as we decide what the computer needs to remember.

## Slide 3: Decide what the computer must remember

The computer does not store “the motion” as one vague object. We choose names for physical quantities and decide whether each name holds one fixed value or many sampled values. The starting position, launch speed, and gravitational acceleration are fixed parameters for this example. Time is different: we choose many time values, so it is represented by an array. The computed height will also be an array with one position for each stored time.

The unit is part of the meaning. A name such as `v0_mps` reminds us that the value is a speed in metres per second, while `t_s` reminds us that the array contains seconds. Naming does not replace a dimensional check, but it makes a unit mistake easier to notice. Once the quantities have clear meanings, the next decision is how many time moments we want to represent.

## Slide 4: Sampling is a choice, not the motion itself

The physical model is written as a continuous function of time, but a computer works with a selected set of values. Here we choose times from zero to four seconds in steps of 0.1 seconds. That produces 41 samples. The two MATLAB expressions shown make the same sampling plan in different ways: one specifies the step size, and the other specifies the number of points.

The dots on the trajectory are the representation we hand to the computer; they are not a claim that the ball only exists at those moments. A denser sampling would show the same model with more stored points, while a coarser sampling would show fewer. The underlying equation has not changed. Keep the distinction clear: the model describes the motion, and the array records the moments at which we evaluate it.

## Slide 5: One index represents one physical moment

An index is a storage location, not a time value. In MATLAB, the first entry is selected with index 1, so `t_s(1)` is the launch time. With a step of 0.1 seconds, `t_s(11)` selects 1.0 seconds. The physical meaning comes from mapping the index back to the array value; it is not contained in the number 11 by itself.

This is a small example, but it is a powerful tracing habit. Whenever you see an expression such as `y_m(11)`, first ask which stored time it corresponds to, then ask what physical state the model predicts there. The same habit will help when we read output from longer simulations. Now we can use the array of times as input to the motion equation.

## Slide 6: Make one equation work for many times

The analytical model is `y(t) = y0 + v0 t - (1/2) g t^2`. Read it as three physical contributions: the initial position, the upward contribution from the launch speed, and the downward contribution from gravity. In this example the initial position is zero, but keeping the term visible makes the model easier to generalise and easier to validate.

The computational move is simple: take every stored time and evaluate the same equation. That produces one height for each time in the array. The unit check gives us another way to read the formula: each term on the right must have units of metres, so the result can be interpreted as a height. Next we will focus on the MATLAB punctuation that makes this many-value calculation possible.

## Slide 7: The missing dot changes the operation

The most important distinction on this slide is between one scalar operation and an operation applied across an array. `20 * 3` produces one number. By contrast, `v0_mps .* t_s` produces one product for every stored time, and `t_s.^2` squares each stored time separately. The dot is not decoration; it tells MATLAB to work element by element.

When you read an expression, identify the shape of each input before asking what the result means. If `t_s` contains 41 values, the height calculation must preserve that one-value-per-time structure. A missing dot can therefore be a syntax or array-operation defect even if the equation looks familiar. Once the operation is correct, we still need an ordered algorithm that tells MATLAB what to do first and what to check last.

## Slide 8: Build the algorithm before writing syntax

The algorithm is the bridge between the physical model and the MATLAB script. First choose the parameters and their units. Then create the time array, calculate one height for every stored time, plot height against time, and check a known value before interpreting the result. These steps are plain language on purpose: the order should be understandable even before we remember the exact MATLAB syntax.

A useful algorithm gives us something to trace when the code fails. If the plot is empty, we can ask whether the time array was created. If the output has one number instead of many, we can inspect the array operation. If the curve looks smooth but begins at the wrong height, we can inspect the boundary check. The next slide turns this pathway into a reading strategy for a short Live Script.

## Slide 9: Read the Live Script in the order the physics runs

Do not begin by trying to memorise the whole code block. Start with the comments and variable names: they tell you which lines define the physical parameters. Then find the time array, because it determines how many evaluations the calculation will produce. The model line is next; inspect its dots and signs because this is where the equation becomes an array operation.

Finally, locate the plot and the boundary check. The plot is the visual evidence, while the check tests a condition we already know must be true. Reading code in this order keeps the script connected to the algorithm and to the physical meaning. It also gives us a structured way to diagnose a defect instead of treating the code as a single unexplained block. Let us now compare the resulting plot with our original prediction.

## Slide 10: Compare the prediction with the plotted evidence

Read the plotted height-time evidence in the same order as the prediction. At the left edge the height begins at zero. The curve rises as time increases, reaches one maximum, and then falls toward the launch height. The axis labels, units, ticks, and grid make the output a real graph that we can inspect rather than a decorative curve. The short labels sit beside the exact features they describe, so the prediction-to-plot mapping is immediately traceable.

The graph becomes evidence because its labels and units tell us what the axes mean and because its shape answers a physical question. The plotted values show the selected time window, but a graph alone is not enough to trust the computation. We need at least one condition that the model must pass.

## Slide 11: Use a check the model must pass

The launch condition is known before we calculate anything: at time zero, the height is zero metres. In the MATLAB array, the first stored value is selected with `y_m(1)`, not `y_m(0)`. The supplied expressions make this connection visible, and the assertion turns it into an executable test.

This is a small validation check, but it changes our relationship with the graph. A smooth curve can still come from a wrong initial value, a sign error, or a mismatched array. The assertion tests a boundary condition that the model must satisfy. Passing it does not prove every part of the computation, but it gives us a trustworthy first checkpoint before we make a physical claim.

## Slide 12: State what the computation lets us claim

A defensible statement separates what the evidence supports from what it does not. We can say that, under the stated assumptions, the model predicts a height that starts at zero, rises to one maximum, and then decreases over the sampled time interval. The array and plot show sampled positions, and the launch-value check supports the starting boundary condition.

We should also state a limitation. This is an idealised model with no air resistance, and the graph only covers the selected time samples. A good computational explanation therefore includes a unit, a trend, and a limitation. That pattern will remain useful when we move to loops, debugging, and later numerical methods. Before we finish, use the short exit ticket to test whether the chain is traceable in your own words.

## Slide 13: Week 1 exit ticket

Answer each prompt individually. Name the variable that stores the computed height and give its unit. Explain what `t_s(11)` selects rather than simply repeating that it is an index. Identify the element-wise operator that squares every stored time, and then give one qualitative prediction from the graph together with one value or condition that could be checked.

The purpose is not to write a long program. It is to show that you can connect a physical quantity to its array representation, read the relevant MATLAB operation, and propose evidence that would catch a clear defect. If one of these links feels uncertain, note exactly where the chain breaks. In Week 2 we will keep the same model and make the algorithm, loop, and debugging steps even more explicit.
