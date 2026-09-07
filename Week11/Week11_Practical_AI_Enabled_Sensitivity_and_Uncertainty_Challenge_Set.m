%[text] # Week 11 Practical Activity: AI-Enabled Sensitivity and Uncertainty Challenge Set
%[text] **PRACTICAL ACTIVITY**
%[text] PHY4605 Physics-First Reproducible MATLAB Notebook
%%
%[text] ## Group Identification and Baseline
%[text] Work in your assigned group of two or three. This practical transfers Week 11 one-at-a-time uncertainty reasoning to an Ohmic resistor, a small-angle pendulum, and exponential attenuation. Generative AI may help write, debug, or improve MATLAB code, but your group must record the material decision and independently check units, baseline values, output ranges, and physical meaning. Do not submit a complete chat transcript.
group_id = "REPLACE_WITH_GROUP_ID";
group_members = "REPLACE_WITH_NAMES";
matlab_release = version('-release');
%%
%[text] ## Question 1: Identify an Uncertain Resistance
%[text] **Context A - Ohmic resistor.** Use $I=V/R$. The voltage is fixed at `12 V`. The resistor is specified as `100 ohm` with a plausible range from `95 ohm` to `105 ohm`. Predict which resistance gives the largest current and state the units of every physical quantity before computing.
voltage_baseline_V = 12;
resistance_cases_ohm = [95 100 105];
resistance_prediction = "REPLACE_WITH_DIRECTION_AND_UNITS";
%[text] **Required evidence:** identify baseline/lower/upper resistance, predict the current trend, and state the units. **Defence hook:** explain why only resistance changes in this comparison.
%%
%[text] ## Question 2: Convert Resistance Uncertainty into a Current Range
%[text] Evaluate the same Ohm's-law model for the three supplied resistance values. Report the baseline current and the minimum-to-maximum current range. The result is a parameter-uncertainty range, not repeated random data.
current_cases_A = voltage_baseline_V./resistance_cases_ohm;
current_baseline_A = current_cases_A(2);
current_range_A = [min(current_cases_A) max(current_cases_A)];
current_span_A = diff(current_range_A);
resistance_table = table(resistance_cases_ohm.',current_cases_A.', ...
    'VariableNames',{'Resistance_ohm','Current_A'})
resistance_range_statement = "REPLACE_WITH_BASELINE_RANGE_AND_INTERPRETATION";
%[text] **Required evidence:** table, baseline current, output range, and one sentence linking the range to resistance uncertainty. **Defence hook:** trace why the largest resistance produces the smallest current.
%%
%[text] ## Question 3: Compare Voltage and Resistance One at a Time
%[text] Keep `R = 100 ohm` fixed and vary voltage only from `11.8 V` to `12.2 V`. Compare the resulting current span with the resistance-driven current span. Do not vary voltage and resistance simultaneously for this question.
voltage_cases_V = [11.8 12.0 12.2];
current_from_voltage_A = voltage_cases_V./100;
voltage_current_range_A = [min(current_from_voltage_A) max(current_from_voltage_A)];
voltage_current_span_A = diff(voltage_current_range_A);
ohm_comparison = table(["Resistance";"Voltage"],[current_span_A;voltage_current_span_A], ...
    'VariableNames',{'UncertainInput','FullCurrentSpan_A'})
