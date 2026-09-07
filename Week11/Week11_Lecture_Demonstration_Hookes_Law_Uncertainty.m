%[text] # Week 11 Lecture Demonstration: Sensitivity and Uncertainty with Hooke's Law
%[text] **LECTURE DEMONSTRATION**
%[text] PHY4605 Physics-First Reproducible MATLAB Notebook
%%
%[text] ## Physical Question and Learning Outcomes
%[text] A spring follows Hooke's law, $x=F/k$. If the applied force is known but the spring stiffness is only known within a plausible range, what range of extension should we report, and what kind of uncertainty does that range represent?
%[text] **Learning outcomes.** By the end of this demonstration, you can convert one uncertain input range into a baseline/lower/upper one-at-a-time calculation, report and interpret the resulting output range, and distinguish parameter uncertainty from numerical approximation error and model limitation.
%%
%[text] ## Model, Assumptions, Variables, and Units
%[text] Reuse the ideal linear spring from Week 4. Within its elastic range, $F=kx$, so $x=F/k$. The applied force is fixed at `10 N` for the Core route. The baseline stiffness is `100 N/m`, while a plausible stiffness range from `95 N/m` to `105 N/m` represents uncertainty in the input parameter rather than three different springs chosen for a design study.
force_baseline_N = 10;
stiffness_baseline_Npm = 100;
stiffness_cases_Npm = [95 100 105];
%%
%[text] ## Predict Before Computing
%[text] At fixed force, $x=F/k$ says that a smaller stiffness produces a larger extension. Therefore the `95 N/m` case should give the largest extension, the `100 N/m` case should give the baseline extension, and the `105 N/m` case should give the smallest extension. The uncertainty range should therefore lie on both sides of `0.10 m`.
%%
%[text] ## Algorithm Before MATLAB
%[text] Use one-at-a-time uncertainty reasoning: (1) define the baseline model and baseline input, (2) define a plausible lower and upper value for one uncertain input, (3) hold the equation and every other input fixed, (4) evaluate the lower, baseline, and upper cases, (5) report the minimum and maximum output, (6) compare the baseline with an independent calculation, and (7) state which limitation the range represents.
%%
%[text] ## Evaluate the Stiffness Uncertainty Range
%[text] The model is deterministic: each stiffness value gives one extension. The three extension values form evidence for the output range caused by the supplied stiffness uncertainty.
extension_cases_m = force_baseline_N./stiffness_cases_Npm;
extension_baseline_m = force_baseline_N/stiffness_baseline_Npm;
extension_min_m = min(extension_cases_m);
extension_max_m = max(extension_cases_m);
extension_span_m = extension_max_m-extension_min_m;
stiffness_uncertainty_table = table(stiffness_cases_Npm.',extension_cases_m.', ...
    'VariableNames',{'Stiffness_N_per_m','Extension_m'})
%%
%[text] ## Plot the Baseline, Lower, and Upper Cases
%[text] Plot stiffness on the horizontal axis and extension on the vertical axis. These are not repeated random trials: they are three controlled evaluations of the same model at the supplied plausible input values.
plot(stiffness_cases_Npm,extension_cases_m,'o-','LineWidth',1.6,'MarkerSize',7)
xlabel('Spring stiffness, k (N/m)')
ylabel('Predicted extension, x (m)')
title('Extension Range from Stiffness Uncertainty')
grid on
%%
%[text] ## Report an Output Range Without False Precision
%[text] The baseline extension is `0.10000 m`, but the supplied stiffness range gives extensions from about `0.09524 m` to `0.10526 m`. Reporting only `0.10000 m` would hide the input uncertainty. A practical statement is: "For a 10 N load and stiffness between 95 and 105 N/m, the ideal Hooke model predicts an extension of about 0.095 to 0.105 m."
reported_range_m = [extension_min_m extension_max_m]
maximum_departure_from_baseline_m = max(abs(extension_cases_m-extension_baseline_m))
%%
%[text] ## Core Validation: Check the Baseline Independently
%[text] At the baseline, $x=10/100=0.10$ m exactly for the ideal model. This hand-calculated reference checks that the code is evaluating the intended equation and units.
reference_baseline_m = 10/100;
baseline_check_passed = abs(extension_baseline_m-reference_baseline_m) < 1e-12
assert(baseline_check_passed,'Baseline Hooke-law validation failed.')
%%
%[text] ## Distinguish Three Sources of Limitation
%[text] **Parameter uncertainty** is uncertainty in an input such as `k`; it produces the output range calculated above. **Numerical approximation error** comes from approximating a mathematical operation numerically, such as a finite timestep or finite-difference step. This direct Hooke calculation has no meaningful discretisation error. **Model limitation** comes from the assumptions of the equation itself: a real spring may become nonlinear or permanently deform outside its elastic range. These sources answer different questions and should not be merged into one vague word such as "error".
numerical_method_statement = "Direct algebraic evaluation: no timestep, grid, or iterative approximation in the Core calculation";
model_limitation_statement = "Hooke's law assumes an ideal linear elastic spring within its elastic range";
%%
%[text] ## Working Exposure: Compare Force Uncertainty One at a Time
%[text] Now hold stiffness fixed at `100 N/m` and vary only the applied force from `9.8 N` to `10.2 N`. This second one-at-a-time calculation lets us compare which supplied input uncertainty changes the extension more, without varying force and stiffness simultaneously.
force_cases_N = [9.8 10.0 10.2];
extension_from_force_m = force_cases_N./stiffness_baseline_Npm;
force_range_m = [min(extension_from_force_m) max(extension_from_force_m)];
force_span_m = diff(force_range_m);
stiffness_span_m = extension_span_m;
one_at_a_time_summary = table(["Stiffness";"Force"],[stiffness_span_m;force_span_m], ...
    'VariableNames',{'UncertainInput','FullOutputSpan_m'})
