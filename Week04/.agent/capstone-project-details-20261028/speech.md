## Slide 1: Projectile Delivery in Crosswind with Quadratic Drag

Start with the delivery question: where does the package land, and is that location within the intended region? The large scene shows the vertical part of the flight. The top view makes a different effect visible: a wind across the direction of travel can move the landing point sideways. Read these as two views of one physical situation, not as two different experiments.

Before changing code, define the release position, velocity, mass and wind vector with units. Drag depends on velocity relative to the air, so using the ground-relative velocity alone can misrepresent the wind effect. Keep a clear distinction between supplied aerodynamic information and assumptions your group needs to defend.

A useful investigation could compare wind cases and report the resulting landing displacement. A no-drag reference and a timestep check are possible checks, but your approved starter and objective determine the final evidence. You do not need lift, spin and gusts simply because they exist in reality. Explain whether an omitted effect could materially change your delivery conclusion.

## Slide 2: Projectile Launch from Elevated Terrain under Wind Shear

Here the wind is no longer represented by one value everywhere. The object moves through different heights, and the airflow it encounters can change during the flight. The other important boundary is the ground itself: impact occurs where the trajectory meets the terrain, rather than automatically when the height coordinate reaches zero.

Look at the launch location, the terrain and the wind-height information as separate inputs. A detailed terrain drawing does not mean that every feature must appear in your numerical model. Identify which part can change the landing conclusion and state the reference level used for height.

Your group should explain how the model handles the available wind profile and what happens beyond its supported range. A uniform-wind comparison or a simpler terrain case may provide a useful reference. The investigation should end with a claim about reachability or landing behaviour that is proportionate to those assumptions.

## Slide 3: RC Charging with Leakage and Temperature-Dependent Components

Follow the current from the source through the series resistor to the capacitor node. It can then divide between charging the capacitor and flowing through the leakage path. This is why leakage can change both the approach to the final voltage and the final voltage itself. The capacitor and leakage resistor share the same two circuit nodes.

Temperature is a modelling input, not an instruction to make every parameter increase. Use supplied component information or a clearly justified dependence. Comparing a few fixed-temperature cases can answer a useful question without immediately building a coupled thermal model.

Keep voltage, resistance and capacitance units explicit, including the initial capacitor voltage. A no-leakage reference and a long-time check can help test whether the result is plausible. Explain the consequence for the sensor node rather than presenting a charging curve without an operational interpretation.

## Slide 4: RC Sensor Circuit with Internal Source Resistance and Time-Varying Load

The source is connected through an internal resistance, so the sensor node need not remain at the nominal source voltage. When the load changes, the capacitor can supply or absorb charge during the transient. The source, capacitor and load must all be represented consistently around the same node.

Decide whether the supplied load description is a current demand or a resistance. These are different representations; converting one into the other without stating the assumption can change the problem. The three load stages in the illustration communicate a possible change in demand, not measured data.

Useful evidence might align the load history with the node voltage, identify the minimum voltage and describe recovery. Only claim that the circuit satisfies an operating band if that band has been supplied or approved. A constant-load segment can support a steady-state check, while an ideal-source case can help explain the effect of internal resistance.

## Slide 5: Radioactive Decay with Background Radiation and Detector Dead Time

Separate three quantities before interpreting any output: the source activity, the rate of events arriving at the detector and the events actually recorded. Background can add events, while detector recovery can prevent some arriving events from being counted. These effects do not simply cancel one another.

The event sequence is conceptual and is not a calibrated timing diagram; the highlighted interval isolates one missed-event example. It illustrates the need to state a detector model rather than prescribing one universal correction. Establish the acquisition duration, background information, efficiency if used and the supported dead-time description. Counts over an interval and counts per second must not be mixed.

A low-rate or zero-dead-time reference can help identify when the detector effect becomes important. Explain which part of an observed change belongs to decay and which part could arise from measurement. Adding more detector effects is useful only when the information and the objective support them.

## Slide 6: Two-Isotope Decay Mixture with Efficiency and Counting Noise

The detector observes a combined signal. The diagram separates the components to help us reason about their contributions; it does not mean that the detector can identify the isotope responsible for each event. Faster and slower components may dominate different parts of the observation interval.

The time window and bin width influence how much evidence you have. A short record, similar decay times or a weak component can make the interpretation ambiguous. Counting variation is part of the measurement model, so one noisy trace is not enough to establish every apparent feature.

Possible evidence includes expected component contributions, their sum and repeated noisy observations. Keep any efficiency assumption explicit. A one-component reference can help you explain what changes when a second component is introduced. A defensible conclusion may be that the available evidence does not distinguish the components reliably; you are not required to force a successful identification.

