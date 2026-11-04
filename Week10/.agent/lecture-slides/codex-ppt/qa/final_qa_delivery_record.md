# Week 10 — Final QA/hash record after Slide 8 repair and format normalization

Checked: 2026-09-07. Status: **DIAGNOSTIC — not final-approved**. This refresh supersedes the earlier diagnostic snapshot below while retaining its unresolved gates and the archived predecessor.

## Current artefacts and safe checks

- Student-facing deck: `Week10/Lecture_Slides_Week10.pptx`
- Hidden assembled copy: `Week10/.agent/lecture-slides/codex-ppt/codex-ppt.pptx`
- Current SHA-256 for both files: `1e4c2d68df65f799e71e6957c2ce7e25be3b2dfca03fbe4804e6728c25bc2c6d`
- The two current binaries are byte-identical.

| Check | Result | Evidence |
| --- | --- | --- |
| ZIP integrity | PASS | `unzip -tqq` completed without an error for both current binaries. |
| Slides / notes / media / relationships | PASS | 14 slide XML files, 14 notes-slide XML files, 14 media files, and 14 slide relationships. |
| Notes content | PASS | 14/14 notes-slide XML files contain non-empty text; the retained project evidence reports 14 `speech.md` sections. |
| Image-only assembly | PASS | 14/14 slides contain one `p:pic` and zero native `p:sp` shapes. |
| PPTX-to-origin correspondence | PASS | Embedded image bytes match `origin_image/slide_01.png` through `slide_14.png` for 14/14 slides. |
| 16:9 geometry and metadata | PASS | `p:sldSz` dimensions are `9144000 × 5143500`, ratio `1.777778`; `p:sldSz type="screen16x9"` and app `PresentationFormat="On-screen Show (16:9)"` now agree. |
| Embedded raster dimensions | PASS | 14/14 embedded images are `1672 × 941` pixels. |
| Corrected Slide 8 | PASS for the performed spot-check | The current `origin_image/slide_08.png` was viewed after the localized repair and visibly retains the strict reference's 0–900 frequency scale, peak near 800, even-position bars, and mean `-0.128 mm`. |
| Current full-deck render | PASS | Local `soffice` conversion created `qa/rendered_current_format_normalized_20260907/Lecture_Slides_Week10.pdf` (SHA-256 `fa9082c8aac2bbf7…`) and the hidden-deck render `qa/rendered_current_format_normalized_20260907/codex-ppt.pdf` (SHA-256 `331564d0f74f9681…`). |
| Render freshness and geometry | PASS | Both fresh renders are 14 pages at `720 × 405.014 pt` (ratio `1.777778`) and were produced after the metadata-only normalization. |

## Unresolved gates retained

1. **Exact-match dispatch provenance remains incomplete.** `qa/dispatch_ledger.md` retains entries only for Slides 01–06. The required model/reasoning inheritance is not independently evidenced for Slides 07–14; Slide 8 was repaired by a parent-localized edit and has no worker dispatch entry. Job results alone do not prove the required full dispatch ledger.
2. **Lecturer approval remains unproven.** `deck_spec.json` and `slide_jobs.json` identify Slide 8 as an accepted sample and retain its method/path, but no separate lecturer approval record is present in the inspected QA evidence.
3. **No metadata warning remains.** The dimensions and package metadata now consistently identify 16:9.
4. **No visual clearance is claimed.** The fresh render proves current local conversion and page count only; it does not establish lecturer/sample approval or visual acceptance.

## Archived predecessor

- `qa/archive/slide_08_repair_20260907/Lecture_Slides_Week10.before.pptx`
- `qa/archive/slide_08_repair_20260907/codex-ppt.before.pptx`
- Both archived predecessor binaries SHA-256: `508af5252d235e64238c525bb401c5b51f652893f88b3a3bea252d14ff238eb8`.
- Archived pre-repair Slide 8: `qa/archive/slide_08_repair_20260907/slide_08.before.png`.

The earlier frequency-scale blocker and old `508a…` hash are retained as historical evidence by the archive references above, not as the current state.

External Classroom/Forms and Git actions: **none**. No commit was made.
