# PHY4605 Course-Material Blueprint

Use this blueprint when creating or revising PHY4605 teaching materials. Keep the course centred on computational modelling, not a syntax-only MATLAB bootcamp. All written materials remain in English; oral explanation may be in Malay. Use [PHY4605 Course Topic and Difficulty Blueprint](PHY4605_Course_Topic_Blueprint.md) as the source of truth for the detailed topic/subtopic sequence, difficulty tiers, and 13-week execution plan.

The course-level competency is:

> Given a familiar physics problem and an appropriate scaffold, students should be able to identify the model, variables, and units; construct or complete an explicit algorithmic flow; read, trace, complete, or modify MATLAB code; detect a clear defect; perform at least one appropriate validation check; and explain the physical result.

Independent formulation and blank-page MATLAB implementation are distinction-level capabilities rather than ordinary pass requirements in lectures and AI-free written assessment. In AI-enabled group practicals, students may use generative AI to write, debug, or improve code; the assessable evidence is their model, verification, explanation, and physical reasoning rather than code volume.

### Cohort and outcome calibration

Plan for a nominal cohort of 35 Year-2 physics students. MATLAB Onramp remains a required self-learning prerequisite, but course materials must assume no reliable retained MATLAB baseline: only uncertain small minorities may be able to index arrays, modify loops, or make a labelled plot, while students cannot yet be assumed to distinguish `*` from `.*`, interpret MATLAB errors, or translate a physics equation into computational steps. They can normally use familiar analytic calculus, electromagnetism, and projectile-motion mathematics, but prerequisite retention is weak. Pre-class preparation and spontaneous participation are normally low; lecture support is one lecturer and practical support is one demonstrator. Cognitive overload and disengagement are the principal design risks.

Weeks 01-02 explicitly repair arrays, indexing, element-wise operations, plotting, pseudocode, loops, code tracing, and basic debugging through familiar physics. Teach MATLAB as part of physical reasoning, not as a detached syntax course. Preserve breadth through supplied implementations and Working exposure, but keep ordinary assessed mastery shallow, scaffolded, and cumulative. The planning targets are 90% pass, a median grade of B, 50% of students completing Core work without remediation, and about 10% reaching distinction-level independent modelling.

## Course-wide delivery pattern

Every week should make the same reasoning chain visible:

`physical model -> scale and units -> discretisation -> algorithm -> code -> error/uncertainty -> validation -> physical interpretation`.

Use a spiral/hybrid sequence: introduce MATLAB techniques through a familiar physics question, revisit essential literacy instead of assuming retention, and build toward a bounded assessed investigation. Use broad exposure with narrow assessed mastery. Classify subtopics as **Core**, **Working exposure**, **Stretch**, or **Removed** according to the topic blueprint.

Each session should normally include a physical prediction, plain-language model explanation, short pseudocode or algorithm map, guided code tracing/completion, one student modification, one core validation check, graph/output interpretation, and an exit ticket. Introduce no more than three genuinely new core ideas in one lecture. Design weekly lecture packages for a 120-minute teaching context, but do not write or imply the duration, a minute-by-minute agenda, or a timed delivery arc in student-facing slides unless explicitly requested.

### AI-enabled practical contract

Practicals are group investigations of two or three students. Generative AI may be used to formulate, write, debug, or refine MATLAB code, provided that the group records the tool and material decisions, reruns the final work from a fresh MATLAB session, and independently checks units, a known/limiting/reference result, and the physical interpretation. Practical questions should normally use a supplied, analogous physics context rather than duplicate the lecture model; supply the assumptions, equation or data, variables, and units so the assessed demand remains the week's computational method rather than unfamiliar theory.

Each active practical uses ten progressive micro-challenges across three or four supplied contexts. Every group completes and locks its evidence before a post-submission draw: a question slot (with a parameter or defect variant where required) and one individual group member are selected at random for a short defence. The student must explain the model, trace the code/output, and answer one validation or parameter-change follow-up. Maintain a rotation ledger so no student is reselected within a group until all group members have been selected; defer an absence to a later make-up defence. When there are more groups than question slots, reuse slots only with distinct post-submission variants.

