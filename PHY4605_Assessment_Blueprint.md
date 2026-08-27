# PHY4605 Assessment Blueprint

This document defines how PHY4605 assesses computational methods in physics. It is the source of truth for written tests, the final examination, weekly practicals, the individual lab test, and the capstone investigation.

## Assessment purpose

PHY4605 assesses whether a student can convert a physics problem into a defensible computational experiment. MATLAB syntax and code polish are supporting skills, not the main outcome.

A successful student can:

1. formulate a physical model, assumptions, variables, parameters, and units;
2. identify scales, initial/boundary conditions, and the required output;
3. select and justify a numerical or symbolic method;
4. construct pseudocode or another explicit algorithmic flow;
5. use MATLAB and AI tools to implement or inspect the method;
6. diagnose physical, logical, numerical, and implementation errors;
7. validate using units, known or limiting cases, convergence, residuals, conservation, reference results, sensitivity, or uncertainty as appropriate; and
8. interpret and defend the result physically.

## Assessment map

| Assessment | Weight | Duration/mode | AI condition |
| --- | ---: | --- | --- |
| Test 1 | 10% | 90-minute open-book written assessment | AI-free |
| Test 2 | 10% | 90-minute open-book written assessment | AI-free |
| Final examination | 40% | 120-minute open-book written examination | AI-free |
| Practical portfolio | 15% | Ten group evidence packets | AI allowed and declared |
| Individual lab test | 10% | Individual verification challenge in the practical session | AI allowed and declared |
| Capstone investigation | 15% | Group project with individual defence | AI allowed and declared |

Open-book conditions are intended to reduce memorisation. Written questions must therefore use unfamiliar or adapted physics cases, supplied evidence, and decision-making tasks. A compact MATLAB/method reference sheet may be supplied.

## Written-assessment question paradigms

Use several paradigms in each assessment rather than relying on one long calculation.

### Model formulation

Provide a physical situation and ask students to identify the question, state variables, parameters and units, assumptions, governing equations, initial/boundary conditions, and required outputs.

### Decomposition and pseudocode

Ask students to express the workflow as:

`inputs -> model -> discretisation -> algorithm -> output -> validation`.

Accept structured English, a flow diagram, or MATLAB-like pseudocode. Reward correct dependencies and logic rather than punctuation or exact function names.

### Method selection

Ask students to choose and justify a method against the physics, available information, accuracy requirement, computational cost, and likely failure modes.

### Code reading and tracing

Supply a short code fragment and ask students to trace one or two iterations, connect variables to physical quantities, predict an output/graph, or explain an indexing and update choice. Do not require lengthy hand execution.

### Debugging and AI-output critique

Supply a plausible MATLAB Copilot response containing physical, unit, logical, numerical, or implementation defects. Students must locate each defect, explain its consequence, and propose a defensible correction or test.

### Numerical evidence

Supply tables, curves, residuals, eigenmodes, fit results, or convergence evidence. Ask students to quantify and interpret accuracy, cost, uncertainty, sensitivity, stability, or model adequacy.

### Validation design

Ask students to propose independent checks appropriate to the problem and explain what each check would detect.

### Adaptation and transfer

Change an assumption, parameter, initial condition, accuracy target, or requested output. Ask how the model, algorithm, expected behaviour, and validation plan must change.

## Test 1 specification

Test 1 is a 90-minute open-book, AI-free assessment. Use approximately 50 raw marks and two connected physics cases.

| Evidence | Suggested share |
| --- | ---: |
| Model, assumptions, variables, and units | 25% |
| Method selection and pseudocode | 25% |
| Code reading, tracing, or diagnosis | 25% |
| Validation and physical interpretation | 25% |

The coverage should draw mainly from Weeks 01-05 while permitting earlier concepts to recur. Avoid more than 8-12 lines of student-written pseudocode or MATLAB-like code in any one part.

## Test 2 specification

Test 2 is a 90-minute open-book, AI-free assessment. Use approximately 50 raw marks and two connected cases involving numerical evidence.

| Evidence | Suggested share |
| --- | ---: |
| Error, convergence, residual, or uncertainty reasoning | 30% |
| Method selection or algorithm adaptation | 25% |
| Diagnosis of supplied MATLAB/AI-assisted work | 20% |
| Validation, limitation, and interpretation | 25% |

The coverage should draw mainly from Weeks 06-11 while requiring students to reuse the course-wide modelling and validation chain.

## Final-examination specification

The final examination is 120 minutes, open book, and AI-free. Use 80 raw marks so that the expected writing and calculation load remains realistic.

