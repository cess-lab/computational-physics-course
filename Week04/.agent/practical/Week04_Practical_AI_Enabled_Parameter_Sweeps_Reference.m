% Hidden instructor reference for Week 04 practical QA.
V_V = 0:1:12; R_ohm = [5 10 20]; I_A = zeros(length(R_ohm),length(V_V));
for i = 1:length(R_ohm), I_A(i,:) = V_V./R_ohm(i); end
assert(max(abs(I_A(:,1))) < 1e-12)
t_s = 0:0.1:3; v0_mps = [15 20 25]; y0_m = 0; g_mps2 = 9.81;
y_m = zeros(length(v0_mps),length(t_s));
for i = 1:length(v0_mps), y_m(i,:) = y0_m + v0_mps(i).*t_s - 0.5*g_mps2.*t_s.^2; end
assert(max(abs(y_m(:,1)-y0_m)) < 1e-12)
L_m = 0.2:0.2:2.0; g_values = [1.62 3.71 9.81]; T_s = zeros(length(g_values),length(L_m));
for i = 1:length(g_values), T_s(i,:) = 2*pi*sqrt(L_m./g_values(i)); end
earth_idx = 3; L1_idx = find(abs(L_m-1.0)<1e-12,1); earth_T_1m_s = T_s(earth_idx,L1_idx);
assert(abs(earth_T_1m_s-2.00606668) < 1e-6)
