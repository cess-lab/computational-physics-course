%[text] # Computational Investigation: Present, defend, and hand off a validated physical model
%[text] **CAPSTONE STARTER / VALIDATION SCAFFOLD**
%[text] PHY4605 Physics-First Reproducible MATLAB Notebook
%%
%[text] ## Physical Question and Capstone Contract
%[text] This starter file supports the final bounded investigation. Work in an assigned group of two or three using the problem space and starter model approved for your group. The core route is one physical question, one controlled parameter or assumption change, one principal graph or table, one required validation check, one genuinely different chosen check, one physical interpretation, and one limitation.
%[text] Generative AI is allowed when declared. Record only material decisions: what was requested, what was accepted, modified, or rejected, why, and which independent checks were performed. Do not submit a full chat history. Google Classroom remains the official submission record; use the lecturer's posted coursework and deadline.
group_id = "REPLACE_WITH_GROUP_ID";
group_members = ["REPLACE_WITH_MEMBER_1";"REPLACE_WITH_MEMBER_2";"REPLACE_WITH_MEMBER_3_OR_NOT_APPLICABLE"];
matlab_release = version("-release");
selected_problem_space = "projectile_range";
%%
%[text] ## Prediction Before Computing
%[text] State the physical effect you expect before running the modified case. Name the quantity that changes, the direction or shape you predict, and the input that remains fixed. The supplied default track runs so that the file is executable from a fresh session; replace the record with your group's prediction before locking evidence.
prediction_record = "REPLACE_WITH_PREDICTED_DIRECTION_SIGN_BOUND_OR_LIMITING_BEHAVIOUR";
%%
%[text] ## Working Exposure: Runnable Base-Method Examples
%[text] The current Capstone Briefing deck and `Assessments/Student-facing/Capstone_Investigation_Brief.md` define the twelve assigned briefs in six families. The five runnable rows below are base-method examples for demonstrating the evidence order; they are not the assignment catalogue. Use the lecturer-approved starter and brief title for your assigned investigation. The equations are supplied reminders, not new derivations.
problem_space = ["projectile_range";"rc_charging";"radioactive_decay";"cooling";"decaying_force_impulse"];
method = ["parameter sweep";"Forward Euler ODE";"Forward Euler ODE";"Forward Euler ODE";"trapezoidal integration"];
principal_output = ["range versus launch angle";"voltage versus time";"expected count versus time";"temperature versus time";"force and accumulated impulse"];
required_validation = ["45 degree reference and symmetry";"Euler endpoint versus exact reference";"value at one half-life versus exact reference";"Euler endpoint versus exact reference";"trapezoidal integral versus exact reference"];
problem_space_catalogue = table(problem_space,method,principal_output,required_validation)
%%
%[text] ## Selected Starter Model and Controlled Modification
%[text] Each track below declares parameters with units, evaluates a baseline, changes one physical input, and produces one principal output. Keep every other input fixed. If your approved model differs, preserve this order in the edited starter: inputs and units, prediction, model or update, output, required check, chosen check, interpretation, and limitation.
required_check_name = "";
required_check_result = "";
required_check_passed = false;
chosen_check_name = "";
chosen_check_result = "";
chosen_check_passed = false;
principal_output_table = table;
switch selected_problem_space
    case "projectile_range"
        %[text] **Projectile range.** For level landing without air drag, R = v0^2 sin(2 theta)/g. The supplied modification changes launch speed from 18 m/s to 20 m/s; angles and gravity remain fixed.
        v0_mps = 18;
        v0_variant_mps = 20;
        g_mps2 = 9.81;
        angle_deg = 0:5:90;
        range_m = v0_mps^2*sind(2*angle_deg)/g_mps2;
        range_variant_m = v0_variant_mps^2*sind(2*angle_deg)/g_mps2;
        angle_45_index = find(angle_deg == 45,1);
        reference_range_45_m = v0_mps^2/g_mps2;
        reference_error_m = abs(range_m(angle_45_index)-reference_range_45_m);
        required_check_name = "45 degree known-value reference";
        required_check_result = string(sprintf("baseline error at 45 degrees = %.3g m",reference_error_m));
        required_check_passed = reference_error_m < 1e-12;
        symmetry_error_m = max(abs(range_m-fliplr(range_m)));
        chosen_check_name = "angle symmetry R(theta) = R(90 - theta)";
        chosen_check_result = string(sprintf("maximum symmetry difference = %.3g m",symmetry_error_m));
        chosen_check_passed = symmetry_error_m < 1e-12;
        principal_output_table = table(angle_deg',range_m',range_variant_m', ...
            'VariableNames',{'Angle_deg','BaselineRange_m','ModifiedRange_m'});
        plot(angle_deg,range_m,'o-','Color',[0.05 0.26 0.47],'LineWidth',1.6)
        hold on
        plot(angle_deg,range_variant_m,'s--','Color',[0.85 0.48 0.16],'LineWidth',1.4)
        hold off
        xlabel('Launch angle, theta (degrees)')
        ylabel('Horizontal range, R (m)')
        title('Projectile Range: One Controlled Speed Modification')
        legend('Baseline speed = 18 m/s','Modified speed = 20 m/s','Location','northwest')
        grid on
    case "rc_charging"
        %[text] **RC charging.** The model is dV/dt = (Vs - V)/(RC). The supplied modification changes resistance from 2000 ohm to 2500 ohm; supply voltage, capacitance, initial voltage, timestep, and final time remain fixed.
        supply_V = 5;
        initial_voltage_V = 0;
        resistance_ohm = 2000;
        resistance_variant_ohm = 2500;
        capacitance_F = 0.001;
        tau_s = resistance_ohm*capacitance_F;
        tau_variant_s = resistance_variant_ohm*capacitance_F;
        final_time_s = 8;
        dt_s = 0.25;
        time_s = 0:dt_s:final_time_s;
        voltage_V = zeros(size(time_s));
        voltage_variant_V = zeros(size(time_s));
        voltage_V(1) = initial_voltage_V;
        voltage_variant_V(1) = initial_voltage_V;
        for n = 1:numel(time_s)-1
            rate_V_per_s = (supply_V-voltage_V(n))/tau_s;
            rate_variant_V_per_s = (supply_V-voltage_variant_V(n))/tau_variant_s;
            voltage_V(n+1) = voltage_V(n)+dt_s*rate_V_per_s;
            voltage_variant_V(n+1) = voltage_variant_V(n)+dt_s*rate_variant_V_per_s;
        end
        voltage_exact_V = supply_V*(1-exp(-time_s/tau_s));
        endpoint_error_V = abs(voltage_V(end)-voltage_exact_V(end));
        required_check_name = "Euler endpoint versus exact RC reference";
        required_check_result = string(sprintf("endpoint error = %.4f V",endpoint_error_V));
        required_check_passed = endpoint_error_V < 0.15;
        chosen_bound_passed = all(voltage_V >= initial_voltage_V-1e-12 & voltage_V <= supply_V+1e-12);
        chosen_check_name = "baseline voltage stays between initial and supply values";
        chosen_check_result = string(sprintf("bound check passed = %d",chosen_bound_passed));
        chosen_check_passed = chosen_bound_passed;
        principal_output_table = table(time_s',voltage_V',voltage_variant_V',voltage_exact_V', ...
            'VariableNames',{'Time_s','BaselineEuler_V','ModifiedEuler_V','ExactBaseline_V'});
        plot(time_s,voltage_V,'o-','Color',[0.05 0.26 0.47],'LineWidth',1.5)
        hold on
        plot(time_s,voltage_variant_V,'s--','Color',[0.85 0.48 0.16],'LineWidth',1.4)
        plot(time_s,voltage_exact_V,'-','Color',[0.25 0.45 0.34],'LineWidth',1.8)
        yline(supply_V,'--','Supply voltage','Color',[0.45 0.45 0.45])
        hold off
        xlabel('Time, t (s)')
        ylabel('Capacitor voltage, V (V)')
        title('RC Charging: Euler Output and Exact Reference')
        legend('Baseline Euler','Modified Euler','Exact baseline','Location','southeast')
        grid on
    case "radioactive_decay"
        %[text] **Radioactive decay.** The model is dN/dt = -lambda N, with lambda = ln(2)/T_half. The supplied modification changes the half-life from 6 h to 8 h; the initial count, timestep, and final time remain fixed.
        initial_count = 1000;
        half_life_h = 6;
        half_life_variant_h = 8;
        lambda_per_h = log(2)/half_life_h;
        lambda_variant_per_h = log(2)/half_life_variant_h;
        final_time_h = 24;
        dt_h = 0.5;
        time_h = 0:dt_h:final_time_h;
        count_euler = zeros(size(time_h));
        count_variant_euler = zeros(size(time_h));
        count_euler(1) = initial_count;
        count_variant_euler(1) = initial_count;
        for n = 1:numel(time_h)-1
            rate_per_h = -lambda_per_h*count_euler(n);
            rate_variant_per_h = -lambda_variant_per_h*count_variant_euler(n);
            count_euler(n+1) = count_euler(n)+dt_h*rate_per_h;
            count_variant_euler(n+1) = count_variant_euler(n)+dt_h*rate_variant_per_h;
        end
        count_exact = initial_count*exp(-lambda_per_h*time_h);
        half_life_index = find(time_h == half_life_h,1);
        half_life_error_fraction = abs(count_euler(half_life_index)/initial_count-0.5);
        required_check_name = "expected count at one half-life versus exact reference";
        required_check_result = string(sprintf("fraction error at 6 h = %.4f",half_life_error_fraction));
        required_check_passed = half_life_error_fraction < 0.03;
        chosen_nonnegative = all(count_euler >= 0);
        chosen_check_name = "expected count remains non-negative";
        chosen_check_result = string(sprintf("non-negative check passed = %d",chosen_nonnegative));
        chosen_check_passed = chosen_nonnegative;
        principal_output_table = table(time_h',count_euler',count_variant_euler',count_exact', ...
            'VariableNames',{'Time_h','BaselineEulerCount','ModifiedEulerCount','ExactBaselineCount'});
        plot(time_h,count_euler,'o-','Color',[0.05 0.26 0.47],'LineWidth',1.5)
        hold on
        plot(time_h,count_variant_euler,'s--','Color',[0.85 0.48 0.16],'LineWidth',1.4)
        plot(time_h,count_exact,'-','Color',[0.25 0.45 0.34],'LineWidth',1.8)
        hold off
        xlabel('Time, t (h)')
        ylabel('Expected count, N (counts)')
        title('Radioactive Decay: One Controlled Half-Life Modification')
        legend('Baseline Euler, T half = 6 h','Modified Euler, T half = 8 h','Exact baseline','Location','northeast')
        grid on
    case "cooling"
        %[text] **Newton cooling.** The model is dT/dt = -(T - T_env)/tau. The supplied modification changes the time constant from 100 s to 150 s; initial temperature, surroundings, timestep, and final time remain fixed.
        initial_temperature_C = 80;
        environment_temperature_C = 20;
        tau_s = 100;
        tau_variant_s = 150;
        final_time_s = 200;
        dt_s = 10;
        time_s = 0:dt_s:final_time_s;
        temperature_C = zeros(size(time_s));
        temperature_variant_C = zeros(size(time_s));
        temperature_C(1) = initial_temperature_C;
        temperature_variant_C(1) = initial_temperature_C;
        for n = 1:numel(time_s)-1
            rate_C_per_s = -(temperature_C(n)-environment_temperature_C)/tau_s;
            rate_variant_C_per_s = -(temperature_variant_C(n)-environment_temperature_C)/tau_variant_s;
            temperature_C(n+1) = temperature_C(n)+dt_s*rate_C_per_s;
            temperature_variant_C(n+1) = temperature_variant_C(n)+dt_s*rate_variant_C_per_s;
        end
        temperature_exact_C = environment_temperature_C + (initial_temperature_C-environment_temperature_C)*exp(-time_s/tau_s);
        endpoint_error_C = abs(temperature_C(end)-temperature_exact_C(end));
        required_check_name = "Euler endpoint versus exact cooling reference";
        required_check_result = string(sprintf("endpoint error = %.4f deg C",endpoint_error_C));
        required_check_passed = endpoint_error_C < 1.00;
        chosen_bound_passed = all(temperature_C >= environment_temperature_C-1e-12 & temperature_C <= initial_temperature_C+1e-12);
        chosen_check_name = "baseline temperature remains between surroundings and initial value";
        chosen_check_result = string(sprintf("bound check passed = %d",chosen_bound_passed));
        chosen_check_passed = chosen_bound_passed;
        principal_output_table = table(time_s',temperature_C',temperature_variant_C',temperature_exact_C', ...
            'VariableNames',{'Time_s','BaselineEuler_degC','ModifiedEuler_degC','ExactBaseline_degC'});
        plot(time_s,temperature_C,'o-','Color',[0.05 0.26 0.47],'LineWidth',1.5)
        hold on
        plot(time_s,temperature_variant_C,'s--','Color',[0.85 0.48 0.16],'LineWidth',1.4)
        plot(time_s,temperature_exact_C,'-','Color',[0.25 0.45 0.34],'LineWidth',1.8)
        yline(environment_temperature_C,'--','Surroundings','Color',[0.45 0.45 0.45])
        hold off
        xlabel('Time, t (s)')
        ylabel('Temperature, T (deg C)')
        title('Newton Cooling: One Controlled Time-Constant Modification')
        legend('Baseline Euler','Modified Euler','Exact baseline','Location','northeast')
        grid on
    case "decaying_force_impulse"
        %[text] **Decaying force and impulse.** The force is F(t) = F0 exp(-t/tau), and impulse is the accumulated area under the force-time curve. The supplied modification changes F0 from 10 N to 12 N; time constant, timestep, and final time remain fixed.
        force_initial_N = 10;
        force_variant_initial_N = 12;
        force_tau_s = 2;
        final_time_s = 8;
        dt_s = 0.1;
        time_s = 0:dt_s:final_time_s;
        force_N = force_initial_N*exp(-time_s/force_tau_s);
        force_variant_N = force_variant_initial_N*exp(-time_s/force_tau_s);
        impulse_Ns = trapz(time_s,force_N);
        impulse_variant_Ns = trapz(time_s,force_variant_N);
        impulse_exact_Ns = force_initial_N*force_tau_s*(1-exp(-final_time_s/force_tau_s));
        impulse_error_Ns = abs(impulse_Ns-impulse_exact_Ns);
        required_check_name = "trapezoidal impulse versus exact integral";
        required_check_result = string(sprintf("absolute impulse error = %.4f N s",impulse_error_Ns));
        required_check_passed = impulse_error_Ns < 0.01;
        chosen_bound_passed = impulse_Ns >= 0 && impulse_Ns <= force_initial_N*force_tau_s;
        chosen_check_name = "impulse is positive and below the infinite-time upper bound";
        chosen_check_result = string(sprintf("bound check passed = %d",chosen_bound_passed));
        chosen_check_passed = chosen_bound_passed;
        principal_output_table = table([force_initial_N;force_variant_initial_N], ...
            [impulse_Ns;impulse_variant_Ns],[impulse_exact_Ns;force_variant_initial_N*force_tau_s*(1-exp(-final_time_s/force_tau_s))], ...
            'VariableNames',{'InitialForce_N','TrapezoidalImpulse_Ns','ExactImpulse_Ns'});
        plot(time_s,force_N,'o-','Color',[0.05 0.26 0.47],'LineWidth',1.5)
        hold on
        plot(time_s,force_variant_N,'s--','Color',[0.85 0.48 0.16],'LineWidth',1.4)
        hold off
        xlabel('Time, t (s)')
        ylabel('Force, F (N)')
        title('Decaying Force: Principal Force-Time Output')
        legend('Baseline force, F0 = 10 N','Modified force, F0 = 12 N','Location','northeast')
        grid on
    otherwise
        error('Select one of the five supplied runnable base-method example names in this scaffold, or use the lecturer-approved starter for the assigned brief.')
