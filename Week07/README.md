# Week 07 - Numerical Integration

## Student-Facing Package

- `Week07_Learning_Note_Numerical_Integration.pdf`
- `Week07_Lecture_Demonstration_Numerical_Integration_of_Decaying_Force.m`
- `Week07_Practical_AI_Enabled_Numerical_Integration_Challenge_Set.m`
- `Week07_Capstone_Model_Method_Validation_Approval.md`

The Week 07 lecture slide deck is approved for production through the installed `codex-ppt` workflow. The approved 14-slide outline and strict-asset mapping are retained at `.agent/lecture-slides/codex-ppt/outline.md`. Backend confirmation and one representative sample-slide approval are still required before full-deck generation. No Week 07 PPTX has been created yet.

## Learning Focus

Week 07 uses impulse from a time-dependent force to interpret integration as physical accumulation. The Core route is:

`physical accumulation -> explicit limits and area units -> sampled force values -> trapezoidal geometry -> composite trapezoid -> MATLAB trapz -> refinement -> analytic reference -> simple error -> physical interpretation`

The lecture integrates a decaying force over time. A supplied Simpson result and convergence-rate reading are Working exposure. Quadrature error-order derivations, independent multi-rule implementation, and adaptive quadrature remain Stretch.

## Locked Lecture Model

Use

`F(t) = F0*exp(-t/tau)`

with `F0 = 12 N`, `tau = 0.8 s`, and integration limits `0 <= t <= 2.0 s`. The accumulated quantity is impulse,

`J = integral F(t) dt`,

with unit `N s`. The Core interval counts are `[4 8 16]`, corresponding to `Delta t = [0.5 0.25 0.125] s`. The analytic reference is `8.8119840132 N s`; the finest supplied trapezoidal estimate is `8.8299047499 N s`, with relative error about `0.203%`.

## MATLAB Requirement

The editable Live Scripts use MATLAB's plain-text Live Script format and require MATLAB R2025a or later. The Week 07 Core files use base MATLAB only. Local QA is performed with MATLAB R2026b prerelease.

## Practical and AI Use

The practical is an AI-enabled group challenge set using three transfer contexts: impulse from a decaying force, mechanical work from a position-dependent force, and accumulated charge from a decaying current. Generative AI may be used to write, debug, or improve code, but each challenge still requires a physical prediction, integration limits and units, trapezoidal plan, runnable evidence, refinement or reference validation, physical interpretation, and a concise AI decision record. Google Classroom remains the official submission record.

## Capstone Model/Method/Validation Milestone

`Week07_Capstone_Model_Method_Validation_Approval.md` is the second graded capstone milestone and is worth **3% of the course**. Groups build on the Week 06 feasibility proposal and lock the physical model, supplied/selected computational method, principal output, one required validation check, one chosen independent check, expected physical behaviour, limitation, and reproducibility/AI-use plan before substantial development continues.

## Individual Pre-Practical Diagnostic

A draft six-question Week 07 diagnostic key and cohort-analysis specification is retained at `../.agent/google-forms/Week07_Question_Key_and_AI_Analysis.md`. It is planning material only; no live Form or Classroom coursework is created until the Week 07 materials and wording are approved.

## Instructor / QA Package

Hidden support materials are stored under `.agent/`:

- learning-note source, build evidence, and rendered QA under `.agent/learning-notes/`;
- content manifest under `.agent/manifests/`;
- MATLAB figure generation and fresh-session QA under `.agent/matlab/`;
- practical reference, variants, defence rubric, and rotation ledger under `.agent/practical/`; and
- approved lecture-deck outline under `.agent/lecture-slides/codex-ppt/`; the remaining Codex-PPT production state will be created only after the required backend and sample approvals.
