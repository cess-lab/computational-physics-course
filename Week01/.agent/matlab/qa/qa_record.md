# Week 01 Lecture Live Script QA

- Final script: `Week01_Lecture_Demonstration_Physics_to_Arrays_and_Plots.m`
- MATLAB: R2026b Prerelease Update 3; base MATLAB only.
- Fresh-process command: `"/Applications/MATLAB R2026b.app/bin/matlab" -batch "run('Week01/Week01_Lecture_Demonstration_Physics_to_Arrays_and_Plots.m'); assert(n_samples==41); assert(abs(position_at_start_m)<1e-12); assert(abs(t_peak_s-20/9.81)<1e-12); disp('WEEK01_FRESH_RUN_OK')"`
- Result: PASS. The script returned 41 samples, `y(0)=0`, selected values, `t_peak_s=2.0387`, `y_peak_m=20.3874`, and `WEEK01_FRESH_RUN_OK`.
- Plain-text structure: one blank line, immediately before `%[appendix]`; headings use one H1 and unnumbered H2 sections; no student-facing `.mlx` was created.
- Illustration decision: no generated illustration used. The native graph, concise equation, and code mapping are clearer for this simple physical model.
- Final script SHA-256: `9b73436fad5b9e17b76019fdcac64a5a46254936a70f6070ee43bb10755a9106`
- Retained MATLAB figure SHA-256: `f8bc8f03e5ec80af0ba25b02a464e92208e37d291b36d8d2c2fbdb4020a75c6d`

