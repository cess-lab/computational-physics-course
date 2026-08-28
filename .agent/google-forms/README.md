# PHY4605 Individual Practical Check — Agent Configuration

This directory defines the single canonical Google Form used for all individual checks in PHY4605. Do not create a new form for a later week.

## Update workflow

1. Read `PHY4605_Individual_Practical_Check.json` for the canonical form ID and section IDs.
2. Call `get_form` with the connected account and verify the current item order before changing anything.
3. After that week's lecture and practical materials are approved, insert the new diagnostic questions immediately after the matching `Week XX Individual Check` page break and before the next week's page break.
4. Keep the shared name, matric number, and week selector on the first page. Do not duplicate them inside a weekly section.
5. Preserve the existing dropdown destinations and page-break IDs.
6. Record every new item ID and question ID in the JSON configuration.
7. Call `get_form` again and verify the title, question types, required flags, order, and Week 01–14 routing.

## Weekly diagnostic pattern

Use approximately six required questions that can be completed independently before group work:

- one physical prediction;
- one units or scaling question;
- one algorithm, array, pseudocode, or code-tracing question;
- one method or numerical-behaviour question;
- one short validation-reasoning response; and
- one confidence item using the same 1–5 labels every week.

Prefer four automatically countable conceptual items and one short response. The form is diagnostic rather than individually graded. Do not ask students to submit group practical files through this form.

## Privacy and analysis

Use matric number to link repeated responses locally, but remove names and matric numbers before sending response text to a general-purpose AI system unless an approved institutional workflow explicitly requires identification. Report cohort patterns, confidence calibration, and recurring misconceptions rather than ranking students.

See each `WeekXX_Question_Key_and_AI_Analysis.md` file for that week's answer key, misconception tags, and analysis prompt.
