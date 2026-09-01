# PHY4605 Lecture Slide Deck Design Specification

This document is the project-wide source of truth for the visual design, production, and visual QA of PHY4605 lecture and practical-brief slide decks. It applies to every weekly deck, every deterministic authoring source, every generated or sourced visual asset, every PPTX build, every rendered proof, and every later rebuild.

Use the installed `Presentations` skill as the primary PowerPoint construction and QA workflow. Use generated imagery only for approved visual assets, never for slide typography or exact scientific copy. The complete-slide `scientific-educational-image-slides` route is retired for PHY4605 because its ImageGen-only typography contract conflicts with editability and deterministic reproduction. Where a generic skill and this specification differ, this project specification governs the course artefact.

The machine-readable companion to this document is `.agent/lecture-slide-system/PHY4605_Lecture_Slide_Tokens.json`. This Markdown specification explains the design and production intent; the token file supplies exact values to builders and validators. If they disagree, stop and reconcile them before authoring.

Use [PHY4605 Course Topic and Difficulty Blueprint](PHY4605_Course_Topic_Blueprint.md) as the source of truth for weekly scope, Core/Working/Stretch classification, the ordinary-pass profile, and the 13-week execution plan. This specification governs how that calibrated content is sequenced, visualised, and produced as slides.

## Normative language

- **Must** and **must not** are acceptance requirements.
- **Should** describes the preferred solution. Depart only when the learning outcome requires it, and record the reason in the deck handoff or QA ledger.
- **May** describes an allowed variation, not a default.

## Design identity and consistency target

Use the standard name **PHY4605 Borderless White Scientific Infographic**.

The intended character is academic, structured, approachable, scientific, and engineering-oriented. The slide should feel like a clear scientific explanation, not a dashboard, software interface, poster, advertisement, or decorative AI image.

The consistency target is:

> The same editable PowerPoint design system, deterministic typography, title family, grid, spacing rhythm, colour semantics, component construction, linework, and reading hierarchy across weeks, while allowing controlled differences only in approved scientific visuals.

Typography, equations, MATLAB code, chart labels, slide numbers, alignment, component geometry, and exact copy must be rendered deterministically. Generated-image variation is acceptable only inside a designated visual frame and only when it does not alter scientific meaning, colour semantics, or reading hierarchy.

Every slide must have one meaningful dominant visual or evidence object that advances the explanation. Do not leave a slide empty or fill space with decorative graphics. All representations of one physical model—illustration, equation, plot, array, code, table, or callout—must agree in sample count, states, directions, variables, colour semantics, and level of abstraction; otherwise the slide must show an explicit mapping. In particular, a one-dimensional vertical-motion `y(t)` model must never be illustrated as unlabelled horizontal projectile travel.

## Learner and difficulty contract

Design every Core deck for second-year physics students who may understand familiar equations but have little or no retained MATLAB knowledge, weak computational decomposition skills, and limited confidence interpreting graphs or error messages.

- A normal lecture deck must contain **12–14 Core teaching slides**, including the opening and recap/exit slide.
- It may contain **0–4 optional appendix slides** for Working exposure or Stretch. These are not part of the default teaching route.
- Introduce no more than **three genuinely new Core ideas** in one week.
- Use one familiar physical model or one tightly connected family of examples across the Core sequence.
- Start with a physical picture, prediction, or measurable question before formal notation.
- Explain every essential Core equation in plain language before using it computationally.
- Show a plain-language algorithm or pseudocode before MATLAB code.
- Use only short, commented code fragments needed for the current reasoning step. Blank-page coding is never a Core lecture expectation.
- Include at least one code-tracing or bounded-modification checkpoint, one graph/table interpretation prompt, and one visible Core validation check.
- Put non-Core material after a divider or at the end under an exact title beginning `Working exposure:` or `Optional stretch:`. Deleting those slides must leave a complete Core argument.
- Do not rely on pre-class preparation. Brief prerequisite repair belongs immediately before the idea that needs it.

## Canonical reference hierarchy

Use the following reference order when a visual judgement is not fully resolved by a numeric rule:

1. **This specification and its machine-readable token file** for all typography, geometry, colour, and acceptance rules.
2. The approved editable title-and-component proof under `.agent/lecture-slide-system/masters/` for Nunito typography, title variants, subtitle contrast, grid, card construction, and component geometry.
3. `First Attempts/Week05/.agent/lecture-slides/raster/slide-05.png` for fine card stroke and pale semantic fill treatment only; it is not a typography reference.
4. `First Attempts/Week05/.agent/lecture-slides/raster/slide-02.png` for restrained workflow rhythm and whitespace only.
5. `First Attempts/Week03/.agent/lecture-slides/raster/slide-01.png` for technical scientific linework and equation-to-diagram balance only.
6. `First Attempts/Week02/.agent/lecture-slides/raster/slide-02.png` for open scientific composition only.

Do not use any archived deck as a typography master. Its title execution varies and predates the Nunito system. The editable master proof and this specification establish the title character and geometry.

Do not use Week 01's brighter saturation, photographic/three-dimensional imagery, or card-heavy composition as a visual default. Week 01 may inform the larger title-region proportions only.

## Non-negotiable editable-first production contract

