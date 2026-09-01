%[text] # Week 2 Practical Activity: Loops and Debugging Challenge Set
%[text] **PRACTICAL ACTIVITY**
%[text] PHY4605 AI-Enabled Group Investigation
%%
%[text] ## Group Identification and Baseline
%[text] Work in your assigned group of two or three. Generative AI may be used to write, debug, or improve MATLAB code, but code alone is not enough. For every challenge, record the prediction, model and units, plan, runnable evidence, validation, interpretation, and concise AI decision record in your completed copy.
%[text] This baseline runs from a fresh MATLAB session. Add your group code in a new code section immediately after each challenge. Do not use a hidden Workspace variable.
group_id = "REPLACE_WITH_GROUP_ID";
group_members = "REPLACE_WITH_NAMES";
matlab_release = version('-release');
%%
%[text] ## Question 1: Predict Cooling One Time at a Time
%[text] A metal object cools toward room temperature. The supplied model is $T(t)=T_{room}+(T_0-T_{room})\exp(-t/\tau)$, with `T_room_C=25`, `T0_C=85`, and `tau_s=4.0`. Predict the first temperature, the long-time trend, and whether the temperature should rise or fall.
%[text] **Required evidence:** three-part prediction with units. **Defence hook:** explain which value in the model is the equilibrium temperature.
%%
%[text] ## Question 2: Build the Cooling Inputs and Pseudocode
%[text] Create time values from 0 s to 16 s in 1 s steps. Write a six-step pseudocode plan that names the inputs, preallocation, loop start, current time, temperature update, output, and check.
T_room_C = 25;
T0_C = 85;
tau_s = 4.0;
t_cool_s = 0:1:16;
%[text] **Required evidence:** executable inputs and short pseudocode. **Defence hook:** explain why `t_cool_s/tau_s` is dimensionless.
%%
%[text] ## Question 3: Complete and Trace a Cooling Loop
%[text] Add code that preallocates `T_C`, then uses a `for` loop to calculate one temperature for each stored time. Display the first two loop results and trace those two passes by hand.
%[text] **Required evidence:** runnable loop, first-two-pass trace, and a labelled temperature-time graph. **Defence hook:** identify the current time and matching storage location on the second pass.
%%
%[text] ## Question 4: Validate and Modify Cooling
%[text] Check $T(0)=T_0$ and state whether your graph approaches `T_room_C`. Predict how doubling `tau_s` changes the curve, then change only that parameter and rerun.
%[text] **Required evidence:** executable initial-value check, parameter prediction, revised output, and interpretation. **Defence hook:** explain why a larger time constant produces slower cooling.
%%
%[text] ## Question 5: Diagnose a Syntax Defect
%[text] Copy your cooling loop into a new section and deliberately remove its final `end`. Run it and record the MATLAB error location and the surrounding line. Restore the `end` before continuing.
%[text] **Required evidence:** error location, defect type, corrected line, and successful rerun. **Defence hook:** explain what MATLAB cannot determine when the loop has no closing `end`.
%%
%[text] ## Question 6: Diagnose an Indexing Defect
%[text] The intended storage rule is `T_C(sample_index) = ...`. Explain what happens if every loop pass instead uses `T_C(1) = ...`. Run the wrong version in a new variable, inspect its size and nonzero entries, then repair it.
%[text] **Required evidence:** defective output, diagnosis, repaired code, and validation rerun. **Defence hook:** explain why code can run without syntax errors but still be wrong.
%%
%[text] ## Question 7: Loop Through Radioactive Decay
%[text] A source starts with `N0_counts=800` counts and has `half_life_h=6.0` h. Use $N(t)=N_0\exp(-\lambda t)$ with $\lambda=\log(2)/T_{1/2}$. Create hourly times from 0 h to 24 h and calculate `N_counts` with a loop.
N0_counts = 800;
half_life_h = 6.0;
t_decay_h = 0:1:24;
%[text] **Required evidence:** model and unit check, preallocated loop, labelled graph, and selected values. **Defence hook:** identify the units of `lambda_per_h` and why the exponent has no units.
%%
%[text] ## Question 8: Diagnose a Physical or Logical Defect
%[text] Make a deliberately wrong decay version that uses `exp(+lambda_per_h*current_time_h)`. Compare its graph with your correct graph. State why the plus sign contradicts the physical meaning of decay, even if MATLAB reports no error.
%[text] **Required evidence:** comparison output, physical diagnosis, corrected expression, and one check at 6 h. **Defence hook:** use the half-life result to explain why the correct count should be near 400.
%%
%[text] ## Question 9: Loop Through a Mass-Spring Model
%[text] A mass oscillates without damping: $x(t)=A\cos(2\pi t/T)$. Use `A_m=0.080`, `period_s=1.60`, and times from 0 s to 3.2 s in 0.1 s steps. Calculate one `x_m` value per loop pass, then validate $x(0)=A$ and inspect the value near one quarter period.
A_m = 0.080;
period_s = 1.60;
t_spring_s = 0:0.1:3.2;
%[text] **Required evidence:** runnable loop, labelled graph, two checks, and an interpretation of negative displacement. **Defence hook:** trace the loop pass nearest a quarter period.
%%
%[text] ## Question 10: Compare, Explain, and Declare AI Use
%[text] Compare the three contexts: cooling, decay, and oscillation. Identify one repeated loop pattern and one defect that requires physics evidence rather than an error message. Record the AI tool used, what assistance was requested, what was accepted/modified/rejected, and the independent checks performed. If AI was not used, say so clearly.
%[text] **Required evidence:** concise cross-context comparison, one diagnostic explanation, and AI decision record. **Defence hook:** trace one line of your final code and explain how its output answers a physical question.
%%
%[text] ## Submission and Individual Defence
%[text] Submit one completed group file through the Week 2 Google Classroom practical assignment only after running it from the top in a fresh MATLAB session. After submissions are locked, the instructor assigns a question slot and, where needed, a parameter or defect variant; one selected group member explains the model, code/output, validation, and physical conclusion.
%[text] Do not submit complete chat histories. Your concise AI decision record and independent checks are the required evidence.
%%
%[text] ## Reproducibility Record
%[text] This baseline requires MATLAB R2025a or later and base MATLAB only. Run it from a fresh session, top to bottom, before adding group code and again before submission.

%[appendix]{"version":"1.0"}
