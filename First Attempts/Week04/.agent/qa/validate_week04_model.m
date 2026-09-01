mass_kg = 0.50;
outerSpring_Npm = 20.0;
couplingSpring_Npm = 10.0;
M_kg = diag([mass_kg mass_kg]);
K_Npm = [outerSpring_Npm+couplingSpring_Npm, -couplingSpring_Npm; -couplingSpring_Npm, outerSpring_Npm+couplingSpring_Npm];
[modeRaw,D] = eig(K_Npm,M_kg);
[lambda_per_s2,idx] = sort(diag(D));
modeRaw = modeRaw(:,idx);
frequency_Hz = sqrt(lambda_per_s2)/(2*pi);
expectedLambda_per_s2 = [40;80];
expectedFrequency_Hz = [1.0065842420897408;1.4235250868343543];
assert(max(abs(lambda_per_s2-expectedLambda_per_s2)) < 1e-12)
assert(max(abs(frequency_Hz-expectedFrequency_Hz)) < 1e-12)
for modeIndex = 1:2
    phi = modeRaw(:,modeIndex);
    lambda = lambda_per_s2(modeIndex);
    scaledResidual = norm(K_Npm*phi-lambda*M_kg*phi,2)/(norm(K_Npm,2)*norm(phi,2)+abs(lambda)*norm(M_kg,2)*norm(phi,2));
    assert(scaledResidual < 1e-14)
end
modeMassNormalized = modeRaw;
for modeIndex = 1:2
    phi = modeMassNormalized(:,modeIndex);
    modeMassNormalized(:,modeIndex) = phi/sqrt(phi'*M_kg*phi);
end
assert(norm(modeMassNormalized'*M_kg*modeMassNormalized-eye(2),inf) < 1e-12)
couplingValues_Npm = [0;5;10;20;40];
couplingFrequency_Hz = zeros(numel(couplingValues_Npm),2);
for sweepIndex = 1:numel(couplingValues_Npm)
    kc = couplingValues_Npm(sweepIndex);
    K_sweep_Npm = [outerSpring_Npm+kc, -kc; -kc, outerSpring_Npm+kc];
    lambdaSweep_per_s2 = sort(eig(K_sweep_Npm,M_kg));
    couplingFrequency_Hz(sweepIndex,:) = (sqrt(lambdaSweep_per_s2)/(2*pi))';
end
assert(max(abs(couplingFrequency_Hz(:,1)-expectedFrequency_Hz(1))) < 1e-12)
assert(all(diff(couplingFrequency_Hz(:,2)) > 0))
assert(abs(couplingFrequency_Hz(1,1)-couplingFrequency_Hz(1,2)) < 1e-12)
M_asymmetric_kg = diag([0.50 0.75]);
[modeAsym,DAsym] = eig(K_Npm,M_asymmetric_kg);
[lambdaAsym_per_s2,idxAsym] = sort(diag(DAsym));
modeAsym = modeAsym(:,idxAsym);
frequencyAsym_Hz = sqrt(lambdaAsym_per_s2)/(2*pi);
expectedAsymFrequency_Hz = [0.884011626893878;1.32346251725347];
assert(max(abs(frequencyAsym_Hz-expectedAsymFrequency_Hz)) < 1e-12)
for modeIndex = 1:2
    phi = modeAsym(:,modeIndex);
    lambda = lambdaAsym_per_s2(modeIndex);
    scaledResidual = norm(K_Npm*phi-lambda*M_asymmetric_kg*phi,2)/(norm(K_Npm,2)*norm(phi,2)+abs(lambda)*norm(M_asymmetric_kg,2)*norm(phi,2));
    assert(scaledResidual < 1e-14)
end
disp('WEEK04_MODEL_VALIDATION_OK')
