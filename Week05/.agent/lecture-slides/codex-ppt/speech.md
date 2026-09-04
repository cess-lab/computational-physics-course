# Week 05 speaker notes

## Slide 1: From a physical target to a checkable root

Start with the physical question rather than the numerical method. A projectile leaves level ground at 20 metres per second, and the target range is 35 metres. The unknown is a launch angle: we want an input that makes the model output meet a specified condition.

Ask students to predict what a useful answer should look like. It should be an angle, not a distance, and it should be checked against the target range. The rest of the lecture turns that physical question into a computation we can inspect.

## Slide 2: Turn the target condition into a residual

The projectile model gives the range as a function of launch angle. The target condition is that this range equals 35 metres. A numerical root finder works with the residual, which is the model output minus the target: `f(theta) = R(theta) - 35 m`.

The key distinction is between the unknown and the mismatch. The root is an angle in degree. The residual is a distance in metres. At a root, the residual is zero because the model and target agree. Keep those two units separate as we move into the graph.

## Slide 3: Read the residual sign as physics

Before iterating, make the sign meaningful. A negative residual means the model range is shorter than 35 metres, so the projectile undershoots. A positive residual means the model range is longer, so it overshoots. Zero means the target condition is met.

This interpretation gives every later numerical value a physical meaning. When a bisection midpoint has a negative residual, we know which side of the target it lies on. The sign is not decoration attached to the output; it is the direction of the model error.

## Slide 4: Find the zero crossing before coding

The residual graph lets us see the root before we ask MATLAB to iterate. For the locked scan from 10 to 70 degrees, the low-angle residual is negative at 20 degrees and positive at 40 degrees: approximately -8.7905 metres and +5.1553 metres.

That sign change selects the low-angle bracket `[20, 40]` degrees. The graph also contains a higher-angle crossing, but it is not part of today's Core route. Our immediate job is to choose and defend one bracket for one physical root.

## Slide 5: Bisection keeps a sign change alive

Bisection uses the bracket as its safety structure. We calculate the midpoint of the current interval, evaluate its residual, and retain the half whose endpoints still have opposite signs. In the first step, the midpoint is 30 degrees and its residual is positive, so the valid sign-changing half is `[20, 30]` degrees.

The midpoint alone is not the guarantee. The guarantee comes from keeping opposite endpoint signs alive after each update. That is the idea students should be able to say in plain language before reading the loop.

## Slide 6: Trace the first four bisection updates

Read the table row by row. The first midpoint, 30 degrees, overshoots, so the right endpoint moves to 30. The next midpoint, 25 degrees, undershoots, so the left endpoint moves to 25. The third and fourth rows repeat the same sign decision.

The important pattern is midpoint, residual, retained half. The interval becomes smaller because the sign-changing evidence is preserved, not because the midpoint is automatically close to the answer.

## Slide 7: Read the bisection scaffold, line by line

Now connect the code to the trace. `mid_deg` is the centre of the current bracket. `f_mid_m` evaluates the physical residual in metres. The condition `abs(f_mid_m) < tolerance_m` is the one supplied Core stopping rule.

The sign-product test is the branch that decides which endpoint changes. If the left residual and midpoint residual have opposite signs, the midpoint becomes the new right endpoint. Otherwise the midpoint becomes the new left endpoint. The code is simply the earlier reasoning written in MATLAB.

## Slide 8: Stop once, then substitute back

The bisection scaffold stops when the residual magnitude is below `1e-3 m`. It reaches `29.5679 degree` after 13 recorded iterations, with residual `+4.1164e-4 m`.

Do not accept the result because the loop stopped. Substitute the angle back into the original range model. The model returns `35.0004 m`, and the residual is below the supplied tolerance. The physical statement is that this low-angle launch makes the model range meet the 35 metre target within the stated check.

## Slide 9: Newton follows the local tangent

Newton uses a different local picture. Instead of keeping a bracket, it uses the current angle, the residual there, and the local slope. The tangent predicts where the residual curve would cross zero, giving the update current angle minus residual divided by slope.

Because the angle is stored in degrees, the derivative includes `2*pi/180`. That conversion makes the slope unit metres per degree, which must match the units used in the update. Newton can be efficient, but the physical residual and its units remain the anchor.

## Slide 10: Trace Newton from 25 degree

Start at 25 degrees. The first residual is -3.7648 metres and the slope is 0.91488 metres per degree, so the next estimate is 29.115 degrees. The next evaluations move to 29.562 and then 29.567 degrees.

At the fourth evaluation the residual is `-7.1308e-7 m`, so the same residual stopping rule is satisfied. Ask students to notice that the table records the quantities needed to explain each update: current angle, residual, slope, and next angle.

## Slide 11: Working exposure: same root, different route

Both methods approach the same low-angle physical root, but they carry different evidence. Bisection takes 13 recorded iterations here and keeps a sign-changing bracket. Newton takes 4 recorded evaluations from the chosen start and uses a local slope.

The iteration count is only a limited cost measure. It does not replace validation. The shared requirement is still to substitute the result into the residual and explain what the root means physically.

## Slide 12: A midpoint is not enough: the bracket must change sign

A midpoint can be calculated for almost any pair of endpoints. That arithmetic alone does not justify bisection. The Core setup needs endpoint residuals with opposite signs, because that is the evidence that the interval contains a zero crossing for the method's update logic.

Contrast the same-sign defective bracket with the valid `[20, 40]` degree bracket. The repair path is simple: inspect the graph, check the endpoint signs, and only then start the iteration. A same-sign interval does not prove that no root exists elsewhere; it simply does not provide the required bracket evidence.

## Slide 13: Transfer the residual pattern to new physics

The equation changes in the practical, but the reasoning pattern stays stable. For a thin lens, the root is image distance `v` in metres and the residual is an inverse-length mismatch in `m^-1`. For RC charging, the root is threshold time `t` in seconds and the residual is a voltage mismatch in volts.

For either context, state the model, define the residual, choose a bracket or starting value, apply the update, use the supplied residual stopping rule, substitute the result back, and interpret the physical root. The practical asks students to carry this structure into an analogous model without relying on the projectile answer.

## Slide 14: Exit ticket — explain a root to a future you

Close with four short explanations. Define the target and residual. Explain what opposite endpoint signs mean. Describe one midpoint or tangent update. Then perform the substitution check and state the unit of the root.

The goal is not to recite function names. It is to show the reasoning chain from a physical condition to a checkable numerical result. The same chain will be used for projectile range, thin-lens image distance, and RC threshold time in the practical.
