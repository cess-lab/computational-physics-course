# Week 07 — Numerical Integration: Accumulate a changing quantity and test convergence

## Weekly workflow

**Before:** Read the learning note, complete the dedicated Week 07 diagnostic in Google Classroom when it is released, and predict the sign and physical bound of the accumulated quantity.

**During:** Follow `physical quantity -> limits and units -> sampled values -> trapezoids -> refinement -> reference -> interpretation`; run the supplied MATLAB work and complete the exit ticket.

**Practical:** Work in a group of two or three through ten progressive challenges, recording the model, units, algorithm, code/output, validation, interpretation, and material AI decisions. Rerun the final work from a fresh MATLAB session.

**After:** Submit the locked packet through Google Classroom. The question slot and eligible student are drawn after submission for the individual defence. Feedback and any optional short remediation/retry are issued through Classroom.

**Portfolio status:** Week 07 is one of the ten counted practical packets; the best eight packets count for the group component.

## Student-Facing Package

- `Week07_Learning_Note_Numerical_Integration.pdf`
- `Week07_Lecture_Demonstration_Numerical_Integration_of_Decaying_Force.m`
- `Week07_Practical_AI_Enabled_Numerical_Integration_Challenge_Set.m`
- `Week07_Capstone_Model_Method_Validation_Approval.md`

The current [Week 07 lecture slide deck](Lecture_Slides_Week07.pptx) is a completed 17-slide image-based Teaching Courseware deck. It retains the approved 14-slide production plus three inserted cart-context slides; final QA records report 17/17 speaker-note sections and no pending, dispatched, or blocked jobs. The initial 14-slide production record remains under `.agent/lecture-slides/codex-ppt/`, while the current revision and its final QA are under `.agent/lecture-slides/codex-ppt-cart-context/`.

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

`Week07_Capstone_Model_Method_Validation_Approval.md` is a capstone approval checkpoint, not a separate course-mark component. Groups build on the Week 06 feasibility record and lock the physical model, supplied/selected computational method, principal output, one required validation check, one chosen independent check, expected physical behaviour, limitation, and reproducibility/AI-use plan before substantial development continues. These decisions are later judged through the single 100% capstone rubric.

## Individual Pre-Practical Diagnostic

Complete the dedicated Week 07 diagnostic through its Google Classroom coursework when released. If it reveals a common misconception, the lecturer may post an optional 10–15 minute remediation with one retry and confidence check; it is not a prerequisite for the next lecture. The local question key remains planning material until publication is approved.

## Instructor / QA Package

Hidden support materials are stored under `.agent/`:

- learning-note source, build evidence, and rendered QA under `.agent/learning-notes/`;
- content manifest under `.agent/manifests/`;
- MATLAB figure generation and fresh-session QA under `.agent/matlab/`;
- practical reference, variants, defence rubric, and rotation ledger under `.agent/practical/`; and
- final 17-slide lecture-deck sources, speaker notes, and QA under `.agent/lecture-slides/codex-ppt-cart-context/`; the original 14-slide production state remains under `.agent/lecture-slides/codex-ppt/` as provenance.
