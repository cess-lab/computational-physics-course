# PHY4605 Week 05 Lecture Slide Deck Handoff

Status: planning artifact only. Do not treat this file as a generated slide deck.

Target deck: `Lecture_Slides_Week05.pptx`, only if the lecturer later approves slide generation.

Week focus: root finding through Kepler's equation, aligned with `Week05_Root_Finding_Bracketing_Newton_and_Reliability.pdf`, `Week05_Lecture_Demonstration_Root_Finding_and_Kepler_Orbits.m`, and `Week05_Practical_Compare_Root_Finders_for_Kepler_Equation.m`.

## Non-negotiable production constraints

1. Do **not** generate slides from this handoff unless explicitly requested later.
2. When generated, the deck must follow `PHY4605_Lecture_Slide_Design_Spec.md` and the `scientific-educational-image-slides` route stated in `AGENTS.md`.
3. Every final visible slide must be a **single full-slide ImageGen-generated raster image** embedded edge-to-edge in a 16:9 PPTX with PptxGenJS.
4. The PPTX must contain no visible native PowerPoint text boxes, shapes, tables, charts, equations, connectors, or overlays.
5. The canvas must remain pure white with no border, frame, watermark, URL, footer, institutional logo, decorative background, grid, pattern, or texture.
6. Speaker notes may contain delivery notes and `[Sources]` blocks, but visible slide content must not contain citations, URLs, or source labels.
7. Do not include timings on visible slides. The course blueprint treats the session duration as an internal delivery constraint only.
8. Do not create or update a Week 05 Google Classroom quiz from this slide handoff.

## Global visual system

### Canvas

- Raster source size: **1920 × 1080 px**, 16:9.
- PPTX page size: 13.333333 × 7.5 in, wide layout.
- Background: `#FFFFFF` pure white.
- Safe margin: minimum **76 px** from all edges for any content; preferred content margin **115 px left/right** and **60 px top**.
- No outer border or enclosing slide frame.

### Typography

Use these exact roles for all slides:

| Role | Font | Weight | Size at 1920×1080 | Colour | Placement |
| --- | --- | ---: | ---: | --- | --- |
| Title | Roboto Condensed | Bold | 68 px | Navy `#0B2B4C` | x=115 px, y=60 px, max width=1450 px |
| Title, long | Roboto Condensed | Bold | 60–64 px only if needed | Navy `#0B2B4C` | same anchor; max two lines |
| Subtitle | Roboto | Medium | 30 px | Charcoal `#3F4B57` | x=115 px, y=142 px for one-line titles; y=204 px for two-line titles |
| Card heading | Roboto Condensed | Bold | 34–38 px | Navy or semantic colour | inside cards, left aligned |
| Body | Roboto | Regular/Medium | 26–30 px | Charcoal `#3F4B57` | left aligned |
| Small label | Roboto | Medium | 22–24 px | Charcoal or semantic colour | diagrams/tables only |
| Formula | STIX Two Math or Cambria Math | Regular | 38–46 px | Navy `#0B2B4C` | centred in formula zones |
| Code | Roboto Mono or IBM Plex Mono | Regular | 25–28 px | Navy `#0B2B4C` | code cards only |
| Warning strip | Roboto Condensed | Bold | 31–34 px | Caution red `#B3262E` or navy | bottom strip |

Title and subtitle positions must be visually identical across the complete deck.

### Colour tokens

| Semantic role | Stroke/text | Pale fill | Use |
| --- | --- | --- | --- |
| Navy primary | `#0B2B4C` | `#F4F8FC` | titles, equations, main model cards, code outlines |
| Charcoal secondary | `#3F4B57` | `#F7F9FB` | body text, neutral cards, axes, labels |
| Model blue | `#2F6DB2` | `#EEF5FD` | physical model, residual curve, orbital diagram, primary algorithm line |
| Valid green/teal | `#2A9D9F` or `#3E8E45` | `#F0FAF7` | brackets, validation, checks, guarantees |
| Evaluation gold | `#C98A16` | `#FFF7E6` | iteration counts, method comparison, efficiency |
| Caution red | `#B3262E` | `#FFF2F2` | invalid bracket, small derivative, false convergence |
| Secondary purple | `#6F4B9B` | `#F5F1FB` | `fzero` only, if a distinct reference-solver category is useful |

### Card and line style

