# PHY4605 Week 02 Validation Record

Validated on 28 August 2026.

## Student-facing package

- `Lecture_Slides_Week02.pptx`
- `Week02_Reliable_Computational_Workflow.pdf`
- `Week02_Lecture_Demonstration_Reliable_Computational_Workflow.m`
- `Week02_Practical_Debug_and_Validate_Projectile_Model.m`
- `README.md`

## Cross-artifact model and notation

- Lecture spine: ideal mass-spring oscillator with `m = 0.50 kg`, `k = 8.0 N/m`, `A = 0.12 m`, `omega = 4.0 rad/s`, `T = pi/2 s`, and `E = 0.0576 J`.
- Practical transfer: projectile motion with `v0 = 18 m/s`, `theta = 40 deg`, `y0 = 1.5 m`, `g = 9.81 m/s^2`, and `dt = 0.02 s`.
- Projectile reference values: `vx0 = 13.7888 m/s`, `vy0 = 11.5702 m/s`, flight time `2.4820618 s`, range `34.224654 m`, peak time `1.1794268 s`, and peak height `8.3230884 m`.
- Units, variable names, expected physical trends, and validation language were checked across the slides, note, Live Scripts, Google Form questions, and instructor material.

## Lecture slide deck

- Structural validator passed ZIP integrity and found 18 slides, 18 notes, and 18 media files.
- Every slide contains exactly one full-slide PNG and zero native visible objects.
- All source raster hashes match the images embedded in the PPTX.
- Approved physical values and terminology passed the automated check.
- Rendered PDF contains 18 pages at 960 x 540 points.
- The complete contact sheet was visually inspected for consistency, legibility, clipping, white background, absence of borders/background motifs, and scientific accuracy.

## Learning note

- Compiled successfully from the retained LaTeX source.
- Final PDF contains four A4 pages.
- All four rendered pages and the contact sheet were visually inspected; no clipping, overlap, or unreadable content was found.

## MATLAB Live Scripts and model validation

- MATLAB Code Analyzer found no errors or warnings in either student-facing Live Script or the independent model validator. The remaining analyzer messages are informational prompts to suppress outputs that are intentionally visible.
- Both Live Scripts executed successfully in the active MATLAB session.
- Fresh-process execution markers passed: `WEEK02_LECTURE_FRESH_SESSION_OK` and `WEEK02_PRACTICAL_FRESH_SESSION_OK`.
- Independent numerical and limiting-case validation passed with marker `WEEK02_MODEL_VALIDATION_OK`.
- The MATLAB R2026b prerelease launcher emitted wrapper path warnings before execution, but each process exited with status 0 and produced its required success marker.
- Cached Live Editor output metadata was removed after execution so the final `.m` files remain small, readable, and version-control friendly. This metadata-only cleanup did not alter executable source statements.
- Lecture demonstration contains no student `TODO` fields. The practical contains the intended group records, modification tasks, interpretation prompts, and AI-use declaration.

## Google Form

- Reused the single canonical `PHY4605 Individual Practical Check`; no additional form was created.
- Added six required Week 02 questions between the Week 02 and Week 03 section breaks: physical prediction, units/element-wise operations, array reasoning, defect diagnosis, validation reasoning, and confidence.
- Read-back found 29 form items in total. Week 02 occupies items 11-17 and Week 03 begins at item 18.
- The shared name, matric-number, and week-selector fields, Week 01 content, all Week 01-14 section IDs, and dropdown routing were preserved.
- Canonical form/item IDs and the Week 02 AI-analysis key are retained under the course-level hidden `.agent/google-forms/` directory.

## Final SHA-256

- `Lecture_Slides_Week02.pptx`: `9d7a3a000487c6e37493d0399ae7ac4acbf3caa09612d73d77076ee3fcfcaf4e`
- `Week02_Reliable_Computational_Workflow.pdf`: `1303e8ed420f9049f4963770c54813fa4178a6fe0cc61919e69abda248db3748`
- `Week02_Lecture_Demonstration_Reliable_Computational_Workflow.m`: `f4f24680c13b8ce6168a219bb51345abcdcabf72ec8ad0b68fa874412266c3f5`
- `Week02_Practical_Debug_and_Validate_Projectile_Model.m`: `8bdb6001fc260b3293db6821dd8754ee70fd0d2a04e67a428fced8933baf0a69`
