# PHY4605 Week 01 Content Manifest

## Locked model

**Physical question:** How does the vertical position of a ball launched straight upward change during the first four seconds after launch?

**Model:** `y(t) = y0 + v0 t - (1/2) g t.^2`

| Item | Locked value | Unit / convention |
| --- | ---: | --- |
| Position `y_m` | output | m; upward positive |
| Time `t_s` | `0:0.1:4` | s; 41 samples |
| Initial position `y0_m` | `0` | m |
| Initial velocity `v0_mps` | `20` | m s^-1; upward |
| Gravitational acceleration `g_mps2` | `9.81` | m s^-2; model subtracts its downward effect |
| Continuous peak time | `2.04` | s; `v0_mps/g_mps2` |
| Continuous peak height | `20.39` | m; `v0_mps^2/(2*g_mps2)` |

**Core validation:** `y(0) = y0 = 0 m`. The script uses an executable assertion with a numerical tolerance.

## Scope calibration

Core route: variables and units; one array and indexing; element-wise operations; a labelled plot; prediction, validation, and interpretation. Logical comparisons and the selected-value table are Working exposure. The analytical continuous peak is a reference result, not a second required validation.

## Lecture-route consistency

The Week 01 lecture deck, learning note, lecture demonstration, and their retained MATLAB evidence use the names, values, sign convention, time grid, equation, and Core validation above. The MATLAB-generated plot has a blue model curve and a teal initial-value validation marker.

The AI-enabled practical is intentionally outside this lecture-model lock. It transfers the Week 01 computational literacy to separately supplied RC-charging, mass-spring, and radioactive-decay models; its assumptions, variables, units, and validation references are locked in `Week01_Practical_AI_Enabled_Array_Challenge_Set.m` and the hidden practical protocol.
