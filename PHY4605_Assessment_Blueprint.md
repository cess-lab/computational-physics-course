# PHY4605 Assessment Blueprint

This document is the source of truth for PHY4605 written tests, the final examination, weekly practicals, the individual lab test, and the capstone investigation. It implements the difficulty calibration and topic tiers in [PHY4605 Course Topic and Difficulty Blueprint](PHY4605_Course_Topic_Blueprint.md).

## Assessment purpose

PHY4605 assesses whether a student can turn a familiar physics problem and an appropriate computational scaffold into credible numerical evidence. MATLAB syntax and code polish support the task; they are not the main outcome.

Assessment must distinguish ordinary pass-level adaptation from distinction-level independent construction.

The assessment calibration serves a nominal cohort of 35 Year-2 physics students with familiar analytic physics but no reliable MATLAB baseline despite Onramp. The course targets are 90% pass, a median grade of B, 50% completion of Core work without remediation, and about 10% distinction-level independent modelling. Do not raise Core assessment difficulty because a small prepared minority progresses quickly.

### Ordinary pass profile

A passing student should be able to:

1. identify the physical question, variables, parameters, outputs, and units;
2. arrange supplied steps or write short guided pseudocode;
3. read and trace a short, commented MATLAB script;
4. complete or modify a small section of supplied code;
5. connect code variables and operations to the physical model;
6. identify a clear physical, logical, array, or basic MATLAB defect;
7. produce or interpret the output that answers the physical question;
8. perform at least one appropriate validation check; and
9. explain the main result or trend in physical language.

Blank-page programming, independent formulation of an unfamiliar problem, several-method comparison, and advanced numerical diagnosis are distinction-level evidence.

## Assessment principles

- Use familiar or closely analogous physics for ordinary pass-level questions.
- Create novelty through a changed parameter, supplied graph, code defect, incomplete pseudocode, result table, or interpretation demand.
- Supply formulas, algorithms, and MATLAB syntax when recalling them is not the intended competency.
- Do not require long code production or memorised function names.
- Let students earn model, algorithm, tracing, diagnosis, and interpretation marks even when code execution is incomplete.
- Do not award full integrated-task marks when no valid validation check is demonstrated.
- Keep **Core**, **Working exposure**, and **Stretch** expectations visibly distinct when preparing questions and rubrics.
- Stretch material may differentiate excellent performance but must not be necessary for an ordinary pass.

## Assessment map

| Assessment | Weight | Duration/mode | AI condition |
| --- | ---: | --- | --- |
| Test 1 | 10% | 90-minute open-book written assessment | AI-free |
| Test 2 | 10% | 90-minute open-book written assessment | AI-free |
| Final examination | 40% | 120-minute open-book written examination | AI-free |
| Practical portfolio | 15% | Ten group evidence packets from Weeks 02–11; Week 01 is formative onboarding; best eight counted | AI allowed and declared |
| Individual lab test | 10% | Individual scaffolded verification challenge | AI allowed and declared |
| Capstone investigation | 15% | Bounded group project with starter Live Script and individual defence | AI allowed and declared |

Open-book conditions reduce memorisation but do not justify unfamiliar, under-scaffolded cases. A compact formula, algorithm, and MATLAB reference sheet should be supplied where appropriate.

## Semester 1 2026/2027 assessment windows

