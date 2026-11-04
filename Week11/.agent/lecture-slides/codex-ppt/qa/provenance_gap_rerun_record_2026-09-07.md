# Week 11 Codex-PPT provenance-gap / rerun record

Date: 2026-09-07  
Status: **PROVENANCE GAP — not final-approved**

## Scope and decision

This record covers only the retained Week 11 Codex-PPT project and the existing student-facing deck. No scientific content, English presenter notes, origin image, prompt, or job/state file was changed. A later metadata-only 16:9 normalization repacked the PPTX without changing slide images or notes. Historical approval and dispatch evidence has not been reconstructed from claims in the retained metadata.

The existing deck is structurally usable, but it must not be labelled final-approved until the provenance gates below are satisfied by an evidence-bearing approval/rerun record.

## Proven from retained files and checks

- `slide_job_status.py` reports `run_status=slides_recorded`, accepted sample `slide_07`, recorded slides `slide_01`–`slide_06` and `slide_08`–`slide_14`, with no pending, dispatched, or blocked jobs.
- `slide_jobs.json` retains 13 non-sample dispatch entries, three worker identifiers (`/root/w10_slide01`, `/root/w10_slide02`, `/root/w10_slide03`), dispatch timestamps, prompt paths, prompt SHA-256 values, built-in-image-tool result metadata, and `sample_generation_method_matched=true` for the recorded non-sample results. All 13 retained prompt SHA-256 values match their current prompt files.
- The retained generation metadata identifies the selected backend as `built-in image tool`, with `image_gen` in generate mode and `slide_07` as the approved-sample style reference. This is metadata evidence of the claimed method, not independent approval evidence.
- Both current PPTX files are byte-identical with SHA-256 `979e86a6e0ef683ddd7ec87973200f9f4b9706116b799f95ec6694b324e8245e`.
- Independent package check on `Week11/Lecture_Slides_Week11.pptx`: `unzip -t` passed; the archive contains 14 slide XML files, 14 notes slides, 14 media files, and 14 slide relationship files.
- Independent geometry/assembly check passed: `p:sldSz=9144000 x 5143500` (ratio `1.777778`) with `screen16x9` package metadata; every slide contains exactly one full-slide `p:pic` and zero native `p:sp` shapes; embedded image bytes match `origin_image/slide_01.png`–`slide_14.png` for 14/14 slides.
- Independent notes check passed: `speech.md` contains 14 numbered sections; all 14 embedded notes are non-empty and their corresponding talk-track prefixes match.
- Safe renderer check passed against the current student-facing PPTX. LibreOffice converted it to `qa/rendered_current_format_normalized_20260907/Lecture_Slides_Week11.pdf`; `pdfinfo` reports 14 pages at approximately 16:9 page geometry. The matching hidden-deck render is in the same folder.
- The retained current QA record reports full-size visual inspection passed for all 14 final images. The renderer output added in this action confirms conversion/render success; it does not replace the missing provenance gates.

## Not proven / remaining gaps

1. **Outline and source-image mapping approval:** `outline.md` still states `draft outline awaiting lecturer approval` and says downstream production was not authorized. No separate lecturer approval record is retained.
2. **Explicit sample approval:** `slide_07` is marked `accepted` and the sample method/path are repeated in metadata, but no independent lecturer approval record or sample approval QA file is retained. The sample result itself has no recorded backend or generated-source path.
3. **Exact-match dispatch provenance:** the retained dispatch entries do not record the coordinating model identifier, coordinating reasoning effort, `fork_turns=all`, or an inheritance ledger proving that each worker matched those exact settings. Worker IDs, prompt hashes, timestamps, and backend claims are insufficient to establish this gate.
4. **Final approval:** because the approval and exact-match dispatch gates are not independently evidenced, the existing deck cannot be treated as final-approved even though its slide state and structural/render checks pass.

## Exact gate still required

Do not backfill the missing history. For a provenance-complete rerun, obtain and retain, in order:

1. explicit lecturer approval of the outline and the required-image mapping;
2. confirmation of the Teaching Courseware style and built-in image backend;
3. explicit approval of exactly one generated sample, including its generation method;
4. a dispatch ledger for every remaining slide that records the coordinating model, reasoning effort, `fork_turns=all`, inherited exact-match settings, worker ID, slide ID, and prompt path; and
5. parent-led visual/scientific QA plus recorded results and final assembly evidence.

Only after those records exist may the deck pass the final-approval gate. No new slide generation or external-system action was performed; the later format-only PPTX normalization is recorded separately and does not establish approval.

## Files changed by this action

- Added this record: `Week11/.agent/lecture-slides/codex-ppt/qa/provenance_gap_rerun_record_2026-09-07.md`.
- Added renderer evidence under `Week11/.agent/lecture-slides/codex-ppt/qa/render_check_20260907/`: `Lecture_Slides_Week11.pdf` and 14 PNG page renders (`pages/slide-01.png` through `pages/slide-14.png`).
- Source/notes/images/prompts/jobs/state files and the existing `qa/final_qa_delivery_record.md` were not modified by the original rerun; subsequent format-only PPTX changes are recorded in `.agent/lecture-slides/qa/weekly_pptx_format_normalization_20260907.md`.