- The canonical weekly lecture deck must be an editable 16:9 PowerPoint file.
- Titles, subtitles, slide numbers, body text, equations, code, tables, chart labels, axes, units, values, cards, strokes, arrows, warning strips, and takeaway strips must be created deterministically from reproducible source.
- Use native PowerPoint/artifact-tool text, shapes, tables, charts, equations, layouts, and placeholders where practical. A generated visual may remain an image, but its exact labels and teaching copy must remain separate editable objects.
- AI-generated or searched imagery may be used only as an approved visual asset. Request it without slide titles, body copy, labels, axes, legends, equations, code, numbers, or slide furniture. Add all exact labels during deterministic composition.
- Use the mandatory project-local LaTeX asset route for every display equation; do not use an Office equation object for canonical PHY4605 decks. Retain the exact editable TeX source beside the deck source together with the rendered SVG and PNG.
- Every numerical plot, chart, or computed-evidence figure must be generated by MATLAB and saved as PNG from retained MATLAB source and source data. Set the MATLAB title, axis labels, legend, and all figure text explicitly with the LaTeX interpreter. Do not approximate numerical evidence with PowerPoint charts or image generation.
- Do not repair a slide with an untracked overlay. Fix the authoring source and rebuild the PPTX.
- Render every canonical PPTX to 1920 × 1080 slide images for visual QA. These renderings are evidence, not the source of truth.
- A PDF or flattened PPTX may be produced as an optional distribution derivative when cross-device fidelity is required. It must never replace the editable canonical PPTX.
- Keep editable source, visual provenance, generated assets, rendered evidence, derivatives, and QA records under `WeekXX/.agent/lecture-slides/`.
- The PPTX page must be 16:9 wide, normally **13.333333 × 7.5 in**.

## Canvas and exclusion rules

| Property | Locked rule |
| --- | --- |
| Canvas | 1920 × 1080 px, 16:9 landscape |
| Background | Flat pure white `#FFFFFF` |
| Outer edge | Completely borderless |
| Hard safe area | No visible ink closer than 76 px to the left, right, or bottom edge; the only top-edge exception is the main content-slide title, whose visible ink may begin at `y=60` |
| Preferred side margin | 115 px left and right |
| Background decoration | None |
| Branding | No logo, institutional mark, watermark, URL, social handle, or course branding mark |
| Footer | None |
| Visible citations | None; place sources in speaker notes |
| Timing | Never visible; duration remains an internal delivery constraint |
| Slide number | Allowed and specified below; this is the only footer-like visible element |

Never add a frame, keyline, corner bracket, crop-mark treatment, enclosing rounded rectangle, mesh, connected-node motif, molecular motif, grid, paper texture, glow, gradient, coloured wash, vignette, decorative corner illustration, or shadow field behind the content.

## Master coordinate system

All coordinates below are measured on a 1920 × 1080 design canvas. Builders must convert them deterministically to the PowerPoint slide coordinate system while preserving the same proportions. Rendered QA uses this pixel grid as the reference.

### Global zones

| Zone | Coordinates | Use |
| --- | --- | --- |
| Preferred left content edge | `x=115` | Titles, subtitles, cards, diagrams, tables, and strips |
| Preferred right content edge | `x=1805` | Maximum right edge of ordinary content |
| Standard title box | `x=115, y=60, w=1580, h=88` | One-line content-slide title |
| Extended title box | `x=115, y=60, w=1580, h=138` | Approved two-line content-slide title |
| Standard subtitle box | `x=115, y=152, w=1580, h=44` | Subtitle beneath a one-line title |
| Extended subtitle box | `x=115, y=205, w=1580, h=44` | Subtitle beneath a two-line title |
| Standard content area | `x=115, y=225, w=1690, h=690` | Slides with a one-line title/subtitle |
| Extended-title content area | `x=115, y=270, w=1690, h=645` | Slides with a two-line title/subtitle |
| Bottom strip area | `x=115, y=925, w=1560, h=95` | Optional takeaway or warning strip, shortened to clear the slide number |
| Slide-number box | `x=1764, y=976, w=40, h=28` | Slides 2 through the final slide |

The standard content area is a guide, not a card boundary. A flat plot, schematic, or equation may occupy it without being placed inside a panel.

### Spacing tokens

Use the following spacing values instead of inventing arbitrary gaps:

| Token | Pixels | Typical use |
| --- | ---: | --- |
| `space-xs` | 12 | Label-to-icon or compact equation spacing |
| `space-sm` | 20 | Internal spacing in a compact module |
| `space-md` | 32 | Normal card padding and stacked text spacing |
| `space-lg` | 48 | Separation between related modules |
| `space-xl` | 72 | Major content-zone separation |
| `space-xxl` | 90 | Two-column gutter |

Use equal left and right margins for balanced slides. Asymmetry is allowed only when one dominant scientific visual deliberately carries more weight than the supporting explanation.

## Typography system

### Locked font roles

| Role | Required face | Weight | Nominal size at 1920 × 1080 | Colour |
| --- | --- | --- | ---: | --- |
| Main slide title | Nunito | Bold 700 | 68 px; use the fit ladder below | Navy `#0B2B4C` |
| Title-slide title | Nunito | ExtraBold 800 | 82 px; use the title-slide fit ladder | Navy `#0B2B4C` |
| Course tag | Nunito | SemiBold 600 | 26 px | Charcoal `#3F4B57` |
| Subtitle | Nunito | Regular 400 or Medium 500 | 30 px | Charcoal `#3F4B57` |
| Card or module heading | Nunito | Bold 700 | 32–36 px | Navy or one semantic accent |
| Body | Nunito | Regular 400; SemiBold 600 for selective emphasis | 26–30 px | Charcoal `#3F4B57` |
| Small diagram/table label | Nunito | SemiBold 600 | 22–24 px | Charcoal or semantic accent |
| Display equation asset | Project-local LaTeX render (transparent SVG/PNG) | MathJax/TeX output | 40–48 px equivalent; PNG render scale ≥ 6 | Navy `#0B2B4C` unless semantic validation/comparison colour is required |
| MATLAB code | IBM Plex Mono | Regular 400; SemiBold 600 for exact emphasis | 25–28 px | Navy `#0B2B4C` |
| Takeaway/warning | Nunito | Bold 700 | 30–34 px | Navy or caution red |
| Slide number | Nunito | Medium 500 | 22 px | Muted charcoal `#697684` |

