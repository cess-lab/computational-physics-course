# PHY4605 editable master — Terra Medium structural repair

- Generator: Terra Medium (`gpt-5.6-terra`, `medium`), editable-source owner.
- Output: `../../masters/PHY4605_Editable_Slide_Master.pptx`
- SHA-256: `185cdbd871821f91bb2cbb4f1d08c1e4fbcf0cd47dbb3b08ff8def46abf7f1a6`

## Source-level repair

The deterministic source `source/build_master_proof.mjs` now injects native
OpenXML PowerPoint placeholders during its reproducible export repair. The
placeholders are intentionally empty, so dependent decks can supply their own
editable text without duplicate visible content.

- The `Opening` layout inherits editable course-tag, title, and subtitle
  treatment.
- `Content T1`, `Content T2`, and `Content T3` each inherit editable title,
  subtitle, and slide-number treatment.
- The library fallback `Title Slide` layout also receives the same treatment,
  so no master layout remains structurally empty.
- Both slide-master XML parts now also contain the same inherited title,
  subtitle, and slide-number placeholder treatment.

This resolves the prior structural finding that layouts and masters were empty
apart from their group roots. This change was made only in the deterministic
source, not by editing the PPTX manually in PowerPoint.

## Generator QA

- Lock check: no `~$PHY4605_Editable_Slide_Master.pptx` lock file was present
  before rebuilding.
- OpenXML validation: `officecli validate` passed.
- Office issue inspection: `officecli view … issues` returned zero issues.
- Structural inspection confirms `p:ph` title, `p:ph` subTitle, and `p:ph`
  sldNum placeholders on all required layouts and both masters.
- Rendering: the rebuilt PPTX was exported to PDF with headless LibreOffice and
  rendered to nine 1920 × 1080 PNGs. Full-deck and title contact sheets are
  retained in this directory. The generator inspected the full contact sheet,
  title contact sheet, and a full-size representative content slide; no new
  overlap, clipping, or visual drift was observed.

## Audit state

Awaiting a fresh independent **Sol Medium** read-only audit of this exact hash.
No dependent weekly deck may be built or labelled approved until that audit
passes.