### Slide-deck generation and paired audit contract

Every lecture or practical slide deck, and every material slide-deck revision, uses two distinct agent roles. The **generator** is `gpt-5.6-terra` at `medium` reasoning effort; it owns the editable source, approved assets, PPTX build, and source-level revisions. The **auditor** is `gpt-5.6-sol` at `medium` reasoning effort; it is read-only, independently reviews the rendered deck and QA evidence, and must not edit or repair its own findings. Allow at most three generator/auditor rounds, stop early on a pass, and record each round's models, findings, decisions, and final hash in a hidden QA ledger. Use the slide design specification for the detailed checklist and the mandatory LaTeX equation-asset route.

Use the course-wide cognitive-weight guide when balancing materials and assessments: model/units 10%, algorithm/pseudocode 20%, MATLAB/code reading 30%, numerical-method theory 15%, validation 10%, and physical interpretation 15%. It is a balance guide, not a requirement that every individual question mirror these shares.

## Weekly blueprint

| Week | Title and focus | Core materials and output | Delivery method and checkpoints |
| --- | --- | --- | --- |
| 01 | Physics to arrays and plots | One familiar analytical model; variables/units, arrays, indexing, element-wise operators, and a labelled plot. | Diagnose Onramp retention, explicitly repair MATLAB foundations, and compare a prediction with the graph. |
| 02 | Pseudocode, loops, and debugging | Plain-language decomposition, short pseudocode, loop tracing, scaffold completion, parameter modification, and one clear defect. | Reuse familiar physics so the new load is algorithmic; distinguish syntax, array/operator, and physical/logical defects. |
| 03 | Two-by-two linear systems | Kirchhoff equations, sign convention, 2×2 assembly, backslash solution, reconstructed currents, and direct current-balance validation. | Treat residuals, rank, conditioning, power balance, and plausible-but-wrong matrices as stretch material. Introduce bounded capstone problem spaces. |
| 04 | Parameter sweeps and graph interpretation | Vary one parameter in a familiar analytical model, overlay labelled curves, explain the trend, and validate a baseline/limiting case. | Replace eigenproblems completely; reinforce arrays, loops, plots, controlled comparison, and physical interpretation. |
| 05 | Root finding | Residual/root meaning, graphical bracket, scaffolded bisection, scaffolded Newton, one stopping rule, and residual substitution. | Move uniqueness proof, multiple stopping rules, `fzero`, safeguarding, and formal method selection to stretch; remove extreme stress cases. |
| 06 | Numerical differentiation | Physical rate/gradient, forward difference, step-size comparison, analytic reference, units, and simple error. | Treat central difference and error curves as working exposure; detailed truncation/round-off theory is stretch. Capstone feasibility proposal is due. |
| 07 | Numerical integration | Physical area/accumulation, trapezoidal rule, `trapz`, refinement, analytic/reference comparison, and units. | Simpson comparison is working exposure; quadrature error derivations are stretch. Approve capstone model, method, and validation plan. |
| 08 | ODE simulation | First-order model, initial condition, Euler update, scaffolded loop, timestep comparison, supplied exact/`ode45` reference, and one check. | `ode45` use is working exposure; stability boundaries and Runge-Kutta derivation are stretch. |
| 09 | Data fitting and uncertainty | Plot data, fit a simple physical relationship, interpret parameter units, inspect residual pattern, and state uncertainty cautiously. | Advanced fitting and formal uncertainty statistics are stretch. |
| 10 | Random sampling and Monte Carlo | Repeated random trials, trajectory/distribution output, mean/spread, sample-size effect, and reproducibility. | Standard error is working exposure; distribution theory and statistical-mechanics extensions are stretch. |
| 11 | Sensitivity and uncertainty propagation | One-at-a-time uncertainty sweep, output range, simple sensitivity interpretation, and distinction between numerical, parameter, and model limitations. | Formal propagation and Monte Carlo propagation are stretch. |
| 12 | Integrated method selection and capstone studio | Familiar method-recognition cases, supplied/AI-assisted code audit, one validation choice, reproducibility, capstone completion, and defence rehearsal. | Do not introduce a new required method; unfamiliar transfer is stretch. |
| 13 | Capstone presentation, defence, and handoff | Bounded investigation using a starter Live Script, one model modification, one principal output, required plus chosen validation, limitation, individual tracing, and reproducibility handoff. | Independent extensions and deeper method comparisons are stretch. |
| 14 | Buffer/recovery | No planned new core content, compulsory practical, or new assessment chapter. | Use only to recover a lost session or, if unused, for optional revision, short remediation, capstone catch-up, deferred defence, or consultation. |

