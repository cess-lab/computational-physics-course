# Week 03 Content Manifest

## Scope

- Week: 03
- Topic: Two-by-two linear systems through Kirchhoff circuits
- Difficulty contract: Core first; Working exposure and Optional stretch removable without breaking the Core route
- Familiar lecture model: two clockwise mesh currents in a two-loop DC resistor circuit with one shared resistor
- MATLAB dependency: MATLAB R2025a or later, base MATLAB only
- Lecture slide status: completed on 2026-09-02 after lecturer approval of the outline and representative sample

## Three Core Ideas

1. A sign convention turns Kirchhoff's laws into two consistent linear equations with units.
2. The coefficients, unknown currents, and source terms map directly into `A*x=b`, solved in MATLAB with the backslash operator.
3. A computed solution is accepted only after reconstructing a branch current and checking the original Kirchhoff equations directly.

## Locked Lecture Circuit

- Unknowns: clockwise mesh currents `I1_A` and `I2_A`
- Left private resistor: `R1_ohm = 2` ohm
- Right private resistor: `R2_ohm = 3` ohm
- Shared resistor: `Rs_ohm = 1` ohm
- Left source: `V1_V = 5` V
- Right source: `V2_V = 2` V
- Shared-branch current convention: positive in the direction of mesh 1 through the shared branch, so `Ishared_A = I1_A - I2_A`

## Locked Equations and Reference Values

With both mesh currents chosen clockwise:

1. `(R1 + Rs) I1 - Rs I2 = V1`
2. `-Rs I1 + (R2 + Rs) I2 = V2`

Therefore

```text
A_ohm = [ 3  -1
         -1   4 ] ohm
x_A   = [I1; I2] A
b_V   = [5; 2] V
```

Reference solution for QA only:

- `I1_A = 2 A`
- `I2_A = 1 A`
- `Ishared_A = 1 A`
- left KVL reconstruction: `3(2) - 1(1) = 5 V`
- right KVL reconstruction: `-1(2) + 4(1) = 2 V`
- residual vector: `[0; 0] V`
- total source power: `12 W`
- total resistor power: `12 W`

## Core Algorithm

1. Draw or read the circuit and name the two unknown loop currents.
2. Choose and state the current directions and voltage-drop convention.
3. Write one Kirchhoff voltage equation for each loop.
4. Collect the coefficients of `I1` and `I2` into one matrix row per equation.
5. Store the two source terms in a column vector.
6. Solve `A*x=b` with MATLAB backslash.
7. Reconstruct the shared-branch current from the two mesh currents.
8. Substitute the solution back into both original Kirchhoff equations.
9. Interpret current signs and relative magnitudes physically.

## Core Validation

Direct substitution into both original Kirchhoff equations is the required Core check. This is intentionally more transparent than beginning with a formal norm or condition number. The reconstructed left and right loop voltages must reproduce the source vector within floating-point tolerance.

## Required Core Checkpoints

- identify the two unknowns and their units;
- state one consistent sign convention;
- predict the likely current directions before solving;
- derive two Kirchhoff equations;
- map each equation to one row of `A` and one entry of `b`;
- explain the units of `A`, `x`, and `b`;
- use supplied backslash syntax;
- reconstruct the shared-branch current;
- validate by direct substitution into both equations;
- interpret positive/negative current signs physically;
- diagnose one plausible but incorrectly signed coefficient matrix.

## Working Exposure

- alternative but equivalent equation ordering;
- small source perturbation as an intuitive introduction to sensitivity;
- recognition that some circuit equations may be redundant or poorly specified.

## Optional Stretch

- algebraic residual vector and scaled residual;
- `rank(A)` and singularity;
- `cond(A)` and conditioning;
- resistor/source power balance;
- diagnosing a numerically solvable matrix that encodes the wrong physical circuit.

## Practical Transfer Contexts

1. two-loop sensor-bias circuit using mesh currents;
2. two-node resistor network using KCL and node voltages;
3. two-loop low-voltage heater circuit with a shared resistor.

The practical contains ten progressive micro-challenges. Every challenge names required evidence and a short defence hook. Student-facing files contain no solved challenge answers.

## Scientific Illustration Decision

No ImageGen asset is required for the learning note or Live Scripts at this stage. The representation barrier is the relationship between two loop directions, the shared resistor, and the equation coefficients; a deterministic labelled TikZ circuit plus an equation-to-matrix map represents that relationship more precisely and reproducibly than a decorative generated image. This decision is recorded in `.agent/learning-notes/qa/illustration-decision.md`.

## Publication Gate

Before publication:

1. compile and visually inspect the learning-note PDF;
2. run the lecture demonstration from a fresh MATLAB session;
3. run the practical baseline from a fresh MATLAB session;
4. run the hidden practical reference solution and confirm all validation checks pass;
5. run MATLAB `checkcode` on both student-facing scripts;
6. verify the final Week 03 lecture-slide `.pptx`, embedded notes, image-based slide structure, and hidden QA record.
