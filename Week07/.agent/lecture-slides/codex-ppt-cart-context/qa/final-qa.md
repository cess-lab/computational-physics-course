# Week 07 Cart-Context Revision — Final QA

- Final student-facing deck: `Week07/Lecture_Slides_Week07.pptx`
- Slide count: 17
- Speaker notes: 17 of 17 slides
- Image backend: built-in image tool
- Slide-job state: 14 accepted reused slides; 3 newly recorded slides; no pending, dispatched, or blocked jobs
- Final SHA-256: `b969d2d50043cdfda242fd77c7a7e657fd87f7fd6f32b9537ca3c15667830c3d`
- Hidden assembled deck and student-facing deck hashes match.

## Revision scope

The original 14 approved slide images were retained bit-for-bit and renumbered around three inserted slides:

1. Slide 02 — A Cart Driven by a Fading Thrust
2. Slide 05 — From Reservoir Pressure to Momentum
3. Slide 14 — Impulse Predicts the Cart's Final Speed

## Scientific checks

- Force model retained exactly: `F(t) = 12 exp(-t/0.8) N`, for `0 <= t <= 2.0 s`.
- Analytic impulse retained: `J = 8.8119840132 N s`.
- Cart mass: `m = 2.0 kg`.
- Final-speed calculation checked: `Delta v = J/m = 4.4059920066 m/s`, reported as approximately `4.41 m/s`.
- Physical chain is explicit: reservoir empties, thrust decreases, force is sampled, trapezoids accumulate impulse, momentum changes, and final speed is predicted.
- Assumptions are stated: constant mass, starts from rest, and negligible resistance.

## Visual checks

- Titles are left aligned with a horizontal navy rule beneath them.
- The three new slides use warm orange, yellow, coral, and red accents alongside the established blue, avoiding a predominantly green-blue appearance.
- All three new slides were inspected at full size.
- The 14 pre-existing approved slides were not regenerated.
