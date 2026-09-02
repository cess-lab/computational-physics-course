# PHY4605 Week 03 — From Kirchhoff equations to a checkable 2×2 solve

**Status:** COMPLETE — lecturer approved the 14-slide sequence and strict-asset mapping on 2026-09-02, approved the representative Slide 06 sample, and the final PPTX passed assembly and QA on 2026-09-02.

**Audience:** Year-2 physics students with familiar circuit mathematics but uncertain retained MATLAB foundations.

**Teaching goal:** Move from a small two-loop DC circuit to two Kirchhoff equations, map those equations into a 2×2 system, solve with MATLAB backslash, reconstruct the shared-branch current, validate the original equations directly, and interpret the signs physically.

**Narrative spine:** physical question → prediction → circuit/sign convention → shared-branch relationship → Kirchhoff equations → matrix rows and units → coefficient audit → MATLAB solve → reconstructed current → direct-substitution validation → physical interpretation → plausible wrong matrix → controlled working exposure → exit ticket.

**Blueprint alignment:** The Core route uses only two unknown mesh currents and covers sign convention, two Kirchhoff equations, coefficient/source mapping, units, supplied backslash syntax, shared-current reconstruction, direct substitution, physical interpretation, and one plausible-but-wrong sign diagnosis. Equivalent equation ordering, source perturbation, residuals, rank, conditioning, and power balance remain Working exposure or Optional stretch.

**Visual direction:** Use the existing Week 02 deck as a style, flow, and layout reference: open warm-white canvas; deep navy titles and structure; dusty blue model content; quiet sage for expected or validated states; muted ochre for prompts or warnings; subdued coral only for a genuine defect. Keep projection-readable sans-serif type, readable monospaced MATLAB fragments, thin functional lines, labelled diagrams, moderate density, varied page roles, no slide numbers, no timings, no source labels, and no outer frame. The deck style is the installed codex-ppt Teaching Courseware reference adapted to the Week 02 visual rhythm.

## Slide outline

### Slide 1: From a circuit sketch to a checkable current

- **Key points:** A physical circuit can be written as two equations; a 2×2 system stores those equations compactly; MATLAB can solve the system; the result still needs a physical check.
- **Visual idea:** A sparse conceptual two-loop motif on the right connected to a lower reasoning path: circuit → equations → solve → check → interpretation. Do not show exact component values on this cover.
- **Layout role and intent:** Cover / driving question; establish that the matrix is a representation of the circuit, not a replacement for the physics.
- **Required images:** None. Use a conceptual generated visual without exact numerical claims.

### Slide 2: Predict the current directions before solving

- **Key points:** Choose clockwise mesh currents I1 and I2; use the stated source polarities and resistor values; the chosen directions should give positive currents; the larger source and smaller left private resistance suggest I1 > I2.
- **Visual idea:** The exact two-loop circuit occupies the left two-thirds, with clockwise arrows, source polarities, resistor labels, and a compact sage prediction panel on the right.
- **Layout role and intent:** Prediction / physical intuition; activate the physical model before showing algebra or MATLAB.
- **Required images:**
  - assets/strict/circuit_mesh_model.png — strict input; exact circuit topology, resistor values, source values, polarities, and clockwise mesh-current arrows; derived deterministically from the Week 03 learning-note circuit.

### Slide 3: The shared resistor is where the two loop currents meet

- **Key points:** The two mesh currents oppose one another in the shared branch; define the shared direction to follow mesh 1; Ishared = I1 − I2; a negative result would mean the actual current is opposite to the assigned direction.
- **Visual idea:** Zoom the shared resistor from the circuit and show two opposing contributions converging into one branch-current equation, with a short sign-meaning callout.
- **Layout role and intent:** Concept relationship / misconception repair; make the source of the off-diagonal signs physically visible.
- **Required images:**
  - assets/strict/circuit_mesh_model.png — strict input; reuse the exact circuit as the source context for the shared branch.
  - assets/strict/shared_current_equation.png — strict mathematical input; preserve Ishared = I1 − I2 and the direction meaning.

### Slide 4: Walk each loop in words before writing symbols

- **Key points:** For the left loop, private-resistor drop plus shared-resistor drop equals V1; for the right loop, the shared contribution is reversed; every resistance-times-current term has units of volts; one physical loop gives one equation.
- **Visual idea:** Two horizontal loop-walk lanes, left and right, with short word statements, directional arrows, and a compact units check.
- **Layout role and intent:** Derivation / plain-language bridge; keep the reasoning order visible before introducing matrix notation.
- **Required images:**
  - assets/strict/kvl_equations.png — strict equation input; preserve the two symbolic KVL equations and Ω × A = V.

### Slide 5: Turn each Kirchhoff equation into one matrix row

