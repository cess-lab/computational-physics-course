% Generate strict Week 09 reference data and plots from the locked lecture dataset.
asset_dir = fileparts(mfilename('fullpath'));
note_asset_dir = fullfile(asset_dir,'..','learning-notes','assets');
if ~isfolder(note_asset_dir)
    mkdir(note_asset_dir)
end

I_A = (0.01:0.01:0.08)';
V_measured_V = [0.48 0.93 1.43 1.86 2.36 2.83 3.28 3.77]';
fit_coefficients = polyfit(I_A,V_measured_V,1);
R_fit_ohm = fit_coefficients(1);
offset_fit_V = fit_coefficients(2);
V_fit_at_data_V = polyval(fit_coefficients,I_A);
residual_V = V_measured_V-V_fit_at_data_V;
residual_RMSE_V = sqrt(mean(residual_V.^2));
largest_absolute_residual_V = max(abs(residual_V));

lecture_data = table(I_A,V_measured_V,V_fit_at_data_V,residual_V, ...
    'VariableNames',{'Current_A','MeasuredVoltage_V','FittedVoltage_V','Residual_V'});
writetable(lecture_data,fullfile(asset_dir,'week09_ohms_law_data.csv'))

fit_summary = table(R_fit_ohm,offset_fit_V,residual_RMSE_V,largest_absolute_residual_V, ...
    'VariableNames',{'FittedResistance_ohm','FittedOffset_V','ResidualRMSE_V','LargestAbsoluteResidual_V'});
writetable(fit_summary,fullfile(asset_dir,'week09_ohms_law_fit_summary.csv'))

f_raw = figure('Visible','off');
plot(I_A,V_measured_V,'o','MarkerSize',7,'LineWidth',1.4)
xlabel('Current, I (A)')
ylabel('Voltage, V (V)')
title('Measured Voltage-Current Data')
grid on
exportgraphics(f_raw,fullfile(asset_dir,'week09_ohms_law_raw_data.png'),'Resolution',180)
close(f_raw)

I_line_A = linspace(min(I_A),max(I_A),200);
V_line_V = polyval(fit_coefficients,I_line_A);
f_fit = figure('Visible','off');
plot(I_A,V_measured_V,'o',I_line_A,V_line_V,'-','LineWidth',1.6)
xlabel('Current, I (A)')
ylabel('Voltage, V (V)')
title('Measured Data and Fitted Ohm-Law Model')
legend('Measurements','V = R I + b fit','Location','northwest')
grid on
exportgraphics(f_fit,fullfile(asset_dir,'week09_ohms_law_fit.png'),'Resolution',180)
close(f_fit)

f_res = figure('Visible','off');
plot(I_A,residual_V,'o-','LineWidth',1.3)
yline(0,'--')
xlabel('Current, I (A)')
ylabel('Residual, measured - fitted (V)')
title('Residuals for the Straight-Line Fit')
grid on
exportgraphics(f_res,fullfile(asset_dir,'week09_ohms_law_residuals.png'),'Resolution',180)
close(f_res)

copyfile(fullfile(asset_dir,'week09_ohms_law_fit.png'), ...
    fullfile(note_asset_dir,'week09_ohms_law_fit.png'))
copyfile(fullfile(asset_dir,'week09_ohms_law_residuals.png'), ...
    fullfile(note_asset_dir,'week09_ohms_law_residuals.png'))

assert(abs(R_fit_ohm-47) < 1e-12)
assert(abs(offset_fit_V-0.0025) < 1e-12)
assert(abs(residual_RMSE_V-0.0129903810568) < 1e-10)
assert(abs(largest_absolute_residual_V-0.0225) < 1e-12)
disp(fit_summary)
disp('WEEK09_REFERENCE_ASSETS_PASSED')
