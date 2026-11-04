# Dispatch Ledger — Deck A Revised Brief Detail Batch

| Field | Recorded value |
|---|---|
| Coordinator model | `gpt-5.6-luna` |
| Coordinator reasoning effort | `xhigh` |
| Worker model/effort | inherited from coordinator; exact-match requested and preserved by `fork_context=true` with no model or effort override |
| Backend | built-in image tool / `image_gen` / generate / built-in default |
| Approved style reference | `origin_image/slide_04.png` |
| New slide 06 | Wegener (`01a0850f-d99a-7500-9db1-a02195e7e5e1`) — Projectile pair |
| New slide 07 | Plato (`01a0850f-da15-7930-a645-7b13408d8991`) — Circuit pair |
| New slide 08 | Mill (`01a0850f-dabf-7ae3-9a04-33c71dfb741a`) — Radiation pair |
| New slide 09 | Nietzsche (`01a0850f-dc49-7751-98fa-2edd01d489dc`) — Thermal pair; regenerated after duplicate-source QA failure |
| New slide 10 | Herschel (`01a0850f-db8b-7162-aaa0-91553f9e363d`) — Force pair |
| Retained slides | Slides 01–03 and 05, plus prior slides 08–18 shifted to final slides 11–21; retained generated images were archived under `qa/archive/pre-brief-detail-20260909/` and recorded through `record_slide_result.py`. |
| Dispatch record | `slide_jobs.json` via `record_slide_dispatch.py` |

All five revised brief-detail slides used the same inherited worker policy and built-in image backend. The parent remains responsible for result recording, full-size visual QA, speaker notes and PPT assembly.
