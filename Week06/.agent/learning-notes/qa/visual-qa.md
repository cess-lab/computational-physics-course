# Week 06 Learning Note Visual QA

- Final student PDF: `Week06/Week06_Learning_Note_Numerical_Differentiation.pdf`
- Source: `Week06/.agent/learning-notes/Week06_Numerical_Differentiation.tex`
- Build engine: Tectonic
- Final page count: 5 A4 pages
- Render evidence: `Week06/.agent/learning-notes/qa/rendered-current/page-final4-1.png` through `page-final4-5.png`

## Inspection result

All five pages were rendered at 170 dpi and visually inspected. The note uses the expected A4 single-column academic layout, 18 mm margins, Computer Modern typography, restrained navy/green/orange callouts, `booktabs` table treatment, and line-numbered MATLAB code with descriptive captions.

The MATLAB-generated secant-versus-tangent figure is readable and consistent with the model used in this example. Equations, units, code, the step-size table, callouts, and page numbers are legible. No text, table, equation, code listing, callout, figure, caption, or footer is clipped or overlapping. The verbal prompt now stays with its expression on page 2, the hand calculation begins at the top of page 3, and required validation begins at the top of page 4, so no section is stranded at a page bottom. The closing blocks occupy page 5 without a blank duplicate page; the Guided extension error curve remains available in the lecture Live Script.

The final Tectonic log contains no overfull/underfull box diagnostics or content warnings.