## Slide 7: Cooling with Thermal Radiation and Changing Ambient Temperature

The object can exchange energy through convection with the surrounding air and through radiation with its radiative surroundings. Those surroundings need not have the same temperature as the air. State when your model treats them as equal and why that is reasonable for the assigned setting.

Decide whether one temperature is an adequate representation of the object. The mass, heat capacity and geometry determine its thermal response, while the heat-transfer assumptions determine how energy leaves or enters it. Radiation calculations require absolute temperature, even when a plotted temperature history is displayed in degrees Celsius.

A fixed-surroundings comparison or a convection-only case may help explain which effect changes the result. An equilibrium check is meaningful only when the relevant heat exchanges balance. Use the temperature history to interpret the physical response, and describe the range over which the assumptions remain supported.

## Slide 8: Cooling of a Heated Object with Internal Heat Generation

An object can cool while it continues to generate heat. What matters is the balance: if heat loss exceeds generation, stored thermal energy falls; if generation exceeds loss, it rises. A steady temperature requires those rates to balance under the model assumptions.

Use power units consistently and distinguish a generation rate from energy accumulated over time. Establish whether the generation schedule is prescribed and whether a single object temperature is adequate. Internal spatial gradients are a possible extension, not an automatic requirement.

Comparing with zero generation can clarify the role of the internal source. If the result appears to settle, check generation against heat loss at that state rather than judging only from a visually flat curve. A temperature above ambient can be physically consistent with continuing internal generation.

## Slide 9: Bounded 2D Ising Ferromagnet

The two lattices illustrate how neighbouring spins can organise differently under different temperature conditions. They are conceptual configurations, not measured or computed evidence. The assigned scaffold supplies a physical sampling rule; arbitrary random flips would not represent the same model.

Keep the lattice size, interaction scale, temperature definition and boundary condition explicit. Allow the system to equilibrate before interpreting averages, and distinguish updates used for settling from updates used for measurement. Fix most settings while investigating one principal factor.

Your evidence could include configurations and averaged magnetisation or energy, together with repeated seeds or longer-run comparisons. The purpose is to explain what a bounded finite simulation supports. A small lattice and a finite run do not justify an overly precise transition claim. You are expected to understand and check the supplied implementation, not derive the entire algorithm independently.

## Slide 10: Monte Carlo Field of an Irregular Charged Body

Each random source sample represents part of the charge distribution. Its contribution at an observation point has both magnitude and direction, and the vector contributions must be combined. For the positive charge illustrated here, the field at an external point points away from the source charges.

Geometry, sampling and charge weighting must describe the same object. A thin charged surface and a charged volume require different density units. Begin with external observation points unless the approved scope includes the additional treatment needed near the source.

Repeated estimates and a sample-count comparison can show the variation in the method. More samples improve the statistical picture in general, but they do not guarantee that every individual estimate moves closer to a reference. Use a suitable symmetric or far-field reference where appropriate, and report components or magnitude with field units as well as a physical interpretation.

## Slide 11: Damped Mass–Spring Response

The spring provides a restoring force and the damper dissipates energy as the mass moves. The simplest investigation begins with an initial displacement or velocity and follows the free response. A continuing external force would be an additional modelling choice and must be stated separately.

Define mass, stiffness, initial conditions and the damping law with matching units. A linear spring and one-dimensional motion can be a useful bounded scope. Do not introduce nonlinear stiffness or a moving support unless they help answer the assigned question and can be checked.

Displacement history can show the response, but an energy check helps explain why it changes. Numerical error can also remove or add energy, so compare with an undamped reference or refine the timestep as appropriate. Explain the effect on transient or settling behaviour rather than treating a smaller oscillation alone as proof of correct damping.

## Slide 12: Finite-Angle Pendulum Motion

Measure the pendulum angle from the downward vertical and use radians in the computation. At a finite release angle, do not assume automatically that the small-angle approximation remains adequate. Comparing the motion across initial angles can reveal when that approximation becomes insufficient for the question you are asking.

Start with a fixed-length planar pendulum and a clear initial condition. Pivot friction, rod inertia and a moving support are separate possible extensions. A simple model with a clear comparison can provide stronger evidence than a complicated model with no reliable reference.

Possible evidence includes angular displacement, period and an energy check. In an undamped model, total mechanical energy should remain constant apart from numerical error. If energy drifts, investigate the timestep or method before attributing that drift to physics. Finish by explaining what the finite-angle model adds and which limitations remain.
