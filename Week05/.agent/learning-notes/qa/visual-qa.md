# Week 05 Learning Note Visual QA

- Final student PDF: `Week05/Week05_Learning_Note_Root_Finding.pdf`
- Source: `Week05/.agent/learning-notes/Week05_Root_Finding.tex`
- Build engine: Tectonic
- Final page count: 5 A4 pages
- Render evidence: `Week05/.agent/learning-notes/qa/rendered-current/page-final5-1.png` through `page-final5-5.png`
- Contact sheet: current pages were inspected individually at 170 dpi.
- Synchronized PDF SHA-256: `d8d117d69df270255ee311586b5493f639dbb1c5b373c4479134a8ba49fafa9c` for both the root and hidden build PDF; byte comparison passes.

## Inspection result

All five pages were rendered and inspected. Pages 1--5 use the expected A4 single-column academic layout, 18 mm margins, Computer Modern typography, restrained navy/green/orange callouts, `booktabs` tables, and line-numbered MATLAB listings with descriptive captions. The residual graph is readable with labelled axes, units, zero line, and bracket markers. No text, table, equation, code listing, callout, plot, or caption is clipped or overlapping. The complete variable table now sits clearly above the page 1 footer, with its explanatory bracket paragraph following it without a split. The bisection pseudocode starts at the top of page 3, the full Newton listing starts at the top of page 4, and the closing blocks occupy page 5 without a blank duplicate page.

The final Tectonic build contains no `Overfull` or `Underfull` box diagnostics. It contains one non-content `shellesc` package warning because shell escape is disabled; the PDF compiles successfully and the warning does not affect rendered content.

## Canonical-output recheck

The current canonical `.tex` was compiled once with bundled Tectonic, the emitted build PDF was copied to the student-facing root location, and the synchronized bytes were rendered from the build path at 170 dpi. All five refreshed `page-final5-*.png` images were inspected individually; because the root and build PDFs are byte-identical, this rendering also represents the root PDF. Page 1 retains the accepted footer fix: the complete variable table and the explanatory sign-changing-bracket paragraph remain above the centred page number. No page-flow or visual regression was found.
