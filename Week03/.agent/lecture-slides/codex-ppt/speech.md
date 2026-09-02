# Week 03 speaker notes

## Slide 1: From a circuit sketch to a checkable current

This week we turn a familiar two-loop DC circuit into a small computational model. The central question is not simply whether MATLAB can return two numbers. It is whether those numbers still represent the circuit we started with.

Keep the reasoning chain visible: circuit, equations, matrix, solve, check, interpretation. The matrix is a compact storage format for the physical equations. It is not a replacement for choosing directions, tracking units, or explaining what a current sign means.

## Slide 2: Predict the current directions before solving

Begin with the physical picture. We choose both mesh currents clockwise and state the source polarities and resistance values before doing algebra. Because both sources drive the chosen directions, we expect positive mesh currents. The larger left source and smaller left private resistance suggest that I1 will be greater than I2.

This prediction is useful later. A result that disagrees with it is not automatically wrong, but it is evidence that deserves explanation. The prediction gives us a physical reference before the matrix and solver can make the work look abstract.

## Slide 3: The shared resistor is where the two loop currents meet

The shared resistor is not traversed by two independent physical currents. The two mesh contributions oppose one another in that branch. If the shared-branch direction follows mesh 1, then `Ishared = I1 - I2`.

The sign is a statement about the direction we assigned. If the computed value is negative, the calculation may still be correct; the actual branch current would simply run opposite to the assigned direction. This difference is also the physical source of the off-diagonal signs that will couple the two equations.

## Slide 4: Walk each loop in words before writing symbols

Before writing a matrix, walk around each loop in words. For the left loop, the private-resistor drop and the shared-resistor drop combine to match the left source rise. For the right loop, the shared-resistor contribution is reversed because the mesh direction is opposite through the shared branch.

One physical loop gives one equation. Every resistance-times-current term has units of volts because ohms multiplied by amperes gives volts. The equations should be understandable before they are compressed into matrix notation.

## Slide 5: Turn each Kirchhoff equation into one matrix row

Now collect coefficients without losing their origin. Use the unknown order `x = [I1; I2]`. The first Kirchhoff equation becomes row 1, the second becomes row 2, and the source rises become the matching entries of `b`.

The important habit is bidirectional tracing. Starting from an equation, we should be able to build its row. Starting from a row, we should be able to reconstruct the equation. If a coefficient cannot be explained physically, it is not ready to be trusted.

## Slide 6: Keep the units visible in A*x=b

With the locked values, the system is A = [3 -1; -1 4] ohm, x = [I1; I2] A, and b = [5; 2] V. The matrix entries are not just four unitless numbers. They are resistance coefficients, so multiplying A by a current vector produces volts.

Use the dimensional check as a quick audit: ohms times amperes equals volts. A unit mismatch can reveal that a physical quantity has been placed in the wrong part of the computational representation even when MATLAB accepts the syntax.

## Slide 7: Audit the matrix before asking MATLAB to solve

Read each matrix entry back as a circuit statement. A11 is R1 + Rs, so it is 3 ohm. A12 is -Rs because I2 opposes the shared-resistor current in the left loop. The same shared-resistor logic gives A21 = -1 ohm, while A22 is R2 + Rs = 4 ohm.

Ask four questions for any entry: which row, which unknown, which sign, and which unit? This is a modelling audit, not a memorisation exercise. The negative off-diagonal entries come from the chosen directions and the shared physical branch.

## Slide 8: Solve the supplied system with MATLAB backslash

The supplied MATLAB code now follows the representation we have already audited. It stores the resistances and sources, builds `A_ohm` and `b_V` in the stated order, solves with `x_A = A_ohm\b_V`, and reads the two entries with `x_A(1)` and `x_A(2)`.

The backslash operator is the supplied method for this small linear system. Students do not need to implement a solver from scratch here. The code is useful because each line can be mapped to a physical object: parameters, matrix, source vector, unknown vector, and named currents.

## Slide 9: Reconstruct the current in the shared branch

The solved vector gives the two mesh currents, but the shared resistor carries their difference. Use `Ishared_A = I1_A - I2_A`. With I1_A = 2 A and I2_A = 1 A, the shared current is 1 A in the direction assigned to mesh 1.

This is a reminder that the choice of unknowns is a modelling convenience. We solve for mesh currents because they make the equations compact, then reconstruct the branch quantity that has direct physical meaning.

## Slide 10: Validate the original equations directly

Do not accept the currents just because MATLAB returned finite values. Substitute them into the original equations. The left equation gives 3(2) - 1(1) = 5 V. The right equation gives -1(2) + 4(1) = 2 V.

The validation code reconstructs both voltages, forms `validation_difference_V`, and asserts that the largest absolute difference is below `1e-12`. This check targets the equations that represent the circuit. It is stronger than checking only that the solver executed.

## Slide 11: Read the numbers back into the circuit

Both solved mesh currents are positive, so they follow the clockwise arrows we chose before solving. The inequality I1 > I2 matches the qualitative prediction. Their difference is positive, so the shared-branch current follows the mesh-1 direction.

If a current had been negative, the result would not automatically be a failed calculation. It would say that the actual current direction is opposite to the assumed arrow. Numerical output becomes physical evidence only after this interpretation step.

## Slide 12: A plausible matrix can still encode the wrong circuit

Here the first off-diagonal shared-resistance coefficient has been changed from -Rs to +Rs. MATLAB can still solve that defective system and return finite values. Syntax success is therefore not enough.

Evaluate the wrong currents with the correct original equations. The mismatch vector contains a left-equation error of -1.6923 V. The defect is physical or logical: the shared-resistor term was translated with the wrong sign. The repair is to return to the arrows and original Kirchhoff equations, not merely to ask whether MATLAB ran.

## Slide 13: Working exposure — keep the representation and the physics paired

Two bounded comparisons reinforce the representation idea. If we swap the two equation rows, we must swap the matching entries of `b`; then the physical system is unchanged and the maximum solution difference is zero. That is a representation change.

If V2 changes from 2.0 V to 2.1 V, the physical input changes. Because the loops are coupled, both current entries change: the perturbed vector is [2.0091; 1.0273] A and the change is [0.0091; 0.0273] A. Residual, rank, conditioning, and power balance are useful stretch checks, but they are not required for the Core route today.

## Slide 14: Exit ticket — explain the 2x2 solve to a future you

Close by asking for four short pieces of evidence. State the unknowns, directions, and units. Map one matrix coefficient to its Kirchhoff term. Explain why A*x has units of volts. Write one direct-substitution check and explain what a negative current would mean.

The practical will transfer the same workflow to another two-loop circuit and to a two-node KCL model. The physical context will change, but the habits remain: define the model, preserve signs and units, solve the supplied system, validate the original equations, and interpret the result.
