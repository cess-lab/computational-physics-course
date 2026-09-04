%[text] # Week 5 Lecture Demonstration: Root Finding for Projectile Range
%[text] **LECTURE DEMONSTRATION**
%[text] PHY4605 Physics-First Reproducible MATLAB Notebook
%%
%[text] ## Physical Question and Learning Outcomes
%[text] A projectile is launched from level ground with speed $v_0=20$ m/s. What low launch angle makes the range equal to a 35 m target distance, and how can bisection and Newton's method find that angle from a residual rather than from a rearranged formula?
%[text] **Learning outcomes.** By the end of this demonstration, you can rewrite a physical target condition as a residual $f(\theta)=0$, identify a sign-changing bracket on a residual graph, and trace scaffolded bisection and Newton updates using one residual-based stopping rule.
%%
%[text] ## Model, Assumptions, Variables, and Units
%[text] Use the familiar level-ground projectile range model $R(\theta)=v_0^2\sin(2\theta)/g$. The unknown is the launch angle `theta_deg` in degrees. The output model range is `range_m` in metres. The residual is `residual_m = range_m - target_m`; it is positive when the model overshoots the target and negative when it undershoots.
v0_mps = 20;          % launch speed (m/s)
g_mps2 = 9.81;        % gravitational acceleration (m/s^2)
target_m = 35;        % target range (m)
tolerance_m = 1e-3;   % one supplied residual stopping rule (m)
%%
%[text] ## Prediction Before Computing
%[text] At a very small angle, the range is too short. At a moderately larger low angle, the range may exceed 35 m. A useful bracket should therefore have one negative residual and one positive residual. This demonstration deliberately finds the low-angle root; a second high-angle root is not part of the Core route.
%%
%[text] ## Build the Residual From the Physical Equation
%[text] First evaluate the range and residual on an angle array. The graph is not decoration: it shows where the residual crosses zero and whether the chosen bracket changes sign.
theta_scan_deg = 10:1:70;
range_scan_m = (v0_mps^2/g_mps2).*sind(2*theta_scan_deg);
residual_scan_m = range_scan_m - target_m;
plot(theta_scan_deg,residual_scan_m,'LineWidth',2)
grid on
yline(0,'--')
xlabel('Launch angle, theta (degree)')
ylabel('Residual, f(theta) = R(theta) - target (m)')
title('Projectile-Range Residual for a 35 m Target')
%%
%[text] ## Identify a Sign-Changing Bracket
%[text] Choose the low-angle bracket from 20 degrees to 40 degrees. The left residual is negative and the right residual is positive, so a zero crossing lies between them. For bisection, the sign change is the safety evidence.
left_deg = 20;
right_deg = 40;
f_left_m = (v0_mps^2/g_mps2)*sind(2*left_deg) - target_m
f_right_m = (v0_mps^2/g_mps2)*sind(2*right_deg) - target_m
assert(f_left_m*f_right_m < 0, ...
    'The chosen bisection bracket must contain a sign change.')
%%
%[text] ## Bisection Algorithm Before MATLAB
%[text] Bisection repeatedly halves a sign-changing interval. Compute the midpoint, evaluate the residual there, keep the half interval that still has opposite signs at its ends, and stop when the residual magnitude is below the supplied tolerance.
%%
%[text] ## Run the Scaffolded Bisection Loop
%[text] The loop below keeps the bracket visible. It does not require a blank-page implementation: the learning job is to trace the midpoint and interval update.
max_iterations = 40;
bis_left_deg = left_deg;
bis_right_deg = right_deg;
bis_history = zeros(max_iterations,5);
for iteration = 1:max_iterations
    mid_deg = (bis_left_deg + bis_right_deg)/2;
    f_mid_m = (v0_mps^2/g_mps2)*sind(2*mid_deg) - target_m;
    bis_history(iteration,:) = [iteration, bis_left_deg, mid_deg, bis_right_deg, f_mid_m];
    if abs(f_mid_m) < tolerance_m
        break
    end
    f_bis_left_m = (v0_mps^2/g_mps2)*sind(2*bis_left_deg) - target_m;
    if f_bis_left_m*f_mid_m < 0
        bis_right_deg = mid_deg;
    else
        bis_left_deg = mid_deg;
    end
