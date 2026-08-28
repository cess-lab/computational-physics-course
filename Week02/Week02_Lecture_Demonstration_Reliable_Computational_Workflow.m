%[text] # Week 2 Lecture Demonstration: Reliable Computational Workflow Through an Oscillator
%[text] **LECTURE DEMONSTRATION.** This complete worked example is led by the lecturer. Students may inspect and rerun it, but the lecture does not require student laptops, typing, or submission.
%[text] **Physical question.** Can we construct an ideal mass-spring oscillator calculation that is readable, testable, and capable of exposing a plausible but physically wrong result?
%[text] The workflow is decomposition $\\rightarrow$ prediction $\\rightarrow$ pseudocode $\\rightarrow$ implementation $\\rightarrow$ testing $\\rightarrow$ diagnosis $\\rightarrow$ physical interpretation.
%%
%[text] ## Pause and Predict
%[text] Imagine a mass released from rest at its maximum positive displacement. Predict the signs of position and velocity one quarter-period later, the allowed displacement range, and what should happen to the total mechanical energy. These are verbal prompts; nothing needs to be typed into this file.
predictionSummary = table("x = 0","v < 0","-A <= x <= A","constant total energy", ...
    'VariableNames',{'AtQuarterPeriodPosition','AtQuarterPeriodVelocity','DisplacementBound','IdealEnergyPrediction'})
%%
%[text] ## Physical Model and Assumptions
%[text] For an ideal horizontal mass-spring oscillator with no damping, the model is
%[text]{"align":"center"} $ m\\frac{d^2x}{dt^2}=-kx, \\qquad x(t)=A\\cos(\\omega t+\\phi), \\qquad \\omega=\\sqrt{\\frac{k}{m}}. $
%[text] We assume a linear spring, constant mass, negligible friction, one-dimensional motion, and an equilibrium position at $x=0$.
mass_kg = 0.50;
springConstant_N_per_m = 8.0;
amplitude_m = 0.12;
phase_rad = 0;
omega_rad_per_s = sqrt(springConstant_N_per_m/mass_kg);
period_s = 2*pi/omega_rad_per_s;
parameterRecord = table(mass_kg,springConstant_N_per_m,amplitude_m,phase_rad,omega_rad_per_s,period_s)
%%
%[text] ## Decompose Before Coding
%[text] Separate what is supplied, what is derived, what must be computed, and what evidence will be used. This prevents the code from becoming the first place where the reasoning appears.
decompositionRecord = table( ...
    "m, k, A, phi, time resolution", ...
    "omega and period", ...
    "x(t), v(t), kinetic, potential, total energy", ...
    "initial state, bounds, one-period repeat, energy, phase sign", ...
    'VariableNames',{'Inputs','DerivedQuantities','Outputs','IndependentChecks'})
%%
%[text] ## Pseudocode as an Explicit Argument
%[text] Pseudocode exposes dependencies without demanding exact MATLAB punctuation: define inputs and units; compute $\\omega$ and $T$; build an aligned time array; evaluate position and velocity; compute energies; apply several independent checks; then interpret the motion.
pseudocodeRecord = [ ...
    "INPUT m, k, A, phase, time range"; ...
    "DERIVE omega = sqrt(k/m), period = 2*pi/omega"; ...
    "CREATE one aligned time array"; ...
    "COMPUTE x(t), v(t), K(t), U(t), E(t)"; ...
    "TEST initial state, bounds, repeat, energy, velocity sign"; ...
    "INTERPRET the physical motion and limitations" ...
    ]
%%
%[text] ## Vectorised Analytical Calculation
%[text] Every time value is evaluated by the same analytical model. Element-wise powers are required when squaring arrays.
t_s = linspace(0,4*period_s,1001);
x_m = amplitude_m.*cos(omega_rad_per_s.*t_s + phase_rad);
v_m_per_s = -amplitude_m.*omega_rad_per_s.*sin(omega_rad_per_s.*t_s + phase_rad);
kineticEnergy_J = 0.5*mass_kg.*v_m_per_s.^2;
potentialEnergy_J = 0.5*springConstant_N_per_m.*x_m.^2;
totalEnergy_J = kineticEnergy_J + potentialEnergy_J;
tiledlayout(2,1)
nexttile
plot(t_s,x_m,'LineWidth',1.5)
grid on
xlabel('Time, t (s)')
ylabel('Position, x (m)')
title('Ideal mass-spring motion')
nexttile
plot(t_s,kineticEnergy_J,t_s,potentialEnergy_J,t_s,totalEnergy_J,'LineWidth',1.3)
grid on
xlabel('Time, t (s)')
ylabel('Energy (J)')
legend('Kinetic','Potential','Total','Location','eastoutside')
title('Energy exchange and conservation')
%%
%[text] ## Array Shape Is Part of the Contract
%[text] Time, position, velocity, and energy must have the same number of stored values. A correct formula applied to incompatible shapes is still an unusable computational result.
shapeRecord = table(size(t_s,1),size(t_s,2),numel(t_s),numel(x_m),numel(v_m_per_s),numel(totalEnergy_J), ...
    'VariableNames',{'TimeRows','TimeColumns','TimeValues','PositionValues','VelocityValues','EnergyValues'})
assert(isequal(size(t_s),size(x_m),size(v_m_per_s),size(totalEnergy_J)), ...
    'The computed arrays do not share one aligned shape.')
