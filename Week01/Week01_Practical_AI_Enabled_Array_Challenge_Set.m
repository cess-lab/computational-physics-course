%[text] # Week 1 Practical Activity: AI-Enabled Array Challenge Set
%[text] **PRACTICAL ACTIVITY**
%[text] PHY4605 Physics-First Reproducible MATLAB Notebook
%%
%[text] ## Purpose and Group Evidence
%[text] This practical transfers Week 1 array and plotting literacy to three supplied physics contexts: RC-circuit charging, a mass-spring oscillator, and radioactive decay. These are not the lecture's vertical-motion model. The supplied equations, parameters, units, and checks keep the focus on computational reasoning rather than unfamiliar theory.
%[text] Your group may use any generative-AI tool to write, debug, or improve MATLAB code. AI-generated code is allowed, but it is not enough by itself. For every question, record the relevant prediction, model and units, plan, code/output, validation, and physical conclusion in your completed copy of this file.
%[text] Work in your assigned group of two or three. Rotate model lead, algorithm/code lead, and validation/interpretation lead while ensuring every member can explain every answer. Submit one completed group file through Google Classroom, then be ready for a post-submission random individual defence.
%%
%[text] ## Group Identification and Baseline
%[text] Replace the two strings before submission. This baseline deliberately runs from a fresh MATLAB session without hidden Workspace state; add your group code in a new code section immediately after each question.
group_id = "REPLACE_WITH_GROUP_ID";
group_members = "REPLACE_WITH_NAMES";
matlab_release = version('-release');
%%
%[text] ## Question 1: Predict RC Charging
%[text] A capacitor charges through a resistor from a 12.0 V supply. The supplied model is $V_C(t)=V_S[1-\exp(-t/\tau)]$ with time constant $\tau=2.0$ s. Before any code, predict the curve's starting value, long-time value, and shape. State the physical meaning of one time constant.
%[text] **Required evidence:** a three-part prediction in your group record. **Defence hook:** explain why the curve rises quickly at first and then levels off.
%%
%[text] ## Question 2: Define RC Variables and Units
%[text] Use the names below. Confirm the units of `V_supply_V`, `tau_s`, `t_RC_s`, and `V_capacitor_V` in a comment or table before you calculate the model. A voltage divided by a voltage must be dimensionless inside `exp`.
V_supply_V = 12.0;
tau_s = 2.0;
t_RC_s = linspace(0,10,101);
RC_sample_count = numel(t_RC_s);
%[text] **Required evidence:** units and an explanation of why `t_RC_s./tau_s` has no units. **Defence hook:** identify the first and last stored times and the total sample count.
%%
%[text] ## Question 3: Plan the RC Computation
%[text] Write concise pseudocode or a prompt plan before asking AI for code: make time samples, calculate one capacitor voltage for each time, inspect a selected value, make a labelled plot, and check the known one-time-constant value. Do not paste a full chat transcript.
%[text] **Required evidence:** your plan and the AI tool, if one is used. **Defence hook:** explain the purpose of the dot in `./` before you run the calculation.
%%
%[text] ## Question 4: Generate the RC Voltage Array
%[text] Add and run code that creates `V_capacitor_V` for every value in `t_RC_s`. Use the supplied model and `exp`. Display one selected value near `t=2.0` s. Your code should run from the top of the file without depending on a previous Workspace.
%[text] **Required evidence:** executable code, one selected value, and the interpretation of the array shape. **Defence hook:** trace the expression that produces every value in `V_capacitor_V`.
%%
%[text] ## Question 5: Plot and Validate RC Charging
%[text] Make a readable graph of capacitor voltage against time with a title, labelled axes, units, grid, and an indicated validation point. Check both $V_C(0)=0$ V and $V_C(\tau)\approx0.632V_S$. State whether your output supports the prediction.
%[text] **Required evidence:** labelled graph, two checks, and a one-sentence physical interpretation. **Defence hook:** predict how doubling `tau_s` changes the graph before rerunning your code.
%%
%[text] ## Question 6: Predict a Mass-Spring Oscillator
%[text] A block moves without damping on a horizontal spring. The supplied model is $x(t)=A\cos(\omega t)$, where $A=0.080$ m and the period is $T=1.60$ s. Use $\omega=2\pi/T$. Predict `x_m` at 0 s, one quarter of a period, and half a period.
A_m = 0.080;
period_s = 1.60;
spring_constant_Npm = 10.0;
t_spring_s = linspace(0,3.20,161);
%[text] **Required evidence:** prediction with units and a statement of the sign convention. **Defence hook:** explain why displacement can be negative while amplitude is positive.
%%
%[text] ## Question 7: Compute Displacement and Spring Energy
%[text] Add code that calculates `omega_radps`, `x_m`, and $E=\frac{1}{2}kx^2$ as `spring_energy_J`. Use element-wise operations where an array is squared or multiplied. Inspect the first value of each array and one value near a quarter period.
%[text] **Required evidence:** executable code, selected values, and a note identifying where `.*` or `.^` is required. **Defence hook:** explain the difference between `^2` and `.^2` for an array.
%%
%[text] ## Question 8: Plot and Validate the Oscillator
%[text] Plot `x_m` against `t_spring_s` with units. Validate $x(0)=A$ and use the graph to test the quarter-period prediction. Explain whether the spring energy is greatest at an extreme displacement or at equilibrium, using your computed array as evidence.
%[text] **Required evidence:** labelled graph, two validation statements, and an energy interpretation. **Defence hook:** state one parameter change that increases the oscillation frequency and justify it from the supplied model.
%%
%[text] ## Question 9: Model Radioactive Decay
%[text] A sample has $N_0=800$ counts at $t=0$ and half-life $T_{1/2}=6.0$ h. Use $\lambda=\log(2)/T_{1/2}$ and $N(t)=N_0\exp(-\lambda t)$. Build `t_decay_h` from 0 h to 24 h, calculate `N_counts`, and check the predicted count after one half-life.
N0_counts = 800;
half_life_h = 6.0;
t_decay_h = linspace(0,24,121);
%[text] **Required evidence:** executable code, a value near 6 h, and a validation against 400 counts. **Defence hook:** explain why the exponent is dimensionless and predict the count after 24 h.
%%
%[text] ## Question 10: Compare, Interpret, and Declare AI Use
%[text] Make one labelled decay graph and write a short comparison across all three contexts. Identify one array operation that would fail or give the wrong meaning without a dot, and one validation check that caught or could catch an AI-generated mistake. Record the AI tool used, what you asked it for, what you accepted/modified/rejected, and the independent checks performed. If AI was not used, state that clearly.
%[text] **Required evidence:** labelled graph, cross-context interpretation, operator explanation, validation statement, and concise AI decision record. **Defence hook:** trace one line of your group's code and explain how its output answers a physical question.
%%
%[text] ## Submission and Individual Defence
%[text] Submit this completed file through the Week 1 Google Classroom practical assignment after running it from the top in a fresh MATLAB session. Your group submission is locked before the defence draw. The instructor will then assign a question slot, a parameter or defect variant where needed, and one randomly selected group member to explain the model, trace the code/output, and answer a validation or parameter-change follow-up.
%[text] Do not submit complete chat histories. Your concise AI decision record and the group's independent checks are the required evidence. Keep generated code only when the group can explain and validate it.
%%
%[text] ## Reproducibility Record
%[text] This baseline requires MATLAB R2025a or later and base MATLAB only. Run it from a fresh session, top to bottom, before adding code and again before submitting. Locked baseline values are 12.0 V and 2.0 s for RC charging, 0.080 m and 1.60 s for the oscillator, and 800 counts with a 6.0 h half-life for decay.

%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"inline"}