Do not substitute Nunito Sans, Arial Rounded, Aptos, Calibri, Roboto, or another visually similar face. Do not mix title families within one deck or between newly produced weeks.

### Font asset and substitution control

- Required title/body family: official Nunito variable font, including weights 400, 500, 600, 700, and 800.
- Required code family: IBM Plex Mono Regular and SemiBold.
- Store approved font files and their licences under `.agent/lecture-slide-system/fonts/`; do not depend only on whichever fonts happen to be installed on the authoring computer.
- Run a font preflight before building or rendering. If Nunito or IBM Plex Mono is unavailable to the builder or renderer, stop. Do not silently substitute another font.
- Use the same approved font files on every computer that builds the course decks.
- Embed fonts in the editable PPTX when the production tool and font licence support verifiable embedding. When embedding cannot be verified, retain the font manifest and offer a PDF derivative for distribution fidelity.
- Never claim that fonts are embedded merely because the deck renders correctly on the authoring computer.

### Title fit ladder

The title region is larger and more flexible than the original Week 05 rule, but it is not freely resizable. Use only these variants:

| Variant | Conditions | Size | Box | Content top |
| --- | --- | ---: | --- | ---: |
| `T1 Standard` | Fits naturally on one line | 68 px | Standard title box | 225 px |
| `T2 Long one-line` | Requires modest reduction to remain one line | 62 px | Standard title box | 225 px |
| `T3 Two-line` | Cannot remain readable on one line at 62 px | 56 px | Extended title box | 270 px |

Rules:

- Use sentence case.
- Use Nunito Bold 700 with the same width, weight, tracking, and line spacing for every content-slide title.
- Keep the title left-aligned at `x=115`.
- Never centre a title or place it in a banner, card, coloured block, or decorative frame.
- Use no more than two lines.
- Do not enlarge a short title beyond the `T1` size to fill unused space.
- Do not shrink below 56 px. Shorten the title if it still does not fit.
- The title must not end with a full stop, colon used merely as decoration, or other terminal punctuation. Necessary question marks are allowed.
- Use the title-contact-sheet QA gate before accepting a deck.

Assign the title variant explicitly in the slide manifest. The builder must not silently choose a smaller size. A one-line title that wraps, clips, or overflows fails; shorten the title or deliberately promote it to `T3` and rebuild.

### Subtitle rules

- A subtitle is optional and must be included only when it contributes a distinct teaching point, condition, or context that the title does not already express.
- Do not invent a subtitle simply to fill the band.
- Use one line whenever possible and never more than two short lines.
- Use Nunito Regular 400 or Medium 500.
- Keep the subtitle left-aligned with the title.
- Do not end it with a full stop.
- If no subtitle is used, retain the title geometry and move the content top up only to `y=195`; do not vertically centre the title band.

### Body-copy rules

- Write for students, not for the slide-production process.
- Prefer a short claim, labelled visual, formula, or evidence statement over a paragraph.
- Use selective bold for hierarchy; do not bold entire body paragraphs.
- Use sentence case for headings and labels unless a physical symbol or MATLAB identifier requires exact casing.
- Avoid decorative all-caps. Short technical labels such as `INPUT`, `CHECK`, or `FAIL` may use capitals when they function as compact tags.
- Preserve approved equations, variables, subscripts, superscripts, signs, units, decimal places, and MATLAB syntax exactly.
- Do not expose teaching timings, production prompts, source labels, QA notes, or internal planning language.

## Opening-slide master

Every weekly lecture deck must use the same opening-slide family:

+ Course tag: exactly `PHY4605 Computational Methods in Physics` in Title Case at `x=115, y=126`.
+ Main title: the individual deck title in Title Case, left aligned in Nunito ExtraBold 800. The master exemplar is `Physics to Arrays and Plots`; a line break may be inserted only to fit the fixed title box.
- This Title Case rule applies only to the opening slide; content-slide titles remain in sentence case.
- Title box: `x=115, y=245, w=1080, h=210`.
- Title-slide fit ladder: 82 px for one or two short lines, 74 px for a longer two-line title, and 66 px only when essential. Never use a fourth size.
- Week subtitle: `Week N | [short topic-specific tagline]` at `x=115, y=475, w=1180, h=80`, 34 px Nunito Medium 500 charcoal. The master exemplar is `Week 1 | From Motion to MATLAB`.
- Hero scientific schematic: normally `x=1230, y=175, w=545, h=570`.
- The hero must be a clean functional scientific diagram, plot, equation-led illustration, instrument schematic, or approved `PHY4605 Matte Scientific Cutaway` visual. It must not be a photorealistic scene, dramatic 3D render, decorative stock image, or generic AI artwork.
- Optional bottom theme line: one short three-to-five-part learning chain may appear at `x=115, y=860, w=1500, h=70` when it genuinely orients the week.
- Do not place a slide number on the opening slide.
- Do not add learning-outcome lists, agenda cards, multiple callouts, or a problem worksheet to the opening slide.

