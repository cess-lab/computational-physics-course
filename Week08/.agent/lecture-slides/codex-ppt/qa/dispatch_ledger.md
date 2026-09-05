# Exact-match slide-worker dispatch ledger

The coordinator is system-reported as GPT-5. The runtime does not expose a separate human-readable reasoning-effort label. Every worker is spawned with `fork_turns="all"` and with no model or reasoning override; the collaboration runtime contract guarantees inheritance of both the parent model and current reasoning effort. Actual worker completion results are required before recording a slide.

| Slide | Worker ID | Prompt | Model and effort evidence | Status |
| --- | --- | --- | --- | --- |
| slide_01 | `6a8895a1-52b8-53ad-a028-75854e9e54a2` | `prompts/slide_01.json` | `fork_turns="all"`; no overrides; exact inherited coordinator settings | recorded after full-size parent QA |
| slide_02 | `63059cde-3832-5b07-a4d7-361930e5ae9a` | `prompts/slide_02.json` | `fork_turns="all"`; no overrides; exact inherited coordinator settings | recorded after full-size parent QA |
| slide_03 | `020ce97d-9f01-5af1-8950-e4a3eb14bea0` | `prompts/slide_03.json` | `fork_turns="all"`; no overrides; exact inherited coordinator settings | recorded after full-size parent QA |
| slide_04 | `bc21eca1-9b1d-5f45-a451-0cb001bdcd1a` | `prompts/slide_04.json` | `fork_turns="all"`; no overrides; exact inherited coordinator settings | recorded after full-size parent QA |
| slide_06 | `/root/slide_06` | `prompts/slide_06.json` | `fork_turns="all"`; no overrides; exact inherited coordinator settings | recorded after full-size parent QA |
| slide_07 | `/root/slide_07` | `prompts/slide_07.json` | `fork_turns="all"`; no overrides; exact inherited coordinator settings | recorded after full-size parent QA |
| slide_08 | `/root/slide_08` | `prompts/slide_08.json` | `fork_turns="all"`; no overrides; exact inherited coordinator settings | recorded after full-size parent QA |
| slide_09 | `/root/slide_09` | `prompts/slide_09.json` | `fork_turns="all"`; no overrides; exact inherited coordinator settings | recorded after full-size parent QA |
| slide_10 | `/root/slide_10` | `prompts/slide_10.json` | `fork_turns="all"`; no overrides; exact inherited coordinator settings | recorded after regeneration and full-size parent QA |
| slide_11 | `/root/slide_11` | `prompts/slide_11.json` | `fork_turns="all"`; no overrides; exact inherited coordinator settings | recorded after full-size parent QA |
| slide_12 | `/root/slide_12` | `prompts/slide_12.json` | `fork_turns="all"`; no overrides; exact inherited coordinator settings | recorded after full-size parent QA |
| slide_13 | `/root/slide_13` | `prompts/slide_13.json` | `fork_turns="all"`; no overrides; exact inherited coordinator settings | recorded after full-size parent QA |
| slide_14 | `/root/slide_14` | `prompts/slide_14.json` | `fork_turns="all"`; no overrides; exact inherited coordinator settings | recorded after full-size parent QA |
