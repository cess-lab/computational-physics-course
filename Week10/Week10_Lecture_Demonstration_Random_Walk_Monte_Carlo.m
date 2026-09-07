%[text] # Week 10 Lecture Demonstration: Random Walks and Monte Carlo Sampling
%[text] **LECTURE DEMONSTRATION**
%[text] PHY4605 Physics-First Reproducible MATLAB Notebook
%%
%[text] ## Physical Question and Learning Outcomes
%[text] Imagine a small particle that receives many tiny random kicks along one line. One kick is unpredictable, but can repeated simulated paths reveal a stable physical pattern? This demonstration defines one random trial, repeats many trials, calculates mean and spread, compares sample sizes, and uses a fixed random seed when reproducibility is required.
%%
%[text] ## Predict Before Computing
%[text] Each step is equally likely to be $+1$ mm or $-1$ mm. After 100 steps, predict the average final position across many independent paths. Also predict whether every path should finish at the same position.
%%
%[text] ## Model, Trial, and Units
%[text] The simplified model is a one-dimensional symmetric random walk. The particle starts at $x=0$ mm. Every second it moves exactly one step of length $a=1$ mm, either right or left with equal probability. One Monte Carlo trial is one complete 100-step path. Repeating the trial means simulating many independent particles under the same step rule.
n_steps = 100;
step_length_mm = 1;
maximum_trials = 10000;
sample_sizes = [100 1000 10000];
%%
%[text] ## Algorithm Before MATLAB
%[text] - Set the number of steps, step length, number of repeated trials, and a reproducible random seed.
%[text] - Draw a random number for every step of every trial.
%[text] - Convert each draw into either a right step $+a$ or a left step $-a$.
%[text] - Cumulatively sum the steps to obtain each trajectory.
%[text] - Read the final position of every trial.
%[text] - Calculate the mean and spread of the final positions.
%[text] - Repeat the summary for several sample sizes and interpret what changes. \
%%
%[text] ## Fix the Random Seed When Reproducibility Matters
%[text] Random sampling should normally produce different individual outcomes. For teaching, debugging, and reproducible evidence, `rng(seed,'twister')` resets MATLAB's random-number generator to a known state. The fixed seed does not make the model non-random; it makes this particular sequence repeatable.
rng(4605,'twister')
%%
%[text] ## Generate the Random Steps
%[text] `rand(n_steps,maximum_trials)` creates independent uniform random draws between 0 and 1. Values below 0.5 become left steps and values at least 0.5 become right steps. The resulting matrix contains one 100-step trial in each column.
random_draw = rand(n_steps,maximum_trials);
step_direction = 2*(random_draw >= 0.5)-1;
step_mm = step_length_mm*step_direction;
assert(all(abs(step_mm(:)) == step_length_mm))
%%
%[text] ## Inspect One Random Trajectory
%[text] A trajectory is the cumulative position after each step. The first path is one possible physical history; another valid run could look different. The starting point is inserted explicitly at step 0.
trajectory_mm = [0; cumsum(step_mm(:,1))];
step_number = (0:n_steps)';
plot(step_number,trajectory_mm,'-o','MarkerIndices',1:10:numel(step_number),'LineWidth',1.4)
xlabel('Step number')
ylabel('Position, x (mm)')
title('One 100-Step Random-Walk Trajectory')
grid on
%%
%[text] ## Repeat the Trial Many Times
%[text] Each column already represents one independent trial. Taking a cumulative sum down each column gives every trajectory at once. The final row contains the final position after 100 steps for all 10,000 trials.
all_trajectories_mm = cumsum(step_mm,1);
final_position_mm = all_trajectories_mm(end,:);
mean_final_position_mm = mean(final_position_mm)
spread_final_position_mm = std(final_position_mm,1)
%%
%[text] ## Read the Distribution of Final Positions
%[text] Individual trials finish at different positions even though the rule is unchanged. A histogram shows how often different final positions occurred. The distribution is centred near zero because left and right steps are equally likely.
histogram(final_position_mm,'BinMethod','integers')
xlabel('Final position after 100 steps (mm)')
ylabel('Number of trials')
title('Final Positions From 10,000 Random-Walk Trials')
grid on
%%
%[text] ## Mean and Spread Answer Different Questions
%[text] The mean estimates the centre of the repeated outcomes. The spread describes how widely individual final positions vary around that centre. A mean near zero does not mean every particle finishes near zero; a sizeable spread is physically expected from accumulated random steps.
summary_10000 = table(maximum_trials,mean_final_position_mm,spread_final_position_mm, ...
    'VariableNames',{'Trials','MeanFinalPosition_mm','SpreadFinalPosition_mm'})
