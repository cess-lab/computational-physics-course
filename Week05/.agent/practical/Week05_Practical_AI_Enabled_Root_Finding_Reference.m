% Hidden instructor reference for Week 05 practical QA.
proj_v0_mps = 22; proj_g_mps2 = 9.81; proj_target_m = 40;
proj_tolerance_m = 1e-3;
theta_scan_deg = 15:1:45;
proj_scan_residual_m = (proj_v0_mps^2/proj_g_mps2).*sind(2*theta_scan_deg) - proj_target_m;
left_deg = 20; right_deg = 40;
assert(((proj_v0_mps^2/proj_g_mps2)*sind(2*left_deg)-proj_target_m) < 0)
assert(((proj_v0_mps^2/proj_g_mps2)*sind(2*right_deg)-proj_target_m) > 0)
for i = 1:50
    mid_deg = (left_deg + right_deg)/2;
    f_mid_m = (proj_v0_mps^2/proj_g_mps2)*sind(2*mid_deg) - proj_target_m;
    if abs(f_mid_m) < proj_tolerance_m, break, end
    f_left_m = (proj_v0_mps^2/proj_g_mps2)*sind(2*left_deg) - proj_target_m;
    if f_left_m*f_mid_m < 0, right_deg = mid_deg; else, left_deg = mid_deg; end
end
projectile_root_deg = mid_deg; projectile_residual_m = f_mid_m;
assert(abs(projectile_residual_m) < proj_tolerance_m)

newton_theta_deg = 25;
for i = 1:50
    newton_residual_m = (proj_v0_mps^2/proj_g_mps2)*sind(2*newton_theta_deg) - proj_target_m;
    newton_slope_m_per_deg = (proj_v0_mps^2/proj_g_mps2)*cosd(2*newton_theta_deg)*(2*pi/180);
    if abs(newton_residual_m) < proj_tolerance_m, break, end
    newton_theta_deg = newton_theta_deg - newton_residual_m/newton_slope_m_per_deg;
end
newton_root_deg = newton_theta_deg;
assert(abs(projectile_root_deg-newton_root_deg) < 5e-3)

bad_left_deg = 10; bad_right_deg = 20;
bad_left_residual_m = (proj_v0_mps^2/proj_g_mps2)*sind(2*bad_left_deg) - proj_target_m;
bad_right_residual_m = (proj_v0_mps^2/proj_g_mps2)*sind(2*bad_right_deg) - proj_target_m;
assert(bad_left_residual_m*bad_right_residual_m > 0)

lens_f_m = 0.10; lens_u_m = 0.30; left_v_m = 0.11; right_v_m = 0.30;
lens_tolerance_inv_m = 1e-3;
for i = 1:50
    mid_v_m = (left_v_m + right_v_m)/2;
    f_mid_inv_m = 1/lens_f_m - 1/lens_u_m - 1/mid_v_m;
    if abs(f_mid_inv_m) < lens_tolerance_inv_m, break, end
    f_left_inv_m = 1/lens_f_m - 1/lens_u_m - 1/left_v_m;
    if f_left_inv_m*f_mid_inv_m < 0, right_v_m = mid_v_m; else, left_v_m = mid_v_m; end
end
lens_v_m = mid_v_m; lens_residual_inv_m = f_mid_inv_m;
assert(abs(lens_v_m - 0.15) < 5e-4)
assert(abs(lens_residual_inv_m) < lens_tolerance_inv_m)

rc_Vs_V = 5; rc_R_ohm = 1000; rc_C_F = 1000e-6; rc_threshold_V = 3;
rc_tolerance_V = 1e-3;
left_t_s = 0; right_t_s = 2;
for i = 1:50
    mid_t_s = (left_t_s + right_t_s)/2;
    f_mid_V = rc_Vs_V*(1-exp(-mid_t_s/(rc_R_ohm*rc_C_F))) - rc_threshold_V;
    if abs(f_mid_V) < rc_tolerance_V, break, end
    f_left_V = rc_Vs_V*(1-exp(-left_t_s/(rc_R_ohm*rc_C_F))) - rc_threshold_V;
    if f_left_V*f_mid_V < 0, right_t_s = mid_t_s; else, left_t_s = mid_t_s; end
end
rc_root_s = mid_t_s; rc_residual_V = f_mid_V;
assert(abs(rc_residual_V) < rc_tolerance_V)

reference_summary = table(projectile_root_deg,newton_root_deg,lens_v_m,rc_root_s, ...
    'VariableNames',{'ProjectileBisection_deg','ProjectileNewton_deg','LensImage_m','RCThreshold_s'})