- Card fill: white or very pale semantic fill.
- Card stroke: 2 px, semantic stroke colour at 65–80% opacity.
- Card radius: 20–24 px.
- Shadow: none, or very subtle soft shadow at <10% opacity only if needed for separation.
- Arrows: 5 px stroke, rounded caps, same semantic colour as the concept; arrowheads simple triangular.
- Diagram axes: 3 px charcoal, tick labels 22 px, not too dense.
- Equations: no decorative boxes unless the equation is the central conclusion; use a pale card instead.

### Reusable layout grid

Use one of these content grids after the locked title band:

- Standard content top: **y=215 px**.
- Standard content area: x=115 px, y=215 px, w=1690 px, h=735 px.
- Bottom takeaway strip: x=115 px, y=930 px, w=1690 px, h=92 px, radius=22 px.
- Two-column layout: left x=115 w=800; right x=1005 w=800; gutter=90.
- Three-card layout: card widths 500 px; x positions 115, 710, 1305; gutters 95.
- Four-card layout: card widths 385 px; x positions 115, 560, 1005, 1450; gutters 60.
- Equation band: centred x=230 w=1460, y=360–520, with formula size 42–48 px.

## Deck-level story arc

The deck should make this reasoning chain visible:

`physical orbital question -> variables and units -> residual -> bracket and uniqueness -> bisection -> Newton -> stopping evidence -> MATLAB reference -> failure diagnosis -> safeguarded reliability -> method selection -> practical/capstone transfer`

The deck should support the lecture demonstration order, but it should not duplicate every MATLAB Live Script section. The slides should prepare students to interpret the live code outputs rather than serve as a code transcript.

## Approved Week 05 numerical values

Use these exact values when numerical evidence appears:

| Quantity | Value |
| --- | --- |
| Baseline eccentricity | `e = 0.70` |
| Baseline mean anomaly | `M = 1.00 rad` |
| Baseline analytic bracket | `[0.3000, 1.7000] rad` |
| Baseline lower residual | `f(0.3000) = -0.90686` |
| Baseline upper residual | `f(1.7000) = 0.0058346` |
| Baseline root | `E ≈ 1.69464 rad` |
| Baseline bisection iterations | `33` |
| Baseline bisection residual | `3.45 × 10⁻¹¹` |
| Baseline bisection final half-width | `1.63 × 10⁻¹⁰ rad` |
| Baseline Newton iterations | `6` |
| Baseline Newton residual | `1.11 × 10⁻¹⁶` |
| Baseline `fzero` iterations | `4` |
| Baseline `fzero` residual | `2.79 × 10⁻¹¹` |
| Invalid bracket example | `[0, 0.1] rad` |
| Invalid bracket residuals | `f(0) = -1`, `f(0.1) = -0.96988` |
| Stress eccentricity | `e = 0.999` |
| Stress mean anomaly | `M = 0.15 rad` |
| Stress initial guess | `E₀ = 0` |
| Stress derivative at initial guess | `f′(0) = 0.001` |
| Stress first raw Newton step | `ΔE = 150 rad` |
| Stress root | `E ≈ 0.97925 rad` |
| Stress raw Newton iterations | `34` |
| Stress bisection iterations | `34` |
| Stress safeguarded Newton iterations | `8` |
| Stress safeguarded fallbacks | `3` |

## Slide-by-slide handoff

### Slide 01 — Title slide

- Archetype: light title / concept opener.
- Density: light.
- Visible title: **Root finding: bracketing, Newton, and reliability**
- Visible subtitle: **Week 5 | From Kepler’s equation to trustworthy numerical evidence**
- Layout:
  - Title x=115, y=255, w=1350, font 78 px, line height 0.98, navy.
  - Subtitle x=115, y=440, w=1450, font 34 px, charcoal.
  - Course tag x=115, y=130, text `PHY4605 Computational Methods in Physics`, font 26 px, Roboto Medium, charcoal.
  - Right-side scientific illustration occupies x=1180, y=185, w=575, h=575.
- Illustration:
  - Clean line illustration of an elliptic orbit on white background.
  - Draw a navy ellipse, a small gold focus point, a model-blue radius line to a blue point on the ellipse, and two curved angle arcs labelled `M` and `E`.
  - Keep labels large: `M`, `E`, `e`, `0 ≤ e < 1`.
  - Do not show a planet/space background; this must be a scientific schematic, not astronomy art.
