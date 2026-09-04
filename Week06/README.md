# Week 06 - Numerical Differentiation

## Student-Facing Package

- `Week06_Learning_Note_Numerical_Differentiation.pdf`
- `Week06_Lecture_Demonstration_Numerical_Differentiation_of_Vertical_Motion.m`
- `Week06_Practical_AI_Enabled_Numerical_Differentiation_Challenge_Set.m`
- `Week06_Capstone_Feasibility_Proposal.md`

The completed lecture deck is [Lecture_Slides_Week06.pptx](Lecture_Slides_Week06.pptx). Its reproducible full-slide image sources, prompts, speaker notes, and quality-assurance evidence are retained under `.agent/lecture-slides/`.

## Learning Focus

Week 06 uses familiar vertical motion to interpret a derivative as a physical rate. The Core route is:

`physical rate -> two nearby position values -> forward difference -> step-size comparison -> analytic derivative -> simple error -> units and physical interpretation`

The lecture estimates the instantaneous vertical velocity of a projectile from its position model. Central difference and an error-versus-step-size view are Working exposure. Error-order derivations, detailed truncation-versus-round-off analysis, and higher-order formulas remain Stretch.

## Locked Lecture Model

Use

`y(t) = y0 + v0*t - 0.5*g*t^2`

with `y0 = 0 m`, `v0 = 20 m/s`, `g = 9.81 m/s^2`, and target time `t0 = 1.0 s`. The analytic reference is

`v(t) = dy/dt = v0 - g*t`,

so `v(1.0 s) = 10.19 m/s`. The Core forward-difference step sizes are `h = [0.5 0.2 0.1 0.05] s`.

## MATLAB Requirement

The editable Live Scripts use MATLAB's plain-text Live Script format and require MATLAB R2025a or later. The Week 06 Core files use base MATLAB only. Local QA is performed with MATLAB R2026b prerelease.

## Practical and AI Use

The practical is an AI-enabled group challenge set using three supplied transfer contexts: vertical motion, electric potential to electric field, and Newtonian cooling rate. Generative AI may be used to write, debug, or improve code, but each challenge still requires a physical prediction, model and units, a numerical differentiation plan, runnable evidence, analytic/reference validation, error interpretation, and a concise AI decision record. Google Classroom remains the official submission record.

## Capstone Feasibility Milestone

`Week06_Capstone_Feasibility_Proposal.md` is the first graded capstone milestone and is worth **2% of the course**. Groups select one bounded problem space and show that the proposed question, model, output, modification, and validation anchor are manageable. The numerical method is not locked in Week 06; method and validation-plan approval remains the Week 07 milestone.

## Individual Pre-Practical Diagnostic

A draft six-question Week 06 diagnostic key and cohort-analysis specification is retained at `../.agent/google-forms/Week06_Question_Key_and_AI_Analysis.md`. It is planning material only; no live Form or Classroom coursework is created until the Week 06 materials and wording are approved.

## Instructor / QA Package

Hidden support materials are stored under `.agent/`:

- learning-note source, build evidence, and rendered QA under `.agent/learning-notes/`;
- content manifest under `.agent/manifests/`;
- MATLAB figure generation and fresh-session QA under `.agent/matlab/`;
- practical reference, variants, defence rubric, and rotation ledger under `.agent/practical/`;
- lecture-deck outline only under `.agent/lecture-slides/`.
