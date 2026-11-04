%[text] # Numerical Algorithms: Turn physical reasoning into pseudocode, loops, and fixes
%[text] **LECTURE DEMONSTRATION**
%[text] PHY4605 Physics-First Reproducible MATLAB Notebook
%%
%[text] ## Physical Question and Learning Outcomes
%[text] A ball is launched straight upward. We already know its position equation. This week, the question is: how can MATLAB calculate one position at a time in a clear, checkable order?
%[text] **Learning outcomes.** By the end of this demonstration, you can turn a familiar equation into short pseudocode, trace a `for` loop, and use evidence to diagnose one clear defect.
%%
%[text] ## Model, Assumptions, and Prediction
%[text] Choose upward as positive. Air resistance is neglected and gravity is constant. In words: position equals the starting position plus the upward launch contribution minus the downward gravity contribution.
%[text] The model is $y(t)=y\_0+v\_0t-\\frac{1}{2}gt^2$. Predict the graph before computing: the ball rises, slows, reaches a highest point, then falls. At 0 s its position must be 0 m.
y0_m = 0;          % starting vertical position (m)
v0_mps = 20;       % upward launch velocity (m s^-1)
g_mps2 = 9.81;     % gravitational acceleration magnitude (m s^-2)
t_s = 0:0.5:4;     % ordered time samples (s)
n_samples = numel(t_s)
%%
%[text] ## Decompose the Computation
%[text] Before writing MATLAB, separate the task into four jobs. **Input:** the parameters and ordered times. **Calculation:** evaluate the position equation once for each time. **Output:** the stored positions and a labelled graph. **Check:** confirm the known starting value.
%[text] **Guided pseudocode:** (1) store the input values; (2) make space for one position per time; (3) start at the first time; (4) calculate and store one position; (5) move to the next time; (6) stop after the last time; (7) plot and check the result.
%%
%[text] ## Read the Loop Pattern
%[text] A loop repeats a short calculation. `sample_index` begins at 1, then takes every whole-number value up to `n_samples`. During each pass, `t_s(sample_index)` is the current time and `y_m(sample_index)` is the storage location for the matching position.
%[text] The first two hand traces are shown as values: at index 1, time is 0 s and position is 0 m; at index 2, time is 0.5 s and position is 8.77375 m. Notice that MATLAB indexing begins at 1.
first_index = 1;
second_index = 2;
first_time_s = t_s(first_index)
second_time_s = t_s(second_index)
first_position_m = y0_m + v0_mps*t_s(first_index) - 0.5*g_mps2*t_s(first_index)^2
second_position_m = y0_m + v0_mps*t_s(second_index) - 0.5*g_mps2*t_s(second_index)^2
%%
%[text] ## Compute One Position Per Loop Pass
%[text] The first line preallocates an array of zeros with one location for each time. The loop then fills exactly one location on each pass. Inside this loop, each selected time is a scalar, so ordinary `*` and `^` are correct.
y_m = zeros(size(t_s));
for sample_index = 1:n_samples
    current_time_s = t_s(sample_index);
    y_m(sample_index) = y0_m + v0_mps*current_time_s ...
        - 0.5*g_mps2*current_time_s^2;
end
position_at_start_m = y_m(1)
position_at_1s_m = y_m(3)
%%
%[text] ## Bounded Completion Checkpoint
%[text] Cover the right-hand side below, then say it in words: use the current time, calculate one vertical position, and store it in the matching location. The completed line is supplied so the lecture can run without student typing.
completed_update = y0_m + v0_mps*t_s(3) - 0.5*g_mps2*t_s(3)^2
%[text] The index `3` corresponds to 1.0 s because the time array advances by 0.5 s from a first entry at 0 s. The result should match `position_at_1s_m`.
assert(abs(completed_update - position_at_1s_m) < 1e-12, ...
    'The completed update does not match the stored position.')
%%
%[text] ## Plot and Interpret the Output
%[text] Plot the stored positions after the loop has finished. The curve should agree with the prediction: it rises first, bends downward because gravity is downward, and then returns toward the starting height.
plot(t_s,y_m,'-o','LineWidth',2.2,'Color',[0.05 0.26 0.47])
grid on
xlabel('Time, t (s)')
ylabel('Vertical position, y (m)')
title('Loop-Computed Position of a Ball Launched Upward')
%%
%[text] ## Core Validation: Known Initial Value
%[text] At the first stored time, `t_s(1)=0 s`, the position must equal the stated initial position. This check is known before the code runs, so it can reveal an indexing or physical-model mistake.
assert(abs(y_m(1)-y0_m) < 1e-12,'Initial-position validation failed.')
hold on
plot(t_s(1),y_m(1),'o','MarkerSize',8,'MarkerFaceColor',[0.00 0.50 0.45], ...
    'MarkerEdgeColor',[0.00 0.50 0.45])