ohm_dominant_input = "REPLACE_WITH_INPUT_AND_EVIDENCE";
%[text] **Required evidence:** both spans and a statement identifying which supplied input range changes current more. **Defence hook:** explain why the conclusion depends on the supplied uncertainty ranges, not only on the equation symbols.
%%
%[text] ## Question 4: Diagnose False Precision and Uncertainty Type
%[text] A report states `I = 0.120000000 A` without mentioning the resistor range. Explain why this gives false precision. Then classify each statement as parameter uncertainty, numerical approximation error, or model limitation: (a) resistance is only known from 95 to 105 ohm; (b) a finite timestep changes a simulation result; (c) the resistor heats and is no longer well described by constant `R`.
false_precision_diagnosis = "REPLACE_WITH_RANGE_BASED_REPORTING_REASON";
uncertainty_classification = ["REPLACE_A";"REPLACE_B";"REPLACE_C"];
%[text] **Required evidence:** one concise false-precision explanation and three correct source classifications. **Defence hook:** explain why a deterministic MATLAB result can still have parameter uncertainty.
%%
%[text] ## Question 5: Propagate Length Uncertainty Through a Pendulum Model
%[text] **Context B - small-angle pendulum.** Use the supplied model $T=2\\pi\\sqrt{L/g}$ with `g = 9.81 m/s^2`. Treat length as uncertain from `0.98 m` to `1.02 m` around a `1.00 m` baseline. Predict the direction of the period change, then calculate the output range.
g_mps2 = 9.81;
length_cases_m = [0.98 1.00 1.02];
period_cases_s = 2*pi*sqrt(length_cases_m./g_mps2);
period_baseline_s = period_cases_s(2);
period_range_s = [min(period_cases_s) max(period_cases_s)];
pendulum_statement = "REPLACE_WITH_PREDICTION_RANGE_AND_PHYSICAL_MEANING";
%[text] **Required evidence:** baseline period, period range, and direction of change. **Defence hook:** explain why period changes less strongly than length in percentage terms.
%%
%[text] ## Question 6: Separate Parameter Uncertainty from Model Limitation
%[text] The small-angle equation assumes the swing angle is small. A measured length range is parameter uncertainty; using the small-angle equation for a very large amplitude is a model limitation. State one example of numerical approximation error that could appear if the same pendulum were simulated with a finite timestep.
pendulum_parameter_uncertainty = "REPLACE_WITH_PARAMETER_UNCERTAINTY";
pendulum_model_limitation = "REPLACE_WITH_MODEL_LIMITATION";
pendulum_numerical_error_example = "REPLACE_WITH_TIMESTEP_OR_DISCRETISATION_EXAMPLE";
%[text] **Required evidence:** one correct statement for each of the three limitation sources. **Defence hook:** explain why improving the timestep does not remove uncertainty in the measured length.
%%
%[text] ## Question 7: Build an Attenuation Uncertainty Sweep
%[text] **Context C - exponential attenuation.** Use $I=I_0\\exp(-\\mu x)$ with `I0 = 1000 counts/s` and shield thickness `x = 1.50 cm`. Treat attenuation coefficient as uncertain from `0.75 cm^-1` to `0.85 cm^-1` around `0.80 cm^-1`. Calculate and plot the transmitted count-rate range.
incident_rate_cps = 1000;
thickness_baseline_cm = 1.50;
mu_cases_per_cm = [0.75 0.80 0.85];
transmitted_rate_cps = incident_rate_cps*exp(-mu_cases_per_cm*thickness_baseline_cm);
transmission_range_cps = [min(transmitted_rate_cps) max(transmitted_rate_cps)];
plot(mu_cases_per_cm,transmitted_rate_cps,'o-','LineWidth',1.5,'MarkerSize',7)
xlabel('Attenuation coefficient, mu (1/cm)')
ylabel('Transmitted count rate (counts/s)')
title('Transmitted Rate from Attenuation-Coefficient Uncertainty')
grid on
attenuation_statement = "REPLACE_WITH_RANGE_AND_DIRECTION";
%[text] **Required evidence:** labelled graph, numerical output range, and physical interpretation. **Defence hook:** explain why larger attenuation coefficient reduces transmitted rate.
%%
%[text] ## Question 8: Compare Attenuation Coefficient and Thickness One at a Time
%[text] Hold `mu = 0.80 cm^-1` fixed and vary thickness only from `1.45 cm` to `1.55 cm`. Compare the transmitted-rate span with the `mu`-driven span from Question 7 and identify which supplied uncertainty range has the larger output effect.
thickness_cases_cm = [1.45 1.50 1.55];
transmitted_from_thickness_cps = incident_rate_cps*exp(-0.80*thickness_cases_cm);
thickness_range_cps = [min(transmitted_from_thickness_cps) max(transmitted_from_thickness_cps)];
mu_span_cps = diff(transmission_range_cps);
thickness_span_cps = diff(thickness_range_cps);
attenuation_comparison = table(["mu";"thickness"],[mu_span_cps;thickness_span_cps], ...
    'VariableNames',{'UncertainInput','FullOutputSpan_cps'})
