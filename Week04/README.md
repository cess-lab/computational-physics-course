# Week 04 — Parameter Sweeps: Compare one controlled change and interpret the graph

## Weekly workflow

**Before:** Read the learning note, complete the dedicated Week 04 diagnostic in Google Classroom when it is released, and predict the direction of the swept parameter.

**During:** Follow `question -> changed input -> fixed inputs -> sweep -> graph -> validation -> interpretation`; run the supplied MATLAB work and complete the exit ticket.

**Practical:** Work in a group of two or three through ten progressive challenges, recording the model, units, algorithm, code/output, validation, interpretation, and material AI decisions. Rerun the final work from a fresh MATLAB session.

**After:** Submit the locked packet through Google Classroom. The question slot and eligible student are drawn after submission for the individual defence. Feedback and any optional short remediation/retry are issued through Classroom.

**Portfolio status:** Week 04 is one of the ten counted practical packets; the best eight packets count for the group component.

## Student-Facing Package

- `Week04_Learning_Note_Parameter_Sweeps_and_Graph_Interpretation.pdf`
- `Lecture_Slides_Week04.pptx`
- `Week04_Lecture_Demonstration_Parameter_Sweeps_with_Hookes_Law.m`
- `Week04_Practical_AI_Enabled_Parameter_Sweeps_and_Graph_Interpretation_Challenge_Set.m`
- `Week04_Capstone_Preference_Checkpoint.md`
- `PHY4605_Capstone_Projects_Detailed.pptx` — one detailed slide for each of the twelve assigned projects, with English presenter notes.
- `PHY4605_Capstone_Projects_Detailed.pdf` — reading copy of the same twelve slides.

The Week 04 lecture slide deck is an image-based 16:9 PowerPoint deck with English speaker notes. For quantitative slide graphics, MATLAB figures are retained as numerical/geometry references and the final graph, labels, annotations, and slide layout are generated as one cohesive built-in ImageGen canvas rather than by overlaying a MATLAB raster. Its hidden source images, prompt jobs, worker ledger, and rendered QA evidence are under `.agent/lecture-slides/codex-ppt/`.

## Learning Focus

Week 04 uses Hooke's law as the familiar lecture model. The Core route is:

`physical question -> choose one parameter -> hold other inputs fixed -> build parameter array -> evaluate the same model repeatedly -> overlay labelled curves -> validate a known/limiting case -> explain the trend physically`

The lecture varies spring stiffness while keeping the applied-force array fixed. Quantitative sensitivity measures and heatmaps remain Optional stretch.

## MATLAB Requirement

The editable Live Scripts use MATLAB's plain-text Live Script format and require MATLAB R2025a or later. The Week 04 Core files use base MATLAB only.

## Practical and AI Use

The practical is an AI-enabled group challenge set using three supplied transfer contexts: an Ohmic resistor, vertical motion, and a small-angle pendulum. Generative AI may be used to write, debug, or improve code, but every challenge still requires prediction, model/units, a controlled-comparison plan, runnable evidence, validation, interpretation, and a concise AI decision record. Google Classroom remains the official submission record.

## Capstone Preference Checkpoint

Week 04 includes a formative capstone scope-familiarisation checkpoint. Each group reviews its assigned brief from the twelve-brief, six-family catalogue, identifies one physical parameter or realism dimension it might examine, and records what it would hold fixed. This is **not** the Week 06 feasibility checkpoint and carries no separate assessment weight.

If the Week 04 diagnostic reveals a common misconception, the lecturer may post an optional 10–15 minute Classroom remediation with one retry and confidence check. It is not a prerequisite for the next lecture.

## Instructor / QA Package

Hidden support materials are stored under `.agent/`:

- learning-note source and PDF QA evidence under `.agent/learning-notes/`;
- content manifest under `.agent/manifests/`;
- practical reference, variants, defence rubric, and rotation ledger under `.agent/practical/`;
- MATLAB-generated learning-note plot and run/check evidence under `.agent/matlab/`.
- lecture-slide source, raster assets, prompt jobs, worker dispatch ledger, and rendered PPTX QA under `.agent/lecture-slides/codex-ppt/`.
