# Week 04 Content Manifest

## Scope

- Week: 04
- Topic: Parameter sweeps and graph interpretation
- Difficulty contract: Core first; Working exposure and Optional stretch removable without breaking the Core route
- Familiar lecture model: ideal Hooke spring, `x=F/k`
- Swept lecture parameter: spring stiffness `k`
- Common lecture input: applied-force array `F`
- MATLAB dependency: MATLAB R2025a or later, base MATLAB only
- Lecture slide status: intentionally not created; lecturer explicitly requested all Week 04 materials **except** the lecture slide deck

## Three Core Ideas

1. A parameter sweep is a controlled computational experiment: vary one named parameter while holding the model and all other inputs fixed.
2. Store the parameter cases explicitly, evaluate the same model repeatedly, and overlay labelled curves on common axes so cases can be compared at the same input.
3. Explain the trend using the physical equation and accept it only after a known or limiting case is checked.

## Locked Lecture Model

- Model: `F = k*x`, rearranged to `x = F/k`
- Assumption: ideal linear spring within its elastic range
- Applied-force array: `F_N = 0:0.5:10` N
- Stiffness array: `k_Npm = [50 100 200]` N/m
- Baseline stiffness: `100` N/m
- Output: extension `x` in m
- Required Core limiting case: `F=0 -> x=0` for every positive stiffness

## Reference Values

At `F = 10 N`:

- `k = 50 N/m -> x = 0.20 m`
- `k = 100 N/m -> x = 0.10 m`
- `k = 200 N/m -> x = 0.05 m`

The expected ordering at any positive common force is `x_50 > x_100 > x_200`.

## Core Algorithm

1. State the physical question, model, assumptions, variables, and units.
2. Identify exactly one parameter to vary.
3. Choose a small justified parameter array and identify the baseline case.
4. Keep the independent-variable array, equation, and all other parameters fixed.
5. Evaluate the model once for each parameter value.
6. Store the results with one traceable case per row or column.
7. Overlay every case on the same labelled axes with a legend.
8. Compare the same input point across cases.
9. Check one known or limiting case.
10. Explain the trend using the equation and physical language.

## Required Core Checkpoints

- prediction before computing;
- swept parameter and fixed-quantity list;
- small parameter array;
- traceable loop or equivalent array evaluation;
- labelled overlay plot with legend;
- baseline/lower/higher case identification;
- one same-input numerical comparison;
- one known/limiting-case validation;
- physical trend explanation;
- diagnosis of one runnable but physically wrong or uncontrolled comparison.

## Working Exposure

- supplied two-parameter result table;
- normalised comparison that separates curve shape from magnitude.

## Optional Stretch

- heatmaps;
- quantitative local sensitivity such as `dx/dk`;
- automatic threshold/optimum detection.

## Practical Transfer Contexts

1. Ohmic resistor: sweep resistance while sharing a voltage array;
2. vertical motion: sweep launch speed while sharing a time array and gravity;
3. small-angle pendulum: sweep gravitational acceleration while sharing a length array.

The practical contains ten progressive micro-challenges. Every challenge names required evidence and a short defence hook. Student-facing files contain no solved challenge answers.

## Capstone Preference Checkpoint

The student-facing `Week04_Capstone_Preference_Checkpoint.md` provides six bounded problem spaces. Each group records one preferred and one alternate space plus one possible parameter modification. This is formative only; the feasibility proposal remains due in Week 06.

## Scientific Illustration Decision

No ImageGen asset is required for the Week 04 learning note or Live Scripts. The main representation barrier is the logic of a controlled parameter sweep and the relationship between stiffness and extension. A deterministic parameter-control flow diagram and a MATLAB-generated overlay plot communicate those relationships more precisely than a generated decorative image. The decision is recorded in `.agent/learning-notes/qa/illustration-decision.md`.

## Publication Gate

Before publication:

1. compile and visually inspect the learning-note PDF;
2. generate and inspect the MATLAB overlay plot embedded in the note;
3. run the lecture demonstration from a fresh MATLAB session;
4. run the practical baseline from a fresh MATLAB session;
5. run the hidden practical reference solution and confirm all validation checks pass;
6. run MATLAB `checkcode` on both student-facing scripts;
7. verify the capstone preference checkpoint is formative and does not imply a Week 04 assessment deadline;
8. verify that no Week 04 lecture PPTX or slide-production assets were created.