## Scope and progression

- **Core/pass level:** familiar-model formulation; variables and units; guided pseudocode; reading, tracing, completing, and modifying commented code; one appropriate validation check; and physical interpretation. In an AI-enabled practical, independently written code is permitted but does not replace this evidence.
- **Working exposure:** broad use of supplied implementations for alternative methods, solver references, uncertainty evidence, and method comparisons without independent reproduction.
- **Stretch/distinction:** blank-page coding, less familiar formulation, advanced numerical theory, several independent checks, and independent method comparison.
- **Removed:** eigenproblems/normal modes, generalised eigenproblems, mass orthogonality, advanced small-derivative root-finding stress cases, and any other item marked Removed in the topic blueprint.
- Thread familiar analytic mathematics through numerical topics as a reference and validation tool. Introduce essential mathematics before using it computationally.
- Prefer reinforcement and transfer over adding another advanced topic.

## Assessment architecture

Use [PHY4605 Assessment Blueprint](PHY4605_Assessment_Blueprint.md) as the course-level assessment specification.

| Assessment | Weight | Conditions | Primary evidence |
| --- | ---: | --- | --- |
| Test 1 | 10% | 90 minutes, open book, AI-free | Familiar-model units, guided pseudocode, short code tracing/diagnosis, one validation check, and interpretation |
| Test 2 | 10% | 90 minutes, open book, AI-free | Supplied numerical evidence, algorithm adaptation, code reading, validation, uncertainty, and interpretation |
| Final examination | 40% | 120 minutes, open book, AI-free | Cumulative scaffolded reasoning using familiar or closely analogous physics cases |
| Practical portfolio | 15% | Ten AI-enabled group evidence packets: 12% group component and 3% cumulative individual defence ledger | Repeated computational investigations, verification habits, and accountable explanation |
| Individual lab test | 10% | AI-assisted verification challenge with individual defence | Ability to audit, repair, validate, and defend an AI-assisted solution |
| Capstone investigation | 15% | Bounded group investigation with starter Live Script and individual defence; AI allowed and declared | One justified modification, reproducible output, validation evidence, code tracing, and physical interpretation |

Written assessments must not reward memorisation of MATLAB function names, blank-page programming, or advanced derivations for ordinary pass marks. Provide necessary formulas, syntax/method references, and scaffolds. Use familiar physics with a changed parameter, supplied graph, short code defect, or interpretation question. Fully unseen formulation and independent code writing are distinction evidence in these AI-free settings; practical code-writing is governed by the AI-enabled practical contract above.

Perfect code is not the dominant criterion. Students may earn modelling, method, and algorithm marks with incomplete code, but full numerical-evidence and validation marks require reproducible output or a precise diagnosis of why execution failed.

## Digital learning and submission architecture

Use **Google Classroom as the system of record** for PHY4605 learning activities, submissions, due dates, feedback, rubrics, and completion evidence. Use **Gemini Notebook / NotebookLM as the course-grounded Socratic AI tutor**. MATLAB remains the main computational implementation environment.

The default platform roles are:

| Platform | Course role | Do not use it as |
| --- | --- | --- |
| Google Classroom | Official course hub; practical submissions; capstone milestones; individual lab-test submissions; ungraded revision/reflection activities; links to supporting resources | A replacement for MATLAB execution or a free-form AI tutor |
| Gemini Notebook / NotebookLM | Source-grounded Socratic tutoring using approved lecture notes, slides, worked demonstrations, and practical material | The official submission record, a source of marks by itself, or a store of confidential final-exam questions/marking schemes |
| MATLAB | Computational modelling, implementation, reproducible numerical evidence, validation, and figures | The sole evidence of conceptual understanding |
| Written tests/final examination | Independent AI-free assessment under the conditions in the assessment blueprint | An AI-assisted activity |