- Bottom micro-copy: none.
- Speaker note intent:
  - Introduce the central theme: the root is not the goal by itself; the evidence chain is the goal.
- Sources note:
  - `[Sources] Week05 learning note; Week05 lecture demonstration Live Script; AGENTS.md Week 05 blueprint.`

### Slide 02 — Today’s arc: physical model → numerical evidence

- Archetype: pipeline.
- Density: standard.
- Visible title: **Today’s arc: physical model → numerical evidence**
- Visible subtitle: **Keep the physics visible after the equation becomes an algorithm**
- Layout:
  - Use six horizontal stages across x=115 to 1805, y=315 to 650.
  - Each stage is a rounded card, w=250, h=180, radius=22, stroke 2 px.
  - Gutter between cards: 38 px.
  - Use arrows between cards, 5 px, navy.
- Exact stage text:
  1. `Orbit model`
     - body: `M, E, e`
  2. `Residual`
     - body: `f(E)=0`
  3. `Bracket`
     - body: `existence + uniqueness`
  4. `Iterate`
     - body: `bisection or Newton`
  5. `Check`
     - body: `step + residual + status`
  6. `Defend`
     - body: `physical interpretation`
- Colours:
  - Stages 1–2: model blue stroke/fill.
  - Stage 3: valid green stroke/fill.
  - Stage 4: evaluation gold stroke/fill.
  - Stage 5: teal stroke/fill.
  - Stage 6: navy stroke/fill.
- Bottom takeaway strip:
  - Fill `#F4F8FC`, stroke navy.
  - Text: **A solver output is evidence only after the model, units, algorithm, and validation checks agree.**
- Speaker note intent:
  - Tie directly to the course blueprint chain: model, variables/units, algorithm, error/uncertainty, validation, interpretation.

### Slide 03 — Root finding starts with a residual

- Archetype: layered concept.
- Density: standard.
- Visible title: **Root finding starts with a residual**
- Visible subtitle: **A trial value becomes credible only when the mismatch is small for the right equation**
- Layout:
  - Left large formula card x=115, y=260, w=760, h=455.
  - Right residual-curve schematic x=1010, y=245, w=795, h=485.
  - Bottom takeaway strip x=115, y=930, w=1690, h=92.
- Exact text in formula card:
  - Heading: `Implicit physical question`
  - Formula: `f(x)=0`
  - Body: `f measures how far a trial value is from satisfying the model.`
- Residual-curve illustration:
  - Axes: horizontal labelled `trial value x`, vertical labelled `residual f(x)`.
  - Model-blue smooth nonlinear curve crossing the horizontal axis once.
  - Red vertical distance from a trial point to the curve labelled `mismatch`.
  - Green dot at crossing labelled `root`.
- Exact small labels around curve:
  - `trial value`
  - `residual`
  - `root`
- Bottom strip text:
  - **Do not ask “what number did the solver return?” before asking “what residual did this number satisfy?”**
- Style:
  - Formula card fill `#F4F8FC`, stroke navy.
  - Residual card fill white, stroke light charcoal `#AAB4BE`.
  - Mismatch line caution red; root marker valid green.

### Slide 04 — Kepler’s equation provides the physical spine

- Archetype: model diagram + equation.
- Density: standard.
- Visible title: **Kepler’s equation provides the physical spine**
- Visible subtitle: **The unknown eccentric anomaly E is defined implicitly by the orbit model**
- Layout:
  - Left orbital schematic x=115, y=230, w=760, h=610.
  - Right equation stack x=990, y=250, w=815, h=520.
  - Bottom units bar x=115, y=900, w=1690, h=110.
- Orbital illustration:
  - Ellipse in navy, centre lightly marked, focus in gold, orbiting point in model blue.
  - Radius line from centre to eccentric-anomaly construction point labelled `E`.
  - Focus-to-body line labelled `orbit position`.
  - Do not include realistic planets, star fields, or decorative shading.
- Exact equation text on right:
  - Heading: `Model equation`
  - Formula 1: `M = E − e sin E`
  - Heading: `Residual form`
  - Formula 2: `f(E)=E−e sin E−M`
  - Heading: `Derivative`
  - Formula 3: `f′(E)=1−e cos E`
- Exact units bar text:
  - `E and M are angles in radians  |  e is dimensionless  |  elliptic case: 0 ≤ e < 1`
- Colours:
  - Model equation card: blue fill `#EEF5FD`, blue stroke.
  - Derivative line: evaluation gold emphasis on `f′(E)`.
  - Units bar: pale green fill, teal/green stroke.

