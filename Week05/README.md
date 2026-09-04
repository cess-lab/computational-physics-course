# Week 05 - Root Finding

## Student-Facing Package

- `Week05_Learning_Note_Root_Finding.pdf`
- `Week05_Lecture_Demonstration_Root_Finding_for_Projectile_Range.m`
- `Week05_Practical_AI_Enabled_Root_Finding_Challenge_Set.m`

The Week 05 lecture slide deck is **not part of the current preparation stage**. A review-ready 14-slide planning outline is retained at `.agent/lecture-slides/codex-ppt/outline.md`. A PPTX and associated production files from an earlier run remain in the repository, but they were not generated or revised for this task and should be ignored until the lecturer explicitly asks to proceed with Week 05 slides.

## Learning Focus

Week 05 uses a familiar level-ground projectile-range model to make the meaning of a numerical root visible. The Core route is:

`physical target -> original equation -> residual f(x)=0 -> residual sign -> graph -> sign-changing bracket -> bisection/Newton update -> one stopping rule -> substitute root into residual -> physical meaning and unit`

The lecture finds one low-angle projectile solution. Uniqueness proof, several stopping criteria, `fzero`, safeguarded Newton methods, and formal solver selection remain Stretch material.

## Locked Lecture Model

The lecture uses

`R(theta) = v0^2/g * sin(2 theta)`

with `v0 = 20 m/s`, `g = 9.81 m/s^2`, target range `35 m`, low-angle bracket `[20, 40] degree`, Newton starting angle `25 degree`, and one residual stopping rule `abs(f) < 1e-3 m`. The residual is model range minus target range, so a negative residual means undershoot and a positive residual means overshoot.

## MATLAB Requirement

The editable Live Scripts use MATLAB's plain-text Live Script format and require MATLAB R2025a or later. The Week 05 Core files use base MATLAB only.

## Practical and AI Use

The practical is an AI-enabled group challenge set using three supplied transfer contexts: projectile range, the thin-lens equation, and an RC charging threshold. Generative AI may be used to write, debug, or improve code, but every challenge still requires the physical model and units, a defined residual, a bracket or starting-value plan where applicable, runnable evidence, residual substitution, physical interpretation, and a concise AI decision record. Google Classroom remains the official submission record.

Each context uses the same Core stopping-rule pattern, `abs(residual) < supplied_tolerance`, with the tolerance carrying the residual's physical unit. Students are not asked to compare several stopping criteria.

## Individual Pre-Practical Diagnostic

A draft six-question Week 05 diagnostic key and cohort-analysis specification is retained at `../.agent/google-forms/Week05_Question_Key_and_AI_Analysis.md`. It is planning material only; it does not create or publish a Google Form.

## Instructor / QA Package

Hidden support materials are stored under `.agent/`:

- learning-note source, build files, and rendered QA evidence under `.agent/learning-notes/`;
- content manifest under `.agent/manifests/`;
- MATLAB-generated residual plot and fresh-session run/check evidence under `.agent/matlab/`;
- practical reference, variants, defence rubric, and rotation ledger under `.agent/practical/`;
- the lecture-slide planning outline at `.agent/lecture-slides/codex-ppt/outline.md`; existing deck-production files in that area are pre-existing and out of scope for this stage.
