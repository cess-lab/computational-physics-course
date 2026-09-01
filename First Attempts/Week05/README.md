# PHY4605 Week 05

Week 05 develops reliable root finding through a single physical model: Kepler's equation for an elliptic orbit. The package moves from a sign-changing bracket to explicit bisection, Newton's method, stopping criteria, residual checks, MATLAB `fzero`, and failure diagnosis.

## Materials

- `Lecture_Slides_Week05.pptx` — 18-slide lecture deck that develops the evidence chain from Kepler's equation through bracketing, bisection, Newton's method, stopping evidence, failure diagnosis, safeguarding, solver selection, and practical transfer.
- `Week05_Root_Finding_Bracketing_Newton_and_Reliability.pdf` — student learning note connecting nonlinear equations, bracketing, convergence, Newton sensitivity, residuals, and method selection.
- `Week05_Lecture_Demonstration_Root_Finding_and_Kepler_Orbits.m` — fully worked MATLAB Live Script demonstration using Kepler's equation, including bisection, Newton, `fzero`, quantitative comparison, an invalid bracket, and a small-derivative stress case.
- `Week05_Practical_Compare_Root_Finders_for_Kepler_Equation.m` — group practical with prediction, modelling, solver comparison, stopping-criterion evidence, stress testing, failure diagnosis, and capstone-method evidence.

## Practical Workflow

Complete the **Week 05 Individual Practical Check — Quiz** in Google Classroom before group discussion, MATLAB, notes, calculators, or AI. After the individual check, work in a group of two or three and rotate the model, implementation, and validation roles.

MATLAB Copilot or another approved AI tool may be used during group work. Record any material suggestion that affects the model, algorithm, code, stopping rule, or interpretation, and independently test it before accepting it.

## Reproducibility

The two student-facing `.m` files use MATLAB's plain-text Live Script format and require MATLAB R2025a or later for the intended rich-text Live Editor presentation. They use base MATLAB functions only; no additional toolbox is required. `fzero` is used as the official MATLAB reference solver, while bisection and Newton iterations are implemented explicitly because the algorithms themselves are Week 05 learning objectives.

The default physical model solves

`E - e*sin(E) - M = 0`

for eccentric anomaly `E` with `0 <= e < 1`. The baseline case uses `e = 0.70` and `M = 1.00 rad`. A stress case uses `e = 0.999`, `M = 0.15 rad`, and a deliberately poor Newton initial guess `E0 = 0` to expose sensitivity to a small derivative.

## Assessment Bridge

The practical evidence is designed to feed the Weeks 01–06 mid-semester report. Students should preserve a compact comparison showing method, stopping rule, iteration count, final residual, robustness evidence, and a justified choice of solver. The final section also asks each group to connect one numerical method and at least two validation checks to its preferred capstone question before the Week 06 feasibility proposal.
