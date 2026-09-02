%[text] # Week 4 Practical Activity: Parameter Sweeps and Graph Interpretation Challenge Set
%[text] **PRACTICAL ACTIVITY**
%[text] PHY4605 AI-Enabled Group Investigation
%%
%[text] ## Group Identification and Baseline
%[text] Work in your assigned group of two or three. Generative AI may be used to write, debug, or improve MATLAB code. For every challenge, record your prediction, model and units, controlled-comparison plan, runnable evidence, validation, physical interpretation, and concise AI decision record in your completed copy. Do not submit a complete chat transcript.
%[text] This baseline runs from a fresh MATLAB session. Add your group work in a new code section immediately after each challenge. Change only the parameter named in the challenge unless the task explicitly asks you to diagnose a broken comparison.
group_id = "REPLACE_WITH_GROUP_ID";
group_members = "REPLACE_WITH_NAMES";
matlab_release = version('-release');
%%
%[text] ## Question 1: Predict an Ohmic-Resistance Sweep
%[text] **Context A - Ohmic resistor.** Use the supplied model $I=V/R$. The voltage array will be common to all cases, while resistance is swept through 5 ohm, 10 ohm, and 20 ohm. Before coding, predict which resistance gives the largest current at the same voltage and state what must remain fixed for the comparison to be controlled.
resistor_V_V = 0:1:12;
resistor_R_ohm = [5 10 20];
%[text] **Required evidence:** prediction, variables and units, swept parameter, fixed input/model list. **Defence hook:** explain why changing voltage range between cases would weaken the comparison.
%%
%[text] ## Question 2: Build and Plot the Resistor Sweep
%[text] Evaluate $I=V/R$ for all three resistances using a loop or an equivalent clearly traceable array method. Overlay the three current-voltage curves on the same axes and identify the 10 ohm case as the baseline.
%[text] **Required evidence:** parameter array, runnable calculation, labelled overlay plot with legend, baseline identification. **Defence hook:** trace one stored current value back to its voltage and resistance.
%%
%[text] ## Question 3: Validate the Resistor Limiting Case
%[text] At zero applied voltage, the ideal Ohmic model predicts zero current for every positive resistance. Check this numerically across all three swept cases and explain what type of defect the check could reveal.
%[text] **Required evidence:** executable zero-voltage check and one-sentence interpretation. **Defence hook:** explain why successful plotting alone is weaker evidence than the known limiting case.
%%
%[text] ## Question 4: Diagnose a Multiplication/Division Defect
%[text] Deliberately create one defective expression that uses `V.*R` where the physical model requires `V./R`. Compare its units and trend with the correct model, then repair it. Do not accept the defective result simply because MATLAB returns a smooth curve.
%[text] **Required evidence:** defective expression, unit diagnosis, trend diagnosis, repaired result. **Defence hook:** explain why the wrong expression predicts the opposite resistance trend.
%%
%[text] ## Question 5: Predict a Vertical-Launch Speed Sweep
%[text] **Context B - Vertical motion.** Reuse the familiar model $y(t)=y_0+v_0t-\tfrac12gt^2$. Use a common time array from 0 s to 3 s, keep $y_0=0$ m and $g=9.81$ m/s^2 fixed, and sweep launch speed through 15, 20, and 25 m/s. Predict how increasing launch speed changes the height at the same time.
projectile_t_s = 0:0.1:3;
projectile_v0_mps = [15 20 25];
projectile_y0_m = 0;
projectile_g_mps2 = 9.81;
%[text] **Required evidence:** prediction, model and units, swept parameter, list of fixed quantities. **Defence hook:** explain why the same time array is important for point-by-point comparison.
%%
%[text] ## Question 6: Compute, Plot, and Validate the Launch-Speed Sweep
%[text] Evaluate the height-time model for all three launch speeds and overlay the curves. Validate the shared initial condition $y(0)=0$ m across every case, then compare the heights at $t=2.0$ s.
%[text] **Required evidence:** runnable sweep, labelled overlay plot, executable initial-value check, selected-value comparison. **Defence hook:** explain why all curves must start at the same height even though their later heights differ.
%%
%[text] ## Question 7: Diagnose a Broken Controlled Comparison
%[text] Make one deliberately unfair comparison: keep two launch cases at Earth gravity, but change the third case to $g=1.62$ m/s^2 while also changing launch speed. Show the resulting graph, then explain why the difference can no longer be attributed to launch speed alone. Repair the sweep so only `v0` changes.
%[text] **Required evidence:** unfair comparison identified, explanation of the confounded variables, repaired controlled sweep. **Defence hook:** define a controlled parameter sweep in one sentence.
%%
%[text] ## Question 8: Predict a Pendulum-Gravity Sweep
%[text] **Context C - Small-angle pendulum.** Use the supplied period model $T=2\pi\sqrt{L/g}$. Sweep gravitational acceleration through 1.62, 3.71, and 9.81 m/s^2 while using the same pendulum-length array from 0.2 m to 2.0 m. Predict which environment gives the longest period for the same length.
pendulum_L_m = 0.2:0.2:2.0;
pendulum_g_mps2 = [1.62 3.71 9.81];
%[text] **Required evidence:** prediction, variables and units, swept parameter, fixed model/input statement. **Defence hook:** use the square-root relationship to explain the expected gravity trend.
%%
%[text] ## Question 9: Plot the Pendulum Sweep and Check an Earth Reference
%[text] Evaluate and overlay the three period-length curves. For Earth gravity and $L=1.0$ m, compare your numerical value with the supplied reference $T\approx2.006$ s. Then produce a small table of period values for two selected lengths across all three gravity values as Working exposure.
%[text] **Required evidence:** labelled overlay plot, Earth-reference comparison, compact selected-value table, physical interpretation. **Defence hook:** explain why a reference value can expose a wrong unit or formula even when the graph shape looks smooth.
%%
%[text] ## Question 10: Compare the Three Sweeps and Declare AI Use
%[text] Compare the resistor, vertical-motion, and pendulum investigations. Identify the same controlled-sweep pattern in all three, then identify one context-specific validation check. Record the AI tool used, the material request, what you accepted/modified/rejected, and the independent checks performed. If AI was not used, state that clearly.
%[text] **Required evidence:** cross-context comparison, validation judgement, concise AI decision record, and fresh-session run confirmation. **Defence hook:** explain why a parameter sweep is an experiment on a fixed model rather than a collection of unrelated curves.
%%
%[text] ## Formative Capstone Preference Checkpoint
%[text] Open `Week04_Capstone_Preference_Checkpoint.md`. As a group, record one preferred and one alternate bounded problem space plus one parameter you would consider modifying while holding the rest of the model fixed. This is a formative Week 4 choice, not the Week 6 feasibility submission.
%%
%[text] ## Submission and Individual Defence
%[text] Submit one completed group file through the Week 4 Google Classroom practical assignment only after running it from the top in a fresh MATLAB session. After submissions are locked, the instructor assigns a question slot and, where needed, a parameter or defect variant; one selected group member explains the model, code/output, validation, and physical conclusion.
%[text] Do not submit complete chat histories. Your concise AI decision record and independent checks are the required evidence.
%%
%[text] ## Reproducibility Record
%[text] This baseline requires MATLAB R2025a or later and base MATLAB only. Run it from a fresh session, top to bottom, before adding group code and again before submission. All supplied parameter values and units are declared in the relevant challenge sections.

%[appendix]{"version":"1.0"}
