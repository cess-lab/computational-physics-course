%[text] # Week 10 Practical Activity: AI-Enabled Monte Carlo Challenge Set
%[text] **PRACTICAL ACTIVITY**
%[text] PHY4605 Physics-First Reproducible MATLAB Notebook
%%
%[text] ## Group Identification and Baseline
%[text] Work in your assigned group of two or three. This practical transfers Week 10 random-sampling ideas to photon detection, radiation shielding, and a two-dimensional random walk. Generative AI may help write, debug, or improve MATLAB code, but your group must record the material decision and independently check units, expected behaviour, sample-size evidence, and physical meaning. Do not submit a complete chat transcript.
group_id = "REPLACE_WITH_GROUP_ID";
group_members = "REPLACE_WITH_NAMES";
matlab_release = version('-release');
%%
%[text] ## Question 1: Define One Photon-Detection Trial
%[text] **Context A - photon detector.** During one short measurement window, 40 photons reach a detector. Each photon is detected independently with probability 0.65. One Monte Carlo trial is one complete 40-photon measurement. Predict the average detected count and state whether every trial should give exactly that count.
photons_per_trial = 40;
detection_probability = 0.65;
expected_detected_count = photons_per_trial*detection_probability;
photon_prediction = "REPLACE_WITH_EXPECTED_COUNT_AND_VARIABILITY_STATEMENT";
%[text] **Required evidence:** define one trial, give the expected count, and explain why individual trials can differ. **Defence hook:** distinguish probability 0.65 from a guarantee that exactly 65 percent of every set of 40 photons is detected.
%%
%[text] ## Question 2: Simulate Repeated Photon Counts
%[text] Reset the supplied seed, generate 2,000 repeated measurements, count detections in each trial, then display the distribution. The scaffold compares each uniform random draw with the detection probability.
rng(1010,'twister')
photon_trials = 2000;
photon_detected = rand(photons_per_trial,photon_trials) < detection_probability;
detected_count = sum(photon_detected,1);
photon_mean_count = mean(detected_count);
photon_spread_count = std(detected_count,1);
histogram(detected_count,'BinMethod','integers')
xlabel('Detected photons per trial')
ylabel('Number of trials')
title('Photon-Detection Counts Across 2,000 Trials')
grid on
photon_summary = "REPLACE_WITH_MEAN_SPREAD_AND_PHYSICAL_INTERPRETATION";
%[text] **Required evidence:** histogram, mean count, spread in counts, and one sentence interpreting the distribution. **Defence hook:** explain which code dimension represents repeated trials.
%%
%[text] ## Question 3: Compare Photon Sample Sizes
%[text] Use the first 100, 500, and 2,000 photon trials. Calculate the mean detected count and spread for each sample size. Decide which quantity should stabilise with more trials and which quantity describes real trial-to-trial variability.
photon_sample_sizes = [100 500 2000];
photon_mean_by_size = zeros(3,1);
photon_spread_by_size = zeros(3,1);
for k = 1:numel(photon_sample_sizes)
    M = photon_sample_sizes(k);
    photon_subset = detected_count(1:M);
    photon_mean_by_size(k) = mean(photon_subset);
    photon_spread_by_size(k) = std(photon_subset,1);
end
photon_sample_table = table(photon_sample_sizes',photon_mean_by_size,photon_spread_by_size, ...
    'VariableNames',{'Trials','MeanDetectedCount','SpreadDetectedCount'})
