# Week 05 — Root Finding: Locate a physical solution and verify the residual

## Weekly workflow

**Before:** Read the learning note, complete the dedicated Week 05 diagnostic in Google Classroom when it is released, and predict the residual sign and bracket.

**During:** Follow `target -> residual -> bracket -> algorithm -> code -> substitution -> interpretation`; trace the supplied MATLAB work and complete the exit ticket.

**Practical:** Work in a group of two or three through ten progressive challenges, recording the model, units, algorithm, code/output, validation, interpretation, and material AI decisions. Rerun the final work from a fresh MATLAB session.

**After:** Submit the locked packet through Google Classroom. The question slot and eligible student are drawn after submission for the individual defence. Feedback and any optional short remediation/retry are issued through Classroom.

**Portfolio status:** Week 05 is one of the ten counted practical packets; the best eight packets count for the group component.

## Student-Facing Package

- `Week05_Learning_Note_Root_Finding.pdf`
- `Week05_Lecture_Demonstration_Root_Finding_for_Projectile_Range.m`
- `Week05_Practical_AI_Enabled_Root_Finding_Challenge_Set.m`

The current [Week 05 lecture slide deck](Lecture_Slides_Week05.pptx) is a completed 14-slide image-based Teaching Courseware deck. Final QA records under `.agent/lecture-slides/codex-ppt/qa/` document the approved outline and sample gates, 14/14 speaker-note sections, full-size inspection, and no pending or blocked jobs. The pre-existing editable deck is retained as historical provenance at `.agent/lecture-slides/codex-ppt/qa/retired/Lecture_Slides_Week05_previous.pptx`; it is not the current student-facing deck.

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

Complete the dedicated Week 05 diagnostic through its Google Classroom coursework when released. If it reveals a common misconception, the lecturer may post an optional 10–15 minute remediation with one retry and confidence check; it is not a prerequisite for the next lecture. The local question key remains planning material until publication is approved.

## Test 1 timing

Test 1 covers Weeks 01–05. The broad UPM Assessment I window is academic Weeks 4–6, with active blocks 26 October–08 November and 16–22 November 2026; the sequence-safe PHY4605 target is academic Week 6 (16–22 November), after this week / alongside Week 06. The exact local date is to be confirmed.

## Instructor / QA Package

Hidden support materials are stored under `.agent/`:

- learning-note source, build files, and rendered QA evidence under `.agent/learning-notes/`;
- content manifest under `.agent/manifests/`;
- MATLAB-generated residual plot and fresh-session run/check evidence under `.agent/matlab/`;
- practical reference, variants, defence rubric, and rotation ledger under `.agent/practical/`;
- the completed lecture-deck sources, speaker notes, and final QA under `.agent/lecture-slides/codex-ppt/`; the retired editable deck is preserved separately as historical provenance.
