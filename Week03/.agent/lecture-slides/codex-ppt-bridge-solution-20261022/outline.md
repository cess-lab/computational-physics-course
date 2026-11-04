# Bridge circuit: three-mesh worked solution

Status: SUPERSEDED DRAFT — the lecturer requested branch arrows and currents entering/leaving nodes. The current question now uses I1–I5 for physical branch currents. This outline's I1–I3 mesh-current convention must be revised before approval or generation. Its circuit-image link now resolves to the revised branch-current question; do not reuse that image with the mesh labels below without an explicit new mapping.
Proposed length: 6 solution slides, without a separate cover.
Audience: PHY4605 Year-2 physics; optional three-mesh extension to Week 03.
All slide text and presenter notes will be in English. No teaching durations or slide numbers.
This is an additional worked example; it does not replace the existing Week 03 deck.
No solution-slide image or PPTX has been generated.

## Strict numerical and physical facts

- One ideal DC voltage source, Vs = 24 V, positive terminal above negative.
- R1 = 3 ohm; R2 = 1 ohm; R3 = 2 ohm; R4 = 3 ohm; R5 = 2 ohm; R6 = 4 ohm; R7 = 6 ohm; R8 = 3 ohm; Rb = 6 ohm.
- Preserve all nine resistor positions and connections from the supplied image.
- A = upper junction after R1; B = lower junction after R4; C = lower-right junction.
- I1, I2, I3 are clockwise mesh currents, not the currents of every shared branch.
- Exact answer: I1 = 2.50 A; I2 = 1.00 A; I3 = 0.50 A.
- Each slide has one main learning job. A six-slide count is proposed for this bounded supplement.

## Slide 1: Shared resistors carry differences of mesh currents

- I1 is the left rectangle; I2 is the lower triangle; I3 is the upper-right triangle.
- All three reference directions are clockwise.
- Through R7, A to B: I1 - I2.
- Through Rb, A to C: I2 - I3; I1 and I3 share no resistor.
- Visual/layout: large annotated circuit with two short current callouts; explain opposing contributions without revealing the answer.
- Required image: numerical question image as scientific reference for the circuit. Redraw only the circuit with identical connectivity, values, labels, and source polarity; the surrounding question text is not required here. It is not a style reference and must not be cropped into an illustration.

  ![Numerical bridge-circuit question](/Users/khairuladib/MATLAB-Drive/Kuliah/computational-physics-course/Week03/Week03_Bridge_Circuit_Question.png)

## Slide 2: Write one Kirchhoff equation for each mesh

- Apply sum of voltage drops = source rise, following each clockwise mesh.
- Mesh 1: 3I1 + 6(I1 - I2) + 3I1 = 24.
- Mesh 2: 6(I2 - I1) + 6(I2 - I3) + (2 + 4)I2 = 0.
- Mesh 3: (1 + 2 + 3)I3 + 6(I3 - I2) = 0.
- Visual/layout: three readable equation rows, aligned with mesh names and compact branch descriptions; all products are resistance in ohms times current in amperes, giving volts.
- Required image: same numerical question image, scientific reference only for a small faithful circuit if space permits; no additional source image.

  ![Circuit connections and values](/Users/khairuladib/MATLAB-Drive/Kuliah/computational-physics-course/Week03/Week03_Bridge_Circuit_Question.png)

## Slide 3: Assemble the three-by-three linear system

- Collect coefficients: 12I1 - 6I2 = 24; -6I1 + 18I2 - 6I3 = 0; -6I2 + 12I3 = 0.
- A = [12 -6 0; -6 18 -6; 0 -6 12], x = [I1; I2; I3], b = [24; 0; 0].
- Diagonal entries add resistances around a mesh; off-diagonal entries are negative shared resistances.
- A entries are in ohms; b entries are in volts; x is in amperes.
- Visual/layout: central matrix with a short row-to-equation mapping and a callout explaining the two zeros.
- Required images: none; equations and values are strict source facts.

## Slide 4: Solve for the clockwise mesh currents

- Supply runnable base-MATLAB code:
  A = [12 -6 0; -6 18 -6; 0 -6 12];
  b = [24; 0; 0];
  I = A\b;
- The output vector follows the column order I1, I2, I3.
- I1 = 2.50 A; I2 = 1.00 A; I3 = 0.50 A.
- All answers are positive, so the assumed clockwise directions agree with the physical directions.
- Visual/layout: readable monospaced code beside a large ordered answer vector; no screenshot of the MATLAB interface.
- Required images: none.
- Presenter-note support, to be written after approval: algebraic check I3 = I2/2 and I1 = 2 + I2/2; substituting into mesh 2 gives 12I2 = 12.

## Slide 5: Recover the physical branch currents

- R1 and R4: 2.50 A; along the top-left branch toward A and bottom-left return from B, respectively.
- R7: I1 - I2 = 1.50 A, A to B.
- Rb: I2 - I3 = 0.50 A, A to C.
- R2, R3 and R8: 0.50 A, A to C via the upper/right route; R5 and R6: 1.00 A, C to B.
- Visual/layout: same circuit with explicit branch arrows and current labels, plus concise mesh-current/branch-current comparison; keep resistor values readable.
- Required image: same numerical question image as strict topology/value reference; redraw faithfully, adding computed branch arrows.

  ![Strict circuit reference for branch-current reconstruction](/Users/khairuladib/MATLAB-Drive/Kuliah/computational-physics-course/Week03/Week03_Bridge_Circuit_Question.png)

## Slide 6: Validate the result with voltage and current balances

- Mesh 1: 3(2.50) + 6(2.50 - 1.00) + 3(2.50) = 24 V.
- Mesh 2: 6(1.00 - 2.50) + 6(1.00 - 0.50) + 6(1.00) = 0 V.
- Mesh 3: 6(0.50) + 6(0.50 - 1.00) = 0 V.
- At A: incoming 2.50 A = 1.50 A + 0.50 A + 0.50 A outgoing.
- Visual/layout: compact voltage-balance evidence above a simple current-split check; sage used for checked results.
- Required images: none; a labelled node A current-split schematic may be generated from strict branch-current facts.
- Optional presenter-note evidence only: independent nodal analysis gives VA = 16.5 V, VB = 7.5 V, VC = 13.5 V relative to the source negative terminal; total resistor dissipation equals source power, 60 W.

## Required-image mapping for approval

The one numerical question image is the strict scientific circuit reference on slides 1, 2 (if a small circuit is used), and 5. It supplies topology, resistor values, source polarity, and mesh directions. No old key-points text or old matrix panel is reused. Slides 3, 4, and 6 are generated from the retained equations and computed evidence.

## Next production gates

1. Lecturer approves this six-slide outline and the required-image mapping.
2. Confirm the course-mandated Teaching Courseware style and built-in image backend.
3. Generate exactly one representative sample (proposed Slide 2), and obtain sample approval.
4. Prepare final prompt jobs and state, dispatch exact-model/effort-inheriting slide workers, inspect and record results.
5. Finalize English presenter notes, assemble, validate and deliver an additional PPTX directly under Week03/.
