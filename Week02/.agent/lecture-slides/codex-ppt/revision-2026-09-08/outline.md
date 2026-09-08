# PHY4605 Week 02 — Numerical Algorithms: Turn physical reasoning into pseudocode, loops, and fixes

Status: revised direction approved by the lecturer on 2026-09-08 after a read-only Sol review and Luna challenge. This is a fresh revision project; the current student-facing deck is preserved at `qa/Lecture_Slides_Week02.before-redesign.pptx` and will not be replaced until the sample, delegated generation, assembly, and QA gates pass.

Audience: Year-2 physics students who know familiar analytic physics but have uncertain retained MATLAB foundations.

Teaching goal: make the order of a repeated calculation visible, trace a loop, complete one storage action, change one parameter, diagnose a defect from evidence, and transfer the same reasoning to a supplied radioactive-decay model.

Core reasoning chain:

`physical question -> prediction -> model and units -> pseudocode -> index/loop -> output evidence -> defect evidence -> validation -> physical interpretation`

Production route: Codex-PPT Teaching Courseware, 16:9 image-based slides, English student-facing text, English presenter notes, and the approved Week 02 four-job slide as a style-only reference. Keep the open warm-white canvas, deep navy structure, dusty blue model/process content, quiet sage for expected or validated states, muted ochre for controlled prompts, and subdued coral only for genuine defects. Use readable sans-serif hierarchy plus restrained monospaced MATLAB fragments. Do not use slide numbers, a thick outer frame, timing marks, source labels, production metadata, or decorative unlabeled graphs.

## Slide outline

### Slide 1: Numerical Algorithms: Turn physical reasoning into pseudocode, loops, and fixes
- Key points: A familiar equation can be evaluated one time at a time; an algorithm makes the order visible; a loop makes repetition explicit; evidence still needs checking and physical interpretation.
- Visual idea: A vertical-motion trajectory feeds a clean reasoning path: question -> recipe -> loop -> evidence -> explanation.
- Layout role and intent: Cover / driving question. Position Week 02 as algorithmic thinking rather than a syntax catalogue.
- Required images: None. Use a fresh conceptual vertical-motion visual without exact numerical claims.

### Slide 2: Predict the motion before asking MATLAB to repeat anything
- Key points: Choose upward as positive; start at `y = 0 m`; the ball rises, reaches one maximum, and falls; this prediction becomes the reference for later debugging.
- Visual idea: Three or four labelled physical states plus a compact prediction prompt: “What should the output look like?”
- Layout role and intent: Prediction / physical intuition. Activate the familiar model before adding loop machinery.
- Required images: None. The illustration is conceptual and all labels are strict slide text.

### Slide 3: Fix the model, then ask what changes
- Key points: Use `y(t) = y0 + v0*t - 0.5*g*t^2`; lock `y0_m = 0`, `v0_mps = 20`, and `g_mps2 = 9.81`; use ordered times `t_s = 0:0.5:4`; one evaluation gives one position.
- Visual idea: Exact model equation above a fixed-input strip and one highlighted scalar calculation using `current_time_s`.
- Layout role and intent: Model mapping / representation change. Separate fixed parameters from the changing scalar selected inside the loop.
- Required images: Preserve the existing exact vertical-motion equation asset if useful; no new graph is required.

### Slide 4: One calculation is four small jobs
- Key points: Input stores parameters and ordered times; calculate evaluates the model at the current time; store writes one result to the matching slot; check compares the result with something already known.
- Visual idea: Four connected stations — INPUT -> CALCULATE -> STORE -> CHECK — with a lower band showing one pass as one time -> one position.
- Layout role and intent: Process / decomposition. Give students a plain-language algorithm before MATLAB syntax.
- Required images: None.

### Slide 5: An index traces both selection and storage
- Key points: MATLAB indexing starts at 1; `t_s(sample_index)` selects the current physical time; `y_m(sample_index)` selects the matching output slot; pass 1 uses index 1 and `t = 0 s`, giving `y = 0 m`; pass 2 uses index 2 and `t = 0.5 s`, giving `y = 8.77375 m`.
- Visual idea: Two large trace cards connected to a paired input/output array strip, with the same index highlighted in both rows.
- Layout role and intent: Concept plus worked trace. Combine the former index explanation and first-two-pass trace so the address-to-physics mapping is visible in one place.
- Required images: None. Preserve the exact identifiers, indices, times, and results as strict text.

