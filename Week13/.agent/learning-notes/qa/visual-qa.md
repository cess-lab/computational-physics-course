# Week 13 learning note QA

## Source and scientific checks

- Source: `Week13_Capstone_Presentation_Defence_and_Handoff.tex`
- Learning outcomes: 3; the note introduces no new required numerical method.
- The capstone evidence chain is a single top-to-bottom sequence: Model and units -> Pseudocode -> Code trace -> Controlled change -> Main output -> Two checks -> Meaning and limitation -> Reproducible handoff. The rendered diagram has no crossed or reversed arrows.
- The worked projectile example preserves the supplied equation, `v0 = 18 m s^-1` baseline, `v0 = 20 m s^-1` modification, `g = 9.81 m s^-2`, and fixed angle array.
- The two checks are explicitly different: the 45 degree known-value reference checks agreement at one point, while the symmetry relation checks the modelled curve shape. Repeating the same comparison at another speed or resolution is stated not to count as two checks.
- Fresh-session handoff, AI decision evidence, rotation-ledger priority, pending absences, and make-up entries are stated in compact form while preserving the assessment rules. The evidence is marked final in the submission record only after the clean rerun and records are complete.

## Build

Command used from the bundled LaTeX skill root:

```text
python3 scripts/compile_latex.py /Users/khairuladib/MATLAB-Drive/Kuliah/computational-physics-course/Week13/.agent/learning-notes/Week13_Capstone_Presentation_Defence_and_Handoff.tex --compiler tectonic --output-directory /Users/khairuladib/MATLAB-Drive/Kuliah/computational-physics-course/Week13/.agent/learning-notes/build-review-20260908 --json
```

Result: bundled Tectonic 0.17.0 completed successfully from a clean output directory; PDF generated with 5 A4 pages. `pdfinfo` confirms A4 page size and 5 pages. The `\Needspace{19\baselineskip}` guard moves the full defence section to page 5, leaving page 4 clear of the footer. The synchronized canonical root and hidden-build PDFs are 73,795 bytes.

## Rendered inspection

Command used:

```text
pdftoppm -png -r 150 Week13/.agent/learning-notes/build-review-20260908/Week13_Capstone_Presentation_Defence_and_Handoff.pdf Week13/.agent/learning-notes/qa/rendered-review-20260908/page
```

All five rendered pages were inspected at 150 dpi. Opening hierarchy, the one-way evidence diagram, tables, lists, the line-numbered descriptive code caption, callout colours, section transitions, footer page numbers, and closing blocks are legible and free of clipping, overlap, footer collisions, black squares, or broken glyphs. Page 4 ends after the optional extension and page 5 begins the complete defence section with clear footer separation. The root PDF and hidden build PDF have identical SHA-256 hash `1c8f553604b7f6e157f609de06127439102b703bd130b8a0338acd5d0a963b95`. No blank or duplicate page was found.
