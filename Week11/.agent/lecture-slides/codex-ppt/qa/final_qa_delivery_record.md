# Week 11 — Final QA / delivery diagnostic handoff

Date: 2026-09-07  
Status: **DIAGNOSTIC — not final-approved**

## Scope and artefacts inspected

- Student-facing deck: `Week11/Lecture_Slides_Week11.pptx`
- Hidden assembled copy: `Week11/.agent/lecture-slides/codex-ppt/codex-ppt.pptx`
- Project inputs/evidence: `outline.md`, `deck_spec.json`, `prompts/`, `slide_jobs.json`, `slide_run_state.json`, `speech.md`, `origin_image/`, and the retained MATLAB reference plots.

## Objective checks

| Check | Result | Evidence |
| --- | --- | --- |
| PPTX archive integrity | **PASS** | `unzip -t` reported no errors. |
| Slides / notes / media | **PASS** | 14 slide XML files, 14 notes slides, 14 media files, and 14 slide relationships. |
| 16:9 geometry and metadata | **PASS** | `p:sldSz = 9144000 × 5143500` (ratio 1.777778); package metadata now identifies `screen16x9` and `On-screen Show (16:9)`. |
| Image-only assembly | **PASS** | 14/14 slides have one `p:pic`, zero native `p:sp` shapes; each image occupies the full slide. |
| PPTX-to-origin correspondence | **PASS** | Embedded image bytes match `origin_image/slide_01.png`–`slide_14.png` for 14/14 slides. Student-facing and hidden PPTX SHA-256 both equal `979e86a6e0ef683ddd7ec87973200f9f4b9706116b799f95ec6694b324e8245e`. |
| Speaker notes | **PASS** | 14 `speech.md` sections; 14/14 embedded notes are non-empty and match the corresponding talk-track prefix. |
| Slide-state completion | **PASS (state only)** | `slide_job_status.py`: `slides_recorded`; accepted `slide_07`; recorded slides `01–06, 08–14`; no pending, dispatched, or blocked jobs. |
| Full-size visual inspection | **PASS** | All 14 final images inspected at 1672×941. No visible clipping, unreadable title, outer frame, watermark, or unrequested slide number. The retained stiffness and output-span reference plots are visibly represented with their stated units and relationships. |
| PPTX renderer check | **PASS** | Fresh `soffice` conversion created `qa/rendered_current_format_normalized_20260907/Lecture_Slides_Week11.pdf` and the hidden-deck render `qa/rendered_current_format_normalized_20260907/codex-ppt.pdf`; both are 14 pages at `720 × 405.014 pt`. |

## Evidence gaps and blockers

1. **Exact-match dispatch provenance is absent.** No Week 11 deck dispatch ledger is retained under `qa/`. The job results contain worker IDs and built-in-image-tool provenance, but do not independently prove the required coordinating model, reasoning effort, and exact inherited dispatch for every worker.
2. **Explicit sample approval is not independently retained.** `deck_spec.json`/`slide_jobs.json` record slide 07 as the accepted sample and preserve the approved-sample method/path, but no separate lecturer approval record or sample QA file was found.
3. **Outline title correspondence has punctuation drift.** The outline uses hyphens for slides 09 and 11–14 (for example, `Core Validation - Check the Baseline`), while the final slide jobs, notes, and rendered titles use colons. Slide count/order and wording otherwise correspond, but exact outline-to-final title identity is not proven.
4. **No full page-by-page visual clearance is claimed.** The fresh renderer check establishes current conversion and page count, not lecturer/sample approval or visual acceptance.

Archived predecessor: **none — the format normalization changed metadata without changing slide images or notes**.  
External Classroom/Forms and Git actions: **none**.
