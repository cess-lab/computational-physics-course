%[text] # Week 6 Lecture Demonstration: Numerical Differentiation of Vertical Motion
%[text] **LECTURE DEMONSTRATION**
%[text] PHY4605 Physics-First Reproducible MATLAB Notebook
%%
%[text] ## Physical Question and Learning Outcomes
%[text] A projectile moves vertically according to a familiar constant-gravity position model. How can two nearby position values estimate the instantaneous vertical velocity at $t=1.0$ s, and how do we decide whether that numerical derivative is credible?
%[text] **Learning outcomes.** By the end of this demonstration, you can interpret a derivative as a physical rate with units, trace a forward-difference calculation for several supplied step sizes, and validate the numerical derivative against an analytic reference using simple error.
%%
%[text] ## Model, Assumptions, Variables, and Units
%[text] Use $y(t)=y_0+v_0t-\frac{1}{2}gt^2$ with constant gravitational acceleration and negligible air resistance. Position `y_m` is measured in metres and time `t_s` in seconds, so $dy/dt$ has unit m/s.
y0_m = 0;             % initial vertical position (m)
v0_mps = 20;          % initial vertical velocity (m/s)
g_mps2 = 9.81;        % gravitational acceleration (m/s^2)
t0_s = 1.0;           % target time for the derivative (s)
h_s = [0.5 0.2 0.1 0.05]; % supplied forward-difference step sizes (s)
%%
%[text] ## Prediction Before Computing
%[text] At $t=1.0$ s the projectile should still be moving upward, but gravity has reduced its speed from the initial 20 m/s. The derivative should therefore be positive and smaller than 20 m/s. A numerical result with the wrong sign or units would be physically suspicious.
%%
%[text] ## Analytic Reference for Validation
%[text] Differentiating the familiar position equation gives $v(t)=v_0-gt$. This analytic result is not the numerical method; it is the independent reference that lets us check the approximation.
v_exact_mps = v0_mps - g_mps2*t0_s
%%
%[text] ## See the Forward Difference as a Secant Slope
%[text] For one demonstration step, use `h = 0.5 s`. The forward difference uses the position at `t0` and the position one step later. The secant slope between those two points approximates the tangent slope at `t0`.
h_demo_s = 0.5;
t_curve_s = 0:0.02:3;
y_curve_m = y0_m + v0_mps*t_curve_s - 0.5*g_mps2*t_curve_s.^2;
y_t0_m = y0_m + v0_mps*t0_s - 0.5*g_mps2*t0_s^2;
y_t0_plus_h_m = y0_m + v0_mps*(t0_s+h_demo_s) - 0.5*g_mps2*(t0_s+h_demo_s)^2;
v_demo_mps = (y_t0_plus_h_m-y_t0_m)/h_demo_s;
y_secant_m = y_t0_m + v_demo_mps*(t_curve_s-t0_s);
y_tangent_m = y_t0_m + v_exact_mps*(t_curve_s-t0_s);
plot(t_curve_s,y_curve_m,'LineWidth',2)
hold on
plot(t_curve_s,y_secant_m,'--','LineWidth',1.5)
plot(t_curve_s,y_tangent_m,':','LineWidth',1.5)
plot([t0_s t0_s+h_demo_s],[y_t0_m y_t0_plus_h_m],'o','MarkerSize',7)
hold off
grid on
xlabel('Time, t (s)')
ylabel('Vertical position, y (m)')
title('Forward Difference: Secant Slope Versus Local Tangent')
legend('Position model','Forward secant, h = 0.5 s','Analytic tangent at t_0','Sampled positions','Location','best')
%%
%[text] ## Forward-Difference Algorithm Before MATLAB
%[text] In words: choose the target time and a positive step `h`; evaluate the model at `t0`; evaluate it again at `t0+h`; subtract the two positions; divide by the time step; then compare the estimated velocity with the analytic reference. Repeat only for the supplied step sizes.
%%
%[text] ## Work One Forward Difference
%[text] With `h = 0.5 s`, the numerator is a change in metres and the denominator is a change in seconds, so the result has unit m/s. This is an average slope over a finite interval used as an estimate of the instantaneous rate at its left endpoint.
y_now_m = y0_m + v0_mps*t0_s - 0.5*g_mps2*t0_s^2
y_next_demo_m = y0_m + v0_mps*(t0_s+h_demo_s) - 0.5*g_mps2*(t0_s+h_demo_s)^2
v_forward_demo_mps = (y_next_demo_m-y_now_m)/h_demo_s
%%
%[text] ## Compare a Small Set of Step Sizes
%[text] Now apply the same calculation to the supplied step-size array. The code changes only `h`; the physical model and target time stay fixed. A smaller `h` makes the secant more local to `t0`.
y_forward_m = y0_m + v0_mps*(t0_s+h_s) - 0.5*g_mps2*(t0_s+h_s).^2;
v_forward_mps = (y_forward_m-y_now_m)./h_s;
abs_error_mps = abs(v_forward_mps-v_exact_mps);
rel_error_percent = 100*abs_error_mps/abs(v_exact_mps);
step_comparison = table(h_s(:),v_forward_mps(:),abs_error_mps(:),rel_error_percent(:), ...
    'VariableNames',{'Step_s','ForwardVelocity_mps','AbsoluteError_mps','RelativeError_percent'})