## Colour system

### Locked semantic palette

| Role | Main stroke/text | Pale fill | Meaning |
| --- | --- | --- | --- |
| Navy primary | `#0B2B4C` | `#F4F8FC` | Titles, equations, primary structure, core method |
| Charcoal neutral | `#3F4B57` | `#F7F9FB` | Body copy, axes, neutral explanation |
| Model blue | `#2F6DB2` | `#EEF5FD` | Physical model, data, residual, primary numerical object |
| Valid teal | `#2A9D9F` | `#F0FAF7` | Assumptions, validation, checks, conservation |
| Valid green | `#3E8E45` | `#F0FAF7` | Pass state, acceptable result, guarantee |
| Evaluation gold | `#C98A16` | `#FFF7E6` | Numerical choice, iteration, comparison, efficiency |
| Caution red | `#B3262E` | `#FFF2F2` | Failure, invalid assumption, risk, warning |
| Secondary purple | `#6F4B9B` | `#F5F1FB` | One genuinely distinct secondary solver or category |
| Light rule | `#AAB4BE` | — | Neutral fine outlines and separators |
| Plot grid | `#DDE5EC` | — | Sparse chart gridlines only |

Use colour by meaning, not by slide number or decoration. The same concept must retain the same semantic colour throughout a deck.

Use only pale fills. Do not use saturated full-card backgrounds, dark title banners, multicolour gradients, neon colours, glass effects, or decorative rainbow sequences. Red must be reserved for a real warning or failure. Purple must not become a routine fifth accent.

## Component construction

### Cards and modules

- Cards are supporting structures, not the default composition.
- Prefer one dominant scientific explanation with no more than two or three supporting modules.
- Use a card only when it groups related information, distinguishes alternatives, contains code/table content, or isolates a validation/warning claim.
- Normal card stroke: 2 px.
- Normal corner radius: exactly 22 px for deterministic components.
- Card fill: white or the appropriate locked pale semantic fill.
- Shadow: none. A visible shadow fails QA.
- Internal padding: normally 32 px; never less than 24 px.
- Card headings must align with the body or diagram beneath them.
- Avoid nested cards, UI-like pills, tabs, buttons, badges, and navigation chrome.

### Scientific linework

- Use clean 2D line diagrams and schematic illustrations.
- Primary diagram stroke: 4 px.
- Secondary construction line: 2–3 px.
- Arrow stroke: 4–5 px with simple triangular heads and rounded caps.
- Chart axes: 3 px charcoal.
- Primary data/model curve: 4 px.
- Secondary/reference curve: 3 px, using a distinct semantic colour or restrained dash pattern.
- Gridlines: 1 px plot-grid colour and only when they help read values.
- Avoid fake perspective, 3D charts, realistic lighting, textured materials, decorative particles, and photorealistic backgrounds.

### Generated illustration system: PHY4605 Matte Scientific Cutaway

All generated illustrations across the master and weekly decks must use one locked visual language named `PHY4605 Matte Scientific Cutaway`.

- Use a pure white or transparent-compatible background and an orthographic, restrained 2.5D view. Avoid cinematic perspective or dramatic camera angles.
- Render physical objects as simple matte forms with soft upper-left illumination. Subtle form shading and a diffuse contact shadow are permitted only inside the generated asset to improve legibility; slide-level glows, shadows, and decorative lighting remain prohibited.
- Use matte cobalt/model blue for the principal physical object, navy for dashed paths and technical construction lines, pale blue for ground pads and guides, charcoal for neutral forces, gold for one comparison or peak emphasis, and teal only for a validated state or result.
- Keep scientific geometry literal and sparse. Arrows must have a clear physical direction, trajectories must be coherent, repeated objects must preserve scale, and the illustration must teach one identifiable relationship at its final crop size.
- Use no embedded title, prose, label, number, unit, equation, code, axis, legend, logo, watermark, border, panel, or slide furniture. Add exact teaching copy as editable PowerPoint objects.
- Do not mix this system with flat emoji-like icons, glossy 3D icons, photorealism, paper cut-outs, cartoons, neon glow, lens flare, textured materials, gradients, or generic decorative AI motifs.
- Use no more than one generated illustration frame per slide by default. Each slide receives a purpose-built asset rather than reusing one illustration as decoration.
- Preserve the same projection, light direction, matte object treatment, line weight, colour semantics, and whitespace character across every weekly deck.

Generated-illustration QA fails when the physical relationship is ambiguous, arrows or trajectories are inconsistent, object counts are wrong, text artefacts appear, the final crop hides essential geometry, or the asset visibly departs from the locked style.

### Iconography

- Use one coherent outline-icon family with approximately 3 px line weight.
- Use icons only when they clarify meaning faster than a label or diagram.
- A normal icon backplate is a pale circle 56–68 px in diameter.
- Use no more than one icon per supporting module unless the slide is an explicit numbered process.
- Do not mix outline, filled, emoji-like, photorealistic, and 3D icon styles.
- Do not use decorative icons merely to occupy whitespace.

### Equations

