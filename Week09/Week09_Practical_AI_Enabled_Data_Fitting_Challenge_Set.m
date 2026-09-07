%[text] # Week 9 Practical Activity: AI-Enabled Data Fitting Challenge Set
%[text] **PRACTICAL ACTIVITY**
%[text] PHY4605 Physics-First Reproducible MATLAB Notebook
%%
%[text] ## Group Identification and Baseline
%[text] Work in your assigned group of two or three. This practical uses three supplied data-fitting contexts that differ from the lecture resistor example: spring calibration, cart motion, and pendulum timing. Generative AI may help write, debug, or improve MATLAB code, but your group must record the material decision and independently check units, residual evidence, a reference or plausible range, and physical meaning. Do not submit a complete chat transcript.
group_id = "REPLACE_WITH_GROUP_ID";
group_members = "REPLACE_WITH_NAMES";
matlab_release = version('-release');
%%
%[text] ## Question 1: Predict a Spring Calibration
%[text] **Context A - Hooke-law spring calibration.** Extension `x` is measured in metres and applied force `F` in newtons. The proposed relationship is $F=kx+b$. Before fitting, predict the sign of the slope, the unit of the spring constant `k`, and whether a small positive increase in extension should raise or lower force.
spring_extension_m = (0.01:0.01:0.08)';
spring_force_N = [0.26 0.49 0.76 1.01 1.24 1.51 1.74 2.02]';
spring_prediction = "REPLACE_WITH_SLOPE_SIGN_K_UNIT_AND_FORCE_TREND";
%[text] **Required evidence:** proposed model, measured quantities and units, fitted-parameter unit, and prediction. **Defence hook:** explain why the slope unit is N/m rather than N.
%%
%[text] ## Question 2: Fit and Overlay the Spring Model
%[text] Plot the measured points first. Then use the supplied first-degree `polyfit` scaffold. Interpret coefficient 1 as the fitted spring constant and coefficient 2 as the force offset. Overlay the fitted line without changing the original measurements.
spring_coefficients = polyfit(spring_extension_m,spring_force_N,1);
spring_k_fit_N_per_m = spring_coefficients(1);
spring_offset_fit_N = spring_coefficients(2);
spring_force_fit_N = polyval(spring_coefficients,spring_extension_m);
plot(spring_extension_m,spring_force_N,'o',spring_extension_m,spring_force_fit_N,'-','LineWidth',1.5)
xlabel('Extension, x (m)')
ylabel('Force, F (N)')
title('Spring Calibration: Measurements and Fit')
legend('Measurements','F = kx + b fit','Location','northwest')
grid on
spring_parameter_statement = "REPLACE_WITH_K_VALUE_UNIT_AND_OFFSET_INTERPRETATION";
%[text] **Required evidence:** fitted `k` with unit, fitted offset with unit, labelled graph, and one sentence distinguishing measured force from fitted `k`. **Defence hook:** point to the exact coefficient that represents the physical spring constant.
%%
%[text] ## Question 3: Use Residuals and a Nominal Reference
%[text] Residual = measured force - fitted force. Calculate the residuals and their RMSE, then compare the fitted spring constant with the supplied nominal reference `25 N/m`. Small residuals around zero and agreement with the reference support the model over this range.
spring_residual_N = spring_force_N-spring_force_fit_N;
spring_RMSE_N = sqrt(mean(spring_residual_N.^2));
spring_nominal_k_N_per_m = 25;
spring_k_difference_N_per_m = spring_k_fit_N_per_m-spring_nominal_k_N_per_m;
plot(spring_extension_m,spring_residual_N,'o-','LineWidth',1.3)
yline(0,'--')
xlabel('Extension, x (m)')
ylabel('Residual (N)')
title('Spring-Fit Residuals')
grid on
assert(abs(spring_k_difference_N_per_m) < 0.2)
spring_validation_statement = "REPLACE_WITH_RESIDUAL_PATTERN_AND_REFERENCE_CHECK";
%[text] **Required evidence:** residual unit, RMSE, residual-pattern judgement, and nominal-reference comparison. **Defence hook:** explain what a positive residual means on the force graph.
%%
%[text] ## Question 4: Report a Cautious Repeatability Range
%[text] Three supplied repeat calibrations produced fitted spring constants `24.8`, `25.1`, and `25.3 N/m`. Use the observed span as a simple repeatability range. Do not call it a formal confidence interval and do not report more precision than this evidence supports.
spring_repeat_k_N_per_m = [24.8 25.1 25.3];
spring_repeatability_range_N_per_m = [min(spring_repeat_k_N_per_m) max(spring_repeat_k_N_per_m)]
spring_uncertainty_statement = "REPLACE_WITH_CAUTIOUS_RANGE_STATEMENT";
%[text] **Required evidence:** the range, a rounded fitted value, and one sentence explaining what the range does and does not represent. **Defence hook:** distinguish this repeatability range from the `25 N/m` nominal reference.
%%
%[text] ## Question 5: Test a Constant-Speed Cart Model
%[text] **Context B - cart motion.** A cart's position is measured once per second. Start with the simple model $x=x_0+vt$. Fit a straight line, interpret the slope as a velocity in m/s and intercept as an initial position in m, then inspect whether the graph alone is enough to accept constant speed.
cart_time_s = (0:1:6)';
cart_position_m = [0.21 0.73 1.42 2.14 3.02 3.94 5.00]';
cart_linear_coefficients = polyfit(cart_time_s,cart_position_m,1);
cart_v_fit_m_per_s = cart_linear_coefficients(1);
cart_x0_fit_m = cart_linear_coefficients(2);
cart_linear_fit_m = polyval(cart_linear_coefficients,cart_time_s);
plot(cart_time_s,cart_position_m,'o',cart_time_s,cart_linear_fit_m,'-','LineWidth',1.5)
xlabel('Time, t (s)')
ylabel('Position, x (m)')
title('Cart Data With a Constant-Speed Fit')
legend('Measurements','x = x0 + vt fit','Location','northwest')
grid on
cart_parameter_statement = "REPLACE_WITH_VELOCITY_INTERCEPT_AND_INITIAL_JUDGEMENT";
%[text] **Required evidence:** fitted velocity and unit, fitted intercept and unit, labelled overlay, and initial judgement. **Defence hook:** explain why a fitted slope is not the same as any one measured position.
%%
%[text] ## Question 6: Let the Residual Pattern Challenge the Model
%[text] Calculate the cart residuals. A systematic pattern means the straight-line model misses part of the behaviour even if the overlay looks broadly plausible. Identify whether the residuals look randomly scattered or form a curve-like pattern, then state what that says about the constant-speed assumption.
cart_linear_residual_m = cart_position_m-cart_linear_fit_m;
cart_linear_RMSE_m = sqrt(mean(cart_linear_residual_m.^2));
plot(cart_time_s,cart_linear_residual_m,'o-','LineWidth',1.3)
yline(0,'--')
xlabel('Time, t (s)')
ylabel('Residual (m)')
title('Residuals for the Constant-Speed Cart Model')
grid on
cart_residual_judgement = "REPLACE_WITH_PATTERN_AND_MODEL_JUDGEMENT";
%[text] **Required evidence:** residual pattern, RMSE with unit, and physical conclusion about constant speed. **Defence hook:** explain why positive residuals at both ends and negative residuals in the middle suggest missing curvature.
%%
%[text] ## Optional Working Exposure: Compare a Supplied Quadratic Fit
%[text] This comparison is supplied for interpretation only. A quadratic position model can represent constant acceleration. Read the coefficients and RMSE; do not derive least squares or formal model-selection statistics. A much smaller residual error plus a physically plausible coefficient supports investigating acceleration.
cart_quadratic_coefficients = polyfit(cart_time_s,cart_position_m,2);
cart_quadratic_fit_m = polyval(cart_quadratic_coefficients,cart_time_s);
cart_quadratic_residual_m = cart_position_m-cart_quadratic_fit_m;
cart_quadratic_RMSE_m = sqrt(mean(cart_quadratic_residual_m.^2));
cart_inferred_acceleration_m_per_s2 = 2*cart_quadratic_coefficients(1);
cart_model_comparison = table(cart_linear_RMSE_m,cart_quadratic_RMSE_m, ...
    cart_inferred_acceleration_m_per_s2, ...
    'VariableNames',{'LinearRMSE_m','QuadraticRMSE_m','InferredAcceleration_m_per_s2'})
