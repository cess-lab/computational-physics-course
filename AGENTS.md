# PHY4605 Course-Material Blueprint

Use this blueprint when creating or revising PHY4605 teaching materials. Keep the course centred on computational modelling, not a syntax-only MATLAB bootcamp. All written materials remain in English; oral explanation may be in Malay.

The course-level competency is:

> Given a physics problem, students should be able to formulate the model and assumptions, identify variables and units, select and justify a computational method, construct pseudocode or another explicit algorithmic flow, use MATLAB and AI tools to implement it, validate the numerical evidence, and defend the physical interpretation.

MATLAB Onramp is a required self-learning prerequisite. Week 01 diagnoses and repairs Onramp-level skills through a physics activity; the course must not reteach MATLAB as an end in itself.

## Course-wide delivery pattern

Every week should make the same reasoning chain visible:

`physical model -> scale and units -> discretisation -> algorithm -> code -> error/uncertainty -> validation -> physical interpretation`.

Use a spiral/hybrid sequence: introduce MATLAB techniques through a physics question, revisit visualisation and symbolic mathematics just in time, and build toward an assessed computational investigation. Each session should normally include a prediction or checkpoint, a short guided coding phase, a student modification task, interpretation of the output, and an exit ticket. Connect the week's output to a practical, lab, or the capstone whenever applicable. Design each weekly lecture package, including its lecture slide deck, MATLAB Live Script, and learning note where applicable, for a 120-minute teaching context. Treat that duration as an internal delivery constraint; do not write or imply the duration, a minute-by-minute agenda, or a timed delivery arc in student-facing slide decks unless the lecturer explicitly requests it.

## Weekly blueprint

| Week | Title and focus | Core materials and output | Delivery method and checkpoints |
| --- | --- | --- | --- |
| 01 | Model to computation and Onramp diagnostic | Slides and learning note on a physical question, scale/units, discretisation, reproducibility, validation, and responsible AI; one physics-based Onramp diagnostic practical. | Lecture shows the full computational-physics cycle. Practical checks arrays, element-wise operations, indexing, plotting, logic, debugging, and validation through one physical model. |
| 02 | Reliable computational workflow through physics | Worked note, Live Script, and short practical on decomposition, pseudocode, readable implementation, debugging, and testing. | Repair weak foundations through a physical calculation; distinguish syntax errors from logical, numerical, and physical errors. |
| 03 | Linear systems | Slides, note, Live Script, and Kirchhoff-circuit practical. Capstone problem spaces are introduced. | Derive equations before assembling the matrix; checkpoint on units, rank/conditioning, residuals, and physical plausibility. |
| 04 | Eigenproblems and physical modes | Slides, note, Live Script, and coupled-oscillator practical. Groups identify candidate capstone questions. | Connect eigenvalues/eigenvectors to measurable modes; validate against symmetry, limiting cases, or a simple analytic result. |
| 05 | Root finding | Note and Live Script covering bracketing, Newton's method, stopping criteria, residuals, and failure modes. | Compare methods on a physical equation, predict failure conditions, and justify stopping evidence rather than reporting only a root. |
| 06 | Numerical differentiation | Slides, note, Live Script, and practical on truncation versus round-off. Capstone feasibility proposal is due. | Vary step size, compare with a symbolic/analytic reference, and explain the useful step-size region. |
| 07 | Numerical integration | Slides, note, Live Script, and convergence practical. Capstone model, method, and validation plan are approved. | Compare quadrature methods, quantify convergence, and connect numerical area to a physical quantity and its units. |
| 08 | ODE simulation | Live Script and practical comparing a simple explicit method with a suitable Runge-Kutta or adaptive reference on one physical system. | Require a timestep study, a stability or conservation check where appropriate, and interpretation of the physical trajectory. |
| 09 | Data fitting and uncertainty | Slides, note, Live Script, and lab using physical data, residuals, parameter estimation, and uncertainty. | Judge the model using residual structure and parameter units, not only fit coefficients or an R-squared value. |
| 10 | Random sampling and Monte Carlo simulation | Note, Live Script, and practical using a physically accessible random-walk, transport, or estimation problem. | Predict the distribution or scaling, vary sample size, quantify uncertainty/convergence, and avoid unnecessary statistical-mechanics theory. |
| 11 | Sensitivity and uncertainty propagation | Slides, note, Live Script, and practical on parameter sweeps, sensitivity, and uncertainty propagation. | Hold the model fixed while varying justified inputs; distinguish numerical error, parameter uncertainty, and model inadequacy. |
| 12 | Integrated method selection and reproducibility | Method-selection cases, capstone checkpoint, and reproducibility/AI-audit worksheet. Fourier or signal examples may appear only as a guided optional extension. | Students choose among learned methods, critique AI-assisted output, run independent checks, and prepare a defensible capstone handoff. |
| 13 | Capstone studio | Project Live Script/code, analysis template, validation evidence, and defence rehearsal. | Studio critique of method selection, validation, sensitivity/uncertainty, limitations, and AI-supported decisions. |
| 14 | Presentation, defence, and handoff | Presentation rubric, individual code/physics-defence prompts, reproducibility README, and final rendered outputs. | Students present, defend individual code and physics decisions, demonstrate reproducibility, and hand over the complete project package. |

