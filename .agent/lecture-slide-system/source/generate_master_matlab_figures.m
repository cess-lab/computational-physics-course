function generate_master_matlab_figures()
%GENERATE_MASTER_MATLAB_FIGURES Build retained numerical evidence for the PHY4605 master.
% The script saves source data and 1920-by-1080-ready PNG figures.  All visible
% MATLAB figure text explicitly uses the LaTeX interpreter.

thisFile = mfilename('fullpath');
sourceDir = fileparts(thisFile);
systemDir = fileparts(sourceDir);
assetDir = fullfile(systemDir, 'assets', 'matlab-figures');
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

makeFigure(fullfile(assetDir, 'height_time_evidence.png'));
plot(t, y, 'Color', [0.184 0.427 0.698], 'LineWidth', 4);
xlabel('$\mathrm{Time},\ t\ (\mathrm{s})$', 'Interpreter', 'latex', 'FontSize', 27);
ylabel('$\mathrm{Height},\ y\ (\mathrm{m})$', 'Interpreter', 'latex', 'FontSize', 27);
title('$\mathrm{Vertical\ motion:\ height\ versus\ time}$', 'Interpreter', 'latex', 'FontSize', 30, 'FontWeight', 'bold');
xlim([0 4]); ylim([0 22]);
grid on; box off;
exportgraphics(gcf, fullfile(assetDir, 'height_time_evidence.png'), 'Resolution', 220);
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

makeFigure(fullfile(assetDir, 'launch_speed_comparison.png'));
hold on;
plot(tau, heightComparison(:, 1), 'Color', [0.184 0.427 0.698], 'LineWidth', 4);
plot(tau, heightComparison(:, 2), 'Color', [0.788 0.541 0.086], 'LineWidth', 4);
xlabel('$\mathrm{Normalised\ time},\ t/t_{\mathrm{flight}}$', 'Interpreter', 'latex', 'FontSize', 27);
ylabel('$\mathrm{Height},\ y\ (\mathrm{m})$', 'Interpreter', 'latex', 'FontSize', 27);
title('$\mathrm{Changing\ launch\ speed\ reveals\ the\ trend}$', 'Interpreter', 'latex', 'FontSize', 30, 'FontWeight', 'bold');
legend({'$v_0=20\ \mathrm{m\,s^{-1}}$', '$v_0=15\ \mathrm{m\,s^{-1}}$'}, ...
    'Interpreter', 'latex', 'FontSize', 23, 'Location', 'southoutside', 'Orientation', 'horizontal');
xlim([0 1]); ylim([0 22]);
grid on; box off;
exportgraphics(gcf, fullfile(assetDir, 'launch_speed_comparison.png'), 'Resolution', 220);
close(gcf);
end

function makeFigure(outputPath)
fig = figure('Visible', 'off', 'Color', 'white', 'Position', [100 100 1540 830]);
ax = axes(fig); %#ok<LAXES>
set(ax, 'FontName', 'Helvetica', 'FontSize', 24, 'LineWidth', 1.8, ...
    'TickLabelInterpreter', 'latex', 'XColor', [0.247 0.294 0.341], ...
    'YColor', [0.247 0.294 0.341], 'GridColor', [0.867 0.898 0.925], ...
    'GridAlpha', 1);
if nargin > 0 %#ok<INUSD>
end
end
