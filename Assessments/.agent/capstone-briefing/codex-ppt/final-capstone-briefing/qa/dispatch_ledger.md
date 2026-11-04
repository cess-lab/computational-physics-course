# Dispatch Ledger — Deck B

| Field | Recorded value |
|---|---|
| Coordinator model | `gpt-5.6-luna` |
| Coordinator reasoning effort | `xhigh` |
| Worker model/effort | inherited from coordinator; exact-match requested and preserved by `fork_context=true` with no model or effort override |
| Worker | Bernoulli (`01a084df-762a-7d42-85f1-f084697eb8d9`) |
| Ownership | All pending Deck B slide jobs: 01-07 and 09-15 |
| Backend | built-in image tool / `image_gen` / generate / built-in default |
| Approved style reference | `origin_image/slide_08.png` |
| Dispatch record | `slide_jobs.json` via `record_slide_dispatch.py` |

The worker was given the complete per-slide prompt directory and instructed to return generated source paths and QA notes only. The parent remains responsible for result recording, visual QA, speaker notes and PPT assembly.