## Scope and progression

- **Mastery:** translating physics into computational form; method selection; pseudocode/algorithm construction; numerical differentiation and integration; convergence; validation; and physical interpretation.
- **Working competence:** linear systems/eigenproblems, one focused ODE simulation workflow, fitting/uncertainty, Monte Carlo simulation, sensitivity analysis, and symbolic mathematics as an analytical validation tool.
- **Optional or project-level extension:** Fourier/FFT, additional nonlinear/chaotic ODE work, statistical-mechanics simulations, PDEs, stiff methods, regularisation, MCMC diagnostics, GPU computing, ML/PINNs, and Python/Jupyter.
- Thread symbolic mathematics through root finding, differentiation, integration, and ODE work. Do not isolate it as a syntax-heavy toolbox week.
- Prefer reinforcement and transfer over adding another advanced numerical topic.

## Assessment architecture

Use [PHY4605 Assessment Blueprint](PHY4605_Assessment_Blueprint.md) as the course-level assessment specification.

| Assessment | Weight | Conditions | Primary evidence |
| --- | ---: | --- | --- |
| Test 1 | 10% | 90 minutes, open book, AI-free | Early independent modelling, algorithm, method-selection, diagnosis, and validation reasoning |
| Test 2 | 10% | 90 minutes, open book, AI-free | Independent numerical-error, data, uncertainty, and simulation reasoning |
| Final examination | 40% | 120 minutes, open book, AI-free | Cumulative computational reasoning through unseen physics cases |
| Practical portfolio | 15% | Ten group submissions; AI allowed and declared | Repeated computational investigations and verification habits |
| Individual lab test | 10% | AI-assisted verification challenge with individual defence | Ability to audit, repair, validate, and defend an AI-assisted solution |
| Capstone investigation | 15% | Group investigation with individual defence; AI allowed and declared | Open computational investigation, process evidence, reproducibility, and physical interpretation |

Written assessments must not reward memorisation of MATLAB function names or long code production. Provide necessary syntax/method references and assess model formulation, decomposition, pseudocode, method selection, code tracing, defect diagnosis, numerical evidence, validation, limitations, and physical interpretation.

Perfect code is not the dominant criterion. Students may earn modelling, method, and algorithm marks with incomplete code, but full numerical-evidence and validation marks require reproducible output or a precise diagnosis of why execution failed.

## Capstone progression

- **Week 03:** introduce open but bounded problem spaces and examples.
- **Week 04:** groups identify candidate questions.
- **Week 06:** feasibility proposal due.
- **Week 07:** approve the physical model, method, and validation plan.
- **Weeks 08-12:** collect process checkpoints through practical submissions.
- **Week 13:** studio critique and defence rehearsal.
- **Week 14:** final presentation, individual defence, and reproducibility handoff.

## Material and folder convention

Each completed week's package lives together in one project folder named `Week01`, `Week02`, through `Week14`. The week folder has two layers:

1. **Student-facing layer:** place only the final, relevant materials directly inside `WeekXX/`:
   - one final lecture slide deck (`.pptx`, where applicable);
   - one final learning note (`.pdf`, where applicable);
   - one plain-text MATLAB Live Script (`.m`, where applicable);
   - practical/lab or capstone files (`.m`, `.pdf`, or other required student-facing formats);
   - a concise student-facing `README.md`.
2. **Agent/backend layer:** place duplicate or retired copies, LaTeX `.tex` files, slide raster assets, build scripts, renderings, previews, QA evidence, generated cheat-sheets, logs, and temporary files under the hidden `WeekXX/.agent/` hierarchy. Student-facing plain-text Live Script source remains directly in `WeekXX/` because the `.m` file is the final editable artefact.

Use a course-level hidden `.agent/` folder for generated or temporary files that are not associated with a particular week. Keep final student-facing artefacts out of top-level `Learning Notes/`, `Lecture Slides/`, `outputs/`, or other parallel locations once they have been assigned to a week.

Example:

