# Week 03 sample-generation method

- Backend used: built-in image tool
- Tool name: `image_gen`
- Mode: edit
- Coordinating model/effort: `gpt-5.6-luna` / `max`
- Style reference inspected: `Week02/.agent/lecture-slides/codex-ppt/origin_image/slide_04.png`
- Strict source inspected: `Week03/.agent/lecture-slides/codex-ppt/assets/strict/numeric_system_units/numeric_system_units.png`
- Approved sample: `Week03/.agent/lecture-slides/codex-ppt/origin_image/slide_06.png`
- Sample approval: lecturer approved the representative sample on 2026-09-02 with the message `approve sample`.
- Context preparation: the parent inspected the local style reference and strict source with `view_image` before the image-generation call.
- Handoff rule: every remaining slide worker must use this same built-in image tool, edit mode, and local-image context preparation; a worker must return a blocker if that path is unavailable.