- Every display equation must be a deterministic LaTeX-rendered asset produced with the installed `render-equations-diagrams` skill. Do not use plain PowerPoint text, Unicode substitutions, or ImageGen for mathematical equations.
- For this contract, **display equation** includes a standalone formula, equation fragment, indexed expression, symbol with a subscript/superscript, or symbol-plus-unit expression that is presented as teaching mathematics (for example `t=0\,\mathrm{s}`, `y=0\,\mathrm{m}`, `v_0`, or `\mathrm{m\,s^{-2}}`). It does not include ordinary prose, MATLAB code, or chart axis/legend text whose editability is part of the chart object.
- Retain exact human-editable TeX source beside transparent SVG and high-resolution transparent PNG outputs under the deck's hidden `.agent/` folder. Prefer SVG only when `@oai/artifact-tool` and PowerPoint preserve it reliably; otherwise use the PNG fallback. Insert the chosen output as one equation asset and keep surrounding explanatory labels editable PowerPoint objects.
- Record equation provenance in speaker notes and the QA ledger: exact TeX, renderer, output paths, foreground colour, target display size, crop/fit mode, alt text, and whether SVG or PNG was used. Do not use equation assets for MATLAB code or ordinary prose. Reuse the same asset for repeated identical mathematics when that preserves consistency.
- Use navy `#0B2B4C` by default unless a semantic equation role requires another locked palette colour. Keep symbols, primes, brackets, superscripts, subscripts, mathematical minus signs, equality signs, and units exact.
- A central equation should normally be 40–48 px and may be larger only on an equation-led light slide. Do not put every equation in a box. Use a pale card only when the equation is the central model, residual, update rule, or conclusion.
- Pair an equation with a physical diagram, variable map, algorithmic consequence, or validation claim when that connection advances the learning outcome.

### MATLAB code

- Use IBM Plex Mono Regular at 25–28 px. Use IBM Plex Mono SemiBold only to emphasise one exact operator, variable, or defect.
- Keep code left aligned and preserve exact MATLAB punctuation.
- Use a pale navy or neutral code card with a 2 px outline; do not imitate a full editor window unless the editor interface itself is the teaching object.
- Show only the lines needed for the current claim.
- Do not use tiny multi-colour syntax highlighting. Restrained blue, teal, gold, or red emphasis may identify one exact term, check, or defect.

### Tables

- Use a navy header row only when the table is the main evidence object and the white header text remains readable.
- Otherwise use a white or pale header with a 2 px navy rule.
- Body text must remain at least 22 px.
- Keep unit-bearing column headings explicit.
- Prefer four or fewer columns on a standard slide. A dense evidence slide may use five columns only when each entry remains readable.
- Use semantic colour to identify conclusions, not to colour every row.

### Charts

- Charts must answer a question or support a claim; they must not be decorative.
- Label axes with quantity and unit.
- Use direct labels when there are three or fewer series; otherwise use one compact legend.
- Use no more than four series on one plot.
- Show important reference values, limiting behaviour, error trend, or validation thresholds when relevant.
- Do not use 3D charts, filled-area decoration, excessive gridlines, tiny legends, or ornamental data markers.

### Takeaway and warning strips

- Use a bottom strip only when the slide has one conclusion, control, or warning students should retain.
- Do not force a strip onto every slide.
- Use the locked bottom strip area `x=115, y=925, w=1560, h=95` so the slide number remains separate.
- Use a 22 px radius, 2 px stroke, and no shadow.
- Normal takeaway: pale navy or pale green fill with navy or green text.
- Warning: pale red fill with caution-red text.
- Keep the statement to one concise sentence, normally no more than 16 words.
- Do not repeat the title or subtitle in the strip.

### Slide numbers

- Number slides 2 through the final slide. Omit the number on the opening slide.
- Place the editable number at `x=1764, y=976, w=40, h=28` on the relevant slide layout.
- Use Nunito Medium 500, 22 px, muted charcoal `#697684`, right aligned.
- Use the integer only: `2`, `3`, `4`; do not use `02`, `2/18`, `Slide 2`, a circle, a box, or a separator line.
- Do not move the number to accommodate content. Shorten or rearrange the content instead.

## Approved layout archetypes

Choose the layout that teaches the idea most directly. Vary silhouettes across adjacent slides while preserving the same master grid and component construction.

| Archetype | Use | Geometry and restrictions |
| --- | --- | --- |
| Opening master | Weekly opener | Use the fixed opening-slide master above |
| Dominant explainer | One main physical or numerical idea | Dominant visual uses about 60–70% of the content area; one or two supporting labels/modules use the remainder |
| Two-column explanation | Model + consequence, diagram + equation, code + evidence | Left `x=115, w=800`; right `x=1005, w=800`; 90 px gutter |
| Comparison | Two alternatives or two forms of evidence | Two equal columns or cards; align equivalent elements horizontally; conclude only when needed |
| Three-part reasoning | Model, method, validation or three evidence categories | Three zones, about 500 px each, at `x=115, 710, 1305`; avoid filling all three with prose |
| Pipeline | Transformation or workflow | Four to six compact stages across the content width; stages may be unboxed when linework is clearer; arrows must establish one reading direction |
| Numbered process | Procedure or derivation | Three to six stages; consistent numbers and icon treatment; do not turn every step into a dense card |
| Layered concept | Taxonomy, hierarchy, or increasing abstraction | Stacked bands, nested forms, progressive rows, or one central model with labelled layers |
| Evidence plot | Convergence, error, residual, trajectory, uncertainty | Plot is dominant; supporting explanation is limited to one or two modules plus an optional takeaway |
| Dense evidence board | Optional method table, multi-check validation, or failure diagnosis | Four to six tightly related modules; use the dense rules below; never imitate a dashboard; normally appendix-only |
| Caution / failure | Failure modes and controls | One dominant failure mechanism plus up to three supporting diagnoses; reserve red for the failure and correction boundary |
| Recap / bridge | Synthesis, practical transfer, or capstone connection | One compact course reasoning chain plus no more than three transfer claims |

