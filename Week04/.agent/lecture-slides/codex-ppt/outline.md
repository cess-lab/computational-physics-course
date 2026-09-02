# PHY4605 Week 04 Lecture Deck — Draft Outline

**Status:** APPROVED — revised after slide-level feedback on title-slide density and diagnosis-slide density

**Working title:** Change one parameter, see the physics

**Content boundary:** Use the Week04 README, content manifest, learning note, lecture demonstration Live Script, practical challenge set, and the MATLAB-generated Hooke's-law plot as content references. Explicitly exclude `Week04_Capstone_Preference_Checkpoint.md`. Use the Week03 lecture deck only as a reference for visual system, density, flow, and layout.

**Deck route:** 15-slide, 16:9 image-based Teaching Courseware deck. Inherit the Week03 visual language: open warm-white canvas; large deep-navy question-led titles; dusty-blue model/code structure; quiet-sage prediction and validation panels; muted ochre prompts; subdued coral for the wrong-model diagnosis; no outer frame, timings, or source labels on student slides.

## Slide sequence

### 01 — Change one parameter, see the physics

- **Key points:** Keep the cover deliberately light: `Week 04 | Parameter sweeps and graph interpretation`.
- **Visual/layout:** Large title and one concise subtitle above a single spacious spring visual with a force arrow, labels `F`, `k`, `x`, and `x = F/k`; no workflow or explanatory panels.
- **Strict inputs:** Exact title, subtitle, labels, and equation; no multi-case cover schematic.

### 02 — Predict before MATLAB

- **Key points:** Use `F = kx`, so `x = F/k`. Sweep `k = [50 100 200] N/m` over `F = 0:0.5:10 N`; predict `x_50 > x_100 > x_200` for positive force, with all curves starting at zero.
- **Visual/layout:** Large model/spring visual on the left; sage prediction panel on the right; ochre bottom question asking which spring extends most.
- **Strict inputs:** Exact equation, parameter values, units, and predicted values at `F = 10 N`: `0.20 m`, `0.10 m`, `0.05 m`.

### 03 — A sweep is a controlled experiment

- **Key points:** Change one named parameter; hold the model, force array, units, and every other input fixed. Changing force and stiffness together would confound the comparison.
- **Visual/layout:** Six-node flow diagram adapted from the Week04 learning note, with a small coral/orange “confounded comparison” branch.
- **Strict inputs:** Exact workflow wording and the one-parameter/fixed-input distinction.

### 04 — Start with the model, variables, and units

- **Key points:** The ideal elastic-spring model is `F = kx`, rearranged to `x = F/k`. Identify `F` in N, `k` in N/m, and `x` in m; use `k = 100 N/m` as the baseline case.
- **Visual/layout:** Equation-led slide with a compact variable/unit table and a right-side dimensional check: `N ÷ (N/m) = m`.
- **Strict inputs:** Exact equations, symbols, variable names, values, and units from the Week04 manifest.

### 05 — Plan the computation in plain language

- **Key points:** Follow the eight-step path from the model to physical interpretation while holding the force array, equation, units, and all other inputs fixed as one parameter changes.
- **Visual/layout:** Expanded numbered algorithm path with the controlled-change rule using the reclaimed space; remove the four upper checklist statements and avoid a dense bullet wall.
- **Strict inputs:** Eight-step pseudocode from the learning note/manifest.

### 06 — Store the cases explicitly

- **Key points:** Build a small, readable force array and a named stiffness-case array before looping. Keep units in variable names.
- **Visual/layout:** Large strict MATLAB code panel on the left; four labelled callouts on the right identifying fixed input, swept cases, baseline, and array role.
- **Strict inputs:**

  ```matlab
  F_N = 0:0.5:10;
  k_Npm = [50 100 200];
  baseline_k_Npm = 100;
  ```

### 07 — Evaluate the same model for every case

- **Key points:** Preallocate one row per stiffness case. Each loop pass evaluates `x = F/k` with element-wise division; row `case_id` maps to one value of `k_Npm`.
- **Visual/layout:** Strict code panel with numbered arrows to a three-row/eleven-column output matrix; dusty-blue mapping panel.
- **Strict inputs:**

  ```matlab
  extension_m = zeros(length(k_Npm), length(F_N));
  for case_id = 1:length(k_Npm)
      extension_m(case_id, :) = F_N ./ k_Npm(case_id);
  end
  ```

### 08 — Read one row before plotting

- **Key points:** At `F = 10 N`, the rows give `0.20 m`, `0.10 m`, and `0.05 m` for `k = 50`, `100`, and `200 N/m`. The row order is part of the interpretation.
- **Visual/layout:** Large three-row result table with the `F = 10 N` column highlighted; baseline row marked in sage; bottom same-input comparison prompt.
- **Strict inputs:** Exact numeric values and case ordering from the lecture demonstration.

