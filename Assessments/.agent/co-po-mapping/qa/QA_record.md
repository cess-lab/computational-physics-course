# PHY4605 CO-PO Mapping QA Record

## Scope

- Format reference: supplied `CAP PHY4605 SEM 1 2025-2026 - MKAMY.pdf`.
- Content source: `PHY4605_Assessment_Blueprint.md` and the current course/topic blueprint.
- Final source: `Assessments/Instructor/PHY4605_CO_PO_Mapping_Sem1_2026_2027.tex`.

## Checks

- Tectonic compilation: pass; two-page A4 landscape PDF with no warnings.
- PDF inspection: pass; both pages rendered to PNG and inspected at 150 dpi after the native-font, font-size, vertical-alignment, merged-header, assessment-type, feedback, and sentence-case revision.
- Typography: pass; removed the sans-serif/Latin Modern overrides and forced native Computer Modern (`cmr`); table bodies and supporting text use consistent `\\footnotesize` sizing.
- Table alignment: pass; fixed-width and `tabularx` table columns use vertically centred cells, and the CO outcome cells use centred parboxes.
- Cell merging: pass; multi-column programme-outcome headers and multi-row activity, assessment type, week, total, remarks, CO, and course-outcome headers use explicit `\multicolumn`/`\multirow` spans. The multi-row labels are anchored on the final header row so coloured header backgrounds do not occlude any line of text.
- Feedback revisions: pass; removed the page-1 note, removed all `AI-free` wording, restored PO1--PO10 on page 1, added the second lecturer, restored the original BM CO sentences and CO--PO checkmark pattern, changed the three CO sentences to sentence case, and normalised the Type of Assessment column to only `Formative` or `Summative`.
- Assessment weights: `15 + 10 + 15 + 10 + 10 + 40 = 100%`.
- PO allocation: the PO1--PO10 grand-total row sums to `60 + 25 + 0 + 0 + 0 + 0 + 0 + 5 + 10 + 0 = 100%`.
- Assessment-to-PO rule: each assessment is assigned to one or two principal POs; Test 1 carries PO1 = 10% as requested.
- Cohort field: Year 3 and Year 4 selected according to the review comment.
- PDF/source identity: final PDF SHA-256 `21b91670fcd90a76ce9d2dbe21182989018533adbab1dff49deb07068033b621`.

## Interpretation note

The supplied PDF was used as the layout and field-format reference, including the full PO1--PO10 assessment table and the original four-column CO--PO mapping view. The latest assessment weights were applied to the original PO allocation pattern: written assessments contribute to PO1, practical verification contributes to PO2, and the capstone contributes to PO8 and PO9. The mapping should be checked against the programme's currently approved PO definitions before formal institutional submission.
