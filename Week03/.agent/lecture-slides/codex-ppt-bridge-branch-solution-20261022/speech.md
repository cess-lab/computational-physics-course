## Slide 1: Follow the five branch currents

First identify what each current label means. We have five physical branch currents, and each arrow lies along an actual conducting path. The arrows give our assumed positive directions. A negative answer would tell us that the physical current flows in the opposite direction.

Follow I1 from B to the left, through R4, up through the source, then through R1 into A. There is no junction along that route, so the same current passes through all three components. I2 goes straight down through R7. I3 goes diagonally through the bridge resistor. I4 follows the upper and right-hand route through R2, R3 and R8. I5 returns from C to B through R6 and R5.

Before writing equations, point to the branch carrying each current. This prevents us from assigning a different current to every resistor in a series path. We will use these same five definitions throughout the solution.

## Slide 2: Apply current conservation at the junctions

At A, I1 enters and three currents leave: I2, I3 and I4. Current conservation therefore gives I1 equals I2 plus I3 plus I4. The physical statement is that charge does not accumulate at the junction in this steady DC model.

At C, I3 arrives along the diagonal and I4 arrives from above. Their sum leaves through the lower branch as I5. This gives I5 equals I3 plus I4. Notice that the arrow for I5 points to the left because the lower branch carries current from C towards B.

We could also write I2 plus I5 equals I1 at B. However, substituting the C equation into that expression gives exactly the A equation. It supplies no additional independent information. We can therefore choose I2, I3 and I4 as our three unknowns and calculate I1 and I5 afterwards.

## Slide 3: Apply voltage conservation around closed paths

A closed path lets us compare voltage rises and drops. Its traversal direction is a bookkeeping choice for Kirchhoff's voltage law. The current variables continue to refer to the physical branches shown by the straight arrows.

For the left path, start at B and travel through R4 and the source to R1 and A, then return through R7. The source supplies a rise of 24 volts. R1 and R4 each carry I1 and together have six ohms of resistance. R7 carries I2 and has six ohms. The resulting relation is 24 equals six I1 plus six I2.

For the lower triangle, the voltage drop from A to B can be found directly through R7, or by going from A to C through the bridge resistor and then from C to B through the lower resistors. This gives six I2 equals six I3 plus six I5. The upper triangle compares the two routes from A to C. The bridge resistance is six ohms, and the upper/right series path is also six ohms, so six I3 equals six I4.

Each coefficient represents a resistance in ohms. Multiplying it by current in amperes gives a voltage in volts.

## Slide 4: Solve three independent branch currents

We now remove I1 and I5 using the current-balance equations. In the left voltage equation, replace I1 with I2 plus I3 plus I4. Expanding gives twelve I2 plus six I3 plus six I4 equals 24.

In the lower voltage equation, replace I5 with I3 plus I4, and move all terms to one side. This gives six I2 minus twelve I3 minus six I4 equals zero. The upper equation gives six I3 minus six I4 equals zero.

The column order is fixed as I2, I3 and I4. Each row of A contains the coefficients of one equation in that order. The vector b contains 24, zero and zero. MATLAB's backslash solves this linear system. The three output entries are therefore I2 equals 1.50 amperes, I3 equals 0.50 amperes and I4 equals 0.50 amperes.

We can also check the algebra by hand. The third equation gives I3 equals I4. The second then gives I2 equals three I3. Substituting both relations into the first gives 48 I3 equals 24, so I3 is 0.50 amperes. This agrees with MATLAB.

## Slide 5: Recover and interpret all five currents

We have solved the three chosen unknowns. To recover the source current, add the currents leaving A: 1.50 plus 0.50 plus 0.50 gives I1 equals 2.50 amperes. To recover the lower-branch current, add the currents arriving at C: 0.50 plus 0.50 gives I5 equals 1.00 ampere.

Read the answers along the actual circuit. The source, R1 and R4 carry 2.50 amperes. R7 carries 1.50 amperes from A to B. The diagonal bridge resistor carries 0.50 amperes from A to C. R2, R3 and R8 carry another 0.50 amperes along the upper/right path. R6 and R5 carry 1.00 ampere from C to B.

Every answer is positive, so every assumed current direction is consistent with the solution. The equal currents in the two A-to-C paths also make physical sense: those paths connect the same nodes and have the same total resistance of six ohms.

## Slide 6: Check current and voltage balances

Now substitute the computed values into the original physical relations. At A, 2.50 amperes enters and 1.50 plus 0.50 plus 0.50 amperes leaves. At C, the two incoming half-ampere currents add to the one ampere leaving towards B. These are consistent current balances.

The left path has a 15-volt drop across R1 and R4 together, plus a nine-volt drop across R7. Their sum equals the 24-volt source. The lower triangle has nine volts across R7, which equals three volts across the diagonal resistor plus six volts across the lower series pair. The upper two routes both have a three-volt drop from A to C.

An independent nodal calculation gives A at 16.5 volts, B at 7.5 volts and C at 13.5 volts relative to the source negative terminal. Those differences reproduce the branch currents. As an additional check, the source supplies 24 times 2.50, or 60 watts, and the total resistor dissipation is also 60 watts. These checks support both the numerical values and their physical interpretation.
