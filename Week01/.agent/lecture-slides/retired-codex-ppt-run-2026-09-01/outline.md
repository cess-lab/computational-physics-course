# PHY4605 Week 01 — Physics to Arrays and Plots

Conversion target: image-based Codex-PPT teaching-courseware deck derived from the current `Week01/Lecture_Slides_Week01.pptx`. The current student-facing deck remains unchanged until the converted deck is approved.

Audience: Year-2 physics students with familiar vertical-motion mathematics but uncertain retained MATLAB foundations.

Teaching goal: make the chain `physical model -> variables and units -> arrays -> element-wise operations -> index -> plot -> validation -> physical interpretation` visible and traceable.

Visual direction: Teaching Courseware — bright, approachable, low-to-moderate density, one main learning object per slide, clean diagrams and callouts, exact legible teaching copy, no decorative clutter or unnecessary slide numbers.

## Slide outline

### Slide 1: Physics to Arrays and Plots
- Key points: A familiar vertical-motion model becomes a computational object; the deck connects model, arrays, plot, and validation; Week 1 is about reading and tracing a model, not writing from a blank page.
- Visual idea: Friendly vertical-motion cutaway with launch, peak, and return states connected to four course concepts.
- Layout role and intent: Cover / concept overview; establish the single physical story and the course reasoning chain.
- Required images:
  - Main vertical-motion illustration; strict input asset; preserve the launch, peak, return, gravity, and colour mapping.

  ![Vertical-motion illustration](../lecture-slides/assets/projectile-visual-matte.png)

### Slide 2: Start with a physical prediction
- Key points: The ball starts at `y = 0 m`; it rises; it reaches one maximum; it returns toward the launch height.
- Visual idea: Three-state vertical-motion sequence with prediction prompts before any code appears.
- Layout role and intent: Context / problem; invite students to predict the output shape before seeing computation.
- Required images:
  - Vertical-motion cutaway; strict input asset; preserve the one-dimensional direction and state mapping.

  ![Vertical-motion cutaway](../lecture-slides/assets/equation-motion-vertical-matte-v2.png)

### Slide 3: The equation links each term to motion
- Key points: `y(t) = y0 + v0 t - (1/2) g t^2`; `y0` is starting position; `v0 t` is the upward contribution; `-(1/2) g t^2` is the gravity contribution; every term has units of metres.
- Visual idea: Equation with colour-linked term annotations and a simple vertical trajectory.
- Layout role and intent: Concept explanation / worked model; make the equation readable before translating it to MATLAB.
- Required images:
  - Exact equation and term assets; strict input assets; preserve equation symbols, signs, and units.

  ![Position equation](../lecture-slides/assets/equations/vertical-motion-position-equation.png)

### Slide 4: Names and units keep the model readable
- Key points: Translate `t`, `y`, `v0`, and `g` into meaningful MATLAB names; keep units visible in comments or names; distinguish variables from fixed parameters; readable names support unit checks.
- Visual idea: Physics-symbol → meaning → MATLAB-name → unit mapping table.
- Layout role and intent: Mapping / vocabulary; reduce novice ambiguity before code reading.
- Required images:
  - Symbol/unit equation assets; strict input assets where used; preserve the exact unit forms.

  ![Time symbol](../lecture-slides/assets/equations/symbol-t.png)

### Slide 5: Build the time array first
- Key points: One time value is needed for each computed height; `t_s = 0:0.1:4` and `t_s = linspace(0,4,41)` produce 41 samples; `length(t_s)` reports 41; MATLAB indexing starts at 1.
- Visual idea: Time samples laid along a horizontal axis, with the first sample and one middle sample highlighted.
- Layout role and intent: Process / array construction; show the array as a physical sampling plan.
- Required images: None required; use exact code as generated slide typography.

### Slide 6: An index selects one physical moment
- Key points: `t_s(1)` is the launch time; `t_s(11)` selects `1.0 s`; an index is not a time value; read the array position before interpreting the physical state.
- Visual idea: Array-to-trajectory mapping with index labels and launch/middle/end callouts.
- Layout role and intent: Worked example / guided trace; connect abstract indexing to a known moment in the motion.
- Required images:
  - Sampled-motion array illustration; strict input asset; preserve the index-to-time mapping.

  ![Sampled motion array](../lecture-slides/assets/array-sampled-motion-matte-v2.png)