%%
%[text] ## Compare Three Sample Sizes
%[text] Use the first 100, 1,000, and 10,000 trials from the same reproducible simulation. The estimated mean should become more stable as more trials are included. The physical spread of individual final positions should remain of the same order because the 100-step model itself has not changed.
n_cases = numel(sample_sizes);
mean_by_sample_mm = zeros(n_cases,1);
spread_by_sample_mm = zeros(n_cases,1);
for k = 1:n_cases
    M = sample_sizes(k);
    subset_mm = final_position_mm(1:M);
    mean_by_sample_mm(k) = mean(subset_mm);
    spread_by_sample_mm(k) = std(subset_mm,1);
end
sample_size_summary = table(sample_sizes',mean_by_sample_mm,spread_by_sample_mm, ...
    'VariableNames',{'Trials','MeanFinalPosition_mm','SpreadFinalPosition_mm'})
%%
%[text] ## Visualise Sample-Size Stability
%[text] Plot the estimated mean final position against the number of trials. The points need not move monotonically toward zero because random fluctuation remains, but the estimate should generally settle closer to the symmetry prediction as the evidence grows.
semilogx(sample_sizes,mean_by_sample_mm,'o-','LineWidth',1.5)
yline(0,'--')
xlabel('Number of repeated trials')
ylabel('Estimated mean final position (mm)')
title('Estimated Mean Versus Monte Carlo Sample Size')
grid on
%%
%[text] ## Core Validation: Use Symmetry and the Step Rule
%[text] The model has no preferred direction, so the long-run mean final position should be near 0 mm. Every 100-step final position must also be an even integer number of millimetres because the difference between right and left steps has the same parity as 100. These checks use the physical rule rather than trusting the graph alone.
symmetry_check_passed = abs(mean_final_position_mm) < 0.5
step_rule_check_passed = all(mod(final_position_mm,2*step_length_mm) == 0)
assert(symmetry_check_passed)
assert(step_rule_check_passed)
%%
%[text] ## Working Exposure: Standard Error and Random-Walk Scaling
%[text] A supplied estimate of the standard error of the mean is `spread/sqrt(number of trials)`. It describes how precisely the repeated trials estimate the mean; it is not the spread of individual particles. For an ideal symmetric walk with 100 independent steps of length 1 mm, the expected final-position spread is approximately $a\\sqrt{N}=10$ mm.
standard_error_mean_mm = spread_by_sample_mm./sqrt(sample_sizes')
expected_walk_spread_mm = step_length_mm*sqrt(n_steps)
spread_ratio = spread_final_position_mm/expected_walk_spread_mm
%[text] These quantities are for interpretation. Deriving the probability distribution or the $\\sqrt{N}$ scaling is not required for the Week 10 Core route.
%%
%[text] ## Why Two Correct Runs Can Differ
%[text] If the seed is not reset, another run draws a different random sequence. Individual trajectories, histogram counts, and finite-sample means can therefore change even when the code and physical model are correct. Reproducibility means recording the random seed when an exact rerun is required; it does not mean expecting all real random experiments to give identical outcomes.
%%
%[text] ## Physical Interpretation and Reproducibility
%[text] Monte Carlo simulation replaces one deterministic trajectory with an ensemble of possible outcomes. Here the symmetry of the step rule predicts a mean near zero, while random accumulation produces a broad distribution of final positions. More repeated trials stabilise estimated summary quantities, but they do not remove the physical variability of individual paths.
%[text] Run from top to bottom in a fresh MATLAB R2025a-or-later session using base MATLAB. The model parameters, seed, sampling rule, sample sizes, validation checks, and Working-exposure reference are all supplied in this file.

%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"inline"}
%---
