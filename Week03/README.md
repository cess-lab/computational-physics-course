# Week 03 — Linear Systems: Assemble and validate two-loop Kirchhoff equations

## Weekly workflow

**Before:** Read the learning note, complete the dedicated Week 03 diagnostic in Google Classroom when it is released, and predict the current directions and signs.

**During:** Follow `circuit -> sign convention -> equations -> matrix -> solve -> validation -> interpretation`; trace the supplied MATLAB work and complete the exit ticket.

**Practical:** Work in a group of two or three through ten progressive challenges, recording the model, units, algorithm, code/output, validation, interpretation, and material AI decisions. Rerun the final work from a fresh MATLAB session.

**After:** Submit the locked packet through Google Classroom. The question slot and eligible student are drawn after submission for the individual defence. Feedback and any optional short remediation/retry are issued through Classroom.

**Portfolio status:** Week 03 is one of the ten counted practical packets; the best eight packets count for the group component.

## Student-Facing Package

- `Week03_Learning_Note_Two_by_Two_Linear_Systems_through_Kirchhoff_Circuits.pdf`
- `Lecture_Slides_Week03.pptx`
- `Week03_Lecture_Demonstration_Two_by_Two_Linear_Systems_through_Kirchhoff_Circuits.m`
- `Week03_Practical_AI_Enabled_Kirchhoff_Linear_Systems_Challenge_Set.m`

The 15-slide lecture deck follows the approved Teaching Courseware visual system and includes English presenter notes. Two later slides offer optional future exposure to a bridge-style three-mesh scaffold; they are not new Core assessment content.

## Learning Focus

Week 03 uses a two-loop DC circuit to connect familiar Kirchhoff laws to a small linear system. The Core route is:

`physical circuit -> sign convention -> two Kirchhoff equations -> A*x=b -> MATLAB backslash -> reconstructed current -> direct-substitution check -> physical interpretation`

The ordinary-pass route uses only two unknowns. Rank, condition number, formal residual analysis, power balance, and singular-system diagnosis are labelled as Optional stretch.

## Capstone problem-space introduction

Week 03 introduces the bounded capstone menu before the Week 04 preference checkpoint. The five canonical options are projectile range, RC charging, radioactive decay, Newton cooling, and decaying-force impulse. Each group should discuss one preferred and one alternate problem space; the formal preference record is due in Week 04. No capstone submission or grade is due in Week 03.

## MATLAB Requirement

The editable Live Scripts use MATLAB's plain-text Live Script format and require MATLAB R2025a or later. The Week 03 Core files use base MATLAB only.

## Practical and AI Use

The practical is an AI-enabled group challenge set. Generative AI may be used to write, debug, or improve code, but students must still record the physical model and units, computational plan, runnable evidence, validation, interpretation, and a concise AI decision record. Google Classroom remains the official submission record.

## Classroom diagnostic

Complete the dedicated Week 03 diagnostic through its Google Classroom coursework when released. If it reveals a common misconception, the lecturer may post an optional 10–15 minute remediation with one retry and confidence check; it is not a prerequisite for the next lecture.

## Instructor / QA Package

Hidden support materials are stored under `.agent/`:

- learning-note source and PDF QA evidence under `.agent/learning-notes/`;
- content manifest under `.agent/manifests/`;
- practical reference, variants, defence rubric, and rotation ledger under `.agent/practical/`;
- MATLAB run/check evidence under `.agent/matlab/qa/`;
- lecture-slide outline, strict source assets, worker state, rendered QA, and assembly evidence under `.agent/lecture-slides/codex-ppt/`.

The final student-facing deck is kept directly in `Week03/`; generated slide sources, images, prompts, logs, and QA evidence remain under the hidden `.agent/` hierarchy.