### Slide 05 — Pause and predict: what evidence is enough?

- Archetype: prediction checkpoint.
- Density: light.
- Visible title: **Pause and predict: what evidence is enough?**
- Visible subtitle: **A small step is not automatically a correct root**
- Layout:
  - Central question card x=230, y=265, w=1460, h=350.
  - Three evidence chips below x=250, 750, 1250, y=670, each w=420, h=150.
  - Bottom instruction strip x=115, y=930, w=1690, h=92.
- Exact central question text:
  - `If the iteration changes by only 10⁻¹² rad, have we solved Kepler’s equation?`
- Evidence chip text:
  1. `Step size`
     - `How much did E move?`
  2. `Residual`
     - `How small is |f(E)|?`
  3. `Physical check`
     - `Does the result fit the model and units?`
- Bottom strip text:
  - **Before MATLAB, write one sentence: what would convince you that the root is trustworthy?**
- Style:
  - Central card fill `#F0FAF7`, stroke valid green.
  - Step chip gold; residual blue; physical check green.
  - Use a small pencil/check icon in a pale circular backplate on the left of the central question.

### Slide 06 — A bracket gives global existence evidence

- Archetype: derivation + visual bracket.
- Density: standard.
- Visible title: **A bracket gives global existence evidence**
- Visible subtitle: **For Kepler’s equation, the physics gives a sign-changing interval**
- Layout:
  - Left derivation card x=115, y=245, w=820, h=520.
  - Right residual-curve card x=1020, y=245, w=785, h=520.
  - Bottom takeaway strip x=115, y=900, w=1690, h=115.
- Exact left card text:
  - Heading: `Analytic bracket`
  - Formula: `a = M − e,    b = M + e`
  - Formula: `f(M−e) = −e[1+sin(M−e)] ≤ 0`
  - Formula: `f(M+e) =  e[1−sin(M+e)] ≥ 0`
- Right illustration:
  - Residual curve with horizontal axis `E` and vertical `f(E)`.
  - Green vertical bracket lines at `M−e` and `M+e`.
  - Left endpoint below x-axis labelled `f(a) ≤ 0`.
  - Right endpoint above x-axis labelled `f(b) ≥ 0`.
  - Root marker between endpoints.
- Bottom takeaway text:
  - **Continuity + opposite signs guarantee at least one root in the bracket.**
- Style:
  - Bracket card green fill/stroke.
  - Residual curve blue; bracket lines green; root dot navy with green outline.

### Slide 07 — Uniqueness comes from monotonicity

- Archetype: concept proof.
- Density: standard.
- Visible title: **Uniqueness comes from monotonicity**
- Visible subtitle: **A bracket shows existence; the derivative shows whether more than one root is possible**
- Layout:
  - Top formula band x=230, y=260, w=1460, h=170.
  - Three proof cards x=115, 710, 1305, y=500, w=500, h=275.
  - Bottom caution strip x=115, y=900, w=1690, h=115.
- Exact formula band text:
  - `f′(E)=1−e cos E ≥ 1−e > 0     for 0 ≤ e < 1`
- Three proof cards:
  1. Heading: `Positive derivative`
     - Body: `The residual keeps increasing.`
  2. Heading: `No turn-back`
     - Body: `The curve cannot cross, reverse, and cross again.`
  3. Heading: `One bracketed root`
     - Body: `Existence + monotonicity gives uniqueness.`
- Bottom caution strip text:
  - **A sign-changing bracket alone does not always prove uniqueness; here, the derivative completes the argument.**
- Style:
  - Formula band pale green, green stroke.
  - Caution strip pale orange, evaluation gold border, not red; this is a conceptual caution rather than a failure.

### Slide 08 — Bisection keeps the root inside the interval

- Archetype: numbered process.
- Density: standard.
- Visible title: **Bisection keeps the root inside the interval**
- Visible subtitle: **Each step preserves the sign-changing bracket and halves the uncertainty**
- Layout:
  - Four numbered process cards in a row x=115, 560, 1005, 1450, y=265, w=385, h=440.
  - Bottom formula strip x=230, y=770, w=1460, h=135.
  - Bottom takeaway strip x=115, y=930, w=1690, h=92.
