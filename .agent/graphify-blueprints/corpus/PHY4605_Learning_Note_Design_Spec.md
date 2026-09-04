# PHY4605 Learning Note Design Specification

This is the project-wide source of truth for the visual and structural design of PHY4605 learning notes and their compiled PDFs. It is based on the verified common style of the Week 01–03 LaTeX/PDF series. Keep it stable unless the lecturer explicitly approves a redesign.

Use [PHY4605 Course Topic and Difficulty Blueprint](PHY4605_Course_Topic_Blueprint.md) as the source of truth for weekly scope, Core/Working/Stretch classification, the ordinary-pass profile, and the 13-week execution plan. This specification governs how that calibrated content is explained and displayed in a learning note.

## Learner and difficulty contract

Write for second-year physics students who may remember familiar calculus and physics equations but have little or no retained MATLAB knowledge and weak experience converting an equation into computational steps.

- Keep the Core route complete without pre-class preparation.
- Introduce no more than three genuinely new Core ideas in one week.
- Begin with a familiar physical picture or question before formal numerical notation.
- Explain every essential Core equation in plain language and identify its variables and units.
- Show a plain-language algorithm or pseudocode before MATLAB implementation.
- Use one worked example that proceeds in small, visible steps from model to interpretation.
- Separate `Working exposure` and `Optional stretch` from the Core explanation. Removing those sections must leave a coherent note.
- Do not make formal proofs, multi-method taxonomies, or independent code construction necessary for understanding the Core route unless the topic blueprint explicitly classifies them as Core.

## Design identity

Use the standard name **PHY4605 Academic Scientific Learning Note — Navy–Green–Orange Callout System**. The intended character is academic, structured, readable, physics-first, and approachable. The page should feel like a carefully designed scientific handout rather than a syntax-only programming manual.

## Format and page architecture

- Use A4, single-column pages with the `article` class at 11 pt and an 18 mm margin.
- Use no paragraph indentation, modest paragraph spacing, and centred page numbers.
- Let the page count follow the content. Do not force every week to have the same number of pages.
- Keep the page background white, with generous whitespace and no default logo, watermark, URL, or footer branding.

## Opening hierarchy

Begin every note with this sequence:

1. the course name in small caps;
2. `Learning Note | Week N`;
3. a large bold title;
4. one italic, one-sentence purpose statement;
5. a blue physical-question callout; and
6. a concise Core learning-outcomes list containing no more than three outcomes.

## Teaching and body hierarchy

- Use numbered sections with bold headings and a clear physical picture → equation in words → mathematical formulation → pseudocode → short code → one Core validation → interpretation progression.
- Centre equations, tables, and TikZ diagrams when they support the explanation.
- Use short paragraphs, lists, one stepwise worked example, prediction checkpoints, code-tracing prompts, and interpretation prompts instead of dense exposition.
- Place prerequisite reminders at the point of use. Do not send a novice reader backward through the note to recover an array, indexing, plotting, algebra, or units convention.
- Mark non-Core material with an explicit `Working exposure` or `Optional stretch` heading. Do not interleave it with the Core worked pathway.
- End with `Three takeaways` and a blue `Preparation for the practical` callout.
- Keep written content in English and use physics terminology consistently across the note, Live Script, practical, and slides.

## Typography

- Use a restrained academic serif for body text, equations, titles, and section headings.
- Use a monospace face for MATLAB code.
- Keep titles and headings bold, subtitles italic, body text dark, and alignment predominantly left.
- Do not introduce decorative display fonts, gradients, glossy effects, or oversized coloured text.

## Palette and callout semantics

Use dark text on a white page and preserve these semantic roles:

- `MidnightBlue` for links and structural accents.
- Pale `RoyalBlue` fill with a `RoyalBlue` border for physical questions, key ideas, and preparation callouts.
- Pale `ForestGreen` fill with a green border for predictions, checks, validation, and validity.
- Pale `BurntOrange` fill with an orange border for responsible-AI notes, cautions, and failure modes.
- Very pale blue fill with a thin blue border for MATLAB code blocks.

In the current LaTeX implementation, the established box tokens are `RoyalBlue!5` / `RoyalBlue!65!black`, `ForestGreen!5` / `ForestGreen!55!black`, and `BurntOrange!7` / `BurntOrange!80!black`. Preserve these roles when adapting the template.

## Component style

- Use thin outlined boxes with small rounded corners, restrained spacing, and no heavy shadows.
- Use `booktabs`-style tables without vertical rules.
- Use simple centred TikZ diagrams with blue nodes and arrows; use green secondary nodes when they represent tests or validity.
- Keep code panels copyable, readable, and visually subordinate to the physics explanation.

## Embedded scientific illustrations

Use one embedded scientific illustration when it removes a novice-level representation barrier that a paragraph, equation, table, or MATLAB figure would not remove as clearly. Typical justified uses are the physical system, an equation-to-array map, indexing direction, discretisation, a timestep/update, an algorithmic flow, or a comparison of numerical and reference behaviour. Do not add a generated illustration merely to decorate a page.

When one is justified:

- generate or edit it with ImageGen as a visual-only asset; do not place prose, axes, legends, code, equations, numerical values, or document furniture inside the generated image;
- use the approved `PHY4605 Matte Scientific Cutaway` language: white/quiet background, restrained navy-blue/teal/gold semantic palette, clear scientific geometry, and adequate whitespace for the note caption;
- reuse an approved lecture-slide illustration only when it depicts the same physical model, state sequence, directions, variables, units, and colour meaning. Retain the original asset and its provenance rather than regenerating a near-duplicate;
- insert the visual directly into the compiled note with a concise caption and deterministic surrounding labels. Never leave it only as an external link;
- retain the prompt/source, local asset path, purpose, provenance, caption, and a short accessibility description under the note's hidden `.agent/learning-notes/` source area; and
- inspect the final PDF at reading size for crop safety, scientific accuracy, caption separation, and agreement with the equations, code, and terminology.

If no illustration is justified, record the reason in the note's hidden QA record. A numerical graph remains a MATLAB-generated figure, not an ImageGen substitute.

## Shared LaTeX template

The canonical course template is `Week01/.agent/learning-notes/Week01_Physics_to_Arrays_and_Plots.tex`. All weekly notes must inherit its A4 Computer Modern academic typography, 18 mm geometry, navy/green/orange callout definitions, `booktabs` tables, line-numbered MATLAB `listings`, and TikZ workflow treatment. Adapt content and approved figures, but do not replace this document grammar with a different font family or page layout without lecturer approval.

Code-panel appearance, syntax-highlighting choices, and line-number policy must be applied consistently across weeks rather than diverging in individual files. A topic-specific diagram or table may change, but the document grammar and semantic colour system must remain recognisable.

## Required QA

Inspect both the `.tex` source and the rendered PDF. Check:

1. opening hierarchy, margins, and page numbers;
2. callout colours and their semantic use;
3. code-panel treatment and readability;
4. equation, table, and diagram spacing;
5. scientific labels, units, notation, and physical interpretation; and
6. closing takeaway and practical-preparation blocks;
7. no more than three Core outcomes or new ideas are introduced; and
8. the Core pathway remains complete when Working exposure and Optional stretch sections are omitted.
9. every required embedded illustration is purposeful, scientifically consistent, locally retained, captioned, and legible in the compiled PDF; or its omission is recorded in the hidden QA evidence.

Compile from a clean setup and retain the rendered PDF or evidence needed for another person to reproduce the result.
