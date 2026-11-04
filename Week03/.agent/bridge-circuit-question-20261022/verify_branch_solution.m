% Backend verification only; not a student-facing Live Script.
branchSolutionQa20261022 = struct;
branchSolutionQa20261022.A = [12 6 6; 6 -12 -6; 0 6 -6];
branchSolutionQa20261022.b = [24;0;0];
branchSolutionQa20261022.x = branchSolutionQa20261022.A \ branchSolutionQa20261022.b;
branchSolutionQa20261022.I2 = branchSolutionQa20261022.x(1);
branchSolutionQa20261022.I3 = branchSolutionQa20261022.x(2);
branchSolutionQa20261022.I4 = branchSolutionQa20261022.x(3);
branchSolutionQa20261022.I1 = sum(branchSolutionQa20261022.x);
branchSolutionQa20261022.I5 = sum(branchSolutionQa20261022.x(2:3));
branchSolutionQa20261022.I = [branchSolutionQa20261022.I1;branchSolutionQa20261022.I2;branchSolutionQa20261022.I3;branchSolutionQa20261022.I4;branchSolutionQa20261022.I5];
branchSolutionQa20261022.G = [5/6 -1/6 -1/3; -1/6 2/3 -1/6; -1/3 -1/6 1/2];
branchSolutionQa20261022.V = branchSolutionQa20261022.G \ [8;0;0];
branchSolutionQa20261022.independentI = [(24-branchSolutionQa20261022.V(1))/3;(branchSolutionQa20261022.V(1)-branchSolutionQa20261022.V(2))/6;(branchSolutionQa20261022.V(1)-branchSolutionQa20261022.V(3))/6;(branchSolutionQa20261022.V(1)-branchSolutionQa20261022.V(3))/6;(branchSolutionQa20261022.V(3)-branchSolutionQa20261022.V(2))/6];
disp('Reduced unknowns [I2;I3;I4] in A:');disp(branchSolutionQa20261022.x)
disp('Five physical branch currents [I1;I2;I3;I4;I5] in A:');disp(branchSolutionQa20261022.I)
disp('Independent node voltages [VA;VB;VC] in V:');disp(branchSolutionQa20261022.V)
fprintf('Maximum reduced-system residual: %.3g V\n',max(abs(branchSolutionQa20261022.A*branchSolutionQa20261022.x-branchSolutionQa20261022.b)));
fprintf('Maximum difference from independent nodal currents: %.3g A\n',max(abs(branchSolutionQa20261022.I-branchSolutionQa20261022.independentI)));
assert(max(abs(branchSolutionQa20261022.I-[2.5;1.5;.5;.5;1]))<1e-12);
assert(max(abs(branchSolutionQa20261022.I-branchSolutionQa20261022.independentI))<1e-12);
disp('PASS: five branch currents and independent nodal solution agree.');
