# Week 01 Lecture Live Script QA

- Final script: `Week01_Lecture_Demonstration_Physics_to_Arrays_and_Plots.m`
- MATLAB: R2026b Prerelease Update 3; base MATLAB only.
- Fresh-process command: `"/Applications/MATLAB R2026b.app/bin/matlab" -batch "run('Week01/Week01_Lecture_Demonstration_Physics_to_Arrays_and_Plots.m'); assert(n_samples==41); assert(abs(position_at_start_m)<1e-12); assert(abs(t_peak_s-20/9.81)<1e-12); disp('WEEK01_FRESH_RUN_OK')"`
- Result: PASS on 2026-09-01. The script returned 41 samples, `y(0)=0`, selected values, `t_peak_s=2.0387`, `y_peak_m=20.3874`, and `WEEK01_FRESH_RUN_OK`.
- Static MATLAB check: `checkcode` reported only intentional `NOPTS` notices where lecture outputs are deliberately displayed; no execution defect was reported.
- Plain-text structure: one blank line, immediately before `%[appendix]`; headings use one H1 and unnumbered H2 sections; no student-facing `.mlx` was created.
- Illustration decision: no generated illustration used. The native graph, concise equation, and code mapping are clearer for this simple physical model.
- Final script SHA-256: `923fd27c81a2fad113e4759f4aff0cd10241725015d6858fd75ae4d30030626b`
- Retained MATLAB figure SHA-256: `f8bc8f03e5ec80af0ba25b02a464e92208e37d291b36d8d2c2fbdb4020a75c6d`
