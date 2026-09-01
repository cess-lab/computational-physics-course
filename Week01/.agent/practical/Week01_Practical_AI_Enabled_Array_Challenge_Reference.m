% Hidden instructor reference solution for Week 1 Practical Activity.
% Run from a fresh MATLAB session with base MATLAB.
V_supply_V = 12.0;
tau_s = 2.0;
t_RC_s = linspace(0,10,101);
V_capacitor_V = V_supply_V.*(1-exp(-t_RC_s./tau_s));
RC_tau_index = find(abs(t_RC_s-tau_s) < 1e-12,1);
assert(abs(V_capacitor_V(1)) < 1e-12,'RC initial-value validation failed.')
assert(abs(V_capacitor_V(RC_tau_index)-V_supply_V.*(1-exp(-1))) < 1e-12,'RC time-constant validation failed.')
A_m = 0.080;
period_s = 1.60;
spring_constant_Npm = 10.0;
t_spring_s = linspace(0,3.20,161);
omega_radps = 2*pi/period_s;
x_m = A_m.*cos(omega_radps.*t_spring_s);
spring_energy_J = 0.5.*spring_constant_Npm.*x_m.^2;
quarter_period_index = find(abs(t_spring_s-period_s./4) < 1e-12,1);
assert(abs(x_m(1)-A_m) < 1e-12,'Oscillator initial-value validation failed.')
assert(abs(x_m(quarter_period_index)) < 1e-12,'Oscillator quarter-period validation failed.')
assert(abs(max(spring_energy_J)-0.5.*spring_constant_Npm.*A_m.^2) < 1e-12,'Spring-energy validation failed.')
N0_counts = 800;
half_life_h = 6.0;
t_decay_h = linspace(0,24,121);
lambda_per_h = log(2)./half_life_h;
N_counts = N0_counts.*exp(-lambda_per_h.*t_decay_h);
half_life_index = find(abs(t_decay_h-half_life_h) < 1e-12,1);
final_time_index = find(abs(t_decay_h-24) < 1e-12,1);
assert(abs(N_counts(1)-N0_counts) < 1e-12,'Decay initial-value validation failed.')
assert(abs(N_counts(half_life_index)-400) < 1e-10,'Decay half-life validation failed.')
assert(abs(N_counts(final_time_index)-50) < 1e-10,'Decay four-half-life validation failed.')
plot(t_RC_s,V_capacitor_V,'LineWidth',2)
grid on
xlabel('Time, t (s)')
ylabel('Capacitor voltage, V_C (V)')
title('Reference: RC Charging')
plot(t_spring_s,x_m,'LineWidth',2)
grid on
xlabel('Time, t (s)')
ylabel('Displacement, x (m)')
title('Reference: Mass-Spring Oscillator')
plot(t_decay_h,N_counts,'LineWidth',2)
grid on
xlabel('Time, t (h)')
ylabel('Counts, N')
title('Reference: Radioactive Decay')
