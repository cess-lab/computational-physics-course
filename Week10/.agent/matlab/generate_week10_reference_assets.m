% Generate strict Week 10 reference evidence and plots from the locked random-walk lecture model.
asset_dir = fileparts(mfilename('fullpath'));
note_asset_dir = fullfile(asset_dir,'..','learning-notes','assets');
if ~isfolder(note_asset_dir)
    mkdir(note_asset_dir)
end

n_steps = 100;
step_length_mm = 1;
maximum_trials = 10000;
sample_sizes = [100 1000 10000];
rng(4605,'twister')
random_draw = rand(n_steps,maximum_trials);
step_direction = 2*(random_draw >= 0.5)-1;
step_mm = step_length_mm*step_direction;
all_trajectories_mm = cumsum(step_mm,1);
final_position_mm = all_trajectories_mm(end,:);
trajectory_mm = [0; all_trajectories_mm(:,1)];
step_number = (0:n_steps)';

mean_final_position_mm = mean(final_position_mm);
spread_final_position_mm = std(final_position_mm,1);
expected_walk_spread_mm = step_length_mm*sqrt(n_steps);
spread_ratio = spread_final_position_mm/expected_walk_spread_mm;

n_cases = numel(sample_sizes);
mean_by_sample_mm = zeros(n_cases,1);
spread_by_sample_mm = zeros(n_cases,1);
standard_error_mean_mm = zeros(n_cases,1);
for k = 1:n_cases
    M = sample_sizes(k);
    subset_mm = final_position_mm(1:M);
    mean_by_sample_mm(k) = mean(subset_mm);
    spread_by_sample_mm(k) = std(subset_mm,1);
    standard_error_mean_mm(k) = spread_by_sample_mm(k)/sqrt(M);
end

summary_table = table(sample_sizes',mean_by_sample_mm,spread_by_sample_mm,standard_error_mean_mm, ...
    'VariableNames',{'Trials','MeanFinalPosition_mm','SpreadFinalPosition_mm','StandardErrorMean_mm'});
writetable(summary_table,fullfile(asset_dir,'week10_random_walk_sample_summary.csv'))

locked_summary = table(n_steps,step_length_mm,maximum_trials,mean_final_position_mm,spread_final_position_mm,expected_walk_spread_mm,spread_ratio, ...
    'VariableNames',{'StepsPerTrial','StepLength_mm','Trials','MeanFinalPosition_mm','SpreadFinalPosition_mm','ExpectedSpread_mm','SpreadRatio'});
writetable(locked_summary,fullfile(asset_dir,'week10_random_walk_locked_summary.csv'))

f_traj = figure('Visible','off');
plot(step_number,trajectory_mm,'-o','MarkerIndices',1:10:numel(step_number),'LineWidth',1.4)
xlabel('Step number')
ylabel('Position, x (mm)')
title('One 100-Step Random-Walk Trajectory')
grid on
exportgraphics(f_traj,fullfile(asset_dir,'week10_random_walk_trajectory.png'),'Resolution',180)
close(f_traj)

f_hist = figure('Visible','off');
histogram(final_position_mm,'BinMethod','integers')
xlabel('Final position after 100 steps (mm)')
ylabel('Number of trials')
title('Final Positions From 10,000 Random-Walk Trials')
grid on
exportgraphics(f_hist,fullfile(asset_dir,'week10_random_walk_histogram.png'),'Resolution',180)
close(f_hist)

f_sample = figure('Visible','off');
semilogx(sample_sizes,mean_by_sample_mm,'o-','LineWidth',1.5)
yline(0,'--')
xlabel('Number of repeated trials')
ylabel('Estimated mean final position (mm)')
title('Estimated Mean Versus Monte Carlo Sample Size')
grid on
exportgraphics(f_sample,fullfile(asset_dir,'week10_random_walk_sample_size.png'),'Resolution',180)
close(f_sample)

copyfile(fullfile(asset_dir,'week10_random_walk_trajectory.png'),fullfile(note_asset_dir,'week10_random_walk_trajectory.png'))
copyfile(fullfile(asset_dir,'week10_random_walk_histogram.png'),fullfile(note_asset_dir,'week10_random_walk_histogram.png'))
copyfile(fullfile(asset_dir,'week10_random_walk_sample_size.png'),fullfile(note_asset_dir,'week10_random_walk_sample_size.png'))

assert(all(abs(step_mm(:)) == step_length_mm))
assert(all(mod(final_position_mm,2*step_length_mm) == 0))
assert(abs(mean_final_position_mm) < 0.5)
assert(abs(spread_final_position_mm-expected_walk_spread_mm) < 0.5)
disp(summary_table)
disp(locked_summary)
disp('WEEK10_REFERENCE_ASSETS_PASSED')
