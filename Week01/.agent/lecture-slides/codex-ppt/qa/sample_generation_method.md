# Approved sample generation method

- Backend: built-in image tool.
- Tool: `image_gen`.
- Mode: edit.
- Model/config: built-in default `gpt-image-2` path; built-in default resolution and quality.
- Approved sample: `origin_image/slide_02.png`.
- Style reference used during sample edit: `qa/style-mockups/theme-1-selected-compact-prompt.png`.
- Strict scientific reference: `../assets/equation-motion-vertical-matte-v2.png`.
- Context preparation: the parent inspected the local sample and strict source images with `view_image` before generation.
- Content treatment: selected Muted Academic Blue + Sage direction; bold title only; regular explanatory copy; compact inline ochre note; no oversized prompt card.
- Worker handoff rule: every delegated slide must use the same built-in image tool and edit-mode family; a worker must return a blocker if that backend is unavailable.
