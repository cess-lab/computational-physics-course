% Hidden instructor reference for Week 07 practical QA.

% Context A - decaying-force impulse.
imp_F0_N = 10; imp_tau_s = 1.0; imp_T_s = 3.0;
imp_intervals = [3 6 12];
imp_J_trapz_Ns = zeros(size(imp_intervals));
for k = 1:numel(imp_intervals)
    n = imp_intervals(k);
    imp_t_s = linspace(0,imp_T_s,n+1);
    imp_F_N = imp_F0_N*exp(-imp_t_s/imp_tau_s);
    imp_J_trapz_Ns(k) = trapz(imp_t_s,imp_F_N);
end
imp_J_exact_Ns = imp_F0_N*imp_tau_s*(1-exp(-imp_T_s/imp_tau_s));
imp_abs_error_Ns = abs(imp_J_trapz_Ns-imp_J_exact_Ns);
assert(all(diff(imp_abs_error_Ns) < 0))
assert(all(imp_J_trapz_Ns > 0 & imp_J_trapz_Ns < imp_F0_N*imp_T_s))

% Use the six-interval case so the physical spacing is 0.5 s rather than
% MATLAB's implicit unit spacing in trapz(y).
imp_n = imp_intervals(2);
imp_t_s = linspace(0,imp_T_s,imp_n+1);
imp_F_N = imp_F0_N*exp(-imp_t_s/imp_tau_s);
imp_dt_s = imp_T_s/imp_n;
imp_manual_Ns = imp_dt_s*(0.5*imp_F_N(1)+sum(imp_F_N(2:end-1))+0.5*imp_F_N(end));
assert(abs(imp_manual_Ns-trapz(imp_t_s,imp_F_N)) < 1e-12)
imp_wrong_missing_axis = trapz(imp_F_N);
assert(abs(imp_wrong_missing_axis-imp_manual_Ns) > 0.1)

% Supplied Simpson result for six intervals in Context A.
imp_n_simpson = 6;
imp_t_simpson_s = linspace(0,imp_T_s,imp_n_simpson+1);
imp_F_simpson_N = imp_F0_N*exp(-imp_t_simpson_s/imp_tau_s);
imp_h_simpson_s = imp_T_s/imp_n_simpson;
imp_J_simpson_Ns = (imp_h_simpson_s/3)*(imp_F_simpson_N(1)+imp_F_simpson_N(end) + ...
    4*sum(imp_F_simpson_N(2:2:end-1)) + 2*sum(imp_F_simpson_N(3:2:end-2)));

% Context B - work from a position-dependent force.
work_F0_N = 4; work_L_m = 0.50; work_X_m = 0.80;
work_intervals = [4 8 16];
work_W_trapz_J = zeros(size(work_intervals));
for k = 1:numel(work_intervals)
    n = work_intervals(k);
    work_x_m = linspace(0,work_X_m,n+1);
    work_F_N = work_F0_N*(1+(work_x_m/work_L_m).^2);
    work_W_trapz_J(k) = trapz(work_x_m,work_F_N);
end
work_W_exact_J = work_F0_N*(work_X_m + work_X_m^3/(3*work_L_m^2));
work_abs_error_J = abs(work_W_trapz_J-work_W_exact_J);
assert(all(diff(work_abs_error_J) < 0))
assert(all(work_W_trapz_J > 0))

% Context C - accumulated charge from a decaying current.
chg_I0_A = 0.012; chg_tau_s = 1.5; chg_T_s = 4.5;
chg_intervals = [3 6 12];
chg_Q_trapz_C = zeros(size(chg_intervals));
for k = 1:numel(chg_intervals)
    n = chg_intervals(k);
    chg_t_s = linspace(0,chg_T_s,n+1);
    chg_I_A = chg_I0_A*exp(-chg_t_s/chg_tau_s);
    chg_Q_trapz_C(k) = trapz(chg_t_s,chg_I_A);
end
chg_Q_exact_C = chg_I0_A*chg_tau_s*(1-exp(-chg_T_s/chg_tau_s));
chg_abs_error_C = abs(chg_Q_trapz_C-chg_Q_exact_C);
assert(all(diff(chg_abs_error_C) < 0))
assert(all(chg_Q_trapz_C > 0))

reference_summary = table(imp_J_exact_Ns,imp_J_trapz_Ns(end),imp_J_simpson_Ns, ...
    work_W_exact_J,work_W_trapz_J(end),chg_Q_exact_C,chg_Q_trapz_C(end), ...
    'VariableNames',{'ImpulseExact_Ns','ImpulseFineTrapz_Ns','ImpulseSuppliedSimpson_Ns', ...
    'WorkExact_J','WorkFineTrapz_J','ChargeExact_C','ChargeFineTrapz_C'})
