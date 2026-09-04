%[text] # Week 7 Lecture Demonstration: Numerical Integration of a Decaying Force
%[text] **LECTURE DEMONSTRATION**
%[text] PHY4605 Physics-First Reproducible MATLAB Notebook
%%
%[text] ## Physical Question and Learning Outcomes
%[text] A time-dependent force acts on an object and gradually decays. How can sampled force values estimate the total impulse delivered from $t=0$ to $t=2.0$ s, and how do we decide whether the numerical integral is credible?
%[text] **Learning outcomes.** By the end of this demonstration, you can connect area under a force-time curve to impulse and its unit, trace a composite trapezoidal calculation and MATLAB `trapz` call, and validate the estimate by refinement and comparison with an analytic reference.
%%
%[text] ## Model, Assumptions, Variables, and Units
%[text] Use $F(t)=F\_0\\exp(-t/\\tau)$ with a positive force direction, constant decay time, and the force model valid over the stated interval. The accumulated impulse is $J=\\int\_0^T F(t),dt$. Force is in newtons and time is in seconds, so impulse has unit N s, equivalent to kg m/s.
F0_N = 12;             % initial force (N)
tau_s = 0.8;           % decay time (s)
T_s = 2.0;             % upper integration limit (s)
coarse_intervals = 4;  % first Core resolution
%%
%[text] ## Prediction Before Computing
%[text] The force remains positive throughout the interval, so the impulse must be positive. Because the force immediately decreases below `F0_N`, the area must also be smaller than the rectangle `F0_N*T_s = 24 N s`. These are useful physical checks before seeing a numerical answer.
impulse_upper_bound_Ns = F0_N*T_s
%%
%[text] ## See the Integral as Accumulated Area
%[text] The exact force curve is smooth, but a numerical integrator only uses sampled values. With four equal intervals, five force samples define four trapezoids. Their combined area approximates the impulse.
t_curve_s = linspace(0,T_s,401);
F_curve_N = F0_N*exp(-t_curve_s/tau_s);
t_coarse_s = linspace(0,T_s,coarse_intervals+1);
F_coarse_N = F0_N*exp(-t_coarse_s/tau_s);
area(t_coarse_s,F_coarse_N,'FaceAlpha',0.22)
hold on
plot(t_curve_s,F_curve_N,'LineWidth',2)
plot(t_coarse_s,F_coarse_N,'o','MarkerSize',7,'LineWidth',1.2)
hold off
grid on
xlabel('Time, t (s)')
ylabel('Force, F (N)')
title('Impulse as Area Under a Decaying Force')
legend('Trapezoidal approximation','Force model','Sampled force values','Location','best')
%%
%[text] ## One Trapezoid in Words
%[text] For adjacent samples at `t_i` and `t_(i+1)`, approximate the force between them by a straight line. The area of that strip is the interval width multiplied by the average of the two endpoint forces: `0.5*(F_i + F_(i+1))*Delta_t`. Adding all strips gives the composite trapezoidal estimate.
dt_coarse_s = T_s/coarse_intervals;
first_trapezoid_Ns = 0.5*(F_coarse_N(1)+F_coarse_N(2))*dt_coarse_s
%%
%[text] ## Composite Trapezoidal Algorithm Before MATLAB
%[text] In words: choose the lower and upper limits; sample the independent variable at a chosen resolution; evaluate the physical quantity at those sample points; form trapezoid areas between neighbouring samples; add the areas; then repeat at a finer resolution and compare with an independent reference.
%%
%[text] ## Work the Coarse Composite Estimate
%[text] For uniform spacing, the first and last samples contribute half weight while interior samples contribute full weight. The expression below is the four-interval composite trapezoidal rule written explicitly so the weighting is visible.
J_coarse_manual_Ns = dt_coarse_s*(0.5*F_coarse_N(1) + ...
    sum(F_coarse_N(2:end-1)) + 0.5*F_coarse_N(end))
%%
%[text] ## Use MATLAB `trapz`
%[text] MATLAB's `trapz(x,y)` performs the same trapezoidal accumulation using the supplied sample coordinates. Passing the time array is important because it preserves the physical spacing and therefore the correct impulse unit.
J_coarse_trapz_Ns = trapz(t_coarse_s,F_coarse_N)
assert(abs(J_coarse_trapz_Ns-J_coarse_manual_Ns) < 1e-12, ...
    'Manual and trapz trapezoidal estimates should agree.')
