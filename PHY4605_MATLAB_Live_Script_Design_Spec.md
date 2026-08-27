# PHY4605 MATLAB Live Script Design Specification

This is the project-wide source of truth for the structure, presentation, implementation style, and reproducibility of PHY4605 MATLAB Live Scripts. All new and revised Live Scripts use MATLAB's plain-text Live Script format (`.m`, supported in R2025a and later) rather than the binary `.mlx` format. This convention applies to starter scripts, worked examples, practicals, and capstone project notebooks.

## File-format contract

- Save the final editable student-facing Live Script as `.m` directly in its `WeekXX/` folder.
- Author rich text with `%[text]` directives, code sections with `%%`, and the MATLAB Live Editor appendix metadata at the end of the file.
- Use exactly one blank line: immediately before the `%[appendix]` block. Do not place blank lines elsewhere in the file.
- Keep `.mlx` only as a retired or imported legacy artefact under `.agent/`; do not create new `.mlx` deliverables.
- Treat the visible `.m` file as both the version-controlled source and the MATLAB Live Script. Do not maintain a second hidden source copy.
- Require MATLAB R2025a or later to open the file with the intended rich-text Live Editor presentation.

## Design identity

Use the standard name **PHY4605 Physics-First Reproducible MATLAB Notebook**. The Live Script is an executable teaching document: every code section must remain connected to a physical question, a stated model, a numerical choice, and evidence that the result is trustworthy.

Do not apply the lecture-slide raster design to a Live Script. Use readable rich text, native MATLAB code, meaningful figures, and executable checks. An illustration may be embedded when it materially improves the explanation, but the Live Script must remain a readable, editable, executable teaching document.

## Artifact roles and filenames

Keep lecture and practical Live Scripts visibly distinct.

| Role | Filename pattern | H1 title pattern | Interaction contract |
| --- | --- | --- | --- |
| Lecture demonstration | `WeekXX_Lecture_Demonstration_<Topic>.m` | `Week X Lecture Demonstration: <Title>` | A complete worked example led by the lecturer. It may contain verbal `Pause and Predict` prompts, but no `TODO`, student typing requirement, submission field, exit ticket, or AI-use declaration. Students may receive the file before the lecture, and the lecture must remain deliverable without student laptops. |
| Practical activity | `WeekXX_Practical_<Topic>.m` | `Week X Practical Activity: <Title>` | A student group investigation with explicit checkpoints, editable `TODO` records, validation evidence, and an AI decision record where relevant. It begins only after each student completes the course Google Form individual check. |

Place the role label in bold immediately below the H1 as `LECTURE DEMONSTRATION` or `PRACTICAL ACTIVITY`. Do not reuse one file as a hybrid lecture worksheet and practical submission.

## Heading hierarchy and title format

Use the following hierarchy consistently in every student-facing MATLAB Live Script. Express headings through plain-text Live Script markup:

- Use exactly one visible heading level 1 for the Live Script title: `%[text] # Title`.
- Write the level 1 title in title case. Use normal title-case conventions rather than all capitals; short articles and prepositions may remain lowercase unless they begin or end the title.
- Start every main section with `%%`, immediately followed by `%[text] ## Section Title`.
- Do not put section numbers in level 2 headings. The conceptual order must be clear from the sequence of sections, not from prefixes such as `1.`, `2.`, or `3.`.
- Use `%[text] ### Subheading` only when a main section genuinely needs subheadings.
- Do not use heading level 4 or any deeper level.
- Keep the visible student-facing headings and prose in English.

Example practical structure:

- H1: `Week 1: From a Physics Model to a Computational Experiment`
- H2: `Physical Question and Learning Outcome`
- H2: `Prediction Before Computing`
- H2: `Model, Assumptions, and Parameters`
- H3: `Physical Parameters`
- H3: `Units and Scaling`
- H2: `Numerical Method`
- H2: `Validation`
- H2: `Student Investigation`
- H2: `Exit Ticket and Reproducibility`

Do not encode hierarchy by typing larger-looking text, manual numbering, repeated punctuation, or list formatting in place of the MATLAB Live Editor heading levels.

## Required teaching flow

Organise the Live Script, as applicable, around this sequence:

1. physical question and learning outcome;
2. prediction or checkpoint before computation;
3. model, assumptions, variables, units, and parameter values;
4. algorithm or discretisation explained before implementation;
5. short guided MATLAB code sections with visible outputs;
6. validation through known values, limiting cases, residuals, conservation, reference solutions, or convergence;
7. student modification or investigation task;
8. interpretation of the physical output; and
9. exit ticket, reproducibility record, and responsible-AI declaration when relevant.

The exact number of sections may vary, but the physical model → scale and units → discretisation → algorithm → code → error/uncertainty → validation → physical interpretation chain must remain visible. A lecture demonstration replaces student-entry sections with complete worked explanations and lecturer-led prompts; a practical retains the student investigation and submission evidence.

Use native lists for genuinely multi-item predictions, instructions, or checkpoints. Do not compress a numbered or bulleted task into one long paragraph when separate list items would make the reading order clearer.

## Code explanation and implementation style

