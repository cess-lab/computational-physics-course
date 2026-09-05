## Slide 1: Can Random Motion Produce a Stable Pattern?

Begin with the apparent contradiction: a single path is unpredictable, yet many paths can reveal a stable centre and a real spread. Ask students to predict both before looking at any code.

## Slide 2: Define One Random Trial Before Coding

One trial is the whole 100-step history, not a single step. M tells us how many independent histories provide evidence; N belongs to the physical process.

## Slide 3: Read the Random-Step Rule in Physics Language

Each kick is equally likely left or right, so the model has no preferred direction. Changing N changes the walk; changing M changes how much evidence we have about it.

## Slide 4: Plan the Monte Carlo Experiment

Read this as a reasoning chain: specify the model, generate paths, collect endpoints, summarise, and validate. MATLAB implements this plan; it does not replace it.

## Slide 5: Use a Seed for a Reproducible Random Sequence

The seed makes this finite random sequence repeatable for teaching and debugging. It does not make a stochastic model deterministic, and it is not a validation check.

## Slide 6: Read the Random-Sampling Scaffold

Trace the three lines from a uniform draw to a direction and finally a physical step in millimetres. Notice the array operation creates many paths at once.

## Slide 7: One Trajectory Is One Possible History

This is one valid history, not the answer for every particle. A different seed changes the path, so one trajectory cannot establish the long-run mean or spread.

## Slide 8: Repeat the Trial to Build a Distribution

Repeating complete paths turns random outcomes into numerical evidence. The histogram is broad because endpoints differ, while its centre remains close to the symmetry prediction.

## Slide 9: Mean and Spread Answer Different Questions

The mean answers where the distribution is centred; the spread answers how much individual outcomes differ. A near-zero mean never means that every endpoint is near zero.

## Slide 10: More Trials Do Not Remove Physical Variability

More trials generally stabilise an estimate of the centre, but the physical endpoint spread remains. Do not mistake a more precise mean for less random physical motion.

## Slide 11: Monte Carlo Convergence Need Not Be Monotonic

The 1000-trial estimate is farther from zero than the 100-trial estimate, and that is not a failure. One finite random sequence need not converge monotonically.

## Slide 12: Validate With Symmetry and the Step Rule

Use two checks: symmetry predicts a mean near zero, and 100 plus-or-minus one-millimetre steps must end on an even integer. A nice-looking plot or fixed seed is insufficient.

## Slide 13: Working Exposure: Precision and Random-Walk Scaling

Standard error concerns uncertainty in the estimated mean, not the physical spread. Treat the formulae as supplied interpretation tools rather than derivations for this Core route.

## Slide 14: Explain One Trial, One Statistic, and One Check

Ask students to defend a complete chain: define a trial, distinguish mean from spread, and name a check. The final prompt connects reproducibility with the reason correct runs can differ.
