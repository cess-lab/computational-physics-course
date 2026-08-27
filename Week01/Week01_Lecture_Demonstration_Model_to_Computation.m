%[text] # Week 1 Lecture Demonstration: From a Physics Model to a Computational Experiment
%[text] **LECTURE DEMONSTRATION.** This is a complete worked example for the lecturer to run and explain. Students may review it before or after the lecture, but no laptop, typing, or submission is required during the demonstration.
%[text] The demonstration follows the course reasoning chain: physical model $\\rightarrow$ scale and units $\\rightarrow$ discretisation $\\rightarrow$ algorithm $\\rightarrow$ code $\\rightarrow$ error $\\rightarrow$ validation $\\rightarrow$ physical interpretation.
%[text] **Physical question.** How many radioactive nuclei remain after four half-lives, and how can we decide whether a time-stepping calculation deserves our trust?
%%
%[text] ## Pause and Predict
%[text] Before the calculation is revealed, predict the fraction remaining after one and four half-lives, whether the population may become negative, and what should happen when the timestep is reduced. These are verbal discussion prompts; nothing needs to be typed into this file.
predictionSummary = table(0.5,0.5^4,false,"Smaller timesteps should reduce the Forward Euler error in this example.", ... %[output:group:8eefd7ca] %[output:25391bbe]
    'VariableNames',{'FractionAfterOneHalfLife','FractionAfterFourHalfLives','NegativePopulationIsPhysical','TimestepPrediction'}) %[output:group:8eefd7ca] %[output:25391bbe]
%%
%[text] ## Model, Assumptions, and Parameters
%[text] The decay model assumes independent nuclei and a constant decay probability per unit time. The governing equation and analytical reference are
%[text]{"align":"center"} $ \\frac{dN}{dt}=-\\lambda N, \\qquad N(t)=N\_0 e^{-\\lambda t}, \\qquad \\lambda=\\frac{\\ln 2}{T\_{1/2}}. $
%[text] The parameter names make their units visible. Because $\\lambda$ has units of inverse time, the product $\\lambda\\Delta t$ is dimensionless and controls the size of one numerical update.
N0 = 1000;                        % initial population, nuclei
T_half_h = 6.0;                   % half-life, h
tMax_h = 24.0;                    % final time, h
dt_h = 0.5;                       % Forward Euler timestep, h
lambda_per_h = log(2)/T_half_h;   % decay constant, 1/h
scaleRecord = table(N0,T_half_h,tMax_h,dt_h,lambda_per_h,lambda_per_h*dt_h, ... %[output:group:919d12e5] %[output:8d45461c]
    'VariableNames',{'N0','halfLife_h','finalTime_h','timestep_h','lambda_per_h','lambdaTimesDt'}) %[output:group:919d12e5] %[output:8d45461c]
%%
%[text] ## Analytical Reference and Limiting Cases
%[text] Evaluate the analytical model on the computational time grid. The known half-life fractions give independent reference values before any numerical method is trusted.
t_h = 0:dt_h:tMax_h;
N_exact = N0.*exp(-lambda_per_h.*t_h);
referenceRecord = table(N_exact(1)/N0,exp(-lambda_per_h*T_half_h),N_exact(end)/N0, ...
    'VariableNames',{'initialFraction','oneHalfLifeFraction','fourHalfLifeFraction'})
plot(t_h,N_exact/N0,'k-','LineWidth',1.8)
grid on
xlabel('Time, t (h)')
ylabel('Fraction remaining, N/N_0')
title('Analytical radioactive-decay reference')
%[text] The curve begins at one, decreases monotonically, remains non-negative, and approaches zero. These features come from the physical model rather than from MATLAB.
%%
%[text] ## Discretisation and Algorithm
%[text] Forward Euler replaces the continuous derivative by a step-to-step change:
%[text]{"align":"center"} $ \\frac{N\_{n+1}-N\_n}{\\Delta t}\\approx-\\lambda N\_n \\quad\\Rightarrow\\quad N\_{n+1}=N\_n\\left(1-\\lambda\\Delta t\\right). $
%[text] Pseudocode: create the time grid; allocate storage; set the initial value; repeatedly compute the next value from the current value; then compare the result with reference evidence.
N_euler = nan(size(t_h));
N_euler(1) = N0;
for n = 1:numel(t_h)-1
    N_euler(n+1) = N_euler(n)*(1-lambda_per_h*dt_h);
end
finalRelativeError = abs(N_euler(end)-N_exact(end))/N_exact(end);
singleRunRecord = table(dt_h,N_euler(end)/N0,N_exact(end)/N0,100*finalRelativeError, ...
    'VariableNames',{'dt_h','EulerFinalFraction','ReferenceFinalFraction','RelativeErrorPercent'})
