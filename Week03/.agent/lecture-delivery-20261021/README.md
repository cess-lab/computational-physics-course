# Week 03 instructor delivery package

Prepared 21 October 2026 for a 90-minute lecture using the existing 15-slide deck and MATLAB Live Script.

- [Instructor script](Week03_Instructor_Script_90min.md): spoken BM Malaysia, English stage directions, complete 90-minute map, five MATLAB stops, questions, expected answers, repair prompts, and exit ticket.
- [Continuous narration](outputs/Week03_Narration_BM.mp3): 29 minutes 37 seconds, spoken text only.
- [Audio chapters](outputs/Week03_Narration_Chapters.csv): mapping from MP3 timestamps to lecture timing.
- [Instructor MATLAB cue sheet](Demo_Cues.m): baseline, shared current, substitution, wrong-sign repair, row reordering, and 2.1/2.2 V source changes.
- Remotion Studio: [NarrationOnly](http://100.72.254.120:3043/NarrationOnly) for continuous rehearsal; [Classroom90](http://100.72.254.120:3043/Classroom90) for the exact 90-minute pacing scaffold. Individual chapters appear under Slide-chapters.

## Using the materials

Open the script beside the slides. Pause chapter playback at the prediction, discussion, and MATLAB cues. The Classroom90 timeline plays each spoken chapter and then holds silently for the remaining allotted time. It includes no recording of students or MATLAB. Code panels show verified reference excerpts and outputs. The continuous MP3 excludes classroom holds.

The two bridge-circuit slides are optional recognition only. If behind, use their two minutes for Core substitution practice. No Core 3×3 solve is introduced.

## Scientific corrections in Remotion

The original PPTX has been preserved. On slide 14, the original reordering pane has incorrect coefficients/signs and an inconsistent unknown-order diagram. The Remotion overlay replaces that pane with the verified row-only reorder: A=[3 -1;-1 4], b=[5;2] → Ar=[-1 4;3 -1], br=[2;5], with x=[I1;I2] unchanged. Both solves give [2;1] A. When teaching directly from the unmodified PPTX, skip its original reordering pane and show the matrices in MATLAB instead.

On slide 4, a small notation panel is covered with explicit column-vector notation x=[I1;I2] and b=[V1;V2]. The large main matrix was already correct.

## Preview access

The project server is running on port 3043, bound to all IPv4 interfaces. This also permits access from the host's LAN. Both devices need Tailscale connected with permitted access. Localhost, host tailnet access, and an SSH-based request from Mac mini were tested successfully. The server must remain running. To restart later, open a terminal in remotion-studio and run `npm run dev`. This is a project preview, not a published site.

## Audio disclosure

The voice is AI-generated speech using the paid OpenAI Audio API, model gpt-4o-mini-tts and voice marin. Disclose the AI-generated voice if sharing. All fifteen audio clips are kept in remotion-studio/public/audio; original request outputs and input texts remain under this hidden instructor folder.

## Reproducibility and QA

MATLAB R2026b fresh-session runs verified the canonical lecture demo and instructor cue sheet. The project passes its lint/type checks. All 15 overlay views were inspected; corrected slide 14 and column-vector notation are retained as overlays. Audio files were decoded/probed, with a sample of the MATLAB explanation transcribed locally on Mac mini. This is sample-based speech QA, not a human review of every pronunciation. No MP4 export was requested or rendered; Remotion Studio is the interactive deliverable.
