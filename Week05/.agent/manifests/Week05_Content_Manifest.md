# Week 05 Content Manifest

## Scope

- Week: 05
- Topic: Root finding
- Difficulty contract: Core first; Working exposure and Stretch removable without breaking the Core route
- Familiar lecture model: level-ground projectile range, `R(theta) = v0^2/g * sind(2*theta)` when theta is stored in degrees
- Root variable: launch angle `theta` in degrees
- Residual: `f(theta) = R(theta) - target`
- MATLAB dependency: MATLAB R2025a or later, base MATLAB only
- Lecture slide status: review-ready outline at `.agent/lecture-slides/codex-ppt/outline.md`; **no Week 05 PPTX is generated or revised in this preparation stage**. A pre-existing deck and production files remain in the repository but are explicitly out of scope until the lecturer authorises slide work.

## Three Core Ideas

1. A physical root problem becomes numerically usable when the target condition is rewritten as a residual `f(x)=0`, with the residual sign interpreted physically and a zero crossing identified on a graph.
2. Bisection updates a sign-changing bracket using a midpoint; Newton updates one current estimate using the residual and its local slope. Students trace heavily scaffolded versions of both methods rather than implementing general solvers from a blank page.
3. Use one supplied residual stopping rule consistently, then validate by substituting the computed root back into the residual and state the physical meaning and unit of the root.

## Locked Lecture Model

- Model: `R(theta) = (v0^2/g) * sind(2*theta)`
- Assumptions: level launch and landing, constant `g`, negligible air resistance
- Launch speed: `v0_mps = 20` m/s
- Gravitational acceleration: `g_mps2 = 9.81` m/s^2
- Target range: `target_m = 35` m
- Residual: `residual_m = range_m - target_m`
- Low-angle graphical/numerical bracket: `[20, 40]` degree
- Newton starting angle: `25` degree
- Core stopping rule: `abs(residual_m) < 1e-3` m
- Scan used for the residual graph: `theta_scan_deg = 10:1:70`

## Locked Reference Values

- `f(20 degree) = -8.7905 m` approximately
- `f(40 degree) = +5.1553 m` approximately
- Bisection result from the lecture demonstration: `29.5679 degree` after 13 recorded iterations, residual `+4.1164e-4 m`
- Newton result from the lecture demonstration: `29.5673 degree` after 4 recorded iterations, residual `-7.1308e-7 m`
- Direct-substitution range at the bisection result: `35.0004 m`
- High-angle companion solution is Optional stretch only; it is not required for the Core route

## Core Algorithm Route

1. State the original physical equation and target condition.
2. Define the residual and preserve its physical unit.
3. Interpret negative, zero, and positive residual values.
4. Plot the residual and identify a zero crossing.
5. Select two bracket endpoints with opposite residual signs.
6. Trace bisection: midpoint -> residual -> retain the sign-changing half interval.
7. Trace Newton: current estimate -> residual and slope -> tangent update.
8. Apply the one supplied residual-magnitude stopping rule.
9. Substitute the final root into the residual.
10. Explain the physical meaning and unit of the root.

## Required Core Checkpoints

- original equation versus residual distinction;
- residual-sign interpretation;
- labelled residual graph with zero line;
- graphical and numerical sign-changing bracket;
- plain-language bisection midpoint/interval update;
- heavily scaffolded bisection trace;
- plain-language Newton tangent/update idea;
- heavily scaffolded Newton trace;
- exactly one Core stopping-rule pattern;
- residual substitution validation;
- physical meaning and unit of the computed root;
- diagnosis of one bad/same-sign bisection bracket.

## Working Exposure

- guaranteed bracketed method versus faster local method;
- iteration count as a limited measure of computational cost.

## Stretch

- uniqueness proof through monotonicity;
- several stopping criteria;
- MATLAB `fzero` as a reference solver;
- safeguarded Newton methods;
- formal solver-selection arguments.

## Removed

- deliberately extreme small-derivative stress cases;
- 150-radian Newton-step examples or equivalent advanced failure constructions.

## Practical Transfer Contexts

1. Projectile range: root is a launch angle in degrees; residual is a range mismatch in metres.
2. Thin lens: root is image distance in metres; residual is an inverse-length equation mismatch in m^-1.
3. RC charging: root is threshold time in seconds; residual is a voltage mismatch in volts.

The practical contains ten progressive micro-challenges. Every challenge names required evidence and a short defence hook. Student-facing files contain no solved challenge answers.

## Capstone Progression

There is no new Week 05 capstone submission milestone. The next formal milestone remains the Week 06 feasibility proposal.

## Diagnostic Planning

The course-level hidden file `.agent/google-forms/Week05_Question_Key_and_AI_Analysis.md` specifies a six-question pre-practical diagnostic covering physical prediction, units/residual meaning, algorithm/code reasoning, numerical/defect diagnosis, validation, and confidence. It is a draft specification only and does not publish a live Google Form.

## Scientific Illustration Decision

No ImageGen illustration is required for the learning note or Live Scripts. The representation barrier is the residual sign and zero crossing, so the MATLAB-generated residual graph is the authoritative instructional visual. The decision is recorded in `.agent/learning-notes/qa/illustration-decision.md`.

## Lecture Slide Gate

The active planning artefact for this stage is `.agent/lecture-slides/codex-ppt/outline.md`. It explicitly maps the MATLAB residual plot as a numerical reference for the future graph slide. Do not generate or revise `deck_spec.json`, `speech.md`, prompt jobs, strict slide-image assets, slide images, or a PPTX until the lecturer explicitly authorises the next slide-production gate. Existing files of those types are pre-existing and are not part of the present task.

## Publication Gate

Before publication of the non-slide Week 05 package:

1. generate and inspect the MATLAB residual plot embedded in the note;
2. compile and visually inspect the learning-note PDF;
3. run the lecture demonstration from a fresh MATLAB session;
4. run the practical baseline from a fresh MATLAB session;
5. run the hidden practical reference solution and confirm all validation checks pass;
6. run MATLAB `checkcode` on both student-facing scripts;
7. verify Core content uses one stopping-rule pattern and keeps solver-selection/uniqueness topics out of the Core route;
8. verify the current task has not generated or revised a Week 05 PPTX or slide-production assets; only the planning outline may be revised at this stage.
