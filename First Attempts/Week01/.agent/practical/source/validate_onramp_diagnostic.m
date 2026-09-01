%% PHY4605 Week 01 Onramp diagnostic validation harness
T0_C = 80;
Tenv_C = 22;
k_per_min = 0.08;
tMax_min = 60;
dt_min = 2;
t_min = 0:dt_min:tMax_min;
T_exact_C = Tenv_C + (T0_C-Tenv_C).*exp(-k_per_min.*t_min);
tolerance_C = 1;
firstIndex = find(abs(T_exact_C-Tenv_C) <= tolerance_C,1,'first');
T_euler_C = nan(size(t_min));
T_euler_C(1) = T0_C;
for n = 1:numel(t_min)-1
    T_euler_C(n+1) = T_euler_C(n)-k_per_min*(T_euler_C(n)-Tenv_C)*dt_min;
end
maxDifference_C = max(abs(T_euler_C-T_exact_C));
assert(numel(t_min) == 31,'Unexpected sample count.')
assert(abs(t_min(end)-tMax_min) < 100*eps(max(1,tMax_min)),'Grid endpoint mismatch.')
assert(abs(T_exact_C(1)-T0_C) < 100*eps(max(1,T0_C)),'Initial condition mismatch.')
assert(all(diff(T_exact_C) <= 0),'Analytical temperature should decrease.')
assert(all(T_exact_C >= Tenv_C & T_exact_C <= T0_C),'Analytical result violates physical bounds.')
assert(t_min(firstIndex) == 52,'Unexpected stored threshold time.')
assert(all(isfinite(T_euler_C)),'Euler result contains a non-finite value.')
assert(abs(T_exact_C(end)-22.4773253288432) < 1e-9,'Unexpected analytical final temperature.')
assert(abs(T_euler_C(end)-22.3103177197936) < 1e-9,'Unexpected Euler final temperature.')
assert(abs(maxDifference_C-1.8325015528285) < 1e-9,'Unexpected maximum Euler-reference difference.')
results = table(numel(t_min),numel(t_min)-1,t_min(firstIndex),T_exact_C(end),T_euler_C(end),maxDifference_C, ...
    'VariableNames',{'samples','updates','firstStoredThreshold_min','exactFinal_C','EulerFinal_C','maxDifference_C'});
disp(results)
disp('VALIDATION PASSED: grid, initial value, trend, bounds, threshold, and baseline values.')
