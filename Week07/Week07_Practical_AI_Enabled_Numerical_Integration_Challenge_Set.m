%[text] # Week 7 Practical Activity: Numerical Integration Challenge Set
%[text] **PRACTICAL ACTIVITY**
%[text] PHY4605 AI-Enabled Group Investigation
%%
%[text] ## Group Identification and Baseline
%[text] Work in your assigned group of two or three. Generative AI may be used to write, debug, or improve MATLAB code. For every challenge, record the physical quantity being accumulated, integration limits, variables and units, trapezoidal plan, runnable evidence, validation, interpretation, and concise AI decision record. Do not submit a complete chat transcript.
%[text] Add your group work in a new code section immediately after each challenge. Keep each Core edit bounded: one expression, one sampling choice, one `trapz` call, one check, one label, or one diagnosed defect.
group_id = "REPLACE_WITH_GROUP_ID";
group_members = "REPLACE_WITH_NAMES";
matlab_release = version('-release');
%%
%[text] ## Question 1: Predict an Impulse Before Integrating
%[text] **Context A - decaying force.** Use $F(t)=F_0\exp(-t/\tau)$ with `F0=10 N`, `tau=1.0 s`, and limits `0 <= t <= 3.0 s`. The impulse is $J=\int F(t)dt$. Before computing, predict the sign, unit, and a simple upper bound for the impulse.
imp_F0_N = 10;
imp_tau_s = 1.0;
imp_T_s = 3.0;
imp_intervals = [3 6 12];
%[text] **Required evidence:** physical meaning of area, limits, impulse unit, sign and upper-bound prediction. **Defence hook:** explain why newton-seconds is the correct area unit for a force-time graph.
%%
%[text] ## Question 2: Build a Coarse Trapezoidal Estimate
%[text] Use the three-interval resolution for Context A. Create the time samples, evaluate the force at each sample, and write the composite trapezoidal sum explicitly before using `trapz`.
%[text] **Required evidence:** sample coordinates, force values, interval width, one explicit trapezoidal expression, numerical impulse with unit. **Defence hook:** identify why the first and last samples receive half weight in the uniform composite formula.
%%
%[text] ## Question 3: Use `trapz` and Validate the Same Impulse
%[text] Use `trapz(t,F)` for the same coarse samples and confirm that it agrees with your explicit trapezoidal calculation. Then compare with the analytic reference $J=F_0\tau[1-\exp(-T/\tau)]$.
%[text] **Required evidence:** correct `trapz` call, agreement check, analytic reference, absolute or relative error. **Defence hook:** explain what physical information the first argument of `trapz(t,F)` contributes.
%%
%[text] ## Question 4: Refine the Sampling Without Changing the Physics
%[text] Repeat Context A for `imp_intervals = [3 6 12]`. Keep `F0`, `tau`, and the integration limits fixed. Compare the three trapezoidal estimates and their errors against the same analytic reference.
%[text] **Required evidence:** compact refinement table, decreasing sample spacing, error trend, physical interpretation. **Defence hook:** identify which quantity is the numerical resolution and which quantities belong to the physical model.
%%
%[text] ## Question 5: Diagnose a Runnable `trapz` Defect
%[text] Compare `trapz(F_samples)` with `trapz(t_samples,F_samples)` for one Context A resolution. Explain why omitting the time coordinates can produce a runnable number that does not represent the required impulse when the physical sample spacing is not one second.
%[text] **Required evidence:** both calls, numerical consequence, unit diagnosis, corrected line. **Defence hook:** state when `trapz(y)` could be converted into a physical integral and what extra spacing information would be required.
%%
%[text] ## Question 6: Predict Work From a Position-Dependent Force
%[text] **Context B - mechanical work.** Use $F(x)=F_0[1+(x/L)^2]$ with `F0=4 N`, `L=0.50 m`, and limits `0 <= x <= 0.80 m`. The work is $W=\int F(x)dx$. Predict the sign and unit of the work and whether the force grows or decays across the interval.
work_F0_N = 4;
work_L_m = 0.50;
work_X_m = 0.80;
work_intervals = [4 8 16];
%[text] **Required evidence:** model, limits, force trend, work unit, prediction. **Defence hook:** explain why the area unit is N m rather than N/m.
%%
%[text] ## Question 7: Estimate and Validate the Mechanical Work
%[text] Use the supplied interval counts with `trapz(x,F)`. Compare your finest estimate with the analytic reference $W=F_0[X+X^3/(3L^2)]$ and state one simple error measure.
%[text] **Required evidence:** at least two resolutions, finest estimate, analytic reference, error, physical conclusion. **Defence hook:** explain why changing the number of intervals must not change `F0`, `L`, or the upper limit.
%%
%[text] ## Question 8: Predict Charge From a Decaying Current
%[text] **Context C - accumulated charge.** Use $I(t)=I_0\exp(-t/\tau)$ with `I0=0.012 A`, `tau=1.5 s`, and limits `0 <= t <= 4.5 s`. The accumulated charge is $Q=\int I(t)dt$. Predict the sign and unit of the charge.
chg_I0_A = 0.012;
chg_tau_s = 1.5;
chg_T_s = 4.5;
chg_intervals = [3 6 12];
%[text] **Required evidence:** current model and limits, charge unit from A s, sign prediction, one physical interpretation. **Defence hook:** explain why integrating current over time produces coulombs.
%%
%[text] ## Question 9: Estimate and Validate Accumulated Charge
%[text] Use `trapz(t,I)` at the supplied resolutions and compare with the analytic reference $Q=I_0\tau[1-\exp(-T/\tau)]$. Report the finest estimate and a simple error statement.
%[text] **Required evidence:** refinement table or compact array, analytic reference, error, unit, physical interpretation. **Defence hook:** explain how the numerical algorithm is the same as Context A even though the physical quantity and unit are different.
%%
%[text] ## Question 10: Working Exposure, Transfer, and AI Decision Record
%[text] For one context, compare your trapezoidal result with a **supplied** Simpson-rule result from the instructor. Do not derive Simpson's rule or independently implement several quadrature formulas. Then compare all three contexts by naming the vertical-axis quantity, horizontal-axis quantity, integration limits, integral unit, refinement variable, and validation reference. Record the AI tool used, what assistance was requested, what you accepted/modified/rejected, and which independent checks you performed. If AI was not used, state that clearly.
%[text] **Required evidence:** one supplied-method comparison, cross-context table, validation judgement, concise AI decision record, and fresh-session run confirmation. **Defence hook:** explain why a numerical integral without limits, units, and a validation statement is incomplete evidence.
%%
%[text] ## Submission and Individual Defence
%[text] Submit one completed group file through the Week 7 Google Classroom practical assignment only after running it from the top in a fresh MATLAB session. After submissions are locked, the instructor assigns a question slot and, where needed, a parameter, resolution, or defect variant; one selected group member explains the model, trapezoidal reasoning, code/output, validation, and physical conclusion.
%[text] Do not submit complete chat histories. Your concise AI decision record and independent checks are the required evidence.
%%
%[text] ## Reproducibility Record
%[text] This baseline requires MATLAB R2025a or later and base MATLAB only. Run it from a fresh session, top to bottom, before adding group code and again before submission. All supplied parameter values, integration limits, interval counts, and units are declared in the relevant challenge sections.

%[appendix]{"version":"1.0"}