attenuation_dominant_input = "REPLACE_WITH_INPUT_AND_EVIDENCE";
%[text] **Required evidence:** two one-at-a-time spans and a supported comparison. **Defence hook:** explain why varying both uncertain inputs together would answer a different question.
%%
%[text] ## Question 9: Interpret a Supplied First-Order Formula
%[text] **Working exposure.** For `I = V/R`, a supplied independent-uncertainty estimate is $u_I/I\\approx\\sqrt{(u_V/V)^2+(u_R/R)^2}$. Use `uV = 0.2 V`, `V = 12 V`, `uR = 5 ohm`, and `R = 100 ohm`. Calculate the estimated relative uncertainty and the corresponding uncertainty in baseline current. Do not derive the formula.
u_voltage_V = 0.2;
u_resistance_ohm = 5;
relative_current_uncertainty = sqrt((u_voltage_V/12)^2 + (u_resistance_ohm/100)^2);
first_order_u_current_A = current_baseline_A*relative_current_uncertainty;
propagation_interpretation = "REPLACE_WITH_PERCENT_AND_ABSOLUTE_UNCERTAINTY_INTERPRETATION";
%[text] **Required evidence:** numerical relative uncertainty, absolute current uncertainty, and one sentence stating that the relation is supplied Working exposure. **Defence hook:** distinguish this combined estimate from the one-at-a-time ranges in Questions 2 and 3.
%%
%[text] ## Question 10: Compare Contexts, Record AI Decisions, and Check Capstone Uncertainty
%[text] Complete the cross-context evidence table. For each context, name one uncertain input, its output, one validation/reference check, and one model limitation. Then record a concise AI decision and independent checks. Finally record the Week 11 capstone process checkpoint: one important uncertain input or model limitation in your current capstone, how it could affect the main output, and what evidence you will use before Week 12.
context_comparison = table(["Ohmic resistor";"Small-angle pendulum";"Exponential attenuation"], ...
    ["REPLACE_WITH_OHM_INPUT";"REPLACE_WITH_PENDULUM_INPUT";"REPLACE_WITH_ATTENUATION_INPUT"], ...
    ["current";"period";"transmitted count rate"], ...
    ["REPLACE_WITH_OHM_CHECK";"REPLACE_WITH_PENDULUM_CHECK";"REPLACE_WITH_ATTENUATION_CHECK"], ...
    ["REPLACE_WITH_OHM_LIMITATION";"REPLACE_WITH_PENDULUM_LIMITATION";"REPLACE_WITH_ATTENUATION_LIMITATION"], ...
    'VariableNames',{'Context','UncertainInput','Output','ValidationCheck','ModelLimitation'})
ai_tool_used = "REPLACE_WITH_TOOL_OR_NO_AI_USED";
ai_request = "REPLACE_WITH_CONCISE_REQUEST";
ai_decision = "REPLACE_WITH_ACCEPTED_MODIFIED_OR_REJECTED_DECISION";
independent_checks = "REPLACE_WITH_UNITS_BASELINE_RANGE_REFERENCE_AND_PHYSICAL_CHECKS";
fresh_session_confirmation = "REPLACE_WITH_MATLAB_RELEASE_AND_TOP_TO_BOTTOM_RUN_CONFIRMATION";
capstone_uncertain_input_or_limitation = "REPLACE_WITH_CURRENT_CAPSTONE_UNCERTAINTY_OR_LIMITATION";
capstone_output_effect = "REPLACE_WITH_EXPECTED_EFFECT_ON_MAIN_OUTPUT";
capstone_evidence_plan = "REPLACE_WITH_ONE_AT_A_TIME_REFERENCE_OR_OTHER_CHECK_BEFORE_WEEK12";
%[text] **Required evidence:** completed comparison table, concise AI decision record, independent checks, fresh-session confirmation, and Week 11 capstone uncertainty/limitation checkpoint. **Defence hook:** explain why a narrow numerical range does not prove the physical model is adequate.
%%
%[text] ## Submission and Individual Defence
%[text] Submit one completed group file through the Week 11 Google Classroom practical assignment only after running it from the top in a fresh MATLAB session. After group evidence is locked, one challenge slot and one group member are selected. Use a distinct parameter or defect variant when a slot is reused. The selected member explains the model, traces the one-at-a-time calculation or output, and answers an uncertainty-source or parameter-change follow-up. Every member completes one recorded defence before any second selection; an absence remains pending until a recorded make-up defence is completed.
%[text] Do not submit complete AI chat histories. Submit the concise AI decision record and independent checks only.
%%
%[text] ## Reproducibility Record
%[text] This practical requires MATLAB R2025a or later and base MATLAB only. Run it top to bottom in a fresh session before adding group evidence and again before submission. The supplied models, units, baseline/lower/upper values, and one-at-a-time scaffolds make the baseline reproducible.

%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"inline"}
%---
