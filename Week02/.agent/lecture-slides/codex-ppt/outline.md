# PHY4605 Week 02 — From One Calculation to a Traceable Loop

Status: outline and planned asset roles approved by the lecturer on 2026-09-02. The lecturer subsequently approved the Slide 11 conceptual-graphic replacement on 2026-09-02. This outline is a new narrative for the Week 02 Codex-PPT replacement. It uses the Week 01 production as a style-and-flow reference only; it does not require reuse of the original Week 02 slide text, slide renders, or illustrations.

Audience: Year-2 physics students with familiar vertical-motion mathematics but uncertain retained MATLAB foundations.

Teaching goal: turn one familiar physics calculation into an ordered algorithm, trace a `for` loop, make one bounded change, diagnose defects from evidence, and explain what a validation check does and does not prove.

Narrative spine: physical question -> prediction -> one calculation -> repeatable recipe -> index mapping -> hand trace -> MATLAB loop -> bounded completion -> controlled modification -> plotted evidence -> defect diagnosis -> validation -> transfer.

Blueprint alignment: the Core route covers input/calculation/output/check decomposition, plain-language pseudocode, loop start/current value/update/next value/stopping point, first-two-iteration tracing, scaffold completion, one-parameter modification, syntax/indexing/physical-logical defect diagnosis, one known-value/physical check, and physical interpretation. Preallocation and vectorised comparison remain Working exposure; reusable functions and independent tests remain Stretch.

Visual direction after approval: Codex-PPT Teaching Courseware, carrying forward Week 01's Muted Academic Blue + Sage system as a style reference only. Keep an open warm-white canvas, deep navy structure, dusty blue model content, quiet sage for expected/validated states, muted ochre for occasional prompts, and subdued coral only for genuine defects. Use bold for main titles, semibold for short labels, regular explanatory copy, and readable monospaced MATLAB fragments. Vary composition by slide role; do not repeat the Week 01 sample layout or use an outer frame.

## Slide outline

### Slide 1: From one calculation to a traceable loop
- Key points: A familiar equation can be evaluated one time at a time; an algorithm makes the order visible; a loop makes the repetition explicit; evidence still needs checking and physical interpretation.
- Visual idea: One vertical-motion trajectory connected to a clean reasoning path: question -> recipe -> loop -> evidence -> explanation.
- Layout role and intent: Cover / driving question; position Week 02 as algorithmic thinking, not a syntax catalogue.
- Required images: None. Use a new conceptual vertical-motion illustration without exact labels or numerical claims.

### Slide 2: Predict the motion before asking MATLAB to repeat anything
- Key points: Choose upward as positive; start at `y = 0 m`; the ball rises, reaches one maximum, and falls; the prediction is the reference for later debugging.
- Visual idea: Three or four labelled physical states with a compact prediction panel and one small “What should the output look like?” prompt.
- Layout role and intent: Prediction / physical intuition; activate Week 01 knowledge before adding loops.
- Required images:
  - New conceptual vertical-motion illustration; supporting imagegen visual only, with state labels supplied as strict text in the slide prompt. Do not reuse the old Week 02 or Week 01 illustration.

### Slide 3: Fix the model, then ask what repeats
- Key points: Use `y(t) = y0 + v0 t - (1/2) g t^2`; lock `y0 = 0 m`, `v0 = 20 m s^-1`, and `g = 9.81 m s^-2`; choose ordered times `t_s = 0:0.5:4 s`; one evaluation gives one position.
- Visual idea: Exact equation centred above a “fixed inputs” strip and a single highlighted time-to-position calculation.
- Layout role and intent: Model mapping / representation change; separate the physics that stays fixed from the value that changes on each loop pass.
- Required images:
  - New exact equation asset rendered from the locked Week 02 model; strict mathematical input; preserve symbols, sign, fraction, and units.

### Slide 4: One calculation is four small jobs
- Key points: Input stores parameters and times; calculation evaluates the model at the current time; output stores the position; check compares the result with something already known.
- Visual idea: Four connected stations with a single sample moving through Input -> Calculate -> Store -> Check; make the output slot visibly distinct from the current value.
- Layout role and intent: Process / decomposition; give students a plain-language algorithm before MATLAB syntax.
- Required images: None. The station labels are exact slide text, not a source illustration.

### Slide 5: Turn the jobs into a repeatable recipe
- Key points: Make one output slot per input time; start at the first index; read the current time; calculate and store one position; move to the next index and stop after the last.
- Visual idea: A six-step pseudocode ladder with start/current/update/next/stop highlighted as the loop vocabulary.
- Layout role and intent: Pseudocode / algorithm map; make the loop’s control flow explicit in ordinary language.
- Required images: None. Pseudocode is supplied as strict text in the generation brief and checked against the Week 02 Live Script.

### Slide 6: The index is a storage address, not a time
- Key points: MATLAB indexing starts at 1; `t_s(sample_index)` selects the current physical time; `y_m(sample_index)` selects the matching output slot; the same index keeps input and output aligned.
- Visual idea: A two-row array strip mapped to a vertical-motion timeline, with one index highlighted and a direct connector between selected time and storage slot.
- Layout role and intent: Concept explanation / misconception repair; connect an abstract index to a physical moment.
- Required images:
  - New exact index-mapping asset; strict text/diagram input; preserve `sample_index`, `t_s(sample_index)`, and `y_m(sample_index)`.

### Slide 7: Trace two passes before trusting the whole loop
- Key points: Pass 1 uses index 1 and `t = 0 s`, giving `y = 0 m`; pass 2 uses index 2 and `t = 0.5 s`, giving `y = 8.77375 m`; each pass changes the selected input and output location together.
- Visual idea: Two large trace cards with the same four fields: index, current time, calculation, stored result; a small “notice the changing quantity” annotation.
- Layout role and intent: Worked trace / guided reasoning; let students follow execution order before seeing the full code.
- Required images:
  - New exact two-pass trace asset; strict numerical/text input; preserve both indices, times, and results.

