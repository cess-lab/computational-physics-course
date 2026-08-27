# Embedded practical image validation

- Source asset: `/Users/khairuladib/.codex/generated_images/019fdc12-1d07-7d62-8255-fc3f9d3526c9/exec-722fcace-55dc-421e-9f08-3ef973a1c281.png`
- Copied asset: `Week01/.agent/practical/assets/radioactive_decay_model.png`
- Source/copy comparison: byte-for-byte match.
- Embedded output: `Week01/PHY4605_Week01_Practical_Starter.mlx` contains one `figureUri>data:image/png;base64` output in `matlab/output.xml`.
- Render extraction: `embedded_model_render.png` was decoded from the `.mlx` output and visually inspected; the equation `dN/dt = -lambda N`, radioactive nuclei, decay curve, and “What you will test” panel are legible.
- Fresh MATLAB execution: completed with the expected parameter table, grid check, open student TODO notices, timestep table, and `FRESH_MATLAB_LIVE_SCRIPT_RAN` marker.
- Static MATLAB check: `code_issues: []`.
- Numerical validation harness: passed reference, grid, finiteness, admissibility, and convergence-trend checks.