The standard AI-assisted revision flow is:

`initial attempt -> Socratic tutor guidance -> revised reasoning -> misconception/error identified -> independent validation -> reflection -> Classroom submission`.

NotebookLM tutor behaviour must remain pedagogical rather than answer-delivery oriented. Configure it to ask one focused question at a time, require the physical model/assumptions/variables/units before computation, require pseudocode or an algorithmic plan before MATLAB implementation, use progressive hints, require independent validation, and end with a transfer question. Do not include actual final-examination questions, marking schemes, or confidential model answers in the student-facing notebook source set.

Do not require students to submit complete AI chat histories. Where AI use is relevant, collect concise decision evidence: what assistance was requested, what was accepted/modified/rejected, what misconception or defect was corrected, and which independent checks were performed.

### Individual pre-practical diagnostic

Use **one dedicated Google Form quiz per practical week**, launched from the corresponding Google Classroom coursework. Do not create or reuse a single course-wide Week 01-13 routing Form. Do not create a Week 14 diagnostic unless the buffer is actually used for a recovered practical and the lecturer approves it.

For short pre-practical diagnostics containing several automatically countable conceptual questions plus a short response and confidence item, use one of these patterns in order of preference:

1. **Classroom Quiz Assignment backed by a Google Form** when automatic response capture, multiple-choice counting, and confidence calibration are important. Classroom remains the student-facing system of record; the Form is an implementation component attached to that coursework rather than a separate course hub.
2. **Classroom Questions** only when a diagnostic genuinely contains one or very few questions. Avoid creating six separate Classroom stream items merely to reproduce one six-question diagnostic.
3. **Ordinary Classroom Assignment with a submitted document** only when the evidence is primarily extended reasoning or a reflection. Do not use this pattern merely to imitate multiple-choice auto-marking.

Preserve a stable diagnostic pattern across weeks: physical prediction; units/scaling; algorithm/array/code reasoning; numerical or defect diagnosis; validation reasoning; and confidence calibration. Full-name, matric-number, and week-selector questions are not required because the activity is assigned through the correct Classroom course and week; collect verified institutional email through the Form when identification is needed.

When a diagnostic exposes a common misconception, retain the planned schedule and publish an optional 10–15 minute remediation through Classroom. Target one misconception, show one worked correction using a familiar model, provide one retry, reveal the correct reasoning, and end with a confidence check. Do not turn remediation into another long note or a prerequisite for the next lecture.

## Capstone progression

- **Week 03:** introduce four to six lecturer-designed bounded problem spaces and examples.
- **Week 04:** groups identify a preferred and alternate problem space while practising controlled parameter modification.
- **Week 06:** feasibility proposal due.
- **Week 07:** approve the physical model, method, and validation plan.
- **Weeks 08-11:** collect compact process checkpoints through practical submissions.
- **Week 12:** capstone studio, final evidence assembly, reproducibility check, and defence rehearsal.
- **Week 13:** final presentation, individual defence, and reproducibility handoff.
- **Week 14:** buffer only; use for recovery or deferred defence if required, with no new planned milestone.

## Material and folder convention