Every code block must have a concise explanation immediately before it. The explanation should state the purpose of the code, the relevant physics or numerical idea, and the output or check that students should inspect. Keep it short and focused; avoid line-by-line narration or repeating information that is already obvious from readable code.

Use concise comments inside code for units, assumptions, non-obvious numerical choices, and validation logic. Do not fill code with comments that merely restate the MATLAB syntax.

Make every script runnable from a fresh MATLAB session without hidden Workspace state or manual preconditions. Declare parameters together with units and use names that make units visible where practical, such as `T_half_h`, `dt_s`, or `mass_kg`. Separate parameters, physics model, numerical method, validation, and visualisation into clearly identifiable code sections.

Use native MATLAB syntax, meaningful variable names, and executable checks. Prefer assertions and other executable checks over statements that merely claim a result is correct. Include at least one predictable test, limiting case, reference comparison, residual, conservation check, or convergence study appropriate to the model.

Avoid `clear`, `clearvars`, `close all`, `clc`, explicit `figure` creation, `fprintf`, stale Workspace dependencies, unexplained magic numbers, unlabelled output, and code that is too long to inspect in one teaching step. Let plots create figures implicitly and expose important numerical evidence as named variables, tables, assertions, or Live Editor outputs.

## Official MATLAB functions and toolbox policy

Prefer functions already provided by MATLAB or by official MathWorks toolboxes for general computational tasks, including plotting, figure layout, tables, numerical solvers, numerical integration, fitting, Fourier analysis, and standard validation utilities. Use official MATLAB functionality before writing an equivalent custom function.

Explicitly implement an algorithm when that algorithm is the learning objective, such as demonstrating Forward Euler, Newton's method, a Monte Carlo estimator, or an elementary update rule. In those cases, use official MATLAB functions for supporting tasks such as visualisation, tables, reference calculations, and validation where appropriate.

Use a custom function only when it is itself pedagogically necessary, when no suitable official MATLAB function exists, or when the abstraction substantially improves clarity and reuse. Do not create custom replacements for standard MATLAB capabilities without a clear reason.

Before using a function that requires a toolbox, check whether the relevant MATLAB release and toolbox are installed on the current Mac. If a required toolbox is unavailable:

- report the toolbox and function clearly to the lecturer;
- explain why it is being used;
- identify a suitable base-MATLAB alternative when one exists; and
- do not silently generate or present code that cannot run in the current installation.

Record relevant MATLAB release and toolbox dependencies in the README or reproducibility record for the weekly package.

## Rich-text and visual style

Use short rich-text sections with one clear purpose per heading. Place equations, definitions, assumptions, and units immediately before the code that uses them. Keep code and its output close together so the reader can connect implementation to evidence.

Label every figure with a descriptive title, axis labels, units, and a legend where needed. Add a short interpretation statement after an important plot or table. Prefer a small number of legible plots over decorative or unlabelled figures.

Use a white background and a restrained scientific palette: navy or blue for the model and primary result, green or teal for validation and acceptable behaviour, and orange or red only for warnings or failure modes. Do not use slide-style text panels, branding, or a raster-only presentation contract inside the Live Script.

## Scientific illustrations

Use an illustration only when a visual explanation is materially clearer than prose, equations, or code. Suitable cases include a physical model, computational workflow, discretisation, timestep, numerical update, comparison of exact and numerical solutions, or a relationship between parameters and outputs.

When an illustration is justified:

- generate it with ImageGen;
- request a clean scientific visual style with a white background;
- use clear lines, restrained colours, readable labels, and correct units and symbols;
- avoid decorative elements that do not support the physics explanation;
- check the scientific accuracy, crop safety, reading order, and legibility; and
- insert the illustration directly into the MATLAB Live Script as embedded visual content rather than leaving only an external link.

Keep any surrounding caption or explanation concise and ensure that the illustration agrees with the equations, code, and terminology used in the Live Script. Do not use illustration generation as a substitute for a simple explanation that is already clearer in text or code.

## Reproducibility and assessment

Record the MATLAB release, relevant toolboxes, parameter values and units, numerical settings, random seed where applicable, validation evidence, and expected run order. Keep the visible instructions sufficient for another person to reproduce the result from a fresh MATLAB session.

For AI-assisted work, include what was generated or consulted and the independent checks performed by the student. Required checks may include units, limiting cases, convergence, residuals, conservation, reference results, and physical interpretation.

## Required QA

Run the final `.m` Live Script from a fresh MATLAB session in MATLAB R2025a or later. Confirm that code executes without hidden state, outputs are reproducible where randomness is not intended, figures are readable, heading levels and title case follow this specification, level 2 headings are unnumbered, no heading is deeper than level 3, units and labels are present, and validation checks pass or explain their expected failure.

Inspect the source as plain text and confirm the `%[text]`, `%%`, and `%[appendix]` structure is intact, there is exactly one blank line immediately before the appendix, and no new `.mlx` student-facing copy was produced.

Confirm that every code block has a concise preceding explanation, official MATLAB functions are used where appropriate, toolbox requirements are available or explicitly reported, embedded illustrations are scientifically accurate and legible, and the student task can be completed from the visible instructions.
