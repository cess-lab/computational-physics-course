# PHY4605 Week 05 Lecture Deck - Draft Outline

**Status:** DRAFT / REVIEW-READY — retained as the planning outline for the 2026-09-04 Week 05 material-preparation stage. Do not generate, revise, or publish a Week 05 lecture deck until the lecturer explicitly asks to proceed. A PPTX from an earlier run exists in the repository but is outside the scope of this preparation stage and is not the source of truth for this outline.

**Working title:** From a Physical Target to a Checkable Root

**Audience:** Year-2 physics students with familiar projectile mathematics and developing MATLAB/numerical-method confidence.

**Teaching goal:** Move from one visually understandable physical target condition to a residual, read the residual sign and zero crossing, trace scaffolded bisection and Newton updates, use one stopping rule, validate by substitution, and interpret the physical unit of the root.

**Narrative spine:** physical target -> original equation -> residual and sign -> graph -> sign-changing bracket -> bisection midpoint/update -> bisection scaffold -> stopping and substitution -> Newton tangent/update -> Newton scaffold -> limited method comparison -> bad-bracket diagnosis -> transfer -> exit ticket.

**Blueprint boundary:** Core content is residual/root meaning, graphical and numerical bracket, scaffolded bisection, scaffolded Newton, one stopping rule, residual substitution, and physical interpretation. The guaranteed-bracket versus faster-local comparison is Working exposure. Uniqueness proof, multiple stopping rules, `fzero`, safeguarding, formal solver selection, and extreme small-derivative failures are excluded from the Core deck.

**Visual direction for the later deck:** Use the installed Teaching Courseware visual system: open white or very light neutral canvas, deep navy structure, dusty/cool blue for model and algorithm, quiet sage for validated/acceptable states, muted ochre for prompts or cautions, muted coral only for a genuine defect. Use large readable sans-serif titles, concise text, readable monospaced MATLAB fragments, no outer frame, no slide number, no timings, and no production/source labels on student slides. Each slide should have one primary learning job and a varied composition appropriate to that job.

## Slide sequence

### Slide 01 - From a Physical Target to a Checkable Root

- **Key points:** Keep the cover deliberately light: `Week 05 | Root Finding`. Frame the lecture as finding an input that makes a physical target condition true. Use a level-ground projectile launched at `v0 = 20 m/s`; the target range is `35 m`. The unknown is one low launch angle, not a generic abstract `x`.
- **Visual idea:** Sparse cover: projectile arc motif, a clearly labelled `35 m` target, launch-speed arrow `20 m/s`, and an angle marker `theta`; no numerical-method workflow yet.
- **Layout role and intent:** Cover / driving physical question; make the root a meaningful physical quantity before introducing residual notation.
- **Required images:** None at this gate. A conceptual generated visual may be created only after the lecturer explicitly authorises slide production; it must not invent trajectory values.

### Slide 02 - Turn the target condition into a residual

- **Key points:** Original model: `R(theta) = v0^2/g * sin(2 theta)`. Target condition: `R(theta) = 35 m`. Residual: `f(theta) = R(theta) - 35 m`. A root satisfies `f(theta) = 0`.
- **Visual idea:** Three-stage equation map: PHYSICAL MODEL -> TARGET CONDITION -> RESIDUAL ZERO, with the residual unit `m` and root unit `degree` kept visibly separate.
- **Layout role and intent:** Representation change; explicitly distinguish the original physical equation from the numerical residual form.
- **Required images:** None yet. If slide production is later authorised, render the exact equations as strict mathematical source assets.

### Slide 03 - Read the residual sign as physics

- **Key points:** `f(theta) < 0` means the model undershoots 35 m; `f(theta) = 0` means it hits the target; `f(theta) > 0` means it overshoots. The residual is a distance mismatch in metres.
- **Visual idea:** One horizontal target-distance strip with three small launch-angle states labelled UNDERSHOOT, ROOT, OVERSHOOT; pair each state with negative, zero, or positive residual.
- **Layout role and intent:** Concept meaning / misconception prevention; connect algebraic sign to physical mismatch before any iteration.
- **Required images:** None yet; later use a conceptual generated visual with exact sign labels and no invented distances.

### Slide 04 - Find the zero crossing before coding

