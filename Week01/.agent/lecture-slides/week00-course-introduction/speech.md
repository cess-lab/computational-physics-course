## Slide 1: Computational Methods in Physics

Welcome to Computational Methods in Physics. We will use MATLAB to turn familiar physics questions into computations that we can inspect, check and explain. The result we want is more than a script that runs: it is a physical conclusion supported by reproducible evidence.

We begin with supplied models and code, so you can learn by tracing, completing and changing a small part at a time. MATLAB Onramp remains a required prerequisite, but the first two weeks revisit the foundations. Let us begin with why a physicist needs computation.

## Slide 2: Why compute in physics?

Computation gives us a practical way to investigate physical questions. We can change a launch speed and compare outcomes, solve coupled circuit equations, or follow how a temperature changes from an initial condition. In each case, the computer carries out a calculation while the physical model determines what the calculation means.

An analytical result is still useful when it is available: it gives us a reference against which we can check the computation. We will start with familiar physics so that the new demand is the computational method. The next example shows why producing an answer is only part of the task.

## Slide 3: A result needs a physical check

Before calculating, predict what a ball thrown vertically upward should do. It rises, reaches a maximum height and returns toward the launch height. These are separate snapshots of vertical motion, not a curved path through horizontal space.

With upward positive, no air resistance and zero launch height, the supplied equation gives height at each chosen time. We can store those heights as an array. A simple first check is the launch condition: at time zero the calculated height must be zero metres.

Passing this check does not prove that every part of a computation is correct. It is one useful known-value check, followed by interpreting the behaviour and its assumptions. This habit connects the capabilities we will build throughout the course.

## Slide 4: What you will learn to do

The course builds four connected capabilities. First, identify the physical model, assumptions, variables and units. Next, express the steps as an algorithm. Then read, trace, complete or modify the MATLAB implementation. Finally, check the output and explain its physical meaning.

Ordinary Core work uses familiar models and supplied scaffolds. You are not expected to begin every task with a blank editor. Independent formulation and implementation are opportunities for deeper distinction-level work. The main expectation is that you can explain the reasoning in the work you submit. These capabilities form a repeatable computation process.

## Slide 5: How we build a trustworthy computation

Read this process in order. Define the physical model and establish the scale and units. Decide how a continuous quantity or system will be represented by samples or discrete steps, then specify the algorithm and implement it in code.

Evaluation includes error or uncertainty, an appropriate validation check, and a physical interpretation. The type of check depends on the task: a known value, a limiting case, refinement, direct balance, or a supplied reference may be suitable. We usually develop one Core check clearly before adding others.

A check may reveal that we need to revisit an earlier decision. The loop is a reasoning habit rather than a demand for a long report every week. Now let us place that habit across the semester.

## Slide 6: Your journey: build the foundations

The first four weeks build the foundation. Week 1 uses arrays and plots to represent familiar vertical motion. Week 2 turns physical reasoning into pseudocode and loops and introduces tracing and clear defects. Week 3 solves a small linear system through Kirchhoff circuit equations. Week 4 compares one controlled parameter change.

We revisit indexing, element-wise operations, plots and debugging throughout the course rather than assuming they are mastered after one lesson. In Week 3, I also introduce the assigned capstone briefs; Week 4 helps groups review their brief and its paired physical family. These foundations support the numerical methods that follow.

## Slide 7: Your journey: learn numerical methods

Weeks 5 to 8 introduce four numerical tasks. Root finding locates a physical solution by identifying where a residual is zero. Differentiation estimates a rate or gradient. Integration accumulates a changing quantity. An ODE simulation evolves a state from an initial condition.

The implementations remain scaffolded. A familiar analytical result or supplied reference helps us judge whether the approximation is sensible. Step size and refinement become practical questions about the output, rather than advanced derivations required for every student.

The capstone feasibility proposal is due in Week 6. In Week 7, we approve the model, method and validation plan so the investigation stays bounded and achievable.

## Slide 8: Your journey: investigate and defend

Weeks 9 to 11 broaden the investigation. Data fitting estimates a physical parameter from observations, Monte Carlo sampling explores repeated random trials, and sensitivity analysis asks how an input range affects an output range. We distinguish uncertainty in parameters and model assumptions from numerical error.

