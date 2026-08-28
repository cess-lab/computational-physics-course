%[text] # Week 2 Practical Activity: Debug and Validate a Projectile Model
%[text] **PRACTICAL ACTIVITY.** This group investigation assesses decomposition, pseudocode, array reasoning, debugging, testing, and physical interpretation. Producing a long program is not the goal.
%[text] **Physical question.** A ball is launched from a height above level ground. Can we compute its trajectory, landing time, and range while exposing the assumptions and checks that make the result credible?
%[text] **Working arrangement.** Complete the Week 02 individual Google Form before discussing the problem or using MATLAB, notes, calculators, or AI. Then work in a group of two or three. MATLAB Copilot may be used during group work, but every material suggestion must be declared and independently tested.
%%
%[text] ## Complete the Individual Check First
%[text] Each student submits the Week 02 section of the [PHY4605 Individual Practical Check](https://docs.google.com/forms/d/e/1FAIpQLSc1q0t0yBi8XVwrrNH2G2H8Sc66VFy2fBMkbhJaTZ3TGRxkvw/viewform) before group work begins. Do not duplicate those answers here.
%%
%[text] ## Group Record and Role Rotation
%[text] Record all members and assign model, algorithm/implementation, and validation leads. Rotate the roles from Week 1.
groupMembers = "TODO: names and matric numbers"
roleRecord = "TODO: identify the model, algorithm/implementation, and validation leads"
%%
%[text] ## Decompose the Physical Question
%[text] State the inputs, derived quantities, required outputs, assumptions, and validation evidence before modifying code.
decompositionRecord = "TODO: inputs, derived quantities, outputs, assumptions, and checks"
%[text] **Required assumptions.** Begin with uniform gravitational acceleration, negligible air resistance, a point-like projectile, level ground at $y=0$, and independent horizontal and vertical motion.
%%
%[text] ## Construct Pseudocode Before Implementation
%[text] Write a short algorithm using the dependency order `inputs -> components -> flight time -> time array -> trajectory -> landing evidence -> validation -> interpretation`.
pseudocodeRecord = "TODO: write structured pseudocode before asking AI for code"
%%
%[text] ## Baseline Parameters and Units
%[text] Use names that retain units and convert the launch angle explicitly before evaluating trigonometric functions.
launchSpeed_m_per_s = 18.0;
launchAngle_deg = 40.0;
initialHeight_m = 1.5;
gravity_m_per_s2 = 9.81;
dt_s = 0.02;
launchAngle_rad = deg2rad(launchAngle_deg);
vx0_m_per_s = launchSpeed_m_per_s*cos(launchAngle_rad);
vy0_m_per_s = launchSpeed_m_per_s*sin(launchAngle_rad);
parameterRecord = table(launchSpeed_m_per_s,launchAngle_deg,initialHeight_m,gravity_m_per_s2,dt_s,vx0_m_per_s,vy0_m_per_s)
%[text] **Checkpoint.** Explain why $g t^2$ has units of length and why MATLAB must know whether the angle is in degrees or radians.
unitExplanation = "TODO: explain both dimensional checks"
%%
%[text] ## Reference Flight Time and Aligned Time Array
%[text] The positive root of $y_0+v_{y0}t-gt^2/2=0$ provides a reference landing time. Append that time to the sampled array so the final stored position lies exactly on the ground.
flightTimeReference_s = (vy0_m_per_s + sqrt(vy0_m_per_s^2 + 2*gravity_m_per_s2*initialHeight_m))/gravity_m_per_s2;
t_s = 0:dt_s:flightTimeReference_s;
if t_s(end) < flightTimeReference_s
    t_s = [t_s flightTimeReference_s];
end
timeArrayRecord = table(numel(t_s),t_s(1),t_s(end),flightTimeReference_s, ...
    'VariableNames',{'StoredValues','FirstTime_s','LastTime_s','ReferenceFlightTime_s'})
%[text] **Checkpoint.** Explain the difference between the number of stored time values and the number of intervals.
timeArrayExplanation = "TODO: explain the array endpoints, values, and intervals"
%%
%[text] ## Vectorised Trajectory
%[text] Evaluate horizontal and vertical position at every stored time. Element-wise squaring is required for the time array.
x_m = vx0_m_per_s.*t_s;
y_m = initialHeight_m + vy0_m_per_s.*t_s - 0.5*gravity_m_per_s2.*t_s.^2;
rangeReference_m = vx0_m_per_s*flightTimeReference_s;
plot(x_m,y_m,'LineWidth',1.6)
grid on
xlabel('Horizontal position, x (m)')
ylabel('Vertical position, y (m)')
title('Projectile trajectory without air resistance')
%[text] **Checkpoint.** Connect the initial point, highest point, landing point, and horizontal direction to the physical model.
trajectoryInterpretation = "TODO: interpret four physical features of the curve"
%%
%[text] ## Independent Peak Evidence
%[text] The vertical velocity is zero at the analytical peak time. Compare the analytical height with the largest sampled height rather than assuming the plotted maximum is exact.
peakTimeReference_s = vy0_m_per_s/gravity_m_per_s2;
peakHeightReference_m = initialHeight_m + vy0_m_per_s^2/(2*gravity_m_per_s2);
[sampledPeakHeight_m,sampledPeakIndex] = max(y_m);
sampledPeakTime_s = t_s(sampledPeakIndex);
peakRecord = table(peakTimeReference_s,peakHeightReference_m,sampledPeakTime_s,sampledPeakHeight_m)
peakExplanation = "TODO: explain why the sampled and analytical peak times may differ"
%%
%[text] ## Diagnose a Plausible AI-Generated Attempt
%[text] The candidate is displayed as text and is not executed. Identify at least five defects and connect each defect to a consequence or failed test.
candidateCode = [ ...
    "launchAngle_rad = launchAngle_deg;"; ...
    "t_s = 0:flightTimeReference_s:dt_s;"; ...
    "x_m = launchSpeed_m_per_s*cos(launchAngle_rad)*t_s;"; ...
    "y_m = initialHeight_m + launchSpeed_m_per_s*sin(launchAngle_rad)*t_s - 0.5*gravity_m_per_s2*t_s^2;"; ...
    "plot(y_m,x_m)" ...
    ]
diagnosisRecord = "TODO: defect, category, consequence, correction, and discriminating test"
%%
%[text] ## Validation Evidence
%[text] These checks test array shape, initial position, horizontal direction, ground landing, range, and finite results. Explain what each check can and cannot establish.
assert(isequal(size(t_s),size(x_m),size(y_m)), ...
    'Time and position arrays are not aligned.')
assert(abs(x_m(1)) < 1e-12 && abs(y_m(1)-initialHeight_m) < 1e-12, ...
    'The trajectory does not satisfy the initial position.')
assert(all(diff(x_m) >= 0), ...
    'Horizontal position should not decrease for the baseline launch.')
assert(abs(y_m(end)) < 1e-10, ...
    'The final stored point is not on the ground.')
assert(abs(x_m(end)-rangeReference_m) < 1e-10, ...
    'The final horizontal position does not match the reference range.')
assert(all(isfinite(x_m)) && all(isfinite(y_m)), ...
    'The trajectory contains a non-finite value.')
validationStatus = "Shape, initial-position, direction, landing, range, and finiteness checks passed."
validationExplanation = "TODO: explain the evidence and add one independent physical check"
%%
%[text] ## Group Investigation
%[text] Predict before every modification and change one factor at a time:
%[text] 1. Compare launch angles of $25^{\\circ}$, $40^{\\circ}$, and $55^{\\circ}$ using the same speed and height.
%[text] 2. Set the initial height to zero and test the complementary-angle range expectation.
%[text] 3. Reduce the sampling interval and explain what changes and what should remain invariant.
%[text] 4. Create one deliberate defect, identify which existing test detects it, and design another test if none does.
investigationRecord = "TODO: predictions, controlled changes, evidence, and physical interpretation"
%%
%[text] ## Submission Evidence and AI Decision Record
%[text] Submit one compact group evidence packet containing the decomposition, pseudocode, parameter-and-unit map, labelled trajectory, peak and landing evidence, candidate diagnosis, validation checks, investigation, physical interpretation, and one model limitation.
%[text] If AI was used, record what was requested, what was accepted, modified, or rejected, why the decision was made, and which independent checks were performed.
aiDecisionRecord = "TODO: state AI-free or provide the material-use decision record"

%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"inline"}
%---
