# Bridge-circuit extension — English presenter notes

## Slide 1: Identify three meshes and two shared branches

We will extend the same method to three meshes. This is optional worked exposure: the core Week 3 assessment still uses the two-loop example. Before writing any algebra, identify the three faces. I1 is the left face, I2 is the lower triangular face, and I3 is the upper triangular face. Every mesh reference is clockwise.

Trace the left boundary through R1, R7 and R4, including the source. Trace the lower face through R7, Rb, R6 and R5. Trace the upper face through R2, R3, R8 and Rb. The shared components are R7 between meshes one and two, and Rb between meshes two and three. The left and upper meshes share a node but no resistor branch.

On a shared resistor, clockwise mesh contributions oppose. The net current through R7 in mesh-one direction is I1 minus I2. Along the diagonal in mesh-two direction it is I2 minus I3. These are signed differences, not predictions of the actual current direction. We now apply KVL once to each mesh.

## Slide 2: Derive the left-mesh equation

Start with the left mesh. Walking clockwise gives a source rise Vs. The private resistors R1 and R4 each carry the mesh-one current I1. Through R7, the current in the direction of this walk is I1 minus I2. Therefore the sum of resistor voltage drops is R1 I1 plus R4 I1 plus R7 times I1 minus I2, and that sum equals Vs.

Expand the shared term before collecting coefficients. The positive R7 I1 term joins R1 I1 and R4 I1, giving the diagonal coefficient R1 plus R4 plus R7. The neighbour contribution is minus R7 I2. There is no direct shared resistor with mesh three, so its coefficient is zero.

Read the row in the declared order I1, I2, I3. The coefficients are R1 plus R4 plus R7, minus R7, and zero. The matching source entry is Vs. The negative off-diagonal entry came from the shared-current difference; it was not inserted from a memorised pattern.

## Slide 3: Derive the lower-mesh equation

The lower mesh has two shared resistors, so keep the two current differences separate. Follow mesh two clockwise: go up through R7, down-right through Rb, then return left along R6 and R5. In this direction the R7 current contribution is I2 minus I1, while the Rb contribution is I2 minus I3.

Write the voltage drops first: R7 times I2 minus I1, plus R5 I2, plus R6 I2, plus Rb times I2 minus I3. No voltage source lies around this face, so the sum is zero. A zero right-hand side does not mean that this loop has no current; energy can be transferred through its shared branches.

Expand the brackets and collect the three unknowns. The I1 coefficient is minus R7. The I2 coefficient contains all four boundary resistances: R7, R5, R6 and Rb. The I3 coefficient is minus Rb. This gives row two. Check that we have retained both private bottom resistors and have not confused the two shared components.

## Slide 4: Derive the upper-mesh equation

Now trace the upper triangular mesh clockwise. Its private boundary resistors are R2 and R3 across the top and R8 on the right. Each private resistor carries I3. Returning up-left through the diagonal resistor opposes the mesh-two contribution, so its current in this walk is I3 minus I2.

The KVL equation is therefore R2 I3 plus R3 I3 plus R8 I3 plus Rb times I3 minus I2, equal to zero. Expand the diagonal term. The I2 coefficient becomes minus Rb, and the I3 coefficient becomes R2 plus R3 plus R8 plus Rb.

There is no I1 contribution because mesh one and mesh three share no resistor branch. A common node alone does not create a shared-resistor coefficient in this mesh formulation. In the fixed order I1, I2, I3, the final row is zero, minus Rb, and the upper-mesh resistance sum.

## Slide 5: Assemble the three equations into A*x=b

We now change representation without changing the physics. Place the left-mesh equation in row one, the lower-mesh equation in row two, and the upper-mesh equation in row three. Every column retains the same unknown: first I1, then I2, then I3. Check the complete system against the three equations we have just derived.

The diagonal entries contain the resistance sum around their respective meshes. The shared R7 appears negatively in positions one-two and two-one. The shared diagonal resistor Rb appears negatively in positions two-three and three-two. The two remaining off-diagonal entries are zero because the left and upper faces share no resistor.

Only the first mesh contains the voltage source, so the source column is Vs, zero, zero for the stated polarity and clockwise traversal. Each matrix entry is in ohms, the unknown column is in amperes, and the product gives volts. Once numerical component values are supplied, MATLAB backslash can solve this system; no numerical solution is claimed here.

## Slide 6: Check every coefficient against the circuit

Before solving, audit the coefficient matrix against the circuit. Choose the middle diagonal entry: R7 plus R5 plus R6 plus Rb. Trace all four components around the lower face. If one resistor is missing from that sum, the matrix represents a different model even if MATLAB returns finite numbers.

Now check the shared pairs. The R7 coupling gives both A12 and A21 equal to minus R7. The Rb coupling gives A23 and A32 equal to minus Rb. A13 and A31 are zero because the left and upper meshes share no branch. These patterns follow from this reciprocal resistor network and our consistent clockwise mesh references.

A unit check and a symmetric-looking matrix are useful audits, but they do not replace the original equations. After any numerical solve, reconstruct all three KVL sums directly from the currents and physical parameters. The left sum must reproduce Vs; the lower and upper sums must each reproduce zero within an appropriate voltage tolerance. Finally read any negative current against its chosen reference direction.