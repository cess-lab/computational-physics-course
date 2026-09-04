# Week 07 Content Manifest

## Scope

- Week: 07
- Topic: Numerical integration
- Difficulty contract: Core first; Working exposure and Optional stretch removable without breaking the Core route
- Familiar lecture model: exponentially decaying force, `F(t) = F0*exp(-t/tau)`
- Physical integral: impulse, `J = integral F(t) dt`
- MATLAB dependency: MATLAB R2025a or later, base MATLAB only
- Lecture slide status: the lecturer has approved production through `codex-ppt`; the approved outline is under `Week07/.agent/lecture-slides/codex-ppt/outline.md`, while backend and representative sample approval remain pending

## Three Core Ideas

1. A numerical integral represents accumulated physical area over explicit limits, so the integral unit combines the vertical- and horizontal-axis units.
2. The trapezoidal rule approximates the curve between neighbouring samples by straight segments; MATLAB `trapz(x,y)` performs the same accumulation using the supplied coordinates.
3. A numerical integral is accepted only after refinement and comparison with an analytic or supplied reference, with simple error and physical interpretation.

## Locked Lecture Model

- Model: `F(t) = F0*exp(-t/tau)`
- Assumptions: positive one-dimensional force; constant decay time; model valid over the stated time interval
- Initial force: `F0_N = 12` N
- Decay time: `tau_s = 0.8` s
- Integration limits: `0 <= t <= T_s`, with `T_s = 2.0` s
- Accumulated quantity: impulse `J = integral_0^T F(t) dt`
- Impulse unit: N s, equivalent to kg m/s
- Core interval counts: `[4 8 16]`
- Corresponding sample spacings: `[0.5 0.25 0.125]` s
- Analytic reference: `J_exact = F0*tau*(1-exp(-T/tau))`
- Physical Core checks: `J > 0` and `J < F0*T = 24 N s`

## Locked Reference Values

- Analytic impulse: `8.8119840132 N s`

| Intervals | Delta t (s) | Trapezoidal impulse (N s) | Absolute error (N s) | Relative error (%) |
| ---: | ---: | ---: | ---: | ---: |
| 4 | 0.500 | 9.0969821492 | 0.2849981360 | 3.234211 |
| 8 | 0.250 | 8.8835796745 | 0.0715956613 | 0.812481 |
| 16 | 0.125 | 8.8299047499 | 0.0179207367 | 0.203368 |

For Working exposure, the supplied eight-interval Simpson result is `8.8124455163 N s`, with absolute error approximately `0.0004615030 N s`. Students read this comparison; they do not derive Simpson's rule or independently implement multiple composite quadrature methods as Core work.

## Core Algorithm Route

1. State the accumulated physical quantity, integration limits, and expected unit.
2. Choose a supplied number of intervals or sample spacing.
3. Create the independent-variable sample coordinates over the fixed limits.
4. Evaluate the physical model or use supplied tabulated values at those coordinates.
5. Interpret each trapezoid as interval width multiplied by average endpoint height.
6. Add the trapezoids explicitly for one coarse worked example.
7. Use `trapz(x,y)` for the same samples and confirm agreement.
8. Repeat at two finer supplied resolutions without changing the physical model.
9. Compare with the analytic or supplied reference and state simple error.
10. Report the integral with its physical unit and interpretation.

## Required Core Checkpoints

- accumulated quantity and limits identified correctly;
- area unit derived from vertical-axis unit multiplied by horizontal-axis unit;
- sign/bound prediction before computing;
- sampled values tied to the same fixed physical model;
- one-trapezoid geometry explained in words;
- one coarse composite trapezoidal calculation traced;
- correct `trapz(x,y)` use with physical coordinates;
- two or three supplied resolutions compared;
- analytic/reference validation;
- simple absolute or relative error;
- physical interpretation of the accumulated result;
- diagnosis of one clear missing-spacing or wrong-limit defect.

## Working Exposure

- one supplied Simpson-rule result for comparison;
- convergence behaviour interpreted from a supplied refinement/error table;
- qualitative recognition that different quadrature rules may converge at different rates.

## Optional Stretch

- derivation of quadrature error order;
- independent implementation and comparison of several composite rules;
- adaptive quadrature and tolerance control.

## Practical Transfer Contexts

1. Decaying force: integrate force over time to estimate impulse; unit N s.
2. Position-dependent force: integrate force over displacement to estimate work; unit N m = J.
3. Decaying current: integrate current over time to estimate charge; unit A s = C.

The practical contains ten progressive micro-challenges. Every challenge names required evidence and a short defence hook. Student-facing files contain no solved challenge answers.

## Capstone Progression

Week 07 includes the graded **Approved model, supplied/selected method, and validation plan** milestone worth 3% of the course. It builds directly on the Week 06 feasibility proposal and locks the model, numerical job/method, principal output, one required validation check, one chosen independent check, expected physical behaviour, limitation, and concise AI-use decision record before the Week 08-11 process checkpoints.

## Diagnostic Planning

The course-level hidden file `.agent/google-forms/Week07_Question_Key_and_AI_Analysis.md` specifies a six-question pre-practical diagnostic covering physical accumulation, units/scaling, algorithm/code reasoning, numerical/defect diagnosis, validation reasoning, and confidence. It is a draft specification only and does not publish a live Google Form.

## Scientific Illustration Decision

No ImageGen illustration is required for the learning note or Live Scripts. The key novice representation barrier is the relation between a smooth physical curve, discrete samples, and the straight-sided trapezoids whose areas are summed. A deterministic MATLAB force-time plot with the coarse trapezoidal fill is more precise, reproducible, and auditable than generated imagery. The same figure can support the learning note and later serve as a strict numerical reference if slide production is authorised.

## Lecture Slide Gate

The lecturer authorised Week 07 slide production through the installed `codex-ppt` skill on 2026-09-04. The approved outline and strict-asset mapping live at `.agent/lecture-slides/codex-ppt/outline.md`. Follow the remaining Codex-PPT gates: confirm the image backend, generate exactly one representative sample slide, obtain explicit sample approval, then create jobs, recorded state, remaining slide images, English `speech.md`, QA evidence, and the assembled PPTX.

## Publication Gate

Before calling the non-slide Week 07 package complete:

1. generate and inspect the MATLAB teaching figure embedded in the learning note;
2. compile and visually inspect the learning-note PDF;
3. run the lecture demonstration from a fresh MATLAB session;
4. run the practical baseline from a fresh MATLAB session;
5. run the hidden practical reference solution and confirm all validation checks pass;
6. run MATLAB `checkcode` on both student-facing scripts;
7. verify the capstone milestone matches the 3% Week 07 assessment blueprint;
8. verify Core content uses trapezoidal geometry, `trapz`, explicit limits/units, refinement, analytic/reference comparison, and simple error;
9. verify Simpson/convergence-rate reading is clearly Working exposure and quadrature derivations/adaptive methods remain Stretch; and
10. verify no Week 07 PPTX is published until every Codex-PPT slide state and QA gate is complete.
