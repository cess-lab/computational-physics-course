# PHY4605 Capstone Investigation: A Bounded Computational Study

**Weight:** 15% of the course  
**Mode:** AI-assisted group investigation with an individual defence  
**Group:** Two or three students

## Purpose and boundary

The capstone is a bounded supported investigation, not an open-ended research project. The lecturer provides or approves a starter plain-text MATLAB Live Script for one problem space. Your group adapts the starter, preserves the supplied model, and carries enough evidence for another person to reproduce the result and for each member to explain it.

Blank-page programming, unfamiliar theory, and advanced method comparison are not required for ordinary completion. An independent extension may earn distinction credit only after the Core evidence is complete.

## Assigned physical investigations

The current capstone deck is the source of truth for the assigned brief catalogue. Each group receives **one assigned brief** from the twelve below. The possible realism dimensions and likely information are prompts for scope decisions, not a compulsory feature checklist. The lecturer approves the final brief, starter, model, method, and validation plan before substantial development.

| Briefs | Assigned investigations | Broad context and objective | Possible realism dimensions | Likely information categories |
| --- | --- | --- | --- | --- |
| 01–02 | **Projectile motion:** crosswind delivery with quadratic drag; elevated-terrain launch under wind shear | Investigate how non-ideal air or terrain conditions affect a projectile outcome. | Wind, drag, terrain, release variability, aerodynamic properties, wind-shear profile | Geometry, launch conditions, environmental description, drag/aerodynamic information, terrain or wind profile if supplied |
| 03–04 | **Circuit behaviour:** RC charging with leakage and temperature-dependent components; RC sensor circuit with internal source resistance and time-varying load | Investigate how non-ideal components or loading change circuit behaviour. | Leakage, temperature dependence, internal resistance, changing load, sensor limits | Circuit parameters, component ranges, load description, temperature information, calibration or reference behaviour |
| 05–06 | **Radiation and detection:** radioactive decay with background radiation and detector dead time; two-isotope decay mixture with efficiency and counting noise | Investigate how detector effects or mixed sources alter an observed decay signal. | Background, dead time, efficiency, counting noise, source mixture, observation window | Decay parameters, background/detector information, efficiency, count statistics, timing and reference observations |
| 07–08 | **Thermal behaviour:** cooling with thermal radiation and changing ambient temperature; cooling of a heated object with internal heat generation | Investigate how surroundings or internal generation change a cooling trajectory. | Radiation, changing ambient conditions, internal heat generation, surface or material properties | Initial and ambient conditions, thermal properties, geometry, environmental record, heating description |
| 09–10 | **Monte Carlo physics:** bounded 2D Ising ferromagnet; field of an irregular charged body | Use physically meaningful random sampling to study finite interacting spins or estimate a field at observation points. | Temperature, lattice size, boundary condition, coupling, geometry, charge-density variation, sample count and location | Lattice or body geometry, interaction/charge description, observation points, scale, sample settings and any reference case |
| 11–12 | **Oscillatory motion:** damped mass–spring response; finite-angle pendulum motion | Investigate how damping or finite-angle behaviour changes an oscillatory response. | Damping, energy loss, finite-angle effects, pivot effects, initial state, energy behaviour | Mass, spring or pendulum parameters, initial conditions, geometry, damping or pivot information, reference behaviour |

The deck's examples do not prescribe one equation, numerical method, code structure, graph, parameter change, or validation pair. The assigned brief and approved starter define the starting boundary; the group must justify what it includes and omits.

## Required final evidence

Your final packet must contain:

1. the physical question and the model;
2. assumptions, variables, parameters, and units;
3. short pseudocode or an algorithm map from inputs to output;
4. one justified modification of a physical parameter or assumption;
5. one principal labelled graph or table;
6. the required validation check agreed at Week 07;
7. one different chosen validation check;
8. a physical interpretation of the principal result;
9. one limitation of the model, data, or numerical setting;
10. a fresh-session reproducibility record; and
11. a concise AI-use decision record.

