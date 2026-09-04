# Week 06 Lecture Deck QA Ledger

## Round 1 — generation and independent audit

- Generator: `gpt-5.6-terra`, medium reasoning; full-slide images produced with the approved built-in ImageGen backend and assembled through `codex-ppt`.
- Auditor: `gpt-5.6-sol`, medium reasoning; outcome: **NEEDS REPAIR**.
- Findings: clarify the electric-field sign relation; remove the two-dimensional projectile implication; standardise secant/tangent colours; scope the forward-difference approximation claim to the curved quadratic model; remove punctuation from the central-difference numerator; distinguish Working exposure from the return to Core; repair the `T (K)` label.

## Round 2 — repairs and final audit

- Generator: `gpt-5.6-terra`, medium reasoning; regenerated Slides 2, 3, 4, 12, 13, and 14 with the same ImageGen-backed `codex-ppt` route. The last two repair dispatches were interrupted by a transient quota limit; their recorded built-in-ImageGen outputs were retained and visually checked before assembly.
- Auditor: `gpt-5.6-sol`, medium reasoning; outcome: **PASS**.
- Auditor finding: all 14 slides render correctly, match Week 05's visual language, and Slides 2, 3, 4, 12, 13, and 14 satisfy every stated repair criterion.

## Final artefact evidence

- Student-facing artefact: `Week06/Lecture_Slides_Week06.pptx`
- SHA-256 (superseded by the authorised Slide 1 scientific-plot exception): `1d81b9622804be6707d1ea8159f83bdec97b9d13a1ac2860fe950e17eb3074e4`
- Assembly: 14 full-slide images; 14 of 14 speaker notes written.
- Structural check: `officecli validate` passed with no errors.
- Visual evidence: `qa/deck-grid-final.png`.

## Slide 1 follow-up — blocked after three ImageGen rounds

- The user identified the opening parabolic curve as visually incorrect. Two ImageGen repairs improved the curve into a clearly concave-down `y`-versus-`t` graph, but Sol identified that the displayed second ground intercept and the `t0 = 1.0 s` marker did not align exactly with the locked model.
- A third targeted ImageGen attempt also failed those coordinate anchors and was rejected. The active job is recorded as blocked rather than replacing the assembled deck with that unsuitable candidate.
- A fully accurate graph requires an exception to the all-ImageGen full-slide restriction: a native MATLAB-rendered plot as a preserved scientific graphic in Slide 1.

## Slide 1 scientific-plot exception — authorised

- The lecturer authorised the exception. The approved ImageGen Slide 1 artwork remains the visual base; the graph region is replaced by MATLAB output from `qa/make_slide01_exact_plot.m`.
- The rendered graph uses the locked model `y(t)=20t-4.905t^2`, with anchors at `(0,0)`, maximum near `(2.04 s, 20.39 m)`, `t0=1.0 s`, and the second ground intercept at `4.08 s`.
- Final Sol audit: **PASS**. The auditor confirmed the audited image is embedded unchanged, has no clipping or overlap, and remains consistent with Week 05's style.
- Final SHA-256: `25085870a6446b3d827c04b878e587f08d2de61516fd75adccab868f66f0f624`.
