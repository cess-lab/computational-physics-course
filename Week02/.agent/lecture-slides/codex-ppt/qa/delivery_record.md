# Week 02 Codex-PPT delivery record

- Student-facing PPTX: `Week02/Lecture_Slides_Week02.pptx`
- Hidden Codex-PPT project: `Week02/.agent/lecture-slides/codex-ppt/`
- Slide count: 14
- Confirmed backend: built-in image tool (`image_gen`, edit-mode family)
- Coordinating model / effort: `gpt-5.6-luna` / `max`
- Exact-match dispatch: all 13 non-sample slides were produced by inherited full-history Luna Max workers with model and reasoning-effort overrides omitted; dispatch and result evidence is in `qa/dispatch_ledger.md` and `slide_jobs.json`.
- Sample approval: Slide 04 is accepted at `origin_image/slide_04.png`; generation method is recorded in `qa/sample_generation_method.md` and approval in `qa/outline_approval.md`.
- Slide-state summary: 1 accepted sample, 13 recorded worker results, 0 pending, 0 dispatched, 0 blocked.
- Visual QA: all 14 origin images were inspected at full size; rendered PPTX contact sheet and selected full-size rendered pages were inspected. Titles, labels, code, equations, units, connectors, and functional colour use are readable; no outer frame, slide number, watermark, or obvious clipping was found.
- Scientific QA: locked model and values agree with the Week 02 README, Live Script, deck spec, prompts, and notes. The exact MATLAB comparison plot was regenerated and validated from a fresh MATLAB session, but Slide 11 intentionally uses a labelled conceptual evidence sketch rather than an image-generation redraw of that plot.
- Speaker notes: 14 English talk tracks embedded; assembly validation found non-empty notes on every slide.
- PPTX validation: `unzip -t` passed; `officecli validate` passed; OpenXML inspection confirmed 16:9 dimensions, 14 slides, 14 notes pages, and one full-slide picture per slide.
- Final PPTX SHA-256: `9c04df16cc9ecb816ff3f6d24e11eceb08a18589df7847a7fe4ca20f52d6a7bc`
- Archived predecessor: `qa/archived-predecessor-2026-09-02/Lecture_Slides_Week02-before-replacement.pptx` (SHA-256 `ca6fccebb2be37d8f8bdf2ddfb13eb990b67875140d50786c143f6b94ec51cc2`)
- Fresh MATLAB evidence logs: `qa/live_script_fresh_session_2026-09-02.log` and `qa/matlab_plot_generation_fresh_session_2026-09-02.log`
- Known limitation: Slide 11 is explicitly conceptual and directs exact numerical values to the MATLAB output; this was approved by the lecturer after the strict-plot generation blocker.
