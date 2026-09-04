% Generate deterministic Week 06 learning-note figures.
script_dir = fileparts(mfilename('fullpath'));
asset_dir = fullfile(script_dir,'assets');
if ~exist(asset_dir,'dir'), mkdir(asset_dir); end
y0_m = 0; v0_mps = 20; g_mps2 = 9.81; t0_s = 1.0; h_demo_s = 0.5;
t_s = 0:0.01:3;
y_m = y0_m + v0_mps*t_s - 0.5*g_mps2*t_s.^2;
y_t0_m = y0_m + v0_mps*t0_s - 0.5*g_mps2*t0_s^2;
y_t0h_m = y0_m + v0_mps*(t0_s+h_demo_s) - 0.5*g_mps2*(t0_s+h_demo_s)^2;
v_exact_mps = v0_mps-g_mps2*t0_s;
v_fd_mps = (y_t0h_m-y_t0_m)/h_demo_s;
y_secant_m = y_t0_m + v_fd_mps*(t_s-t0_s);
y_tangent_m = y_t0_m + v_exact_mps*(t_s-t0_s);
f1 = figure('Visible','off');
plot(t_s,y_m,'LineWidth',2); hold on
plot(t_s,y_secant_m,'--','LineWidth',1.5)
plot(t_s,y_tangent_m,':','LineWidth',1.5)
plot([t0_s t0_s+h_demo_s],[y_t0_m y_t0h_m],'o','MarkerSize',7,'LineWidth',1.2)
hold off; grid on
xlabel('Time, t (s)','Interpreter','latex')
ylabel('Vertical position, y (m)','Interpreter','latex')
title('Finite Secant Versus Local Tangent','Interpreter','latex')
legend({'Position model','Forward secant, $h=0.5$ s','Analytic tangent at $t_0$','Sampled positions'},'Interpreter','latex','Location','best')
exportgraphics(f1,fullfile(asset_dir,'week06_forward_difference_geometry.png'),'Resolution',180); close(f1)
h_core_s = [0.5 0.2 0.1 0.05];
y_forward_m = y0_m + v0_mps*(t0_s+h_core_s) - 0.5*g_mps2*(t0_s+h_core_s).^2;
v_forward_mps = (y_forward_m-y_t0_m)./h_core_s;
abs_error_mps = abs(v_forward_mps-v_exact_mps);
f2 = figure('Visible','off');
loglog(h_core_s,abs_error_mps,'o-','LineWidth',2); grid on
xlabel('Step size, h (s)','Interpreter','latex')
ylabel('Absolute velocity error (m/s)','Interpreter','latex')
title('Forward-Difference Error for the Supplied Step Sizes','Interpreter','latex')
exportgraphics(f2,fullfile(asset_dir,'week06_forward_error_vs_step.png'),'Resolution',180); close(f2)
