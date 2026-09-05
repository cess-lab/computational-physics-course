%[text] # Week 8 Practical Activity: AI-Enabled ODE Challenge Set
%[text] **PRACTICAL ACTIVITY**
%[text] PHY4605 Physics-First Reproducible MATLAB Notebook
%%
%[text] ## Group Identification and Baseline
%[text] Work in your assigned group of two or three. This practical uses three supplied first-order models that are distinct from the lecture cooling model: RC discharge, a falling object with linear drag, and radioactive decay. Generative AI may help write, debug, or improve MATLAB code, but each group must record its decisions and independently check units, a reference result, and physical meaning. Do not submit a complete chat transcript.
%[text] Add your short group evidence immediately after each challenge. Keep each Core edit bounded: one prediction, one update expression, one timestep choice, one labelled output, one check, or one diagnosed defect.
group_id = "REPLACE_WITH_GROUP_ID";
group_members = "REPLACE_WITH_NAMES";
matlab_release = version('-release');
%%
%[text] ## Question 1: Predict an RC Discharge
%[text] **Context A - RC discharge.** A capacitor initially has `V0=12 V` and discharges through `R=1000 ohm` and `C=0.002 F`. Use the supplied model $dV/dt=-V/(RC)$ for `0 <= t <= 8 s`. In words: the voltage falls at a rate proportional to its present value. Predict the voltage trend, its unit, and the initial sign of `dV/dt` before running code.
rc_V0_V = 12;
rc_R_ohm = 1000;
rc_C_F = 0.002;
rc_final_time_s = 8;
rc_dt_s = 0.5;
rc_prediction = "REPLACE_WITH_TREND_UNIT_AND_DERIVATIVE_SIGN";
%[text] **Required evidence:** state variable, derivative unit `V/s`, initial condition, time constant `R*C` in seconds, and prediction. **Defence hook:** explain why a positive voltage has a negative derivative in this discharge model.
%%
%[text] ## Question 2: Trace and Run the Euler Update
%[text] Euler uses the present slope to estimate the next value: $V\\_{n+1}=V\\_n+dt[-V\\_n/(RC)]$. Read the pseudocode first: make time points; store the initial voltage; use the current voltage to calculate one slope; add `dt` times the slope; repeat. The supplied loop is complete so the baseline runs from a fresh session. Trace the first two updates by recording `rc_voltage_euler_V(1)`, `(2)`, and `(3)` with units.
rc_time_s = 0:rc_dt_s:rc_final_time_s;
rc_voltage_euler_V = zeros(size(rc_time_s));
rc_voltage_euler_V(1) = rc_V0_V;
for n = 1:numel(rc_time_s)-1
    rc_slope_V_per_s = -rc_voltage_euler_V(n)/(rc_R_ohm*rc_C_F);
    rc_voltage_euler_V(n+1) = rc_voltage_euler_V(n) + rc_dt_s*rc_slope_V_per_s;
end
rc_first_two_updates_V = rc_voltage_euler_V(1:3)
assert(rc_voltage_euler_V(1) == rc_V0_V)
assert(all(diff(rc_voltage_euler_V) < 0))
%[text] **Required evidence:** the three traced values, one sentence matching a line of code to the pseudocode, and the unit of `rc_slope_V_per_s`. **Defence hook:** identify why MATLAB index `1` stores the physical initial condition at `t=0`.
%%
%[text] ## Question 3: Compare the Simulation With a Supplied Exact Reference
%[text] The supplied reference is $V(t)=V\\_0\\exp[-t/(RC)]$. The code below places the Euler and exact trajectories on the same labelled graph. Inspect the largest absolute difference and decide whether Euler is above or below the exact voltage for this timestep.
rc_voltage_exact_V = rc_V0_V*exp(-rc_time_s/(rc_R_ohm*rc_C_F));
rc_max_error_V = max(abs(rc_voltage_euler_V-rc_voltage_exact_V));
tiledlayout(3,1)
nexttile
plot(rc_time_s,rc_voltage_euler_V,"o-",rc_time_s,rc_voltage_exact_V,"-","LineWidth",1.5)
xlabel("Time (s)")
ylabel("Capacitor voltage (V)")
title("RC discharge: Euler and supplied exact reference")
legend("Euler, dt = 0.5 s","Exact reference","Location","northeast")
grid on
assert(rc_max_error_V > 0)
assert(rc_voltage_euler_V(end) < rc_voltage_exact_V(end))
rc_max_error_V
rc_reference_judgement = "REPLACE_WITH_ABOVE_OR_BELOW_AND_EVIDENCE";
%[text] **Required evidence:** labelled graph, largest difference with unit, above/below judgement, and one physical interpretation. **Defence hook:** explain why matching the initial value alone is useful but insufficient validation.
%%
%[text] ## Question 4: Change Only the Timestep
%[text] Keep the RC model and final time fixed. The loop below repeats the Euler method at three supplied timesteps and compares each final value with the same exact reference. This is a Core timestep-refinement check.
rc_dt_choices_s = [0.5 0.25 0.125];
rc_final_error_V = zeros(size(rc_dt_choices_s));
for k = 1:numel(rc_dt_choices_s)
    dt_s = rc_dt_choices_s(k);
    time_s = 0:dt_s:rc_final_time_s;
    voltage_V = zeros(size(time_s));
    voltage_V(1) = rc_V0_V;
    for n = 1:numel(time_s)-1
        voltage_V(n+1) = voltage_V(n) + dt_s*(-voltage_V(n)/(rc_R_ohm*rc_C_F));
    end
    rc_final_error_V(k) = abs(voltage_V(end)-rc_V0_V*exp(-rc_final_time_s/(rc_R_ohm*rc_C_F)));