### Slide 7: Dots tell MATLAB to work through an array
- Key points: `.*` multiplies each time value by the scalar; `.^2` squares each time value; ordinary `*` and `^` are not the same operation for an array; element-wise operators produce one height per time sample.
- Visual idea: Scalar operation versus array operation comparison with a single highlighted “one value per sample” pathway.
- Layout role and intent: Comparison / misconception repair; isolate the most important MATLAB syntax distinction for Week 1.
- Required images: None required; exact code and symbols must remain legible.

### Slide 8: The algorithm appears before the MATLAB syntax
- Key points: Choose parameters; create the time array; calculate height at every time; plot height against time; check the launch value; the ordered steps are the algorithm.
- Visual idea: Five-step horizontal process with model, array, calculation, plot, and check.
- Layout role and intent: Process diagram / pseudocode; make the reasoning chain explicit before code execution.
- Required images: None required.

### Slide 9: Short code should expose the physics
- Key points: Read comments and variable names first; locate the model parameters; locate the array construction; locate the element-wise model line; locate the plot and boundary check.
- Visual idea: Large, high-contrast MATLAB code fragment paired with five numbered trace markers.
- Layout role and intent: Code reading / guided trace; support students in following runnable code without requiring blank-page implementation.
- Required images: None required; exact MATLAB code is essential.

### Slide 10: A labelled plot turns values into evidence
- Key points: The graph should start at `y = 0 m`; rise to one maximum; then fall toward the launch height; axis labels, units, and title make the output interpretable; prediction comes before plotting.
- Visual idea: MATLAB-generated height–time plot beside a three-prediction checklist.
- Layout role and intent: Data evidence / interpretation; make the graph answer a physical question rather than act as decoration.
- Required images:
  - MATLAB height–time evidence plot; strict input asset; preserve data shape, axes, labels, units, and values.

  ![Height-time evidence plot](../lecture-slides/assets/matlab-figures/height_time_evidence.png)

### Slide 11: A boundary check can reveal an error that a smooth curve hides
- Key points: The known condition is `y(0) = 0 m`; in a one-based array this is `y_m(1)`; `assert(abs(y_m(1)) < 1e-12)` turns the physical condition into an executable check; a smooth-looking graph is not enough.
- Visual idea: Launch state on the left, computed first value and passing check on the right, with a clear validation connector.
- Layout role and intent: Validation / pass state; model the minimum evidence students must provide.
- Required images:
  - Launch-boundary illustration; strict input asset; preserve the launch state and validation meaning.

  ![Launch boundary condition](../lecture-slides/assets/launch-boundary-condition-matte.png)

### Slide 12: Trace one model from physics to a graph
- Key points: Model — question, direction, variables, units; algorithm — sample, calculate, plot, check; code — read `.*` and `.^`; evidence — prediction, labelled plot, launch-value check; ask where a wrong sign would first become visible.
- Visual idea: Four-part course-wide reasoning chain with one visible diagnostic question.
- Layout role and intent: Synthesis / transfer prompt; consolidate the method students should reuse in later weeks.
- Required images: None required.

### Slide 13: Week 1 exit ticket
- Key points: Name the output variable and its unit; explain what `t_s(11)` selects; identify the operator that squares every value; state one graph prediction and one value that can be validated; preview that Week 2 turns this model into a traceable algorithm.
- Visual idea: Four short learner-response prompts with a compact “next time” bridge.
- Layout role and intent: Summary / reflection; create a clear individual checkpoint without revealing answers.
- Required images: None required.

## Asset and production notes

- Source deck: `/Users/khairuladib/MATLAB-Drive/Kuliah/computational-physics-course/Week01/Lecture_Slides_Week01.pptx`
- Candidate project directory: `/Users/khairuladib/MATLAB-Drive/Kuliah/computational-physics-course/Week01/.agent/codex-ppt-teaching-courseware/`
- Planned final student-facing output: `/Users/khairuladib/MATLAB-Drive/Kuliah/computational-physics-course/Week01/Lecture_Slides_Week01_Teaching_Courseware.pptx`
- The MATLAB figures and exact equation assets are preserved as strict source references. Final slide pages must still be generated by the confirmed Codex-PPT image backend.
- No slide images, final deck specification, prompt jobs, speaker notes, or PPTX have been generated at this stage.