end
%%
%[text] ## Validation Evidence
%[text] The required check follows the approved model and method plan. The chosen check must answer a different question or probe a different weakness; repeating the same calculation with a new label is not independent evidence. Both checks must be reported with concrete values and locations in the final evidence packet.
validation_role = ["Required";"Chosen"];
validation_name = [required_check_name;chosen_check_name];
validation_result = [required_check_result;chosen_check_result];
validation_passed = [required_check_passed;chosen_check_passed];
validation_summary = table(validation_role,validation_name,validation_result,validation_passed)
assert(required_check_passed,'The supplied required validation check failed; diagnose before locking evidence.')
assert(chosen_check_passed,'The supplied chosen validation check failed; diagnose before locking evidence.')
%%
%[text] ## Bounded Investigation Record
%[text] Complete these records using the approved group model and the output above. Each entry is evidence for the presentation and individual defence, not a request for a long report.
approved_model_and_assumptions = "REPLACE_WITH_APPROVED_MODEL_ASSUMPTIONS_AND_SCOPE";
variables_and_units = "REPLACE_WITH_VARIABLES_PARAMETERS_OUTPUTS_AND_UNITS";
pseudocode_record = "REPLACE_WITH_SHORT_ORDERED_RECIPE_FROM_INPUTS_TO_CHECKS";
controlled_modification_record = "REPLACE_WITH_ONE_CHANGED_PARAMETER_OR_ASSUMPTION_AND_WHAT_STAYED_FIXED";
principal_output_record = "REPLACE_WITH_GRAPH_OR_TABLE_LOCATION_AND_ONE_PATTERN_TO_NOTICE";
required_check_evidence_record = "REPLACE_WITH_REQUIRED_CHECK_VALUE_LOCATION_AND_LIMITATION";
chosen_check_evidence_record = "REPLACE_WITH_CHOSEN_CHECK_VALUE_LOCATION_AND_DIFFERENT_WEAKNESS";
physical_interpretation_record = "REPLACE_WITH_ANSWER_TO_THE_ORIGINAL_PHYSICAL_QUESTION";
limitation_record = "REPLACE_WITH_ONE_NUMERICAL_OR_MODEL_LIMITATION";
evidence_item = ["Approved model and assumptions";"Variables and units";"Pseudocode";"One controlled modification";"Principal output";"Required validation";"Chosen validation";"Physical interpretation";"One limitation"];
evidence_entry = [approved_model_and_assumptions;variables_and_units;pseudocode_record;controlled_modification_record;principal_output_record;required_check_evidence_record;chosen_check_evidence_record;physical_interpretation_record;limitation_record];
bounded_investigation_record = table(evidence_item,evidence_entry,'VariableNames',{'EvidenceItem','GroupEntry'})
%%
%[text] ## Individual Defence and AI Decision Record
%[text] Every member prepares one trace of a relevant code section, its physical meaning, and a response to one parameter-change or validation follow-up. After group evidence is locked, use the lecturer's rotation ledger to select a question slot and a member. The first completed defence must exist for every group member before anyone receives a second entry. An absence remains pending until a make-up defence is completed.
ai_tool_used = "REPLACE_WITH_TOOL_NAME_OR_NO_AI_USED";
ai_request = "REPLACE_WITH_CONCISE_REQUEST_FOR_ASSISTANCE";
ai_decision = "REPLACE_WITH_ACCEPTED_MODIFIED_REJECTED_DECISION_AND_REASON";
independent_checks_record = "REPLACE_WITH_UNITS_REFERENCE_LIMITING_CASE_CONVERGENCE_OR_PHYSICAL_CHECKS";
defence_rotation_record = "REPLACE_WITH_LECTURER_LEDGER_REFERENCE_MEMBER_FIRST_ROUND_STATUS_AND_MAKE_UP_IF_NEEDED";
submission_state = "DRAFT_NOT_YET_LOCKED";
ai_and_defence_record = table(["AI tool or no AI";"Request";"Decision and reason";"Independent checks";"Rotation and absence record";"Submission state"], ...
    [ai_tool_used;ai_request;ai_decision;independent_checks_record;defence_rotation_record;submission_state], ...
    'VariableNames',{'RecordItem','GroupEntry'})
