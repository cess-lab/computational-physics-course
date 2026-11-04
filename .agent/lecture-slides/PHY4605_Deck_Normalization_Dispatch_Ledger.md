# PHY4605 deck normalization dispatch ledger

Date: 2026-09-07

Scope: replace only the title/cover image and final takeaway image in the active lecture deck for Weeks 01–13. Interior slides, equations, MATLAB code, numerical plots, strict assets, and presenter-note content remain unchanged. The source images and backups are retained under each active deck's `.agent/lecture-slides/` directory.

## Shared production contract

- Format: 16:9 rasterized Teaching Courseware deck.
- Cover: `PHY4605 · WEEK NN · LECTURE`, approved scientific-term title, thin navy rule, model-to-interpretation chain, and one week-specific scientific anchor.
- Closing: `WEEK NN · TAKEAWAY AND NEXT STEP`, approved term-led headline, three cards (`CORE IDEA`, `CHECK`, `NEXT STEP`), and the `What changed?` / `How do you know?` exit strip.
- Week 13 uses the approved capstone variant: `CAPSTONE` on the cover and `CAPSTONE HANDOFF` with `EVIDENCE`, `DEFENCE`, and `HANDOFF` on the closing slide.
- Selected image backend: built-in ImageGen image tool. No CLI/API fallback was used.
- Existing speaker notes are preserved; Weeks 01–12 are reassembled from their active `speech.md`, while Week 13 is updated in-place at the two media entries so its existing notes and relationships remain intact.

## Reviewer follow-up correction

After visual review identified inconsistent divider placement on eight covers, the coordinating agent used built-in ImageGen layout-only edits for Weeks 03, 05, 06, 07, 08, 09, 11, and 12. Each corrected cover has exactly one thin navy divider immediately beneath the complete main title block; the previous endpoint is retained under that week's `qa/normalization_pre_rule_fix/` directory. The affected decks were reassembled and their 16:9 metadata was revalidated.

## Worker record

The ten parallel cover/closing workers used the explicitly requested native model and effort: `gpt-5.6-luna`, `xhigh`. Each worker covered both listed images for one week and self-checked the generated files before handoff.

| Week | Slides | Worker | Agent ID | Selected image directory |
| --- | --- | --- | --- | --- |
| 01 | 01, 13 | Goodall | `01a07c4b-836c-7aa0-be00-6d645e5608f8` | `Week01/.agent/lecture-slides/codex-ppt/normalization_image/` |
| 02 | 01, 14 | Aristotle | `01a07c4b-82fe-7421-a001-dc4062d9afeb` | `Week02/.agent/lecture-slides/codex-ppt/normalization_image/` |
| 03 | 01, 14 | Bernoulli | `01a07c4b-84d3-7183-9a27-a21c66fd87a5` | `Week03/.agent/lecture-slides/codex-ppt/normalization_image/` |
| 04 | 01, 15 | Aquinas | `01a07c4b-87d4-7f22-98db-24097f5a1e3f` | `Week04/.agent/lecture-slides/codex-ppt/normalization_image/` |
| 05 | 01, 14 | Singer | `01a07c4b-9117-7ac3-8e37-4455d862e2fa` | `Week05/.agent/lecture-slides/codex-ppt/normalization_image/` |
| 06 | 01, 14 | Erdos | `01a07c4b-9d8a-7ea1-a16b-c5d7f5b413aa` | `Week06/.agent/lecture-slides/codex-ppt/normalization_image/` |
| 07 | 01, 17 | Schrodinger | `01a07c4b-abab-7880-b5b0-8af7f1caf560` | `Week07/.agent/lecture-slides/codex-ppt-cart-context/normalization_image/` |
| 08 | 01, 14 | Huygens | `01a07c4b-b511-7c30-bdea-36ddec81f0e2` | `Week08/.agent/lecture-slides/codex-ppt/normalization_image/` |
| 09 | 01, 14 | Chandrasekhar | `01a07c4b-c96c-75a2-a6fe-410c939dc87b` | `Week09/.agent/lecture-slides/codex-ppt/normalization_image/` |
| 10 | 01, 14 | Popper | `01a07c4b-bf03-7d01-ab53-b4cd5f5b8822` | `Week10/.agent/lecture-slides/codex-ppt/normalization_image/` |

The coordinating main agent generated the approved cover/closing images for Weeks 11–13 with the same built-in ImageGen backend. The selected images are retained in:

- `Week11/.agent/lecture-slides/codex-ppt/normalization_image/`
- `Week12/.agent/lecture-slides/codex-ppt/normalization_image/`
- `Week13/.agent/lecture-slides/codex-ppt/normalization_image/`

## QA evidence

- Original active cover/closing source images are backed up in each active deck's `qa/normalization_original/` directory.
- The exact approved title list is recorded in the course blueprint and weekly package READMEs.
- Reassembly and final PPTX checks are recorded after the normalized images are installed.
