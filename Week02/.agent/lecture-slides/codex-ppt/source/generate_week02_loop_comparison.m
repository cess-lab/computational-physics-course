function generate_week02_loop_comparison()
%GENERATE_WEEK02_LOOP_COMPARISON Create strict numerical evidence for Slide 11.
% The figure is generated from the locked Week 02 vertical-motion model.

sourceDir = fileparts(mfilename('fullpath'));
assetDir = fullfile(sourceDir, '..', 'assets', 'matlab-figures');
if ~isfolder(assetDir)
    mkdir(assetDir)
end

y0_m = 0;
v0_mps = 20;
v0_lower_mps = 15;
g_mps2 = 9.81;
t_s = 0:0.5:4;
n_samples = numel(t_s);

y_m = zeros(size(t_s));
y_lower_m = zeros(size(t_s));
for sample_index = 1:n_samples
    current_time_s = t_s(sample_index);
    y_m(sample_index) = y0_m + v0_mps*current_time_s ...
        - 0.5*g_mps2*current_time_s^2;
    y_lower_m(sample_index) = y0_m + v0_lower_mps*current_time_s ...
        - 0.5*g_mps2*current_time_s^2;
end

figure('Color', 'white', 'Position', [100 100 1800 1000], 'Visible', 'off');
hold on
plot(t_s, y_m, '-o', 'LineWidth', 3.2, 'MarkerSize', 8, ...
    'Color', [0.05 0.26 0.47], 'MarkerFaceColor', [0.05 0.26 0.47]);
plot(t_s, y_lower_m, '--o', 'LineWidth', 3.2, 'MarkerSize', 8, ...
    'Color', [0.79 0.54 0.09], 'MarkerFaceColor', 'white');
plot(t_s(1), y_m(1), 'o', 'MarkerSize', 13, 'LineWidth', 2.2, ...
    'Color', [0.00 0.50 0.45], 'MarkerFaceColor', [0.00 0.50 0.45]);
grid on
box on
xlim([0 4])
ylim([-20 25])
xticks(0:0.5:4)
yticks(-20:5:25)
xlabel('Time, $t$ (s)', 'Interpreter', 'latex', 'FontSize', 28)
ylabel('Vertical position, $y$ (m)', 'Interpreter', 'latex', 'FontSize', 28)
title('Loop output: one position per time sample', ...
    'FontSize', 32, 'FontWeight', 'bold')
legend('$v_0 = 20$ m s$^{-1}$', '$v_0 = 15$ m s$^{-1}$', ...
    'known initial value', 'Interpreter', 'latex', ...
    'Location', 'southwest', 'FontSize', 22)
set(gca, 'FontSize', 22, 'LineWidth', 1.2)
exportgraphics(gcf, fullfile(assetDir, 'week02_loop_comparison.png'), ...
    'Resolution', 220)

comparison_table = table(t_s(:), y_m(:), y_lower_m(:), ...
    'VariableNames', {'time_s', 'position_v0_20_m', 'position_v0_15_m'});
writetable(comparison_table, fullfile(assetDir, 'week02_loop_comparison_data.csv'))
save(fullfile(assetDir, 'week02_loop_comparison_data.mat'), ...
    't_s', 'y_m', 'y_lower_m', 'y0_m', 'v0_mps', 'v0_lower_mps', 'g_mps2')
close(gcf)
end
