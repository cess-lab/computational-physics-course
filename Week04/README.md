# Week 04 - Parameter Sweeps and Graph Interpretation

## Student-Facing Package

- `Week04_Learning_Note_Parameter_Sweeps_and_Graph_Interpretation.pdf`
- `Lecture_Slides_Week04.pptx`
- `Week04_Lecture_Demonstration_Parameter_Sweeps_with_Hookes_Law.m`
- `Week04_Practical_AI_Enabled_Parameter_Sweeps_and_Graph_Interpretation_Challenge_Set.m`
- `Week04_Capstone_Preference_Checkpoint.md`

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

Week 04 includes a formative capstone checkpoint. Each group records one preferred and one alternate bounded problem space and identifies one physical parameter it might modify while holding the rest of the model fixed. This is **not** the Week 06 feasibility submission and carries no new assessment weight.

## Instructor / QA Package

Hidden support materials are stored under `.agent/`:

- learning-note source and PDF QA evidence under `.agent/learning-notes/`;
- content manifest under `.agent/manifests/`;
- practical reference, variants, defence rubric, and rotation ledger under `.agent/practical/`;
- MATLAB-generated learning-note plot and run/check evidence under `.agent/matlab/`.
- lecture-slide source, raster assets, prompt jobs, worker dispatch ledger, and rendered PPTX QA under `.agent/lecture-slides/codex-ppt/`.