### Slide 8: Write the MATLAB loop that matches the recipe
- Key points: Preallocate one position slot per time; loop from 1 to `n_samples`; use a scalar `current_time_s` inside the loop; store into the matching indexed output.
- Visual idea: Exact MATLAB loop on the left, with four numbered callouts tied to Input, Select, Calculate, and Store on the right.
- Layout role and intent: Code mapping / scaffolded reading; show a complete runnable pattern without requiring blank-page coding.
- Required images:
  - New exact MATLAB code asset generated from the Week 02 Live Script; strict code input; preserve names, punctuation, indentation, and `end`.

### Slide 9: Complete one line, then say what it does
- Key points: The missing line is the position update; it must use the current time, not the whole time array; it must store into `y_m(sample_index)`; the first stored value should remain `0 m`.
- Visual idea: A bounded code scaffold with one highlighted blank, beside a “current time -> equation -> matching slot” sentence frame.
- Layout role and intent: Bounded completion / Core checkpoint; assess one controlled implementation action and its physical meaning.
- Required images:
  - New exact scaffold asset; strict code input; preserve the blank location and the surrounding loop structure.

### Slide 10: Change one input, predict one consequence
- Key points: Change only `v0_mps` from `20` to `15`; keep `y0_m`, `g_mps2`, and `t_s` fixed; predict a lower maximum position; rerun the same algorithm so the comparison is controlled.
- Visual idea: A “fixed / changed / predicted” comparison with one input chip moving from original to modified case and a small hand-sketched lower-peak prediction.
- Layout role and intent: Controlled modification / causal reasoning; reinforce prediction before execution and isolate one parameter change.
- Required images: None. Use exact parameter names and values as strict text in the prompt.

### Slide 11: Read the plot as evidence, not decoration
- Key points: Both cases begin at `0 m`; the lower launch speed produces a lower peak; units and labels make the graph interpretable; the curve is valid only under the stated model assumptions.
- Visual idea: A generated conceptual evidence graphic showing a shared start, a higher and lower sampled peak, labelled axes/units, and an assumptions gate; use the exact MATLAB plot in the Live Script as the numerical follow-up rather than redrawing it on the slide.
- Layout role and intent: Evidence-reading / physical interpretation; make the loop output answer the prediction question while keeping the distinction between conceptual trend and numerical evidence explicit.
- Required images:
  - None. Conceptual visual only; the exact MATLAB comparison plot remains in the lecturer Live Script and hidden QA assets, not as an image-generation input.

### Slide 12: Diagnose the defect before editing the code
- Key points: Syntax defects stop MATLAB reading the intended structure; indexing/operator defects can run while storing or calculating the wrong thing; physical/logical defects can produce plausible numbers with wrong physics; “the code ran” is not a correctness test.
- Visual idea: Three diagnostic lanes—syntax, array/indexing/operator, physical/logical—with symptom, evidence, and a short exact defect fragment in each lane.
- Layout role and intent: Classification / debugging strategy; give students a decision path rather than a list of error messages.
- Required images:
  - New exact defect-fragment asset; strict code input; preserve the missing `end`, fixed output index, and wrong gravity-sign examples.

### Slide 13: One check can pass while the model is still wrong
- Key points: `y(0) = 0 m` is a known initial-value check; `assert(y_m(1) == y0_m)` checks the first stored value; a wrong gravity sign can still pass at `t = 0`; use the physical prediction as a second check on the trajectory’s direction and shape.
- Visual idea: A split validation panel: known-value check passes at the start, while a wrong-sign trajectory fails the physical check; end with “check the number and the meaning.”
- Layout role and intent: Validation / limitation; show what a check proves, what it misses, and why physical reasoning remains necessary.
- Required images:
  - New exact validation equation/code asset; strict mathematical/code input; preserve the initial-value assertion and wrong-sign contrast.

### Slide 14: Exit ticket — explain the loop to a future you
- Key points: Put input, calculation, output, and check in order; explain what `t_s(sample_index)` selects; identify one defect and its evidence; state one validation and one physical conclusion; preview Week 03’s 2 x 2 circuit model.
- Visual idea: Four compact response cards—Order, Trace, Diagnose, Validate—ending with a small bridge from the loop recipe to a two-equation circuit recipe.
- Layout role and intent: Transfer / individual reflection; consolidate the Core reasoning chain without revealing answers.
- Required images: None.

## Asset and production notes

- The existing Week 02 PPTX, its historical slide renders, and the previous Week 02 illustrations are content references only and are not required inputs.
- The Week 01 Codex-PPT sample and final deck may be used as style-only references: match the Teaching Courseware palette, hierarchy, density, and semantic colour discipline, but vary the layout for each Week 02 teaching role.
- Exact equation, code, numerical trace, and validation expressions are strict source assets. The exact MATLAB comparison plot is retained under the hidden QA assets and in the Live Script as numerical evidence, while the lecturer-approved Slide 11 conceptual replacement does not use it as an image-generation input.
- Use no slide number, no outer frame, no internal production metadata, no timings, and no source labels on student-facing slides.
- Keep the required route at 14 slides; all content is Core except preallocation and any optional vectorised comparison, which may appear only as removable Working exposure if later approved.

## Approval checkpoint

The revised slide sequence and planned asset roles were confirmed by the lecturer on 2026-09-02. The lecturer later approved the Slide 11 conceptual replacement. Visual/backend confirmation, sample approval, slide-worker production, notes embedding, assembly, and final QA are recorded under `qa/`.