%[text] **Working exposure evidence:** state which supplied model has smaller residual scatter and one reason that smaller error alone is not sufficient to prove the model is physically correct.
%%
%[text] ## Question 7: Diagnose a Data-Entry Defect Before Refitting
%[text] One copied cart dataset contains a deliberately incorrect fifth position. Fit it without silently fixing anything, locate the measurement with the largest absolute residual, and explain why the raw record should be checked before a point is removed or corrected.
cart_position_defect_m = cart_position_m;
cart_position_defect_m(5) = 4.02;
cart_defect_coefficients = polyfit(cart_time_s,cart_position_defect_m,1);
cart_defect_fit_m = polyval(cart_defect_coefficients,cart_time_s);
cart_defect_residual_m = cart_position_defect_m-cart_defect_fit_m;
[cart_largest_defect_residual_m,cart_suspect_index] = max(abs(cart_defect_residual_m));
cart_suspect_time_s = cart_time_s(cart_suspect_index)
cart_data_quality_statement = "REPLACE_WITH_SUSPECT_POINT_AND_VERIFICATION_ACTION";
%[text] **Required evidence:** suspect time, residual magnitude and unit, and a responsible next action. **Defence hook:** explain why residual size is evidence to investigate, not automatic permission to delete a point.
%%
%[text] ## Question 8: Linearise a Pendulum Relationship
%[text] **Context C - small-angle pendulum.** The supplied model is $T=2\\pi\\sqrt{L/g}$. Squaring gives $T^2=(4\\pi^2/g)L$, so a graph of `T^2` against `L` should be approximately linear. The measured quantities are length `L` in metres and period `T` in seconds. Calculate `T^2`, fit a straight line, and state the slope unit.
pendulum_length_m = (0.2:0.1:0.7)';
pendulum_period_s = [0.90214 1.0948 1.2717 1.4165 1.5579 1.6754]';
pendulum_period_squared_s2 = pendulum_period_s.^2;
pendulum_coefficients = polyfit(pendulum_length_m,pendulum_period_squared_s2,1);
pendulum_slope_s2_per_m = pendulum_coefficients(1);
pendulum_intercept_s2 = pendulum_coefficients(2);
pendulum_T2_fit_s2 = polyval(pendulum_coefficients,pendulum_length_m);
plot(pendulum_length_m,pendulum_period_squared_s2,'o',pendulum_length_m,pendulum_T2_fit_s2,'-','LineWidth',1.5)
xlabel('Length, L (m)')
ylabel('Period squared, T^2 (s^2)')
title('Linearised Pendulum Data')
legend('Measurements','Linear fit','Location','northwest')
grid on
pendulum_slope_statement = "REPLACE_WITH_SLOPE_VALUE_AND_UNIT";
%[text] **Required evidence:** transformed relationship, slope and unit, intercept and unit, and labelled graph. **Defence hook:** explain why squaring the measured period changes its unit to s^2.
%%
%[text] ## Question 9: Infer and Validate Gravitational Acceleration
%[text] From the linearised pendulum model, slope = $4\\pi^2/g$. Rearrange the supplied relation to infer `g`, calculate residuals in `T^2`, and compare the result with the familiar near-Earth reference `9.81 m/s^2`. State whether the agreement is reasonable without claiming that the reference is exact for every location and experiment.
pendulum_g_fit_m_per_s2 = 4*pi^2/pendulum_slope_s2_per_m;
pendulum_residual_s2 = pendulum_period_squared_s2-pendulum_T2_fit_s2;
pendulum_RMSE_s2 = sqrt(mean(pendulum_residual_s2.^2));
pendulum_reference_g_m_per_s2 = 9.81;
pendulum_g_difference_m_per_s2 = pendulum_g_fit_m_per_s2-pendulum_reference_g_m_per_s2;
assert(abs(pendulum_g_difference_m_per_s2) < 0.1)
pendulum_validation_statement = "REPLACE_WITH_G_VALUE_RESIDUAL_AND_REFERENCE_JUDGEMENT";
%[text] **Required evidence:** inferred `g` and unit, residual RMSE and unit, comparison with `9.81 m/s^2`, and one model limitation such as the small-angle assumption or timing error. **Defence hook:** trace how the fitted slope becomes a physical estimate of `g`.
%%
%[text] ## Question 10: Compare Contexts, Record AI Decisions, and Check Capstone Progress
%[text] Complete the cross-context evidence table. For each context, distinguish measured quantities from the fitted parameter, keep the parameter unit, name the residual unit, and identify one validation or model-quality check. Then record your concise AI decision and independent checks. Finally record the Week 9 capstone process checkpoint: current physical model, current method, one validation already attempted or planned next, and the next reproducibility action. This is process evidence, not a new graded milestone.
context_comparison = table(["Spring calibration";"Cart motion";"Pendulum"], ...
    ["x, F";"t, x";"L, T"], ...
    ["k";"v for linear model";"g inferred from slope"], ...
    ["N/m";"m/s";"m/s^2"], ...
    ["N";"m";"s^2"], ...
    ["REPLACE_WITH_SPRING_CHECK";"REPLACE_WITH_CART_CHECK";"REPLACE_WITH_PENDULUM_CHECK"], ...
    'VariableNames',{'Context','MeasuredQuantities','FittedParameter','ParameterUnit','ResidualUnit','ValidationOrModelCheck'})
