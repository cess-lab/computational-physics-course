# PHY4605 Capstone Projects — Twelve Detailed Brief Slides

Status: Outline approved by lecturer on 28 October 2026. Slides 01 and 03 approved as samples; lecturer authorised all remaining slides to complete 12 on 28 October 2026.

## Purpose and sources

One English slide per assigned project, preserving identifiers 01–12. Expand the context and modelling decisions in slides 06–11 of `Week04/PHY4605_Capstone_Briefing.pptx`, inspected directly as embedded slide images on 28 October 2026. Reconcile with `Assessments/Student-facing/Capstone_Investigation_Brief.md` and the current course slide specification. This is a 12-slide project-detail sequence; insertion into or replacement within the full briefing deck is a later assembly decision.

## Content contract

Each slide has five short content groups: scenario and objective; physical reasoning; information and units; scope decisions; evidence and interpretation. Use a prominent labelled scientific scene or diagram. Examples of output, validation and model scope below are illustrative proposals, not additional compulsory features or a prescribed equation, solver, code structure, graph or validation pair. Retain group responsibility for defending assumptions and omitted effects. Do not imply datasets, measurements, parameter values or starters already exist unless verified. Label unsupported inputs as assumptions requiring approval.

Keep projection text to approximately 100–140 words per slide where feasible. Put additional explanation in English presenter notes after approval. Do not include full code, detailed derivations, invented numerical results, timings or page numbers. Project identifiers are content labels, not page numbers. One principal physical feature and a bounded supported investigation are sufficient; other effects are optional or scope questions. Supplied implementation is essential for the Ising brief; independent derivation is not expected.

## Slide 01 — Projectile Delivery in Crosswind with Quadratic Drag

- **Scenario and objective:** A released package must reach an intended delivery region. Investigate how crosswind and quadratic air resistance change its flight and landing outcome.
- **Physical reasoning:** Gravity changes vertical motion; drag depends on motion relative to the air. A lateral wind can move the package away from the intended flight plane.
- **Information and units:** Release position (m), launch velocity (m/s), mass (kg), wind vector (m/s), aerodynamic information and target geometry (m). Identify supplied values, estimates and approved assumptions.
- **Scope decisions:** Is steady wind adequate? Is lateral displacement important enough to require 3D? Can the object be treated as a point? Keep lift, spin and gusts optional unless supported.
- **Evidence and interpretation:** Possible evidence includes trajectory and landing displacement, a controlled wind comparison, and a no-drag reference. Explain what the prediction can support about delivery accuracy.

**Visual/layout:** Labelled release-to-target scene plus plan-view inset to make crosswind displacement explicit; short information and decision groups beside it. Conceptual trajectories only unless computed references are supplied.

## Slide 02 — Projectile Launch from Elevated Terrain under Wind Shear

- **Scenario and objective:** An object launches above an uneven landing surface while wind changes with height. Investigate whether it reaches the acceptable landing region.
- **Physical reasoning:** The object encounters different airflow at different heights. Flight ends at intersection with the terrain, which need not be at zero elevation.
- **Information and units:** Launch position and terrain elevations (m), launch velocity (m/s), wind observations/profile (m/s versus height in m), object properties and acceptable landing region.
- **Scope decisions:** Which terrain detail matters? Is a vertical-plane model defensible? How should the model handle heights beyond the supported wind information? Gusts and obstacles remain optional.
- **Evidence and interpretation:** Possible evidence includes trajectory over terrain, landing location and impact speed, comparison with uniform wind, and a simpler terrain reference. Explain sensitivity to wind-profile or elevation assumptions.

**Visual/layout:** Large terrain cross-section with launch, height-dependent wind arrows and impact boundary; compact objective and assumption callouts.

## Slide 03 — RC Charging with Leakage and Temperature-Dependent Components

- **Scenario and objective:** A capacitor or sensor node charges while leakage and operating temperature alter the response. Investigate the change from an ideal RC baseline.
- **Physical reasoning:** Current divides between capacitor charging and the leakage path. Temperature may change resistance, capacitance or leakage; these dependencies must be supplied or justified.
- **Information and units:** Supply and initial voltage (V), resistance and leakage resistance (ohm), capacitance (F), temperature range (degrees C or K as appropriate), and supported component-temperature information.
- **Scope decisions:** Which temperature dependence matters? Is one leakage path adequate? Use fixed-temperature cases first when appropriate; a coupled self-heating model is optional.
- **Evidence and interpretation:** Possible evidence includes voltage histories, charging time and final voltage across operating cases. Compare with a no-leakage baseline and check long-time behaviour. Explain the consequences for the sensor node.

**Visual/layout:** Correct RC schematic with leakage parallel to the capacitor, temperature cue and labelled comparison-output area. No unsupported claim that every component changes in the same direction with temperature.

## Slide 04 — RC Sensor Circuit with Internal Source Resistance and Time-Varying Load