plot(t_h,N_euler/N0,'o-',t_h,N_exact/N0,'k-','LineWidth',1.4)
grid on
xlabel('Time, t (h)')
ylabel('Fraction remaining, N/N_0')
legend('Forward Euler','Analytical reference','Location','northeast')
title('Numerical result compared with a reference')
%[text] MATLAB executes the loop exactly as written, but Forward Euler still approximates continuous decay over finite steps. Runnable code and an accurate numerical result are different claims.
%%
%[text] ## Timestep Study and Convergence Evidence
%[text] A single plausible curve is not enough. Repeat the same physical experiment at several timesteps and quantify the final-time error.
dtValues_h = [2.0 1.0 0.5 0.1];
finalEulerFraction = nan(size(dtValues_h));
relativeErrorPercent = nan(size(dtValues_h));
stepCount = nan(size(dtValues_h));
exactFinalPopulation = N0*exp(-lambda_per_h*tMax_h);
for k = 1:numel(dtValues_h)
    dtCurrent_h = dtValues_h(k);
    tCurrent_h = 0:dtCurrent_h:tMax_h;
    N_current = nan(size(tCurrent_h));
    N_current(1) = N0;
    for n = 1:numel(tCurrent_h)-1
        N_current(n+1) = N_current(n)*(1-lambda_per_h*dtCurrent_h);
    end
    finalEulerFraction(k) = N_current(end)/N0;
    relativeErrorPercent(k) = 100*abs(N_current(end)-exactFinalPopulation)/exactFinalPopulation;
    stepCount(k) = numel(tCurrent_h)-1;
end
convergenceRecord = table(dtValues_h(:),lambda_per_h*dtValues_h(:),stepCount(:), ...
    finalEulerFraction(:),relativeErrorPercent(:), ...
    'VariableNames',{'dt_h','lambdaTimesDt','steps','EulerFinalFraction','RelativeErrorPercent'})
loglog(dtValues_h,relativeErrorPercent,'o-','LineWidth',1.4)
grid on
xlabel('Timestep, \Delta t (h)')
ylabel('Final relative error (%)')
title('Forward Euler convergence evidence')
%[text] The table makes the trade-off visible: smaller steps improve this result but require more updates. Smoothness alone would not establish convergence.
%%
%[text] ## Validation and Physical Admissibility
%[text] The checks below test independent expectations: the initial condition, exact half-life values, finiteness, non-negativity, monotonic decay, and improvement at the smallest timestep.
assert(abs(N_exact(1)-N0) < 100*eps(max(1,N0)), ...
    'The analytical reference does not satisfy the initial condition.')
assert(abs(exp(-lambda_per_h*T_half_h)-0.5) < 1e-12, ...
    'The half-life reference check failed.')
assert(abs(N_exact(end)/N0-0.0625) < 1e-12, ...
    'The four-half-life reference check failed.')
assert(all(isfinite(N_euler)), ...
    'The numerical solution contains a non-finite value.')
assert(all(N_euler >= 0) && all(diff(N_euler) <= 0), ...
    'The numerical result violates the expected physical trend or bounds.')
assert(relativeErrorPercent(end) < relativeErrorPercent(1), ...
    'The timestep study does not show improvement at the finest resolution.')
validationStatus = "Initial-value, limiting-case, bound, trend, and convergence checks passed."
%[text] These checks can reveal implementation and numerical failures, but they cannot prove that constant decay probability is an adequate model for every physical sample.
%%
%[text] ## Prepared Failure Demonstration
%[text] If $\\lambda\\Delta t\>1$, the update factor becomes negative. MATLAB can execute that formula even though a negative population is physically inadmissible.
unsafeDt_h = 10.0;
unsafeLambdaTimesDt = lambda_per_h*unsafeDt_h;
unsafeUpdateFactor = 1-unsafeLambdaTimesDt;
unsafeNextPopulation = N0*unsafeUpdateFactor;
failureRecord = table(unsafeDt_h,unsafeLambdaTimesDt,unsafeUpdateFactor,unsafeNextPopulation)
%[text] For this decay update, requiring $0\\leq 1-\\lambda\\Delta t\\leq 1$ prevents a positive population from becoming negative or increasing in one step. This is a method-and-model condition, not a general rule for every numerical problem.
%%
%[text] ## Responsible AI and Reproducibility
%[text] MATLAB Copilot can help explain or modify code, but it cannot replace the physical model, units, convergence evidence, or independent checks. A useful AI-assisted workflow records what was requested, what was changed, and how the result was verified.
matlabRelease = version;
reproducibilityRecord = table(string(matlabRelease),N0,T_half_h,tMax_h,dt_h, ...
    'VariableNames',{'MATLABRelease','N0','halfLife_h','finalTime_h','timestep_h'})
%%
%[text] ## Demonstration Takeaways
%[text] A credible computational result connects the physical assumptions to a dimensionally consistent model, an explicit discretisation and algorithm, reproducible code, quantified numerical error, independent validation evidence, and a defensible physical interpretation.
%[text] The Week 1 practical transfers this reasoning from radioactive decay to Newton cooling while diagnosing prerequisite MATLAB Onramp skills.

%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"inline"}
%---
%[output:25391bbe]
%   data: {"dataType":"tabular","outputData":{"columnNames":["FractionAfterOneHalfLife","FractionAfterFourHalfLives","NegativePopulationIsPhysical","TimestepPrediction"],"columns":4,"dataTypes":["double","double","logical","string"],"header":"1×4 table","name":"predictionSummary","rows":1,"type":"table","value":[["0.5000","0.0625","false","\"Smaller timesteps should reduce the Forward Euler error in this example.\""]]}}
%---
%[output:8d45461c]
%   data: {"dataType":"tabular","outputData":{"columnNames":["N0","halfLife_h","finalTime_h","timestep_h","lambda_per_h","lambdaTimesDt"],"columns":6,"dataTypes":["double","double","double","double","double","double"],"header":"1×6 table","name":"scaleRecord","rows":1,"type":"table","value":[["1000","6","24","0.5000","0.1155","0.0578"]]}}
%---