```text
Week01/
├── README.md
├── Lecture_Slides_Week01.pptx
├── Week01_Lecture_Demonstration_Model_to_Computation.m
├── Week01_Model_to_Computation.pdf
├── Week01_Practical_Onramp_Diagnostic.m
└── .agent/
    ├── learning-notes/
    ├── lecture-slides/
    ├── outputs/
    └── temporary/
```

Do not expose multiple visible copies of the same final artefact. Keep the hidden sources, data, README, and rendered evidence sufficient for another person to reproduce the week's result from a fresh MATLAB session.

## Artifact-specific design routing

Before generating or revising a student-facing artefact, classify the output type and read the corresponding design specification. Do not apply the visual rules for one artefact type to another.

| Artefact type | Required design specification | Required production/QA route |
| --- | --- | --- |
| Learning note (`.tex`, PDF) | [PHY4605 Learning Note Design Specification](PHY4605_Learning_Note_Design_Spec.md) | Use the LaTeX workflow; compile and inspect the rendered PDF. |
| Lecture slide deck (raster source, PDF, or PPTX) | [PHY4605 Lecture Slide Deck Design Specification](PHY4605_Lecture_Slide_Design_Spec.md) | Use the `scientific-educational-image-slides` skill and the one-full-slide-raster QA contract. |
| Practical brief slide deck (raster source, PDF, or PPTX) | **Use the same specification as the lecture slide deck:** [PHY4605 Lecture Slide Deck Design Specification](PHY4605_Lecture_Slide_Design_Spec.md) | Use the same `scientific-educational-image-slides` production route and one-full-slide-raster QA contract as the lecture slide deck, adapted only for the practical brief's content. |
| MATLAB Live Script (plain-text `.m`) | [PHY4605 MATLAB Live Script Design Specification](PHY4605_MATLAB_Live_Script_Design_Spec.md) | Use the R2025a-or-later plain-text Live Script format and MATLAB-native code; execute from a fresh MATLAB session and retain validation evidence. |
| Practical worksheet and practical MATLAB Live Script (plain-text `.m`, or rendered worksheet PDF where applicable) | **Use the same specification as the lecture MATLAB Live Script:** [PHY4605 MATLAB Live Script Design Specification](PHY4605_MATLAB_Live_Script_Design_Spec.md) | Use the same MATLAB-native production and fresh-session execution/validation route as the lecture Live Script, adapted only for the practical activity. |

If one request produces multiple artefact types, route each component independently. A mixed weekly package must use the learning-note specification for the note, the lecture-slide specification for the deck, and the Live Script specification for plain-text `.m` files.

**Practical routing rule:** When asked to build practical brief slides, route them as slide decks and use the lecture slide-deck design specification and QA route. When asked to build a practical MATLAB Live Script, route it as a MATLAB Live Script and use the lecture MATLAB Live Script design specification and QA route. Do not route practical brief slides through the learning-note specification.

## Quality gates

Before calling a weekly package complete:

1. Check consistent units, notation, assumptions, and physical terminology across slides, notes, code, and assessment material.
2. Keep MATLAB code native, readable, and runnable without hidden Workspace state; avoid stale Workspace dependencies.
3. Render and inspect slides; compile/render and inspect learning notes/PDFs.
4. Execute each Live Script from a fresh MATLAB session and retain appropriate validation evidence.
5. Validate with suitable unit, limiting-case, convergence, residual, conservation, or reference-solution checks; state the check and outcome in the material or README.

## Course Google Form

Use one course-wide Google Form for the individual diagnostic completed before each group practical. The canonical form ID, URLs, section IDs, question IDs, and update procedure are stored in `.agent/google-forms/PHY4605_Individual_Practical_Check.json` and `.agent/google-forms/README.md`.

- Never create a new weekly form. Read the canonical form first, then add questions inside the existing `Week 01` through `Week 14` page-break section.
- Keep full name, matric number, and week selection on the shared first page; do not duplicate identity questions inside weekly sections.
- Add or revise a week's questions only after the corresponding weekly materials are approved.
- Preserve the dropdown routing and all existing section IDs. Verify the form with `get_form` after every update.
- Treat the form as an unmarked diagnostic snapshot. Analyse aggregate misconceptions and confidence patterns; do not use AI-detection scores or expose names and matric numbers unnecessarily in AI analysis.

## Responsible AI and assessment

AI supports verification literacy rather than a product-specific CLO. Clearly distinguish AI-free individual assessments from AI-assisted labs/projects. For any AI-assisted work, require a declaration and independent checks of units, limiting cases, convergence, residuals, and reference results before accepting the output.

Do not use AI-detection scores as evidence of misconduct or learning. For AI-assisted assessment, collect a concise decision record covering what AI was asked to do, what was accepted/modified/rejected, and which independent checks were performed. Use individual explanations, parameter perturbations, process checkpoints, and reproducibility evidence to establish validity.
