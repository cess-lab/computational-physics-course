# Week 05 Content Manifest

## Scope

- Week: 05
- Topic: Root finding
- Difficulty contract: Core first; Working exposure and Stretch removable without breaking the Core route
- Familiar lecture model: level-ground projectile range, `R(theta) = v0^2/g * sind(2*theta)` when theta is stored in degrees
- Root variable: launch angle `theta` in degrees
- Residual: `f(theta) = R(theta) - target`
- MATLAB dependency: MATLAB R2025a or later, base MATLAB only
- Lecture slide status: the earlier preparation-stage statement that no Week 05 PPTX was generated or revised is historical. The current verified Codex-PPT deck and its completed QA record are retained at the paths below; the pre-existing editable deck remains separately preserved under the Codex-PPT QA archive.

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

- Historical preparation record: the outline at `Week05/.agent/lecture-slides/codex-ppt/outline.md` and the earlier restriction on generating or revising slide artifacts are retained as provenance only.
- Current student-facing artifact: `/Users/khairuladib/MATLAB-Drive/Kuliah/computational-physics-course/Week05/Lecture_Slides_Week05.pptx`.
- Current hidden Codex-PPT artifact: `/Users/khairuladib/MATLAB-Drive/Kuliah/computational-physics-course/Week05/.agent/lecture-slides/codex-ppt/codex-ppt.pptx`.
- Current verified state: `slide_run_state.json` and `slide_jobs.json` record `slides_recorded` with one accepted sample, 13 recorded slides, and no pending or blocked jobs. The final QA record confirms a 14-slide, 16:9 image-based deck with non-empty speaker notes.
- Approval evidence: `qa/outline_approval.md` and `qa/sample_approval.md` record the outline/sample approvals and production authorization; final local QA is in `qa/final_qa.md`. These records supersede the earlier preparation-stage boundary without erasing it.

## Publication Gate

Before publication of the non-slide Week 05 package:

1. generate and inspect the MATLAB residual plot embedded in the note;
2. compile and visually inspect the learning-note PDF;
3. run the lecture demonstration from a fresh MATLAB session;
4. run the practical baseline from a fresh MATLAB session;
5. run the hidden practical reference solution and confirm all validation checks pass;
6. run MATLAB `checkcode` on both student-facing scripts;
7. verify Core content uses one stopping-rule pattern and keeps solver-selection/uniqueness topics out of the Core route;
8. verify the current local Week 05 deck, Codex-PPT state, and final QA record at the paths above; this manifest does not by itself assert any separate external publication decision.