end
bisection_root_deg = mid_deg
bisection_residual_m = f_mid_m
bisection_iterations = iteration
bisection_trace = array2table(bis_history(1:iteration,:), ...
    'VariableNames',{'Iteration','Left_deg','Mid_deg','Right_deg','Residual_at_mid_m'})
%%
%[text] ## Newton's Tangent Update Idea
%[text] Newton's method uses the current angle, the residual there, and the local slope of the residual to predict where the tangent line crosses zero. The update is `next = current - residual/slope`. Here the slope is measured in metres per degree.
newton_start_deg = 25;
%%
%[text] ## Run the Scaffolded Newton Loop
%[text] Start from 25 degrees near the low-angle root. The code records each angle, residual, and slope so the update can be traced without treating Newton as a black box.
newton_theta_deg = newton_start_deg;
newton_history = zeros(max_iterations,4);
for iteration = 1:max_iterations
    f_current_m = (v0_mps^2/g_mps2)*sind(2*newton_theta_deg) - target_m;
    slope_m_per_deg = (v0_mps^2/g_mps2)*cosd(2*newton_theta_deg)*(2*pi/180);
    newton_history(iteration,:) = [iteration, newton_theta_deg, f_current_m, slope_m_per_deg];
    if abs(f_current_m) < tolerance_m
        break
    end
    newton_theta_deg = newton_theta_deg - f_current_m/slope_m_per_deg;
end
newton_root_deg = newton_theta_deg
newton_residual_m = f_current_m
newton_iterations = iteration
newton_trace = array2table(newton_history(1:iteration,:), ...
    'VariableNames',{'Iteration','Theta_deg','Residual_m','Slope_m_per_deg'})
%%
%[text] ## Core Validation: Substitute the Root Back Into the Residual
%[text] The required validation is direct substitution. If the computed angle is credible, the model range at that angle should differ from the target by less than the supplied residual tolerance.
validated_range_m = (v0_mps^2/g_mps2)*sind(2*bisection_root_deg)
validated_residual_m = validated_range_m - target_m
assert(abs(validated_residual_m) < tolerance_m, ...
    'Root validation failed: residual is larger than the supplied tolerance.')
%%
%[text] ## Interpret the Physical Meaning
%[text] The low-angle launch angle is about 29.6 degrees. In the model, launching at this angle with speed 20 m/s gives a range of approximately 35 m on level ground. A residual near zero means the model output matches the target condition; it does not prove the real projectile model includes air resistance or launch-height effects.
root_summary = table(bisection_root_deg,newton_root_deg,validated_range_m,validated_residual_m, ...
    'VariableNames',{'BisectionRoot_deg','NewtonRoot_deg','ValidatedRange_m','ValidatedResidual_m'})
%%
%[text] ## Working Exposure: Guaranteed Bracket Versus Faster Local Method
%[text] Bisection is slower but keeps a sign-changing bracket, so it is safer for this one-dimensional problem. Newton can need fewer iterations, but it relies on a good starting value and a useful slope. Iteration count is only one limited measure of computational cost; correctness still depends on the residual and physical interpretation.
iteration_comparison = table(bisection_iterations,newton_iterations, ...
    'VariableNames',{'BisectionIterations','NewtonIterations'})
%%
%[text] ## Optional Stretch: The Other Projectile Angle
%[text] The same level-ground projectile model has a second high-angle solution for this target distance. Distinguishing all possible roots and proving uniqueness within a bracket are stretch topics. The Core route only requires one clearly stated bracket and one validated physical root.
high_angle_root_deg = 90 - bisection_root_deg
%%
%[text] ## Three Takeaways
%[text] First, root finding begins by turning a physical target condition into a residual $f(x)=0$. Second, bisection uses a sign-changing bracket and midpoint updates. Third, Newton uses a local tangent update, but every computed root must still be validated by substituting it back into the residual.
%%
%[text] ## Reproducibility Record
%[text] Run sections from top to bottom in a fresh MATLAB session. This demonstration requires MATLAB R2025a or later and base MATLAB only. Locked values are `v0_mps=20`, `g_mps2=9.81`, `target_m=35`, bracket `[20,40]` degrees, Newton start `25` degrees, and residual tolerance `1e-3` m. No hidden Workspace state is required.

%[appendix]{"version":"1.0"}
