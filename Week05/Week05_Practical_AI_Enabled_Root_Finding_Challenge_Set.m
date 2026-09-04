%[text] # Week 5 Practical Activity: Root Finding Challenge Set
%[text] **PRACTICAL ACTIVITY**
%[text] PHY4605 AI-Enabled Group Investigation
%%
%[text] ## Group Identification and Baseline
%[text] Work in your assigned group of two or three. Generative AI may be used to write, debug, or improve MATLAB code. For every challenge, record your prediction, model and units, residual or bracket plan, runnable evidence, validation, physical interpretation, and concise AI decision record in your completed copy. Do not submit a complete chat transcript.
%[text] This baseline runs from a fresh MATLAB session. Add your group work in a new code section immediately after each challenge. Use the supplied stopping rule unless a challenge explicitly asks you to compare a variant.
group_id = "REPLACE_WITH_GROUP_ID";
group_members = "REPLACE_WITH_NAMES";
matlab_release = version('-release');
%%
%[text] ## Question 1: Predict a Projectile Residual and Bracket
%[text] **Context A - projectile range.** Use $R(\theta)=v_0^2\sin(2\theta)/g$ with `v0=22` m/s, `g=9.81` m/s^2, and target range 40 m. Define the residual as model range minus target range. Predict whether the residual should be negative or positive near 20 degrees and 40 degrees, then choose a low-angle sign-changing bracket.
proj_v0_mps = 22;
proj_g_mps2 = 9.81;
proj_target_m = 40;
proj_tolerance_m = 1e-3;
%[text] **Required evidence:** prediction, variables and units, residual definition, numerical bracket signs. **Defence hook:** explain what a positive projectile residual means physically.
%%
%[text] ## Question 2: Build a Residual Graph for the Projectile
%[text] Plot the projectile residual over a suitable low-angle scan and mark or state where it crosses zero. Use the graph to justify your bracket before applying a numerical method.
%[text] **Required evidence:** labelled residual graph, bracket selected from the graph, sign-change calculation. **Defence hook:** identify the root location on the graph without using a formula rearrangement.
%%
%[text] ## Question 3: Complete and Validate a Bisection Search
%[text] Use bisection on your projectile bracket until `abs(residual_m) < proj_tolerance_m`. Validate the answer by substituting the final angle back into the residual and report the low-angle launch angle with units.
%[text] **Required evidence:** bisection code or clearly traceable AI-assisted code, final angle, final residual, validation statement. **Defence hook:** trace one midpoint update and explain which half interval was kept.
%%
%[text] ## Question 4: Trace a Newton Update for the Projectile
%[text] Starting from an angle inside or near your low-angle bracket, use Newton's update with the supplied derivative $dR/d\theta=(v_0^2/g)\cos(2\theta)(2\pi/180)$ when theta is in degrees. Compare the Newton angle with your bisection result.
%[text] **Required evidence:** starting angle, at least two recorded Newton iterations, final residual, comparison with bisection. **Defence hook:** explain why the derivative has units of metres per degree.
%%
%[text] ## Question 5: Diagnose a Bad Bracket
%[text] Deliberately test a projectile interval whose two residuals have the same sign. State why bisection should not start from that interval, even if MATLAB can still compute midpoints.
%[text] **Required evidence:** same-sign residual pair, diagnosis, repaired bracket. **Defence hook:** state the bisection safety condition in one sentence.
%%
%[text] ## Question 6: Predict a Lens-Equation Root
%[text] **Context B - thin lens.** Use the supplied equation $1/f=1/u+1/v$ with focal length `f=0.10` m and object distance `u=0.30` m. Define the residual as $1/f-1/u-1/v$. Predict whether the image distance root should be larger or smaller than the focal length, then choose a bracket for `v` in metres.
lens_f_m = 0.10;
lens_u_m = 0.30;
lens_tolerance_inv_m = 1e-3;
%[text] **Required evidence:** model and units, residual definition, physical prediction, bracket signs. **Defence hook:** explain what residual zero means in the lens equation.
%%
%[text] ## Question 7: Find and Validate the Lens Image Distance
%[text] Use bisection or Newton's method to find the image distance `v_m`. Validate the result by substituting it back into the residual. Interpret the computed distance physically.
%[text] **Required evidence:** method used, final image distance, residual validation, physical interpretation. **Defence hook:** identify whether a wrong unit in centimetres would change the residual meaning.
%%
%[text] ## Question 8: Predict an RC Threshold Time
%[text] **Context C - charging capacitor.** Use $V(t)=V_s(1-\exp(-t/RC))$ with `Vs=5` V, `R=1000` ohm, and `C=1000e-6` F. Define the residual as capacitor voltage minus a 3 V threshold. Predict a time bracket in seconds for when the capacitor first reaches 3 V.
rc_Vs_V = 5;
rc_R_ohm = 1000;
rc_C_F = 1000e-6;
rc_threshold_V = 3;
rc_tolerance_V = 1e-3;
%[text] **Required evidence:** prediction, variables and units, residual definition, bracket signs. **Defence hook:** explain why the root is a time, not a voltage.
%%
%[text] ## Question 9: Compute the RC Root and Check the Voltage
%[text] Find the threshold time using a bracketed method. Validate by substituting the computed time into the voltage model and checking that it is close to 3 V.
%[text] **Required evidence:** runnable root-finding evidence, threshold time with units, substitution check, physical interpretation. **Defence hook:** explain why a residual measured in volts can validate a time root.
%%
%[text] ## Question 10: Compare Methods and Declare AI Use
%[text] Compare the projectile, lens, and RC investigations. Identify the residual, the unknown and unit of the root, the validation check, and whether bisection or Newton was easier to defend. Record the AI tool used, the material request, what you accepted/modified/rejected, and the independent checks performed. If AI was not used, state that clearly.
%[text] **Required evidence:** cross-context comparison, validation judgement, concise AI decision record, and fresh-session run confirmation. **Defence hook:** explain why a root is only meaningful after its residual and physical unit are stated.
%%
%[text] ## Submission and Individual Defence
%[text] Submit one completed group file through the Week 5 Google Classroom practical assignment only after running it from the top in a fresh MATLAB session. After submissions are locked, the instructor assigns a question slot and, where needed, a parameter or defect variant; one selected group member explains the model, code/output, validation, and physical conclusion.
%[text] Do not submit complete chat histories. Your concise AI decision record and independent checks are the required evidence.
%%
%[text] ## Reproducibility Record
%[text] This baseline requires MATLAB R2025a or later and base MATLAB only. Run it from a fresh session, top to bottom, before adding group code and again before submission. All supplied parameter values and units are declared in the relevant challenge sections.

%[appendix]{"version":"1.0"}
