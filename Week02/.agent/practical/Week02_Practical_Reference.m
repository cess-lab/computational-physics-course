% Hidden instructor reference for the Week 02 practical challenge.
% Run as a complete script from a fresh MATLAB R2025a-or-later session.
% Base MATLAB only. This is a reference, not a student submission.
clearvars
close all
clc

%% Questions 1-4: cooling baseline, loop, validation, and tau change
T_room_C = 25;
T0_C = 85;
tau_cool_s = 4.0;
t_cool_s = 0:1:16;

% Q1-Q3: one stored temperature for each time value.
T_cool_C = zeros(size(t_cool_s));
for sample_index = 1:numel(t_cool_s)
    current_time_s = t_cool_s(sample_index);
    T_cool_C(sample_index) = T_room_C + ...
        (T0_C - T_room_C)*exp(-current_time_s/tau_cool_s);
end

assert(numel(t_cool_s) == 17,'Cooling time-grid validation failed.')
assert(abs(T_cool_C(1) - T0_C) < 1e-12, ...
    'Cooling initial-value validation failed.')
assert(abs(T_cool_C(2) - 71.7280469842843) < 1e-10, ...
    'Cooling second-pass trace validation failed.')
assert(T_cool_C(end) > T_room_C && T_cool_C(end) < T0_C, ...
    'Cooling trend validation failed.')

% Q4: change one parameter only and rerun the same model.
tau_cool_modified_s = 2*tau_cool_s;
T_cool_modified_C = zeros(size(t_cool_s));
for sample_index = 1:numel(t_cool_s)
    current_time_s = t_cool_s(sample_index);
    T_cool_modified_C(sample_index) = T_room_C + ...
        (T0_C - T_room_C)*exp(-current_time_s/tau_cool_modified_s);
end

assert(abs(T_cool_modified_C(1) - T0_C) < 1e-12, ...
    'Modified cooling initial-value validation failed.')
assert(abs(T_cool_modified_C(end) - 33.12011699419676) < 1e-10, ...
    'Modified cooling endpoint validation failed.')
assert(T_cool_modified_C(end) > T_cool_C(end), ...
    'Larger cooling time-constant trend validation failed.')

%% Question 5: syntax-defect reference state
% The missing-end demonstration is intentionally not executable here.
% The restored loop above is the corrected reference state. MATLAB's exact
% diagnostic wording can vary; grade the defect type and repair, not a quote.

%% Question 6: indexing-defect reference state and repair
T_cool_wrong_C = zeros(size(t_cool_s));
for sample_index = 1:numel(t_cool_s)
    current_time_s = t_cool_s(sample_index);
    T_cool_wrong_C(1) = T_room_C + ...
        (T0_C - T_room_C)*exp(-current_time_s/tau_cool_s);
end

assert(T_cool_wrong_C(1) == T_cool_C(end), ...
    'Indexing-defect overwrite state changed unexpectedly.')
assert(all(T_cool_wrong_C(2:end) == 0), ...
    'Indexing-defect zero-fill state changed unexpectedly.')

% Repaired output is the indexed T_cool_C vector above.
assert(numel(T_cool_C) == numel(t_cool_s), ...
    'Repaired cooling output length validation failed.')
assert(abs(T_cool_C(1) - T0_C) < 1e-12, ...
    'Repaired cooling output validation failed.')

%% Questions 7-8: radioactive decay loop and wrong-sign diagnosis
N0_counts = 800;
half_life_h = 6.0;
t_decay_h = 0:1:24;
lambda_per_h = log(2)/half_life_h;

N_counts = zeros(size(t_decay_h));
for sample_index = 1:numel(t_decay_h)
    current_time_h = t_decay_h(sample_index);
    N_counts(sample_index) = N0_counts*exp(-lambda_per_h*current_time_h);
end

assert(abs(N_counts(1) - N0_counts) < 1e-12, ...
    'Decay initial-value validation failed.')
decay_half_life_index = find(t_decay_h == half_life_h,1);
assert(abs(N_counts(decay_half_life_index) - 400) < 1e-12, ...
    'Decay half-life validation failed.')
assert(abs(N_counts(end) - 50) < 1e-12, ...
    'Decay four-half-lives validation failed.')

% Q8: deliberately wrong physical/logical sign, followed by the repair.
N_wrong_counts = zeros(size(t_decay_h));
for sample_index = 1:numel(t_decay_h)
    current_time_h = t_decay_h(sample_index);
    N_wrong_counts(sample_index) = N0_counts*exp(lambda_per_h*current_time_h);
end
assert(abs(N_wrong_counts(decay_half_life_index) - 1600) < 1e-10, ...
    'Decay wrong-sign diagnostic state changed unexpectedly.')
assert(N_wrong_counts(end) > N0_counts, ...
    'Decay wrong-sign trend diagnostic state changed unexpectedly.')

% Corrected output is N_counts above.
assert(N_counts(decay_half_life_index) < N0_counts, ...
    'Corrected decay direction validation failed.')

%% Question 9: mass-spring loop and two checks
A_m = 0.080;
period_s = 1.60;
t_spring_s = 0:0.1:3.2;

x_m = zeros(size(t_spring_s));
for sample_index = 1:numel(t_spring_s)
    current_time_s = t_spring_s(sample_index);
    x_m(sample_index) = A_m*cos(2*pi*current_time_s/period_s);
end

assert(abs(x_m(1) - A_m) < 1e-12, ...
    'Oscillator initial-value validation failed.')
quarter_period_index = find(abs(t_spring_s - period_s/4) < 1e-12,1);
assert(abs(x_m(quarter_period_index)) < 1e-12, ...
    'Oscillator quarter-period validation failed.')

%% Question 10: cross-context checks and reference plots
assert(all(diff(T_cool_C) < 0), ...
    'Cooling monotonicity comparison check failed.')
assert(all(diff(N_counts) < 0), ...
    'Decay monotonicity comparison check failed.')
assert(abs(x_m(1) - A_m) < 1e-12, ...
    'Cross-context oscillator check failed.')

figure('Name','Week 02 instructor reference');
subplot(1,3,1)
plot(t_cool_s,T_cool_C,'o-','LineWidth',1.4)
grid on
xlabel('Time, t (s)')
ylabel('Temperature, T (deg C)')
title('Cooling')

subplot(1,3,2)
plot(t_decay_h,N_counts,'o-','LineWidth',1.4)
grid on
xlabel('Time, t (h)')
ylabel('Counts, N')
title('Radioactive decay')

subplot(1,3,3)
plot(t_spring_s,x_m,'o-','LineWidth',1.4)
grid on
xlabel('Time, t (s)')
ylabel('Displacement, x (m)')
title('Mass-spring oscillator')

fprintf('Cooling: T(0) = %.6f deg C; T(16 s) = %.6f deg C.\n', ...
    T_cool_C(1),T_cool_C(end))
fprintf('Decay: N(6 h) = %.6f counts; N(24 h) = %.6f counts.\n', ...
    N_counts(decay_half_life_index),N_counts(end))
fprintf('Oscillator: x(0) = %.6f m; x(T/4) = %.6f m.\n', ...
    x_m(1),x_m(quarter_period_index))
