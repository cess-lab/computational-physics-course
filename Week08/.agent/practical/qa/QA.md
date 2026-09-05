# Week 08 practical QA

The student-facing practical ran from top to bottom in a new MATLAB R2026b Prerelease Update 3 process. All baseline assertions passed, all three native plots were generated, the six-column cross-context evidence table was created, and the marker `WEEK08_PRACTICAL_BASELINE_PASSED` was emitted. See `practical_baseline_validation.log`.

The bounded drag modification was checked separately with `fall_drag_kg_per_s=0.50 kg/s`. Running from Question 6 recalculated the terminal velocity as `9.81 m/s`; the supplied timestep errors decreased for 0.5, 0.25, and 0.125 s, and the terminal-velocity bound passed. See `validate_changed_drag.m` and `changed_drag_validation.log`.

MATLAB native `export` produced `practical_render.html` from the final plain-text Live Script without leaked `%[text]` directives. The source has exactly one blank line immediately before the appendix, no empty text directives, and no single-backslash LaTeX commands.

The practical contains ten numbered progressive challenges across RC discharge, falling velocity with linear drag, and radioactive decay. Optional `ode45` exposure can be deleted without breaking Core execution. Each challenge has a defence hook; the variant bank gives A/B variants for every slot; the event ledger preserves every attempt and the member summary supports the first-defence rotation. An absence remains pending until a recorded make-up defence is completed.

No generated illustration is justified. The native numerical plots directly expose the state, timestep, reference, and error evidence required by the learning task.