| Section | Raw marks | Suggested time | Purpose |
| --- | ---: | ---: | --- |
| A. Computational literacy | 16 | 20 minutes | Short model, units, method, trace, and diagnosis questions |
| B. Evidence and diagnosis | 28 | 40 minutes | Analyse supplied code, plots, tables, residuals, convergence, and AI-generated claims |
| C. Integrated computational design | 36 | 50 minutes | Formulate one unseen physics problem, choose a method, construct pseudocode, plan validation, and interpret expected results |
| Review | - | 10 minutes | Check assumptions, units, logic, and completeness |

The approximate competency balance is:

- model formulation: 25%;
- method selection and pseudocode: 20%;
- code/AI-output inspection: 20%;
- numerical evidence: 20%; and
- validation, limitations, and physical interpretation: 15%.

Do not ask students to reproduce a memorised algorithm or write a long program from scratch. Supply formulas or syntax that are not themselves the target of the question.

## Practical portfolio

Collect ten compact group evidence packets. Students work in stable groups of two or three and rotate the roles of model lead, algorithm/implementation lead, and validation lead.

Each packet contains:

1. a prediction;
2. the model, assumptions, variables, and units;
3. pseudocode or an algorithm map;
4. selected computational output;
5. validation evidence;
6. physical interpretation and one limitation; and
7. a concise AI-use decision record.

Require all ten submissions but count the best eight for the group component. Use selected individual entry/exit checks to establish participation and understanding.

| Criterion | Weight within portfolio |
| --- | ---: |
| Physical model, assumptions, and units | 20% |
| Algorithm and method reasoning | 20% |
| Computational implementation | 15% |
| Validation and numerical evidence | 25% |
| Interpretation and limitations | 15% |
| Responsible AI decision record | 5% |

## Individual AI-assisted lab test

Use an individual verification challenge rather than blank-page programming.

Each student receives a physical problem, a partially completed or flawed AI-generated Live Script, an individual parameter variant, and a validity or accuracy requirement. Students may use MATLAB Copilot but must:

1. state the model and assumptions;
2. inspect the proposed algorithm;
3. identify and explain defects;
4. repair or improve the solution;
5. provide at least two independent validation checks;
6. interpret the result;
7. respond to an unseen parameter, condition, or accuracy change; and
8. answer a brief individual defence question.

| Criterion | Weight within lab test |
| --- | ---: |
| Model and method reasoning | 20% |
| Defect diagnosis and correction | 25% |
| Numerical/validation evidence | 30% |
| Physical interpretation | 15% |
| Individual defence and AI judgement | 10% |

The lecturer and demonstrator may conduct parallel three-minute defences. Suitable prompts include: “Show the line that represents the physics,” “Why is this resolution acceptable?”, “What did Copilot suggest that you rejected?”, and “Which check would fail first if the result were wrong?”

## Capstone investigation

The capstone is an open but bounded group problem. The group should have freedom in the physical question, parameters, evidence, and interpretation while using methods that are feasible within the course.

| Milestone | Week | Weight within course |
| --- | ---: | ---: |
| Problem formulation and feasibility proposal | 06 | 2% |
| Approved method and validation plan | 07 | 3% |
| Development/process evidence | 08-12 | 3% |
| Final computational investigation | 14 | 5% |
| Individual defence | 14 | 2% |

Assess the development trail, including decisions, revisions, dead ends, evidence, and limitations. Do not assess only the final polished code or presentation.

## Responsible AI evidence

AI is allowed in practicals, the individual lab test, and the capstone. Students must provide a concise material-use record stating:

- what AI was asked to do;
- what output was accepted, modified, or rejected;
- why those decisions were made; and
- which independent checks were performed.

Do not require complete chat histories and do not use AI-detection scores as assessment evidence. Establish validity through individual explanations, parameter perturbations, version/process checkpoints, reproducibility, and independent numerical or physical checks.

## Minimum runnability rule

Perfect or highly polished code is not required. A student may earn model, method, pseudocode, and diagnosis marks when implementation is incomplete. Full numerical-evidence and validation marks require reproducible output, or a precise and technically defensible diagnosis of why execution failed and what evidence remains unavailable.

## Evidence base

- [MathWorks: Set Up MATLAB Copilot](https://www.mathworks.com/help/matlab-copilot/ug/set-up-matlab-copilot.html) - Copilot can generate, modify, and explain code, but generated responses require validation.
- [TEQSA: Assessment reform for the age of artificial intelligence](https://www.teqsa.gov.au/sites/default/files/2023-09/assessment-reform-age-artificial-intelligence-discussion-paper.pdf) - use multiple contextualised assessment modes, assess learning processes, and secure meaningful checkpoints.
- [Weller et al. (2022): Computational-thinking practices in introductory physics](https://journals.aps.org/prper/abstract/10.1103/PhysRevPhysEducRes.18.020106) - translating physics into code and algorithm building are distinct computational-thinking practices.
