# PHY4605 Week 04 Validation Record

Validated on 28 August 2026.

## Student-facing package status

Validated and present:

- `Week04_Eigenproblems_and_Physical_Modes.pdf`
- `Week04_Lecture_Demonstration_Eigenproblems_and_Physical_Modes.m`
- `Week04_Practical_Identify_and_Validate_Coupled_Oscillator_Modes.m`
- `README.md`

The Week 04 lecture slide deck and all previous slide-deck working files were removed on 28 August 2026 before a fresh raster-only rebuild.

## Cross-artifact model and notation

- Physical spine: two equal masses connected by a coupling spring and identical outer springs.
- Baseline parameters: `m1 = m2 = 0.50 kg`, `k = 20.0 N/m`, and `kc = 10.0 N/m`.
- Governing form: `M*xddot + K*x = 0` and generalized eigenproblem `K*phi = lambda*M*phi` with `lambda = omega^2`.
- Baseline eigenvalues: `lambda1 = 40 s^-2` and `lambda2 = 80 s^-2`.
- Baseline natural frequencies: `f1 = 1.00658 Hz` and `f2 = 1.42353 Hz`.
- Baseline mode shapes are proportional to `[1,1]^T` and `[1,-1]^T`; overall eigenvector scale and sign are arbitrary.
- Broken-symmetry case: `m2 = 0.75 kg`, giving `f1 = 0.88401 Hz` and `f2 = 1.32346 Hz`.
- Units, matrix signs, eigenvalue interpretation, normalization, residual limitations, mass orthogonality, degeneracy, coupling-frequency splitting, broken symmetry, and capstone progression were checked across the learning note, lecture demonstration, practical, README, and independent model validator.

## Learning note

- The LaTeX source compiles cleanly with Tectonic.
- The final student-facing PDF is A4 and contains four pages.
- All four pages were rendered and visually inspected.
- No clipping, overlap, unreadable table content, or broken scientific notation was found.
- The student-facing PDF is byte-for-byte identical to the compiled QA PDF.

## MATLAB Live Scripts and numerical validation

- Both student-facing Live Scripts executed successfully in separate fresh MATLAB R2026b prerelease processes.
- Fresh-process markers passed: `WEEK04_LECTURE_FRESH_SESSION_OK` and `WEEK04_PRACTICAL_FRESH_SESSION_OK`.
- The independent validator `Week04/.agent/qa/validate_week04_model.m` passed with marker `WEEK04_MODEL_VALIDATION_OK`.
- Checks cover baseline eigenvalues and frequencies, generalized eigen-equation residuals, mass orthogonality, zero-coupling degeneracy, the coupling-frequency trend, and asymmetric-mass reference frequencies.
- Source inspection confirmed exactly one blank line in each Live Script immediately before the appendix and no banned `clear`, `clearvars`, `close all`, `clc`, `figure`, or `fprintf` workflow.

## Google Classroom practical quiz

- The canonical mapping `.agent/google-forms/PHY4605_Classroom_Practical_Quiz_Forms.json` currently contains Week 01 and Week 02 only.
- No Week 04 Form or Classroom coursework item was created. Project instructions require the Week 04 diagnostic questions and materials to be approved before creating the live weekly quiz.

## Final SHA-256 for retained Week 04 artefacts

- `Week04_Eigenproblems_and_Physical_Modes.pdf`: `d71f35bb713e2cd614c437f7e785eee808004f26e1f5df807ea4df7d580c650f`
- `Week04_Lecture_Demonstration_Eigenproblems_and_Physical_Modes.m`: `e7c1852d630f08280bea42f1c12babc6df1badb0c05d6021d877ea805c07c61d`
- `Week04_Practical_Identify_and_Validate_Coupled_Oscillator_Modes.m`: `4cea66384ec22f61be4f9ef6f695d18ad2817fc34f21aa677659bdac5d42bd43`