end
rc_timestep_table = table(rc_dt_choices_s',rc_final_error_V','VariableNames',{'Timestep_s','FinalVoltageAbsoluteError_V'})
assert(all(diff(rc_final_error_V) < 0))
%[text] **Required evidence:** the table, the numerical resolution identified as `dt`, and a conclusion about the error trend. **Defence hook:** distinguish a numerical timestep from the physical resistance or capacitance.
%%
%[text] ## Optional Working Exposure: Read a Supplied ode45 Reference
%[text] This optional section is not needed for the Core route. Read the supplied `ode45` call as MATLAB's adaptive ODE reference and inspect its final value alongside the exact result. Do not derive, edit, or independently reproduce the method.
[rc_ode45_time_s,rc_ode45_voltage_V] = ode45(@(~,voltage_V) -voltage_V/(rc_R_ohm*rc_C_F),[0 rc_final_time_s],rc_V0_V);
rc_ode45_final_table = table(rc_ode45_voltage_V(end),rc_voltage_exact_V(end),'VariableNames',{'Ode45FinalVoltage_V','ExactFinalVoltage_V'})
%[text] **Working exposure evidence:** state what the two final values represent. This optional section can be deleted without affecting the Core practical.
%%
%[text] ## Question 5: Diagnose a Sign Defect
%[text] The supplied loop below is runnable but has a sign defect. It makes the capacitor voltage grow during a passive discharge. Run it, identify the exact incorrect sign, write the corrected Euler expression in your evidence, and use the model trend to explain why the output is unphysical.
rc_voltage_sign_defect_V = zeros(size(rc_time_s));
rc_voltage_sign_defect_V(1) = rc_V0_V;
for n = 1:numel(rc_time_s)-1
    rc_voltage_sign_defect_V(n+1) = rc_voltage_sign_defect_V(n) + rc_dt_s*(rc_voltage_sign_defect_V(n)/(rc_R_ohm*rc_C_F));
