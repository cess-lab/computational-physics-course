# PHY4605 Assessment Instrument Package

This local package supplies the missing assessment instruments for PHY4605. It is aligned with `PHY4605_Assessment_Blueprint.md`, `PHY4605_Course_Topic_Blueprint.md`, and the completed Week 01–13 material sequence.

## Scope and current status

All files in this package are local working documents. No assessment was published to Google Classroom, Google Forms, Gemini Notebook, or NotebookLM.

| Assessment | Blueprint weight | Condition | Evidence emphasis | Package status |
| --- | ---: | --- | --- | --- |
| Test 1 | 10% | 90-minute, open-book, AI-free | Weeks 01–05: model/units, arrays, pseudocode, loops, clear defects, root/bracket reasoning, validation, interpretation | Ready locally: question paper and marking scheme |
| Test 2 | 10% | 90-minute, open-book, AI-free | Weeks 06–11: numerical evidence, Euler adaptation, defects, fitting, residuals, uncertainty, limitations | Ready locally: question paper and marking scheme |
| Final examination | 40% | 120-minute, open-book, AI-free | Cumulative scaffolded model, algorithm, code reading, numerical-method reasoning, validation, interpretation | Ready locally: question paper and answer key |
| Practical portfolio | 15% | Ten AI-enabled group packets from Weeks 02–11; Week 01 is formative onboarding; best eight counted for the group component | Repeated model/units, algorithm, code evidence, validation, interpretation, AI decision record | Existing weekly challenge sets remain the source; no duplicate portfolio instrument created here |
| Individual lab test | 10% | Individual, AI-assisted verification challenge with individual defence | Audit a flawed scaffold, repair defects, modify one parameter, validate, interpret, defend | Ready locally: brief and answer key/rubric |
| Capstone investigation | 15% | Bounded AI-assisted group investigation with starter Live Script and individual defence | One justified modification, principal output, required plus chosen validation, reproducibility, interpretation, defence | Ready locally: brief and rubric/defence protocol |

The practical portfolio row is included for completeness because it is part of the course assessment map. Its weekly challenge files already live under the Week folders and are not copied or edited by this package.

## Semester 1 2026/2027 assessment windows

The official UPM Bachelor calendar places **Assessment I in academic Weeks 4–6** and **Assessment II in academic Weeks 8–12**. Assessment I is interrupted by the 09–15 November 2026 mid-semester break, so its active date blocks are 26 October–08 November and 16–22 November 2026. Assessment II runs from 30 November 2026 to 03 January 2027. PHY4605 targets **academic Week 6 (16–22 November)** for Test 1 after Week 05 and **academic Week 12 (28 December–03 January)** for Test 2 after Week 11; exact local dates remain lecturer-confirmed.

See the [UPM academic-calendar mapping](UPM_Academic_Calendar_2026_2027_Semester_1.md) for the week-by-week dates and official UPM links.

## File map

### Student-facing instruments

- [Test 1 question paper](Student-facing/Test_1_Question_Paper.md)
- [Test 2 question paper](Student-facing/Test_2_Question_Paper.md)
- [Final examination question paper](Student-facing/Final_Examination_Question_Paper.md)
- [Individual lab test brief](Student-facing/Individual_Lab_Test_Brief.md)
- [Capstone investigation brief](Student-facing/Capstone_Investigation_Brief.md)
- [Student course-guide infographic PDF](Student-facing/PHY4605_Course_Guide_Infographic.pdf)
- [Student course-guide infographic page 1](Student-facing/PHY4605_Course_Guide_Infographic_Page_01.png)
- [Student course-guide infographic page 2](Student-facing/PHY4605_Course_Guide_Infographic_Page_02.png)

### Instructor-only instruments

- [Test 1 marking scheme](Instructor/Test_1_Marking_Scheme.md)
- [Test 2 marking scheme](Instructor/Test_2_Marking_Scheme.md)
- [Final examination answer key](Instructor/Final_Examination_Answer_Key.md)
- [Individual lab test answer key and rubric](Instructor/Individual_Lab_Test_Answer_Key_and_Rubric.md)
- [Capstone rubric](Instructor/Capstone_Rubric.md)
- [Defence and rotation protocol](Instructor/Defence_and_Rotation_Protocol.md)
- [QA review record](Instructor/QA_Review_Record.md)

Instructor files contain answer information and must not be added to a student-facing NotebookLM source set. This package creates or changes no NotebookLM source configuration and places no confidential exam question in one.

## Shared assessment rules

- Written tests and the final examination are individual and AI-free. Open-book access supports reference use; it does not permit generative-AI assistance, collaboration, or answer sharing.
- The individual lab test and capstone allow generative AI only when its material decisions are declared. Students submit a concise record of the request, what was accepted/modified/rejected, and the independent check used. Complete chat histories are not required.
- MATLAB code is supplied, scaffolded, or partly flawed wherever code is assessed. Function-name recall and blank-page programming are not ordinary pass requirements.
- A valid validation check is required for full integrated-task credit. Code that runs is not automatically correct; students must connect output to units, a known case, a reference result, a residual, refinement, a bound, conservation, or another appropriate check.
- Numerical results must be reproducible, or a precise diagnosis must explain why execution failed. Physical interpretation and limitations remain assessable even when implementation is incomplete.
- Individual defences use the rotation and make-up rules in [the shared protocol](Instructor/Defence_and_Rotation_Protocol.md).

## Residual assumptions

The blueprints and UPM calendar specify assessment purposes and university windows but do not fix the exact PHY4605 calendar date, invigilation platform, calculator policy, individual-lab software image, capstone presentation length, or the local process for issuing variant cards. Those operational details remain lecturer decisions. The instruments therefore use neutral wording such as “the lecturer supplies” or “the posted assessment instructions” where a local policy is still needed.

The numerical values in the papers are intentionally familiar or closely analogous and are supplied with units and formulas. Minor rounding tolerances should be set by the lecturer after confirming the cohort’s calculator and MATLAB display conventions.

## Local QA completed

The package was checked for:

1. required file presence and student/instructor separation;
2. raw-mark totals and blueprint weight labels;
3. explicit AI-free versus AI-assisted conditions;
4. explicit validation and physical-interpretation evidence;
5. capstone milestone totals of 2% + 3% + 3% + 5% + 2% = 15%;
6. consistent variable names, units, sign conventions, and method vocabulary against the source blueprints and Week 01–13 materials;
7. no references to a new or edited NotebookLM source configuration; and
8. no changed paths outside `Assessments/`.

Detailed outcomes are recorded in [QA review record](Instructor/QA_Review_Record.md).
