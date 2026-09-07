%[text] # Week 12 Practical Activity: Integrated Method Selection and Capstone Studio
%[text] **PRACTICAL ACTIVITY**
%[text] PHY4605 Physics-First Reproducible MATLAB Notebook
%%
%[text] ## Group Setup and Studio Contract
%[text] Work in your assigned group of two or three. This Week 12 studio is a formative capstone completion and defence rehearsal checkpoint. It does not create an extra graded practical portfolio component or an extra graded defence entry. The existing course assessment architecture remains the source of marks for the capstone and practical portfolio.
%[text] Generative AI may help formulate, write, debug, or improve code. Record only material decisions: what was requested, what was accepted, modified, or rejected, why, and which independent checks were performed. Do not submit a complete AI chat transcript.
%[text] Complete the ten progressive challenges in order. Keep each edit bounded to one prediction, one method label, one expression, one parameter, one output, one validation choice, or one evidence statement. Run the final file from the top in a fresh MATLAB session before locking the group evidence.
group_id = "REPLACE_WITH_GROUP_ID";
group_members = "REPLACE_WITH_NAMES";
matlab_release = version("-release");
studio_status = "FORMATIVE_WEEK12_CAPSTONE_COMPLETION_AND_DEFENCE_REHEARSAL";
%%
%[text] ## Method Recognition
%[text] ### Challenge 1: Map the Supplied Contexts
%[text] The three contexts below keep the computational demand on methods already learned. Read the physical question first. Before revealing the table output, predict a method for each case from this supplied menu: parameter sweep, Euler ODE, numerical integration. The complete table provides feedback for your initial prediction.
context_name = ["A. Projectile range";"B. RC capacitor charging";"C. Radioactive decay"];
problem_signal = ["range changes when launch angle changes";"voltage changes with the present voltage gap";"expected count changes with the present count"];
method_name = ["Parameter sweep";"Forward Euler ODE";"Forward Euler ODE"];
required_input = ["speed, angle, gravity";"supply voltage, resistance, capacitance, timestep";"initial count, half-life, timestep"];
principal_output = ["range versus angle";"voltage versus time";"count versus time"];
key_limitation = ["level landing and no air drag";"constant circuit parameters and finite timestep";"deterministic expected-count model and finite timestep"];
context_cards = table(context_name,problem_signal,method_name,required_input,principal_output,key_limitation)
%[text] ### Challenge 2: State One Context Clearly
%[text] Select one of the three supplied rehearsal contexts. State its required input, principal output, and one key limitation in your own words. This rehearsal choice does not replace your already approved capstone problem or starter.
selected_context = "REPLACE_WITH_CONTEXT_A_B_OR_C";
selected_input = "REPLACE_WITH_REQUIRED_INPUTS_AND_UNITS";
selected_output = "REPLACE_WITH_PRINCIPAL_OUTPUT_AND_UNITS";
selected_limitation = "REPLACE_WITH_ONE_KEY_LIMITATION";
selected_context_record = table(selected_context,selected_input,selected_output,selected_limitation, ...
    'VariableNames',{'Context','RequiredInput','PrincipalOutput','KeyLimitation'})
%[text] **Required evidence:** one context, its variables and units, its output, and one limitation. **Defence hook:** explain why the limitation belongs to the physical model or numerical representation.
%%
%[text] ## Algorithm and Code Audit
%[text] ### Challenge 3: Trace the Supplied Algorithm
%[text] Before touching MATLAB, read the common computational recipe. It maps directly to the capstone starter Live Script: identify the model; set values and units; make the discretisation or input array; apply the supplied method; store the principal output; select the required and chosen checks; and interpret the result. Record one line that you can trace from this recipe to code.
algorithm_step_number = (1:7)';
algorithm_step = ["identify model, assumptions, and units";"set supplied parameters and one approved modification";"make the time, position, or input array";"apply the supplied method at each required point";"store one principal graph or table";"run the required check and the chosen check";"interpret the result and state one limitation"];
algorithm_table = table(algorithm_step_number,algorithm_step, ...
    'VariableNames',{'Step','PlainLanguageAction'})
