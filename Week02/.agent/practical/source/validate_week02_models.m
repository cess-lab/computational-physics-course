mass_kg = 0.50;
springConstant_N_per_m = 8.0;
amplitude_m = 0.12;
omega_rad_per_s = sqrt(springConstant_N_per_m/mass_kg);
period_s = 2*pi/omega_rad_per_s;
t_s = linspace(0,4*period_s,1001);
x_m = amplitude_m.*cos(omega_rad_per_s.*t_s);
v_m_per_s = -amplitude_m.*omega_rad_per_s.*sin(omega_rad_per_s.*t_s);
totalEnergy_J = 0.5*mass_kg.*v_m_per_s.^2 + 0.5*springConstant_N_per_m.*x_m.^2;
energyReference_J = 0.5*springConstant_N_per_m*amplitude_m^2;
assert(max(abs(totalEnergy_J-energyReference_J))/energyReference_J < 1e-12)
launchSpeed_m_per_s = 18.0;
launchAngle_rad = deg2rad(40.0);
initialHeight_m = 1.5;
gravity_m_per_s2 = 9.81;
vx0_m_per_s = launchSpeed_m_per_s*cos(launchAngle_rad);
vy0_m_per_s = launchSpeed_m_per_s*sin(launchAngle_rad);
flightTime_s = (vy0_m_per_s + sqrt(vy0_m_per_s^2 + 2*gravity_m_per_s2*initialHeight_m))/gravity_m_per_s2;
range_m = vx0_m_per_s*flightTime_s;
peakTime_s = vy0_m_per_s/gravity_m_per_s2;
peakHeight_m = initialHeight_m + vy0_m_per_s^2/(2*gravity_m_per_s2);
assert(abs(flightTime_s-2.4820618) < 1e-6)
assert(abs(range_m-34.2246540) < 1e-6)
assert(abs(peakTime_s-1.17942) < 1e-4)
assert(abs(peakHeight_m-8.3230884) < 1e-6)
disp('WEEK02_MODEL_VALIDATION_OK')
