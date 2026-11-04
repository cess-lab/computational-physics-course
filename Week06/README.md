# Week 06 — Numerical Differentiation: Estimate a physical rate and test the step size

## Weekly workflow

**Before:** Read the learning note, complete the dedicated Week 06 diagnostic in Google Classroom when it is released, and predict the sign and approximate size of the rate.

**During:** Follow `physical rate -> nearby values -> difference rule -> step size -> reference -> error -> interpretation`; run the supplied MATLAB work and complete the exit ticket.

**Practical:** Work in a group of two or three through ten progressive challenges, recording the model, units, algorithm, code/output, validation, interpretation, and material AI decisions. Rerun the final work from a fresh MATLAB session.

**After:** Submit the locked packet through Google Classroom. The question slot and eligible student are drawn after submission for the individual defence. Feedback and any optional short remediation/retry are issued through Classroom.

**Portfolio status:** Week 06 is one of the ten counted practical packets; the best eight packets count for the group component.

## Student-Facing Package

- `Week06_Learning_Note_Numerical_Differentiation.pdf`
- `Week06_Lecture_Demonstration_Numerical_Differentiation_of_Vertical_Motion.m`
- `Week06_Practical_AI_Enabled_Numerical_Differentiation_Challenge_Set.m`
- `Week06_Capstone_Feasibility_Proposal.md`

The root-facing [Week 06 lecture deck](Lecture_Slides_Week06.pptx) and the hidden assembled copy at `.agent/lecture-slides/codex-ppt/codex-ppt.pptx` are byte-identical at SHA-256 `70c6b70c35c7ba0ca52bcce65d2f8acd687bb02e6c1a504e8a2ad1e61a1fc8c6`. The QA record preserves an authorised native MATLAB scientific-plot exception for Slide 1 after ImageGen coordinate repairs were rejected, together with the earlier rerun and audit history. Lecturer/sample approval remains a separate provenance gate.

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

`Week06_Capstone_Feasibility_Proposal.md` is a capstone feedback checkpoint, not a separate course-mark component. Each group works from its assigned brief and shows that the proposed question, model, output, modification, and validation anchor are manageable. The numerical method is not locked in Week 06; method and validation-plan approval remains the Week 07 checkpoint. Test 1 targets academic Week 6 (16–22 November 2026), within the broad UPM Assessment I window of academic Weeks 4–6, after the Week 05 content and alongside this week; the exact local date is to be confirmed.

## Individual Pre-Practical Diagnostic

Complete the dedicated Week 06 diagnostic through its Google Classroom coursework when released. If it reveals a common misconception, the lecturer may post an optional 10–15 minute remediation with one retry and confidence check; it is not a prerequisite for the next lecture. The local question key remains planning material until publication is approved.

## Instructor / QA Package

Hidden support materials are stored under `.agent/`:

- learning-note source, build evidence, and rendered QA under `.agent/learning-notes/`;
- content manifest under `.agent/manifests/`;
- MATLAB figure generation and fresh-session QA under `.agent/matlab/`;
- practical reference, variants, defence rubric, and rotation ledger under `.agent/practical/`;
- Codex-PPT lecture-deck sources, speaker notes, and QA under `.agent/lecture-slides/`; the root-facing and hidden PPTX now match, while the authorised Slide 1 exception and rerun history remain part of the record.
