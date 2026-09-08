# Fresh representative sample prompt — Slide 09

Generate one fresh 16:9 full-slide PowerPoint image for the Week 02 PHY4605 lecture deck.

Input images:

- Image 1: `assets/style-reference/approved-week02-slide-04.png` — approved Week 02 Teaching Courseware style reference. Match the warm-white canvas, deep navy title hierarchy, dusty-blue content, quiet sage validation cues, restrained ochre prompt accents, clean sans-serif typography, generous spacing, and approachable scientific tone. Match style only; do not copy the four-card layout or its motion content.
- Image 2: `assets/equations/radioactive-decay-model.png` — strict mathematical input asset. Include it visibly and preserve the equation exactly: `N(t) = N_0 e^{-\lambda t}`, `\lambda = \ln 2 / T_{1/2}`. Do not redraw, relabel, or replace the equation.

Slide title: `A second process can use the same loop logic`

Teaching purpose: introduce radioactive decay as a safe structural analogue for the same input -> current value -> calculate -> store -> check loop pattern. This is a transfer slide, not a derivation of radioactive decay and not an ODE lesson.

Required slide text, rendered exactly and legibly in English:

- `N0_counts = 800`
- `half_life_h = 6.0`
- `t_decay_h = 0:1:24`
- `Expect a decreasing count`
- `N(6 h) = 400`
- `N(24 h) = 50`

Composition: place the strict equation as a large left-side anchor; place a simple conceptual count-versus-time path on the right that decreases smoothly from an initial point to a lower final point; place a compact fixed-input and half-life-check strip along the lower third. Use direct labels and a small sage marker for the known checks. Keep one clear title area and avoid crowded cards.

Scientific constraints:

- Use the supplied model `N(t) = N0 exp(-lambda t)` and `lambda = log(2)/half_life_h` only as the stated model; do not add a differential equation, derivation, stochastic counting, fitting, or advanced numerical method.
- The conceptual count path must be monotonic decreasing and must not imply an exact quantitative plot beyond the two stated checks.
- Preserve the symbols and subscripts in the strict equation asset exactly.

Universal constraints: no slide number, thick outer frame, timings, source labels, production metadata, watermark, unrelated logo, or decorative unlabeled graph. Keep the final image readable at projection size and consistent with the approved Teaching Courseware style.

Generation method: built-in `image_gen`, edit-mode family, built-in default configuration. This is the only fresh sample for the current revision; do not generate any other slide image before lecturer approval.
