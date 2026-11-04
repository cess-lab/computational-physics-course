# Week 13 — Computational Investigation: Present, defend, and hand off a validated physical model

Week 13 begins the bounded capstone presentation sequence. No new numerical method is introduced. Your group turns one approved physical question into one controlled computational result that another physics student can understand, check, and reproduce; Week 14 continues presentations, defences, and reproducibility handoffs.

## Weekly workflow

**Before:** Read the learning note, confirm the approved problem space and validation plan, and rehearse the physical prediction and code trace.

**During:** Present the principal result, explain the model and modification, defend the required and chosen checks, answer the individual follow-up, and demonstrate the fresh-session rerun.

**After:** Submit the locked capstone evidence, reproducibility record, AI decision record, and handoff through Google Classroom. Week 14 is the scheduled continuation/overflow block for capstone presentations, defences, and handoffs.

## Materials

- [Lecture slides](Lecture_Slides_Week13.pptx): 14-slide guide to the evidence chain, principal output, two checks, individual defence, AI decisions, and reproducible handoff.
- [Learning note](Week13_Learning_Note_Capstone_Presentation_Defence_and_Handoff.pdf): model-and-units record, pseudocode, code tracing, validation language, interpretation, and handoff guidance.
- [Practical and capstone brief](Week13_Practical_Capstone_Presentation_Defence_and_Handoff_Brief.pdf): the group contract, assigned-brief evidence requirements, ten progressive micro-challenges, defence rotation, AI decision record, and presentation prompts.
- [Starter and validation Live Script](Week13_Capstone_Starter_and_Validation.m): a runnable MATLAB R2025a-or-later method scaffold with five executable base examples, one controlled modification, and two visible validation checks. The current Capstone Briefing deck and `Assessments/Student-facing/Capstone_Investigation_Brief.md` are the source of truth for the twelve assigned briefs; the five examples are not the assignment catalogue.
- [Capstone handoff checklist](Week13_Capstone_Handoff_Checklist.md): the final evidence and reproducibility checklist.

## Core route

Complete the evidence in this order:

1. State the approved physical question, assumptions, variables, parameters, and units.
2. Write short pseudocode and trace one relevant section of the starter script.
3. Change one parameter or assumption and identify what remains fixed.
4. Show one principal graph or table with quantities, units, baseline, modified case, and one pattern to notice.
5. Show the required validation check from the approved plan and one genuinely different chosen check.
6. Explain the physical result, state one limitation, and complete the fresh-session handoff.

Independent extensions and deeper method comparisons are optional stretch. A clear Core evidence chain is the target.

## Running the starter

Open Week13_Capstone_Starter_and_Validation.m in MATLAB R2025a or later and run it from the top in a fresh session. The default runnable example is `projectile_range`. The current assigned-brief catalogue is the twelve-brief Capstone Briefing deck and `Assessments/Student-facing/Capstone_Investigation_Brief.md`; the five names below are only executable base-method examples in this scaffold. Use the lecturer-approved starter for the assigned brief:

- projectile_range
- rc_charging
- radioactive_decay
- cooling
- decaying_force_impulse

The supplied baseline code should run before group records are completed. Replace the marked records with your group evidence, preserve the approved model and units, rerun the complete file, and record the release, settings, output, and checks. For an assigned brief whose realism dimensions differ from these base examples, use the lecturer-approved starter and retain the same evidence order.

## Defence and AI use

Every member prepares one code trace, its physical meaning, and a response to one parameter-change or validation follow-up. The lecturer's rotation ledger gives every member a first completed defence before any member receives a second entry; an absence remains pending until a make-up defence is recorded.

AI may be used for the capstone when declared. Record what was requested, what was accepted, modified, or rejected, why, and which independent checks were performed. Do not submit a full chat history. Google Classroom remains the official submission and feedback record; this local package does not create or modify Classroom/Forms items.

## Pre-Practical Diagnostic Decision

Week 13 has no separate pre-practical diagnostic because this is the capstone presentation, defence, and reproducibility-handoff package rather than an active weekly practical. No Week 13 diagnostic has been created or attached. The local decision record is `../.agent/google-forms/Week13_Pre_Practical_Diagnostic_Decision.md`.

## Handoff condition

Before the group evidence is locked, another student should be able to start from a fresh MATLAB session and regenerate the principal output and both checks. Keep the edited starter, required inputs, parameters with units, numerical settings, run order, conclusion, limitation, AI decision record, and individual defence evidence together. Week 14 continues the presentation, defence, and reproducibility-handoff sequence.
