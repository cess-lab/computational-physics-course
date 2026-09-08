# Week 03 sample-generation method — 2026-09-08 revision

- Backend used: built-in image tool
- Tool name: `image_gen`
- Mode: edit
- Coordinating model/effort: `gpt-5.6-luna` / `max`
- Style reference inspected before generation: prior approved Teaching Courseware sample `Week03/.agent/lecture-slides/codex-ppt/origin_image/slide_06.png`.
- Strict sources inspected before generation: revised circuit asset and shared-current equation asset.
- Approved sample: `Week03/.agent/lecture-slides/codex-ppt/origin_image/slide_02.png`.
- Sample approval: the lecturer said `please continue` after the revised sample was presented on 2026-09-08.
- Context preparation: the parent inspected the prior approved style reference and updated strict sources with `view_image` before the image-generation call, then inspected the generated Slide 02 before dispatching workers.
- Handoff rule: every remaining slide worker must use this same built-in image tool, edit mode, and local-image context preparation; a worker must return a blocker if that path is unavailable.