photon_sample_size_statement = "REPLACE_WITH_STABILITY_AND_VARIABILITY_JUDGEMENT";
%[text] **Required evidence:** completed table and a sentence separating stability of the estimated mean from spread of individual measurements. **Defence hook:** explain why a larger sample does not force every photon count to equal 26.
%%
%[text] ## Question 4: Reproducibility Versus Randomness
%[text] Copy the final three photon counts from the seeded run. Reset `rng(1010,'twister')`, rerun only the photon-generation scaffold, and verify that the same counts are recovered. Then change the seed to 1011 and explain why a different valid sequence is expected.
seeded_tail_counts = detected_count(end-2:end);
rng(1010,'twister')
photon_detected_repeat = rand(photons_per_trial,photon_trials) < detection_probability;
detected_count_repeat = sum(photon_detected_repeat,1);
seed_reproduction_passed = isequal(detected_count,detected_count_repeat)
rng(1011,'twister')
photon_detected_new_seed = rand(photons_per_trial,photon_trials) < detection_probability;
detected_count_new_seed = sum(photon_detected_new_seed,1);
new_seed_differs = ~isequal(detected_count,detected_count_new_seed)
reproducibility_statement = "REPLACE_WITH_SEED_AND_RANDOMNESS_EXPLANATION";
%[text] **Required evidence:** both logical checks and one sentence explaining when a fixed seed is useful. **Defence hook:** explain why a different result after changing the seed is not automatically a coding error.
%%
%[text] ## Question 5: Predict Radiation Transmission Through Shielding
%[text] **Context B - radiation shielding.** A simple attenuation model gives transmission probability $P=\\exp(-\\mu x)$, where attenuation coefficient $\\mu=0.80$ cm$^{-1}$ and shield thickness $x=1.5$ cm. Calculate the analytic reference probability before simulating particle transmission.
attenuation_per_cm = 0.80;
shield_thickness_cm = 1.5;
reference_transmission = exp(-attenuation_per_cm*shield_thickness_cm);
shield_prediction = "REPLACE_WITH_REFERENCE_PROBABILITY_AND_PHYSICAL_MEANING";
%[text] **Required evidence:** reference transmission probability and a plain-language interpretation. **Defence hook:** explain why `attenuation_per_cm*shield_thickness_cm` is dimensionless.
%%
%[text] ## Question 6: Estimate Transmission at Three Particle Counts
%[text] Reset the supplied seed and simulate whether each particle is transmitted. For 200, 2,000, and 20,000 particles, calculate the simulated transmission fraction and its absolute difference from the analytic reference. More particles should usually stabilise the estimate, although random error need not decrease monotonically in every one finite run.
rng(2020,'twister')
maximum_particles = 20000;
shield_draw = rand(1,maximum_particles);
transmitted = shield_draw < reference_transmission;
particle_counts = [200 2000 20000];
estimated_transmission = zeros(3,1);
absolute_transmission_error = zeros(3,1);
for k = 1:numel(particle_counts)
    N = particle_counts(k);
    estimated_transmission(k) = mean(transmitted(1:N));
    absolute_transmission_error(k) = abs(estimated_transmission(k)-reference_transmission);
end
shield_sample_table = table(particle_counts',estimated_transmission,absolute_transmission_error, ...
    'VariableNames',{'Particles','EstimatedTransmission','AbsoluteError'})
shield_validation_statement = "REPLACE_WITH_SAMPLE_SIZE_AND_REFERENCE_JUDGEMENT";
%[text] **Required evidence:** table, comparison with the analytic reference, and a cautious sample-size conclusion. **Defence hook:** explain why analytic agreement is a stronger validation check than a smooth-looking graph.
%%
%[text] ## Question 7: Diagnose a Probability Defect
%[text] A faulty version uses `rand < attenuation_per_cm*shield_thickness_cm` as the transmission rule. Diagnose the defect before changing the code. The threshold is 1.2, which exceeds the valid probability range and would transmit every particle in this scaffold.
faulty_threshold = attenuation_per_cm*shield_thickness_cm;
rng(2020,'twister')
faulty_transmitted = rand(1,maximum_particles) < faulty_threshold;
faulty_estimated_transmission = mean(faulty_transmitted)
probability_range_check_passed = reference_transmission >= 0 && reference_transmission <= 1
fault_diagnosis = "REPLACE_WITH_DEFECT_CAUSE_CORRECTION_AND_PHYSICAL_EFFECT";
%[text] **Required evidence:** identify why the threshold is invalid as a probability, state the correct expression, and explain the physical effect of the defect. **Defence hook:** distinguish the dimensionless exponent `mu*x` from the probability `exp(-mu*x)`.
%%
%[text] ## Question 8: Build One Two-Dimensional Random Walk
%[text] **Context C - two-dimensional diffusion-style walk.** A particle takes 80 steps of length 0.5 mm. Each step is equally likely to point east, west, north, or south. Use the supplied integer direction scaffold and plot one trajectory. One trial is one complete 80-step path.
rng(3030,'twister')
walk_steps = 80;
walk_step_mm = 0.5;
direction_code = randi(4,walk_steps,1);
dx_mm = walk_step_mm*((direction_code == 1)-(direction_code == 2));
dy_mm = walk_step_mm*((direction_code == 3)-(direction_code == 4));
x_mm = [0; cumsum(dx_mm)];
y_mm = [0; cumsum(dy_mm)];
plot(x_mm,y_mm,'-o','MarkerIndices',1:8:numel(x_mm),'LineWidth',1.3)
xlabel('x position (mm)')
ylabel('y position (mm)')
title('One 80-Step Two-Dimensional Random Walk')
axis equal
grid on
walk_trajectory_statement = "REPLACE_WITH_ONE_TRIAL_DEFINITION_AND_PATH_INTERPRETATION";
%[text] **Required evidence:** labelled trajectory and explanation of one trial. **Defence hook:** trace one direction code into its `dx` and `dy` step.
%%
%[text] ## Question 9: Repeat the Two-Dimensional Walk
%[text] Repeat 1,000 independent 80-step paths using a supplied vectorised scaffold. Calculate final `x` and `y`, mean final position, and root-mean-square radial displacement. Symmetry predicts both coordinate means near zero. The supplied ideal-walk reference for RMS radial displacement is $a\\sqrt{N}$.
rng(3031,'twister')
walk_trials = 1000;
direction_matrix = randi(4,walk_steps,walk_trials);
dx_matrix_mm = walk_step_mm*((direction_matrix == 1)-(direction_matrix == 2));
dy_matrix_mm = walk_step_mm*((direction_matrix == 3)-(direction_matrix == 4));
final_x_mm = sum(dx_matrix_mm,1);
final_y_mm = sum(dy_matrix_mm,1);
radial_displacement_mm = hypot(final_x_mm,final_y_mm);
mean_final_x_mm = mean(final_x_mm);
mean_final_y_mm = mean(final_y_mm);
rms_radial_displacement_mm = sqrt(mean(radial_displacement_mm.^2));
expected_rms_radial_mm = walk_step_mm*sqrt(walk_steps);
walk_validation_table = table(mean_final_x_mm,mean_final_y_mm,rms_radial_displacement_mm,expected_rms_radial_mm)
walk_validation_statement = "REPLACE_WITH_SYMMETRY_AND_SCALING_JUDGEMENT";
%[text] **Required evidence:** coordinate means, RMS radial displacement, comparison with the supplied reference, and a physical interpretation. **Defence hook:** explain why mean `x` and mean `y` near zero can coexist with a nonzero RMS radial displacement.
%%
%[text] ## Question 10: Compare Contexts, Record AI Decisions, and Check Capstone Progress
%[text] Complete the cross-context evidence table. For each context, define one random trial, state the repeated output, identify one validation check, and describe what larger sample size improves. Then record a concise AI decision and independent checks. Finally record the Week 10 capstone process checkpoint: current model and method, validation evidence, one reproducibility action, and the next unresolved risk. This is process evidence, not a new graded milestone.
context_comparison = table(["Photon detection";"Shield transmission";"2D random walk"], ...
    ["40-photon measurement";"one particle transmission event";"80-step path"], ...
    ["detected count";"transmission fraction";"final position / radius"], ...
    ["REPLACE_WITH_PHOTON_CHECK";"REPLACE_WITH_SHIELD_CHECK";"REPLACE_WITH_WALK_CHECK"], ...
    ["REPLACE_WITH_PHOTON_SAMPLE_EFFECT";"REPLACE_WITH_SHIELD_SAMPLE_EFFECT";"REPLACE_WITH_WALK_SAMPLE_EFFECT"], ...
    'VariableNames',{'Context','OneTrial','RepeatedOutput','ValidationCheck','LargerSampleImproves'})
