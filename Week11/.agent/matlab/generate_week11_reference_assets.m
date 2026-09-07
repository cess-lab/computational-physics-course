week11_root = fileparts(fileparts(fileparts(mfilename('fullpath'))));
matlab_dir = fullfile(week11_root,'.agent','matlab');
note_asset_dir = fullfile(week11_root,'.agent','learning-notes','assets');
if ~exist(note_asset_dir,'dir')
    mkdir(note_asset_dir)
end
force_baseline_N = 10;
stiffness_baseline_Npm = 100;
stiffness_cases_Npm = [95 100 105];
extension_cases_m = force_baseline_N./stiffness_cases_Npm;
extension_baseline_m = force_baseline_N/stiffness_baseline_Npm;
extension_min_m = min(extension_cases_m);
extension_max_m = max(extension_cases_m);
extension_span_m = extension_max_m-extension_min_m;
force_cases_N = [9.8 10.0 10.2];
extension_from_force_m = force_cases_N./stiffness_baseline_Npm;
force_span_m = max(extension_from_force_m)-min(extension_from_force_m);
u_force_N = 0.2;
u_stiffness_Npm = 5;
relative_combined_uncertainty = sqrt((u_force_N/force_baseline_N)^2 + (u_stiffness_Npm/stiffness_baseline_Npm)^2);
first_order_u_extension_m = extension_baseline_m*relative_combined_uncertainty;
summary_table = table(stiffness_cases_Npm.',extension_cases_m.', ...
    'VariableNames',{'Stiffness_N_per_m','Extension_m'});
writetable(summary_table,fullfile(matlab_dir,'week11_hooke_stiffness_uncertainty.csv'));
comparison_table = table(["Stiffness";"Force"],[extension_span_m;force_span_m], ...
    'VariableNames',{'UncertainInput','FullOutputSpan_m'});
writetable(comparison_table,fullfile(matlab_dir,'week11_one_at_a_time_comparison.csv'));
figure('Visible','off');
plot(stiffness_cases_Npm,extension_cases_m,'o-','LineWidth',1.8,'MarkerSize',7)
xlabel('Spring stiffness, k (N/m)')
ylabel('Predicted extension, x (m)')
title('Extension Range from Stiffness Uncertainty')
grid on
exportgraphics(gca,fullfile(matlab_dir,'week11_hooke_stiffness_uncertainty.png'),'Resolution',180)
copyfile(fullfile(matlab_dir,'week11_hooke_stiffness_uncertainty.png'),fullfile(note_asset_dir,'week11_hooke_stiffness_uncertainty.png'));
close(gcf)
figure('Visible','off');
bar(categorical(comparison_table.UncertainInput),comparison_table.FullOutputSpan_m)
ylabel('Full extension span (m)')
title('One-at-a-Time Output Span for Supplied Input Ranges')
grid on
exportgraphics(gca,fullfile(matlab_dir,'week11_one_at_a_time_comparison.png'),'Resolution',180)
copyfile(fullfile(matlab_dir,'week11_one_at_a_time_comparison.png'),fullfile(note_asset_dir,'week11_one_at_a_time_comparison.png'));
close(gcf)
assert(abs(extension_baseline_m-0.1) < 1e-12)
assert(abs(extension_min_m-10/105) < 1e-12)
assert(abs(extension_max_m-10/95) < 1e-12)
assert(extension_span_m > force_span_m)
assert(abs(relative_combined_uncertainty-sqrt(0.02^2+0.05^2)) < 1e-12)
fid = fopen(fullfile(matlab_dir,'week11_locked_values.txt'),'w');
fprintf(fid,'baseline_extension_m=%.10f\n',extension_baseline_m);
fprintf(fid,'stiffness_output_min_m=%.10f\n',extension_min_m);
fprintf(fid,'stiffness_output_max_m=%.10f\n',extension_max_m);
fprintf(fid,'stiffness_output_span_m=%.10f\n',extension_span_m);
fprintf(fid,'force_output_min_m=%.10f\n',min(extension_from_force_m));
fprintf(fid,'force_output_max_m=%.10f\n',max(extension_from_force_m));
fprintf(fid,'force_output_span_m=%.10f\n',force_span_m);
fprintf(fid,'relative_combined_uncertainty=%.10f\n',relative_combined_uncertainty);
fprintf(fid,'first_order_u_extension_m=%.10f\n',first_order_u_extension_m);
fclose(fid);
disp('WEEK11_REFERENCE_ASSETS_PASSED')