- Exact process card text:
  1. `Start`
     - `f(a)f(b) < 0`
  2. `Midpoint`
     - `c = (a+b)/2`
  3. `Test sign`
     - `Which half still brackets?`
  4. `Repeat`
     - `Width halves each time`
- Exact formula strip:
  - `|c_k − E_*| ≤ (b_k − a_k)/2`
- Bottom takeaway text:
  - **Bisection is slower, but the interval itself is evidence.**
- Illustration detail:
  - Each card includes a miniature horizontal number line showing shrinking interval; use green bracket endpoints and blue midpoint.
- Style:
  - Valid green for bracket elements, model blue for midpoint, gold for iteration count labels.

### Slide 09 — Newton uses a local tangent

- Archetype: diagram + equation.
- Density: standard.
- Visible title: **Newton uses a local tangent**
- Visible subtitle: **Fast convergence comes from trusting local geometry**
- Layout:
  - Left large tangent plot x=115, y=235, w=900, h=610.
  - Right equation card x=1100, y=300, w=705, h=360.
  - Bottom warning strip x=115, y=900, w=1690, h=115.
- Plot illustration:
  - Axes `E` and `f(E)`.
  - Blue residual curve crossing axis.
  - Gold tangent line at `E_k` crossing axis at `E_{k+1}`.
  - Label `slope = f′(E_k)` near tangent.
  - Label `Newton step` along horizontal arrow from `E_k` to `E_{k+1}`.
- Equation card text:
  - Heading: `Update rule`
  - Formula: `E_{k+1}=E_k − f(E_k)/f′(E_k)`
  - Body: `Good local slope + good guess → rapid progress.`
- Warning strip text:
  - **If the derivative is tiny or the guess is poor, the tangent can point far away from the useful root.**
- Style:
  - Equation card pale blue; tangent line gold; warning strip pale red with caution red border.

### Slide 10 — Baseline case: three methods agree

- Archetype: comparison table.
- Density: dense.
- Visible title: **Baseline case: three methods agree**
- Visible subtitle: **Agreement is useful only because each method is checked against the residual**
- Layout:
  - Top model strip x=115, y=215, w=1690, h=95.
  - Main comparison table x=175, y=365, w=1570, h=390.
  - Bottom interpretation strip x=115, y=870, w=1690, h=145.
- Exact model strip text:
  - `e = 0.70,   M = 1.00 rad,   bracket = [0.3000, 1.7000] rad,   root E ≈ 1.69464 rad`
- Table columns:
  - `Method`
  - `Iterations`
  - `Residual`
  - `Main evidence`
- Table rows:
  - `Bisection | 33 | 3.45 × 10⁻¹¹ | valid bracket + half-width`
  - `Newton | 6 | 1.11 × 10⁻¹⁶ | small step + residual`
  - `fzero | 4 | 2.79 × 10⁻¹¹ | exit flag + residual`
- Bottom strip text:
  - **Iteration count measures efficiency, not correctness. Residual checks equation satisfaction, not the whole physical model.**
- Style:
  - Header row navy fill with white text.
  - Bisection row green accent, Newton row gold accent, `fzero` row purple accent.
  - Use 27 px body text; do not shrink below 24 px.

### Slide 11 — Stopping criteria answer different questions

- Archetype: comparison / taxonomy.
- Density: dense.
- Visible title: **Stopping criteria answer different questions**
- Visible subtitle: **Do not collapse step size, residual, error bound, and solver status into one idea**
- Layout:
  - Four evidence cards in 2×2 grid.
  - x positions 115, 1005; y positions 245, 570; card w=800, h=250.
  - Bottom rule strip x=115, y=900, w=1690, h=115.
- Exact card text:
  1. Heading: `Bracket width`
     - Formula/text: `(b−a)/2`
     - Body: `Certified location bound for valid bisection.`
  2. Heading: `Step size`
     - Formula/text: `|E_{k+1}−E_k|`
     - Body: `The iteration stopped moving much.`
  3. Heading: `Residual`
     - Formula/text: `|f(E_k)|`
     - Body: `The equation is nearly satisfied.`
  4. Heading: `Solver status`
     - Formula/text: `exit flag / message`
     - Body: `What the implementation detected.`
- Bottom rule strip text:
  - **A trustworthy stop combines numerical scale, residual evidence, and physical interpretation.**
- Colours:
  - Bracket width green; step size gold; residual blue; solver status purple.

### Slide 12 — Visual convergence evidence