Do not repeat the same silhouette for more than two consecutive slides unless the content is an intentional paired comparison.

## Density modes

Core slides default to Light or Standard. Dense slides are permitted mainly for optional evidence, comparisons, or extension material and must remain deliberate and readable.

| Mode | Content budget | Typography and composition rule | Typical use |
| --- | --- | --- | --- |
| Light | 15–30 short words beyond labels | One dominant visual; at most two supporting modules; generous whitespace | Opening, prediction, transition, key concept |
| Standard | 30–55 short words beyond labels | One dominant explanation plus up to three modules | Default teaching slide |
| Dense | 55–75 short words beyond labels | Four to six tightly related modules, or one detailed table/matrix/plot plus evidence annotations; body never below 24 px | Optional code audit, method comparison, validation ledger |

Rules for dense slides:

- A dense slide must still have one primary claim.
- Do not shrink body text below 24 px or labels below 22 px.
- Do not use a Dense slide in the Core route unless the lecturer explicitly approves it as unavoidable.
- Never use more than one Dense slide consecutively.
- Follow a Dense slide with a Standard or Light interpretation/checkpoint slide.
- Split the slide if the reading order is not obvious within three seconds at contact-sheet scale.
- Dense is a content mode, not permission to use saturated colour, smaller margins, nested cards, or dashboard styling.

## Teaching grammar

Every deck must make the course reasoning chain visible across the full sequence:

`physical model -> scale and units -> discretisation -> algorithm -> code -> error/uncertainty -> validation -> physical interpretation`

Every individual slide should advance one part of that chain through one clear learning job. Use prediction, checkpoint, modification, interpretation, practical transfer, and exit-ticket slides where they serve the weekly learning outcome.

Prefer formulas, diagrams, plots, tables, checklists, labelled flows, comparisons, and short evidence statements over paragraphs. A graph alone is not evidence: pair numerical output with the model, units, method choice, residual, convergence, conservation, limiting case, or reference result required to interpret it.

For the Core route, prefer this teaching grammar:

`physical picture/question -> equation in words -> variables and units -> pseudocode -> short MATLAB fragment -> visible output -> one validation -> physical interpretation`

Do not introduce new mathematical notation, new MATLAB syntax, and a new numerical method on the same slide. If two representations must appear together, make the mapping between them the slide's only learning job.

## Production skill routing

| Need | Required route | Responsibility |
| --- | --- | --- |
| Editable PowerPoint construction, masters, layouts, notes, rendering, and overflow QA | Installed `Presentations` skill using `@oai/artifact-tool` | Primary and mandatory deck-production authority |
| PPTX structure, font, text, shape, notes, and OpenXML inspection | Installed `officecli` skill | Secondary inspection and repair aid; it does not replace rendered visual QA |
| Exact equations and agent-authored scientific diagrams | Installed `render-equations-diagrams` skill | Produce editable TeX/scene source plus SVG/PNG assets; retain source under `.agent/` |
| Complex scientific illustration where generated imagery materially improves understanding | `imagegen` or the installed `scientific-schematics` skill | Produce visual-only assets; remove or avoid embedded labels and add exact labels in PowerPoint |
| Numerical plots and computed evidence | MATLAB and the relevant MATLAB chart workflow | Produce verified plots from retained code and data; do not approximate evidence with image generation |
| Complete ImageGen slide | Not permitted | The former `scientific-educational-image-slides` full-slide route conflicts with the editable-first contract |

External PPTX skills may inform the workflow, but they must not silently replace the installed `Presentations` runtime, the project master, or this schema. Do not install another skill merely to generate a weekly deck unless the lecturer explicitly approves the dependency.

## Deck-level production workflow

### 1. Lock the content manifest before authoring

For each slide, record in one compact machine-readable manifest:

- slide number;
- difficulty tier: Core, Working exposure, or Stretch;
- one learning job and one primary claim;
- exact title and explicit `T1`, `T2`, or `T3` variant;
- optional exact subtitle;
- density mode and layout archetype;
- exact visible copy;
- approved equations, values, units, symbols, code, and validation evidence;
- required visual asset type and provenance;
- optional takeaway or warning;
- speaker-note intent and `[Sources]` block.

Approve the Core sequence before producing visual assets or building the PPTX. Confirm that it contains 12–14 slides, no more than three genuinely new ideas, a complete physics-to-interpretation chain, one bounded student action, and one Core validation. Appendix slides must not be needed to understand or complete the Core route.

### 2. Establish the reusable editable master once

Before the first new weekly deck under this system:

1. Build one editable proof deck containing the opening master, `T1`, `T2`, and `T3` title variants, subtitle treatment, body hierarchy, module heading, MATLAB code, equation, plot, comparison, validation, and generated-visual frame.
2. Use Nunito and IBM Plex Mono from the approved font assets and run font-substitution preflight.
3. Render the proof deck and inspect every representative slide at full size.
4. Create a title contact sheet and a component contact sheet.
5. Obtain lecturer approval of the proof deck before producing a weekly deck.
6. Save the approved master, token file, rendered proofs, and approval record under `.agent/lecture-slide-system/masters/`.

The approved master owns the theme fonts, background, title band, slide-number position, grid, reusable layouts, colour palette, and component styles. Weekly decks must reuse the master/layout hierarchy rather than reproduce it from memory or from copied screenshots.

### 3. Produce functional visual assets

