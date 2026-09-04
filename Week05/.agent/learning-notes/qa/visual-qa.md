# Week 05 Learning Note Visual QA

- Final student PDF: `Week05/Week05_Learning_Note_Root_Finding.pdf`
- Source: `Week05/.agent/learning-notes/Week05_Root_Finding.tex`
- Build engine: Tectonic
- Final page count: 4 A4 pages
- Render evidence: `Week05/.agent/learning-notes/qa/rendered/`
- Contact sheet: `Week05/.agent/learning-notes/qa/contact-sheet.png`

## Inspection result

All four pages were rendered and inspected. Pages 1--4 use the expected A4 single-column academic layout, 18 mm margins, Computer Modern typography, restrained navy/green/orange callouts, `booktabs` tables, and line-numbered MATLAB listings. The residual graph is readable with labelled axes, units, zero line, and bracket markers. No text, table, equation, code listing, callout, plot, or caption is clipped or overlapping. Section 7 was kept together at the top of page 4 rather than leaving its validation result orphaned across a page break.

The final TeX log contains no `Overfull` or `Underfull` box diagnostics. It contains one non-content `shellesc` package warning because shell escape is disabled; the PDF compiles successfully and the warning does not affect rendered content.
