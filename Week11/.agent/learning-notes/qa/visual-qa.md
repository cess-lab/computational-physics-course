# Week 11 learning note visual QA

Date: 2026-09-08

## Build

- Source: Week11/.agent/learning-notes/Week11_Sensitivity_and_Uncertainty_Propagation.tex
- Compiler: bundled Tectonic 0.17.0
- Result: successful (exitCode: 0)
- PDF: 5 pages, A4 (595.28 x 841.89 pt)
- Root student-facing PDF and hidden build PDF have identical SHA-256 hashes.

## Text and structure checks

- The opening hierarchy is present: course name, Week 11 label, manually broken title, purpose, physical question, Learning outcomes, and concise How to use this note.
- Section 2 and its one-at-a-time workflow now begin together on page 2.
- The one-at-a-time definition appears before the workflow and code.
- The required pathway uses plain wording; guided extensions explicitly state that supplied relationships are for reading and interpretation, not independent implementation.
- Element-wise division is explained as dividing by each array value.
- Normalized sensitivity, local interpretation, independent standard uncertainties, and the first-order approximation are defined in plain language.
- Interaction effects and global sensitivity are defined only in the explicitly optional extension.
- Both MATLAB listings have formal captions and visible line numbers.
- pdftotext extraction contains no old Core learning outcomes, Working exposure, Optional stretch, MATLAB scaffold, principal, or equivalent labels.

## Rendered-page inspection

Rendered pages are retained under Week11/.agent/learning-notes/qa/rendered-final3/. Each of the five pages was inspected at reading size. No blank or duplicate page, clipped content, overlap, broken glyph, or footer defect was found. Equations, tables, callout boxes, both MATLAB listings, and both retained MATLAB figures are legible. Page 4 uses the available space without compressing the text; the second figure is placed non-floating before the supplied-formula heading and remains clearly captioned.

No separate ImageGen illustration was added; the retained MATLAB figures and deterministic TikZ workflow directly provide the needed numerical and algorithmic evidence, as recorded in illustration_decision.md.
