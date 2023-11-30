% 
% Solutions for the Hydrogen Atom
%
clear all;  help qm_H_Atom     % Clear the memory and print header
%
% Initialize  
%
fprintf('There are few Solvable Problems in 3-d QM \n ')
fprintf('Examples are the Hydrogen Atom and the Harmonic Oscillator \n ')
%
mec2 = 511000.0;  % eV - electron mass
hbarc = 2000.0;   % ev*A 
%
% Bohr radius
%
labe = hbarc/mec2;
alf = 1.0 ./137;
ao = labe ./alf;   % <R> ~ AO * N^2
%
Eo = -(mec2 .*alf .*alf) ./2.0;   % ground state energy
E1 = Eo ./4;
E2 = Eo ./9; 
for i = 1:2
    EEo(i) = Eo;
    EE1(i) = E1;
    EE2(i) = E2;
end
%
ro = (3.0 .*ao) ./2.0; % mean radii in ao units
r1 = ro .*4;
r2 = ro .*9;
rro = linspace(0,ro,2); % points for plot
rr1 = linspace(0,r1,2);
rr2 = linspace(0,r2,2);
%
figure(1)
plot(rro,EEo,'b-',rr1,EE1,'r:',rr2,EE2,'g-.')
title(' Hydrogen Atom for n=1,2,3 : Mean Radius and Energy Level')
xlabel('Mean Radius in A')
ylabel('Energy (eV)')
legend('n=1','n=2','n=3')
%
r = linspace(0,10);   % radius in Angstroms
q = r ./ao;
psi0 = (exp(-q)) .^2;
%
psi1 = ((exp(-q ./2.0) .*(1 - q ./2.0))) .^2;
%
psi2 = (exp(-q ./3.0) .*(1 - (2.0 .*q) ./3.0 + (2.0 .*q .*q) ./27.0)) .^2;;
%
figure(2)
semilogy(q,psi0 ,'b-',q,psi1,'r:',q,psi2,'g-.')
title('Hydrogen Atom, Radial Wavefunction ^2 for l = o, n = 1,2,3')
xlabel('r/ao')
ylabel('|\Psi(r)|^2')
legend('n=1','n=2','n=3')
axis([0 20 0.00001 2]);
%
figure(3)
plot(q,psi0 .*5 .*q .*q,'b-',q,psi1 .*2 .*q .*q,'r:',q,psi2 .*q .*q,'g-.')
title('Hydrogen Atom, Probability Density for l = o, n = 1,2,3')
xlabel('r/ao')
ylabel('|\Psi(r)|^2*r^2')
legend('n=1','n=2','n=3')
%