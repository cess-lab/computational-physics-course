# PHY4605 Computational Methods in Physics

PHY4605 develops the ability to turn a physics problem into a defensible computational experiment. The course emphasises physical modelling, method selection, algorithmic reasoning, validation, uncertainty, and interpretation. MATLAB and AI tools support implementation; they do not replace physical judgement.

## Course reasoning chain

`physical model -> scale and units -> discretisation -> algorithm -> code -> error/uncertainty -> validation -> physical interpretation`

MATLAB Onramp is a required self-learning prerequisite, but the teaching sequence assumes little dependable retention. Weeks 01–02 diagnose and repair the required MATLAB literacy through familiar physics before the course moves into numerical methods.

The course is planned as **13 instructional weeks followed by Week 14 for the continuation of capstone presentations, individual defences, and reproducibility handoffs**. Week 14 introduces no new compulsory topic.

## Digital learning architecture

- **Google Classroom** is the official course hub and system of record for practical submissions, capstone milestones, individual lab-test submissions, and ungraded revision/reflection activities.
- **Gemini Notebook / NotebookLM** is the source-grounded Socratic AI tutor for approved course material and revision activities.
- **MATLAB** is the computational implementation and reproducibility environment.
- **Test 1, Test 2, and the final examination** remain AI-free under the assessment blueprint.

The standard AI-assisted revision pattern is `initial attempt -> Socratic guidance -> revised reasoning -> independent validation -> reflection -> Classroom submission`.

## Semester 1 2026/2027 assessment timing

The official UPM Bachelor calendar places Assessment I in academic Weeks 4–6 and Assessment II in academic Weeks 8–12. For this course, Test 1 covers Weeks 01–05 and targets academic Week 6 (16–22 November 2026), after Week 05 / alongside Week 06; Test 2 covers Weeks 06–11 and targets academic Week 12 (28 December 2026–03 January 2027), after Week 11 / alongside Week 12. The exact PHY4605 test dates are still to be confirmed by the lecturer.

| Assessment | UPM window | PHY4605 placement |
| --- | --- | --- |
| Test 1 | Broad UPM Assessment I window: academic Weeks 4–6; active blocks 26 October–08 November and 16–22 November 2026 | Target Week 6: 16–22 November, after Week 05 / alongside Week 06 |
| Test 2 | Broad UPM Assessment II window: academic Weeks 8–12; 30 November 2026–03 January 2027 | Target Week 12: 28 December–03 January, after Week 11 / alongside Week 12 |
| Final examination | Academic Weeks 16–17; 21 January–07 February 2027 | Cumulative final examination |

Assessment I contains the 09–15 November 2026 mid-semester break; no test should be scheduled in that break. See the [UPM calendar mapping](Assessments/UPM_Academic_Calendar_2026_2027_Semester_1.md) for the official UPM links and date table.

For a visual overview of the material roles, 14-week topic roadmap, capstone milestones, and assessment windows, use the [PHY4605 course-guide infographic PDF](Assessments/Student-facing/PHY4605_Course_Guide_Infographic.pdf) or its [page 1 PNG](Assessments/Student-facing/PHY4605_Course_Guide_Infographic_Page_01.png) and [page 2 PNG](Assessments/Student-facing/PHY4605_Course_Guide_Infographic_Page_02.png).

## Standard weekly workflow

**Before:** Read the learning note, complete the dedicated diagnostic in Google Classroom when it is released, and make a physical prediction.

**During:** Follow `model -> units -> algorithm -> code -> validation -> interpretation`; trace or complete the supplied MATLAB work and finish the exit ticket.

**Practical:** Work in a group of two or three through ten progressive challenges, recording the model, units, algorithm, code/output, validation, interpretation, and material AI decisions. Rerun the final work from a fresh MATLAB session.

**After:** Submit the locked evidence through Google Classroom. The question slot and eligible student are drawn after submission for the individual defence. Feedback and any optional short remediation/retry are issued through Classroom.

## Current materials

