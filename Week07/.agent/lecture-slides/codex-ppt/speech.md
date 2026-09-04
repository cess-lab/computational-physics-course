# PHY4605 Week 07 Presenter Notes

## Slide 1: From a Curve to an Accumulated Quantity

The physical question for this week is simple: a force changes with time, so how do we estimate the total impulse delivered between zero and two seconds? Analytically, we recognise impulse as the integral of force with respect to time. Computationally, however, we often have only sampled force values.

The shaded region is therefore not just a geometric area. It represents accumulated impulse. Our task is to turn that physical meaning into an algorithm, a MATLAB calculation, and a result we can defend.

## Slide 2: Integration Combines Two Physical Axes

Before calculating, read the axes. The vertical axis carries newtons and the horizontal axis carries seconds, so the accumulated area must carry newton-seconds. That is also equivalent to kilogram metres per second, the unit of momentum change.

The limits matter just as much as the units. We are accumulating only from zero to two seconds. Since the force remains positive throughout that interval, we can already predict that the impulse must be positive.

## Slide 3: One Decaying-Force Model

We will keep the physics deliberately familiar. The force begins at twelve newtons and decays exponentially with a time constant of zero point eight seconds. The model is valid over the interval from zero to two seconds.

The rectangle gives us a quick upper bound. A force that never exceeded twelve newtons over two seconds could not produce more than twenty-four newton-seconds of impulse. Because the actual force decays, the impulse must lie strictly between zero and twenty-four newton-seconds.

## Slide 4: A Numerical Integral Sees Samples

A numerical method does not see the smooth curve directly. With four equal intervals, it sees five coordinates and the five corresponding force values shown here. Notice the distinction: four intervals require five endpoints.

The two MATLAB lines create those coordinates and evaluate the same physical model at each coordinate. Nothing about the model has changed; we have only chosen how finely to sample it.

## Slide 5: One Trapezoid

Focus on the first interval only. We replace the curved segment locally by a straight line joining the two sampled endpoint values. The approximate area is the interval width multiplied by the average endpoint force.

Here the width is zero point five seconds, and the endpoint forces are twelve and about six point four two newtons. The first trapezoid therefore contributes about four point six zero six newton-seconds. The unit comes directly from force multiplied by time.

## Slide 6: Four Trapezoids Form the Coarse Estimate

Now combine all four strips. The first and last samples receive half weight, while the three interior samples receive full weight. The MATLAB expression on the right makes that weighting explicit rather than hiding it inside a function call.

The coarse estimate is about nine point zero nine seven newton-seconds. It passes our positive-sign and upper-bound check, but that only tells us the answer is physically possible. It does not yet tell us whether the approximation is accurate.

## Slide 7: Pseudocode Before MATLAB

The full algorithm starts with the physical quantity, limits, and expected unit. We then choose a resolution, create sample coordinates, evaluate the force, form the trapezoids, and add their areas.

Credibility comes from the final part of the loop: refine the sampling, compare with an independent reference, and interpret the result. During refinement, the model, parameters, limits, and units stay fixed. Only the number and spacing of samples change.

## Slide 8: trapz(t,F) Uses the Same Geometry

MATLAB's trapz function performs the same trapezoidal accumulation. The first argument supplies the physical time coordinates, including their spacing, while the second supplies the sampled force values.

For the four-interval case, the manual expression and trapz must agree to numerical precision. The assertion is a useful reproducibility check: it confirms that the compact function call represents the geometry we have just traced.

## Slide 9: Refine the Sampling

Refinement means changing only the numerical resolution. We keep the initial force, decay time, final time, model, and limits fixed, then increase the interval count from four to eight to sixteen.

As the spacing halves, the trapezoidal estimates move from about nine point zero nine seven toward eight point eight three zero newton-seconds. This consistent movement is evidence that the approximation is settling, but we still need an independent target for comparison.

## Slide 10: Analytic Reference

For this teaching model, we can integrate the exponential analytically. That result is not produced by the trapezoidal calculation, so it provides an independent reference: eight point eight one one nine eight four newton-seconds.

The three numerical estimates approach this same reference as the sampling is refined. The absolute-error line then measures the remaining distance between each numerical estimate and the analytic value.

## Slide 11: Error With Physical Meaning

At sixteen intervals, the estimate is eight point eight two nine nine newton-seconds. Its absolute error is about zero point zero one seven nine newton-seconds, and its relative error is about zero point two zero three percent.

We now have several aligned checks: the unit is correct, the value lies inside the physical bound, refinement reduces the error, and the result agrees closely with the independent reference. Physically, the impulse corresponds to a positive momentum change of about eight point eight three kilograms metres per second.

## Slide 12: Runnable but Physically Wrong

Both calls on this slide run, but they do not represent the same physical calculation. The first call supplies force values only, so MATLAB assumes unit spacing. It has no information that neighbouring samples are separated by zero point five seconds.

The corrected call supplies the time coordinates explicitly and gives the expected impulse near nine point zero nine seven newton-seconds. This is a useful reminder that code can be syntactically valid while still omitting essential physical information.

## Slide 13: Working Exposure: Simpson and Convergence Evidence

This is Working exposure rather than a new Core method. At eight intervals, the supplied Simpson result happens to lie much closer to the exact reference than the trapezoidal result.

The error-reduction factors also show that halving the spacing substantially reduces trapezoidal error for this smooth example. We are reading numerical evidence only; deriving Simpson's rule or proving a formal error order is beyond the Core requirement.

## Slide 14: Transfer to Work and Charge

The same reasoning pattern transfers directly to other familiar physical accumulations. Integrating force over position gives work in newton-metres or joules. Integrating current over time gives charge in ampere-seconds or coulombs.

For the exit ticket, identify the accumulated quantity, limits, area unit, one trapezoid, what refinement changes, and one independent check. If those six elements are visible, the computation is much easier to trace and defend.