ai_tool_used = "REPLACE_WITH_TOOL_OR_NO_AI_USED";
ai_request = "REPLACE_WITH_CONCISE_REQUEST";
ai_decision = "REPLACE_WITH_ACCEPTED_MODIFIED_OR_REJECTED_DECISION";
independent_checks = "REPLACE_WITH_UNITS_RESIDUAL_REFERENCE_AND_PHYSICAL_CHECKS";
fresh_session_confirmation = "REPLACE_WITH_MATLAB_RELEASE_AND_TOP_TO_BOTTOM_RUN_CONFIRMATION";
capstone_physical_model = "REPLACE_WITH_CURRENT_PHYSICAL_MODEL";
capstone_method = "REPLACE_WITH_CURRENT_NUMERICAL_OR_DATA_METHOD";
capstone_validation_status = "REPLACE_WITH_CHECK_DONE_OR_NEXT_CHECK";
capstone_reproducibility_next_action = "REPLACE_WITH_NEXT_REPRODUCIBILITY_ACTION";
%[text] **Required evidence:** completed comparison table, concise AI decision record, independent checks, fresh-session confirmation, and Week 9 capstone process checkpoint. **Defence hook:** explain why a high-quality fit cannot compensate for an inappropriate physical model or wrong units.
%%
%[text] ## Submission and Individual Defence
%[text] Submit one completed group file through the Week 9 Google Classroom practical assignment only after running it from the top in a fresh MATLAB session. After group evidence is locked, one challenge slot and one group member are selected. Use a distinct parameter or defect variant when a slot is reused. The selected member explains the model, traces the fitting or residual code/output, and answers a validation or parameter-change follow-up. Every member completes one recorded defence before any second selection; an absence remains pending until a recorded make-up defence is completed.
%[text] Do not submit complete AI chat histories. Submit the concise AI decision record and independent checks only.
%%
%[text] ## Reproducibility Record
%[text] This practical requires MATLAB R2025a or later and base MATLAB only. Run it top to bottom in a fresh session before adding group evidence and again before submission. The supplied datasets, models, units, fitting scaffolds, residual calculations, references, and assertions make the baseline reproducible.

%[appendix]{"version":"1.0"}
