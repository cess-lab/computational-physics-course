% Generate a strict MATLAB plot for Slide 10.
% The F = 5 N markers are plotted from the same model values as the curves
% so their centres lie on the numerical strokes, not on an AI-redrawn graph.

out_file = fullfile(fileparts(mfilename('fullpath')), ...
    'week04_hooke_parameter_sweep_F5_markers.png');

F_N = 0:0.5:10;
k_Npm = [50 100 200];
extension_m = zeros(length(k_Npm), length(F_N));
for case_id = 1:length(k_Npm)
    extension_m(case_id,:) = F_N./k_Npm(case_id);
end

fig = figure('Visible','off','Color','w');
ax = axes(fig);
hold(ax,'on');
curve = plot(ax, F_N, extension_m.', 'LineWidth', 2);
for case_id = 1:length(k_Npm)
    scatter(ax, 5, 5/k_Npm(case_id), 75, curve(case_id).Color, ...
        'filled', 'MarkerEdgeColor',[0.15 0.15 0.15], 'LineWidth',0.6);
end
hold(ax,'off');
grid(ax,'on');
xlim(ax,[0 10]);
ylim(ax,[0 0.2]);
xlabel(ax,'Applied force, F (N)');
ylabel(ax,'Spring extension, x (m)');
title(ax,'Hooke''s Law Parameter Sweep: Effect of Spring Stiffness');
legend(ax,'k = 50 N/m','k = 100 N/m','k = 200 N/m', ...
    'Location','northwest');
% Use the same axes export and resolution as the approved strict source plot.
exportgraphics(ax, out_file, 'Resolution',180);
close(fig);
