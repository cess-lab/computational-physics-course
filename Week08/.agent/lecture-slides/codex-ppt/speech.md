# PHY4605 Week 08 Presenter Notes

## Slide 1: Can a Cooling Rate Predict a Temperature?

The question for this week is whether a rule for the current cooling rate can predict a whole temperature history. The object starts at eighty degrees Celsius in a room held at twenty degrees Celsius. Before calculating, decide whether it should lose the same number of degrees in every equal time interval.

The physical prediction is that cooling is fastest at the start and slows as the object approaches the room temperature. We will turn that prediction into a first-order model, an Euler algorithm, MATLAB code, and a set of checks.

## Slide 2: Name the State, Rate, and Initial Condition

The state variable is the quantity whose value changes: here it is the object's temperature, T. The derivative dT by dt is the rate at which that temperature changes, measured in degrees Celsius per second.

The initial condition fixes the first point of the trajectory: T at zero is eighty degrees Celsius. The room temperature and cooling time are model parameters. We assume the object has one uniform temperature, the room stays at twenty degrees Celsius, and the cooling time remains constant.

## Slide 3: Read the Cooling Law in Words

Read this equation as a sentence. The cooling rate equals minus the temperature excess above the room, divided by the cooling time. When the object is much warmer than the room, the rate has a larger negative magnitude. As the temperature excess shrinks, cooling slows.

At the initial temperature, the excess is sixty degrees Celsius. Dividing by one hundred seconds and applying the minus sign gives minus zero point six degrees Celsius per second. The sign and unit already provide useful checks.

## Slide 4: Turn the Current Rate into One Step

Euler's method freezes the current rate over one short timestep. We start from the current temperature, multiply the current rate by the timestep, and add that estimated change to obtain the next temperature.

The dimensional check is immediate: seconds multiplied by degrees Celsius per second gives degrees Celsius. A smaller timestep updates the rate sooner, which usually reduces the approximation error for this supplied problem.

## Slide 5: Trace Two Euler Updates

Start at eighty degrees Celsius with a rate of minus zero point six degrees Celsius per second. Over fifty seconds, the estimated change is minus thirty degrees, so the first Euler temperature is fifty degrees Celsius.

The important step is to recalculate the rate from the new temperature. At fifty degrees Celsius, the temperature excess is thirty degrees and the rate is minus zero point three degrees Celsius per second. The second update gives thirty-five degrees Celsius at one hundred seconds. The second drop is smaller because the rate has changed.

## Slide 6: Plan the Algorithm Before MATLAB

The algorithm begins with the physical inputs: room temperature, initial temperature, cooling time, final time, and timestep. We create matching arrays for time and temperature, then place the initial condition in the first temperature position.

For each interval, calculate the rate from the current temperature and store the next temperature. After the loop, plot the trajectory, repeat with a smaller timestep, compare against an independent reference, and interpret the physics.

## Slide 7: Seven Values Represent Six Intervals

From zero to three hundred seconds in steps of fifty seconds, there are six intervals but seven time positions. This distinction matters because a temperature must be stored at both ends of every interval.

MATLAB index one represents physical time zero. We reserve seven temperature values with zeros, then overwrite the first value with the initial condition of eighty degrees Celsius. The loop will fill the remaining positions.

## Slide 8: Read the Euler Loop

The loop stops at one less than the number of time values because each pass writes to the next array element. Inside the loop, the first line calculates the cooling rate from the current temperature, and the second line stores the next temperature.

When n equals two, MATLAB reads T C at index two and writes T C at index three. Reusing index one on every pass would incorrectly reuse the initial rate after the object has already cooled.

## Slide 9: Check the Trajectory Before Trusting It

Before measuring error, apply simple physical checks. The trajectory must begin at eighty degrees Celsius, decrease while the object remains warmer than the room, and stay between twenty and eighty degrees Celsius for these supplied steps.

The coarse Euler curve passes those checks. However, a smooth and plausible curve can still be quantitatively inaccurate. Physical plausibility is necessary evidence, but it is not the same as numerical accuracy.

## Slide 10: Change the Timestep, Keep the Physics Fixed

To test numerical resolution, keep the physical model and final time fixed. Only the timestep changes from fifty to twenty-five to twelve point five seconds.

The smaller steps recalculate the changing rate more often. The resulting endpoints move toward the exact curve. Notice that the cooling time tau is a physical parameter, while h is a numerical choice; changing them answers different questions.

## Slide 11: Measure Error Against a Supplied Reference

For this teaching model, the exact exponential solution gives a temperature of about twenty-two point nine eight seven two degrees Celsius at three hundred seconds. We compare every Euler result at that same final time.

As the timestep halves, the absolute endpoint error decreases from about two point zero five to one point zero nine to zero point five five degrees Celsius. We report absolute temperature error in degrees Celsius rather than forming a percentage from Celsius temperature, whose zero is arbitrary.

## Slide 12: Spot a Runnable but Wrong Update

The wrong line adds a cooling rate directly to a temperature. MATLAB can run that expression, but the units do not agree: degrees Celsius plus degrees Celsius per second is not a temperature.

Multiplying the rate by the timestep repairs the dimensions and restores the Euler rule. This is a useful example of a defect that syntax checking alone cannot catch. A smooth-looking output is not a substitute for checking the model and units.

## Slide 13: Predict a Slower Cooling Model

Doubling tau changes the physical model. The initial cooling-rate magnitude halves, and the object remains warmer after three hundred seconds: about thirty-three point three nine degrees Celsius rather than about twenty-two point nine nine degrees Celsius.

A smaller numerical timestep improves the approximation to whichever model we choose. It cannot repair an unsuitable assumption, such as treating a large object as having one uniform temperature or assuming the room never warms.

## Slide 14: Explain One Update and One Check

For the exit ticket, identify the state variable, rate unit, and initial condition. Then repeat the first update with a twenty-five-second timestep. Starting from eighty degrees Celsius with a rate of minus zero point six degrees Celsius per second gives sixty-five degrees Celsius.

Explain why the rate must be recalculated, then choose one physical check and one reference or timestep check. A defensible simulation connects the model, algorithm, code, numerical evidence, and physical interpretation.
