# Assessment Package QA Review Record

**Review date:** 2026-09-07  
**Review scope:** local files under `Assessments/**` plus read-only comparison with the course and assessment blueprints  
**Status:** local text and structure review complete

## Files reviewed

The review covered the package README, all five student-facing instruments, and all six existing instructor assessment instruments:

- `Assessments/Student-facing/Test_1_Question_Paper.md`
- `Assessments/Student-facing/Test_2_Question_Paper.md`
- `Assessments/Student-facing/Final_Examination_Question_Paper.md`
- `Assessments/Student-facing/Individual_Lab_Test_Brief.md`
- `Assessments/Student-facing/Capstone_Investigation_Brief.md`
- `Assessments/Instructor/Test_1_Marking_Scheme.md`
- `Assessments/Instructor/Test_2_Marking_Scheme.md`
- `Assessments/Instructor/Final_Examination_Answer_Key.md`
- `Assessments/Instructor/Individual_Lab_Test_Answer_Key_and_Rubric.md`
- `Assessments/Instructor/Capstone_Rubric.md`
- `Assessments/Instructor/Defence_and_Rotation_Protocol.md`
- `Assessments/README.md`

The source documents used for comparison were `PHY4605_Assessment_Blueprint.md` and `PHY4605_Course_Topic_Blueprint.md`. No source, weekly, or platform file was edited.

## Cross-check results

### Weights and raw marks

| Assessment | Course weight | Local raw-mark check | Result |
| --- | ---: | --- | --- |
| Test 1 | 10% | 8 + 12 + 15 + 5 + 10 = 50 | Pass |
| Test 2 | 10% | 12 + 8 + 7 + 8 + 8 + 7 = 50 | Pass |
| Final examination | 40% | Section A 28 + B 28 + C 24 = 80 | Pass |
| Practical portfolio | 15% | Ten packets; best eight apply to the group component, with the blueprint's 12% group evidence plus 3% cumulative individual-defence ledger | Pass; weekly source files remain outside this package |
| Individual lab test | 10% | 6 + 10 + 10 + 6 + 6 + 2 = 40 Core marks; rubric proportions total 100% | Pass |
| Capstone investigation | 15% | Course-weighted milestones total 2 + 3 + 3 + 5 + 2 = 15%; criterion rubric proportions total 100% within the capstone | Pass |

The six course weights total 100%. The capstone milestone table and the capstone criterion rubric are kept as separate layers: milestones allocate course marks, while the criterion rubric describes evidence quality within the capstone component.

### Conditions and evidence

- Test 1, Test 2, and the final examination are consistently labelled individual, open-book, and AI-free in the student papers, instructor keys, README, and assessment blueprint.
- The individual lab test and capstone are consistently labelled AI-assisted, with material AI decisions and independent checks recorded. The individual lab test is individual; the capstone is a two- or three-student group investigation with individual defence.
- The practical portfolio is described as AI-enabled group work with a concise AI decision record and individual defence rotation. No complete chat history or AI-detection score is required.
- The papers and keys require or reward validation evidence: initial values, units, known/reference results, residuals, refinement, bounds, reproducibility, or an equivalent check as appropriate to the task.
- The papers and keys include physical interpretation and limitation evidence rather than treating runnable or polished MATLAB code as sufficient.
- Capstone evidence consistently includes one justified modification, one principal labelled output, the approved required check, a different chosen check, interpretation, limitation, reproducibility, and AI-use evidence.

### Defence and rotation rules

The student brief, instructor protocol, capstone rubric, and assessment blueprint agree on the following local rules:

- lock the group packet before drawing a question slot and eligible student;
- use a hidden ledger containing the group/member, assessment, slot or variant, date, status, and evidence location;
- do not select a member again until every group member has one completed defence entry;
- treat an absence as pending, not as a zero or completed entry, and complete a later make-up defence;
- form the practical portfolio's 3% individual ledger from completed entries only after the first-completion condition is satisfied; and
- record the capstone individual defence and clean reproducibility handoff in the 2% capstone component.

The individual lab test permits a fresh parameter or clear-defect variant during its individual defence; it does not use the group rotation rule.

## Defect handling

The README's referenced QA record was missing. This file supplies that missing local cross-reference target. No other broken local Markdown link was found in the package after adding it, and no content change was needed to the assessment instruments.

## Remaining caveat

This is a local package review only. It does not verify live Google Classroom, Google Forms, Gemini Notebook, NotebookLM, submission settings, publication state, dates, variant issuance, or other platform/operational decisions. The weekly practical challenge files remain the source for the portfolio and were not duplicated or edited here. Those points must be confirmed separately by the lecturer if required.

