# Week 04 Learning Note Visual QA

- Recompiled successfully with bundled Tectonic 0.17.0 on 2026-09-08 after the terminology, controlled-comparison, caption, validation, and pagination revision.
- Final output is 4 pages, A4, using the required 18 mm academic layout and established navy-green-orange callout system; the student-facing PDF matches the standard build PDF byte-for-byte.
- All four pages were rendered to PNG at 150 dpi under `rendered-20260908/` and inspected at full reading size and in the contact sheet.
- Opening hierarchy, Learning outcomes, How to use this note, controlled-sweep flow diagram, equations, line-numbered captioned code panels, tables, page numbers, and closing preparation block are legible.
- The MATLAB-generated Hooke-law overlay plot is embedded directly, has labelled axes with units, a readable legend, and agrees with the values used in this example: `F_N=0:0.5:10` and `k_Npm=[50 100 200]` N/m.
- The first render placed the preparation callout alone on page 5; the shortened guided/optional extension text now lets the validation heading, explanation, code, result, takeaways, and single preparation callout close naturally on page 4.
- The zero-force limiting check remains a single labelled required-validation unit; the incorrect-model table now names the ``Incorrect product $F\,k$'' column explicitly.
- No clipping, overlap, broken glyphs, automatic bad hyphenation, or page-edge overflow was observed.
- No ImageGen asset is required; the deterministic controlled-sweep diagram plus reproducible MATLAB plot are clearer for this learning objective.
