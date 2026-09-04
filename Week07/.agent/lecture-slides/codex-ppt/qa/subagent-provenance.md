# Week 07 Slide Subagent Provenance

## Coordinator runtime

- Main model identifier: `gpt-5.6-sol`
- Main reasoning effort: `medium`
- Evidence: `/Users/khairuladib/.codex/config.toml` model and `model_reasoning_effort` entries inspected before dispatch.
- Required inheritance method: native subagent spawn with `fork_turns="all"`; model and reasoning-effort overrides omitted.
- Runtime guarantee: full-history forks inherit the parent model and reasoning effort.
- Selected image backend: `built-in image tool` through `image_gen`, edit mode.
- Approved style reference: `origin_image/slide_06.png`.

## Dispatch ledger

| Slide | Worker ID | Prompt path | Model | Effort | Inheritance |
| --- | --- | --- | --- | --- | --- |
| slide_01 | `/root/week07_slide_01` | `prompts/slide_01.json` | `gpt-5.6-sol` | `medium` | `fork_turns="all"`; no overrides |
| slide_02 | `/root/week07_slide_02` | `prompts/slide_02.json` | `gpt-5.6-sol` | `medium` | `fork_turns="all"`; no overrides |
| slide_03 | `/root/week07_slide_03` | `prompts/slide_03.json` | `gpt-5.6-sol` | `medium` | `fork_turns="all"`; no overrides |
| slide_04 | `/root/week07_slide_04` | `prompts/slide_04.json` | `gpt-5.6-sol` | `medium` | `fork_turns="all"`; no overrides |
| slide_05 | `/root/week07_slide_05` | `prompts/slide_05.json` | `gpt-5.6-sol` | `medium` | `fork_turns="all"`; no overrides |
| slide_07 | `/root/week07_slide_07` | `prompts/slide_07.json` | `gpt-5.6-sol` | `medium` | `fork_turns="all"`; no overrides |
| slide_08 | `/root/week07_slide_08` | `prompts/slide_08.json` | `gpt-5.6-sol` | `medium` | `fork_turns="all"`; no overrides |
| slide_09 | `/root/week07_slide_09` | `prompts/slide_09.json` | `gpt-5.6-sol` | `medium` | `fork_turns="all"`; no overrides |
| slide_10 | `/root/week07_slide_10` | `prompts/slide_10.json` | `gpt-5.6-sol` | `medium` | `fork_turns="all"`; no overrides |
| slide_11 | `/root/week07_slide_11` | `prompts/slide_11.json` | `gpt-5.6-sol` | `medium` | `fork_turns="all"`; no overrides |
| slide_12 | `/root/week07_slide_12` | `prompts/slide_12.json` | `gpt-5.6-sol` | `medium` | `fork_turns="all"`; no overrides |
| slide_13 | `/root/week07_slide_13` | `prompts/slide_13.json` | `gpt-5.6-sol` | `medium` | `fork_turns="all"`; no overrides |
| slide_14 | `/root/week07_slide_14` | `prompts/slide_14.json` | `gpt-5.6-sol` | `medium` | `fork_turns="all"`; no overrides |