- **Scenario and objective:** A non-ideal source supplies an RC sensor node whose load changes with time. Investigate voltage droop, recovery and acceptable operation.
- **Physical reasoning:** Internal resistance creates a current-dependent voltage loss. The capacitor stores charge and influences the transient response as load demand changes.
- **Information and units:** Source voltage (V), internal resistance (ohm), capacitance (F), initial node voltage (V), load schedule (A or ohm versus s), and an acceptable voltage band if supplied.
- **Scope decisions:** Represent the load as a current demand or resistance consistently. Are transients important? Is constant source resistance adequate? Keep thermal and wiring effects optional.
- **Evidence and interpretation:** Possible evidence includes aligned load and node-voltage histories, minimum voltage and recovery behaviour. Compare with a constant-load or ideal-source case and check a steady segment. State whether the supported operating band is maintained.

**Visual/layout:** Explicit source resistance, capacitor and load connections; aligned conceptual load/time and voltage/time panels. Preserve the RC element missing from the simplified source illustration.

## Slide 05 — Radioactive Decay with Background Radiation and Detector Dead Time

- **Scenario and objective:** A detector records decaying-source events together with background, while recovery time can prevent some events being counted. Investigate how recorded counts differ from the source behaviour.
- **Physical reasoning:** Background adds events; dead time can remove recorded events at high rates. Counts, count rate and source activity are distinct quantities.
- **Information and units:** Source/background counts, acquisition interval (s), count rate (counts/s), decay information, detector dead time (s), and efficiency/calibration when available.
- **Scope decisions:** How is background established? Which dead-time model is supported? Is efficiency adequately constant? Do not add pile-up or detailed detector physics without evidence.
- **Evidence and interpretation:** Possible evidence includes expected and recorded rate histories, the effect of background and event rate, and zero-dead-time or low-rate checks. Explain the regimes where detector effects materially change the conclusion.

**Visual/layout:** Source → event arrivals → detector recovery → recorded counts; separate source and background paths and make missed events visible.

## Slide 06 — Two-Isotope Decay Mixture with Efficiency and Counting Noise

- **Scenario and objective:** Recorded counts arise from two decaying components with detection efficiency and statistical variation. Investigate whether the observed time history supports distinguishing the components.
- **Physical reasoning:** Faster and slower decays contribute to a combined signal. The observation window, relative contributions and counting variation affect what can be inferred.
- **Information and units:** Decay timescales (s or another consistent time unit), initial contributions/activity where supplied, bin width (s), counts per bin, efficiency (dimensionless), and background information if used.
- **Scope decisions:** Are timescales sufficiently distinct? Is the observation window informative? Is efficiency constant? Advanced parameter estimation is optional; do not require identification from inadequate data.
- **Evidence and interpretation:** Possible evidence includes separate expected components, their total and noisy recorded counts; a one-component reference and repeated simulations can support checking. Explain why noise or similar decay times can make the mixture ambiguous.

**Visual/layout:** Distinguishable component contributions combining into a total; clearly separate expected curves from count observations and identify any illustration as conceptual.

## Slide 07 — Cooling with Thermal Radiation and Changing Ambient Temperature

- **Scenario and objective:** A warm object exchanges heat with its surroundings while ambient temperature changes. Investigate how these effects alter its temperature history.
- **Physical reasoning:** Convection and net thermal radiation contribute to energy transfer. Distinguish ambient air from radiative surroundings if their temperatures differ; radiation calculations require absolute temperature.
- **Information and units:** Initial and ambient temperature histories (degrees C or K), radiative-surroundings temperature if separate, mass (kg), heat capacity (J/kg/K), area (m2), convection coefficient (W/m2/K), emissivity and time (s).
- **Scope decisions:** Is one object temperature adequate? Is a constant convection coefficient reasonable? Are ambient variation and radiation material? Spatial heat-flow modelling is optional.
- **Evidence and interpretation:** Possible evidence includes object and ambient temperature histories, comparison with fixed surroundings or convection-only behaviour, and an equilibrium/no-temperature-difference check. Explain which exchange mechanism matters over the supported range.

**Visual/layout:** Labelled energy-exchange scene with distinct convection and net radiation arrows, plus time-varying surroundings cue. Do not assume identical air and radiative temperatures without stating it.

## Slide 08 — Cooling of a Heated Object with Internal Heat Generation

- **Scenario and objective:** An initially heated object continues generating heat while losing energy to its surroundings. Investigate conditions for cooling, warming or steady temperature.
- **Physical reasoning:** Temperature follows the balance between heat generation and heat loss. Internal generation can sustain a steady temperature above ambient.
- **Information and units:** Generation power or schedule (W versus s), initial/ambient temperature, thermal capacity (J/K) or mass and specific heat, geometry and supported heat-loss information.
- **Scope decisions:** Is generation uniform and prescribed? Is a lumped temperature adequate? Keep spatial gradients, changing material properties and multiple heat-transfer paths optional unless needed.
- **Evidence and interpretation:** Possible evidence includes temperature and generation histories, the effect of one generation change, and comparison with zero generation. Check whether heat generation balances loss in an apparent steady state; explain the resulting operating condition.

**Visual/layout:** Energy-in/energy-out balance around the object with labelled storage; conceptual cooling and steady-state behaviour kept separate from computed evidence.

