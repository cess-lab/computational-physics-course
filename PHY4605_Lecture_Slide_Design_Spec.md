# PHY4605 Lecture Slide Deck Design Specification

This is the project-wide source of truth for the visual design of future PHY4605 lecture slide decks. It applies to every weekly deck, its raster slide sources, and any rebuild generator. It complements the scientific-educational-image-slides skill and the project requirements in AGENTS.md.

## Design identity

Use the standard name **PHY4605 Borderless White Scientific Infographic**. The intended character is academic, structured, approachable, scientific, and engineering-oriented. Keep the visual identity stable while allowing the slide architecture to change with the learning outcome.

## Visual tokens

- **Canvas:** 16:9 landscape, pure white (#FFFFFF), with generous safe margins.
- **Outer-edge rule:** never add an outer border, frame, keyline, corner bracket, crop-mark treatment, or enclosing rounded rectangle around a slide.
- **Background rule:** the canvas must remain completely plain white. Do not add a mesh, connected-node/network motif, molecular pattern, grid, watermark, texture, illustration, gradient, glow, coloured wash, or decorative corner element behind the content.
- **Navy:** #0B2B4C for titles, borders, equations, code, and primary panels.
- **Charcoal:** #3F4B57 for subtitles, body copy, and secondary labels.
- **Model blue:** #2F6DB2 for data, models, and primary scientific content.
- **Teal/valid green:** #2A9D9F or #3E8E45 for assumptions, checks, validity, and benefits.
- **Evaluation gold:** #C98A16 for numerical choices, comparisons, and evaluation.
- **Caution red:** #B3262E for warnings, failure modes, and critical controls.
- **Secondary purple:** #6F4B9B, used sparingly for a genuinely distinct secondary category.
- **Cards and panels:** use 2–4 rounded white or very pale cards with fine navy or grey outlines, consistent corner radius, clear gutters, and minimal shadow. Avoid gradients, glossy effects, heavy shadows, and decorative elements that do not support the explanation.
- **Iconography:** use consistent outline-style scientific icons in pale circular backplates only when they clarify a concept.

## Typography system

- **Main display font:** Roboto Condensed Bold for every slide title, numbered process label, and prominent takeaway or warning text. If exact font targeting is unavailable in the raster generator, use one visually equivalent bold condensed sans-serif consistently throughout the complete deck; never vary between condensed, geometric, serif, script, rounded, or playful title styles.
- **Supporting font:** Roboto Regular or Medium for subtitles, body text, card headings, labels, tables, and annotations.
- **Code font:** Roboto Mono or IBM Plex Mono for MATLAB code, assertions, and command snippets. Code must remain monospace, copyable in the source, and readable at projection distance.
- **Equation font:** STIX Two Math or Cambria Math for mathematical notation when the raster workflow permits font targeting. Preserve approved symbols, subscripts, superscripts, and units exactly.
- **Hierarchy:** use no more than two primary font families, plus the monospace and mathematics roles when needed. Prefer left alignment, short lines, consistent line spacing, and selective bold for hierarchy or keywords. Do not use excessive all-caps.
- **Locked title treatment:** place every main title at the same upper-left anchor, approximately 6% from the left edge and 5.5% from the top edge. Use Roboto Condensed Bold, sentence case, navy `#0B2B4C`, the same visual weight and line spacing, and no more than two lines. For a 1920×1080 source, use a nominal 68 px title size; reduce only enough to fit an unusually long title, never change the font family or weight. Do not centre titles or place them inside banners, cards, coloured blocks, or decorative frames.
- **Locked subtitle treatment:** place the subtitle directly below the title at the same left anchor. Use Roboto Medium, muted charcoal `#3F4B57`, a nominal 30 px size at 1920×1080, and consistent spacing from the title. Omit the subtitle rather than inventing one.
- **Title-slide exception:** the opening slide may use a larger title size, but it must retain the same Roboto Condensed Bold family, navy colour, left alignment, plain-white canvas, and borderless treatment.
- **Raster starting scale:** for a 1920×1080 source image, start near 60–76 px for titles, 26–32 px for subtitles, 24–30 px for body text, 30–38 px for card headings, 23–27 px for code, and 28–34 px for warning strips. These are legibility starting points, not rigid values; projection readability takes priority.

Because the final visible slide is a raster image, every ImageGen prompt must repeat the locked title, subtitle, canvas, outer-edge, and background rules above. QA should compare the title band across the full deck for family, weight, colour, anchor, line spacing, and subtitle gap; raster outputs do not provide reliable embedded-font metadata.

## Composition and teaching grammar

- Use one central explainer plus 2–4 clearly bordered modules, with strict left alignment and generous whitespace.
- Prefer formulas, diagrams, tables, checklists, labelled flows, comparisons, and short callouts over paragraphs.
- Use one main learning outcome per slide and keep the reading order obvious.
- Use a bottom takeaway or warning strip when one physical, numerical, or reproducibility control should be remembered.
- Keep functional scientific imagery—objects, charts, matrices, curves, code, or diagrams—rather than decorative backgrounds.
- Regenerate or simplify a slide if text becomes too small, clipped, crowded, or scientifically ambiguous.

### Slide archetypes

Choose the architecture that most directly teaches the idea:

| Archetype | Use for | Composition |
| --- | --- | --- |
| Pipeline | Transformations or workflows | Inputs on the left, model/process in the centre, outputs on the right, with arrows between stages. |
| Layered concept | Taxonomies or abstractions | Nested circles, stacked bands, or progressive rows leading to a definition or output. |
| Comparison | Distinctions and choices | Two or three balanced cards with clear visual contrast and a concluding rule. |
| Numbered process | Procedures and derivations | Three to six numbered stages, each with an icon, compact visual, and one action. |
| Caution | Mistakes, failure modes, and controls | Three to six risk cards, a red warning band, and a prevention rule. |
| Recap / bridge | Session close or lab connection | A compact flow plus panels for what was learned and what comes next. |

### Density modes

Choose one mode for each slide. Use standard by default and change it only when the learning outcome requires it:

- **Dense:** 4–6 modules, supporting examples, compact charts or diagrams, a takeaway, and 2–3 practical notes; target 55–75 short words beyond labels.
- **Standard:** 3 visual zones or 3–5 modules, one takeaway, and up to two short practical notes; target 30–45 short words beyond labels.
- **Light:** one dominant diagram or image-led story, at most 2–3 modules, a short takeaway, and 15–25 short words beyond labels.

## Raster and ImageGen contract

- Every visible element—titles, body text, formulas, code, tables, diagrams, charts, icons, labels, card outlines, and warnings—must be contained inside one complete 16:9 raster image generated through ImageGen.
- Do not use SVG, HTML/CSS, Canvas, Mermaid, Graphviz, programmatic slide-native drawing, or editable overlays to create visible content.
- If a PPTX is needed, each slide must contain exactly one edge-to-edge full-slide raster image and no visible native text boxes, shapes, charts, tables, connectors, groups, or overlays.
- Put exact copy in the ImageGen prompt, preserve user-supplied labels verbatim, and keep text short enough to remain crisp and legible.
- Keep every element at least 4% of the canvas away from the crop edge and preserve a quiet margin around the title.
- Do not add logos, watermarks, URLs, institutional marks, or footer branding by default. A deck-specific user or lecturer override may allow branding, but it must not weaken the raster contract or the scientific reading hierarchy.

## Required visual QA

Before delivery, inspect every slide at full size and verify:

1. The 16:9 aspect ratio, pure-white background, borderless outer edge, safe margins, and crop safety are correct; no background motif or decoration remains.
2. The title, subtitle, body text, formulas, code, tables, axes, units, and labels are readable.
3. The title band is consistent across the complete deck: same font family/style, weight, navy colour, upper-left anchor, line spacing, and subtitle treatment.
4. The semantic accent colours and card treatment are consistent.
5. The scientific content, numbers, units, arrows, and reading order are correct.
6. The raster-only PPTX contract is satisfied: exactly one full-slide raster image and no visible native overlays.
7. Branding is absent unless an explicit deck-specific override was approved.

State in the delivery record: “Each slide is a single ImageGen-generated raster image embedded full-slide.”
