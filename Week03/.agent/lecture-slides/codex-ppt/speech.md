# Week 03 speaker notes

## Slide 1: Linear Systems: Assemble and validate two-loop Kirchhoff equations

This week we turn a familiar two-loop DC circuit into a small computational model. The point is not simply to ask MATLAB for two numbers. We want to keep the circuit, equations, matrix, solve, check, and physical interpretation connected.

## Slide 2: Choose current directions at the junction before writing equations

Start with the directions, before any algebra. Both mesh arrows are clockwise. At the top junction, I1 arrives from the left, while I2 continues to the right and the assigned shared current leaves downward. That gives I1 = I2 + I_shared, or I_shared = I1 - I2. The source values and private resistances suggest I1 should be larger than I2. We will treat that as a prediction to check later, not as a proof.

## Slide 3: Walk each loop in words before writing symbols

Use the single circuit drawing as our anchor; we do not need to redraw the same circuit twice. First walk the left loop: I1 passes through its private resistor and then down the shared branch. Then walk the right loop: I2 passes through its private resistor, while the shared-branch contribution is reversed relative to the assigned downward direction. The two distinct walks produce the two exact KVL equations, and every resistance-current term has voltage units.

## Slide 4: Turn each Kirchhoff equation into one matrix row

Now change representation carefully. The first equation becomes row one, the second becomes row two, and the source terms keep the same order in b. The matrix is only useful because each entry can still be traced back to a term in the circuit equations.

## Slide 5: Keep the units visible in A*x=b

The numerical entries are not unitless. A carries ohms, x carries amperes, and b carries volts, so A*x also carries volts. Keeping those units visible helps us catch a matrix that looks numerically plausible but represents the wrong physical quantities.

## Slide 6: Audit the matrix before asking MATLAB to solve

Before solving, audit each coefficient and follow the colour path from cell to connector to physical-origin callout. The blue cells are A11 and A22, the ochre cell is A12, and the sage cell is A21; those same colours must stay attached to the corresponding explanations. The diagonal entries collect the resistances multiplying a mesh current, while the negative off-diagonal entries come from the shared branch and opposing directions. Ask which row, which column, which sign, and which unit before trusting the matrix.

## Slide 7: Solve the supplied system with MATLAB backslash

The MATLAB code is supplied so that our attention stays on the physical model and verification. The variables store the resistances and sources, A and b preserve the equation order, and backslash returns the two mesh-current entries. Read the output with the units and directions already defined.

## Slide 8: Reconstruct the current in the shared branch

The mesh currents are convenient unknowns, but the shared resistor carries their difference. Subtract I2 from I1 using the assigned shared direction. If the result were negative, that would tell us the actual branch direction is opposite to the arrow we chose.

## Slide 9: Validate the original equations directly

A solver call is not the validation. Substitute the currents back into the original KVL equations. Both reconstructed values reproduce their source terms, and the difference vector is zero within tolerance. This checks the physical equations that the matrix was meant to represent.

## Slide 10: Read the numbers back into the circuit

Return to the circuit. The positive currents agree with the assumed clockwise directions, and I1 > I2 matches the initial prediction. The shared current therefore follows the mesh-1 direction. A negative value would be a direction statement, not automatically a MATLAB failure.

## Slide 11: A plausible matrix can still encode the wrong circuit

Here is the important debugging contrast. If one shared-resistance sign is flipped, MATLAB can still return finite numbers. The failure appears when those numbers are tested in the correct original equations. Syntax success is not physical correctness.

## Slide 12: Future exposure — the same pattern scales to a bridge circuit

This is optional future exposure rather than a new Core derivation. Notice the corrected geometry: R7 separates I1 and I2, while the diagonal resistor Rb separates I2 and I3. The three clockwise arrows sit inside their actual faces, and the diagonal resistor follows its branch. The same modelling pattern leads to three equations and a 3×3 system, but we are not solving this network step by step today.

## Slide 13: Self-activity — sketch the bridge matrix before MATLAB

Use the bridge as a short self-activity. Mark I1, I2, and I3, identify R7 as the I1-I2 shared branch and Rb as the I2-I3 shared branch, predict the 3×3 matrix size, and decide which entries come from self-resistance or shared branches. Then state one validation check you would use. Stop at the scaffold; the point is decomposition, not completing the coefficients today.

## Slide 14: Working exposure — separate representation changes from physical input changes

These two cases look similar computationally but mean different things physically. Reordering A and b together changes the representation while preserving the solution. Changing V2 changes the physical input, so both coupled current entries move. Keep residual, rank, conditioning, and power balance as optional stretch checks.

## Slide 15: Exit ticket — carry the model-to-check chain forward

Close with four short pieces of evidence. Predict the unknowns and directions, map one coefficient to its physical term, write one direct-substitution check, and interpret a negative current together with one limitation. The same chain will transfer to larger mesh or node-voltage models.
