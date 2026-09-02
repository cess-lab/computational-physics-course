# Week 03 slide-worker dispatch ledger

- Coordinating model: `gpt-5.6-luna`
- Coordinating reasoning effort: `max`
- Inheritance method: full-history fork (`fork_context=true`, equivalent to `fork_turns="all"`); worker model and reasoning-effort overrides omitted.
- Selected image backend: `built-in image tool` / `image_gen` / edit mode.
- Sample: `origin_image/slide_06.png`, approved by lecturer on 2026-09-02.

## Dispatch records

| Slide | Worker ID | Worker nickname | Prompt file | Status |
| --- | --- | --- | --- | --- |
| 01 | `01a05ff2-fb46-7f31-b2c5-e1ea62ac57fa` | Goodall | `prompts/slide_01.json` | recorded |
| 02 | `01a05ff2-fa2b-7c42-a9cb-9dbef2c0f591` | Euler | `prompts/slide_02.json` | recorded |
| 03 | `01a05ff3-0849-7631-86cc-cd7716b920f5` | Carver | `prompts/slide_03.json` | recorded |
| 04 | `01a05ff2-fdac-7fc2-aaa5-32dd0824347c` | Archimedes | `prompts/slide_04.json` | recorded |
| 05 | `01a05ff5-619d-75b0-af96-19dc26b4cdcf` | Bohr | `prompts/slide_05.json` | recorded |
| 06 | — | — | approved sample `origin_image/slide_06.png` | accepted |
| 07 | `01a05ff5-6129-70e2-9f85-9e075cfb7c33` | Harvey | `prompts/slide_07.json` | recorded |
| 08 | `01a05ff5-67d1-7bd2-ae95-621a5fee594b` | Anscombe | `prompts/slide_08.json` | recorded |
| 09 | `01a05ff5-6367-71e0-b550-7a487e0b0733` | Confucius | `prompts/slide_09.json` | recorded |
| 10 | `01a05ff7-73df-7801-b69c-3bb0b32cb8fd` | Pasteur | `prompts/slide_10.json` | recorded |
| 11 | `01a05ff7-7326-74d3-8a5a-ac0768438f85` | Schrodinger | `prompts/slide_11.json` | recorded |
| 12 | `01a05ff7-fc97-7703-ae3a-d45f3bac2f7a` | Gauss | `prompts/slide_12.json` | recorded |
| 13 | `01a05ff8-e3bb-7a61-9939-8107364d01a8` | Boyle | `prompts/slide_13.json` | recorded |
| 14 | `01a05ff9-57d9-75b0-bb13-a73ea4dd7a05` | Cicero | `prompts/slide_14.json` | recorded |