Code is evidence only when the group can connect it to the model and output. A polished graph without validation, units, or interpretation is incomplete.

## How the 15% is awarded

The capstone is **15% of the course**. The work is judged with one rubric whose criteria total **100% within the capstone**. The rubric score is then scaled to the 15% course contribution. These percentages are not additional course marks.

| Criterion | Weight within capstone |
| --- | ---: |
| Model, assumptions, scope, variables and units | 15% |
| Algorithm and MATLAB implementation evidence | 25% |
| Principal output and reproducibility | 15% |
| Validation evidence | 15% |
| Physical interpretation and limitations | 15% |
| Presentation and communication | 10% |
| Individual defence and AI-use decision record | 5% |
| **Total** | **100%** |

Each criterion is rated at one of four levels. Use the rating as a four-point scale: **Excellent = 4**, **Good = 3**, **Satisfactory = 2**, and **Weak = 1**. For each row, the awarded score is `criterion weight × rating / 4`. Judge the evidence that is actually submitted and defended; do not award full integrated-task credit for a polished output without a valid validation check.

### Performance descriptors

| Criterion | Excellent | Good | Satisfactory | Weak |
| --- | --- | --- | --- | --- |
| **Model, assumptions, scope, variables and units** (15%) | The physical model is correct, complete and appropriate to the assigned question. Assumptions and the boundary are justified; variables, parameters and units are explicit and consistent; the expected physical behaviour is clear. | The model and scope are appropriate and mostly correct. Most assumptions, variables and units are stated; minor omissions or inconsistencies do not change the main conclusion. | A basic model is identified, but the scope or assumptions are only partly explained. Some variables or units are unclear or inconsistent, yet the intended computation can still be followed with support. | The model is missing or materially wrong; assumptions, scope, variables or units are absent or inconsistent; the computation is not physically defensible. |
| **Algorithm and MATLAB implementation evidence** (25%) | The input-to-output algorithm is clear and logically ordered. The MATLAB implementation faithfully follows it, the one modification is justified physically, and the relevant code can be traced from inputs to output without hidden state. | The algorithm and implementation are substantially correct. The modification is linked to the model and the main code path can be traced; minor coding or explanation issues are repairable. | Some algorithm or code evidence is present, but dependencies, modification logic or array/loop handling are incomplete. The work needs prompting or a small repair to run or be understood. | There is no coherent algorithm-to-code link, the modification is not identifiable or is physically wrong, or the code cannot be traced or run meaningfully. |
| **Principal output and reproducibility** (15%) | The labelled graph or table directly answers the question, includes meaningful units/settings, and is reproduced from a fresh MATLAB session. Another person can rerun the supplied package and obtain the same main claim. | The output is relevant and readable with most labels and settings. A fresh run supports the same conclusion, although a minor reproducibility detail is missing. | An output exists but labels, settings or run instructions are incomplete. Reproduction depends partly on unstated workspace or manual steps. | The principal output is missing, irrelevant, misleading or unlabelled; the result cannot be reproduced from a clean run. |
| **Validation evidence** (15%) | The required check and a different chosen check are both appropriate, independently executed, and supported by clear numerical or physical evidence. The group states exactly what each check establishes. | Both checks are broadly appropriate and supported by evidence, but one explanation or comparison is limited. | At least one valid check is shown, but the second is missing, weak, duplicated or poorly connected to the claim. | No valid check is demonstrated, or the checks are inappropriate, circular or contradicted by the result. |
| **Physical interpretation and limitations** (15%) | The result is explained accurately in physical language, linked to the model and evidence, and bounded by a meaningful limitation with its likely consequence. The conclusion does not overclaim. | The main physical trend or result is correct and a relevant limitation is stated. The explanation may be somewhat general but remains defensible. | The response mainly restates the graph or number. Physical reasoning is limited, or the limitation is vague and its consequence is not explained. | The interpretation is absent or physically incorrect, no meaningful limitation is stated, or the conclusion overclaims what the evidence supports. |
| **Presentation and communication** (10%) | The presentation is coherent, concise and readable. It tells one evidence story from question and model through modification, output, checks, interpretation and limitation; visuals and terminology help the audience evaluate the claim. | The story is clear and covers the main evidence. Minor sequencing, visual or terminology problems do not prevent understanding. | Some required evidence is presented, but the story is cluttered, uneven or dependent on prompting; the audience must work to connect the pieces. | The presentation is incomplete, hard to follow or unreadable, and does not communicate a defensible computational conclusion. |
| **Individual defence and AI-use decision record** (5%) | Every member accurately traces a relevant code section and answers a follow-up using physical, algorithmic or validation reasoning. The AI record clearly identifies material decisions and the independent checks performed. | Members can explain the main code path and answer with only minor prompting. The AI record is substantially complete and the checks are identifiable. | Tracing or answers are partial or uneven, and the AI record omits some decisions or checks, but some individual understanding is demonstrated. | A member cannot trace or defend the work, or the individual and AI-use evidence is not usable for assessment. |