- **Key points:** Keep the unknown order x = [I1; I2]; row 1 comes from the left-loop equation; row 2 comes from the right-loop equation; b stores the matching source terms; every coefficient can be traced to a resistor term.
- **Visual idea:** Equation-to-matrix mapping with coloured row connectors: left KVL → row 1, right KVL → row 2, source rises → b.
- **Layout role and intent:** Representation change / mapping; show exactly how physical equations become A*x=b.
- **Required images:**
  - assets/strict/matrix_map.png — strict mathematical input; preserve the symbolic coefficient matrix, unknown vector, source vector, and row/column order.

### Slide 6: Keep the units visible in A*x=b

- **Key points:** With the locked values, A = [3 −1; −1 4] Ω, x = [I1; I2] A, and b = [5; 2] V; A*x has units of volts; the numerical matrix is meaningful only together with the physical units.
- **Visual idea:** Large centred numeric system with unit badges under A, x, and b, plus a short dimensional-analysis strip reading Ω × A = V.
- **Layout role and intent:** Units audit / worked representation; repair the common mistake of treating matrix entries as unitless numbers.
- **Required images:**
  - assets/strict/numeric_system_units.png — strict mathematical input; preserve the locked matrix, vectors, values, units, and multiplication relationship.

### Slide 7: Audit the matrix before asking MATLAB to solve

- **Key points:** A11 = R1 + Rs = 3 Ω; A12 = −Rs = −1 Ω; A21 = −Rs = −1 Ω; A22 = R2 + Rs = 4 Ω; ask which row, which unknown, which sign, and which unit.
- **Visual idea:** Four-entry matrix audit with each cell connected to its physical origin in the two loop equations; a compact three-question audit prompt at the bottom.
- **Layout role and intent:** Coefficient tracing / error prevention; make the matrix readable in both directions—equation to entry and entry to equation.
- **Required images:**
  - assets/strict/matrix_audit.png — strict text/matrix input; preserve all four coefficient values, physical origins, signs, and units.

### Slide 8: Solve the supplied system with MATLAB backslash

- **Key points:** Store the resistances and source voltages; build A and b in the stated order; use x_A = A_ohm\b_V; read x_A(1) as I1_A and x_A(2) as I2_A; use the supplied solver syntax rather than implementing a solver.
- **Visual idea:** Exact MATLAB code panel on the left with four numbered callouts—parameters, matrix, source vector, backslash—and a small output panel showing the two current entries.
- **Layout role and intent:** Code mapping / guided execution; connect each code block to the physical object it represents.
- **Required images:**
  - assets/strict/solve_code.png — strict MATLAB code input; preserve variable names, punctuation, line breaks, backslash, and indexing.
  - assets/strict/solve_output.png — strict numerical output input; preserve I1_A = 2 A and I2_A = 1 A.

### Slide 9: Reconstruct the current in the shared branch

- **Key points:** Mesh currents are convenient unknowns, but the shared resistor carries their difference; Ishared_A = I1_A − I2_A; the locked solution gives Ishared_A = 1 A; a negative shared value would reverse the assigned branch direction.
- **Visual idea:** A highlighted shared-resistor branch with a subtraction diagram 2 A − 1 A → 1 A, alongside the exact circuit direction cue.
- **Layout role and intent:** Derived physical quantity / interpretation bridge; turn the vector solution back into a measurable branch current.
- **Required images:**
  - assets/strict/shared_current_equation.png — strict mathematical input; preserve the subtraction and direction meaning.
  - assets/strict/shared_current_result.png — strict numerical input; preserve I1_A = 2 A, I2_A = 1 A, and Ishared_A = 1 A.

### Slide 10: Validate the original equations directly

- **Key points:** Rebuild the left and right KVL values from the solved currents; 3(2) − 1(1) = 5 V; −1(2) + 4(1) = 2 V; the difference vector is zero within tolerance; direct substitution checks the equations that represent the circuit.
- **Visual idea:** Two large green validation lanes, one per loop, leading to a single “both equations reproduce the sources” result.
- **Layout role and intent:** Validation / evidence; make the check more important than the solver call.
- **Required images:**
  - assets/strict/validation_equations.png — strict mathematical input; preserve both reconstructed equations and source values.
  - assets/strict/validation_code.png — strict MATLAB code input; preserve the reconstructed-value variables, difference vector, and 1e−12 assertion.

### Slide 11: Read the numbers back into the circuit

- **Key points:** Positive I1 and I2 follow the assumed clockwise arrows; I1 > I2 matches the prediction; the shared current follows mesh 1; a negative current would indicate reversed physical direction, not automatically a failed calculation.
- **Visual idea:** The exact circuit on the left with the three solved current directions highlighted, and a concise interpretation panel on the right: sign → direction, magnitude comparison → prediction, difference → shared branch.
- **Layout role and intent:** Physical interpretation / close the reasoning loop; return from numerical output to the original circuit.
- **Required images:**
  - assets/strict/circuit_mesh_model.png — strict input; reuse the exact circuit as the interpretation context.
  - assets/strict/solution_summary.png — strict numerical/text input; preserve the solved currents and sign interpretation.

