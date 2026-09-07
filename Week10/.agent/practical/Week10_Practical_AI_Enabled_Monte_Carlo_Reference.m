% Hidden instructor reference and baseline QA for Week 10 practical.

% Context A: photon detection.
photons_per_trial = 40;
detection_probability = 0.65;
expected_detected_count = photons_per_trial*detection_probability;
rng(1010,'twister')
photon_trials = 2000;
photon_detected = rand(photons_per_trial,photon_trials) < detection_probability;
detected_count = sum(photon_detected,1);
photon_mean_count = mean(detected_count);
photon_spread_count = std(detected_count,1);
assert(abs(expected_detected_count-26) < 1e-12)
assert(abs(photon_mean_count-26) < 0.3)
assert(photon_spread_count > 2.5 && photon_spread_count < 3.5)
rng(1010,'twister')
photon_detected_repeat = rand(photons_per_trial,photon_trials) < detection_probability;
assert(isequal(photon_detected,photon_detected_repeat))

% Context B: shielding transmission.
attenuation_per_cm = 0.80;
shield_thickness_cm = 1.5;
reference_transmission = exp(-attenuation_per_cm*shield_thickness_cm);
assert(abs(reference_transmission-exp(-1.2)) < 1e-12)
rng(2020,'twister')
maximum_particles = 20000;
transmitted = rand(1,maximum_particles) < reference_transmission;
particle_counts = [200 2000 20000];
estimated_transmission = zeros(3,1);
absolute_transmission_error = zeros(3,1);
for k = 1:numel(particle_counts)
    N = particle_counts(k);
    estimated_transmission(k) = mean(transmitted(1:N));
    absolute_transmission_error(k) = abs(estimated_transmission(k)-reference_transmission);
end
assert(absolute_transmission_error(end) < 0.02)
faulty_threshold = attenuation_per_cm*shield_thickness_cm;
rng(2020,'twister')
faulty_transmitted = rand(1,maximum_particles) < faulty_threshold;
assert(faulty_threshold > 1)
assert(mean(faulty_transmitted) == 1)

% Context C: two-dimensional random walk.
walk_steps = 80;
walk_step_mm = 0.5;
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
assert(abs(mean_final_x_mm) < 0.5)
assert(abs(mean_final_y_mm) < 0.5)
assert(abs(rms_radial_displacement_mm-expected_rms_radial_mm) < 0.5)

reference_summary = table(photon_mean_count,photon_spread_count,reference_transmission, ...
    estimated_transmission(end),absolute_transmission_error(end),mean_final_x_mm,mean_final_y_mm, ...
    rms_radial_displacement_mm,expected_rms_radial_mm)
disp('WEEK10_PRACTICAL_REFERENCE_PASSED')