%%
%[text] ## Reproducibility Handoff
%[text] Before the final submission, run this file from top to bottom in a fresh MATLAB R2025a-or-later session. Keep the edited starter, required input files, parameter values with units, numerical settings, output, both checks, AI decision record, and defence evidence together. Another student should know what to open, what order to run, and what result/checks to expect.
handoff_item = ["Starter or edited Live Script";"Required input files";"Parameters and units";"Numerical settings";"Run order and MATLAB release";"Principal output";"Required and chosen checks";"Physical conclusion and limitation";"AI decision record";"Individual defence evidence"];
handoff_entry = ["REPLACE_WITH_FILE_NAME_OR_NOT_APPLICABLE";"REPLACE_WITH_FILE_NAMES_OR_BASE_MATLAB";"REPLACE_WITH_PARAMETER_RECORD_LOCATION";"REPLACE_WITH_STEP_SIZE_GRID_OR_SOLVER_SETTING";"Top to bottom in fresh MATLAB " + matlab_release + " session";principal_output_record;required_check_evidence_record + " | " + chosen_check_evidence_record;physical_interpretation_record + " | " + limitation_record;ai_decision;defence_rotation_record];
reproducibility_handoff = table(handoff_item,handoff_entry,'VariableNames',{'HandoffItem','GroupEntry'})
assert(all(strlength(handoff_entry) > 0),'Every handoff row must have a visible entry before submission.')
%%
%[text] ## Optional Stretch
%[text] Only after the Core route is complete, a group may compare two numerical resolutions, add a second independent method, or test a less familiar parameter range. Label the extension clearly and keep it separate from the required principal output and two checks.
optional_stretch_record = "OPTIONAL_STRETCH_NOT_REQUIRED_FOR_CORE_COMPLETION";
%%
%[text] ## Exit Ticket
%[text] Complete these three sentences after the clean rerun: We changed ...; we know the result is credible because ...; the claim remains limited by ... . Keep the final output and validation evidence reproducible before changing the state to LOCKED.
exit_change = "REPLACE_WITH_ONE_SENTENCE";
exit_credibility = "REPLACE_WITH_ONE_SENTENCE_NAMING_BOTH_CHECKS";
exit_limitation = "REPLACE_WITH_ONE_SENTENCE";

%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"inline"}
%---
