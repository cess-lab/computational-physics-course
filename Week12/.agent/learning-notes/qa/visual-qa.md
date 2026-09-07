# Week 12 learning note QA

## Source and scientific checks

- Source: `Week12_Integrated_Method_Selection_and_Capstone_Studio.tex`
- Core outcomes: 3; no new required numerical method is introduced.
- Worked model: Newton cooling with `T_env = 20 degrees Celsius`, `T_initial = 80 degrees Celsius`, `tau = 100 s`, `t_final = 200 s`, and Euler timesteps `20 s` and `10 s`.
- Independently checked values: exact endpoint `28.120116994197 degrees Celsius`; Euler endpoints `26.442450944000` and `27.294599275434 degrees Celsius`; absolute errors `1.677666050197` and `0.825517718763 degrees Celsius`.
- The plus-sign defect is shown as syntactically valid but physically reversed, with the first defective `20 s` update giving `92 degrees Celsius`.
- Capstone evidence includes model/units, pseudocode, method trace, one controlled modification, principal output, required plus chosen validation, interpretation/limitation, reproducibility, AI decision record, and individual defence rehearsal. The worked MATLAB scaffold is split into three short panels, and the math-to-MATLAB index mapping states that $T_1$ is stored as `T_C(2)`.

## Build

Command used from the bundled LaTeX skill root:

```text
python3 scripts/compile_latex.py /Users/khairuladib/MATLAB-Drive/Kuliah/computational-physics-course/Week12/.agent/learning-notes/Week12_Integrated_Method_Selection_and_Capstone_Studio.tex --compiler tectonic --output-directory /Users/khairuladib/MATLAB-Drive/Kuliah/computational-physics-course/Week12/.agent/learning-notes/build-final2 --json
```

Result: Tectonic 0.17.0 completed successfully from a clean output directory; PDF generated with 7 A4 pages. `pdfinfo` confirms A4 page size, 7 pages, no encryption, and a 90,206-byte output.

## Rendered inspection

Command used:

```text
pdftoppm -png -r 150 Week12/.agent/learning-notes/build-final2/Week12_Integrated_Method_Selection_and_Capstone_Studio.pdf Week12/.agent/learning-notes/qa/rendered-final2/page
```

All seven rendered pages were inspected at 150 dpi. Opening hierarchy, page numbers, navy/green/orange callouts, split code panels, equations, tables, section transitions, and closing preparation callout are legible and free of clipping, overlap, black squares, or broken glyphs. The final defence paragraph remains on page 6, and page 7 starts cleanly with the Working exposure section. The extracted text contains the expected headings, numerical evidence, and closing blocks. No unresolved layout issue was observed.