- [Week 13 — Computational Investigation: Present, defend, and hand off a validated physical model](Week13/README.md): learning note, capstone brief, starter/validation Live Script, handoff checklist, and the Week 13–14 capstone presentation/handoff package; no separate pre-practical diagnostic is planned.
- [Week 12 — Method Selection: Audit a computation and prepare a reproducible capstone](Week12/README.md): learning note, validated lecture demonstration, lecture deck, and formative capstone studio.
- [Week 11 — Sensitivity Analysis: Propagate input ranges into defensible output ranges](Week11/README.md): learning note, lecture demonstration, AI-enabled group practical, and lecture deck.
- [Week 10 — Monte Carlo Sampling: Use repeated random trials to estimate physical variation](Week10/README.md): learning note, lecture demonstration, AI-enabled group practical, and lecture deck.
- [Week 09 — Data Fitting: Infer a physical parameter and read residuals with uncertainty](Week09/README.md): learning note, lecture demonstration, AI-enabled group practical, and lecture deck.
- [Week 08 — Ordinary Differential Equations: Simulate a changing state from an initial condition](Week08/README.md): lecture deck, learning note, lecture demonstration, and AI-enabled group practical.
- [Week 07 — Numerical Integration: Accumulate a changing quantity and test convergence](Week07/README.md): learning note, lecture demonstration, AI-enabled group practical, and lecture deck.
- [Week 06 — Numerical Differentiation: Estimate a physical rate and test the step size](Week06/README.md): learning note, lecture demonstration, AI-enabled group practical, and lecture deck.
- [Week 05 — Root Finding: Locate a physical solution and verify the residual](Week05/README.md): learning note, lecture demonstration, AI-enabled group practical, and lecture deck.
- [Week 04 — Parameter Sweeps: Compare one controlled change and interpret the graph](Week04/README.md): learning note, lecture demonstration, AI-enabled group practical, and formative capstone checkpoint.
- [Week 03 — Linear Systems: Assemble and validate two-loop Kirchhoff equations](Week03/README.md): learning note, lecture demonstration, AI-enabled group practical, and lecture deck.
- [Week 02 — Numerical Algorithms: Turn physical reasoning into pseudocode, loops, and fixes](Week02/README.md): learning note, lecture demonstration, AI-enabled group practical, and lecture deck.
- [Week 01 — Arrays and Plots: Represent a physical model and compare prediction with evidence](Week01/README.md): formative onboarding package with a lecture deck, learning note, lecture demonstration, and AI-enabled group practical.
- [Course topic and difficulty blueprint](PHY4605_Course_Topic_Blueprint.md)
- [Course-material production blueprint](AGENTS.md)
- [Assessment blueprint](PHY4605_Assessment_Blueprint.md)
- [Lecture slide design specification](PHY4605_Lecture_Slide_Design_Spec.md)
- [MATLAB Live Script design specification](PHY4605_MATLAB_Live_Script_Design_Spec.md)
- [Learning note design specification](PHY4605_Learning_Note_Design_Spec.md)

Student-facing instructional materials are stored in `Week01/` through `Week13/`. Week 14 is the scheduled continuation of the capstone presentation, defence, and reproducibility handoff and must not contain a new planned core package. Hidden `.agent/` folders contain reproducibility sources, build material, and QA evidence.

The ten counted practical packets are Weeks 02–11. Week 01 is formative onboarding and is not counted in the ten-packet portfolio total. Week 12 is a formative capstone studio; Weeks 13–14 are the capstone presentation, defence, and handoff sequence.

The topic blueprint governs all future revisions. Earlier Week 01–05 materials remain archived under `First Attempts/` as historical references only. Week 03 must move residual/rank/conditioning/power-balance work out of the Core route; Week 04's eigenproblem package is superseded by parameter sweeps and graph interpretation; and Week 05 must remove the extreme small-derivative case while moving advanced solver comparisons into optional material.

Owned and managed by Dr. Muhammad Khairul Adib Muhammad Yusof, Department of Physics, Faculty of Science, Universiti Putra Malaysia.
