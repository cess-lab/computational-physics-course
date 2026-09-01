# Terra generator round 4 — Week 01 remediation

- Generator: `gpt-5.6-terra`, medium reasoning.
- Canonical output: `Week01/Lecture_Slides_Week01.pptx`.
- SHA-256: `ac4f01f9e89ef972f0115755d07dc0c5ba895909ba1415b9ccf10c65826187ac`.

## Recorded source repairs

- Manifest and source agree: Slide 3 uses T2, Slide 4 uses T3, Slide 8 uses T2, and Slide 9 uses T1.
- The 12-slide Core route is complete before the optional appendix. The retained vertical-motion `Working exposure: selected values` content is now Slide 13, after the Core checkpoint, rather than interrupting Core instruction.
- The former `Exit prompt` is Slide 8 in the Core route and is renamed `Checkpoint`; it no longer implies that instruction ends before the remaining Core slides.
- Gravity is gold in the equation-term module. Ordinary unit/checkpoint prompts use teal/gold rather than caution red.
- Slide 5 gravitational acceleration now uses the evaluation-gold/pale-gold row treatment (not purple); the retained slide-layout evidence records fill `#FFF7E6` and stroke `#C98A16`.
- The project-local `symbol-g.tex`, SVG, and PNG were regenerated with `render-equations-diagrams --fg #C98A16`; the full-size canonical Slide 5 render confirms the symbol, row fill, and border are gold.
- MATLAB regeneration enlarged Slide 3 ticks and Slide 12 tick/legend treatment; source, PNG, MAT, and CSV remain in the Week 01 lecture-slide assets.

## Evidence and checks

- `artifact-1920/` contains all 13 canonical 1920 x 1080 artifact-tool renders. `full-deck-contact-sheet-1920.png` was regenerated directly from them in physical order: Core Slides 1–12 (including Slide 8 Checkpoint), then Working appendix Slide 13. `title-region-crops-1920/` contains true 1920 x 360 top title-region crops (source y=70–429); `title-region-contact-sheet-1920.png` is their current overview.
- `slide-*.layout.json`, `master-proof-inspect.ndjson`, and `master-layout-summary.json` retain source-level editable/placeholder evidence.
- `officecli validate` completed with no errors; `officecli view issues` reported zero issues; OfficeCLI reports 163 Nunito and 26 IBM Plex Mono uses, with no images missing alt text.
- `slides_test.py` completed with no overflow.
- OpenXML scan records 13 title, 13 subtitle, and 12 slide-number placeholders in the slides; the layout/master chain retains seven title, seven subtitle, and six slide-number placeholders.

## Audit state

Sol Medium read-only follow-up: **PENDING**. This record is generator evidence only; it is not a self-audit verdict.