### 09 — Overlay every case on common axes

- **Key points:** Use one plot call with the matrix transposed so each row becomes one curve. Label both physical axes and identify each stiffness in the legend.
- **Visual/layout:** Dominant strict MATLAB-generated plot on the right; short exact plotting command and a transpose callout on the left.
- **Strict inputs:** `Week04/.agent/matlab/assets/week04_hooke_parameter_sweep.png`; exact plot labels/title/legend; `plot(F_N, extension_m.', 'LineWidth', 2)`.

### 10 — The graph is a physics statement

- **Key points:** Each curve is straight because `x` is proportional to `F`. Its slope is `1/k`; a smaller stiffness gives a steeper line and larger extension at the same force.
- **Visual/layout:** Use one cohesive ImageGen-redrawn graph-led visual with three restrained slope/ordering callouts and a sage “same input” marker integrated into the canvas.
- **Reference inputs:** MATLAB plot as the numerical and line-geometry reference; preserve the exact relationship `slope = 1/k`, ordering, labels, units, and example values while redrawing the graph and annotations together.

### 11 — Validate a known limiting case

- **Key points:** At zero applied force, every ideal-spring case must have zero extension. Test the first column directly and assert the tolerance.
- **Visual/layout:** Week03-style validation slide: exact MATLAB check on the left, green reconstructed result/check panel on the right, ochre question about what the check tests.
- **Strict inputs:**

  ```matlab
  zero_force_extension_m = extension_m(:, 1);
  assert(max(abs(zero_force_extension_m)) < 1e-12, ...
      'Zero-force validation failed.')
  ```

### 12 — A runnable calculation can still be wrong

- **Key points:** `x = F .* k` is syntactically valid but violates the model. Its units are not metres and its stiffness trend is reversed.
- **Visual/layout:** Spacious Week03-style two-panel diagnosis: blue “solver can run” panel and coral “physical check fails” panel. Move the numerical comparison and repair path to the next slide.
- **Strict inputs:** Exact wrong-model expression, correct expression, unit/trend diagnosis, and the Week04 lecture-demo comparison.

### 13 — Repair the expression, then recheck the physics

- **Key points:** At `F = 10 N`, compare correct `x = F/k` with wrong `x = F.*k`; preserve the values `0.20`, `0.10`, `0.05 m` versus `500`, `1000`, `2000 N^2/m`; finish with the corrected expression.
- **Visual/layout:** Strict comparison table on the left; compact five-step repair path on the right; green bottom recheck statement.
- **Strict inputs:** Exact wrong-versus-correct table, corrected MATLAB expression, and model equation.

### 14 — Working exposure: compare selected inputs

- **Key points:** At selected forces `F = [2 5 8] N`, compare all stiffness cases at the same inputs. The controlled-comparison pattern scales from one highlighted force to a compact result table.
- **Visual/layout:** Clean selected-input table on the left; small baseline/lower/higher stiffness comparison on the right; keep the slide lighter than the core algorithm slides.
- **Strict inputs:** Exact selected forces and values: at `2 N`, `[0.04, 0.02, 0.01] m`; at `5 N`, `[0.10, 0.05, 0.025] m`; at `8 N`, `[0.16, 0.08, 0.04] m`, ordered by `k = [50, 100, 200] N/m`.

### 15 — Exit ticket — explain a fair sweep to a future you

- **Key points:** Predict the trend; state what changes and what stays fixed; map the model to MATLAB; read a common-axis plot; perform one limiting/reference check; explain the physical result.
- **Visual/layout:** Four Week03-style reflection cards — `PREDICT`, `CONTROL`, `PLOT`, `CHECK & INTERPRET` — with a bottom transfer ribbon to the practical contexts: Ohmic resistor, vertical motion, and small-angle pendulum.
- **Strict inputs:** Exact transfer-context names from the Week04 practical challenge set; no capstone checkpoint content.

## Planned strict/reference assets

- MATLAB-generated plot/reference: `Week04/.agent/matlab/assets/week04_hooke_parameter_sweep.png`.
- Rendered equation assets for `F = kx`, `x = F/k`, and the unit relation, if needed to keep mathematical text exact.
- Rendered MATLAB code panels for the supplied snippets, preserving the source text exactly.
- Any schematic will be authored as a simple labelled scientific diagram and checked against the Week04 model before assembly.

## Approval request

The original sequence and source-asset mapping were approved. This revision preserves the approved style/backend while making the cover sparse, expanding Slide 5 after removing its upper text, splitting the dense diagnosis content into Slides 12–13, and regenerating Slide 10 as a single cohesive ImageGen canvas using the MATLAB plot only as a numerical/geometry reference.