- Archetype: chart comparison.
- Density: standard.
- Visible title: **Visual convergence evidence**
- Visible subtitle: **The path to the root can reveal robustness or risk before the final number does**
- Layout:
  - Left chart x=115, y=250, w=790, h=540.
  - Right chart x=1015, y=250, w=790, h=540.
  - Bottom takeaway strip x=115, y=900, w=1690, h=115.
- Left chart:
  - Title label: `Residual magnitude`
  - y-axis: `|f(E_k)|` on log scale, x-axis: `iteration k`.
  - Green bisection curve descends steadily.
  - Gold Newton curve drops sharply after a few steps.
- Right chart:
  - Title label: `Root estimate`
  - y-axis: `E_k (rad)`, x-axis: `iteration k`.
  - Show bisection approaching from bracketed interval; Newton points rapidly settle near `1.69464`.
  - Include dashed horizontal line labelled `E ≈ 1.69464 rad`.
- Bottom text:
  - **Use plots to diagnose behaviour, not just to decorate a final answer.**
- Style:
  - Simple axes, no grid clutter; faint horizontal gridlines only.
  - Markers large enough for projection.

### Slide 13 — Invalid brackets remove the guarantee

- Archetype: caution.
- Density: standard.
- Visible title: **Invalid brackets remove the guarantee**
- Visible subtitle: **More iterations do not repair missing existence evidence**
- Layout:
  - Top red warning strip x=115, y=215, w=1690, h=110.
  - Left invalid residual plot x=115, y=390, w=800, h=430.
  - Right diagnosis card x=1005, y=390, w=800, h=430.
  - Bottom repair strip x=115, y=900, w=1690, h=115.
- Top warning text:
  - **Do not run bisection unless the endpoint signs have been checked.**
- Plot details:
  - Residual curve segment from `E=0` to `E=0.1` entirely below zero.
  - Red endpoint markers at `E=0` and `E=0.1`.
  - Labels: `f(0) = −1`, `f(0.1)=−0.96988`.
  - Add red text: `same sign`.
- Diagnosis card text:
  - Heading: `Defect`
    - `f(a)f(b) > 0`
  - Heading: `Consequence`
    - `No sign-change guarantee`
  - Heading: `Repair`
    - `Choose or justify a new interval`
- Bottom repair strip text:
  - **The first validation check is not after the solver; it is before the solver is allowed to run.**
- Style:
  - Caution red dominates this slide, but maintain white background and clean cards.

### Slide 14 — Stress case: a small derivative creates a huge Newton step

- Archetype: caution / numerical shock.
- Density: standard.
- Visible title: **Stress case: a small derivative creates a huge Newton step**
- Visible subtitle: **High eccentricity makes local tangent information dangerous from a poor guess**
- Layout:
  - Left parameter card x=115, y=250, w=560, h=520.
  - Centre equation card x=730, y=250, w=580, h=520.
  - Right tangent-failure diagram x=1365, y=250, w=440, h=520.
  - Bottom warning strip x=115, y=900, w=1690, h=115.
- Parameter card exact text:
  - `e = 0.999`
  - `M = 0.15 rad`
  - `E₀ = 0`
- Equation card exact text:
  - `f(0)=−0.15`
  - `f′(0)=1−0.999=0.001`
  - `ΔE=−f(0)/f′(0)=150 rad`
- Diagram:
  - Shallow tangent near `E₀=0`, with a very long gold arrow leaving the useful plotting window; label `candidate = 150 rad`.
  - Useful root region highlighted around `E ≈ 0.97925 rad`.
- Bottom warning text:
  - **A successful final residual later does not erase the risk exposed by the first step.**
- Style:
  - Parameter card pale red; equation card pale orange; diagram white with red edge label.

### Slide 15 — Safeguarding combines speed with reliability

- Archetype: pipeline / decision flow.
- Density: standard.
- Visible title: **Safeguarding combines speed with reliability**
- Visible subtitle: **Keep the bracket; accept Newton only when it behaves**
- Layout:
  - Central decision flow x=160, y=260, w=1600, h=500.
  - Bottom comparison strip x=115, y=850, w=1690, h=160.
- Flow steps and exact text:
  1. `Valid bracket`
     - `[a,b] contains root`
  2. `Propose Newton`
     - `E_new = E − f/f′`
  3. Diamond decision: `Inside bracket and finite?`
  4a. Green branch: `Accept Newton step`
  4b. Red branch: `Fallback to midpoint`
  5. `Update bracket`
     - `preserve sign change`