algorithm_trace_record = "REPLACE_WITH_ONE_CODE_LINE_AND_THE_STEP_IT_COMPLETES";
algorithm_defect_to_watch = "REPLACE_WITH_MODEL_UNIT_ARRAY_OR_ALGORITHM_DEFECT_TO_AUDIT";
%[text] **Required evidence:** a short trace from one algorithm step to one supplied code line, plus one defect category to inspect. **Defence hook:** identify what output would reveal the defect before an exact reference comparison.
%%
%[text] ## Challenge 4: Trace and Modify a Projectile Sweep
%[text] **Context A.** For level landing without air drag, the supplied model is $R=v\_0^2\\sin(2\\theta)/g$. The speed is in m/s, the angle is in degrees, gravity is in m/s$^2$, and the range is in m. The code evaluates a supplied angle array, then changes only the launch speed as a controlled modification.
projectile_speed_mps = 18;
%[text] TODO: predict the effect, then change the variant speed from 20 to 22 m/s and rerun this section. Keep all other inputs fixed and record your physical explanation. The supplied 20 m/s baseline runs before you make the edit.
projectile_speed_variant_mps = 20;
projectile_gravity_mps2 = 9.81;
projectile_angle_deg = [20 35 45 55 70];
projectile_range_m = projectile_speed_mps^2*sind(2*projectile_angle_deg)/projectile_gravity_mps2;
projectile_range_variant_m = projectile_speed_variant_mps^2*sind(2*projectile_angle_deg)/projectile_gravity_mps2;
projectile_45_index = find(projectile_angle_deg == 45,1);
projectile_45_reference_m = projectile_speed_mps^2/projectile_gravity_mps2;
projectile_45_difference_m = abs(projectile_range_m(projectile_45_index)-projectile_45_reference_m);
projectile_45_check_passed = projectile_45_difference_m < 1e-12;
assert(projectile_45_check_passed,'The 45 degree projectile reference check failed.')
projectile_table = table(projectile_angle_deg',projectile_range_m',projectile_range_variant_m', ...
    'VariableNames',{'Angle_deg','BaselineRange_m','VariantRange_m'})
%[text] The 45 degree case supplies one known-value check for the baseline. The variant changes one physical input only, so a change in range can be attributed to launch speed.
plot(projectile_angle_deg,projectile_range_m,'o-','Color',[0.12 0.28 0.46],'LineWidth',1.6)
hold on
plot(projectile_angle_deg,projectile_range_variant_m,'s--','Color',[0.85 0.48 0.16],'LineWidth',1.4)
hold off
xlabel('Launch angle, theta (degrees)')
ylabel('Horizontal range, R (m)')
title('Projectile Range: One Controlled Speed Modification')
legend('Baseline speed = 18 m/s','Modified speed','Location','northwest')
grid on
projectile_trace_record = "REPLACE_WITH_INDEX_OR_EXPRESSION_TRACE";
projectile_modification_record = "REPLACE_WITH_CHANGED_INPUT_AND_PHYSICAL_EFFECT";
%[text] **Required evidence:** one traced expression, one controlled modification, the labelled plot, and the 45 degree check. **Defence hook:** explain why the ideal model predicts the largest range near 45 degrees for this angle set.
%%
%[text] ## Challenge 5: Audit and Repair an RC Euler Script
%[text] **Context B.** A capacitor charges toward a fixed supply according to $dV/dt=(V\_s-V)/(RC)$. Use $V\_s$ in volts, $R$ in ohms, $C$ in farads, time in seconds, and the derivative in volts per second. The isolated wrong-sign run below is supplied for diagnosis; the corrected run is the evidence path.
rc_supply_V = 5;
rc_initial_V = 0;
rc_resistance_ohm = 2000;
rc_capacitance_F = 0.001;
rc_tau_s = rc_resistance_ohm*rc_capacitance_F;
rc_final_time_s = 8;
rc_dt_s = 0.25;
rc_time_s = 0:rc_dt_s:rc_final_time_s;
rc_wrong_voltage_V = zeros(size(rc_time_s));
rc_wrong_voltage_V(1) = rc_initial_V;
for n = 1:numel(rc_time_s)-1
    rc_wrong_rate_V_per_s = -(rc_supply_V-rc_wrong_voltage_V(n))/rc_tau_s;
    rc_wrong_voltage_V(n+1) = rc_wrong_voltage_V(n)+rc_dt_s*rc_wrong_rate_V_per_s;