- Use an existing verified figure when it already communicates the idea clearly.
- Use MATLAB for numerical plots and data-bearing evidence.
- Use the mandatory LaTeX equation-asset route for every display equation, retaining TeX/SVG/PNG provenance locally.
- Use PowerPoint shapes for simple editable flows, comparisons, arrows, and annotations.
- Use generated imagery only when it provides a meaningful physical or conceptual visual that cannot be communicated as clearly with the simpler routes.
- Request generated visuals at the aspect ratio and composition required by their final frame.
- Generated visuals must not contain slide titles, paragraphs, labels, axes, legends, equations, code, numerical values, logos, watermarks, or slide furniture.
- Inspect each visual at its final displayed size and reject blurred, distorted, generic, decorative, scientifically misleading, or stylistically inconsistent assets.
- For generated illustrations, use the approved master asset or another accepted `PHY4605 Matte Scientific Cutaway` image as a style reference. Change the scientific composition while preserving the locked projection, light direction, matte treatment, palette, and whitespace.

### 4. Build the editable canonical PPTX

- Use the installed `Presentations` skill and `@oai/artifact-tool`.
- Reuse the approved master and layouts. Edit the master only for intentional course-wide changes.
- Keep titles, body copy, labels, code, simple shapes, and slide numbers editable wherever practical. Equation editability is retained through the adjacent TeX source; do not substitute a fragile PowerPoint-text equation.
- Place generated or sourced visuals in defined image frames without stretching or unintended cropping.
- Use one composition per slide rather than a dashboard of cards.
- Vary adjacent silhouettes using the approved archetypes while preserving the master grid and typography.
- Add speaker notes separately. Notes may contain teaching prompts, transitions, and `[Sources]` blocks.
- Keep all intermediate source, visual prompts, asset provenance, and build records under the week's hidden `.agent/lecture-slides/` hierarchy.

### 5. Run the paired generation-and-audit loop

Every new deck and every material slide revision must use two distinct agent roles:

- **Generator:** owns the editable source, approved assets, PPTX build, and revision implementation.
- **Auditor:** remains read-only, independently reviews the rendered deck and supporting QA evidence, and returns an evidence-based pass/fail critique. The auditor must not repair its own findings.

Use **Terra Medium** (`gpt-5.6-terra`, `medium`) for the generator and **Sol Medium** (`gpt-5.6-sol`, `medium`) for the read-only auditor. The coordinator integrates accepted findings but does not replace the independent audit. Record the exact model and effort used for every round in the ledger.

Use no more than three generation-and-audit rounds for one deck version:

1. The generator builds or revises the deck and renders every affected slide.
2. The auditor checks instructional coherence, scientific meaning, representation mapping, title/schema compliance, visual consistency, typography, crop quality, density, and projection readability.
3. The generator resolves every accepted finding in the editable source and rebuilds; it must not patch only the raster proof.
4. Repeat only when the auditor identifies a material remaining defect. Stop early when the auditor passes the deck.
5. After the third audit, stop editing. If a material disagreement or defect remains, record it and request lecturer direction rather than entering an unbounded revision loop.

The auditor must explicitly test whether multiple representations on the same slide work together. If an illustration, plot, array, equation, or code fragment depicts the same phenomenon, their sample counts, states, directions, colour meanings, labels, and highlighted moments must agree—or the mapping between different levels of abstraction must be made visually explicit. Redundant or apparently contradictory representations fail QA. The auditor must inspect every rendered slide at full size for unintended overlap, clipping, odd visual occurrences, uneven element distribution, and excessive or awkward unused whitespace; a contact sheet is only a deck-level supplement.

Retain a compact round ledger under the deck's hidden QA folder containing the round number, generator change, auditor verdict, accepted findings, rejected findings with reasons, and final status. The coordinator owns integration and the final decision; the two roles must not silently merge into one self-review.

### 6. Render, inspect, repair, and rebuild

- Render every slide from the canonical PPTX.
- Inspect every slide individually at full size; a contact sheet alone is insufficient.
- Run overflow, overlap, clipping, title-wrap, font-substitution, placeholder, and slide-count checks.
- Create full-deck and title-region contact sheets.
- Fix the editable source and rebuild. Do not patch only the rendered proof.
- Record the exact canonical PPTX hash or build identifier used for the final QA so approval cannot be reused after a later rebuild.

### 7. Produce optional distribution derivatives

- Export a PDF when students need pixel-stable viewing or printing.
- Create a flattened PPTX only when a presentation computer cannot be trusted to preserve the required fonts or layout.
- Mark derivatives clearly in filenames and QA records.
- Never treat a PDF or flattened PPTX as the editable source of truth.

## Generated-visual prompt scaffold

Use this scaffold only when a generated visual asset is justified. Do not use it to generate a complete slide.

```text
Use case: visual asset for a PHY4605 scientific-educational PowerPoint slide
Learning job: [one sentence]
Asset frame: [exact aspect ratio and intended placement]
Functional visual: [specific physical system, apparatus, process, or concept]
Scientific controls: [exact relationships, direction, components, signs, and exclusions]
Visual language: clean 2D scientific illustration; white or transparent-compatible background;
orthographic restrained 2.5D matte scientific cutaway; soft upper-left illumination; subtle diffuse
contact shadow; navy technical linework with only the approved semantic accent colours; no decorative scene.
Composition: [required focal area, whitespace, and placement for later editable labels]
Constraints: visual only; no title, subtitle, paragraph, label, number, unit, equation, code,
axis, legend, logo, watermark, URL, footer, frame, gradient, photorealistic background,
or invented scientific element.
```

