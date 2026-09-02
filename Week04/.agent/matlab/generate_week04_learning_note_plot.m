F_N = 0:0.5:10;
k_Npm = [50 100 200];
extension_m = zeros(length(k_Npm),length(F_N));
for case_id = 1:length(k_Npm)
    extension_m(case_id,:) = F_N./k_Npm(case_id);
end
plot(F_N,extension_m.','LineWidth',2)
grid on
xlabel('Applied force, F (N)')
ylabel('Spring extension, x (m)')
title('Hooke''s Law Parameter Sweep: Effect of Spring Stiffness')
legend('k = 50 N/m','k = 100 N/m','k = 200 N/m','Location','northwest')
script_dir = fileparts(mfilename('fullpath'));
exportgraphics(gca,fullfile(script_dir,'assets','week04_hooke_parameter_sweep.png'),'Resolution',180)
assert(max(abs(extension_m(:,1))) < 1e-12)
