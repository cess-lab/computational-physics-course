# Bridge circuit: solution using branch currents

Status: COMPLETE — lecturer approved the revised outline, circuit mapping, Teaching Courseware style, built-in image backend, Slide 3 sample and full production. Six final slides passed visual/scientific QA; six English presenter notes are embedded; the PPTX was structurally validated and rendered successfully. The lecturer explicitly approved pinning Sol/high workers after runtime inheritance failed; see qa/explicit-model-exception.md.
Question-image approval: the lecturer said “ok thats good. now generate the slides for the solution” after viewing the physical branch-current image.
This approval applies to the question image; this revised branch-current slide outline replaces the earlier mesh-current outline.

Six solution slides are proposed, without a cover or repeated question page.
Audience: PHY4605 Year-2 physics, optional three-unknown extension.
All written content and presenter notes: English.
The approved question's I1–I5 labels always denote PHYSICAL BRANCH currents.
No mesh-current variables or loop-current arrows are introduced.
Final solution-slide images, prompt jobs, deck specification, English notes and PPTX are complete. Slide 3 is the accepted sample; all five remaining images were recorded through the bundled result script.

## Strict circuit facts

- Ideal source Vs = 24 V, positive above negative.
- R1=3 ohm; R2=1 ohm; R3=2 ohm; R4=3 ohm; R5=2 ohm; R6=4 ohm; R7=6 ohm; R8=3 ohm; Rb=6 ohm.
- I1 travels from B through R4, source and R1 into A.
- I2 travels A to B through R7.
- I3 travels A to C through Rb.
- I4 travels A to C through R2, R3 and R8.
- I5 travels C to B through R6 and R5.
- Correct physical branch-current answer in this naming convention:
  I1=2.50 A; I2=1.50 A; I3=0.50 A; I4=0.50 A; I5=1.00 A.
- These labels differ from the earlier retired mesh-current image.
- Circuit equation coefficients below have units of ohms; right-hand sides have units of volts.

## Slide 1: Follow the five branch currents

- Components in the same series path carry the same current.
- Source branch: I1; vertical A–B branch: I2; diagonal A–C branch: I3.
- Upper/right A–C branch: I4; lower C–B branch: I5.
- The given arrows define positive reference directions.
- Visual/layout role: large faithful circuit with branch arrows and a compact path key; preserve all resistor values, source polarity and node labels.
- Required image: approved question as strict circuit reference. Retain the actual supplied circuit, all values and arrows; compose explanation around it. Surrounding question prose is not required. No cropping of a complete slide merely to recover a new illustration.

  ![Approved physical branch-current question](/Users/khairuladib/MATLAB-Drive/Kuliah/computational-physics-course/Week03/Week03_Bridge_Circuit_Question.png)

## Slide 2: Apply current conservation at the junctions

- At A, I1 = I2 + I3 + I4.
- At C, I5 = I3 + I4.
- At B, I2 + I5 = I1; this repeats the information already supplied by A and C.
- Therefore solve for I2, I3, I4 first; recover I1 and I5 afterwards.
- Visual/layout role: labelled junction A/C current diagrams and two large conservation equations, with a short branch-to-node reference.
- Required image: approved question as strict reference for node names, connected branches and arrow directions. Node diagrams must agree with it exactly.

  ![Strict junction and branch-direction reference](/Users/khairuladib/MATLAB-Drive/Kuliah/computational-physics-course/Week03/Week03_Bridge_Circuit_Question.png)

## Slide 3: Apply voltage conservation around closed paths

- Left path, B through source to A then R7 to B:
  24 = (3+3)I1 + 6I2 = 6I1 + 6I2.
- Lower triangle, A to B, B to C, C to A:
  6I2 = 6I5 + 6I3.
- Upper triangle compares the two A-to-C routes:
  6I3 = (1+2+3)I4 = 6I4.
- Each coefficient is a resistance in ohms, so every term is a voltage in volts.
- Visual/layout role: three clear equation rows with explicit named paths and short explanations of signs; use the branch-current directions exactly as supplied. A closed traversal is used for Kirchhoff's voltage law without assigning a current to that loop.
- Required image: approved question as strict circuit/path reference. Any compact circuit must preserve its topology and values.

  ![Strict closed-path reference](/Users/khairuladib/MATLAB-Drive/Kuliah/computational-physics-course/Week03/Week03_Bridge_Circuit_Question.png)

## Slide 4: Solve three independent branch currents

- Substitute I1=I2+I3+I4 and I5=I3+I4 into the voltage equations.
- Reduced equations:
  12I2 + 6I3 + 6I4 = 24;
  6I2 - 12I3 - 6I4 = 0;
  6I3 - 6I4 = 0.
- Exact MATLAB code:
  A = [12 6 6; 6 -12 -6; 0 6 -6];
  b = [24; 0; 0];
  x = A\b;
- Read x in the declared order [I2; I3; I4] = [1.50; 0.50; 0.50] A.
- Visual/layout role: reduced equations or compact matrix above readable monospaced code and the answer vector. Keep the unknown order explicit. No interface screenshot.
- Required images: none; equations and code are strict source facts.
- Presenter notes can include the hand solution: I3=I4; I2=3I3; hence 48I3=24 and I3=0.50 A.

## Slide 5: Recover and interpret all five currents

- I1 = I2+I3+I4 = 2.50 A.
- I5 = I3+I4 = 1.00 A.
- All five branch currents: I1=2.50 A, I2=1.50 A, I3=0.50 A, I4=0.50 A, I5=1.00 A.
- All values are positive, so actual conventional current follows the arrows.
- Visual/layout role: faithful circuit with values beside the branch arrows, plus a concise answer key; no mesh-current labels.
- Required image: approved question as strict input for circuit, original arrows and component values; add the solved branch-current values while preserving all physical relationships.

  ![Strict reference for final branch-current answers](/Users/khairuladib/MATLAB-Drive/Kuliah/computational-physics-course/Week03/Week03_Bridge_Circuit_Question.png)

## Slide 6: Check both current and voltage balances

- At A: 2.50 = 1.50 + 0.50 + 0.50 A.
- At C: 1.00 = 0.50 + 0.50 A.
- Left path: 24 = 6(2.50) + 6(1.50) = 15 + 9 V.
- Lower and upper paths: 6(1.50)=6(1.00)+6(0.50), giving 9=6+3 V; 6(0.50)=6(0.50), giving 3=3 V.
- Visual/layout role: current-balance and voltage-balance checks in separate readable groups, with sage used only for checked outcomes; include units explicitly in typeset equations.
- Required images: none.
- Presenter-note support only: independent nodal calculation gives VA=16.5 V, VB=7.5 V, VC=13.5 V relative to source negative; source power and resistor dissipation both equal 60 W.

## Required-image mapping for approval

The approved image is the strict circuit and arrow reference on slides 1, 2, 3 and 5.
Slides 4 and 6 use exact equations and computed evidence.
The original configuration, all nine resistance values, 24 V source polarity, A/B/C labels and I1–I5 branch definitions are fixed throughout.
No question-image approval is treated as approval of a generated solution-slide sample.

## Subsequent mandatory gates

After outline and image-mapping approval, confirm the course's Teaching Courseware style and the built-in image backend, then generate exactly one representative solution-slide sample for approval.
After sample approval, prepare final state and prompt jobs; dispatch remaining slides to workers inheriting the coordinator's exact model and effort; inspect and record every result; finalize English notes and assemble a 16:9 PPTX.