end
rc_wrong_endpoint_V = rc_wrong_voltage_V(end);
rc_sign_defect_flagged = rc_wrong_endpoint_V < rc_initial_V;
rc_voltage_euler_V = zeros(size(rc_time_s));
rc_voltage_euler_V(1) = rc_initial_V;
for n = 1:numel(rc_time_s)-1
    rc_rate_V_per_s = (rc_supply_V-rc_voltage_euler_V(n))/rc_tau_s;
    rc_voltage_euler_V(n+1) = rc_voltage_euler_V(n)+rc_dt_s*rc_rate_V_per_s;
end
rc_voltage_exact_V = rc_supply_V*(1-exp(-rc_time_s/rc_tau_s));
rc_endpoint_error_V = abs(rc_voltage_euler_V(end)-rc_voltage_exact_V(end));
rc_initial_condition_check_passed = rc_voltage_euler_V(1) == rc_initial_V;
assert(rc_sign_defect_flagged && rc_initial_condition_check_passed,'The RC audit checks did not pass.')
rc_audit_table = table(rc_wrong_endpoint_V,rc_voltage_euler_V(end),rc_voltage_exact_V(end),rc_endpoint_error_V, ...
    'VariableNames',{'WrongSignEndpoint_V','CorrectEulerEndpoint_V','ExactEndpoint_V','AbsoluteError_V'})
%[text] The minus sign in the defective rate drives a capacitor away from its supply. The correction keeps the rate proportional to the remaining supply-to-capacitor gap and preserves the initial condition.
plot(rc_time_s,rc_voltage_euler_V,'o-','Color',[0.12 0.28 0.46],'LineWidth',1.5)
hold on
plot(rc_time_s,rc_voltage_exact_V,'-','Color',[0.25 0.45 0.34],'LineWidth',1.8)
yline(rc_supply_V,'--','Supply voltage','Color',[0.45 0.45 0.45])
hold off
xlabel('Time, t (s)')
ylabel('Capacitor voltage, V (V)')
title('RC Charging: Audited Euler Update and Exact Reference')
legend('Correct Euler','Exact reference','Location','southeast')
grid on
rc_defect_record = "REPLACE_WITH_FAULTY_SIGN_AND_PHYSICAL_REASON";
rc_correction_record = "REPLACE_WITH_CORRECTED_EULER_UPDATE";
%[text] **Required evidence:** the faulty expression, its corrected expression, one output that exposes the defect, and one physical explanation. **Defence hook:** trace why the present voltage appears in the rate rather than only the initial voltage.
%%
%[text] ## Challenge 6: Trace Decay and Check a Reference
%[text] **Context C.** A radioactive sample has expected count $N$ satisfying $dN/dt=-\\lambda N$, with half-life $T\_\\mathrm{half}=6$ h. Therefore $\\lambda=\\ln(2)/T\_\\mathrm{half}$ has unit 1/h. Use a supplied Euler loop and compare the value at one half-life with the exact half-life reference.
decay_N0 = 1000;
decay_half_life_h = 6;
decay_lambda_per_h = log(2)/decay_half_life_h;
decay_final_time_h = 24;
decay_dt_h = 0.5;
decay_time_h = 0:decay_dt_h:decay_final_time_h;
decay_N_euler = zeros(size(decay_time_h));
decay_N_euler(1) = decay_N0;
for n = 1:numel(decay_time_h)-1
    decay_rate_per_h = -decay_lambda_per_h*decay_N_euler(n);
    decay_N_euler(n+1) = decay_N_euler(n)+decay_dt_h*decay_rate_per_h;
end
decay_N_exact = decay_N0*exp(-decay_lambda_per_h*decay_time_h);
decay_half_index = find(abs(decay_time_h-decay_half_life_h) < eps,1);
decay_half_ratio = decay_N_euler(decay_half_index)/decay_N0;
decay_half_life_tolerance_fraction = 0.03;
decay_half_life_error_fraction = abs(decay_half_ratio-0.5);
decay_half_life_check_passed = decay_half_life_error_fraction < decay_half_life_tolerance_fraction;
assert(decay_half_life_check_passed,'The supplied decay half-life check failed.')
decay_table = table(decay_time_h(1:2:end)',decay_N_euler(1:2:end)',decay_N_exact(1:2:end)', ...
    'VariableNames',{'Time_h','EulerExpectedCount','ExactExpectedCount'})
