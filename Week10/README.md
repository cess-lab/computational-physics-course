# Week 10 — Random Sampling and Monte Carlo Simulation

Use repeated random trials to turn a stochastic physical model into reproducible numerical evidence, then distinguish the centre of the outcomes from their physical spread and from uncertainty in an estimated mean.

## Materials

- [Learning note](Week10_Learning_Note_Random_Sampling_and_Monte_Carlo.pdf): one-dimensional random walks, Monte Carlo trials, mean and spread, sample-size effects, reproducibility, and validation.
- [Lecture demonstration](Week10_Lecture_Demonstration_Random_Walk_Monte_Carlo.m): complete lecturer-led symmetric random-walk simulation with one trajectory, 10,000 repeated paths, sample-size comparison, and physical checks.
- [Group practical](Week10_Practical_AI_Enabled_Monte_Carlo_Challenge_Set.m): ten progressive challenges across photon detection, radiation shielding, and a two-dimensional random walk.
- Lecture-slide outline: prepared under `.agent/lecture-slides/codex-ppt/outline.md` for later lecturer approval. No Week 10 slide images or PPTX have been created.

## Learning Focus

The Core route asks students to define one physical random trial, read and modify a supplied random-sampling scaffold, repeat trials, display a trajectory or distribution, calculate and interpret mean and spread, compare several sample sizes, explain why correct runs differ, use a fixed seed when exact reproducibility is required, and state variability cautiously. Supplied standard-error estimates and ideal random-walk scaling are Working exposure. Distribution derivations, statistical-mechanics extensions, variance reduction, and MCMC diagnostics remain Stretch material.

## Lecture Model

The lecture uses a one-dimensional symmetric random walk. A particle starts at `x = 0 mm` and takes `N = 100` independent steps of length `a = 1 mm`; each step is equally likely to be `+1 mm` or `-1 mm`. One Monte Carlo trial is one complete 100-step path. The locked teaching seed is `rng(4605,'twister')`, and the repeated-trial sample sizes are `100`, `1000`, and `10000`.

With 10,000 trials, the locked simulation gives a mean final position of `-0.128 mm` and a spread of `9.9423 mm`. Symmetry predicts a long-run mean near `0 mm`, while the supplied ideal random-walk reference gives a spread `a*sqrt(N) = 10 mm`. The simulation also checks that every 100-step final position is an even integer number of millimetres.

The finite-sample means for 100, 1,000, and 10,000 trials are `0.040`, `0.066`, and `-0.128 mm`; their spreads are `10.6320`, `9.8122`, and `9.9423 mm`. The example deliberately shows that convergence of one random sequence need not be monotonic. The supplied standard errors of the mean are approximately `1.0632`, `0.3103`, and `0.0994 mm` and are interpreted only as Working exposure.

## Running the MATLAB Materials

Open the `.m` files in MATLAB R2025a or later as plain-text Live Scripts. The Week 10 Core files use base MATLAB only. Run sections from top to bottom in a fresh MATLAB session. Local fresh-process execution was checked using MATLAB R2026b Prerelease.

The lecture file is a complete demonstration with no student submission fields. The practical provides bounded group evidence entries and runnable random-sampling scaffolds.

## Practical Evidence and AI Use

Work in groups of two or three. The practical contexts are photon detection, radiation transmission through shielding, and a two-dimensional diffusion-style random walk. Record what one random trial represents, the repeated output, mean/spread or fraction evidence, sample-size behaviour, a reproducibility choice, one independent validation check, and a physical interpretation. Record material AI decisions rather than complete chat histories.

Google Classroom is the official submission record. Complete and lock the group evidence before the question slot and individual defender are drawn. Follow the rotation rule and arrange a make-up defence for an absence. The Week 10 practical includes a compact capstone process checkpoint but introduces no new graded capstone milestone.

The individual pre-practical diagnostic is drafted locally but has not been published.

## Instructor Sources

Hidden `.agent/` folders retain the learning-note LaTeX and rendered QA, strict MATLAB Monte Carlo evidence and plots, practical reference answers and defence records, the draft diagnostic, A/B variant bank, and the lecture-slide outline. The slide-production folder contains only the outline at this stage.
