%[text] # Week 6 Practical Activity: Numerical Differentiation Challenge Set
%[text] **PRACTICAL ACTIVITY**
%[text] PHY4605 AI-Enabled Group Investigation
%%
%[text] ## Group Identification and Baseline
%[text] Work in your assigned group of two or three. Generative AI may be used to write, debug, or improve MATLAB code. For every challenge, record your physical prediction, model and units, finite-difference plan, runnable evidence, validation, error interpretation, and concise AI decision record. Do not submit a complete chat transcript.
%[text] Add your group work in a new code section immediately after each challenge. Keep each Core edit bounded: one expression, one step-size choice, one check, one label, or one diagnosed defect.
group_id = "REPLACE_WITH_GROUP_ID";
group_members = "REPLACE_WITH_NAMES";
matlab_release = version('-release');
%%
%[text] ## Question 1: Predict a Vertical Velocity
%[text] **Context A - vertical motion.** Use $y(t)=y_0+v_0t-\frac{1}{2}gt^2$ with `y0=0 m`, `v0=18 m/s`, `g=9.81 m/s^2`, and target time `t0=0.8 s`. Before computing, predict the sign of `dy/dt`, its unit, and whether its magnitude should be smaller or larger than the launch speed.
vert_y0_m = 0;
vert_v0_mps = 18;
vert_g_mps2 = 9.81;
vert_t0_s = 0.8;
vert_h_s = [0.4 0.2 0.1 0.05];
%[text] **Required evidence:** prediction, model, derivative meaning, and derivative unit. **Defence hook:** explain why negative acceleration does not automatically mean negative velocity.
%%
%[text] ## Question 2: Complete One Forward Difference
%[text] Use `h = 0.4 s`. Evaluate the position at `t0` and `t0+h`, then complete the forward-difference expression `[y(t0+h)-y(t0)]/h`.
%[text] **Required evidence:** two sampled values with units, one completed expression, numerical velocity estimate. **Defence hook:** identify the numerator and denominator as physical changes.
%%
%[text] ## Question 3: Compare Step Sizes and Validate
%[text] Repeat the forward-difference estimate for the supplied `vert_h_s` values. Compare with the analytic derivative `v(t)=v0-g*t` at the same target time and report absolute or relative error.
%[text] **Required evidence:** compact table or array, analytic reference, simple error, physical interpretation of the trend. **Defence hook:** explain why changing `h` must not change `t0`, `v0`, or `g`.
%%
%[text] ## Question 4: Diagnose a Denominator Defect
%[text] Deliberately compare the correct expression `(y_next-y_now)/h` with a defective expression that divides by `t0`. Explain why the defective result is not the slope between the two sampled points even if MATLAB runs it without an error.
%[text] **Required evidence:** both expressions, diagnosis, corrected line. **Defence hook:** state which time quantity belongs in the denominator and why.
%%
%[text] ## Question 5: Predict an Electric-Field Sign
%[text] **Context B - electric potential.** Use `V(x)=V0*exp(-x/L)` with `V0=12 V`, `L=0.25 m`, and target position `x0=0.10 m`. The one-dimensional electric field is `E=-dV/dx`. Predict the sign and unit of the field before computing.
pot_V0_V = 12;
pot_L_m = 0.25;
pot_x0_m = 0.10;
pot_h_m = [0.05 0.02 0.01 0.005];
%[text] **Required evidence:** model and units, sign prediction, derivative-to-field relation. **Defence hook:** explain why a decreasing potential can produce a positive field in this coordinate direction.
%%
%[text] ## Question 6: Estimate and Validate the Electric Field
%[text] Use a forward difference for `dV/dx`, then apply the minus sign to estimate `E`. Compare the smallest supplied-step estimate with the analytic field `E=(V0/L)*exp(-x/L)`.
%[text] **Required evidence:** finite-difference expression, field estimate with V/m, analytic reference, simple error. **Defence hook:** identify where the minus sign enters and what would happen if it were omitted.
%%
%[text] ## Question 7: Predict a Cooling Rate
%[text] **Context C - Newtonian cooling.** Use `T(t)=Tenv+(T0-Tenv)*exp(-k*t)` with `T0=80 degC`, `Tenv=25 degC`, `k=0.08 1/s`, and target time `t0=10 s`. Predict the sign and unit of `dT/dt`.
cool_T0_C = 80;
cool_Tenv_C = 25;
cool_k_per_s = 0.08;
cool_t0_s = 10;
cool_h_s = [5 2 1 0.5];
%[text] **Required evidence:** prediction, model and units, explanation of what a negative derivative means physically. **Defence hook:** distinguish temperature from cooling rate.
%%
%[text] ## Question 8: Compare Cooling-Rate Step Sizes
%[text] Compute forward-difference cooling-rate estimates for the supplied `cool_h_s` values. Compare with the analytic derivative `dT/dt=-k*(T0-Tenv)*exp(-k*t)` at `cool_t0_s` and state one simple error measure.
%[text] **Required evidence:** estimates, analytic reference, simple error, trend interpretation. **Defence hook:** explain why the derivative unit is degC/s rather than degC.
%%
%[text] ## Question 9: Working Exposure - Read a Central Difference
%[text] For one of the three contexts, use the supplied formula `[f(x0+h)-f(x0-h)]/(2*h)` without deriving its error order. Compare its result with your forward estimate at the same `h` and with the analytic reference. Do not assume it must be exact for every model.
%[text] **Required evidence:** context chosen, shared `h`, forward estimate, supplied central estimate, reference comparison. **Defence hook:** identify the two sampling locations used by the central difference.
%%
%[text] ## Question 10: Cross-Context Interpretation and AI Decision Record
%[text] Compare the three investigations. For each, state the quantity being differentiated, the input variable, the derivative unit, the sign meaning, and the validation reference. Record the AI tool used, what assistance was requested, what you accepted/modified/rejected, and which independent checks you performed. If AI was not used, state that clearly.
%[text] **Required evidence:** cross-context comparison, validation judgement, concise AI decision record, and fresh-session run confirmation. **Defence hook:** explain why a numerical derivative without a unit and reference check is incomplete evidence.
%%
%[text] ## Submission and Individual Defence
%[text] Submit one completed group file through the Week 6 Google Classroom practical assignment only after running it from the top in a fresh MATLAB session. After submissions are locked, the instructor assigns a question slot and, where needed, a parameter or defect variant; one selected group member explains the model, code/output, validation, error, and physical conclusion.
%[text] Do not submit complete chat histories. Your concise AI decision record and independent checks are the required evidence.
%%
%[text] ## Reproducibility Record
%[text] This baseline requires MATLAB R2025a or later and base MATLAB only. Run it from a fresh session, top to bottom, before adding group code and again before submission. All supplied parameter values and units are declared in the relevant challenge sections.

%[appendix]{"version":"1.0"}