ai_tool_used = "REPLACE_WITH_TOOL_OR_NO_AI_USED";
ai_request = "REPLACE_WITH_CONCISE_REQUEST";
ai_decision = "REPLACE_WITH_ACCEPTED_MODIFIED_OR_REJECTED_DECISION";
independent_checks = "REPLACE_WITH_UNITS_REFERENCE_SEED_SAMPLE_SIZE_AND_PHYSICAL_CHECKS";
fresh_session_confirmation = "REPLACE_WITH_MATLAB_RELEASE_AND_TOP_TO_BOTTOM_RUN_CONFIRMATION";
capstone_physical_model = "REPLACE_WITH_CURRENT_PHYSICAL_MODEL";
capstone_method = "REPLACE_WITH_CURRENT_NUMERICAL_OR_DATA_METHOD";
capstone_validation_status = "REPLACE_WITH_VALIDATION_EVIDENCE";
capstone_reproducibility_action = "REPLACE_WITH_SEED_DATA_CODE_OR_RUN_RECORD_ACTION";
capstone_next_risk = "REPLACE_WITH_NEXT_UNRESOLVED_RISK_OR_LIMITATION";
%[text] **Required evidence:** completed comparison table, concise AI decision record, independent checks, fresh-session confirmation, and Week 10 capstone process checkpoint. **Defence hook:** explain why a reproducible random seed does not replace physical validation.
%%
%[text] ## Submission and Individual Defence
%[text] Submit one completed group file through the Week 10 Google Classroom practical assignment only after running it from the top in a fresh MATLAB session. After group evidence is locked, one challenge slot and one group member are selected. Use a distinct parameter or defect variant when a slot is reused. The selected member explains the model, traces the random-sampling code or output, and answers a validation or sample-size follow-up. Every member completes one recorded defence before any second selection; an absence remains pending until a recorded make-up defence is completed.
%[text] Do not submit complete AI chat histories. Submit the concise AI decision record and independent checks only.
%%
%[text] ## Reproducibility Record
%[text] This practical requires MATLAB R2025a or later and base MATLAB only. Run it top to bottom in a fresh session before adding group evidence and again before submission. The supplied seeds, physical parameters, random-sampling scaffolds, sample sizes, references, and validation checks make the baseline reproducible.

%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"inline"}
%---
