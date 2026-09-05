# Week 10 Slide Dispatch Ledger

Main runtime model: GPT-5

Main reasoning effort: runtime default

Inheritance method: `fork_turns="all"` with no model or reasoning-effort override. The runtime guarantees inheritance of the coordinating agent's model and reasoning setting.

| Slide | Worker ID | Prompt path | Status |
| --- | --- | --- | --- |
| 01 | `/root/w10_slide01` | `prompts/slide_01.json` | dispatched |
| 02 | `/root/w10_slide02` | `prompts/slide_02.json` | dispatched |
| 03 | `/root/w10_slide03` | `prompts/slide_03.json` | dispatched |
| 04 | `/root/w10_slide01` | `prompts/slide_04.json` | dispatched |
| 05 | `/root/w10_slide02` | `prompts/slide_05.json` | dispatched |
| 06 | `/root/w10_slide03` | `prompts/slide_06.json` | dispatched |
