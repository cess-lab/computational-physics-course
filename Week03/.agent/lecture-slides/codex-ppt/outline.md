# PHY4605 Week 03 — Linear Systems: Assemble and validate two-loop Kirchhoff equations

**Status:** REVISION COMPLETE — revised sample approved, all 15 slide jobs recorded, assembled PPTX validated, and full-size visual QA completed on 2026-09-08.

**Audience:** Year-2 physics students with familiar circuit mathematics but uncertain retained MATLAB foundations.

**Teaching goal:** Move from a small two-loop DC circuit to Kirchhoff equations, a 2×2 system, MATLAB backslash, direct-substitution validation, physical interpretation, and optional transfer to a bridge-style three-mesh system.

**Narrative spine:** physical question → directions and junction → loop words → equations → matrix rows → units → coefficient audit → MATLAB solve → reconstructed current → validation → interpretation → plausible wrong matrix → bridge exposure → self-activity → controlled comparison → exit ticket.

**Visual direction:** Retain the approved Teaching Courseware style: warm-white canvas, deep navy structure, dusty blue model content, sage validation, muted ochre prompts, subdued coral only for defects, projection-readable typography, readable MATLAB fragments, labelled scientific diagrams, varied layouts, no slide numbers, no timings, no outer frame.

## Slide outline

### Slide 1: Linear Systems: Assemble and validate two-loop Kirchhoff equations

- **Key points:** A two-loop circuit can be written as two equations; a 2×2 system stores them; MATLAB can solve them; the result needs a physical check.
- **Visual idea:** Conceptual circuit → matrix → validation → interpretation path.
- **Role:** Cover / driving question.
- **Required images:** None.

### Slide 2: Choose current directions at the junction before writing equations

- **Key points:** Clockwise mesh currents; I1 enters the top junction; I2 and I_shared leave; I1 = I2 + I_shared; I_shared = I1 − I2; I1 > I2 is the initial prediction.
- **Visual idea:** Exact circuit with unambiguous clockwise loop arrows and top-junction arrows, plus a compact prediction/sign panel.
- **Role:** Merged prediction and shared-branch sign convention.
- **Required images:**
  - `assets/strict/circuit_mesh_model.png` — strict circuit with values, polarities, clockwise mesh arrows, and top-junction directions.
  - `assets/strict/shared_current_equation.png` — strict shared-current relationship.

### Slide 3: Walk each loop in words before writing symbols

- **Key points:** One physical loop gives one equation; shared contributions follow the chosen directions; resistance-current terms have voltage units.
- **Visual idea:** One circuit shown once as the anchor, with distinct left/right loop-walk explanations leading to exact KVL equations.
- **Role:** Derivation / plain-language bridge.
- **Required images:** `assets/strict/circuit_mesh_model.png` shown once; `assets/strict/kvl_equations.png` for the exact equations.

### Slide 4: Turn each Kirchhoff equation into one matrix row

- **Key points:** Preserve unknown order; one equation per row; b stores matching source terms.
- **Visual idea:** Equation-to-matrix row connectors.
- **Role:** Representation mapping.
- **Required images:** `assets/strict/matrix_map.png`.

### Slide 5: Keep the units visible in A*x=b

- **Key points:** A in ohms, x in amperes, b in volts, and A*x in volts.
- **Visual idea:** Large exact numeric system with unit badges.
- **Role:** Units audit.
- **Required images:** `assets/strict/numeric_system_units/numeric_system_units.png`.

### Slide 6: Audit the matrix before asking MATLAB to solve

- **Key points:** Trace all four coefficients to their physical origins and signs.
- **Visual idea:** Highlighted matrix and origin table with a matched colour path from cell to connector to callout.
- **Role:** Coefficient tracing.
- **Required images:** `assets/strict/matrix_audit.png`.

### Slide 7: Solve the supplied system with MATLAB backslash

- **Key points:** Store parameters, build A and b, use backslash, read the two currents.
- **Visual idea:** Exact MATLAB code with physical-object callouts and output.
- **Role:** Code mapping.
- **Required images:** `assets/strict/solve_code.png`, `assets/strict/solve_output.png`.

### Slide 8: Reconstruct the current in the shared branch

