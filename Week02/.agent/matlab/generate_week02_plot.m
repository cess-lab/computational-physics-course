clear; close all; clc

output_dir = fullfile(fileparts(mfilename('fullpath')),'assets');
if ~exist(output_dir,'dir')
    mkdir(output_dir)
end

y0_m = 0;
v0_mps = 20;
v0_lower_mps = 15;
g_mps2 = 9.81;
t_s = 0:0.5:4;
n_samples = numel(t_s);

y_m = zeros(size(t_s));
y_lower_launch_m = zeros(size(t_s));
for sample_index = 1:n_samples
    current_time_s = t_s(sample_index);
    y_m(sample_index) = y0_m + v0_mps*current_time_s ...
        - 0.5*g_mps2*current_time_s^2;
    y_lower_launch_m(sample_index) = y0_m + v0_lower_mps*current_time_s ...
        - 0.5*g_mps2*current_time_s^2;
end

assert(abs(y_m(1)-y0_m) < 1e-12,'Initial-value validation failed.')
assert(abs(y_m(2)-8.77375) < 1e-10,'Unexpected value at 0.5 s.')
assert(abs(y_m(3)-15.095) < 1e-10,'Unexpected value at 1.0 s.')
assert(abs(y_m(end)-1.52) < 1e-10,'Unexpected value at 4.0 s.')
assert(max(y_lower_launch_m) < max(y_m),'Lower launch speed should give a lower sampled peak.')

evidence = table(t_s(:),y_m(:),y_lower_launch_m(:), ...
    'VariableNames',{'time_s','position_20_mps_m','position_15_mps_m'});
writetable(evidence,fullfile(output_dir,'week02_loop_position_data.csv'))
save(fullfile(output_dir,'week02_loop_position_data.mat'), ...
    't_s','y_m','y_lower_launch_m','y0_m','v0_mps','v0_lower_mps','g_mps2')

fig = figure('Visible','off','Color','w','Position',[100 100 1100 650]);
plot(t_s,y_m,'-o','LineWidth',2.4,'Color',[0.05 0.26 0.47], ...
    'MarkerSize',6,'MarkerFaceColor',[0.05 0.26 0.47])
hold on
plot(t_s,y_lower_launch_m,'--o','LineWidth',2.2,'Color',[0.79 0.54 0.09], ...
    'MarkerSize',5)
plot(t_s(1),y_m(1),'o','MarkerSize',9,'MarkerFaceColor',[0.00 0.50 0.45], ...
    'MarkerEdgeColor',[0.00 0.50 0.45])
grid on
xlabel('Time, $t$ (s)','Interpreter','latex')
ylabel('Vertical position, $y$ (m)','Interpreter','latex')
title('Loop-computed vertical position','Interpreter','latex')
legend({'$v_0=20\,\mathrm{m\,s^{-1}}$','$v_0=15\,\mathrm{m\,s^{-1}}$', ...
    'known initial value'},'Interpreter','latex','Location','southwest')
set(gca,'FontSize',14,'TickLabelInterpreter','latex','LineWidth',1.0)
exportgraphics(fig,fullfile(output_dir,'week02_loop_position.png'),'Resolution',220)
close(fig)

fprintf('Week 02 retained plot generated successfully.\n')
fprintf('y(0 s)   = %.5f m\n',y_m(1))
fprintf('y(0.5 s) = %.5f m\n',y_m(2))
fprintf('y(1.0 s) = %.5f m\n',y_m(3))
fprintf('y(4.0 s) = %.5f m\n',y_m(end))
fprintf('sampled peak, 20 m/s = %.5f m\n',max(y_m))
fprintf('sampled peak, 15 m/s = %.5f m\n',max(y_lower_launch_m))