- **Key points:** Plot `f(theta)` for `theta = 10:1:70 degree`. The low-angle residual changes sign between `20 degree` and `40 degree`: `f(20) = -8.7905 m` and `f(40) = +5.1553 m` approximately. The zero crossing is the graphical root location.
- **Visual idea:** Dominant residual graph with labelled axes and zero line; mark the bracket endpoints and visually highlight the low-angle zero crossing. Keep the second high-angle crossing visually secondary so it does not become a Core uniqueness lesson.
- **Layout role and intent:** Graph reading / bracket selection; make the sign-changing interval visible before introducing bisection code.
- **Required/reference image:** `Week05/.agent/matlab/assets/week05_projectile_residual.png` is the strict numerical/geometry reference. In the later slide-generation phase it must be supplied as reference only for a cohesive full-slide redraw; do not paste it into the final PowerPoint.

### Slide 05 - Bisection keeps a sign change alive

- **Key points:** Start with endpoints whose residuals have opposite signs. Compute the midpoint. Evaluate the midpoint residual. Keep the half interval whose endpoints still have opposite signs. Repeat.
- **Visual idea:** A single number-line bracket that visibly halves from `[20,40]` to `[20,30]` after the first midpoint `30 degree`, with endpoint signs and the midpoint residual shown next to the positions.
- **Layout role and intent:** Algorithm intuition; explain the midpoint and interval update in plain language rather than as unexplained code.
- **Required images:** None yet. Later create a deterministic strict bracket diagram from the locked numerical trace.

### Slide 06 - Trace the first four bisection updates

- **Key points:** Iteration 1: `[20,40]`, midpoint `30`, residual `+0.31194 m`, keep `[20,30]`. Iteration 2: midpoint `25`, residual `-3.7648 m`, keep `[25,30]`. Iteration 3: midpoint `27.5`, residual `-1.5993 m`, keep `[27.5,30]`. Iteration 4: midpoint `28.75`, residual `-0.61095 m`, keep `[28.75,30]`.
- **Visual idea:** Four-row trace table paired with a progressively shrinking interval graphic; use sage only on the half interval retained each time.
- **Layout role and intent:** Worked iteration trace; show that the algorithm is a repeated decision using signs, not a memorised formula.
- **Required images:** None yet. Later derive the strict trace table from the lecture demonstration output.

### Slide 07 - Read the bisection scaffold, line by line

- **Key points:** `mid_deg = (left + right)/2` creates the trial angle; the model expression calculates `f_mid_m`; `abs(f_mid_m) < tolerance_m` is the one Core stopping rule; the sign-product test decides which endpoint moves.
- **Visual idea:** Large exact MATLAB code panel with four numbered callouts: MIDPOINT, RESIDUAL, STOP, KEEP SIGN CHANGE. A small bottom prompt asks which endpoint changes after a positive midpoint residual when the left endpoint is negative.
- **Layout role and intent:** Code tracing / bounded completion; map each code block to the already-understood bisection idea.
- **Required images:** None yet. Later render the exact bisection excerpt from `Week05_Lecture_Demonstration_Root_Finding_for_Projectile_Range.m` as a strict source asset.

### Slide 08 - Stop once, then substitute back

- **Key points:** Use only `abs(residual_m) < 1e-3 m` as the Core stopping rule. The scaffold reaches `theta = 29.5679 degree` after 13 recorded bisection iterations with residual `+4.1164e-4 m`. Substitution gives a model range of `35.0004 m`, so the target condition is satisfied within tolerance.
- **Visual idea:** Left: final bracket/result card. Right: large sage substitution check `R(theta*) - 35 m = 4.1164e-4 m`, ending with the physical sentence “the model hits the 35 m target.”
- **Layout role and intent:** Validation / close the bisection loop; make the residual check more important than iteration count.
- **Required images:** None yet. Later create strict numerical and equation source assets from the MATLAB output.

### Slide 09 - Newton follows the local tangent

- **Key points:** Newton uses one current angle rather than a bracket. The tangent/update idea is `new = current - residual/slope`. For degree input, `df/dtheta = (v0^2/g) cos(2 theta) (2 pi/180)` and the slope unit is metres per degree.
- **Visual idea:** Conceptual residual curve with one tangent touching the current point and intersecting the zero line at the next estimate; exact update equation and units sit beside the graphic.
- **Layout role and intent:** Method concept / local geometry; introduce Newton as a tangent prediction, not as a mysterious formula.
- **Required images:** None yet. The future tangent visual is conceptual; exact equation text must be supplied as a strict mathematical asset after approval.

### Slide 10 - Trace Newton from 25 degree

