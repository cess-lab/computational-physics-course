%[text] # Week 1 Practical Activity: MATLAB Onramp Diagnostic Through a Cooling Experiment
%[text] **PRACTICAL ACTIVITY.** This group investigation checks prerequisite MATLAB skills through one physical question. Code production is not the main goal: make the model, logic, checks, and interpretation visible.
%[text] **Physical question.** A temperature sensor is removed from a warm chamber and placed in a room. How can we model its cooling, determine when it is close to room temperature, and decide whether the computed result is credible?
%[text] **Working arrangement.** Complete the Week 01 individual practical quiz in Google Classroom before discussing the problem or using MATLAB, notes, calculators, or AI. Then work in a group of two or three. MATLAB Copilot may be used during the group activity, but every suggestion must be understood, declared, and independently checked.
%%
%[text] ## Complete the Individual Check First
%[text] Each student submits the [Week 01 Individual Practical Check — Quiz](https://classroom.google.com/c/ODcyNDE5ODM4MTIx/a/ODcyNDIwOTg4ODUx/details) before group work begins. The check is diagnostic and is not marked individually. Do not duplicate those answers in this Live Script.
%%
%[text] ## Group Record
%[text] Record the group members consistently so that the practical evidence can be traced and discussed.
groupMembers = "TODO: list the names and matric numbers of all group members"
%%
%[text] ## Model, Assumptions, and Parameters
%[text] Newton's cooling model assumes a uniform object temperature, constant room temperature, and a cooling rate proportional to the temperature difference.
%[text]{"align":"center"} $ T(t)=T\_{env}+\\left(T\_0-T\_{env}\\right)e^{-kt} $
%[text] The parameter names retain their units so another person can interpret and reproduce the calculation.
T0_C = 80;                 % initial sensor temperature, degC
Tenv_C = 22;               % room temperature, degC
k_per_min = 0.08;          % cooling constant, 1/min
tMax_min = 60;             % final observation time, min
dt_min = 2;                % sampling interval, min
parameterRecord = table(T0_C,Tenv_C,k_per_min,tMax_min,dt_min)
%[text] **Group checkpoint.** State the physical meaning and units of every parameter, then identify one assumption that could fail in a real experiment.
modelExplanation = "TODO: explain the parameters, units, and one model limitation"
%%
%[text] ## Arrays, Indexing, and Scale
%[text] Construct the time array and inspect its size, endpoints, and dimensionless scale. Explain why the first element represents the initial condition.
t_min = 0:dt_min:tMax_min;
dimensionlessTime = k_per_min.*t_min;
arrayRecord = table(numel(t_min),t_min(1),t_min(end),dimensionlessTime(end), ...
    'VariableNames',{'sampleCount','firstTime_min','lastTime_min','final_kTimesT'})
%[text] **Checkpoint.** State whether the array reaches the requested final time and how many update intervals it contains.
arrayExplanation = "TODO: explain the time array and its physical scale"
%%
%[text] ## Vectorised Model and Labelled Plot
%[text] Evaluate the analytical reference at every stored time using element-wise operations. Inspect whether the curve agrees with the physical prediction discussed by the group.
T_exact_C = Tenv_C + (T0_C-Tenv_C).*exp(-k_per_min.*t_min);
plot(t_min,T_exact_C,'o-','LineWidth',1.4)
grid on
xlabel('Time, t (min)')
ylabel('Temperature, T (degC)')
title('Newton cooling reference')
%[text] **Checkpoint.** Explain the physical meaning of the curve's initial value, slope direction, and limiting value.
plotInterpretation = "TODO: interpret the cooling curve physically"
%%
%[text] ## Logical Indexing and a Physical Threshold
%[text] Use a logical condition to find the first stored time when the sensor is within $1\~^{\\circ}\\mathrm{C}$ of room temperature. The result depends on both the model and the sampling interval.
tolerance_C = 1.0;
withinTolerance = abs(T_exact_C-Tenv_C) <= tolerance_C;
firstIndex = find(withinTolerance,1,'first');
if isempty(firstIndex)
    thresholdResult = "The sensor does not reach the requested tolerance on this grid.";
    firstTimeWithinTolerance_min = NaN;
else
    firstTimeWithinTolerance_min = t_min(firstIndex);
    thresholdResult = "The first stored time within tolerance is " + firstTimeWithinTolerance_min + " min.";
end
thresholdResult
%[text] **Modification.** Repeat the test with a stricter tolerance and explain why a sampled crossing time is not necessarily the exact crossing time.
thresholdExplanation = "TODO: record the stricter test and explain the role of sampling"
%%
%[text] ## A Loop as a Numerical Model
%[text] The analytical expression gives a reference. The loop below instead advances an Euler approximation using the current temperature to calculate the next temperature.
T_euler_C = nan(size(t_min));
T_euler_C(1) = T0_C;
for n = 1:numel(t_min)-1
    T_euler_C(n+1) = T_euler_C(n) - k_per_min*(T_euler_C(n)-Tenv_C)*dt_min;
end
maxDifference_C = max(abs(T_euler_C-T_exact_C));
comparisonRecord = table(dt_min,maxDifference_C,T_euler_C(end),T_exact_C(end), ...
    'VariableNames',{'dt_min','maxDifference_C','EulerFinal_C','ReferenceFinal_C'})
%[text] **Checkpoint.** Identify the current value, update, and next value in the loop. Explain why the loop and analytical expression need not give identical results.
loopExplanation = "TODO: explain one loop iteration and the numerical difference"
%%
%[text] ## Diagnose a Plausible AI-Generated Attempt
%[text] The following candidate is displayed as text and is not executed. Identify at least three problems involving the time array, mathematical operation, physical meaning, or plotting order. Write a corrected algorithm before asking Copilot for help.
candidateCode = [ ...
    "t_min = 0:60:2;"; ...
    "T_C = Tenv_C + (T0_C-Tenv_C)*exp(-k_per_min/t_min);"; ...
    "plot(T_C,t_min)" ...
    ]
diagnosisRecord = "TODO: identify defects, consequences, and corrections"
%%
%[text] ## Validation Evidence
%[text] These executable checks test the initial value, monotonic trend, physical bounds, and final-time grid. Explain what each check can detect and what it cannot establish.
assert(abs(T_exact_C(1)-T0_C) < 100*eps(max(1,abs(T0_C))), ...
    'The analytical reference does not satisfy the initial condition.')
assert(all(diff(T_exact_C) <= 0), ...
    'The reference temperature should decrease for the chosen parameters.')
assert(all(T_exact_C >= Tenv_C & T_exact_C <= T0_C), ...
    'The reference result violates the expected physical bounds.')
assert(abs(t_min(end)-tMax_min) < 100*eps(max(1,tMax_min)), ...
    'The time grid does not reach the requested final time.')
validationStatus = "Baseline unit, initial-value, trend, bound, and grid checks passed."
validationExplanation = "TODO: explain the evidence and name one additional independent check"
%%
%[text] ## Group Investigation
%[text] Before changing each factor, agree on and record a prediction. Change one factor at a time and preserve the reasoning chain:
%[text] 1. Reduce the sampling interval and determine how the Euler-reference difference changes.
%[text] 2. Change the cooling constant after predicting the new trend.
%[text] 3. Determine whether changing the initial temperature changes the time needed to reach the same absolute tolerance.
%[text] 4. Report one result that initially looked plausible but needed a check. \
investigationRecord = "TODO: record predictions, parameter changes, evidence, and interpretation"
%%
%[text] ## Submission Evidence and AI Decision Record
%[text] Submit one compact group evidence packet containing the model and units, time-array explanation, labelled plot, threshold result, loop explanation, diagnosed candidate, validation evidence, parameter investigation, and physical interpretation.
%[text] If AI was used, record:
%[text] - what the tool was asked to do;
%[text] - what was accepted, modified, or rejected;
%[text] - why that decision was made; and
%[text] - which independent checks were performed. \
aiDecisionRecord = "TODO: state AI-free or provide the material-use decision record"

%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"inline"}
%---
