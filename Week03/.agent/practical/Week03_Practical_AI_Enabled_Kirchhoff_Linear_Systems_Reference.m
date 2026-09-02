% Hidden instructor reference for Week 03 practical QA.
sensor_A = [6 -2; -2 8]; sensor_b = [12;6]; sensor_x = sensor_A\sensor_b;
assert(max(abs(sensor_A*sensor_x-sensor_b)) < 1e-12)
G = [1/4+1/6+1/2, -1/2; -1/2, 1/5+1/10+1/2];
rhs = [12/4; 5/5]; node_v = G\rhs;
Ia = (node_v(1)-12)/4; I0a = node_v(1)/6; Iab = (node_v(1)-node_v(2))/2;
assert(abs(Ia+I0a+Iab) < 1e-12)
heater_A = [8 -3; -3 11]; heater_b = [18;9]; heater_x = heater_A\heater_b;
assert(max(abs(heater_A*heater_x-heater_b)) < 1e-12)