- **Key points:** I_shared is the mesh-current difference; the locked result is 1 A; a negative result reverses the assigned direction.
- **Visual idea:** Highlighted branch and subtraction flow.
- **Role:** Derived physical quantity.
- **Required images:** `assets/strict/shared_current_equation.png`, `assets/strict/shared_current_result.png`.

### Slide 9: Validate the original equations directly

- **Key points:** Reconstruct both KVL values; both reproduce the sources; the difference vector is zero within tolerance.
- **Visual idea:** Two validation lanes leading to an accepted-model result.
- **Role:** Validation evidence.
- **Required images:** `assets/strict/validation_equations.png`, `assets/strict/validation_code.png`.

### Slide 10: Read the numbers back into the circuit

- **Key points:** Positive directions, I1 > I2 prediction, shared-current direction, and negative-sign meaning.
- **Visual idea:** Exact circuit with interpretation callouts.
- **Role:** Physical interpretation.
- **Required images:** `assets/strict/circuit_mesh_model.png`, `assets/strict/solution_summary.png`.

### Slide 11: A plausible matrix can still encode the wrong circuit

- **Key points:** A finite MATLAB result can still fail the original physical equations.
- **Visual idea:** Correct/wrong-sign comparison followed by failed validation.
- **Role:** Debugging diagnosis.
- **Required images:** `assets/strict/wrong_sign_matrix.png`, `assets/strict/wrong_sign_validation.png`.

### Slide 12: Future exposure — the same pattern scales to a bridge circuit

- **Key points:** Clockwise I1, I2, and I3 lead to three equations and a 3×3 A*x=b scaffold; R7 couples I1-I2 and diagonal Rb couples I2-I3; no worked numerical solution.
- **Visual idea:** Corrected bridge-style network with a diagonal Rb and face-contained arrows → 3×3 symbolic scaffold.
- **Role:** Optional transfer preview.
- **Required images:** corrected `assets/strict/bridge_mesh_model.png`, `assets/strict/bridge_matrix_scaffold.png` using I1/I2/I3.

### Slide 13: Self-activity — sketch the bridge matrix before MATLAB

- **Key points:** Identify I1/I2/I3 and shared branches R7/Rb; predict matrix structure; distinguish self/shared terms; choose a validation check; stop before coefficients.
- **Visual idea:** Network, prompt path, and blank scaffold.
- **Role:** Guided self-activity.
- **Required images:** corrected `assets/strict/bridge_mesh_model.png`, `assets/strict/bridge_matrix_scaffold.png` using I1/I2/I3.

### Slide 14: Working exposure — separate representation changes from physical input changes

- **Key points:** Reorder A and b together without changing the solution; perturb V2 and observe both coupled currents; stretch checks remain optional.
- **Visual idea:** Two large visual stories with exact evidence callouts and a small stretch strip.
- **Role:** Graphical controlled comparison.
- **Required images:** `assets/strict/reorder_evidence.png`, `assets/strict/source_perturbation_evidence.png`.

### Slide 15: Exit ticket — carry the model-to-check chain forward

- **Key points:** PREDICT, MAP, CHECK, and INTERPRET.
- **Visual idea:** Balanced 2×2 response grid and compact transfer cue.
- **Role:** Transfer and reflection.
- **Required images:** None.

## Strict asset plan

Existing strict two-loop, equation, matrix, MATLAB, validation, and wrong-sign assets remain unchanged except for the canonical circuit diagram, which now includes the top-junction arrows. The bridge assets are corrected so the diagonal Rb is rotated along its branch, each clockwise arrow sits inside its mesh face, and the unknowns use I1/I2/I3. New strict assets are:

- `bridge_mesh_model.png`: bridge-style network with three mesh currents and no numerical values.
- `bridge_matrix_scaffold.png`: symbolic 3×3 coefficient matrix, I1/I2/I3 mesh-current vector, and source vector.
- `reorder_evidence.png`: exact maximum reordering difference.
- `source_perturbation_evidence.png`: exact V2 perturbation, perturbed current vector, and delta vector.

The bridge slides are optional future exposure. They do not add Core assessment requirements or reveal a completed bridge solution.
