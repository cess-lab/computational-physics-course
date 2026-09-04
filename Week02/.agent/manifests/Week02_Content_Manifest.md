# Week 02 Content Manifest

## Scope

- Week: 02
- Topic: Pseudocode, loops, and debugging
- Difficulty contract: Core first; Working exposure and Optional stretch removable without breaking the Core route
- Familiar lecture model: one-dimensional vertical launch, upward positive, no air resistance, constant gravity

## Three Core ideas

1. Decompose a familiar physics equation into an ordered algorithm and short pseudocode.
2. Trace a `for` loop as a repeated scalar calculation with indexed storage.
3. Debug by classifying the defect and comparing code/output with computational and physical evidence.

## Locked lecture values

- `y0_m = 0` m
- `v0_mps = 20` m s^-1
- `g_mps2 = 9.81` m s^-2
- `t_s = 0:0.5:4` s
- Model: `y(t)=y0+v0*t-0.5*g*t^2`

Reference values for QA:

- `y(0 s) = 0 m`
- `y(0.5 s) = 8.77375 m`
- `y(1.0 s) = 15.095 m`
- `y(4.0 s) = 1.52 m`
- Continuous-model reference peak: `t ~= 2.04 s`, `y ~= 20.39 m`; reference only, not a second Core method

## Core algorithm

1. Store model parameters and ordered times.
2. Preallocate one position slot per time sample.
3. Start with the first MATLAB index.
4. Read the current time.
5. Calculate one position using that scalar time.
6. Store the result in the matching position slot.
7. Repeat until the final time sample.
8. Plot, validate, and interpret.

## Core validation

Use the known initial value first: `y_m(1) = y0_m = 0 m`. The check is executable and known before computation. It does not by itself detect every physical defect; for example, a wrong gravity sign still requires comparison with the coordinate convention and predicted downward-bending motion.

## Debugging categories

- Syntax: MATLAB cannot parse or complete the intended code structure, such as a missing `end`.
- Array/indexing/operator: code refers to the wrong stored value or uses an inappropriate array operation.
- Physical/logical: code runs, but the implemented model contradicts the stated physics, sign convention, units, or assumptions.

Students should use the MATLAB error location and surrounding line where an error exists, then compare the line with the pseudocode, output, known check, and physical prediction.

## Required Core checkpoints

- physical prediction before computation
- input/calculation/output/check decomposition
- pseudocode before MATLAB
- hand trace of the first two loop passes
- one missing-line completion
- one parameter modification with prediction
- one syntax diagnosis
- one indexing/operator diagnosis
- one physical/logical diagnosis
- known initial-value validation
- labelled graph interpretation

## Working exposure

- preallocation as a good implementation habit
- supplied helper structures where useful
- recognition that a vectorised expression can reproduce the same analytical result

## Optional stretch

- write a reusable function independently
- design a second independent validation test

## Practical transfer contexts

1. Newton-style cooling model
2. radioactive decay
3. undamped mass-spring oscillation

The practical remains ten progressive micro-challenges and must not contain solved student answers.

## Publication gate

The existing Week 02 Google Form/Classroom mapping must be reused. The current backend diagnostic key is projectile/array oriented and should be reviewed only after the final Week 02 teaching materials are locked. Do not create a new Week 02 Form.