%%
%[text] ## Compare Three Resolutions
%[text] Keep the force model and integration limits fixed while refining only the number of intervals. This separates numerical-resolution effects from changes in the physical problem.
interval_count = [4 8 16];
dt_s = zeros(size(interval_count));
J_trapz_Ns = zeros(size(interval_count));
for k = 1:numel(interval_count)
    n = interval_count(k);
    t_sample_s = linspace(0,T_s,n+1);
    F_sample_N = F0_N*exp(-t_sample_s/tau_s);
    dt_s(k) = T_s/n;
    J_trapz_Ns(k) = trapz(t_sample_s,F_sample_N);
end
refinement_table = table(interval_count(:),dt_s(:),J_trapz_Ns(:), ...
    'VariableNames',{'Intervals','DeltaT_s','ImpulseTrapz_Ns'})
%%
%[text] ## Analytic Reference for Validation
%[text] For this teaching model, the integral can also be evaluated analytically. That exact result is used only as an independent reference: $J\_{exact}=F\_0\\tau\[1-\\exp(-T/\\tau)\]$.
J_exact_Ns = F0_N*tau_s*(1-exp(-T_s/tau_s))
abs_error_Ns = abs(J_trapz_Ns-J_exact_Ns);
rel_error_percent = 100*abs_error_Ns/abs(J_exact_Ns);
validation_table = table(interval_count(:),dt_s(:),J_trapz_Ns(:), ...
    abs_error_Ns(:),rel_error_percent(:), ...
    'VariableNames',{'Intervals','DeltaT_s','ImpulseTrapz_Ns','AbsoluteError_Ns','RelativeError_percent'})
%%
%[text] ## Core Validation: Refinement Plus Reference Comparison
%[text] The required Week 7 evidence is not merely that `trapz` returns a number. The estimate should preserve the physical unit, remain inside the expected physical bound, move toward the reference as the sampling is refined, and have a small stated error at the finest supplied resolution.
finest_impulse_Ns = J_trapz_Ns(end)
finest_abs_error_Ns = abs_error_Ns(end)
finest_rel_error_percent = rel_error_percent(end)
assert(all(J_trapz_Ns > 0 & J_trapz_Ns < impulse_upper_bound_Ns), ...
    'Impulse estimates should satisfy the physical sign and upper-bound checks.')
assert(all(diff(abs_error_Ns) < 0), ...
    'The supplied refinements should reduce trapezoidal error for this model.')
assert(finest_rel_error_percent < 0.25, ...
    'Finest supplied trapezoidal estimate should be within 0.25 percent of the analytic reference.')
%%
%[text] ## Diagnose a Runnable but Wrong `trapz` Call
%[text] `trapz(F_coarse_N)` assumes unit spacing between samples. It therefore does not know that neighbouring force samples are separated by `0.5 s`. The code runs, but its numerical value is not the physical impulse unless the missing spacing is handled correctly.
wrong_missing_time_axis = trapz(F_coarse_N)
correct_with_time_axis_Ns = trapz(t_coarse_s,F_coarse_N)
%%
%[text] ## Working Exposure: Read a Supplied Simpson Comparison
%[text] A supplied composite Simpson result for eight intervals is `8.8124455163 N s`, compared with the exact `8.8119840132 N s`. Use this only to read a method comparison: both methods estimate the same accumulated quantity, but Week 7 Core work does not require deriving Simpson's rule or implementing several quadrature formulas independently.
J_simpson_supplied_Ns = 8.8124455163;
simpson_abs_error_Ns = abs(J_simpson_supplied_Ns-J_exact_Ns)
%%
%[text] ## Working Exposure: Read the Refinement Pattern
%[text] For this smooth force curve, halving the sample spacing from `0.50` to `0.25` to `0.125 s` reduces the trapezoidal error substantially. The table is evidence of convergence for this example. Deriving a formal quadrature error order belongs to Optional stretch.
error_reduction_factor = abs_error_Ns(1:end-1)./abs_error_Ns(2:end)
%%
%[text] ## Three Takeaways
%[text] First, a numerical integral represents physical accumulation, so its unit combines the vertical-axis unit with the horizontal-axis unit. Second, the trapezoidal rule adds areas formed from neighbouring sampled values, and MATLAB `trapz(x,y)` preserves the actual sample coordinates. Third, refine the sampling and compare with an analytic or supplied reference before trusting the accumulated result.
%%
%[text] ## Reproducibility Record
%[text] Run sections from top to bottom in a fresh MATLAB session. This demonstration requires MATLAB R2025a or later and base MATLAB only. Locked values are `F0_N=12`, `tau_s=0.8`, `T_s=2.0`, and Core interval counts `[4 8 16]`. No hidden Workspace state is required.

%[appendix]{"version":"1.0"}
