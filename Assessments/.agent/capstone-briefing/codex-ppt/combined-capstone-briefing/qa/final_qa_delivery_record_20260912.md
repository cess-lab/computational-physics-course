# Final QA and Delivery Record — 2026-09-12

## Updated artefact

- Student-facing deck: `Assessments/Student-facing/PHY4605_Capstone_Briefing.pptx`
- Hidden assembled source: `combined-capstone-briefing.pptx`
- Change: replaced Slide 13 with one full-width capstone rubric table.

## Slide 13 QA

- One rubric table only; no second grading panel.
- Seven criteria are present: model; algorithm/MATLAB evidence; principal output/reproducibility; validation; physical interpretation/limitations; presentation/communication; individual defence/AI-use decision record.
- Four performance levels are present: Excellent, Good, Satisfactory and Weak.
- Criterion weights total 100%: 15 + 25 + 15 + 15 + 15 + 10 + 5.
- The slide shows the rubric total only; it does not show the 15% course conversion or milestone/checkpoint weights.
- Full-size source image and LibreOffice-rendered PDF page inspected; no clipping or overlap observed.

## Production evidence

- Worker: Kepler (`gpt-5.6-luna`, maximum reasoning effort, inherited full history via `fork_context=true`).
- Backend: built-in `image_gen`.
- Slide job result recorded in `slide_jobs.json`.

## Package verification

- 14 slide images assembled.
- 14 speaker-note XML parts embedded.
- 14 media images embedded.
- LibreOffice render: 14-page PDF at 16:9.
- Student-facing copy byte-compared with the hidden assembled deck.
