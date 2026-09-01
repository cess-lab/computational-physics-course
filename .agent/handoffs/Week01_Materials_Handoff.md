# PHY4605 Week 01 Materials — Handoff Note

## Objective

Create a fresh, student-facing `Week01/` package for **PHY4605 Computational Methods in Physics**. Week 01 is **Physics to Arrays and Plots**. It must repair unreliable MATLAB foundations through one familiar analytical physics model; it is not a generic MATLAB introduction.

Do **not** restore, copy, or publish material from `First Attempts/` or from the deleted legacy `Week01/` files. Build the new package from the current blueprints and approved master only.

## Governing sources (read before authoring)

1. `AGENTS.md` — course-level authority, folder convention, production routes, and quality gates.
2. `PHY4605_Course_Topic_Blueprint.md` — Week 01 scope, difficulty tiers, literacy spiral, package contract, and Topic Blueprint checklist.
3. `PHY4605_Assessment_Blueprint.md` — pass-level evidence and assessment calibration.
4. `PHY4605_Lecture_Slide_Design_Spec.md` — mandatory editable PPTX, visual, equation, MATLAB-figure, and paired-audit contract.
5. `PHY4605_Learning_Note_Design_Spec.md` — learning-note architecture and justified illustration route.
6. `PHY4605_MATLAB_Live_Script_Design_Spec.md` — plain-text Live Script format, teaching flow, reproducibility, and justified illustration route.

## Week 01 instructional contract

Use one familiar analytical model consistently across slides, note, and Live Script. A vertical-motion model is a sensible default because the approved master already demonstrates it, but lock the exact model, assumptions, variables, units, parameter values, and reference result in the content manifest before authoring.

Core outcomes:

- identify the physical question, output, variables, parameters, and units;
- run a section in a MATLAB Live Script and assign meaningful scalar variables;
- create arrays with `:` or `linspace`, read their length, and retrieve one indexed value;
- distinguish `*`, `/`, `^` from `.*`, `./`, `.^`;
- evaluate the familiar analytical model over an array;
- make one readable labelled plot with units and predict its trend before running it;
- compare the prediction and plotted output, including one simple validation check.

Keep logical comparisons, a small selected-value table, and compact vectorisation as Working exposure/Stretch only. Do not introduce more than three genuinely new Core ideas in one lecture. The Core slide route is 12–14 slides; any appendix is optional and deletable.

Required visible reasoning order:

`physical picture/question -> equation in words -> variables and units -> pseudocode -> short MATLAB fragment -> visible output -> one validation -> physical interpretation`

## Required Week 01 artefacts

Create only final student-facing files directly in `Week01/`:

- `README.md`;
- one final editable lecture PPTX;
- one final learning-note PDF;
- one final plain-text MATLAB Live Script `.m` lecture demonstration;
- a practical/diagnostic file only if it is approved for this package.

Put source, manifests, equation TeX/SVG/PNG, MATLAB plot code/data/PNG, ImageGen prompt/provenance, rendered proofs, QA evidence, and build logs under `Week01/.agent/`.

## Slide-deck route — do not bypass

- Use the approved editable master: `.agent/lecture-slide-system/masters/PHY4605_Editable_Slide_Master.pptx`.
- Use Nunito for slide text and IBM Plex Mono for code. Display equations must use the project-local LaTeX asset route; numerical figures must be MATLAB-generated PNGs with LaTeX-interpreted MATLAB text and retained source/data.
- Use the locked `PHY4605 Matte Scientific Cutaway` visual language for any justified generated scientific illustration. Generated images are visual-only; exact labels, units, equations, and code remain editable PowerPoint objects.
- Use **Terra Medium** (`gpt-5.6-terra`, `medium`) as generator and **Sol Medium** (`gpt-5.6-sol`, `medium`) as independent read-only auditor. Allow at most three generator/auditor rounds. Render every slide, inspect every slide at full size, and retain the final hash and round ledger.
- The opening slide must use exactly `PHY4605 Computational Methods in Physics` as the course tag, a Title Case individual deck title, and `Week 1 | <short topic-specific tagline>` as its subtitle.

## Important incomplete items / gates for the next agent

### 1. Resolve the duplicate course-wide competency balance before assessment-facing authoring

The correct user-agreed balance is:

| Model and units | Algorithm/pseudocode | MATLAB/code reading | Numerical-method theory | Validation | Physical interpretation |
| ---: | ---: | ---: | ---: | ---: | ---: |
| 10% | 20% | 30% | 15% | 10% | 15% |

This is already stated in `AGENTS.md`, `PHY4605_Assessment_Blueprint.md`, and the primary cognitive-weight guide in `PHY4605_Course_Topic_Blueprint.md`. A stale duplicate table under the latter document's `Assessment alignment` section instead says 15/20/25/10/15/15. Correct that stale duplicate before creating assessment-aligned artefacts or using it as a material balance guide.

### 2. Complete the approved-master audit contract before treating a Week 01 deck as final

The current master is structurally healthy: SHA-256 `82b8643156fef228917cef19fbe76c7bcdc345ba9751a3605bc9fbeb7b329b12`; Office validation passes, Office issues are zero, and Nunito/IBM Plex Mono are present. Its final Terra source correction, however, was not independently re-audited by Sol because Sol credits were exhausted. The explicit record is `.agent/lecture-slide-system/qa/paired-review-ledger.txt`.

Obtain one real read-only Sol Medium visual audit of the current master before relying on it as formally approved. Do not claim that coordinator inspection substitutes for that audit.

The master is currently open in Microsoft PowerPoint (the `~$PHY4605_Editable_Slide_Master.pptx` lock file is held). Do not force-delete the lock or overwrite the master. Ask the lecturer to close PowerPoint, or wait until the file is released, before editing the master or creating a dependent deck.

### 3. Reconcile the existing Week 01 Google Form/Classroom item at publication time

`.agent/google-forms/PHY4605_Classroom_Practical_Quiz_Forms.json` maps existing Week 01 and Week 02 Forms/Classroom coursework. Do not create a duplicate Week 01 form. After the new Week 01 materials and six diagnostic questions are approved, inspect the existing Week 01 Form and Classroom attachment, update it if required, and verify its live state and mapping. Keep Classroom ungraded for the diagnostic unless the lecturer changes the assessment policy.

### 4. Deferred but not blocking Week 01 creation

- Calendar dates and Classroom due dates are not yet fixed; set them only before publication.
- The four-to-six capstone problem spaces have not yet been authored; they are needed before the Week 03/04 capstone introduction, not for Week 01.
- Decide per artefact whether a generated scientific illustration actually removes a novice-level representation barrier. If it does, embed it directly in the note and/or Live Script with provenance, caption, and accessibility description. Reuse an approved slide visual only if the scientific mapping is identical. MATLAB numerical evidence remains MATLAB-generated, never ImageGen.

## Completion checks

Before handing Week 01 to students, confirm:

1. The same model, notation, units, assumptions, values, graph, and validation evidence agree across the PPTX, PDF, `.m`, README, and diagnostic.
2. The Live Script runs from a fresh MATLAB session with no hidden Workspace state.
3. The learning note compiles and every PDF page is visually inspected.
4. The PPTX uses the canonical editable master; all slides are rendered and visually checked; full-slide and title contact sheets, structural checks, and the paired-audit ledger are retained.
5. No student-facing duplicate or legacy copies are left outside `Week01/`.