%%
%[text] ## Working Exposure: Supplied Percentage Sensitivity
%[text] A supplied normalized sensitivity compares fractional output change with fractional input change. Near the baseline, use $S\approx(\Delta x/x_0)/(\Delta p/p_0)$. The Hooke model gives approximately `S = -1` for stiffness and `S = +1` for force: a 1 percent stiffness increase gives about a 1 percent extension decrease, while a 1 percent force increase gives a 1 percent extension increase. Interpreting this supplied measure is Working exposure; deriving it independently is Stretch.
stiffness_fractional_change = (stiffness_cases_Npm(3)-stiffness_cases_Npm(1))/(2*stiffness_baseline_Npm);
extension_fractional_change_from_k = (extension_cases_m(3)-extension_cases_m(1))/(2*extension_baseline_m);
normalized_sensitivity_k = extension_fractional_change_from_k/stiffness_fractional_change
force_fractional_change = (force_cases_N(3)-force_cases_N(1))/(2*force_baseline_N);
extension_fractional_change_from_F = (extension_from_force_m(3)-extension_from_force_m(1))/(2*extension_baseline_m);
normalized_sensitivity_F = extension_fractional_change_from_F/force_fractional_change
%%
%[text] ## Working Exposure: Supplied First-Order Propagation Formula
%[text] If the force and stiffness uncertainties are treated as independent small standard uncertainties, a supplied first-order relation for $x=F/k$ is $u_x/x\approx\\sqrt{(u_F/F)^2+(u_k/k)^2}$. With `u_F = 0.2 N` and `u_k = 5 N/m`, the combined estimate is about `5.39%` of the baseline extension. This formula is supplied for interpretation only; deriving propagation equations is not Core Week 11 work.
u_force_N = 0.2;
u_stiffness_Npm = 5;
relative_combined_uncertainty = sqrt((u_force_N/force_baseline_N)^2 + ...
    (u_stiffness_Npm/stiffness_baseline_Npm)^2);
first_order_u_extension_m = extension_baseline_m*relative_combined_uncertainty
%%
%[text] ## Physical Interpretation and Practical Conclusion
%[text] For the supplied ranges, stiffness uncertainty produces a wider one-at-a-time extension span than force uncertainty. The calculation does not prove that the real spring follows Hooke's law perfectly; it only propagates the stated input uncertainty through the stated model. The practical conclusion should therefore include the model, the input range, the output range, and the main limitation rather than reporting a long string of decimal places.
%%
%[text] ## Three Takeaways
%[text] First, an uncertain input should be represented by a justified baseline and plausible range before running the model. Second, vary one uncertain input at a time when you want to attribute an output change to that input. Third, report parameter uncertainty, numerical approximation error, and model limitation separately because they describe different reasons a prediction may be imperfect.
%%
%[text] ## Reproducibility Record
%[text] Run sections from top to bottom in a fresh MATLAB R2025a-or-later session using base MATLAB. Locked Core values are `F = 10 N`, baseline `k = 100 N/m`, stiffness range `95:105 N/m` represented by `[95 100 105]`, and Hooke's law `x = F/k`. Working exposure uses `F = [9.8 10.0 10.2] N`, `u_F = 0.2 N`, and `u_k = 5 N/m`.

%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"inline"}
%---
