% Hidden instructor reference for Week 08 practical QA.
% Answer key: RC has time constant 2 s and first Euler values [12, 9, 6.75] V.
% At 8 s with dt=0.5 s, Euler gives about 0.12027 V and exact gives about 0.21979 V.
% Falling-object terminal velocity is 19.62 m/s; velocity approaches it from below here.
% Radioactive decay has lambda=log(2)/4 per s and exact N(4 s)=400 nuclei.
% Context A - RC discharge.
rc_V0_V = 12; rc_R_ohm = 1000; rc_C_F = 0.002; rc_final_time_s = 8;
rc_dt_choices_s = [0.5 0.25 0.125];
rc_final_error_V = zeros(size(rc_dt_choices_s));
for k = 1:numel(rc_dt_choices_s)
    dt_s = rc_dt_choices_s(k);
    time_s = 0:dt_s:rc_final_time_s;
    voltage_V = zeros(size(time_s)); voltage_V(1) = rc_V0_V;
    for n = 1:numel(time_s)-1
        voltage_V(n+1) = voltage_V(n) + dt_s*(-voltage_V(n)/(rc_R_ohm*rc_C_F));
    end
    rc_final_error_V(k) = abs(voltage_V(end)-rc_V0_V*exp(-rc_final_time_s/(rc_R_ohm*rc_C_F)));
end
rc_time_s = 0:0.5:rc_final_time_s;
rc_euler_V = zeros(size(rc_time_s)); rc_euler_V(1) = rc_V0_V;
for n = 1:numel(rc_time_s)-1
    rc_euler_V(n+1) = rc_euler_V(n) + 0.5*(-rc_euler_V(n)/(rc_R_ohm*rc_C_F));
end
rc_exact_V = rc_V0_V*exp(-rc_time_s/(rc_R_ohm*rc_C_F));
assert(all(diff(rc_final_error_V) < 0))
assert(rc_euler_V(end) < rc_exact_V(end))
% Context B - falling velocity with linear drag.
fall_mass_kg = 0.50; fall_drag_kg_per_s = 0.25; fall_g_m_per_s2 = 9.81;
fall_final_time_s = 8; fall_terminal_velocity_m_per_s = fall_mass_kg*fall_g_m_per_s2/fall_drag_kg_per_s;
fall_dt_choices_s = [0.5 0.25 0.125]; fall_final_error_m_per_s = zeros(size(fall_dt_choices_s));
for k = 1:numel(fall_dt_choices_s)
    dt_s = fall_dt_choices_s(k); time_s = 0:dt_s:fall_final_time_s;
    velocity_m_per_s = zeros(size(time_s));
    for n = 1:numel(time_s)-1
        acceleration_m_per_s2 = fall_g_m_per_s2-(fall_drag_kg_per_s/fall_mass_kg)*velocity_m_per_s(n);
        velocity_m_per_s(n+1) = velocity_m_per_s(n) + dt_s*acceleration_m_per_s2;
    end
    velocity_exact_m_per_s = fall_terminal_velocity_m_per_s*(1-exp(-(fall_drag_kg_per_s/fall_mass_kg)*time_s));
    fall_final_error_m_per_s(k) = abs(velocity_m_per_s(end)-velocity_exact_m_per_s(end));
end
assert(all(diff(fall_final_error_m_per_s) < 0))
assert(all(velocity_m_per_s >= 0 & velocity_m_per_s <= fall_terminal_velocity_m_per_s))
% Context C - radioactive decay.
decay_N0 = 800; decay_half_life_s = 4; decay_lambda_per_s = log(2)/decay_half_life_s;
decay_final_time_s = 16; decay_dt_s = 0.5; decay_time_s = 0:decay_dt_s:decay_final_time_s;
decay_euler_N = zeros(size(decay_time_s)); decay_euler_N(1) = decay_N0;
for n = 1:numel(decay_time_s)-1
    decay_euler_N(n+1) = decay_euler_N(n) + decay_dt_s*(-decay_lambda_per_s*decay_euler_N(n));
end
decay_exact_N = decay_N0*exp(-decay_lambda_per_s*decay_time_s);
assert(decay_euler_N(1) == decay_N0)
assert(abs(decay_N0*exp(-decay_lambda_per_s*decay_half_life_s)-400) < 1e-10)
assert(all(decay_euler_N > 0))
reference_summary = table(rc_final_error_V',fall_final_error_m_per_s', ...
    'VariableNames',{'RCFinalError_V','FallingFinalError_m_per_s'})
