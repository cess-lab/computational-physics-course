# Week 03 - Two-by-Two Linear Systems through Kirchhoff Circuits

## Student-Facing Package

- `Week03_Learning_Note_Two_by_Two_Linear_Systems_through_Kirchhoff_Circuits.pdf`
- `Lecture_Slides_Week03.pptx`
- `Week03_Lecture_Demonstration_Two_by_Two_Linear_Systems_through_Kirchhoff_Circuits.m`
- `Week03_Practical_AI_Enabled_Kirchhoff_Linear_Systems_Challenge_Set.m`

The lecture deck follows the approved Week 02 Teaching Courseware visual system and includes English presenter notes.

## Learning Focus

Week 03 uses a two-loop DC circuit to connect familiar Kirchhoff laws to a small linear system. The Core route is:

`physical circuit -> sign convention -> two Kirchhoff equations -> A*x=b -> MATLAB backslash -> reconstructed current -> direct-substitution check -> physical interpretation`

The ordinary-pass route uses only two unknowns. Rank, condition number, formal residual analysis, power balance, and singular-system diagnosis are labelled as Optional stretch.

## MATLAB Requirement

The editable Live Scripts use MATLAB's plain-text Live Script format and require MATLAB R2025a or later. The Week 03 Core files use base MATLAB only.

## Practical and AI Use

The practical is an AI-enabled group challenge set. Generative AI may be used to write, debug, or improve code, but students must still record the physical model and units, computational plan, runnable evidence, validation, interpretation, and a concise AI decision record. Google Classroom remains the official submission record.

## Instructor / QA Package

Hidden support materials are stored under `.agent/`:

- learning-note source and PDF QA evidence under `.agent/learning-notes/`;
- content manifest under `.agent/manifests/`;
- practical reference, variants, defence rubric, and rotation ledger under `.agent/practical/`;
- MATLAB run/check evidence under `.agent/matlab/qa/`;
- lecture-slide outline, strict source assets, worker state, rendered QA, and assembly evidence under `.agent/lecture-slides/codex-ppt/`.

The final student-facing deck is kept directly in `Week03/`; generated slide sources, images, prompts, logs, and QA evidence remain under the hidden `.agent/` hierarchy.
