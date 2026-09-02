# Approved sample generation method

- Backend: built-in image tool.
- Tool: `image_gen`.
- Mode: edit.
- Model/config: built-in default `gpt-image-2` path; built-in default resolution and quality.
- Approved sample: `origin_image/slide_04.png`.
- Style reference used during sample edit: Week 01 Codex-PPT approved sample, style-only.
- Content treatment: new four-job process diagram with a compact lower one-pass teaching band; no original Week 02 slide text or illustration reused.
- Context preparation: the parent inspected the Week 01 style reference and the Week 02 sample with `view_image` before generation and revision.
- Worker handoff rule: every delegated slide must use the same built-in image tool and edit-mode family; a worker must return a blocker if that backend is unavailable.
