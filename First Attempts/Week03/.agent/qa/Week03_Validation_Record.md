# PHY4605 Week 03 Validation Record

Validated on 28 August 2026.

## Student-facing package

- `Lecture_Slides_Week03.pptx`
- `Week03_Linear_Systems_Through_Kirchhoff_Circuits.pdf`
- `Week03_Lecture_Demonstration_Linear_Systems_Through_Nodal_Analysis.m`
- `Week03_Practical_Solve_and_Validate_a_Two_Loop_Circuit.m`
- `README.md`

## Cross-artifact model and notation

- Lecture spine: two-node DC resistive network with `Vs = 12.0 V`, `R1 = 4.0 ohm`, `R2 = 6.0 ohm`, `R3 = 5.0 ohm`, and `R4 = 10.0 ohm`.
- Lecture reference values: `VA = 6.2068966 V`, `VB = 4.1379310 V`, source-to-A current `1.4482759 A`, A-to-ground current `1.0344828 A`, and A-to-B/B-to-ground current `0.4137931 A`.
- Practical spine: two clockwise mesh currents with `V1 = 12.0 V`, `V2 = 5.0 V`, `R1 = 4.0 ohm`, `R2 = 6.0 ohm`, and shared `R3 = 3.0 ohm`.
- Practical reference values: `I1 = 2.2777778 A`, `I2 = 1.3148148 A`, shared current `I1 - I2 = 0.9629630 A`, and source/resistor power `33.907407 W`.
- Units, sign conventions, matrix roles, approved values, residual language, Kirchhoff checks, power balance, and capstone-candidate instructions were checked across the slides, note, Live Scripts, README, and independent validator.

## Lecture slide deck

- Structural validator passed ZIP integrity and found 18 slides, 18 speaker-note pages, and 18 media files.
- Every slide contains exactly one full-slide PNG and zero native visible objects.
- All source raster hashes match the images embedded in the PPTX.
- The presentation overflow test passed.
- The final rendered 18-slide contact sheet was visually inspected for title consistency, legibility, clipping, white background, absence of borders/background motifs, and scientific reading order.
- Two initial ImageGen typography defects were corrected by regenerating slides 7 and 9 as complete raster images.
- Each slide is a single ImageGen-generated raster image embedded full-slide.

## Learning note

- Compiled successfully with bundled Tectonic from the retained LaTeX source.
- Final PDF contains four A4 pages.
- All four rendered pages and the page contact sheet were visually inspected; no clipping, overlap, or unreadable content was found.
- PDF text extraction confirmed the approved nodal and mesh-current values, `Three takeaways`, and the practical-preparation callout.

## MATLAB Live Scripts and model validation

- Both student-facing Live Scripts executed successfully from separate fresh MATLAB processes.
- Fresh-process markers passed: `WEEK03_LECTURE_FRESH_SESSION_OK` and `WEEK03_PRACTICAL_FRESH_SESSION_OK`.
- Independent numerical and power-balance validation passed with marker `WEEK03_MODEL_VALIDATION_OK`.
- Code Analyzer completed on both Live Scripts and the independent validator. Student-facing messages were only intentional `NOPTS` prompts for visible Live Editor outputs; the independent validator produced zero messages.
- Source inspection found exactly one blank line in each Live Script, immediately before the required appendix, and no `clear`, `clearvars`, `close all`, `clc`, `figure`, `fprintf`, `mfilename`, or empty rich-text directive.
- The MATLAB R2026b prerelease launcher emitted existing wrapper path warnings before execution, but each process exited with status 0 and produced its required success marker.
- The lecture demonstration contains no student `TODO` fields. The practical contains the intended group records, prediction, derivation, interpretation, controlled investigation, capstone candidates, and AI-use declaration.

## Google Form

- The canonical course form was not modified. Project instructions require Week 03 questions to be added only after the corresponding weekly materials are approved.
- The README and practical direct students to complete the Week 03 section when the lecturer confirms it is available.

## Final SHA-256

- `Lecture_Slides_Week03.pptx`: `212f60bb6baba1b251178d4660b76874afd69728f4f8c777454abe91250430c5`
- `Week03_Linear_Systems_Through_Kirchhoff_Circuits.pdf`: `09d91d0f040530574919858f043f58b3411960cb5c2f3825d75cb749cfb461e4`
- `Week03_Lecture_Demonstration_Linear_Systems_Through_Nodal_Analysis.m`: `52a3ffdbb9fd1a37eee0086993a66a7ca1f3a894ece6d9b5651ce2181f4e6b7f`
- `Week03_Practical_Solve_and_Validate_a_Two_Loop_Circuit.m`: `0a820cb237a4aab9cfb61f56b9ee022fd353ebc09a32fd41fd3d1c68b1153080`