- Bottom comparison text:
  - `Stress case result: bisection 34 iterations  |  safeguarded Newton 8 iterations  |  fallbacks = 3`
- Colours:
  - Bracket and update green.
  - Newton proposal gold.
  - Rejected branch red.
  - Accepted branch teal.
- Style:
  - Use arrows drawn behind cards if generated; ensure arrows never cross through labels.
  - Keep flow simple; no code.

### Slide 16 — MATLAB fzero is a reference implementation, not an oracle

- Archetype: comparison / responsible tool use.
- Density: standard.
- Visible title: **MATLAB fzero is a reference implementation, not an oracle**
- Visible subtitle: **Use official solvers, but still validate the model and residual**
- Layout:
  - Left code card x=115, y=260, w=830, h=445.
  - Right interpretation card x=1030, y=260, w=775, h=445.
  - Bottom rule strip x=115, y=870, w=1690, h=145.
- Exact code card text, monospace:
  - `f = @(E) E - e*sin(E) - M;`
  - `bracket = [M-e, M+e];`
  - `[Eroot,fval,exitflag] = fzero(f,bracket);`
  - `residual = abs(f(Eroot));`
- Right card exact text:
  - Heading: `What fzero can report`
    - `root estimate`
    - `function value`
    - `exit flag`
  - Heading: `What you still must check`
    - `model assumptions`
    - `units and scale`
    - `independent validation`
- Bottom rule strip text:
  - **Prefer a bracket when you have one; never outsource physical judgement to a solver.**
- Colours:
  - Code card pale blue, navy stroke.
  - `fzero` heading purple accent.
  - Validation checklist green check marks.

### Slide 17 — Method choice is an evidence decision

- Archetype: method-selection matrix.
- Density: dense.
- Visible title: **Method choice is an evidence decision**
- Visible subtitle: **Choose the solver that matches the evidence available for the physical problem**
- Layout:
  - Main matrix x=115, y=240, w=1690, h=585.
  - Bottom capstone prompt strip x=115, y=880, w=1690, h=135.
- Matrix columns:
  - `Situation`
  - `Prefer`
  - `Reason`
  - `Required check`
- Matrix rows:
  1. `Sign-changing bracket available | Bisection / fzero bracket | global existence evidence | endpoint signs + residual`
  2. `Good guess and safe derivative | Newton | fast local convergence | step + residual`
  3. `Derivative risky or step leaves bracket | Safeguarded Newton | speed with fallback | bracket invariant`
  4. `Only plausible number from AI/code | No acceptance yet | output is not evidence | independent validation`
- Bottom prompt text:
  - **Capstone bridge: define your residual, justify your bracket or initial guess, and name two validation checks.**
- Style:
  - Matrix header navy fill with white text.
  - Prefer column uses semantic colour chips: green, gold, teal, red.
  - Keep table text 24–26 px; if crowded, split into two cards rather than shrinking below 23 px.

### Slide 18 — Recap: a trustworthy root has a chain of evidence

- Archetype: recap / bridge.
- Density: standard.
- Visible title: **Recap: a trustworthy root has a chain of evidence**
- Visible subtitle: **The practical turns the lecture evidence chain into a group comparison task**
- Layout:
  - Top horizontal chain x=115, y=235, w=1690, h=180.
  - Three takeaway cards x=115, 710, 1305, y=500, w=500, h=285.
  - Bottom practical preparation strip x=115, y=900, w=1690, h=115.
- Chain exact text:
  - `model → residual → bracket/guess → iteration → stopping rule → validation → interpretation`
- Takeaway cards exact text:
  1. Heading: `Bracket first when possible`
     - Body: `The interval is evidence, not just a starting point.`
  2. Heading: `Newton is local`
     - Body: `Fast when the tangent is trustworthy; risky when it is not.`
  3. Heading: `Stopping is evidence`
     - Body: `Keep step, residual, error bound, status, and physics separate.`
- Bottom strip exact text:
  - **Practical: compare methods, diagnose failure modes, and preserve method-selection evidence for the Weeks 01–06 report.**
- Style:
  - Chain uses navy arrows and semantic coloured nodes.
  - Takeaway 1 green, takeaway 2 gold/red split accent, takeaway 3 blue/teal.

## Required speaker-note pattern for every slide

Each generated slide should have notes in this structure:

