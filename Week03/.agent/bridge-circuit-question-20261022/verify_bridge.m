bridgeQa20261022 = struct;
bridgeQa20261022.A = [12 -6 0; -6 18 -6; 0 -6 12];
bridgeQa20261022.b = [24; 0; 0];
bridgeQa20261022.I = bridgeQa20261022.A \ bridgeQa20261022.b;
% Independent nodal equations: unknown node potentials [VA; VB; VC].
bridgeQa20261022.G = [5/6 -1/6 -1/3; -1/6 2/3 -1/6; -1/3 -1/6 1/2];
bridgeQa20261022.V = bridgeQa20261022.G \ [8; 0; 0];
bridgeQa20261022.branchI = [(24-bridgeQa20261022.V(1))/3; (bridgeQa20261022.V(1)-bridgeQa20261022.V(2))/6; (bridgeQa20261022.V(1)-bridgeQa20261022.V(3))/6; (bridgeQa20261022.V(1)-bridgeQa20261022.V(3))/6; (bridgeQa20261022.V(3)-bridgeQa20261022.V(2))/6];
% Directions: source, A->B via R7, A->C via Rb, upper route, C->B.
bridgeQa20261022.power = sum([3;3;1;2;2;4;6;3;6] .* [2.5;2.5;.5;.5;1;1;1.5;.5;.5].^2);
disp('Mesh currents [I1; I2; I3] (A):'); disp(bridgeQa20261022.I)
disp('Independent node voltages [VA; VB; VC] (V):'); disp(bridgeQa20261022.V)
disp('Branch currents [source; R7; Rb; upper route; lower route] (A):'); disp(bridgeQa20261022.branchI)
fprintf('Maximum KVL residual: %.3g V\n', max(abs(bridgeQa20261022.A*bridgeQa20261022.I-bridgeQa20261022.b)));
fprintf('Source power: %.12g W; total resistor power: %.12g W\n',24*bridgeQa20261022.I(1),bridgeQa20261022.power);
assert(max(abs(bridgeQa20261022.I-[2.5;1;.5])) < 1e-12);
assert(max(abs(bridgeQa20261022.V-[16.5;7.5;13.5])) < 1e-12);
assert(abs(bridgeQa20261022.power-60) < 1e-12);
