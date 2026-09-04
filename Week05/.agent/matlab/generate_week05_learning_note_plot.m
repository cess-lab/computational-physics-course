% Generate Week 05 learning-note residual plot and validate locked lecture values.
v0_mps = 20;
g_mps2 = 9.81;
target_m = 35;
theta_scan_deg = 10:1:70;
range_scan_m = (v0_mps^2/g_mps2).*sind(2*theta_scan_deg);
residual_scan_m = range_scan_m - target_m;
h_residual = plot(theta_scan_deg,residual_scan_m,'LineWidth',2);
grid on
h_zero = yline(0,'--','Zero residual');
xline(20,':','20 deg');
xline(40,':','40 deg');
xlabel('Launch angle, theta (degree)')
ylabel('Residual, f(theta) = R(theta) - target (m)')
title('Projectile-Range Residual for a 35 m Target')
legend([h_residual h_zero],{'Residual','Zero residual'},'Location','southwest')
script_dir = fileparts(mfilename('fullpath'));
exportgraphics(gca,fullfile(script_dir,'assets','week05_projectile_residual.png'),'Resolution',180)
f_left_m = (v0_mps^2/g_mps2)*sind(40) - target_m;
f_right_m = (v0_mps^2/g_mps2)*sind(80) - target_m;
assert(f_left_m < 0 && f_right_m > 0)
root_low_deg = 0.5*asind(target_m/(v0_mps^2/g_mps2));
root_residual_m = (v0_mps^2/g_mps2)*sind(2*root_low_deg) - target_m;
assert(abs(root_residual_m) < 1e-12)
