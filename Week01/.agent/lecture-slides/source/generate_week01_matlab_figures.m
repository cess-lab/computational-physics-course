function generate_week01_matlab_figures()
%GENERATE_WEEK01_MATLAB_FIGURES Build the retained numerical evidence for Week 01.
% All visible MATLAB figure text explicitly uses the LaTeX interpreter.

sourceDir = fileparts(mfilename('fullpath'));
slideDir = fileparts(sourceDir);
assetDir = fullfile(slideDir, 'assets', 'matlab-figures');
if ~isfolder(assetDir)
    mkdir(assetDir);
end

set(groot, 'defaultTextInterpreter', 'latex');
set(groot, 'defaultAxesTickLabelInterpreter', 'latex');
set(groot, 'defaultLegendInterpreter', 'latex');

g = 9.81;
v0 = 20;
t = linspace(0, 4, 101);
y = v0 .* t - 0.5 .* g .* t .^ 2;
save(fullfile(assetDir, 'height_time_evidence_data.mat'), 'g', 'v0', 't', 'y');
writetable(table(t(:), y(:), 'VariableNames', {'time_s', 'height_m'}), ...
    fullfile(assetDir, 'height_time_evidence_data.csv'));

makeFigure();
plot(t, y, 'Color', [0.184 0.427 0.698], 'LineWidth', 4);
xlabel('$\mathrm{Time},\ t\ (\mathrm{s})$', 'Interpreter', 'latex', 'FontSize', 32);
ylabel('$\mathrm{Height},\ y\ (\mathrm{m})$', 'Interpreter', 'latex', 'FontSize', 32);
title('$\mathrm{Vertical\ motion:\ height\ versus\ time}$', 'Interpreter', 'latex', 'FontSize', 34, 'FontWeight', 'bold');
xlim([0 4]); ylim([0 22]); grid on; box off;
exportgraphics(gcf, fullfile(assetDir, 'height_time_evidence.png'), 'Resolution', 300);
close(gcf);

% Slide 12: a compact plot with deliberately enlarged tick labels and legend.
t_s = 0:0.1:4;
y_m = v0 .* t_s - 0.5 .* g .* t_s .^ 2;
save(fullfile(assetDir, 'week01_height_time_data.mat'), 'g', 'v0', 't_s', 'y_m');
writetable(table(t_s(:), y_m(:), 'VariableNames', {'time_s', 'height_m'}), ...
    fullfile(assetDir, 'week01_height_time_data.csv'));
makeFigure(); hold on;
plot(t_s, y_m, 'Color', [0.184 0.427 0.698], 'LineWidth', 4, 'DisplayName', '$y(t)$');
plot(0, 0, 'o', 'MarkerSize', 10, 'MarkerFaceColor', [0.165 0.616 0.624], ...
    'MarkerEdgeColor', [0.165 0.616 0.624], 'DisplayName', '$y(0)=0$');
xlabel('$\mathrm{Time},\ t\ (\mathrm{s})$', 'Interpreter', 'latex', 'FontSize', 32);
ylabel('$\mathrm{Vertical\ position},\ y\ (\mathrm{m})$', 'Interpreter', 'latex', 'FontSize', 32);
title('$\mathrm{Model\ output\ and\ launch\ check}$', 'Interpreter', 'latex', 'FontSize', 34, 'FontWeight', 'bold');
legend('Interpreter', 'latex', 'FontSize', 28, 'Location', 'southoutside', 'Orientation', 'horizontal');
xlim([0 4]); ylim([0 22]); grid on; box off;
exportgraphics(gcf, fullfile(assetDir, 'week01_height_time.png'), 'Resolution', 300);
close(gcf);

v0Values = [20, 15];
tFlight = 2 .* v0Values ./ g;
tau = linspace(0, 1, 101);
heightComparison = zeros(numel(tau), numel(v0Values));
for k = 1:numel(v0Values)
    tk = tau .* tFlight(k);
    heightComparison(:, k) = v0Values(k) .* tk - 0.5 .* g .* tk .^ 2;
end
save(fullfile(assetDir, 'launch_speed_comparison_data.mat'), ...
    'g', 'v0Values', 'tFlight', 'tau', 'heightComparison');
writetable(table(tau(:), heightComparison(:, 1), heightComparison(:, 2), ...
    'VariableNames', {'normalised_time', 'height_v0_20_mps', 'height_v0_15_mps'}), ...
    fullfile(assetDir, 'launch_speed_comparison_data.csv'));

makeFigure(); hold on;
plot(tau, heightComparison(:, 1), 'Color', [0.184 0.427 0.698], 'LineWidth', 4);
plot(tau, heightComparison(:, 2), 'Color', [0.788 0.541 0.086], 'LineWidth', 4);
xlabel('$\mathrm{Normalised\ time},\ t/t_{\mathrm{flight}}$', 'Interpreter', 'latex', 'FontSize', 27);
ylabel('$\mathrm{Height},\ y\ (\mathrm{m})$', 'Interpreter', 'latex', 'FontSize', 27);
title('$\mathrm{Changing\ launch\ speed\ reveals\ the\ trend}$', 'Interpreter', 'latex', 'FontSize', 30, 'FontWeight', 'bold');
legend({'$v_0=20\ \mathrm{m\,s^{-1}}$', '$v_0=15\ \mathrm{m\,s^{-1}}$'}, ...
    'Interpreter', 'latex', 'FontSize', 23, 'Location', 'southoutside', 'Orientation', 'horizontal');
xlim([0 1]); ylim([0 22]); grid on; box off;
exportgraphics(gcf, fullfile(assetDir, 'launch_speed_comparison.png'), 'Resolution', 220);
close(gcf);
end

function makeFigure()
fig = figure('Visible', 'off', 'Color', 'white', 'Position', [100 100 1540 830]);
ax = axes(fig); %#ok<LAXES>
set(ax, 'FontName', 'Helvetica', 'FontSize', 30, 'LineWidth', 1.8, ...
    'TickLabelInterpreter', 'latex', 'XColor', [0.247 0.294 0.341], ...
    'YColor', [0.247 0.294 0.341], 'GridColor', [0.867 0.898 0.925], ...
    'GridAlpha', 1);
end