decay_nonnegative_check = all(decay_N_euler >= 0);
decay_evidence_record = "REPLACE_WITH_HALF_LIFE_TRACE_AND_PHYSICAL_INTERPRETATION";
%[text] The named tolerance is a teaching tolerance for the supplied 0.5 h timestep; it is not a claim about measurement uncertainty. The half-life reference checks whether the sign, rate constant, units, and loop update are coherent.
%[text] **Required evidence:** the traced update, the value at 6 h, the reference comparison, and one statement about expected count versus an individual random count. **Defence hook:** explain why a smaller timestep would usually move the Euler result closer to the exact reference.
%%
%[text] ## Evidence Comparison
%[text] ### Challenge 7: Interpret the Reference Check
%[text] For the RC context, compare the Euler endpoint with the supplied exact expression. Name which value is approximate, report its absolute error in volts, and state what this endpoint check cannot establish. No additional solver is required.
rc_exact_endpoint_V = rc_voltage_exact_V(end);
comparison_path = ["Forward Euler, dt = 0.25 s";"Exact supplied expression"];
comparison_endpoint_V = [rc_voltage_euler_V(end);rc_exact_endpoint_V];
comparison_error_V = abs(comparison_endpoint_V-rc_exact_endpoint_V);
method_comparison_table = table(comparison_path,comparison_endpoint_V,comparison_error_V, ...
    'VariableNames',{'EvidencePath','Endpoint_V','AbsoluteDifferenceFromExact_V'})
method_comparison_statement = "REPLACE_WITH_WHICH_PATH_IS_REFERENCE_AND_WHICH_IS_APPROXIMATE";
%[text] **Required evidence:** identify the supplied reference path, the approximate path, and one limitation of comparing only final endpoints. **Defence hook:** explain why agreement at one endpoint does not prove that every intermediate value is correct.
%[text] ### Challenge 8: Choose Two Capstone Checks
%[text] The capstone assessment requires two checks: one **required check** agreed with the lecturer and one **chosen check** selected by the group. Both checks must be reported with evidence in the final capstone package. The studio rehearsal is formative, but it must exercise the same two-check habit.
validation_check_name = ["Known or exact reference";"Initial condition";"Expected sign or bound";"Refinement or convergence";"Conservation or balance";"Independent calculation"];
validation_check_purpose = ["compare the main result with supplied evidence";"confirm the state starts at the stated value";"test a physical direction or allowable range";"compare two numerical resolutions";"test a quantity that should balance";"repeat one result by a different calculation"];
validation_menu = table(validation_check_name,validation_check_purpose)
capstone_required_check = "REPLACE_WITH_LECTURER_AGREED_REQUIRED_CHECK";
capstone_chosen_check = "REPLACE_WITH_GROUP_CHOSEN_SECOND_CHECK";
capstone_check_evidence = ["REPLACE_WITH_REQUIRED_CHECK_RESULT_AND_LOCATION";"REPLACE_WITH_CHOSEN_CHECK_RESULT_AND_LOCATION"];
capstone_check_record = table(["Required";"Chosen"],[capstone_required_check;capstone_chosen_check],capstone_check_evidence, ...
    'VariableNames',{'CheckRole','CheckName','Evidence'})
%[text] **Required evidence:** name both checks, state what each tests, and point to the graph, table, residual, or calculation that supports each result. A second check is required for the capstone even though the lecture cooling example developed one Core reference check.
%%
%[text] ## Capstone Studio Evidence
%[text] ### Challenge 9: Complete the Bounded Investigation Record
%[text] Fill the record from the approved starter Live Script and your Week 06–11 process evidence. Keep the scope bounded: one supplied problem space, one model modification, one principal output, the two checks above, one interpretation, and one limitation.
capstone_problem_space = "REPLACE_WITH_APPROVED_CONTEXT";
capstone_model_statement = "REPLACE_WITH_MODEL_EQUATION_AND_ASSUMPTIONS";
capstone_variables_and_units = "REPLACE_WITH_VARIABLES_AND_UNITS";
capstone_pseudocode_record = "REPLACE_WITH_COMPLETED_OR_REFINED_PSEUDOCODE";
capstone_modification = "REPLACE_WITH_ONE_CHANGED_PARAMETER_OR_ASSUMPTION";
capstone_principal_output = "REPLACE_WITH_ONE_GRAPH_OR_TABLE_AND_UNITS";
capstone_required_check_result = "REPLACE_WITH_REQUIRED_CHECK_RESULT";
capstone_chosen_check_result = "REPLACE_WITH_CHOSEN_CHECK_RESULT";
capstone_interpretation = "REPLACE_WITH_PHYSICAL_MEANING_OF_PRINCIPAL_RESULT";
capstone_limitation = "REPLACE_WITH_ONE_MODEL_OR_NUMERICAL_LIMITATION";
capstone_evidence_item = ["Problem space";"Model and assumptions";"Variables and units";"Pseudocode";"One modification";"Principal output";"Required check";"Chosen check";"Interpretation";"Limitation"];
capstone_evidence_entry = [capstone_problem_space;capstone_model_statement;capstone_variables_and_units;capstone_pseudocode_record;capstone_modification;capstone_principal_output;capstone_required_check_result;capstone_chosen_check_result;capstone_interpretation;capstone_limitation];
capstone_evidence_table = table(capstone_evidence_item,capstone_evidence_entry, ...
    'VariableNames',{'EvidenceItem','GroupEntry'})
