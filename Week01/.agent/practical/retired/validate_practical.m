%% PHY4605 Week 01 practical validation harness
clearvars
N0 = 1000;
T_half_h = 6.0;
tMax_h = 24.0;
lambda_per_h = log(2)/T_half_h;
dtValues_h = [2.0 1.0 0.5 0.1];
exactFinal = exp(-lambda_per_h*tMax_h);
finalFraction = zeros(size(dtValues_h));
relativeError = zeros(size(dtValues_h));
stepCount = zeros(size(dtValues_h));
for k = 1:numel(dtValues_h)
    dt_h = dtValues_h(k);
    t_h = 0:dt_h:tMax_h;
    N = zeros(size(t_h));
    N(1) = N0;
    for n = 1:numel(t_h)-1
        N(n+1) = N(n)*(1-lambda_per_h*dt_h);
    end
    assert(abs(t_h(end)-tMax_h) < 100*eps(max(1,tMax_h)),'Grid endpoint mismatch.')
    assert(all(isfinite(N)),'Non-finite numerical result.')
    assert(all(N >= 0),'Negative amount for baseline timestep.')
    finalFraction(k) = N(end)/N0;
    relativeError(k) = abs(finalFraction(k)-exactFinal)/exactFinal;
    stepCount(k) = numel(t_h)-1;
end
assert(abs(exp(-lambda_per_h*T_half_h)-0.5) < 1e-12,'Half-life check failed.')
assert(abs(exactFinal-0.0625) < 1e-12,'Four-half-life check failed.')
assert(relativeError(end) < relativeError(1),'Finer timestep did not improve baseline error.')
results = table(dtValues_h(:),lambda_per_h*dtValues_h(:),stepCount(:),finalFraction(:),relativeError(:), ...
    'VariableNames',{'dt_h','lambdaDt','steps','EulerFractionAt24h','RelativeError'});
disp(results)
disp('VALIDATION PASSED: reference, grid, finiteness, admissibility, and convergence-trend checks.')