## Slide 09 — Bounded 2D Ising Ferromagnet

- **Scenario and objective:** A finite lattice of interacting up/down spins provides a simple ferromagnetic model. Investigate how temperature changes domains, magnetisation and energy.
- **Physical reasoning:** Neighbour interactions and temperature influence spin configurations. Random updates belong to a supplied physical sampling rule; they are not arbitrary flips.
- **Information and units:** Lattice size, interaction/energy scale, consistently defined temperature or reduced temperature, boundary condition, initial state, update count and random seed. Supply a bounded implementation scaffold.
- **Scope decisions:** How long should the system equilibrate? Do initial state and finite size matter? Fix most settings and vary one principal factor; algorithm derivation and precise transition claims are beyond Core.
- **Evidence and interpretation:** Possible evidence includes comparable lattice snapshots and averaged magnetisation/energy after equilibration, repeated seeds and longer-run checks. Explain finite-run variation and the limits of claims from a small lattice.

**Visual/layout:** Consistently sized low-/high-temperature lattice snapshots with up/down legend; sampling → equilibration → measurement strip. All snapshots conceptual unless generated by retained simulation.

## Slide 10 — Monte Carlo Field of an Irregular Charged Body

- **Scenario and objective:** An irregular charged body has a specified charge distribution. Use physically meaningful random samples to estimate the electric field at selected observation points.
- **Physical reasoning:** Vector contributions from charge elements add to the net electric field. Sampling and charge weighting must represent the stated geometry and density.
- **Information and units:** Geometry and observation coordinates (m), volume or surface charge density with consistent units (C/m3 or C/m2), sample count, random seed and any reference geometry supplied.
- **Scope decisions:** Is the source a volume or a thin surface? Does the sampling represent it without bias? Begin with external observation points; near-source or singular cases require explicit treatment and remain optional.
- **Evidence and interpretation:** Possible evidence includes field components/magnitude (N/C), direction at observation points, repeated-run spread and sample-count behaviour. A symmetric reference or far-field comparison can support validation where appropriate.

**Visual/layout:** Labelled source region, random charge samples and external observation points with vector contributions. For positive charge, field arrows must point away from the source; do not reuse the source slide's inward arrows.

## Slide 11 — Damped Mass–Spring Response

- **Scenario and objective:** A disturbed mass–spring system loses energy as it moves. Investigate how damping changes its transient response and settling behaviour.
- **Physical reasoning:** The spring restores displacement; damping opposes motion and dissipates mechanical energy. Use an initial disturbance as the simplest baseline; additional forcing requires an explicit scope decision.
- **Information and units:** Mass (kg), stiffness (N/m), damping parameter with units matching the selected law, initial displacement (m), initial velocity (m/s), observation interval (s) and any settling criterion supplied.
- **Scope decisions:** Are 1D motion, a linear spring and a simple damping law adequate? Nonlinear stiffness, changing support and continued forcing are optional.
- **Evidence and interpretation:** Possible evidence includes displacement history, energy history and settling behaviour across damping cases. Compare with an undamped reference and refine the timestep to distinguish physical dissipation from numerical error.

**Visual/layout:** Correct spring–mass–damper sketch with displacement and velocity directions, plus annotated transient-response illustration. Do not depict ongoing forcing when the model is a free response.

## Slide 12 — Finite-Angle Pendulum Motion

- **Scenario and objective:** A pendulum is released from an angle too large to assume small-angle motion automatically. Investigate how the response differs from the small-angle approximation.
- **Physical reasoning:** The restoring effect depends on angle; the small-angle approximation has a limited range. Friction is an optional separate effect and must be distinguished from numerical energy drift.
- **Information and units:** Length (m), gravitational acceleration (m/s2), initial angle (rad for computation), initial angular speed (rad/s), mass (kg) when evaluating energy, time (s) and any supported damping information.
- **Scope decisions:** Is a point bob on a fixed-length, planar pendulum adequate? Vary initial angle first; pivot friction, rod inertia and moving support remain optional.
- **Evidence and interpretation:** Possible evidence includes angular displacement and period across initial angles, a small-angle reference and an energy/timestep check. Explain which differences are physical and which may arise from numerical error.

**Visual/layout:** Labelled finite-angle geometry and comparison-output area. An undamped energy-versus-time reference must be constant; replace the source slide's misleading energy-versus-angle graphic.

## Asset mapping and generation boundary

- Slides 01–12: newly generated labelled conceptual diagrams; no required source raster is to be pasted or cropped from the paired slides.
- Extracted slides 06–11 under `source-review/` are source-reading evidence only. Their text is authoritative for project identity and broad context; visible scientific errors must not be reproduced.
- If a numerical graph is introduced, first retain MATLAB source, data and reference output and approve its exact mapping. Otherwise use clearly conceptual visuals without invented numerical axes or claimed results.
- Every slide must use the current course Teaching Courseware contract. Detailed style/backend/sample confirmation follows content approval.
- Production approved: preserve samples 01 and 03; generate remaining slides using exact-match inherited slide workers, then parent QA, notes and assembly.
