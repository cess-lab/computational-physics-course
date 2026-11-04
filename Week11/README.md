# Week 11 — Sensitivity Analysis: Propagate input ranges into defensible output ranges

Use one-at-a-time parameter variation to turn plausible input uncertainty into an output range, then distinguish parameter uncertainty from numerical approximation error and model limitation.

## Materials

- `Week11_Learning_Note_Sensitivity_and_Uncertainty_Propagation.pdf`: physics-first learning note using Hooke's law to connect an uncertain spring stiffness to a defensible range of predicted extension.
- `Week11_Lecture_Demonstration_Hookes_Law_Uncertainty.m`: complete lecturer-led plain-text Live Script with baseline/lower/upper cases, one-at-a-time comparison, validation, and Working-exposure sensitivity/propagation ideas.
- `Week11_Practical_AI_Enabled_Sensitivity_and_Uncertainty_Challenge_Set.m`: ten progressive group challenges across an Ohmic resistor, a small-angle pendulum, and exponential attenuation.
- [Lecture slide deck](Lecture_Slides_Week11.pptx): assembled 14-slide image-based Teaching Courseware deck, with 14 recorded slide jobs, 14 source images, and 14 presenter-note sections retained under `.agent/lecture-slides/codex-ppt/`.

## Weekly workflow

**Before:** Read the learning note, complete the dedicated Week 11 diagnostic in Google Classroom when it is released, and predict which input range should dominate the output range.

**During:** Follow `model -> uncertain input -> controlled cases -> output range -> validation -> uncertainty source -> interpretation`; run the supplied MATLAB work and complete the exit ticket.

**Practical:** Work in a group of two or three through ten progressive challenges, recording the model, units, algorithm, code/output, validation, interpretation, and material AI decisions. Rerun the final work from a fresh MATLAB session.

**After:** Submit the locked packet through Google Classroom. The question slot and eligible student are drawn after submission for the individual defence. Feedback and any optional short remediation/retry are issued through Classroom.

**Portfolio status:** Week 11 is one of the ten counted practical packets; the best eight packets count for the group component.

## Current slide-deck status

The PPTX and hidden assembled copy are present and byte-identical. Structural, rendering, and provenance-gap evidence is retained in `.agent/lecture-slides/codex-ppt/qa/final_qa_delivery_record.md` and `provenance_gap_rerun_record_2026-09-07.md`. The endpoint-only title/closing normalization is approved under the course-level normalization approval record; the older full-deck production-provenance gap remains archived as historical evidence and is not retroactively asserted as complete.

## Learning Focus

The Core route is:

`physical model -> uncertain input and plausible range -> baseline/lower/upper cases -> one-at-a-time sweep -> output range -> validation -> distinguish uncertainty sources -> practical conclusion without false precision`

The lecture deliberately reuses the Week 04 Hooke's-law model. At a fixed applied force of `10 N`, spring stiffness is treated as uncertain around a `100 N/m` baseline with a plausible range from `95 N/m` to `105 N/m`. The corresponding extension spans approximately `0.09524 m` to `0.10526 m` around the `0.10000 m` baseline.

The Core message is that a range in a measured or specified parameter produces a range in the model output even when the MATLAB calculation itself is deterministic. Students also distinguish three different limitations: numerical approximation error, parameter uncertainty, and model limitation.

## Working Exposure

Working exposure compares a second uncertain input one at a time: applied force from `9.8 N` to `10.2 N` at fixed `k = 100 N/m`. This gives an extension range from `0.098 m` to `0.102 m`, smaller than the stiffness-driven range for the supplied uncertainties. A supplied normalized percentage sensitivity and a supplied first-order independent-uncertainty formula are interpreted but not derived.

## MATLAB Requirement

The editable Live Scripts use MATLAB's plain-text Live Script format and require MATLAB R2025a or later. The Week 11 Core files use base MATLAB only. Run sections from top to bottom in a fresh MATLAB session.

## Practical and AI Use

The practical is an AI-enabled group challenge set using three analogous supplied-model contexts: Ohm's law, a small-angle pendulum, and exponential attenuation. Students may use generative AI to write, debug, or improve code, but each challenge still requires the supplied model and units, a one-at-a-time uncertainty plan, reproducible evidence, validation, interpretation, and a concise AI decision record.

Google Classroom remains the official submission record. Complete and lock group evidence before the question slot and individual defender are drawn. The Week 11 practical includes a compact capstone uncertainty/limitation checkpoint but no new graded capstone milestone.

Complete the dedicated Week 11 diagnostic through its Google Classroom coursework when released. If it reveals a common misconception, the lecturer may post an optional 10–15 minute remediation with one retry and confidence check; it is not a prerequisite for the next lecture. The local question key remains planning material until publication is approved.

## Test 2 timing

Test 2 covers Weeks 06–11 and is planned after this week / alongside Week 12, within the UPM Assessment II window of 30 November 2026–03 January 2027. The exact PHY4605 date is to be confirmed.

## Instructor / QA Package

Hidden support materials are stored under `.agent/`:

- learning-note LaTeX source, figures, build output, and visual QA under `.agent/learning-notes/`;
- locked numerical evidence, plots, and run logs under `.agent/matlab/`;
- practical reference answers, diagnostic draft, A/B variant bank, defence rubric, rotation ledger, member summary, and practical QA under `.agent/practical/`;
- lecture-deck source images, prompts, speaker notes, slide-job state, and QA records under `.agent/lecture-slides/codex-ppt/`; endpoint-normalization approval and dispatch evidence are recorded at the course level, while historical full-deck provenance remains separately archived.
