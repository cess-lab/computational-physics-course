# Delivery QA — 21 October 2026

- Existing canonical PPTX, PDF, lecture Live Script, practical and learning note preserved. No deck regeneration, source overwrite, publication or MP4 export performed.
- Source slide rasters extracted through the current PPTX slide relationships (not historical origin images).
- 15 spoken BM chapters; 3,760 words. Paid OpenAI Audio API, gpt-4o-mini-tts, marin. Final individual MP3s probed and decoded. Continuous MP3: 1777.03 seconds (29:37).
- Audio QA: full MP3 decoded with ffmpeg; levels measured without clipping. A 50-second technical-code sample was transcribed using the existing Mac mini local MLX Whisper service; content broadly matched the script. This does not constitute complete human pronunciation review.
- Canonical lecture demo executed successfully in a fresh MATLAB R2026b process. Instructor Demo_Cues.m also executed in a separate fresh process, with assertions for baseline, shared branch, original KVL, wrong-sign mismatch, minimum repair, row reordering, 2.1 V, and 2.2 V cases.
- Baseline x=[2;1] A; shared current=1 A. Wrong-sign mismatch=[-22/13;0] V. V2=2.1 V: [221/110;113/110] A. V2=2.2 V: [111/55;58/55] A.
- Remotion 4.0.537 project passes ESLint and TypeScript. All 15 overlay stills viewed at full resolution; overflow fixed. Slide 4 small vector panel corrected to explicit columns. Slide 14 incorrect original reordering image replaced by a verified correction overlay; original PPTX still contains that defect.
- Classroom90 duration=162000 frames at 30 fps (90 minutes). Spoken chapter audio is followed by silent hold time. NarrationOnly uses measured chapter duration plus 2-second chapter gaps. Highlight stages are chapter-relative timing cues, not word-level forced alignment.
- Each scene has an independent composition and authored sequence entry. The source slide image is retained without cropping. Additional callouts remain outside the original slide image, except the two explicit scientific correction overlays and non-opaque highlight borders.
- Remotion Studio verified in Codex browser, with connected audio tracks and play/pause operation. User preview retained. No MATLAB screen recording is represented.
- Listener PID 48362, correct project CWD, IPv4 *:3043. localhost and 100.72.254.120 HTTP 200; Mac mini SSH HTTP check also returned 200. LAN exposure follows the development IPv4 binding. Tailscale and running server required.
