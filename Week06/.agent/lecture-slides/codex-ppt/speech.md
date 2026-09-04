## Slide 1: From nearby values to an instantaneous rate

Today we start with a familiar question: a projectile has a position model, but we want its velocity at one instant. The key idea is that two nearby position values can give us a numerical estimate of that instantaneous rate. We will keep the physics familiar and focus on the computational reasoning.

## Slide 2: A derivative is a physical rate

A derivative always needs a physical interpretation and a unit. Position changing with time gives velocity in metres per second. For electric potential, dV/dx is the potential gradient and the electric field is Ex = -dV/dx. Temperature changing with time gives a cooling rate. The symbol is useful only when we can say what changes, with respect to what, and in what units.

## Slide 3: Use two nearby values

The forward difference takes the change in position between two nearby times and divides by the time step. Geometrically, that is the slope of a secant. It estimates the tangent slope at the left point, which is why the result estimates the instantaneous velocity at t0.

## Slide 4: Reuse a familiar vertical-motion model

Our model is vertical motion with constant gravity and no air resistance. At one second the ball is still rising, so we already have a useful physical prediction before calculating anything. The only new move is to estimate its velocity from nearby values of this familiar position model.

## Slide 5: Predict before computing

Before trusting MATLAB, make a physical prediction. At one second the velocity should be positive because the ball is still moving upward, but it must be less than the initial 20 metres per second because gravity has slowed it. A result that breaks either condition deserves investigation.

## Slide 6: Work one forward difference by hand

With h equal to 0.5 seconds, evaluate the position at one second and again at one and a half seconds. Their difference is a change in metres; dividing by the time change gives metres per second. This 7.7375 metres per second is an average slope over a finite interval, used as an estimate at the left endpoint.

## Slide 7: Pseudocode before MATLAB

The algorithm comes before the syntax. Choose the target time and a supplied step, evaluate the model at both nearby times, subtract the positions, divide by the step, and compare with a reference. Then repeat the same procedure for the small supplied list of step sizes.

## Slide 8: Read the MATLAB scaffold line by line

This is a scaffold to read and modify, not a blank-page programming task. Notice that the step sizes form an array, so the power and division operators use dot notation. The code evaluates two positions and divides their difference by each corresponding step size.

## Slide 9: Smaller steps give a more local estimate

The model and target time stay fixed; only h changes. Across this supplied range, a smaller h makes the secant more local to t0 and the forward estimate moves toward the analytic reference of 10.19 metres per second. This is evidence from the stated range, not a universal claim that every smaller step is always better.

## Slide 10: Validate with the analytic derivative

The analytic derivative gives a separate reference: v of t equals v0 minus gt, so at one second the exact velocity is 10.19 metres per second. The analytic result is not our numerical method; it is an independent check that lets us judge whether the numerical estimate is credible.

## Slide 11: State the error with a physical unit

At h equal to 0.05 seconds, the forward estimate is close to the reference but not identical. The absolute error is 0.24525 metres per second, so it retains the velocity unit. The relative error, about 2.41 percent, expresses the same mismatch as a fraction of the reference value.

## Slide 12: Why is the forward difference approximate?

For a curved function such as this quadratic model, the derivative is a local tangent rate but the forward difference uses a secant over a finite step. When h becomes smaller, that secant is more local and usually closer to the tangent in this smooth example. A linear function is a useful exception: its secant and tangent slopes agree exactly.

## Slide 13: Working exposure: a centred estimate

For breadth, here is the supplied central-difference idea: it samples equally on both sides of the target time. For this quadratic model, it matches the analytic derivative to floating-point precision. That exact agreement is a special property of this model, so it is not a general promise and is not a Core implementation requirement.

## Slide 14: Core transfer and exit ticket

We are now back in the Core route. The reasoning transfers beyond projectile motion: Ex = -dV/dx for electric potential, while dT/dt is a cooling rate for temperature. In each case, identify the physical meaning and units, make a nearby-value estimate, choose the step deliberately, and validate against an appropriate reference.