Week 12 consolidates the methods: we audit a computation, assemble the capstone evidence and rehearse explanations. It introduces no new required numerical method. Weeks 13 and 14 are for presentations, individual defences and reproducibility handoffs. Week 14 continues that sequence without a new Core topic or compulsory practical.

The capstone uses a starter Live Script, one justified modification, a principal output, validation evidence and a limitation. We build it through checkpoints rather than leave everything until the end.

## Slide 9: Use each course material for a purpose

Each material has a different job. Slides help you follow the main reasoning during class. Learning notes let you revisit explanations and worked examples. The MATLAB Live Script is where you run the model, trace its sections and inspect the evidence. Practical challenge sets ask you to transfer the week's method to supplied analogous physics contexts.

Open the materials in the relevant week folder. The student-facing README explains the model, run order, requirements and checks. The plain-text .m Live Scripts require MATLAB R2025a or later. Use the editable computational file rather than treating a screenshot as reproducible evidence. The platforms on the next slide help organise this work.

## Slide 10: Where learning and submission happen

Google Classroom is our official course hub. Use it for released materials, announcements, due dates, submissions, feedback and completion records. MATLAB is where you execute the model and generate reproducible numerical evidence.

NotebookLM supports revision using approved course sources. Its role is to guide you with focused questions and progressive hints: establish the model and units, plan the algorithm, then validate the result independently. It does not replace a MATLAB run or the official submission record.

For AI-assisted revision, make an initial attempt, use guidance, revise your reasoning, identify the misconception or defect, perform a check and reflect. Submit through Classroom when the activity requires a submission. This gives us a consistent weekly routine.

## Slide 11: Your weekly learning routine

Before class, read the note and make a physical prediction. Complete the dedicated weekly diagnostic through the relevant Classroom coursework when it is released. During class, follow the model-to-evidence chain, trace or modify a supplied section, check the output and complete the exit ticket.

In the practical, your group investigates supplied contexts and records compact evidence. Run the final file from a fresh MATLAB session to catch hidden Workspace dependencies. Afterward, submit the evidence, explain the result when selected for defence, and use feedback to improve your reasoning.

If a diagnostic reveals a common misconception, an optional short remediation may target that issue without delaying the planned sequence. The assessment system rewards the same habits.

## Slide 12: How your learning is assessed

The six components total 100 percent. Test 1 and Test 2 each contribute 10 percent, and the final examination contributes 40 percent. These written assessments are open book and AI-free. They use familiar or closely analogous physics, supplied formulas and scaffolds, code reading, validation and interpretation rather than memorisation of function names.

The practical portfolio contributes 15 percent: 12 percent for group evidence and 3 percent for cumulative individual defence. Ten packets are submitted across Weeks 2 to 11; the best eight count for the group component. Week 1 is formative onboarding. The individual lab test contributes 10 percent and the capstone 15 percent; AI is allowed and declared in these computational investigations.

Test 1 covers Weeks 1 to 5 and targets Week 6. Test 2 covers Weeks 6 to 11 and targets Week 12. Exact dates will be confirmed through Classroom. Model and algorithm reasoning can earn marks when code is incomplete, but numerical evidence and validation require reproducible output or a precise execution-failure diagnosis.

## Slide 13: Use AI and take responsibility for the result

Practicals use groups of two or three, with ten progressive micro-challenges across supplied contexts. AI may help write, debug or improve code. Record the tool, material request, decisions accepted, modified or rejected, and the independent checks. You do not need to submit a complete chat history.

Every group completes and locks the evidence before the draw. A question slot, with a parameter or defect variant where appropriate, and one eligible member are then selected. The student explains the model, traces code or output, and answers a validation or parameter-change follow-up. Every member must therefore understand the whole submitted investigation.

We rotate selections so every member has a completed defence before anyone receives a second. An absence remains pending until a make-up defence. AI assistance supports implementation, while your explanations and checks establish that you understand the result. Let us finish with a small prediction for Week 1.

## Slide 14: Start with a prediction

Complete MATLAB Onramp and check that you can access Google Classroom and MATLAB. Open the Week 1 materials and locate the lecture demonstration, learning note and practical challenge set. The demonstration is complete so you can follow it section by section.

Before running anything, imagine a ball thrown vertically upward with no air resistance. Upward is positive. Sketch height against time and describe what the graph should do at the beginning, near the highest point and afterward. What known condition could you check in the computed output?

Keep your prediction. Week 1 turns that physical reasoning into arrays, a labelled plot and a check that you can explain.
