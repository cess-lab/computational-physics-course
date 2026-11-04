# Presenter Notes — PHY4605 Capstone Early Briefing

## Slide 1: Your PHY4605 Capstone Investigation
This is the point where your group moves from practising individual computational methods to investigating a physical process with a real modelling decision. You will receive a distinct brief, build evidence over several weeks, and explain what your computation can and cannot establish.

## Slide 2: The New Capstone Contract
The capstone is deliberately open-ended. The brief gives you a scenario and a broad objective, but it does not give you a common starter script or one route that every group must follow; your responsibility is to make choices that can be explained and tested.

## Slide 3: What the Brief Gives You — and What You Must Decide
Read the boundary carefully. The lecturer supplies the physical context, starting information and purpose, while your group decides the model level, assumptions, numerical route, code structure, outputs and evidence needed to answer the objective.

## Slide 4: Realism Is the Goal, Not Complexity
The goal is not to add as many terms as possible. Start with a useful baseline, add effects that materially change the result, and show why the resulting approximation is relevant, testable and defensible.

## Slide 5: One Brief per Group, Ten Distinct Investigations
Each group owns one distinct investigation. The standard is shared, but the scenarios, information and objectives differ, so copying a common solution route would miss the central learning goal: making and defending a physical model choice.

## Slide 6: Projectile Investigations: Wind, Drag and Terrain
Brief 01 concerns delivery through a crosswind with quadratic drag. Brief 02 concerns launch from elevated or uneven terrain while wind changes with height. For each, the context and broad objective matter more than any fashionable added effect. Possible realism dimensions and likely information are starting points for judgement, not a checklist. Ask what terrain, airflow, release uncertainty or other effects are material and supportable.

## Slide 7: Circuit Investigations: Non-Ideal Charging and Loading
Brief 03 considers RC charging when leakage and temperature-dependent components may alter performance. Brief 04 considers a sensor circuit supplied by a non-ideal source while the connected load changes. Look for the information that is actually available, and decide which source, sensor, load, leakage or measurement effects matter to the stated objective. Do not assume every parasitic effect is worth representing.

## Slide 8: Radiation Investigations: Detector Effects and Mixed Sources
Brief 05 concerns decay observed through a detector with background events and a dead-time limitation. Brief 06 concerns a mixture of two radioactive components with efficiency and counting noise. The brief may provide categories of information rather than a complete dataset, so distinguish what is known from what must be estimated or justified. The boundary questions are part of the investigation.

## Slide 9: Thermal Investigations: Changing Surroundings and Internal Heating
Brief 07 concerns cooling with radiation and a changing ambient temperature. Brief 08 concerns an object that continues generating heat while it cools. Consider whether one uniform temperature is defensible, which heat-loss pathways matter, and whether the surrounding or operating conditions are sufficiently known. A more detailed thermal story is not automatically a better model.

## Slide 10: Force Investigations: Direction, Drag, Mass and Measurement
Brief 09 concerns a finite-duration force whose direction changes while drag acts on a moving body. Brief 10 concerns directional actuator force while mass changes and sensors are uncertain. In particular, changing mass is a physical process: ask what enters or leaves the system and whether momentum is transferred. Decide which dimensional, drag, actuator and measurement effects are relevant and defensible.

Across all five slides, aim for defensible realism: preserve a transparent baseline, add effects that materially affect the objective and can be supported or tested, and justify important omissions.

## Slide 11: From a Lecture Model to a Real Process
Use a familiar lecture model as a baseline. Then ask which missing effect matters for this particular process, whether you have the information to represent it, and whether you can test the consequence of including it.

## Slide 12: Your Investigation Reasoning Chain
Keep this chain visible throughout the project: interpret the scenario, make model choices, construct an algorithm, implement it, test it, interpret the evidence, state limitations and prepare a reproducible handoff. A later stage cannot repair an unclear physical claim at the beginning.

## Slide 13: How Groups Should Work
Divide effort without dividing understanding. Members can lead different parts of the work, but everyone must be able to explain the physical model, trace the code and interpret the evidence; record concise AI decisions and the independent checks that followed.

## Slide 14: Capstone Milestones and Weighting
The staged structure keeps the investigation manageable. The assessed pieces are feasibility, design review, development evidence, final investigation and individual defence or handoff; Week 04 and Week 12 are formative checkpoints that help you prepare rather than add new graded chapters.

## Slide 15: Week 04: Understand the Assigned Brief
Before implementation, restate the scenario and objective in your own words. Identify what is known, what is missing, what prediction or decision matters, and which ambiguities need to be clarified.

## Slide 16: Week 06: Feasibility Proposal — 2%
The feasibility proposal should show that your investigation is manageable. Give a credible model direction, likely realism extension, data and parameter plan, assumptions, computational route and verification intention; final code is not the purpose of this milestone.

## Slide 17: Week 07: Model and Computational Design Review — 3%
The design review asks whether your proposed scope is defensible and feasible. Explain the physical effects you will include, the information you need, the numerical approach you are considering, and how you intend to test and validate the result.

## Slide 18: Weeks 08–11: Build Evidence Through Iteration — 3%
Keep a compact record of meaningful decisions and improvements. Show how the model or implementation changed, what tests you ran, what evidence you accepted or rejected, and how AI assistance affected decisions without submitting a full chat diary.

## Slide 19: Week 12: Freeze, Reproduce and Rehearse
By this point, freeze a coherent model and evidence set. Run it from a fresh MATLAB session, check units and behaviour, record sensitivity and plausibility, and rehearse the individual explanation before the presentation period.

## Slide 20: AI Tutorial: Use AI as a Modelling Partner, Not a Validator
AI can help you interpret a scenario, compare model levels, plan an algorithm, draft code, debug and organise documentation. It cannot certify the physics; your group must independently check units, limiting or reference behaviour, numerical sensitivity and physical meaning.

## Slide 21: Safe Prompts, Failure Modes and Your Next Action
Ask for assumptions, alternatives and tests rather than asking whether an answer is simply correct. Watch for invented values, unstable steps, unsupported physics and polished but unverified plots; your next action is to read, frame and question the assigned brief.
