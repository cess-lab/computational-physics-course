% Hidden instructor reference and baseline QA for Week 11 practical.

% Context A: Ohmic resistor.
voltage_baseline_V = 12;
resistance_cases_ohm = [95 100 105];
current_cases_A = voltage_baseline_V./resistance_cases_ohm;
current_baseline_A = current_cases_A(2);
current_range_A = [min(current_cases_A) max(current_cases_A)];
current_span_A = diff(current_range_A);
assert(abs(current_baseline_A-0.12) < 1e-12)
assert(current_cases_A(1) > current_cases_A(2) && current_cases_A(2) > current_cases_A(3))

voltage_cases_V = [11.8 12.0 12.2];
current_from_voltage_A = voltage_cases_V./100;
voltage_current_range_A = [min(current_from_voltage_A) max(current_from_voltage_A)];
voltage_current_span_A = diff(voltage_current_range_A);
assert(current_span_A > voltage_current_span_A)

% Context B: small-angle pendulum.
g_mps2 = 9.81;
length_cases_m = [0.98 1.00 1.02];
period_cases_s = 2*pi*sqrt(length_cases_m./g_mps2);
period_baseline_s = period_cases_s(2);
period_range_s = [min(period_cases_s) max(period_cases_s)];
assert(period_cases_s(1) < period_cases_s(2) && period_cases_s(2) < period_cases_s(3))
assert(abs(period_baseline_s-2*pi*sqrt(1/g_mps2)) < 1e-12)

% Context C: exponential attenuation.
incident_rate_cps = 1000;
thickness_baseline_cm = 1.50;
mu_cases_per_cm = [0.75 0.80 0.85];
transmitted_rate_cps = incident_rate_cps*exp(-mu_cases_per_cm*thickness_baseline_cm);
transmission_range_cps = [min(transmitted_rate_cps) max(transmitted_rate_cps)];
assert(transmitted_rate_cps(1) > transmitted_rate_cps(2) && transmitted_rate_cps(2) > transmitted_rate_cps(3))

thickness_cases_cm = [1.45 1.50 1.55];
transmitted_from_thickness_cps = incident_rate_cps*exp(-0.80*thickness_cases_cm);
thickness_range_cps = [min(transmitted_from_thickness_cps) max(transmitted_from_thickness_cps)];
mu_span_cps = diff(transmission_range_cps);
thickness_span_cps = diff(thickness_range_cps);
assert(mu_span_cps > thickness_span_cps)

% Working exposure: supplied first-order Ohm-law uncertainty relation.
u_voltage_V = 0.2;
u_resistance_ohm = 5;
relative_current_uncertainty = sqrt((u_voltage_V/12)^2 + (u_resistance_ohm/100)^2);
first_order_u_current_A = current_baseline_A*relative_current_uncertainty;
assert(abs(relative_current_uncertainty-sqrt((0.2/12)^2+(5/100)^2)) < 1e-12)

reference_summary = table(current_baseline_A,current_range_A(1),current_range_A(2), ...
    current_span_A,voltage_current_span_A,period_baseline_s,period_range_s(1), ...
    period_range_s(2),mu_span_cps,thickness_span_cps,relative_current_uncertainty, ...
    first_order_u_current_A)
disp('WEEK11_PRACTICAL_REFERENCE_PASSED')
