# Week 13 — Historical Codex-PPT provenance-gap record

Checked: 2026-09-07. This record documents the historical production evidence that is missing; it does not retroactively grant or infer the original full-deck approval. The current endpoint-only normalization is separately approved and recorded in `.agent/lecture-slides/PHY4605_Deck_Normalization_Approval_Record_20260907.md`.

## Current binary evidence

- Student-facing deck: `Week13/Lecture_Slides_Week13.pptx`
- Current SHA-256: `68738c743f1b3aad592f30df7c471b098b8b793f4de3a3ef68fa719217abeecf`
- ZIP integrity: PASS (`unzip -tqq`).
- Structure: 14 slide XML files, 14 notes-slide XML files, 14 media files, and 14 slide relationships.
- Geometry: PASS by dimensions, `9144000 × 5143500` (ratio `1.777778`), with `screen16x9` and `On-screen Show (16:9)` metadata.
- Assembly shape check: 14/14 slides contain one `p:pic` and zero native `p:sp` shapes; 14/14 notes contain non-empty text.
- Embedded raster dimensions: 13 images are `1672 × 941` pixels and 1 image is `1671 × 941` pixels.

## Missing authentic Codex-PPT chain

The inspected Week13 tree contains no retained complete `Week13/.agent/lecture-slides/codex-ppt/` production project and no Week13 QA evidence for the required:

- approved `outline.md` and required-image mapping;
- Teaching Courseware style/backend confirmation;
- approved sample and lecturer approval;
- `deck_spec.json`, `prompts/`, `slide_jobs.json`, or `slide_run_state.json`;
- exact-match worker dispatch ledger and recorded worker results;
- `speech.md`-to-assembly evidence.

The current deck metadata describes it as `generated using python-pptx`; that is evidence about the package metadata, not proof of the complete production history. A retained predecessor named `Week13/.agent/qa/deck-validation/Lecture_Slides_Week13_pre_metadata_fix.pptx` has SHA-256 `be5bea7ee956403cdba898a1f36611c0bb402aa81e76a29718019f963bda5cda`.

## Status

Binary integrity and structure are recorded, but the original full-deck Codex-PPT provenance remains a **HISTORICAL GAP**. Do not claim that the original production chain had complete built-in ImageGen provenance, sample approval, or exact-match dispatch compliance from this record. The two-endpoint normalization itself was user-approved, generated with the built-in ImageGen backend, dispatched through the current normalization ledger, and passed the current structural/media QA.
