% Hidden instructor reference and baseline QA for Week 09 practical.

% Context A: spring calibration.
spring_extension_m = (0.01:0.01:0.08)';
spring_force_N = [0.26 0.49 0.76 1.01 1.24 1.51 1.74 2.02]';
spring_coefficients = polyfit(spring_extension_m,spring_force_N,1);
spring_k_fit_N_per_m = spring_coefficients(1);
spring_offset_fit_N = spring_coefficients(2);
spring_force_fit_N = polyval(spring_coefficients,spring_extension_m);
spring_residual_N = spring_force_N-spring_force_fit_N;
spring_RMSE_N = sqrt(mean(spring_residual_N.^2));
assert(abs(spring_k_fit_N_per_m-25.0595238095) < 1e-9)
assert(abs(spring_offset_fit_N-0.0010714286) < 1e-9)
assert(abs(spring_RMSE_N-0.0110262133551) < 1e-10)

% Context B: cart motion.
cart_time_s = (0:1:6)';
cart_position_m = [0.21 0.73 1.42 2.14 3.02 3.94 5.00]';
cart_linear_coefficients = polyfit(cart_time_s,cart_position_m,1);
cart_linear_fit_m = polyval(cart_linear_coefficients,cart_time_s);
cart_linear_residual_m = cart_position_m-cart_linear_fit_m;
cart_linear_RMSE_m = sqrt(mean(cart_linear_residual_m.^2));
cart_quadratic_coefficients = polyfit(cart_time_s,cart_position_m,2);
cart_quadratic_fit_m = polyval(cart_quadratic_coefficients,cart_time_s);
cart_quadratic_RMSE_m = sqrt(mean((cart_position_m-cart_quadratic_fit_m).^2));
cart_inferred_acceleration_m_per_s2 = 2*cart_quadratic_coefficients(1);
assert(abs(cart_linear_coefficients(1)-0.7996428571) < 1e-9)
assert(abs(cart_linear_RMSE_m-0.1725779918336) < 1e-10)
assert(abs(cart_quadratic_RMSE_m-0.0144984165216) < 1e-10)
assert(cart_quadratic_RMSE_m < cart_linear_RMSE_m)
assert(abs(cart_inferred_acceleration_m_per_s2-0.0992857143) < 1e-9)

% Deliberate data-entry defect.
cart_position_defect_m = cart_position_m;
cart_position_defect_m(5) = 4.02;
cart_defect_coefficients = polyfit(cart_time_s,cart_position_defect_m,1);
cart_defect_fit_m = polyval(cart_defect_coefficients,cart_time_s);
cart_defect_residual_m = cart_position_defect_m-cart_defect_fit_m;
[cart_largest_defect_residual_m,cart_suspect_index] = max(abs(cart_defect_residual_m));
assert(cart_suspect_index == 5)
assert(abs(cart_time_s(cart_suspect_index)-4) < 1e-12)
assert(abs(cart_largest_defect_residual_m-0.6903571429) < 1e-9)

% Context C: pendulum linearisation.
pendulum_length_m = (0.2:0.1:0.7)';
pendulum_period_s = [0.90214 1.0948 1.2717 1.4165 1.5579 1.6754]';
pendulum_period_squared_s2 = pendulum_period_s.^2;
pendulum_coefficients = polyfit(pendulum_length_m,pendulum_period_squared_s2,1);
pendulum_T2_fit_s2 = polyval(pendulum_coefficients,pendulum_length_m);
pendulum_residual_s2 = pendulum_period_squared_s2-pendulum_T2_fit_s2;
pendulum_RMSE_s2 = sqrt(mean(pendulum_residual_s2.^2));
pendulum_g_fit_m_per_s2 = 4*pi^2/pendulum_coefficients(1);
assert(abs(pendulum_coefficients(1)-4.0114829634286) < 1e-10)
assert(abs(pendulum_g_fit_m_per_s2-9.8413524285831) < 1e-10)
assert(abs(pendulum_RMSE_s2-0.0088454298784) < 1e-10)
assert(abs(pendulum_g_fit_m_per_s2-9.81) < 0.1)

reference_summary = table(spring_k_fit_N_per_m,spring_RMSE_N, ...
    cart_linear_RMSE_m,cart_quadratic_RMSE_m, ...
    pendulum_g_fit_m_per_s2,pendulum_RMSE_s2)
disp('WEEK09_PRACTICAL_REFERENCE_PASSED')
