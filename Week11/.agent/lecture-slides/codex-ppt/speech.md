## Slide 1: Sensitivity and Uncertainty Propagation

Frame today’s question: if one input is uncertain, how should we report the prediction? The route is input range, model, output range.

## Slide 2: One Familiar Model, a New Question

Hooke’s law is familiar, but the meaning of the range is new. Here stiffness is not merely varied; its plausible range represents uncertainty.

## Slide 3: Predict Before Computing

Use the inverse relationship first: lower stiffness must give a larger extension. The baseline 0.10 m should sit inside the range.

## Slide 4: Baseline, Lower, and Upper Values

One-at-a-time means change only one input while holding the model, units and other inputs fixed. That makes the comparison interpretable.

## Slide 5: One-at-a-Time Algorithm

This five-step method turns an uncertain input into a defensible output range. Validation comes before the final interpretation.

## Slide 6: Trace the MATLAB Scaffold

The stiffness values are an array, so dot slash evaluates the same model for all three cases. Min and max then turn those outputs into the reported range.

## Slide 7: What Range Does the Model Predict?

At fixed 10 N, the three stiffness cases produce a decreasing curve and a range from 0.09524 to 0.10526 m. These are controlled calculations, not random trials.

## Slide 8: Report the Result Without False Precision

Report the input range alongside the output range. Extra digits in the baseline do not remove uncertainty in the stiffness.

## Slide 9: Core Validation: Check the Baseline

Check the baseline independently, check the units, and check the inverse trend. A smooth graph is evidence of execution, not validation by itself.

## Slide 10: Three Different Reasons a Prediction Can Be Imperfect

Separate uncertain parameters, numerical approximation and model limitations. This direct algebraic Hooke calculation has no timestep or grid approximation error.

## Slide 11: Working Exposure: Compare a Second Uncertain Input

Now change force instead, with stiffness fixed. The stiffness range has the larger effect here only because of these supplied input ranges.

## Slide 12: Working Exposure: Percentage Sensitivity

The sign of sensitivity tells direction; the magnitude tells fractional responsiveness. For Hooke’s law, force and extension move together, while stiffness moves oppositely.

## Slide 13: Working Exposure: Supplied First-Order Propagation

Use this supplied relation only under its small, independent-uncertainty assumption. It gives an approximate combined relative uncertainty, not a new exact law.

## Slide 14: Exit Ticket: What Can You Defend?

Students should name an uncertain input, keep the comparison controlled, state an output range, and distinguish its limitation source. Finish with a practical conclusion without false precision.
