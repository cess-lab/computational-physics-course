% Generate deterministic Week 07 learning-note figures.
script_dir = fileparts(mfilename('fullpath'));
asset_dir = fullfile(script_dir,'assets');
if ~exist(asset_dir,'dir'), mkdir(asset_dir); end

F0_N = 12; tau_s = 0.8; T_s = 2.0; n = 4;
t_curve_s = linspace(0,T_s,401);
F_curve_N = F0_N*exp(-t_curve_s/tau_s);
t_sample_s = linspace(0,T_s,n+1);
F_sample_N = F0_N*exp(-t_sample_s/tau_s);

f1 = figure('Visible','off');
area(t_sample_s,F_sample_N,'FaceAlpha',0.22); hold on
plot(t_curve_s,F_curve_N,'LineWidth',2)
plot(t_sample_s,F_sample_N,'o','MarkerSize',7,'LineWidth',1.2)
hold off; grid on
xlabel('Time, t (s)','Interpreter','latex')
ylabel('Force, F (N)','Interpreter','latex')
title('Trapezoidal Approximation to Impulse','Interpreter','latex')
legend({'Four trapezoids','Force model','Sampled force values'},'Location','best')
exportgraphics(f1,fullfile(asset_dir,'week07_impulse_trapezoids.png'),'Resolution',180); close(f1)

interval_count = [4 8 16];
J_exact_Ns = F0_N*tau_s*(1-exp(-T_s/tau_s));
J_trapz_Ns = zeros(size(interval_count));
for k = 1:numel(interval_count)
    t_s = linspace(0,T_s,interval_count(k)+1);
    F_N = F0_N*exp(-t_s/tau_s);
    J_trapz_Ns(k) = trapz(t_s,F_N);
end
abs_error_Ns = abs(J_trapz_Ns-J_exact_Ns);
f2 = figure('Visible','off');
plot(T_s./interval_count,abs_error_Ns,'o-','LineWidth',2); grid on
xlabel('Sample spacing, $\Delta t$ (s)','Interpreter','latex')
ylabel('Absolute impulse error (N s)','Interpreter','latex')
title('Trapezoidal Error for the Supplied Refinements','Interpreter','latex')
exportgraphics(f2,fullfile(asset_dir,'week07_trapezoid_error_vs_spacing.png'),'Resolution',180); close(f2)