- **Key points:** Start `theta = 25 degree`. Trace: `(25, -3.7648 m, 0.91488 m/degree)` -> `29.115 degree`; then residual `-0.33461 m`, slope `0.74939 m/degree`; then `29.562 degree`, residual `-0.0042242 m`; the fourth recorded evaluation at `29.567 degree` has residual `-7.1308e-7 m`.
- **Visual idea:** Exact MATLAB Newton scaffold on the left; four-step numeric update cards on the right, with arrows showing how residual divided by slope changes the angle.
- **Layout role and intent:** Code/iteration trace; reinforce the local update while keeping the derivative unit visible.
- **Required images:** None yet. Later derive the strict code and numeric trace from the lecture demonstration output.

### Slide 11 - Working exposure: same root, different route

- **Key points:** Bisection reaches the locked tolerance in 13 recorded iterations and preserves a sign-changing bracket. Newton reaches the same low-angle root in 4 recorded evaluations from the chosen start. Iteration count is only a limited cost measure; correctness still comes from the residual and physical interpretation.
- **Visual idea:** Two-column comparison: BRACKETED / LOCAL. Use compact badges for `13` versus `4`, but place a larger shared green “validate the residual” bar below both.
- **Layout role and intent:** Working exposure / limited method comparison. This slide is removable without breaking the Core route.
- **Required images:** None; exact values come from the lecture demonstration.

### Slide 12 - A midpoint is not enough: the bracket must change sign

- **Key points:** Bisection should not start from two endpoints with the same residual sign. A same-sign interval can still produce midpoints, but it does not provide the Core guarantee used by the algorithm. Repair the interval by checking the residual graph and endpoint signs first.
- **Visual idea:** Split diagnosis: coral SAME-SIGN bracket on the left with no demonstrated zero crossing; sage SIGN-CHANGING `[20,40]` bracket on the right. A short repair path reads GRAPH -> SIGNS -> START.
- **Layout role and intent:** Debugging / safety-condition diagnosis; distinguish runnable arithmetic from a justified root-finding setup.
- **Required images:** None yet. Later use a deterministic bracket diagram; do not introduce extreme small-derivative failure cases.

### Slide 13 - Transfer the residual pattern to new physics

- **Key points:** Thin lens: residual `1/f - 1/u - 1/v`, root unit `m` for image distance. RC charging: residual `Vs(1-exp(-t/RC)) - Vthreshold`, root unit `s` for threshold time. The same pattern is model -> residual -> bracket/start -> update -> stop -> substitute -> interpret.
- **Visual idea:** Two compact unsolved context cards, LENS and RC, feeding into one shared residual-workflow arrow. Do not reveal practical numerical answers.
- **Layout role and intent:** Transfer / practical preparation; separate the numerical method from the particular projectile equation.
- **Required images:** None. Future simple labelled conceptual diagrams must preserve the exact supplied equations and units.

### Slide 14 - Exit ticket: explain a root to a future you

- **Key points:** DEFINE: write the physical target and residual. BRACKET: explain what opposite endpoint signs mean. UPDATE: describe one bisection midpoint or Newton tangent step. CHECK: substitute the root into the residual and state the root's physical unit.
- **Visual idea:** Four spacious response cards - DEFINE, BRACKET, UPDATE, CHECK - with a small bottom bridge to the practical contexts: projectile range, thin lens, RC threshold.
- **Layout role and intent:** Retrieval / transfer; consolidate the Core reasoning chain without adding a new method.
- **Required images:** None.

## Planned strict/reference assets for a future authorised deck phase

The following are planned future slide-generation inputs. **Do not create or revise them for this preparation stage.**

- `Week05/.agent/matlab/assets/week05_projectile_residual.png` - already exists for the learning note and serves only as the strict numerical/geometry reference for Slide 04.
- Exact TeX equation assets for the projectile model, target equation, residual, Newton update, derivative, and validation substitution.
- Exact MATLAB code-panel assets for the bisection and Newton excerpts from the lecture demonstration.
- Deterministic bisection-trace table/interval assets using the locked first four iterations and final result.
- Deterministic Newton-trace assets using the locked four evaluations.
- Exact validation-result asset with `29.5679 degree`, `35.0004 m`, and residual `4.1164e-4 m`.

No external web image is required for this outline. Conceptual projectile, tangent, lens, and RC visuals can be generated later within the approved Teaching Courseware style if slide production is authorised, while exact equations, code, values, labels, and units remain strict source facts.

## Approval checkpoint

This 14-slide sequence is a planning outline only. Do **not** generate a sample slide, regenerate slide images, modify deck-production assets, or create/revise a PPTX until the lecturer explicitly asks to proceed with the Week 05 lecture deck.