The official [UPM Bachelor academic calendar](https://akademik.upm.edu.my/current_student/academic_calendar_2026_2027/bachelor-30053) places Assessment I in academic Weeks 4–6 and Assessment II in academic Weeks 8–12 for the first semester of 2026/2027. The [official calendar PDF](https://akademik.upm.edu.my/upload/dokumen/20260331115844BACELOR.pdf) gives these date ranges:

- **Assessment I:** 26 October–22 November 2026, with the 09–15 November mid-semester break inside the window. The active blocks are 26 October–08 November and 16–22 November.
- **Assessment II:** 30 November 2026–03 January 2027.
- **Final examination:** 21 January–07 February 2027, after the 18–20 January revision break.

For PHY4605 planning, the broad UPM windows are Assessment I (academic Weeks 4–6) and Assessment II (academic Weeks 8–12). The sequence-safe PHY4605 targets are Test 1 in academic Week 6 (16–22 November 2026), after the Week 05 content / alongside Week 06, and Test 2 in academic Week 12 (28 December 2026–03 January 2027), after the Week 11 content / alongside Week 12. Exact local test dates remain to be confirmed by the lecturer.

## Course-wide competency balance

Use this balance across the complete assessment system and as the default guide for the final examination.

| Competency | Target share |
| --- | ---: |
| Model and units | 10% |
| Algorithm and pseudocode | 20% |
| MATLAB and code reading | 30% |
| Numerical-method theory | 15% |
| Validation | 10% |
| Physical interpretation | 15% |

Do not allow numerical-method theory or MATLAB syntax recall to crowd out code reading, validation, or interpretation.

## Written-assessment question paradigms

Use several short or medium paradigms rather than one long integrated calculation.

### Familiar-model identification

Provide a physical situation already encountered in the course or a closely analogous version. Ask students to identify the question, variables, parameters, outputs, units, assumptions, and one expected trend.

### Guided decomposition and pseudocode

Ask students to complete, order, or correct a short workflow such as:

`inputs -> model -> algorithm -> output -> validation`.

Accept structured English, a flow diagram, or MATLAB-like pseudocode. Reward correct dependencies and logic rather than punctuation.

### Code reading and tracing

Supply a short, commented code fragment. Ask students to:

- connect variables to physical quantities;
- trace one or two iterations;
- identify array dimensions or element-wise operations;
- predict the effect of one parameter modification;
- match a code line to a pseudocode step; or
- select the expected graph/output.

Do not require lengthy hand execution.

### Scaffold completion

Provide a nearly complete algorithm or Live Script excerpt with one or two missing lines. Supply the necessary syntax when exact recall is not being assessed. Ask students to complete the logic and explain what the inserted line does.

### Defect diagnosis

Supply one or more clear defects, such as:

- wrong unit or parameter;
- `*` used instead of `.*`;
- incorrect index or loop bound;
- missing initial value;
- wrong sign;
- equation/code mismatch;
- unlabelled or misleading output; or
- a result that violates an expected bound or trend.

Students should identify the defect, state its consequence, and propose a correction or check.

### Numerical evidence

Supply a compact table, graph, residual, convergence sequence, fit result, uncertainty range, or sample-size comparison. Ask students what it shows, what it does not show, and which conclusion is justified.

### Validation

Ask students to select or apply at least one check appropriate to the familiar problem: units, initial value, expected sign, bound, known case, analytic result, direct substitution, refinement, conservation, residual, or reproducibility.

Advanced comparisons among several independent checks are stretch evidence.

### Adaptation and interpretation

Change one parameter, assumption, initial condition, resolution, or requested output. Ask how the supplied pseudocode/code and expected physical result should change.

## Test 1 specification

Test 1 is a 90-minute open-book, AI-free assessment using approximately 50 raw marks and two familiar or closely analogous cases from Weeks 01–05.

| Evidence | Suggested share |
| --- | ---: |
| Model, variables, and units | 15% |
| Guided algorithm or pseudocode | 25% |
| Code reading, tracing, and clear-defect diagnosis | 30% |
| Numerical-method concept | 10% |
| Validation and physical interpretation | 20% |

Requirements:

- include arrays/element-wise reasoning or plotting literacy;
- include one short loop/algorithm trace or scaffold completion;
- include one validation decision;
- use no more than 8–10 lines of student-produced pseudocode across any one part;
- do not require independent full bisection, Newton, circuit, or MATLAB implementation;
- treat rank, conditioning, formal residual analysis, uniqueness proof, multiple stopping rules, `fzero`, and safeguarding as stretch only.

## Test 2 specification

Test 2 is a 90-minute open-book, AI-free assessment using approximately 50 raw marks and two familiar or closely analogous cases from Weeks 06–11.

| Evidence | Suggested share |
| --- | ---: |
| Algorithm adaptation and code reading | 30% |
| Numerical evidence and method concept | 20% |
| Defect diagnosis | 15% |
| Validation and uncertainty reasoning | 20% |
| Physical interpretation and limitation | 15% |

Requirements:

- supply the less familiar formula or syntax;
- assess one controlled modification rather than a blank-page design;
- include one graph/table interpretation;
- include one required validation check;
- keep advanced error-order derivations, formal statistical theory, Runge–Kutta derivation, and advanced propagation as stretch.

## Final-examination specification

The final examination is 120 minutes, open book, AI-free, and uses 80 raw marks.

| Section | Raw marks | Suggested time | Purpose |
| --- | ---: | ---: | --- |
| A. Model and guided algorithm | 28 | 35 minutes | Variables/units, familiar model, ordered reasoning, and short pseudocode |
| B. Code reading and method reasoning | 28 | 40 minutes | Trace, complete, modify, and diagnose supplied MATLAB/algorithm excerpts |
| C. Validation and physical interpretation | 24 | 35 minutes | Analyse supplied numerical evidence, apply checks, explain trends, and state limitations |
| Review | — | 10 minutes | Check units, logic, code tracing, and completeness |

The 80 raw marks should approximate:

- model and units: 8 marks;
- algorithm and pseudocode: 16 marks;
- MATLAB and code reading: 24 marks;
- numerical-method theory: 12 marks;
- validation: 8 marks; and
- physical interpretation: 12 marks.

Use familiar models or closely analogous cases. A changed parameter, graph, defect, or required output may be unseen. Do not make independent formulation of an unfamiliar physics problem necessary for a pass.

The final may include a small number of stretch marks for less-scaffolded transfer, a second validation strategy, or deeper method comparison. These marks must not prevent a well-prepared pass-level student from passing.

## Practical portfolio

Collect ten compact group evidence packets across Weeks 02–11. Week 01 remains a formative onboarding practical and is not one of the ten counted packets. Students work in groups of two or three and rotate the roles of model lead, algorithm/code lead, and validation/interpretation lead.

Each core packet contains:

1. one prediction;
2. the model variables and units;
3. short supplied, arranged, or completed pseudocode;
4. one traced, completed, or modified code section;
5. one selected computational output;
6. one core validation check;
7. one physical interpretation and limitation; and
8. a concise AI-use decision record where relevant.

Require all ten submissions but count the best eight for the group component. Use selected individual entry/exit checks to establish participation without requiring lengthy additional reports.

| Criterion | Weight within portfolio |
| --- | ---: |
| Model and units | 15% |
| Algorithm and pseudocode | 20% |
| Code reading, completion, or modification | 25% |
| Validation | 15% |
| Physical interpretation and limitation | 20% |
| Responsible AI decision record | 5% |

Google Classroom is the system of record. Practical packets should be brief enough that feedback can target reasoning rather than formatting volume.

## Individual AI-assisted lab test

Use an individual verification challenge rather than blank-page programming.

Each student receives:

- a familiar physical problem;
- a heavily scaffolded or partly flawed Live Script;
- an individual parameter variant;
- a clear required output; and
- a validation menu or one required check.

The student must:

1. identify the relevant model, variables, and units;
2. arrange or explain the algorithm;
3. trace the relevant code section;
4. identify and repair one or two clear defects;
5. modify one parameter or assumption;
6. perform at least one valid check;
7. interpret the result; and
8. answer one brief individual defence question.

| Criterion | Weight within lab test |
| --- | ---: |
| Model and units | 15% |
| Algorithm and code tracing | 25% |
| Defect diagnosis and correction | 25% |
| Validation | 15% |
| Physical interpretation | 15% |
| Individual defence and AI judgement | 5% |

A second independently designed check or complete implementation without the scaffold is stretch evidence.

## Capstone investigation

The capstone is a bounded supported investigation, not an open-ended research project.

### Required structure

- The lecturer provides twelve assigned physical briefs organised in six paired families: projectile motion (01–02), circuit behaviour (03–04), radiation and detection (05–06), thermal behaviour (07–08), Monte Carlo physics (09–10), and oscillatory motion (11–12).
- Each group receives one assigned brief and its approved starter Live Script; the group does not choose a project during the capstone sequence.
- The group states the model, assumptions, variables, and units.
- The group completes or refines supplied pseudocode.
- The group modifies one physical parameter or assumption.
- The group produces one principal graph or table.
- The group performs one required validation check and one chosen check.
- The group interprets the result and states one limitation.
- The group provides a concise reproducibility record and AI-use decision record.
- Each student traces one relevant code section and answers one physics, algorithm, validation, or interpretation question.

### Milestones

| Milestone | Week | Role |
| --- | ---: | --- |
| Problem-space selection and feasibility | 06 | Feedback checkpoint |
| Approved model, supplied/selected method, and validation plan | 07 | Approval checkpoint |
| Compact development/process evidence | 08–11 | Progress evidence |
| Studio completion and defence rehearsal | 12 | Formative checkpoint |
| Final bounded investigation | 13–14 | Rubric evidence |
| Individual defence and handoff | 13–14 | Rubric evidence |

Weeks 13–14 are the capstone presentation, individual-defence, and reproducibility-handoff sequence. Week 14 carries no new planned core topic or separate milestone.

| Criterion | Weight within capstone |
| --- | ---: |
| Model, assumptions, scope, variables, and units | 15% |
| Algorithm and MATLAB implementation evidence | 25% |
| Principal output and reproducibility | 15% |
| Validation evidence | 15% |
| Physical interpretation and limitations | 15% |
| Presentation and communication | 10% |
| Individual defence and AI decision record | 5% |

The criteria total 100% within the capstone. This single rubric is then scaled to the capstone's 15% contribution to the course. The milestone table above records development checkpoints and feedback; it does not create a second set of course weights.

Each criterion is rated at one of four levels: **Excellent = 4**, **Good = 3**, **Satisfactory = 2**, and **Weak = 1**. The weighted score for a row is `criterion weight × rating / 4`. Use the following descriptors when judging the submitted and defended evidence.

| Criterion | Excellent | Good | Satisfactory | Weak |
| --- | --- | --- | --- | --- |
| **Model, assumptions, scope, variables, and units** (15%) | Correct, complete and appropriate model; assumptions and boundary justified; variables, parameters and units explicit and consistent; expected behaviour clear. | Appropriate and mostly correct model; scope and most variables/units stated; minor omissions do not change the conclusion. | Basic model identified, but scope, assumptions or units are only partly explained; computation can be followed with support. | Model missing or materially wrong; scope, assumptions, variables or units are absent or inconsistent. |
| **Algorithm and MATLAB implementation evidence** (25%) | Clear input-to-output algorithm; MATLAB faithfully implements it; one modification is physically justified; relevant code is traceable without hidden state. | Algorithm and implementation substantially correct; modification linked to model; main code path traceable with minor issues. | Partial algorithm/code evidence; dependencies or modification logic incomplete; needs prompting or a small repair. | No coherent algorithm-to-code link, unidentifiable or wrong modification, or code cannot be meaningfully traced or run. |
| **Principal output and reproducibility** (15%) | Labelled output directly answers the question; units/settings are meaningful; fresh-session run succeeds; another person can reproduce the main claim. | Relevant readable output with most labels/settings; fresh run supports the same conclusion with a minor omission. | Output exists but labels, settings or run instructions are incomplete; reproduction partly depends on unstated state. | Output missing, irrelevant, misleading or unlabelled; no clean reproducible run. |
| **Validation evidence** (15%) | Required and different chosen checks are appropriate, independently executed and supported by clear evidence; what each check establishes is stated. | Both checks are appropriate and evidenced, but one explanation or comparison is limited. | At least one valid check shown; second is missing, weak, duplicated or poorly linked to the claim. | No valid check, or checks are inappropriate, circular or contradicted by the result. |
| **Physical interpretation and limitations** (15%) | Accurate physical explanation linked to model and evidence; meaningful limitation and consequence stated; no overclaim. | Correct main result/trend and relevant limitation; explanation is somewhat general but defensible. | Mainly restates graph/number; physical reasoning limited or limitation vague. | Interpretation absent/incorrect, no meaningful limitation, or conclusion overclaims evidence. |
| **Presentation and communication** (10%) | Coherent, concise and readable evidence story from question/model through modification, output, checks, interpretation and limitation. | Clear story covering main evidence; minor sequencing, visual or terminology issues. | Some evidence presented, but story is cluttered, uneven or dependent on prompting. | Incomplete, hard to follow or unreadable; no defensible computational conclusion communicated. |
| **Individual defence and AI decision record** (5%) | Every member traces relevant code and answers a follow-up with physical/algorithmic/validation reasoning; AI decisions and independent checks are clear. | Members explain the main code path with minor prompting; AI record substantially complete and checks identifiable. | Tracing/answers partial or uneven; AI record omits some decisions or checks. | Member cannot trace or defend work, or individual/AI evidence is unusable. |

Independent extensions, blank-page implementations, or advanced method comparisons may earn distinction credit but are not required for ordinary completion.

## Ungraded short remediation

When a weekly diagnostic shows a common misconception, retain the planned schedule and publish an optional 10–15 minute remediation through Google Classroom.

Each remediation contains:

1. one named misconception;
2. one plain-language explanation;
3. one worked correction using a familiar physical model;
4. one retry question or code-tracing task;
5. the correct reasoning after the retry; and
6. one confidence check.

Keep it ungraded unless the lecturer explicitly changes the policy. Track completion and responses for teaching feedback. Do not make optional remediation a hidden prerequisite for the next lecture.

## Ungraded revision and reflection

Use Google Classroom for short revision activities that rehearse assessment structure without reproducing confidential questions. A suitable evidence packet contains:

1. initial prediction or code trace;
2. revised reasoning after progressive hints;
3. one misconception or defect corrected;
4. one validation choice; and
5. confidence before and after.

Gemini Notebook / NotebookLM may provide source-grounded Socratic guidance. It should ask one focused question at a time and use progressive hints rather than immediately producing a complete solution.

## Responsible AI evidence

AI is allowed in practicals, the individual lab test, and the capstone. Students provide a concise record of:

- what assistance was requested;
- what output was accepted, modified, or rejected;
- why that decision was made; and
- which check was used before accepting the output.

Do not require complete chat histories and do not use AI-detection scores as misconduct evidence. Establish validity through code tracing, parameter variants, short explanations, process checkpoints, reproducibility, and validation.

Google Classroom remains the official submission/evidence record. Gemini Notebook / NotebookLM is a learning companion. Written tests and the final examination remain AI-free.

## Minimum runnability and validation rule

Perfect or highly polished code is not required. A student may earn model, pseudocode, tracing, diagnosis, and interpretation marks when implementation is incomplete.

Full computational-output marks require reproducible output or a precise diagnosis of why execution failed. Full integrated-task marks require at least one valid validation check. A student who never demonstrates a valid check in individual assessed evidence has not met the pass profile.

## Evidence base

- [MathWorks: Set Up MATLAB Copilot](https://www.mathworks.com/help/matlab-copilot/ug/set-up-matlab-copilot.html) — generated code and explanations require independent checking.
- [TEQSA: Assessment reform for the age of artificial intelligence](https://www.teqsa.gov.au/sites/default/files/2023-09/assessment-reform-age-artificial-intelligence-discussion-paper.pdf) — use multiple contextualised modes, process evidence, and secure checkpoints.
- [Weller et al. (2022): Computational-thinking practices in introductory physics](https://journals.aps.org/prper/abstract/10.1103/PhysRevPhysEducRes.18.020106) — translating physics into code and constructing algorithms are distinct computational-thinking practices.
