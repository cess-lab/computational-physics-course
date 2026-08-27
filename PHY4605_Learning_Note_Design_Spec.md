# PHY4605 Learning Note Design Specification

This is the project-wide source of truth for the visual and structural design of PHY4605 learning notes and their compiled PDFs. It is based on the verified common style of the Week 01–03 LaTeX/PDF series. Keep it stable unless the lecturer explicitly approves a redesign.

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
6. a concise learning-outcomes list.

## Teaching and body hierarchy

- Use numbered sections with bold headings and a clear physical model → mathematical formulation → algorithm/code → validation → interpretation progression.
- Centre equations, tables, and TikZ diagrams when they support the explanation.
- Use short paragraphs, lists, worked examples, prediction checkpoints, and interpretation prompts instead of dense exposition.
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

## Shared LaTeX template

All weekly notes must inherit one common preamble or an exact shared template for geometry, packages, box definitions, colours, tables, diagrams, hyperlinks, and `listings`.

Code-panel appearance, syntax-highlighting choices, and line-number policy must be applied consistently across weeks rather than diverging in individual files. A topic-specific diagram or table may change, but the document grammar and semantic colour system must remain recognisable.

## Required QA

Inspect both the `.tex` source and the rendered PDF. Check:

1. opening hierarchy, margins, and page numbers;
2. callout colours and their semantic use;
3. code-panel treatment and readability;
4. equation, table, and diagram spacing;
5. scientific labels, units, notation, and physical interpretation; and
6. closing takeaway and practical-preparation blocks.

Compile from a clean setup and retain the rendered PDF or evidence needed for another person to reproduce the result.