end
assert(rc_voltage_sign_defect_V(end) > rc_V0_V)
rc_defect_correction = "REPLACE_WITH_CORRECTED_EULER_EXPRESSION";
%[text] **Required evidence:** faulty line, corrected line, direction of the faulty curve, and physical explanation. **Defence hook:** state one quick graph or bound check that would reveal this defect before comparing an exact solution.
%%
%[text] ## Question 6: Model a Falling Object With Linear Drag
%[text] **Context B - falling velocity.** Take downward velocity as positive. A `0.50 kg` object starts from rest and obeys $dv/dt=g-(c/m)v$ with `g=9.81 m/s^2` and `c=0.25 kg/s` over `0 <= t <= 8 s`. In words: gravity increases downward velocity while drag reduces the acceleration as speed rises. Predict the unit of `dv/dt`, the initial acceleration, and the long-time velocity trend.
fall_mass_kg = 0.50;
fall_drag_kg_per_s = 0.25;
fall_g_m_per_s2 = 9.81;
fall_v0_m_per_s = 0;
fall_final_time_s = 8;
fall_dt_s = 0.5;
fall_terminal_velocity_m_per_s = fall_mass_kg*fall_g_m_per_s2/fall_drag_kg_per_s;
fall_prediction = "REPLACE_WITH_ACCELERATION_UNIT_AND_TERMINAL_TREND";
%[text] **Required evidence:** sign convention, variables and units, initial acceleration, terminal-velocity prediction. **Defence hook:** explain why `c/m` has unit `1/s`.
%%
%[text] ## Question 7: Modify One Parameter, Then Run, Refine, and Validate
%[text] This supplied Euler scaffold uses the velocity at each time point to calculate its next value. It then compares three timestep choices with the supplied exact reference $v(t)=v\\_T[1-\\exp(-(c/m)t)]$. First run the default baseline. Then make the bounded code modification: change only `fall_drag_kg_per_s` in Question 6 from `0.25` to `0.50`, run from Question 6 through this question again, and record how the terminal velocity and final-time error change. Inspect whether the velocity remains below the terminal velocity and whether smaller `dt` reduces the final-time error.
fall_dt_choices_s = [0.5 0.25 0.125];
fall_final_error_m_per_s = zeros(size(fall_dt_choices_s));
for k = 1:numel(fall_dt_choices_s)
    dt_s = fall_dt_choices_s(k);
    time_s = 0:dt_s:fall_final_time_s;
    velocity_m_per_s = zeros(size(time_s));
    velocity_m_per_s(1) = fall_v0_m_per_s;
    for n = 1:numel(time_s)-1
        acceleration_m_per_s2 = fall_g_m_per_s2-(fall_drag_kg_per_s/fall_mass_kg)*velocity_m_per_s(n);
        velocity_m_per_s(n+1) = velocity_m_per_s(n) + dt_s*acceleration_m_per_s2;
    end
    velocity_exact_m_per_s = fall_terminal_velocity_m_per_s*(1-exp(-(fall_drag_kg_per_s/fall_mass_kg)*time_s));
    fall_final_error_m_per_s(k) = abs(velocity_m_per_s(end)-velocity_exact_m_per_s(end));
end
fall_timestep_table = table(fall_dt_choices_s',fall_final_error_m_per_s','VariableNames',{'Timestep_s','FinalVelocityAbsoluteError_m_per_s'})
nexttile
plot(time_s,velocity_m_per_s,"o-",time_s,velocity_exact_m_per_s,"-","LineWidth",1.5)
xlabel("Time (s)")
ylabel("Downward velocity (m/s)")
title("Falling object with linear drag: Euler and exact reference")
legend("Euler, dt = 0.125 s","Exact reference","Location","southeast")
grid on
assert(all(diff(fall_final_error_m_per_s) < 0))
assert(all(velocity_m_per_s >= 0 & velocity_m_per_s <= fall_terminal_velocity_m_per_s))
fall_validation_statement = "REPLACE_WITH_BOUND_AND_REFERENCE_JUDGEMENT";
%[text] **Required evidence:** timestep table, final-value error with unit, terminal-velocity bound check, and one trajectory interpretation. **Defence hook:** trace how gravity and drag each appear in the Euler update.
%%
%[text] ## Question 8: Build a Radioactive-Decay Euler Trajectory
%[text] **Context C - radioactive decay.** A sample has `N0=800` undecayed nuclei at `t=0`. Use $dN/dt=-lambda N$ with half-life `T_half=4 s`, so `lambda=log(2)/T_half`, over `0 <= t <= 16 s`. Treat `N` as the expected number of nuclei in this deterministic model. Predict the sign and unit of `dN/dt`, and whether the count can become negative here.
decay_N0 = 800;
decay_half_life_s = 4;
decay_lambda_per_s = log(2)/decay_half_life_s;
decay_final_time_s = 16;
decay_dt_s = 0.5;
decay_prediction = "REPLACE_WITH_DERIVATIVE_SIGN_UNIT_AND_BOUND";
%[text] **Required evidence:** model, half-life conversion, `lambda` unit, prediction. **Defence hook:** explain why the model has the same mathematical form as RC discharge even though the state variable and physical meaning differ.
%%
%[text] ## Question 9: Validate Half-Life and Reference Behaviour
%[text] Run the supplied Euler loop, compare it with $N(t)=N\\_0\\exp(-lambda t)$, and inspect the exact reference at one half-life. The validation uses both the initial value and the known half-life reference `N(4 s)=400` nuclei. Add a labelled plot or compact table to your group evidence.
decay_time_s = 0:decay_dt_s:decay_final_time_s;
decay_euler_N = zeros(size(decay_time_s));
decay_euler_N(1) = decay_N0;
for n = 1:numel(decay_time_s)-1
    decay_euler_N(n+1) = decay_euler_N(n) + decay_dt_s*(-decay_lambda_per_s*decay_euler_N(n));