%%
%[text] ## Interpret the Step-Size Trend
%[text] For this smooth model and this range of step sizes, the forward-difference estimate approaches the analytic value as `h` decreases. The important reading move is not "smaller is always perfect"; it is that the estimate becomes more local and the measured error becomes smaller over this supplied range.
plot(h_s,v_forward_mps,'o-','LineWidth',2)
hold on
yline(v_exact_mps,'--','Analytic reference')
hold off
grid on
xlabel('Forward-difference step, h (s)')
ylabel('Velocity estimate at t_0 (m/s)')
title('Forward-Difference Estimate Versus Step Size')
%%
%[text] ## Core Validation: Compare With the Analytic Derivative
%[text] The required Week 6 validation is to compare the numerical derivative with the analytic derivative at the same point and state a simple error. The smallest supplied step gives an estimate close to 10.19 m/s and preserves the expected positive sign.
smallest_step_estimate_mps = v_forward_mps(end)
smallest_step_abs_error_mps = abs_error_mps(end)
smallest_step_rel_error_percent = rel_error_percent(end)
assert(smallest_step_abs_error_mps < 0.30, ...
    'Forward-difference validation failed for the smallest supplied step.')
%%
%[text] ## Diagnose a Runnable but Wrong Difference
%[text] A common defect is to divide the position change by `t0` instead of by the step `h`. The expression may run and even return units resembling m/s, but it is not the slope of the two sampled points because the denominator is not their time separation.
wrong_denominator_mps = (y_next_demo_m-y_now_m)/t0_s
correct_denominator_mps = (y_next_demo_m-y_now_m)/h_demo_s
%%
%[text] ## Working Exposure: Central Difference
%[text] A supplied central difference samples equally on both sides of `t0`: `[y(t0+h)-y(t0-h)]/(2h)`. For this quadratic position model it reproduces the analytic derivative to floating-point precision. That exact agreement is special to this model and should not be assumed for every function.
h_central_s = 0.5;
y_plus_m = y0_m + v0_mps*(t0_s+h_central_s) - 0.5*g_mps2*(t0_s+h_central_s)^2;
y_minus_m = y0_m + v0_mps*(t0_s-h_central_s) - 0.5*g_mps2*(t0_s-h_central_s)^2;
v_central_mps = (y_plus_m-y_minus_m)/(2*h_central_s)
central_abs_error_mps = abs(v_central_mps-v_exact_mps)
%%
%[text] ## Working Exposure: Error Versus Step Size
%[text] The supplied curve below extends the same forward-difference calculation across several smaller `h` values. Read it qualitatively: numerical differentiation balances a finite step against finite-precision arithmetic, so an extremely small step is not a universal guarantee of a better answer. Detailed truncation and round-off analysis is Stretch.
h_working_s = logspace(-1,-8,8);
y_working_forward_m = y0_m + v0_mps*(t0_s+h_working_s) - 0.5*g_mps2*(t0_s+h_working_s).^2;
v_working_mps = (y_working_forward_m-y_now_m)./h_working_s;
working_error_mps = abs(v_working_mps-v_exact_mps);
loglog(h_working_s,working_error_mps,'o-','LineWidth',2)
grid on
xlabel('Step size, h (s)')
ylabel('Absolute velocity error (m/s)')
title('Working Exposure: Forward-Difference Error Versus Step Size')
%%
%[text] ## Three Takeaways
%[text] First, a numerical derivative estimates a physical rate from nearby values and must carry the correct derivative unit. Second, the forward difference uses a finite secant, so changing `h` changes the approximation. Third, compare the estimate with an analytic or supplied reference and state simple error before trusting it.
%%
%[text] ## Reproducibility Record
%[text] Run sections from top to bottom in a fresh MATLAB session. This demonstration requires MATLAB R2025a or later and base MATLAB only. Locked values are `y0_m=0`, `v0_mps=20`, `g_mps2=9.81`, `t0_s=1.0`, and Core step sizes `h_s=[0.5 0.2 0.1 0.05]`. No hidden Workspace state is required.

%[appendix]{"version":"1.0"}