%[text] **Required evidence:** complete all ten rows from the approved starter file and attach the principal graph or table plus both check results to the existing capstone evidence packet. This Week 12 record is a formative studio checkpoint, not a new graded portfolio packet.
%[text] ### Challenge 10: Record AI Decisions and Rehearse the Defence
%[text] Record decisions rather than a full transcript. State what the group asked for, what was accepted, modified, or rejected, why, and which checks were run independently from a fresh MATLAB session.
ai_tool_used = "REPLACE_WITH_TOOL_OR_NO_AI_USED";
ai_request = "REPLACE_WITH_CONCISE_REQUEST";
ai_decision = "REPLACE_WITH_ACCEPTED_MODIFIED_REJECTED_DECISION_AND_REASON";
independent_checks = "REPLACE_WITH_UNITS_REFERENCE_OR_LIMITING_CASE_AND_PHYSICAL_CHECKS";
fresh_session_confirmation = "REPLACE_WITH_RELEASE_AND_TOP_TO_BOTTOM_RUN_CONFIRMATION";
%[text] For a two-person group, mark the third row not applicable. Record an absence as pending and arrange make-up rehearsal; do not record it as completed.
defence_member = ["Member 1";"Member 2";"Member 3 or not applicable"];
defence_focus = ["REPLACE_WITH_MEMBER_1_TRACE_AND_FOLLOW_UP";"REPLACE_WITH_MEMBER_2_TRACE_AND_FOLLOW_UP";"REPLACE_WITH_MEMBER_3_TRACE_AND_FOLLOW_UP"];
defence_rehearsal_table = table(defence_member,defence_focus, ...
    'VariableNames',{'Member','RehearsalFocus'})
%[text] Use the existing rotation history for a random rehearsal slot and member after the group evidence is locked. Every group member rehearses one individual code trace and physics or validation explanation before any member is rehearsed again. This rehearsal does not create a Week 12 graded defence entry; an official graded defence follows the course assessment schedule.
rotation_contract = "REPLACE_WITH_EXISTING_ROTATION_HISTORY_REFERENCE_AND_ALL_MEMBERS_REHEARSED";
submission_state = "DRAFT_NOT_YET_LOCKED";
%[text] Replace the draft state with LOCKED only after every entry and both capstone checks are complete, the final work has been rerun, and the group has saved its evidence. Draw the rehearsal slot and member only after this lock.
%%
%[text] ## Reproducibility and Formative Handoff
%[text] Run this practical from top to bottom in a fresh MATLAB R2025a-or-later session using base MATLAB. The supplied baseline values, equations, arrays, loops, exact references, and assertions must run before group entries are added or changed. After adding evidence, rerun the complete file and record the release and result.
%[text] The final Week 13 capstone package remains the assessed handoff. It contains the approved model, supplied or refined pseudocode, one modification, one principal output, one required check, one chosen check, physical interpretation, one limitation, reproducibility record, concise AI decision record, and individual defence evidence. Week 12 provides rehearsal and completion support within that existing architecture.
reproducibility_item = ["MATLAB release";"Toolbox requirement";"Run order";"Random seed";"Locked code baseline"];
reproducibility_entry = [matlab_release;"Base MATLAB";"Top to bottom in a fresh session";"Not applicable";"Supplied contexts and baseline calculations above"];
reproducibility_table = table(reproducibility_item,reproducibility_entry, ...
    'VariableNames',{'Item','RecordedValue'})

%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"inline"}
%---
