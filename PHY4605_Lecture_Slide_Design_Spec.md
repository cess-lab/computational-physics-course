# PHY4605 Codex-PPT Slide Deck Production Specification

This document is the project-wide production and QA contract for PHY4605 lecture and practical-brief slide decks. It is a course-specific overlay on the installed `codex-ppt` skill. The skill workflow, approval gates, state scripts, subagent handoff, image-backend rules, and assembly route are normative. Where this document adds a stricter scientific or course requirement, follow both.

## Canonical artefact

- The canonical student-facing deck is a 16:9 image-based PPTX assembled by the `codex-ppt` skill.
- Each slide is one complete generated image. Separate PowerPoint text boxes, shapes, charts, master layouts, and editable typography are not required.
- English presenter notes from `speech.md` must be embedded during assembly.
- Slide numbers are omitted unless the lecturer explicitly requests them.
- The old editable-first master, `Presentations`/`@oai/artifact-tool` construction route, fixed coordinate schema, Nunito/IBM Plex Mono object contract, and Terra/Sol generator-auditor loop are retired.
- Preserve retired masters, editable sources, renderings, and QA evidence under hidden `.agent/` folders. They are historical evidence, not production inputs or visual authorities.

## Course and learner contract

All decks must follow the current course topic and assessment blueprints. The slide sequence must make the applicable parts of this reasoning chain visible:

`physical model -> scale and units -> discretisation -> algorithm -> code -> error/uncertainty -> validation -> physical interpretation`

For the nominal Year-2 cohort:

- assume weak retained MATLAB literacy;
- use familiar physics when introducing a new computational idea;
- keep ordinary assessed mastery scaffolded and cumulative;
- introduce no more than three genuinely new Core ideas in one lecture;
- use one clear learning job per slide;
- prefer prediction, mapping, worked example, code tracing, validation, interpretation, and exit-ticket roles over dense exposition;
- do not expose timings, internal prompts, QA language, source labels, or production metadata on student-facing slides.

The normal Core route contains 12–14 slides unless the lecturer approves a different count. Working-exposure or Stretch pages must remain removable without breaking the Core route.

## Visual style

Use the built-in `codex-ppt` **Teaching Courseware** reference as the visual authority:

- white or very light neutral canvas with restrained navy and cool-gray structure;
- blue, teal, yellow, or coral accents used consistently and sparingly;
- large bold sans-serif titles and short readable instructional text;
- low-to-moderate density with one main learning object;
- approachable diagrams, icons, charts, callouts, and worked examples;
- varied composition chosen by slide role rather than one repeated layout;
- no decorative clutter, tiny labels, watermark, unrelated logo, or unrequested slide number.

Do not recreate the retired PHY4605 geometric master or introduce another deck schema. Course consistency comes from the approved sample slide, the Teaching Courseware style brief, stable scientific colour meaning, and cross-material content agreement.

## Lecturer-steered project visual overlay

The following decisions are specific to PHY4605. They do not modify the installed `codex-ppt` skill; they refine its Teaching Courseware style for this course and apply to every future lecture or practical-brief deck, including revisions. In this section, **must**, **prohibited**, and **strictly prohibited** indicate hard QA requirements. **Prefer**, **guideline**, and **sparingly** indicate design guidance rather than automatic blockers.

### Content and composition

- Keep the course blueprint's topics, themes, intended learning outcomes, and scientific scope fixed. The deck may still use a different slide sequence within the week, examples, explanation, narrative framing, visual treatment, or layout when that improves teaching.
- Keep a coherent visual system across the deck without repeating one layout on every slide. Vary composition by slide role while retaining the same palette, typography hierarchy, spacing rhythm, icon language, and overall visual tone.
- Use a moderate information density: include brief explanatory text, meaningful labels, units, captions, and sublabels where they help students reason. Avoid both empty screens and dense paragraphs or overcrowded layouts.

### Functional colour and typography

- Use a muted academic palette on an open white or very light neutral canvas. Navy or muted blue may structure the model, axes, and main instructional content; sage green may indicate an expected, checked, validated, or successful state; muted ochre may mark an occasional prompt, caution, or warning; muted coral may mark a genuine defect, failure, or contrast case.
- Use colour as a functional cue, not as a decorative rainbow or a generic legend such as “blue = motion” when the colour itself is not being taught. Keep saturation and the number of simultaneous accent colours restrained.
- Preserve typographic hierarchy rather than making every word bold: use bold for main titles and high-priority emphasis, semibold for headings and labels, regular text for explanations, bullets, prompts, captions, and sublabels, and readable regular monospaced text for MATLAB code. Bold should therefore retain meaning.

