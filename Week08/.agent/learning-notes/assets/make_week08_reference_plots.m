% Week 08 learning-note strict reference figure.
% Run from a fresh MATLAB session. This script has no Workspace dependencies.
clearvars; close all; clc

assetDir = fileparts(mfilename('fullpath'));
outputFile = fullfile(assetDir, 'week08_newton_cooling_euler_comparison.png');
reportFile = fullfile(assetDir, 'week08_endpoint_values.txt');

T_room_C = 20;
T_initial_C = 80;
tau_s = 100;
t_final_s = 300;
dt_s = [50, 25, 12.5];

tExact_s = linspace(0, t_final_s, 1001);
TExact_C = T_room_C + (T_initial_C - T_room_C) .* exp(-tExact_s/tau_s);
endpointExact_C = T_room_C + (T_initial_C - T_room_C) * exp(-t_final_s/tau_s);

colors = [0.15 0.39 0.63; 0.16 0.55 0.42; 0.86 0.42 0.12];
fig = figure('Color', 'w', 'Position', [100 100 1050 570]);
hold on
plot(tExact_s, TExact_C, 'k-', 'LineWidth', 2.4, ...
    'DisplayName', 'Exact solution');
fprintf('Exact T(300 s) = %.10f degC\n', endpointExact_C);

endpointEuler_C = zeros(size(dt_s));
for k = 1:numel(dt_s)
    dtCurrent_s = dt_s(k);
    nSteps = t_final_s / dtCurrent_s;
    tEuler_s = (0:nSteps) * dtCurrent_s;
    TEuler_C = zeros(size(tEuler_s));
    TEuler_C(1) = T_initial_C;

    for n = 1:nSteps
        rate_C_per_s = -(TEuler_C(n) - T_room_C) / tau_s;
        TEuler_C(n+1) = TEuler_C(n) + dtCurrent_s * rate_C_per_s;
    end

    endpointEuler_C(k) = TEuler_C(end);
    plot(tEuler_s, TEuler_C, 'o-', 'Color', colors(k,:), ...
        'MarkerFaceColor', 'w', 'LineWidth', 1.3, 'MarkerSize', 5, ...
        'DisplayName', sprintf('Euler, h = %g s', dtCurrent_s));
    fprintf('Euler h = %g s: T(50 s) = %.10f degC, T(100 s) = %.10f degC, T(300 s) = %.10f degC, abs. endpoint error = %.10f degC\n', ...
        dtCurrent_s, interp1(tEuler_s, TEuler_C, 50, 'linear'), ...
        interp1(tEuler_s, TEuler_C, 100, 'linear'), endpointEuler_C(k), ...
        abs(endpointEuler_C(k) - endpointExact_C));
end

yline(T_room_C, '--', 'Color', [0.35 0.35 0.35], ...
    'DisplayName', 'Room temperature');
xlim([0 t_final_s]); ylim([18 84]); grid on; box on
xlabel('Time, t (s)'); ylabel('Object temperature, T (degrees Celsius)');
title('Newton cooling: Euler timestep comparison against the exact solution');
legend('Location', 'northeast');
set(gca, 'FontName', 'Helvetica', 'FontSize', 12, 'LineWidth', 1);
exportgraphics(fig, outputFile, 'Resolution', 220);

fid = fopen(reportFile, 'w');
fprintf(fid, 'Exact T(300 s) = %.10f degC\n', endpointExact_C);
for k = 1:numel(dt_s)
    fprintf(fid, 'Euler h = %g s: T(300 s) = %.10f degC; abs. endpoint error = %.10f degC\n', ...
        dt_s(k), endpointEuler_C(k), abs(endpointEuler_C(k) - endpointExact_C));
end
fclose(fid);