### Slide 6: Calculate one value; store it in the matching slot
- Key points: Preallocate one output slot per time; loop from `1` to `n_samples`; read `current_time_s = t_s(sample_index)`; calculate `current_position_m` from the scalar time; the next decision is where that value belongs.
- Visual idea: A complete calculate block on the left, with the output slot on the right intentionally left as a question for the next slide.
- Layout role and intent: Code mapping / scaffolded reading. Delay the storage line so students distinguish a value from its destination.
- Required images: None. MATLAB identifiers and punctuation are strict text.

### Slide 7: Your turn: complete the storage line
- Key points: The blank must store the current scalar result; it must use the current index; it must not overwrite one fixed element; the first stored value should remain `0 m`.
- Visual idea: A bounded code scaffold with one genuine blank — `y_m(sample_index) = ______;` — beside the sentence frame “current value -> matching slot”. Do not reveal the answer on the slide.
- Layout role and intent: Bounded completion / Core checkpoint. Require one controlled implementation action and its physical meaning.
- Required images: None. Keep the blank visible and do not include an answer expression in the generated slide.

### Slide 8: Change one input, predict one consequence
- Key points: Change only `v0_mps` from `20` to `15`; keep `y0_m`, `g_mps2`, and the common grid `t_s = 0:0.5:4` fixed; the lower launch speed should have a lower sampled peak; rerun the same algorithm for a controlled comparison.
- Visual idea: Evidence-first comparison with two sampled-marker curves and a compact numeric strip. Use the exact common grid. For `v0 = 20 m s^-1`, the highest sampled point is `20.38 m` at `2.0 s` and `y(4 s) = 1.52 m`; for `v0 = 15 m s^-1`, the highest sampled point is `11.46375 m` at `1.5 s` and `y(4 s) = -18.48 m`. State that the no-impact model continues to `4 s`; `y = 0` is the launch reference, not an automatic stopping rule.
- Layout role and intent: Data evidence / controlled modification. Merge the former parameter-change and plot-reading slides without implying that the two cases share the same peak or endpoint.
- Required images: The retained MATLAB figure `assets/matlab-figures/week02_loop_comparison.png` is a reference-only strict source for numerical geometry and labels. ImageGen should compose a cohesive slide and preserve the exact common grid, marker order, values, and units; do not paste or overlay the raster.

### Slide 9: A second process can use the same loop logic
- Key points: Radioactive decay gives a supplied analogue; start with `N0_counts = 800`, `half_life_h = 6.0`, and `t_decay_h = 0:1:24`; expect a decreasing count; the half-life check predicts `N(6 h) = 400` and `N(24 h) = 50`.
- Visual idea: Exact decay equation on the left, a count-versus-time conceptual path on the right, and a small fixed-input/prediction strip below.
- Layout role and intent: Transfer / model-to-prediction. Introduce a safe structural analogue without differential-equation theory, stochastic modelling, fitting, or derivation.
- Required images: `assets/equations/radioactive-decay-model.png` is a strict mathematical input; preserve `N(t)`, `N_0`, `e^{-\lambda t}`, `\lambda`, `\ln 2`, and `T_{1/2}` exactly.

### Slide 10: Transfer challenge — write the loop in plain language first
- Key points: Input the supplied count, half-life, decay constant, and hourly times; for each index, select the current time; calculate one count; store it in the matching output slot; check the half-life point; stop after the final hour. Ask students to predict the shape before code.
- Visual idea: An unsolved pseudocode lane with a blank at the storage action and a separate “what should be true at 6 h?” prompt. Do not show MATLAB code or the completed answer.
- Layout role and intent: Transfer / guided challenge. Move the algorithm pattern to a new physical process while keeping the demand bounded and structural.
- Required images: None. All pseudocode is strict text and must remain unsolved.