For slide edits, fix the editable source and preserve all unrelated master/layout properties. For generated-visual edits, state the exact asset elements that must remain unchanged and the exact visual defect to correct.

## Required QA gates

### Slide-level visual QA

Inspect every slide at full size and verify:

1. PPTX page is 16:9 and the rendered proof is exactly 1920 × 1080.
2. Canvas is pure flat white and borderless.
3. No excluded background, branding, footer, citation, timing, or decorative element is present.
4. Actual visible ink respects the 76 px left/right/bottom hard safe area and the title-only `y=60` top exception.
5. Title uses Nunito Bold 700, the approved master/layout, and the correct `T1`, `T2`, or `T3` geometry.
6. Subtitle is optional, distinct in meaning, uses the approved Nunito supporting role, is correctly positioned, and has no terminal full stop.
7. Slide number is correct, consistently positioned, and absent only on the opening slide.
8. Body, equations, code, tables, axes, units, and labels are readable at projection scale.
9. Unit and equation assets use visually normalized display sizes; no short unit such as `s` or `m` appears disproportionately large relative to longer units.
9. Every word, symbol, number, unit, sign, subscript, superscript, and punctuation mark matches the approved copy.
10. Colour follows the semantic mapping.
11. Cards use the approved stroke, radius, fill, and zero-shadow treatment.
12. Icons and diagrams use consistent 2D outline linework.
13. Reading order and the single primary claim are obvious.
14. Scientific relationships, arrows, plots, and validation evidence are correct.
15. No unrequested text or invented decorative element is visible.
16. Titles, body copy, labels, code, simple shapes, and slide numbers remain editable in the canonical PPTX wherever practical.
17. No unapproved font substitution occurred during build or render.
18. Generated or sourced visuals contain no embedded slide copy that should have been editable.
19. Every display equation is a LaTeX-rendered asset with verified TeX/SVG/PNG provenance, correct colour and target crop, useful alt text, and legible symbols, subscripts, superscripts, and mathematical minus signs at final projection size.

### Title-contact-sheet gate

Before a deck can be accepted:

1. Crop or display the title region of every slide at the same scale in one contact sheet.
2. Compare Nunito family, title weight, navy colour, left anchor, top anchor, line spacing, subtitle family, and subtitle gap.
3. Confirm that every title uses only `T1`, `T2`, or `T3` and that each size change is justified by fit.
4. Reject and rebuild any slide whose title uses a different face, weight, tracking, alignment, or layout, even when all other content is correct.
5. Retain the title contact sheet under `WeekXX/.agent/lecture-slides/qa/`.

The title-contact-sheet gate remains mandatory even with deterministic typography because title variant selection, wrapping, alignment, and layout inheritance can still drift.

### Deck-level consistency QA

Review the full contact sheet and verify:

- the opening slide follows the fixed opening master: `course-tag` is exactly `PHY4605 Computational Methods in Physics` in Title Case; `opening-title` is the individual deck title in Title Case; and `opening-subtitle` is `Week N |` followed by a concise topic-specific tagline;
- the Core route contains 12–14 slides and appendix content does not interrupt it;
- the Core route introduces no more than three genuinely new ideas;
- every optional slide begins with `Working exposure:` or `Optional stretch:` and can be deleted without breaking the Core route;
- adjacent silhouettes vary without changing the design language;
- standard, light, and dense slides retain the same margins and typography;
- Core slides are Light or Standard unless an approved exception is recorded;
- no Dense slides occur consecutively;
- semantic colours mean the same thing throughout;
- cards do not become the default visual treatment;
- takeaways appear only when a memorable claim exists;
- slide numbers form a stable lower-right rhythm;
- equations, code, plots, and diagrams share consistent linework and scale;
- the deck moves through the PHY4605 reasoning chain and ends with synthesis, transfer, or a defensible next action.
- the Core route includes a physical entry point, plain-language equation, pseudocode, short code, bounded action, graph/table interpretation, one validation, and physical conclusion.

### PPTX structural QA

Verify programmatically that:

- slide count matches the approved plan;
- Core and optional slide counts match the approved 12–14 plus 0–4 contract;
- slide aspect ratio is correct;
- the approved master and layouts are used rather than manually recreated title bands;
- theme and object fonts resolve to Nunito and IBM Plex Mono; display equations resolve to project-local LaTeX assets rather than a PowerPoint equation font;
- every slide title is an editable text object using its explicit `T1`, `T2`, or `T3` variant;
- body text, code, tables, chart labels, simple diagrams, and slide numbers remain editable wherever practical;
- generated and sourced images occupy only their intended visual frames;
- no unresolved placeholders, hidden duplicate text, off-canvas objects, unintended overlaps, or clipping remain;
- every numerical plot is a retained MATLAB-generated PNG with LaTeX-interpreted title, axes, legend, and text;
- speaker notes are present when required;
- slide numbers use the approved editable layout object;
- optional PDF or flattened-PPTX derivatives correspond to the accepted canonical PPTX build.

## Acceptance record

Do not call a deck complete until all required QA gates pass. Record:

- final PPTX path;
- rendered QA directory;
- slide count;
- Core slide count and optional appendix count;
- Core new-idea count;
- full-size visual inspection result;
- title-contact-sheet result;
- exact-copy/scientific QA result;
- editability and structural check result;
- font preflight and substitution result;
- optional derivative paths and their relationship to the canonical PPTX, or `none`;
- known limitations or `none`.

Include this exact delivery statement:

> The canonical deck uses editable deterministic Nunito typography and approved visual assets; any PDF or flattened PPTX is a distribution derivative, not the source of truth.
