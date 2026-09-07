# Week 10 Post-Submission Variant Bank

Use variants only after the group file is locked. Assign one challenge slot and either Variant A or B below. If a slot is reused for another group, use the other variant and record the exact variant ID in the event ledger. Keep the defence on defining the trial, tracing the supplied random-sampling scaffold, interpreting mean/spread, sample-size effects, reproducibility, validation, and physical meaning.

| Challenge slot | Variant A | Variant B | Expected answer guidance |
| --- | --- | --- | --- |
| 1 | Detector probability changes from `0.65` to `0.50`; what happens to expected detections from 40 photons? | Photons per trial change from 40 to 60 at `p=0.65`; what happens to expected count? | A: expected count becomes 20. B: expected count becomes 39. Individual counts still vary. |
| 2 | A run gives mean detected count `25.8` with expectation 26. Is that automatically wrong? | A run gives mean `26.2`; what unit should the count spread have? | A: no; finite random samples fluctuate. B: spread is in detected-photon counts, not probability. |
| 3 | The 500-trial mean is closer to 26 than the 2,000-trial mean. Does that prove more trials are worse? | The spread stays near 3 as trial count grows. Is that a failure? | A: no; convergence need not be monotonic. B: no; physical count variability need not vanish. |
| 4 | Same seed and same code produce different results. Name one thing to check. | Different seeds produce different counts. Is that expected? | A: check run order, parameters, generator calls, or code changes. B: yes; different valid random sequences are expected. |
| 5 | Change shield thickness from `1.5 cm` to `2.0 cm`; should transmission rise or fall? | Change attenuation coefficient from `0.80` to `0.40 cm^-1`; should transmission rise or fall? | A: fall. B: rise. Use `exp(-mu*x)` physically. |
| 6 | A 20,000-particle estimate is farther from the reference than a 2,000-particle estimate in one run. Is this impossible? | Name the strongest supplied validation for shielding transmission. | A: no; finite-sample error is random. B: comparison with analytic `exp(-mu*x)` reference. |
| 7 | Code uses `rand < mu*x` and `mu*x=0.8`. Why is it still physically the wrong threshold? | Code produces a probability `-0.1`. What check catches it? | A: the model probability is `exp(-mu*x)`, not the exponent. B: enforce probability range 0 to 1 and revisit the model. |
| 8 | If 2D step length doubles, how should coordinates of the same direction sequence scale? | If direction probabilities favour east, should mean final `x` remain near zero? | A: coordinates double. B: no; directional bias shifts the mean. |
| 9 | Mean final `x` and `y` are near zero but RMS radius is positive. Explain. | Increase walk steps from 80 to 320 at fixed step length; supplied scaling predicts what factor change in RMS radius? | A: symmetric centre can coexist with nonzero distance spread. B: `sqrt(320/80)=2`, so about double. |
| 10 | Choose one context and distinguish reproducibility from validation. | Choose one context and explain what larger sample size improves. | Reproducibility allows exact reruns; validation tests model/results against independent physics. Larger samples stabilise estimated summaries, not individual random outcomes. |

Do not require distribution derivations, formal convergence proofs, statistical mechanics, variance reduction, or MCMC diagnostics.