Each completed instructional package lives in `Week01` through `Week13`. Reserve `Week14` for the buffer/recovery record and do not prepare a new core teaching package for it. Each week folder has two layers:

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
| Lecture slide deck (editable PPTX; optional PDF or flattened derivative) | [PHY4605 Lecture Slide Deck Design Specification](PHY4605_Lecture_Slide_Design_Spec.md) | Use the installed `Presentations` skill and `@oai/artifact-tool` to build the editable canonical PPTX from the approved PHY4605 master. Use generated imagery only for visual assets. Render and inspect every slide; use `officecli` as a secondary structural/font inspection aid. |
| Practical brief slide deck (editable PPTX; optional PDF or flattened derivative) | **Use the same specification as the lecture slide deck:** [PHY4605 Lecture Slide Deck Design Specification](PHY4605_Lecture_Slide_Design_Spec.md) | Use the same editable-first `Presentations` production and QA route as the lecture deck, adapted only for the practical brief's content. |
| MATLAB Live Script (plain-text `.m`) | [PHY4605 MATLAB Live Script Design Specification](PHY4605_MATLAB_Live_Script_Design_Spec.md) | Use the R2025a-or-later plain-text Live Script format and MATLAB-native code; execute from a fresh MATLAB session and retain validation evidence. |
| Practical worksheet and practical MATLAB Live Script (plain-text `.m`, or rendered worksheet PDF where applicable) | **Use the same specification as the lecture MATLAB Live Script:** [PHY4605 MATLAB Live Script Design Specification](PHY4605_MATLAB_Live_Script_Design_Spec.md) | Use the same MATLAB-native production and fresh-session execution/validation route as the lecture Live Script, adapted only for the practical activity. |

If one request produces multiple artefact types, route each component independently. A mixed weekly package must use the learning-note specification for the note, the lecture-slide specification for the deck, and the Live Script specification for plain-text `.m` files.

**Cross-material visual rule:** Where a scientific illustration removes a novice-level representation barrier, embed an approved ImageGen visual directly in the learning note and/or MATLAB Live Script rather than linking externally. Reuse a lecture-slide illustration only when the scientific mapping is identical; retain its source and provenance locally. Keep numerical plots as MATLAB-generated evidence, not generated imagery. Record a reason in hidden QA evidence when an illustration is not justified.

**Practical routing rule:** When asked to build practical brief slides, route them as slide decks and use the lecture slide-deck design specification and QA route. When asked to build a practical MATLAB Live Script, route it as a MATLAB Live Script and use the lecture MATLAB Live Script design specification and QA route. Do not route practical brief slides through the learning-note specification.

## Quality gates

Before calling a weekly package complete:

1. Check consistent units, notation, assumptions, and physical terminology across slides, notes, code, and assessment material.
2. Keep MATLAB code native, readable, and runnable without hidden Workspace state; avoid stale Workspace dependencies.
3. Render and inspect slides; compile/render and inspect learning notes/PDFs.
4. Execute each Live Script from a fresh MATLAB session and retain appropriate validation evidence.
5. Validate with suitable unit, limiting-case, convergence, residual, conservation, or reference-solution checks; state the check and outcome in the material or README.

## Weekly Classroom practical quiz configuration

The canonical mapping for active weekly pre-practical quizzes is `.agent/google-forms/PHY4605_Classroom_Practical_Quiz_Forms.json`. Read it before creating or editing a diagnostic so an existing weekly Form or Classroom coursework item is never duplicated.

- Create a new weekly Form only after that week's materials and diagnostic questions are approved.
- Attach the Form to the corresponding Google Classroom assignment as native Form material; Classroom is the student-facing entry point and system of record.
- Use one Form per week. Do not create a course-wide routing Form.
- Keep the diagnostic ungraded in Classroom unless the lecturer explicitly changes the assessment design. Conceptual MCQs may still carry quiz points inside the Form for automatic response analysis.
- Preserve the standard six-part diagnostic pattern where appropriate and maintain the associated answer-key/misconception-analysis file under `.agent/google-forms/`.
- Verify the live Form, Classroom coursework ID, published state, and repository mapping after every creation or change.

## Responsible AI and assessment

AI supports verification literacy rather than a product-specific CLO. Clearly distinguish AI-free individual assessments from AI-assisted labs/projects. For any AI-assisted work, require a declaration and independent checks of units, limiting cases, convergence, residuals, and reference results before accepting the output.

Do not use AI-detection scores as evidence of misconduct or learning. For AI-assisted assessment, collect a concise decision record covering what AI was asked to do, what was accepted/modified/rejected, and which independent checks were performed. Use individual explanations, parameter perturbations, process checkpoints, and reproducibility evidence to establish validity.
