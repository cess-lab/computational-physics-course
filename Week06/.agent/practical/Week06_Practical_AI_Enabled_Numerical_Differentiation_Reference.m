% Hidden instructor reference for Week 06 practical QA.
vert_y0_m = 0; vert_v0_mps = 18; vert_g_mps2 = 9.81; vert_t0_s = 0.8;
vert_h_s = [0.4 0.2 0.1 0.05];
vert_y_now_m = vert_y0_m + vert_v0_mps*vert_t0_s - 0.5*vert_g_mps2*vert_t0_s^2;
vert_y_forward_m = vert_y0_m + vert_v0_mps*(vert_t0_s+vert_h_s) - 0.5*vert_g_mps2*(vert_t0_s+vert_h_s).^2;
vert_v_forward_mps = (vert_y_forward_m-vert_y_now_m)./vert_h_s;
vert_v_exact_mps = vert_v0_mps - vert_g_mps2*vert_t0_s;
vert_abs_error_mps = abs(vert_v_forward_mps-vert_v_exact_mps);
assert(all(diff(vert_abs_error_mps) < 0))
vert_h_demo_s = vert_h_s(1);
vert_wrong_denominator_mps = (vert_y_forward_m(1)-vert_y_now_m)/vert_t0_s;
assert(abs(vert_wrong_denominator_mps-vert_v_forward_mps(1)) > 0.1)
pot_V0_V = 12; pot_L_m = 0.25; pot_x0_m = 0.10;
pot_h_m = [0.05 0.02 0.01 0.005];
pot_V_now_V = pot_V0_V*exp(-pot_x0_m/pot_L_m);
pot_V_forward_V = pot_V0_V*exp(-(pot_x0_m+pot_h_m)/pot_L_m);
pot_dVdx_forward_Vpm = (pot_V_forward_V-pot_V_now_V)./pot_h_m;
pot_E_forward_Vpm = -pot_dVdx_forward_Vpm;
pot_E_exact_Vpm = (pot_V0_V/pot_L_m)*exp(-pot_x0_m/pot_L_m);
pot_abs_error_Vpm = abs(pot_E_forward_Vpm-pot_E_exact_Vpm);
assert(all(pot_E_forward_Vpm > 0))
assert(all(diff(pot_abs_error_Vpm) < 0))
cool_T0_C = 80; cool_Tenv_C = 25; cool_k_per_s = 0.08; cool_t0_s = 10;
cool_h_s = [5 2 1 0.5];
cool_T_now_C = cool_Tenv_C + (cool_T0_C-cool_Tenv_C)*exp(-cool_k_per_s*cool_t0_s);
cool_T_forward_C = cool_Tenv_C + (cool_T0_C-cool_Tenv_C)*exp(-cool_k_per_s*(cool_t0_s+cool_h_s));
cool_rate_forward_Cps = (cool_T_forward_C-cool_T_now_C)./cool_h_s;
cool_rate_exact_Cps = -cool_k_per_s*(cool_T0_C-cool_Tenv_C)*exp(-cool_k_per_s*cool_t0_s);
cool_abs_error_Cps = abs(cool_rate_forward_Cps-cool_rate_exact_Cps);
assert(all(cool_rate_forward_Cps < 0))
assert(all(diff(cool_abs_error_Cps) < 0))
h_central_s = 1;
cool_T_plus_C = cool_Tenv_C + (cool_T0_C-cool_Tenv_C)*exp(-cool_k_per_s*(cool_t0_s+h_central_s));
cool_T_minus_C = cool_Tenv_C + (cool_T0_C-cool_Tenv_C)*exp(-cool_k_per_s*(cool_t0_s-h_central_s));
cool_rate_central_Cps = (cool_T_plus_C-cool_T_minus_C)/(2*h_central_s);
assert(abs(cool_rate_central_Cps-cool_rate_exact_Cps) < abs(cool_rate_forward_Cps(3)-cool_rate_exact_Cps))
reference_summary = table(vert_v_exact_mps,vert_v_forward_mps(end),pot_E_exact_Vpm,pot_E_forward_Vpm(end),cool_rate_exact_Cps,cool_rate_forward_Cps(end), ...
    'VariableNames',{'VerticalExact_mps','VerticalForwardSmallestH_mps','ElectricFieldExact_Vpm','ElectricFieldForwardSmallestH_Vpm','CoolingExact_Cps','CoolingForwardSmallestH_Cps'})