end
decay_exact_N = decay_N0*exp(-decay_lambda_per_s*decay_time_s);
decay_half_life_exact_N = decay_N0*exp(-decay_lambda_per_s*decay_half_life_s);
decay_max_error_N = max(abs(decay_euler_N-decay_exact_N));
nexttile
plot(decay_time_s,decay_euler_N,"o-",decay_time_s,decay_exact_N,"-","LineWidth",1.5)
xlabel("Time (s)")
ylabel("Expected undecayed nuclei")
title("Radioactive decay: Euler and supplied exact reference")
legend("Euler, dt = 0.5 s","Exact reference","Location","northeast")
grid on
assert(decay_euler_N(1) == decay_N0)
assert(abs(decay_half_life_exact_N-decay_N0/2) < 1e-10)
assert(all(decay_euler_N > 0))
decay_max_error_N
decay_validation_statement = "REPLACE_WITH_HALF_LIFE_AND_ERROR_EVIDENCE";
%[text] **Required evidence:** initial-value check, half-life reference, maximum error, labelled output, and physical interpretation. **Defence hook:** explain why a deterministic expected count may be non-integer even though individual nuclei are discrete.
%%
%[text] ## Question 10: Compare Contexts, Record AI Decisions, and Check Capstone Progress
%[text] Compare the three contexts in the supplied table: state variable, derivative unit, Euler update, reference check, and model limitation. Complete only the `REPLACE` model-limitation entry for one context. Then record your AI decision: tool used, request, what was accepted/modified/rejected, and independent checks performed. Confirm a fresh-session run. Finally complete the compact Week 8 capstone process checkpoint: current problem-space choice, one planned output, one validation next action, and each member's current role. This is progress evidence for the practical packet, not a new graded milestone.
context_comparison = table(["RC discharge";"Falling with linear drag";"Radioactive decay"], ...
    ["V";"v";"N"],["V/s";"m/s^2";"nuclei/s"], ...
    ["V(n+1)=V(n)+dt[-V(n)/(RC)]";"v(n+1)=v(n)+dt[g-(c/m)v(n)]";"N(n+1)=N(n)+dt[-lambda*N(n)]"], ...
    ["Exact exponential";"Exact terminal-velocity curve";"Half-life and exact exponential"], ...
    ["REPLACE_WITH_ONE_RC_LIMITATION";"REPLACE_WITH_ONE_FALLING_LIMITATION";"REPLACE_WITH_ONE_DECAY_LIMITATION"], ...
    'VariableNames',{'Context','StateVariable','DerivativeUnit','EulerUpdate','ReferenceCheck','ModelLimitation'})
ai_tool_used = "REPLACE_WITH_TOOL_OR_NO_AI_USED";
ai_request = "REPLACE_WITH_CONCISE_REQUEST";
ai_decision = "REPLACE_WITH_ACCEPTED_MODIFIED_OR_REJECTED_DECISION";
independent_checks = "REPLACE_WITH_UNITS_REFERENCE_AND_INTERPRETATION_CHECKS";
fresh_session_confirmation = "REPLACE_WITH_MATLAB_RELEASE_AND_TOP_TO_BOTTOM_RUN_CONFIRMATION";
capstone_problem_space = "REPLACE_WITH_CURRENT_PROBLEM_SPACE";
capstone_planned_output = "REPLACE_WITH_ONE_PRINCIPAL_OUTPUT";
capstone_validation_next_action = "REPLACE_WITH_NEXT_VALIDATION_ACTION";
capstone_member_roles = "REPLACE_WITH_MODEL_CODE_VALIDATION_ROLE_ALLOCATION";
%[text] **Required evidence:** context comparison, concise AI decision record, fresh-session confirmation, and the Week 8 capstone process checkpoint. **Defence hook:** explain why a correct-looking graph without units, a reference check, and a physical interpretation is incomplete evidence.
%%
%[text] ## Submission and Individual Defence
%[text] Submit one completed group file through the Week 8 Google Classroom practical assignment only after running it from the top in a fresh MATLAB session. After all group submissions are locked, the instructor uses a random draw to select one challenge slot and one group member; a distinct parameter or defect variant is used whenever a slot is reused. The selected member explains the model, traces the code/output, and answers a validation or parameter-change follow-up. Every member completes one recorded defence before any second selection. An absence remains pending until a recorded make-up defence is completed.
%[text] Do not submit complete AI chat histories. Submit the concise AI decision record and independent checks only.
%%
%[text] ## Reproducibility Record
%[text] This practical requires MATLAB R2025a or later and base MATLAB only. Run it top to bottom in a fresh session before adding group evidence and again before submission. The supplied parameters, units, timestep choices, exact references, and assertions make the baseline reproducible.

%[appendix]{"version":"1.0"}