## Process checkpoints (not a second rubric)

| Milestone | Timing | Evidence | Course weight |
| --- | --- | --- | ---: |
| Problem-space selection and feasibility | Week 06 | narrow question, available inputs, one modification, principal output, validation anchor | checkpoint |
| Approved model, method, and validation plan | Week 07 | model/units, supplied or selected method, 5–8 algorithm steps, required plus chosen check | checkpoint |
| Compact development/process evidence | Weeks 08–11 | one or more concise checkpoints showing controlled modification, output, checks, interpretation, and AI decisions | checkpoint |
| Studio completion and defence rehearsal | Week 12 | completed evidence packet, fresh-session rehearsal, member code trace | formative |
| Final bounded investigation | Weeks 13–14 | final packet, principal output, required and chosen checks, interpretation, limitation, reproducibility | rubric evidence |
| Individual defence and handoff | Weeks 13–14 | individual trace and follow-up answer, final clean-run handoff | rubric evidence |

These checkpoints support feedback and completion; they are not a second set of course marks. The final presentation, defence and reproducibility handoff are assessed through the single rubric above. Weeks 13–14 are the scheduled capstone presentation, defence and handoff sequence; Week 14 adds no new capstone milestone.

## AI-use record

AI may assist with formulation within the approved boundary, MATLAB code, debugging, plotting, or wording. The group must record only material decisions:

- tool used, or `No AI used`;
- what assistance was requested;
- what was accepted, modified, or rejected;
- why the decision was made; and
- which independent check was performed before accepting the claim.

Do not submit a complete chat history. Do not treat AI output as validation.

## Roles and individual evidence

Rotate the working roles of model lead, algorithm/code lead, and validation/interpretation lead. Each member must trace a relevant code section and answer a question about the model, algorithm, validation, or interpretation. The submitted packet must make each member’s contribution and understanding visible without turning the project into a long diary.

## Submission checklist

- [ ] Approved problem space and starter identified.
- [ ] Model, assumptions, variables, and units stated.
- [ ] Supplied method explained in plain language.
- [ ] Short pseudocode completed or refined.
- [ ] Exactly one main modification identified; other inputs held fixed for the comparison.
- [ ] Principal output labelled and reproducible.
- [ ] Required validation check completed and interpreted.
- [ ] Different chosen validation check completed and interpreted.
- [ ] Physical conclusion and one limitation stated.
- [ ] Fresh-session run details recorded.
- [ ] AI-use decisions recorded, if relevant.
- [ ] Every member prepared for the individual defence.

The lecturer uses the shared [defence and rotation protocol](../Instructor/Defence_and_Rotation_Protocol.md) for selection, eligibility, absence, and make-up handling.
