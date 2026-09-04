# Week 06 Content Manifest

## Scope

- Week: 06
- Topic: Numerical differentiation
- Difficulty contract: Core first; Working exposure and Optional stretch removable without breaking the Core route
- Familiar lecture model: level-ground vertical component of projectile motion, `y(t) = y0 + v0*t - 0.5*g*t^2`
- Physical derivative: vertical velocity, `v(t) = dy/dt`
- MATLAB dependency: MATLAB R2025a or later, base MATLAB only
- Lecture slide status: outline only; **no Week 06 slide deck is created at this stage**

## Three Core Ideas

1. A derivative is a physical rate or gradient; numerically, a forward difference estimates that rate from two nearby model values.
2. The step size `h` controls how local the estimate is, so students compare a small supplied set of `h` values while preserving derivative units.
3. A numerical derivative is accepted only after comparison with an analytic or supplied reference and a simple absolute/relative error statement.

## Locked Lecture Model

- Model: `y(t) = y0 + v0*t - 0.5*g*t^2`
- Assumptions: vertical motion under constant gravitational acceleration; negligible air resistance
- Initial position: `y0_m = 0` m
- Initial vertical velocity: `v0_mps = 20` m/s
- Gravitational acceleration: `g_mps2 = 9.81` m/s^2
- Target time: `t0_s = 1.0` s
- Analytic derivative: `v(t) = v0 - g*t`
- Analytic reference at target time: `v_exact_mps = 10.19` m/s
- Core forward-difference step sizes: `h_s = [0.5 0.2 0.1 0.05]` s
- Core forward difference: `(y(t0+h)-y(t0))/h`

## Locked Reference Values

At `t0 = 1.0 s`, `y(t0) = 15.095 m` and `v_exact = 10.19 m/s`.

| h (s) | Forward difference (m/s) | Absolute error (m/s) | Relative error (%) |
| ---: | ---: | ---: | ---: |
| 0.50 | 7.7375 | 2.4525 | 24.0677 |
| 0.20 | 9.2090 | 0.9810 | 9.6271 |
| 0.10 | 9.6995 | 0.4905 | 4.8135 |
| 0.05 | 9.94475 | 0.24525 | 2.4068 |

For this quadratic model, the supplied central-difference expression reproduces the analytic derivative to floating-point precision. This is a model-specific convenience, not a general guarantee.

## Core Algorithm Route

1. State the physical rate to be estimated and its expected unit.
2. Choose the target point `t0` and one supplied positive step size `h`.
3. Evaluate the physical model at `t0` and `t0+h`.
4. Compute the change in position divided by the change in time.
5. Interpret the result as an approximate velocity at `t0`.
6. Repeat for the supplied smaller step sizes.
7. Compare each estimate with the analytic derivative.
8. Calculate/read a simple absolute or relative error.
9. Explain why the estimate is approximate and report the physical unit.

## Required Core Checkpoints

- derivative interpreted as a physical rate;
- prediction of sign and rough magnitude before computing;
- two nearby model values identified correctly;
- forward-difference formula explained in words;
- derivative unit derived from output unit divided by input unit;
- heavily scaffolded MATLAB evaluation;
- small supplied step-size comparison;
- analytic-reference validation;
- simple absolute/relative error;
- physical interpretation of the final estimate;
- diagnosis of one clear denominator or indexing defect.

## Working Exposure

- central difference using a supplied formula/code block;
- supplied error-versus-step-size curve;
- qualitative statement that making `h` extremely small is not a universal guarantee of improvement.

## Optional Stretch

- truncation-error order derivation;
- detailed truncation-versus-round-off analysis;
- higher-order differentiation formulas.

## Practical Transfer Contexts

1. Vertical motion: estimate velocity from a position model; derivative unit is m/s.
2. Electric potential: estimate electric field from `E = -dV/dx`; derivative unit is V/m and field direction depends on the sign.
3. Newtonian cooling: estimate `dT/dt`; derivative unit is K/s or degC/s and the sign indicates heating or cooling.

The practical contains ten progressive micro-challenges. Every challenge names required evidence and a short defence hook. Student-facing files contain no solved challenge answers.

## Capstone Progression

Week 06 includes the graded **Problem-space selection and feasibility** milestone worth 2% of the course. It narrows the Week 04 preference to one manageable bounded investigation. The numerical method is deliberately not locked until the Week 07 approved-model/method/validation milestone.

## Diagnostic Planning

The course-level hidden file `.agent/google-forms/Week06_Question_Key_and_AI_Analysis.md` specifies a six-question pre-practical diagnostic covering physical prediction, units/scaling, algorithm/code reasoning, numerical/defect diagnosis, validation reasoning, and confidence. It is a draft specification only and does not publish a live Google Form.

## Scientific Illustration Decision

No ImageGen illustration is required for the learning note or Live Scripts. The key representation barrier is the geometric difference between a local tangent and a finite secant. A deterministic MATLAB plot of the position curve, target point, forward-difference secant, and analytic tangent is more precise and auditable than generated imagery. A supplied MATLAB error-versus-step-size plot supports Working exposure.

## Lecture Slide Gate

Only `.agent/lecture-slides/outline.md` is created at this stage. Do not create a Week 06 PPTX, slide images, prompt jobs, equation assets, or production state until the lecturer explicitly authorises slide production.

## Publication Gate

Before calling the non-slide Week 06 package complete:

1. generate and inspect the MATLAB teaching figures embedded in the learning note;
2. compile and visually inspect the learning-note PDF;
3. run the lecture demonstration from a fresh MATLAB session;
4. run the practical baseline from a fresh MATLAB session;
5. run the hidden practical reference solution and confirm all validation checks pass;
6. run MATLAB `checkcode` on both student-facing scripts;
7. verify the capstone feasibility milestone matches the 2% Week 06 assessment blueprint and does not prematurely lock a method;
8. verify Core content uses forward difference, a small step-size comparison, analytic reference, units, and simple error;
9. verify central difference/error curve are clearly Working exposure and derivations remain Stretch;
10. verify no Week 06 PPTX exists.