### Slide 12: A plausible matrix can still encode the wrong circuit

- **Key points:** Flipping one off-diagonal sign can still produce finite MATLAB output; the wrong matrix changes the physical shared-resistor term; the correct equations expose a mismatch of −1.6923 V in the left equation; successful execution is not proof of a correct model.
- **Visual idea:** Split comparison: correct matrix in navy/sage versus wrong-sign matrix in subdued coral, followed by the correct-equation validation failure and a repair cue.
- **Layout role and intent:** Debugging / plausible-but-wrong diagnosis; distinguish syntax success from physical correctness.
- **Required images:**
  - assets/strict/wrong_sign_matrix.png — strict matrix/code input; preserve the single flipped coefficient and the wrong solved vector.
  - assets/strict/wrong_sign_validation.png — strict numerical input; preserve the correct-equation mismatch and its units.

### Slide 13: Working exposure — keep the representation and the physics paired

- **Key points:** Reordering rows is harmless only when the same reorder is applied to b; changing V2 from 2.0 V to 2.1 V changes both coupled currents; equivalent representation preserves the solution, while a physical input change propagates through the coupling; residual, rank, conditioning, and power balance are optional stretch checks.
- **Visual idea:** Two side-by-side mini-panels: “reorder A and b together” with unchanged x, and “change one source” with both current entries changing; a small removable stretch strip at the bottom.
- **Layout role and intent:** Working exposure / controlled comparison; broaden the idea of a linear-system workflow without displacing the Core validation route.
- **Required images:**
  - assets/strict/reordering_perturbation.png — strict numerical input; preserve zero reordering difference, V2 = 2.1 V, x_perturbed_A, and change_in_currents_A.

### Slide 14: Exit ticket — explain the 2×2 solve to a future you

- **Key points:** State the unknowns, directions, and units; map one matrix coefficient to its Kirchhoff term; explain why A*x has units of volts; state Ishared = I1 − I2 and the meaning of a negative value; write one direct-substitution validation; preview transfer to another two-loop or two-node model in the practical.
- **Visual idea:** Four compact response cards—PREDICT, MAP, CHECK, INTERPRET—ending with a small bridge from the two-loop circuit to the practical’s sensor and node-voltage contexts.
- **Layout role and intent:** Transfer / individual reflection; consolidate the Core reasoning chain without revealing a worked answer beyond the already established workflow.
- **Required images:** None. Use exact prompts and a simple generated bridge visual without new numerical claims.

## Strict asset plan

The following assets are planned source inputs for the image-generation phase. They are not yet created. After outline approval, create them under Week03/.agent/lecture-slides/codex-ppt/assets/strict/, inspect each with view_image, and preserve the source/provenance alongside the rendered PNGs.

- circuit_mesh_model.png: deterministic labelled circuit diagram derived from the Week 03 learning-note TikZ source; strict topology, values, polarities, arrows, and labels.
- shared_current_equation.png: TeX rendering of Ishared = I1 − I2 with the branch-direction meaning.
- kvl_equations.png: TeX rendering of the two symbolic KVL equations and Ω × A = V.
- matrix_map.png: TeX rendering of the symbolic A*x=b mapping with row/column order.
- numeric_system_units.png: TeX rendering of the locked numeric matrix/vector system and units.
- matrix_audit.png: deterministic matrix-entry audit showing A11, A12, A21, and A22 with physical origins.
- solve_code.png: strict MATLAB code excerpt from the Week 03 lecture demonstration.
- solve_output.png: strict numerical result I1_A = 2 A and I2_A = 1 A.
- shared_current_result.png: strict numerical result for Ishared_A = 1 A.
- validation_equations.png: strict reconstructed left/right KVL equations.
- validation_code.png: strict MATLAB validation excerpt and tolerance.
- solution_summary.png: strict solved-current summary and sign interpretation.
- wrong_sign_matrix.png: strict wrong-sign matrix and finite wrong solution.
- wrong_sign_validation.png: strict correct-equation mismatch, including −1.6923 V.
- reordering_perturbation.png: strict working-exposure values for equivalent row ordering and V2 = 2.1 V.

No numerical plot is required for the Core Week 3 route. The deck should not invent a graph or approximate numerical evidence with image generation.

## Approval checkpoint

Approval recorded: the lecturer approved the 14-slide sequence and strict-asset mapping on 2026-09-02. The next gates are Teaching Courseware/backend confirmation and exactly one representative sample slide. No final deck artifacts have been generated at this stage.