```text
Teaching intent: <one sentence explaining what this slide is for.>
Checkpoint/question: <one prompt the lecturer can ask.>
Transition: <one sentence linking to the next slide or MATLAB demonstration section.>
[Sources]
- Week05_Root_Finding_Bracketing_Newton_and_Reliability.pdf / .tex section <section name>
- Week05_Lecture_Demonstration_Root_Finding_and_Kepler_Orbits.m section <section name>
- Week05_Practical_Compare_Root_Finders_for_Kepler_Equation.m section <section name>, where relevant
- Week05/.agent/qa/validate_week05_model.m for numerical values, where relevant
```

Do not place sources on visible slides.

## Alignment map to Week 05 materials

| Deck slides | Learning note sections | Lecture demonstration sections | Practical sections |
| --- | --- | --- | --- |
| 01–02 | Opening, learning outcomes | Opening, pause and predict | Prediction and model setup |
| 03–04 | Residual and Kepler equation | Build the physical residual | State model, variables, assumptions |
| 05 | Predict before computing | Pause and Predict | Predict before computing |
| 06–07 | Bracketing and uniqueness | Construct bracket, establish uniqueness | Prove a bracket before calling a solver |
| 08 | Bisection | Apply bisection | Run explicit bisection |
| 09 | Newton | Apply Newton | Run explicit Newton iteration |
| 10–12 | Stopping criteria, method comparison | Compare with fzero, separate step/residual, visualize convergence | Validate with fzero, plot convergence evidence |
| 13–15 | Invalid bracket, stress case, safeguarding | Diagnose invalid bracket, stress-test Newton, recover reliability | Test invalid bracket, stress-test, compare raw and safeguarded behaviour |
| 16 | MATLAB fzero | Compare with MATLAB fzero | Validate with MATLAB fzero |
| 17 | Compare methods, responsible AI | Diagnose common claims, capstone connection | Diagnose AI-generated claims, capstone method evidence |
| 18 | Three takeaways, preparation | Three takeaways | Submission evidence and AI decision record |

## QA checklist for the future slide generator

Before any generated deck is accepted, verify all items below:

1. **Slide count:** exactly 18 slides unless the lecturer explicitly approves a different count.
2. **Raster contract:** each PPTX slide contains exactly one full-slide raster image and no visible native overlays.
3. **No Week 5 slide leak before approval:** do not place a PPTX in `Week05/` unless generation has been explicitly requested.
4. **Title consistency:** title on every slide is upper-left anchored at x≈115 px, y≈60 px, Roboto Condensed Bold, navy, visually consistent.
5. **Canvas:** white, borderless, no background motif, no logo, no footer, no watermark.
6. **Safe margins:** all labels, formulas, code, and diagrams are at least 76 px from edges; title band remains uncluttered.
7. **Text readability:** body text no smaller than 23 px; code no smaller than 25 px; formulas clear at projection distance.
8. **Scientific consistency:** all equations use `M = E − e sin E`, `f(E)=E−e sin E−M`, and `f′(E)=1−e cos E` exactly.
9. **Numerical consistency:** all numerical values match the approved Week 05 table in this handoff.
10. **Conceptual consistency:** do not claim that residual equals root error; do not claim a bracket alone proves uniqueness; do not claim `fzero` validates the physical model.
11. **Colour semantics:** green/teal for validity, blue for model/residual, gold for numerical choice/iteration, red for failures/warnings, purple only for `fzero` or distinct reference-solver role.
12. **Charts:** axes must have units where relevant, especially `E (rad)` and `iteration k`; use log scale only where explicitly labelled.
13. **Speaker notes:** include teaching intent, checkpoint, transition, and `[Sources]` block for every slide.
14. **Final delivery record:** state exactly: `Each slide is a single ImageGen-generated raster image embedded full-slide.`

## Suggested backend files if generation is later approved

If slide generation is later requested, use this backend structure:

```text
Week05/.agent/lecture-slides/
├── Week05_Lecture_Slide_Deck_Handoff.md
├── slide_specs.json
├── raster/
│   ├── slide-01.png
│   └── ...
├── rendered-final/
│   ├── slide-1.png
│   └── ...
├── contact-sheet-final.png
├── build_raster_week05_deck.js
└── validate_raster_week05_deck.py
```

Only after QA should the final approved deck be copied to:

```text
Week05/Lecture_Slides_Week05.pptx
```

Do not create that PPTX from this handoff alone.
