# Week 09 — Data Fitting and Uncertainty

## Slide 1: Can Measurements Reveal a Resistance?

We are going to use a small set of voltage-current measurements to estimate a physical parameter: resistance. Before we fit anything, look at the pattern and predict what the slope should be for a nominal 47 ohm resistor. The important question is whether one point or the overall trend gives the more reliable estimate.

## Slide 2: Separate Measurements From Fitted Parameters

The current and voltage are the quantities we measured directly. Resistance and the intercept are different: they are parameters inferred from the pattern across all the rows. Keeping these categories separate prevents us from treating a fitted value as though it came from one measurement.

## Slide 3: Read the Proposed Relationship in Words

The model is V = R I + b. Read R as the slope: voltage change per unit current, so its unit is V/A, or ohm. Read b as the voltage-axis intercept, a small offset that can represent measurement zero error. This model is useful over the measured range, but it does not prove ideal-resistor behaviour under every condition.

## Slide 4: Plot the Raw Data Before Fitting

Before MATLAB gives us a fitted line, inspect the raw points. They span 0.01 to 0.08 A and rise from 0.48 to 3.77 V with an approximately straight trend. This first plot is a diagnostic: curvature, an outlier, or a unit mistake should be noticed before it is hidden inside a summary parameter.

## Slide 5: Plan the Fit Before MATLAB

The fitting procedure has a visible order. Start with the measured data and the model, fit the slope and intercept, calculate predicted voltages, then calculate residuals as measured minus fitted. Only after those steps do we validate and decide how many digits the uncertainty evidence can support.

## Slide 6: Read the Straight-Line Fitting Scaffold

This is a supplied scaffold, not a request to derive least squares from memory. polyfit returns the line coefficients in p: p(1) is the slope and p(2) is the intercept. polyval then uses those coefficients to calculate a fitted voltage at each measured current. The task is to trace what each line produces.

## Slide 7: Interpret the Slope and Intercept Physically

The fitted slope is 47.0000 V/A, which we report as a resistance of 47.0000 ohm. The fitted intercept is 0.0025 V, a small offset. The point is not the number of decimal places by itself; the point is attaching the correct physical meaning and unit to each output.

## Slide 8: Overlay the Model and Measurements

Now compare the measurements with the fitted line. The line uses all eight points and follows their overall trend, while individual points sit slightly above or below it. This is useful evidence that the simple model is capturing the main relationship. It is not yet a complete validation, because the overlay does not tell us how the deviations are patterned.

## Slide 9: Residual Means Measured Minus Fitted

A residual is the measured voltage minus the voltage predicted by the fitted line. A positive residual places the measurement above the line; a negative residual places it below. Because the residual is still measured in volts, it tells us the scale and direction of the model-data disagreement.

## Slide 10: Inspect the Residual Pattern

The residuals alternate around zero without an obvious curved pattern. Their RMSE is about 0.0130 V, and the largest absolute residual is 0.0225 V. That supports using a straight-line model over this range, but it does not establish that the resistor is linear for all currents or conditions.

## Slide 11: Validate Against the Nominal Component

Here is an independent physical check. A nominal 47 ohm component with 5% tolerance should lie between 44.65 and 49.35 ohm. The fitted 47.0000 ohm is inside that interval. Notice the distinction: this interval is a component specification, not the uncertainty produced by our fitting procedure.

## Slide 12: Report Only the Uncertainty the Evidence Supports

Three supplied repeat runs give fitted slopes of 47.00, 47.06, and 47.27 ohm. For this teaching dataset, we can describe the observed repeatability span as roughly 47.0 to 47.3 ohm and say the resistance is about 47.1 ohm. We must not rename that observed span as a formal confidence interval.

## Slide 13: A Pattern in Residuals Is a Warning

Residual structure is a question about the model or the measurement process. A U-shaped pattern can suggest missing curvature; changing physics or calibration error are other possibilities. The correct response is to investigate, not to delete points automatically just because they disagree with the line.

## Slide 14: Explain One Fit and One Check

Use this exit ticket to trace the complete reasoning chain. State the units of R and b, explain the sign of a positive residual, and choose one independent check for the 47 ohm fit. Finally, distinguish that check from the repeatability range. A defensible fitted parameter needs the model, evidence, validation, and a cautious interpretation together.