### Graphics, annotations, and graphs

- Do not use empty illustrations or unlabeled graphics as the main learning object. Diagrams should include the relevant state names, variables, units, arrows, axes, steps, or short annotations needed to explain what students should notice.
- Place annotations close to the feature they describe. A connector should be short and should end clearly on the intended target; avoid long diagonal leaders that cross unrelated parts of the visual. Every label must have an unambiguous target.
- When a quantitative graph is the learning object, make it read as a real plotted graph: include axis labels, units, readable ticks and values, a recognizable curve or data series, and a title or legend when useful. Grid lines may be used when they improve reading. Do not substitute an unlabeled decorative curve for the intended graph.
- For lecture-slide visuals, use MATLAB-generated plots and computed evidence as strict numerical reference/QA assets. When a graph is the learning object, provide the MATLAB output, script, and data to the built-in ImageGen backend as reference only, then generate the complete slide as one cohesive image, including the graph, labels, annotations, and surrounding layout. Do not paste or overlay the MATLAB raster into PowerPoint or add separate PowerPoint annotation boxes. The generated graph must not invent or materially change the specified values, units, curve relationships, or marker positions; compare it against the retained MATLAB source during QA. Learning notes and MATLAB Live Scripts keep MATLAB-generated plots when their own specifications require them. A conceptual graphic without exact numerical claims must be clearly treated as conceptual.

### Framing and reusable patterns

- A thick outer frame, enclosing perimeter, or decorative border around the entire slide is **strictly prohibited**. Its presence is a hard QA failure.
- Keep the slide canvas open and plain. Do not add decorative corner patterns, dotted backgrounds, or other ornaments that visually act as an outer frame.
- Internal functional card borders are allowed when they clarify grouping, comparison, an exit-ticket response area, or a worked example. A card border must not become a second outer frame around the whole slide.
- Exit-ticket and reflection slides may use bordered cards, icons, or writing lines, provided the surrounding slide remains the same open white canvas and has no outer frame.

### Prompt boxes

- **Guideline, not a hard rule:** use a large yellow or ochre prompt box sparingly and only when it supports the teaching point. It is optional, must not be a default device on every slide, and may be replaced by a smaller callout, inline question, annotation, or other appropriate treatment. The presence or absence of a large prompt box is not by itself a QA failure.

### Delegation

- The lecturer-approved worker family for this project is Luna Max. When slide subagents are used, use Luna Max workers only, with the exact model and reasoning-effort settings inherited from the coordinating Luna Max task. Do not substitute another model; if matching Luna Max workers cannot be guaranteed or evidenced, block that delegated batch.

## Scientific and exact-content controls

- The weekly locked model, assumptions, variables, units, signs, sample counts, code, validation language, and physical interpretation must agree across slides, learning notes, MATLAB Live Scripts, practicals, and READMEs.
- MATLAB-generated plots and computed evidence remain strict numerical references and source facts. Preserve their data, axes, labels, legends, units, values, and curve relationships during slide generation. For lecture-slide visuals, pass them to ImageGen as reference-only inputs for a full-slide redraw; do not paste the MATLAB raster into the final slide, and verify the redraw against the retained source. For learning notes and MATLAB Live Scripts, embed the MATLAB-generated plot directly where their specifications require it.
- Exact equations, mathematical fragments, symbols, code, and unit expressions must be supplied as strict source assets whenever image generation might alter their meaning. Retain their source and provenance under the weekly hidden folder.
- Required source images must be mapped to explicit slide numbers and roles in `outline.md`. The lecturer approves this mapping before sample generation.
- A generated slide must not invent a value, scientific component, sign, arrow direction, relationship, code token, or validation result.
- When multiple representations depict the same phenomenon, their states, directions, sample counts, highlighted moments, and colour meanings must agree or their mapping must be made explicit.

## Mandatory Codex-PPT gates

Follow the installed skill in this order:

1. Read and reconcile the source materials and strict assets.
2. Draft `outline.md` with slide title, three to five key points, visual idea, layout role, and required-image mapping.
3. Obtain explicit outline and asset-mapping approval. Before this approval, do not create final `deck_spec.json`, `speech.md`, prompt jobs, slide images, or PPTX output.
4. Confirm Teaching Courseware as the deck style. A previously approved course deck may be a style-only reference, but each new deck still requires its own sample.
5. Confirm the built-in image-generation backend. Do not switch to CLI/API fallback without explicit lecturer approval.
6. Generate exactly one representative sample slide and obtain explicit approval.
7. Record the approved sample generation method in `deck_spec.json`, prepare one JSON job per remaining slide, and initialize the bundled run-state files.
8. Dispatch each remaining slide to one exact-match subagent and record dispatch through the bundled script.
9. Inspect each candidate, then record accepted results through `record_slide_result.py`; record any inability to comply through `record_slide_blocker.py`.
10. Complete parent-led visual and scientific QA, repair with the same backend and model policy, finalize English `speech.md`, and assemble the PPTX only when all slide states are complete.

Chat statements alone never satisfy a gate. Use the files and state transitions required by `codex-ppt`.

## Exact-match slide-worker policy

Every slide-generation or slide-regeneration subagent must match the coordinating main agent's exact model identifier and reasoning effort.

- Spawn workers with `fork_turns="all"` and omit model and reasoning-effort overrides so both settings inherit from the main agent.
- Example: a main task using `gpt-5.6-luna` at `xhigh` may dispatch only `gpt-5.6-luna` at `xhigh` slide workers.
- Do not substitute another model because of availability, speed, cost, queueing, or concurrency.
- Before each batch, record the main task's model identifier, reasoning effort, inheritance method, worker ID, assigned slide, and prompt path in a hidden dispatch ledger.
- A slide result may be recorded only when its dispatch entry shows inherited exact-match settings.
- If the runtime cannot guarantee or evidence the match, record the slide as blocked and stop that batch. Do not use a different model or a sequential lower-quality fallback.
- The parent may perform only the orchestration, inspection, state recording, assembly, and localized edit permitted by the skill. A full regenerated slide remains an exact-match worker job.

## Hidden project structure

Use these roots:

```text
WeekXX/.agent/lecture-slides/codex-ppt/
WeekXX/.agent/practical-brief-slides/codex-ppt/
```

Each active deck project contains the standard skill files:

```text
outline.md
deck_spec.json
prompts/slide_XX.json
slide_jobs.json
slide_run_state.json
origin_image/slide_XX.png
speech.md
<deck_name>.pptx
qa/
```

Before outline approval, only `outline.md` and clearly marked draft planning evidence may exist in the fresh project. Keep rejected images and retired runs outside `origin_image/`.

## Parent-led QA and acceptance

Inspect every final slide at full size. A contact sheet is only supplementary. Verify:

1. slide count and order match the approved outline;
2. every sample is `accepted` and every non-sample slide is `recorded`;
3. every worker satisfies the exact-match policy;
4. every final `origin_image/slide_XX.png` came from the confirmed built-in backend;
5. titles, prose, code, equations, signs, symbols, units, and numerical values are exact and readable;
6. lecture-slide graphs are cohesive ImageGen redraws checked against the retained MATLAB reference, while learning-note/Live-Script plots and other strict supplied figures are visibly preserved where their specifications require direct embedding;
7. no important element is clipped, overlapped, distorted, truncated, or too small for projection;
8. visual identity is consistent while adjacent layouts vary appropriately;
9. the deck contains the required prediction, algorithm/code reasoning, validation, and physical interpretation;
10. `speech.md` contains one English talk track per slide and assembly embeds it in the corresponding notes page;
11. the assembled PPTX is 16:9, opens successfully, renders successfully, and contains one full-slide image per page;
12. final hashes, backend provenance, dispatch ledger, repaired slides, and known limitations are retained under `qa/`.

Do not publish or replace a student-facing deck while any job is pending, dispatched, blocked, uninspected, or scientifically unresolved. Archive the previous canonical deck under the hidden weekly folder immediately before publishing its accepted replacement.

## Delivery record

For every completed deck, record:

- student-facing PPTX path;
- hidden Codex-PPT project path;
- slide count;
- confirmed backend;
- main model and reasoning effort;
- exact-match dispatch result;
- sample approval evidence;
- slide-state summary;
- full-size visual and scientific QA result;
- speaker-note count;
- final PPTX hash;
- archived predecessor path or `none`;
- known limitations or `none`.
