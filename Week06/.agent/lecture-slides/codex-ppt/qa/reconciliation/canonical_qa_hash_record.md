# Week 06 — Current canonical binary QA/hash record

Checked: 2026-09-07. The current binaries were subsequently normalized to consistent 16:9 metadata without changing slide images, notes, or content; the cross-week packaging record is `.agent/lecture-slides/qa/weekly_pptx_format_normalization_20260907.md`.

## Selected canonical

- Student-facing canonical: `Week06/Lecture_Slides_Week06.pptx`
- Hidden assembled copy: `Week06/.agent/lecture-slides/codex-ppt/codex-ppt.pptx`
- Current SHA-256 for both files: `70c6b70c35c7ba0ca52bcce65d2f8acd687bb02e6c1a504e8a2ad1e61a1fc8c6`
- The two current binaries are byte-identical.

## Safe binary checks

| Check | Result | Evidence |
| --- | --- | --- |
| ZIP integrity | PASS | `unzip -tqq` completed without an error for both current binaries. |
| Slides / notes / media / relationships | PASS | 14 slide XML files, 14 notes-slide XML files, 14 media files, and 14 slide relationships. |
| Notes content | PASS | 14/14 notes-slide XML files contain non-empty text. |
| Image-only assembly | PASS | 14/14 slides contain one `p:pic` and zero native `p:sp` shapes. |
| PPTX-to-origin correspondence | PASS | Embedded image bytes match `origin_image/slide_01.png` through `slide_14.png` for 14/14 slides. |
| 16:9 geometry and metadata | PASS | `p:sldSz` dimensions are `9144000 × 5143500`, ratio `1.777778`; `p:sldSz type="screen16x9"` and app `PresentationFormat="On-screen Show (16:9)"` now agree. |

## Preserved predecessor references

| Retained predecessor | SHA-256 | Observed structure |
| --- | --- | --- |
| `qa/reconciliation/pre-reconciliation-root-Lecture_Slides_Week06.pptx` | `f701be24a212e94b033d15ca0dd3a24284f5e1d29884a41dcad8945e46e7f8a2` | 14 slides, 14 notes; `screen16x9` metadata. |
| `qa/reconciliation/pre-reconciliation-hidden-codex-ppt-4x3.pptx` | `25085870a6446b3d827c04b878e587f08d2de61516fd75adccab868f66f0f624` | 14 slides, 14 notes; `screen4x3` metadata. |

The earlier round and authorised Slide 1 scientific-plot exception remain documented in `qa/qa-ledger.md`; its historical hashes are not substituted for the current canonical SHA above.