### Slide 11: Diagnose the defect before editing the code
- Key points: Syntax defects stop MATLAB reading the intended structure; indexing or operator defects can run while selecting or storing the wrong thing; physical or logical defects can produce plausible numbers with wrong physics; “the code ran” is not a correctness test.
- Visual idea: Three diagnostic lanes with exact examples: missing `end`; fixed output index `y_m(1)` or `t_s^2` instead of `t_s.^2`; wrong gravity sign or wrong units; each lane pairs symptom with evidence.
- Layout role and intent: Classification / debugging strategy. Teach a usable taxonomy with concrete repair targets, not a longer list of error messages.
- Required images: None. Keep code fragments short, exact, and readable.

### Slide 12: Use evidence to locate the first bad pass
- Key points: Record the symptom; locate the line and first bad pass; compare the code with the pseudocode or model; change one item; rerun; validate numerically and physically. Examples include a missing `end`, explicit `1:(n_samples+1)`, `t_s^2` versus `t_s.^2`, `y_m(1)` overwrite, wrong gravity sign, and wrong units.
- Visual idea: A six-step diagnostic workflow from symptom -> first bad pass -> model/pseudocode -> one change -> rerun -> two checks, with one small evidence card showing a first-bad-pass trace.
- Layout role and intent: Workflow / actionable debugging. Turn defect categories into a repeatable repair habit without adding `try/catch` or advanced tooling.
- Required images: None.

### Slide 13: A passing check can still miss wrong physics
- Key points: `y(0) = 0 m` and `assert(y_m(1) == y0_m)` are useful known-value checks; a wrong gravity sign can still pass at `t = 0`; compare the trajectory direction and shape with the physical prediction; use layered validation: model, code/output, and physical meaning.
- Visual idea: A validation stack: known value passes at the start, wrong-sign trajectory fails the physical prediction, and a final line says “check the number and the meaning”.
- Layout role and intent: Validation / limitation. Show what one check proves, what it misses, and why interpretation is part of correctness.
- Required images: None. Exact equations and code are strict slide text.

### Slide 14: Exit ticket — explain the loop to a future you
- Key points: Put input, calculation, output, and check in order; explain what `t_s(sample_index)` selects; identify one defect and its evidence; state one validation and one physical conclusion; preview Week 03’s 2 × 2 circuit model.
- Visual idea: Four compact response cards — Order, Trace, Diagnose, Validate — ending with a small bridge from the loop recipe to a two-equation circuit recipe.
- Layout role and intent: Transfer / individual reflection. Consolidate the Core reasoning chain without revealing answers.
- Required images: None.

## Strict content facts

- Vertical motion: `y(t) = y0 + v0 t - (1/2) g t^2`, `y0 = 0 m`, `g = 9.81 m s^-2`, `t_s = 0:0.5:4 s`.
- Vertical-motion trace: `y(0 s) = 0 m`, `y(0.5 s) = 8.77375 m`.
- Controlled comparison: `v0 = 20 m s^-1` gives sampled maximum `20.38 m` at `2.0 s` and `y(4 s) = 1.52 m`; `v0 = 15 m s^-1` gives sampled maximum `11.46375 m` at `1.5 s` and `y(4 s) = -18.48 m`.
- Decay transfer: `N(t) = N0 exp(-lambda t)`, `N0_counts = 800`, `half_life_h = 6.0`, `t_decay_h = 0:1:24`, `lambda_per_h = log(2)/half_life_h`, `N(0 h) = 800`, `N(6 h) = 400`, `N(24 h) = 50`.
- Do not introduce a differential equation, half-life derivation, stochastic model, fitting, Newton cooling, eigenproblem, or advanced debugging mechanism into the Week 02 Core lecture.

## Approval and QA gates

1. Outline, style, strict assets, and built-in ImageGen backend are confirmed.
2. Generate exactly one fresh representative sample and wait for lecturer visual approval.
3. After approval, prepare jobs with the approved sample-generation method and dispatch one exact inherited worker per remaining slide.
4. Record every dispatch and result with the Codex-PPT state scripts; the parent owns notes, QA, and assembly.
5. Inspect every final slide image at full size, verify the exact numerical/equation/code facts, embed presenter notes, assemble a 14-slide PPTX, and retain the pre-redesign deck backup.