legend('Loop result','Initial-value check','Location','southwest')
%%
%[text] ## Debugging Evidence: Three Different Defects
%[text] Read the defect type before changing any code. A **syntax defect** prevents MATLAB from reading the intended structure, such as a missing `end`. An **array or indexing defect** uses the wrong array location, such as storing every result in `y_m(1)`. A **physical or logical defect** changes the model meaning, such as using a plus sign for the downward gravity term.
%[text] Use the MATLAB error location and the surrounding line as evidence. Do not guess from the message alone; compare the line with the pseudocode and the physical prediction.
syntax_defect_example = "Missing end after a for loop";
array_defect_example = "y_m(1) = ... inside every loop pass";
physical_defect_example = "... + 0.5*g_mps2*current_time_s^2";
%%
%[text] ## Diagnose an Indexing Defect
%[text] The next loop is intentionally wrong: it repeatedly overwrites the first storage location. It may run without a MATLAB syntax error, but its output cannot represent the motion. Compare the number of nonzero entries with `n_samples`.
y_index_defect_m = zeros(size(t_s));
for sample_index = 1:n_samples
    current_time_s = t_s(sample_index);
    y_index_defect_m(1) = y0_m + v0_mps*current_time_s ...
        - 0.5*g_mps2*current_time_s^2;
end
nonzero_entries_with_defect = nnz(y_index_defect_m)
%[text] **Diagnosis:** replace the fixed index `(1)` with `(sample_index)` so every time has a matching storage location.
%%
%[text] ## Diagnose a Physical or Logical Defect
%[text] The next calculation uses a plus sign before the gravity term. It produces numbers, but the ball accelerates upward instead of slowing down. This disagrees with the upward-positive convention and the predicted downward-bending graph.
y_wrong_sign_m = zeros(size(t_s));
for sample_index = 1:n_samples
    current_time_s = t_s(sample_index);
    y_wrong_sign_m(sample_index) = y0_m + v0_mps*current_time_s ...
        + 0.5*g_mps2*current_time_s^2;
end
position_wrong_sign_at_4s_m = y_wrong_sign_m(end)
%[text] **Diagnosis:** the gravity contribution must be subtracted because gravity points downward while upward is positive.
%%
%[text] ## Modify One Parameter and Predict
%[text] Predict before running: if the launch speed is changed from 20 m s^-1 to 15 m s^-1, should the highest position increase or decrease? The supplied comparison reuses the same loop structure with only the input changed.
v0_lower_mps = 15;
y_lower_launch_m = zeros(size(t_s));
for sample_index = 1:n_samples
    current_time_s = t_s(sample_index);
    y_lower_launch_m(sample_index) = y0_m + v0_lower_mps*current_time_s ...
        - 0.5*g_mps2*current_time_s^2;
end
plot(t_s,y_lower_launch_m,'--','LineWidth',2.2,'Color',[0.79 0.54 0.09])
legend('Loop result: 20 m s^{-1}','Initial-value check','Loop result: 15 m s^{-1}', ...
    'Location','southwest')
%%
%[text] ## Working Exposure: Compare a Loop with an Array Expression
%[text] The vectorised expression below gives the same positions in one line. It is useful to recognise, but the Core learning job is to trace the explicit loop and diagnose its defects. Here `t_s` is an array, so the dots are required.
y_vectorised_m = y0_m + v0_mps.*t_s - 0.5*g_mps2.*t_s.^2;
maximum_loop_vector_difference_m = max(abs(y_m-y_vectorised_m))
assert(maximum_loop_vector_difference_m < 1e-12, ...
    'Loop and vectorised results should agree for this analytical model.')
%%
%[text] ## Three Takeaways
%[text] A reliable loop has a start, a current value, an update, a matching storage location, and a stopping point. Debugging uses evidence from the error location, pseudocode, output, and physics prediction. A graph becomes trustworthy only after a known-value check and a physical interpretation.
%%
%[text] ## Reproducibility Record
%[text] Run sections from top to bottom in a fresh MATLAB session. This demonstration requires MATLAB R2025a or later and base MATLAB only. Locked inputs: `y0_m=0 m`, `v0_mps=20 m s^-1`, `g_mps2=9.81 m s^-2`, and `t_s=0:0.5:4 s`.

%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"inline","rightPanelPercent":14.8}
%---