%%
%[text] ## A Scalar Loop Should Agree With the Vectorised Model
%[text] Vectorisation changes how the same independent evaluations are expressed; it must not change the physics. A loop provides a transparent cross-check here.
x_loop_m = nan(size(t_s));
for n = 1:numel(t_s)
    x_loop_m(n) = amplitude_m*cos(omega_rad_per_s*t_s(n) + phase_rad);
end
vectorLoopDifference_m = max(abs(x_loop_m-x_m));
assert(vectorLoopDifference_m < 100*eps(amplitude_m), ...
    'The loop and vectorised position calculations disagree.')
comparisonRecord = table(vectorLoopDifference_m)
%%
%[text] ## Layer the Tests
%[text] A useful testing ladder moves from executable structure to physical meaning: syntax and shape; known values; bounds and trends; invariants; then an independent or limiting case.
energyReference_J = 0.5*springConstant_N_per_m*amplitude_m^2;
relativeEnergyDrift = max(abs(totalEnergy_J-energyReference_J))/energyReference_J;
[~,onePeriodIndex] = min(abs(t_s-period_s));
assert(abs(x_m(1)-amplitude_m) < 1e-12, ...
    'The initial position does not equal the release amplitude.')
assert(abs(v_m_per_s(1)) < 1e-12, ...
    'The mass should be released from rest.')
assert(all(abs(x_m) <= amplitude_m + 1e-12), ...
    'The displacement exceeds the model amplitude.')
assert(abs(x_m(onePeriodIndex)-amplitude_m) < 2e-5, ...
    'The stored value nearest one period does not repeat the initial position.')
assert(relativeEnergyDrift < 1e-12, ...
    'The analytical model does not conserve total energy numerically.')
validationRecord = table(energyReference_J,relativeEnergyDrift,x_m(onePeriodIndex), ...
    'VariableNames',{'EnergyReference_J','RelativeEnergyDrift','PositionNearestOnePeriod_m'})
%%
%[text] ## One Passing Test Is Not Enough
%[text] Suppose an AI-generated expression loses the minus sign in velocity. Squaring velocity means the energy calculation still passes, even though the phase of the motion is wrong.
v_wrong_m_per_s = amplitude_m.*omega_rad_per_s.*sin(omega_rad_per_s.*t_s + phase_rad);
wrongEnergy_J = 0.5*mass_kg.*v_wrong_m_per_s.^2 + potentialEnergy_J;
wrongRelativeEnergyDrift = max(abs(wrongEnergy_J-energyReference_J))/energyReference_J;
[~,quarterPeriodIndex] = min(abs(t_s-period_s/4));
phaseDiagnosis = table(v_m_per_s(quarterPeriodIndex),v_wrong_m_per_s(quarterPeriodIndex),wrongRelativeEnergyDrift, ...
    'VariableNames',{'CorrectVelocityAtQuarterPeriod','WrongVelocityAtQuarterPeriod','WrongModelEnergyDrift'})
%[text] Energy is necessary evidence, but the predicted negative velocity at one quarter-period is the test that exposes this sign error.
%%
%[text] ## Diagnose a Plausible Candidate
%[text] Read the candidate as a claim about physics, units, arrays, and plotting—not merely as syntax. The text is displayed and is not executed.
candidateCode = [ ...
    "omega_rad_per_s = sqrt(springConstant_N_per_m*mass_kg);"; ...
    "t_s = 0:4*period_s:0.01;"; ...
    "x_m = amplitude_m*cos(omega_rad_per_s*t_s);"; ...
    "energy_J = 0.5*mass_kg*v_m_per_s^2 + 0.5*springConstant_N_per_m*x_m^2;"; ...
    "plot(x_m,t_s)" ...
    ]
diagnosisSummary = table( ...
    "sqrt(k*m) has the wrong relation and dimensions", ...
    "the colon arguments are reversed", ...
    "array powers need .^", ...
    "the plot axes are reversed and unlabelled", ...
    'VariableNames',{'PhysicalDefect','LogicalDefect','ArrayDefect','CommunicationDefect'})
%%
%[text] ## Debugging Is a Controlled Experiment
%[text] Use a short cycle: reproduce the symptom; localise the first doubtful quantity; state one hypothesis; design the smallest discriminating test; repair one cause; rerun all tests; then interpret the physical consequence.
debuggingCycle = ["reproduce","localise","hypothesise","test","repair","rerun","interpret"]
%%
%[text] ## Responsible AI and Reproducibility
%[text] MATLAB Copilot can propose code and tests, but the student must decide what the variables mean, which evidence can fail, and whether the result is physically credible. Record material AI influence and keep the parameter set, MATLAB release, algorithm, and tests reproducible.
matlabRelease = version;
reproducibilityRecord = table(string(matlabRelease),mass_kg,springConstant_N_per_m,amplitude_m,period_s,relativeEnergyDrift, ...
    'VariableNames',{'MATLABRelease','mass_kg','springConstant_N_per_m','amplitude_m','period_s','relativeEnergyDrift'})
%%
%[text] ## Demonstration Takeaways
%[text] Reliable computation begins before code: decompose the physical question, make dependencies explicit, preserve array shape and units, and select tests that fail for different reasons.
%[text] The practical transfers this workflow to projectile motion, where students diagnose degrees-versus-radians, time-array, element-wise-power, ground-crossing, and plotting defects.

%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"inline"}
%---
