# Asset-path failure and safe correction

## Cause

The earlier practical `.mlx` contained a runnable `assetPath`/`imread`/`image` block. Its first path was relative to the course root, while the Live Script could be launched with a different working folder, so the block could fail before the practical began.

## Correction

- Removed the executable asset-loading block from `Week01/.agent/practical/source/PHY4605_Week01_Practical_Starter.m`.
- Preserved the supplied visual as embedded Live Script output; the corrected copy contains no `assetPath`, `imread`, or external image-path reference in `matlab/document.xml`.
- Did not overwrite `Week01/PHY4605_Week01_Practical_Starter.mlx` because the user reported unsaved edits in the active MATLAB document.

## Evidence

- Corrected hidden copy: `PHY4605_Week01_Practical_Starter_corrected_preserve_outputs.mlx`.
- Fresh MATLAB run from the course root completed with `CORRECTED_COPY_FRESH_RUN_OK` and the expected parameter/grid/TODO output.
- Corrected document has zero external asset-path markers and one embedded `figureUri>data:image/png;base64` figure output.
- Extracted embedded render was visually inspected; the radioactive-decay diagram and equation are legible.
- Static MATLAB check of the corrected source returned `code_issues: []`.
