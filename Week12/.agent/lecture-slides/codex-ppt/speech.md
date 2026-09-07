# Week 12 Presenter Notes — Integrated Method Selection and Capstone Studio

## Slide 1: Which Computation Answers the Physics Question?

This week brings the methods together around one practical question: what computation answers the physical question in front of us? We will start from the requested output, trace a supplied implementation, test it against evidence, and carry the same habits into the capstone studio.

## Slide 2: Name the Output Before Choosing the Method

The output gives us the first clue. Several unknown currents point to a linear system; a threshold points to root finding; an accumulated quantity points to integration; and a state changing through time points to an ODE update. Method names are useful only when the inputs, output and assumptions agree.

## Slide 3: Inputs, Output, and One Limitation

Our worked case is Newton cooling. The inputs are the initial temperature, the surroundings, the cooling time and the time positions. The output is temperature against time. A uniform object and constant surroundings are assumptions, while the timestep is a numerical choice that also limits the result.

## Slide 4: Predict the Cooling Before Running MATLAB

Before looking at a graph, use the model to predict its direction. A warm object in a cooler room should move down toward the room temperature, starting at 80 degrees Celsius. If the computed trajectory rises away from 20 degrees, the code or the model has a problem.

## Slide 5: Connect the Rate to the Update

The negative sign is the physical direction. Temperature excess divided by seconds gives a rate; multiplying by the timestep gives a temperature change; adding that change to the current state gives the next state. Keeping the units visible makes this translation easier to audit.

## Slide 6: Read the Algorithm Before the Code

The recipe is deliberately plain: define the values, make the time array, store the initial state, repeat rate then update, compare with a reference, and interpret the result. This lets us check the logic before MATLAB punctuation distracts us.

## Slide 7: Trace One Euler Step

At time zero the first MATLAB array entry contains 80. The initial rate is minus 0.6 degrees Celsius per second. Over 20 seconds the change is minus 12 degrees, so the next physical value is 68 degrees Celsius. That updated value is stored at MATLAB index 2, because index 1 represents time zero.

## Slide 8: A Script Can Run and Still Be Wrong

The plus-sign version is valid MATLAB syntax, but it reverses the physical direction. Its first step produces 92 degrees Celsius, which is heating away from the room. The repair is to restore the negative rate, rerun from a clean session, and then check the result independently.

## Slide 9: Validate Against the Supplied Reference

Look first at the green exact reference, then the two Euler sequences. At 200 seconds the exact value is 28.1201 degrees Celsius. The 20-second and 10-second Euler values are 26.4425 and 27.2946. The finer step is closer for this case. This validates the numerical result for the stated model; it does not validate every real-world assumption.

## Slide 10: Choose a Check That Tests the Claim

A check must answer a specific claim. An initial value checks setup. A reference comparison checks numerical agreement. Refinement checks sensitivity to discretisation. Units catch some errors but not every sign defect. When you choose a check, also say what it cannot establish.

## Slide 11: Change One Parameter and Explain the Physics

Now change only the cooling time from 100 to 150 seconds. The larger time means a smaller rate at the same temperature excess, so the object should remain warmer after 200 seconds. This is a physical parameter change; changing the timestep would instead change the numerical approximation.

## Slide 12: Assemble the Capstone Evidence

The capstone packet should make the reasoning chain visible. Bring the approved model and units, pseudocode, one controlled modification, one principal output, the required check and a chosen second check, the physical interpretation and one limitation. Week 12 is a formative studio checkpoint, not a new graded milestone.

## Slide 13: Reproduce and Rehearse the Defence

Before locking the evidence, rerun it from a fresh MATLAB session and record the release, parameters and settings. Record material AI decisions concisely. Each member should be ready to trace one relevant code section and explain the associated physics or validation result. The final assessed handoff remains in Week 13.

## Slide 14: What Makes Your Result Trustworthy?

Use these three prompts as the exit ticket. Name the method from the requested output, identify one code step and one validation result, and state the capstone item that still needs attention. A trustworthy result is one that another person can reproduce and the group can explain.
