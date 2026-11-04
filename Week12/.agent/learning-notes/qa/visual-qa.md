# Week 12 learning note QA

## Source and scientific checks

- Source: `Week12_Integrated_Method_Selection_and_Capstone_Studio.tex`
- Learning outcomes: 3; no new required numerical method is introduced.
- Worked model: Newton cooling with `T_env = 20 degrees Celsius`, `T_initial = 80 degrees Celsius`, `tau = 100 s`, `t_final = 200 s`, and Euler timesteps `20 s` and `10 s`.
- Independently checked values: exact endpoint `28.120116994197 degrees Celsius`; Euler endpoints `26.442450944000` and `27.294599275434 degrees Celsius`; absolute errors `1.677666050197` and `0.825517718763 degrees Celsius`.
- The plus-sign defect is shown as syntactically valid but physically reversed, with the first defective `20 s` update giving `92 degrees Celsius`.
- Capstone evidence includes model/units, pseudocode, method trace, one controlled modification, main output, required plus chosen validation, interpretation/limitation, reproducibility, AI decision record, and individual defence rehearsal. The worked MATLAB starter code is split into three short panels, and the math-to-MATLAB index mapping states that $T_1$ is stored as `T_C(2)`. The note now briefly explains discretisation, error, and uncertainty and states when evidence is final in the submission record.

## Build

Command used from the bundled LaTeX skill root:

```text
python3 scripts/compile_latex.py /Users/khairuladib/MATLAB-Drive/Kuliah/computational-physics-course/Week12/.agent/learning-notes/Week12_Integrated_Method_Selection_and_Capstone_Studio.tex --compiler tectonic --output-directory /Users/khairuladib/MATLAB-Drive/Kuliah/computational-physics-course/Week12/.agent/learning-notes/build-review-20260908c --json
```

Result: bundled Tectonic 0.17.0 completed successfully from a clean output directory; PDF generated with 8 A4 pages. `pdfinfo` confirms A4 page size and 8 pages. The seven Euler algorithm steps remain together on page 4, the `\Needspace{28\baselineskip}` guard moves the trace to page 5, the `\Needspace{8\baselineskip}` guard keeps the Section 6 heading and complete introductory paragraph together on page 7, and the `\Needspace{16\baselineskip}` guard keeps the complete Individual defence rehearsal block together on page 8. The synchronized canonical root and hidden-build PDFs are 92,007 bytes.

## Rendered inspection

Command used:

```text
pdftoppm -png -r 150 Week12/.agent/learning-notes/build-review-20260908c/Week12_Integrated_Method_Selection_and_Capstone_Studio.pdf Week12/.agent/learning-notes/qa/rendered-review-20260908c/page
```

All eight rendered pages were inspected at 150 dpi. Opening hierarchy, page numbers, navy/green/orange callouts, the intact seven-step list, the page-5 trace, the complete Section 6 heading and introductory paragraph on page 7, the complete Individual defence rehearsal block on page 8, code panels with captions and line numbers, equations, tables, section transitions, and closing preparation callout are legible and free of clipping, overlap, footer collisions, black squares, or broken glyphs. The extracted text contains the expected terminology, numerical evidence, final-submission wording, and closing blocks. The root PDF and hidden build PDF have identical SHA-256 hash `9ff0ae8f6a5d4da00b201660a197d3a5c1a0ec934c94ea17e3343eace956af14`. No unresolved layout issue was observed.
