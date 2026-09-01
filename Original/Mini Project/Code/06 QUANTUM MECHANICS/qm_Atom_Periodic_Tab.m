%
% Program to look at radius and ionization potential of atoms Z = [1, 18]
%
clear all; help qm_Atom_Periodic_Tab;  % Clear memory and print header
% 
fprintf(' Atomic radius and Ionization Potential \n');
fprintf(' For Hydrogen Atom, Eo = 13.6 eV = mec^2alpha^2/2 \n');
fprintf(' For Hydrogen Atom, ao = 0.54 A = lambdabar/alpha, lambdabar = hbar/mec = 0.004 A \n');
fprintf(' For Hydrogen Atom, Eo = e^2/2ao, beta = v/c = alpha \n');
%
%
ion = [13.6 24.6 5.4 9.3 8.3 11.3 14.5 13.6 17.4 21.6 5.1 7.6 6.0 8.15 10.5 10.4 13.0 15.75];
rad = [0.37 0.5 1.52 1.11 0.88 0.77 0.70 0.66 0.64 0.70 1.86 1.60 1.43 1.17 1.10 1.04 0.99 0.94];
Z=(1:18);
%
fprintf(' Filling Sequence = (1s)^2(2s)^2(2p)^6(3s)^2(3p)^6 \n');
%
figure(1)
plot(Z,ion,'-o')
xlabel('Z')
ylabel('Ionization Potential(eV)')
title('Periodic Table Ionization Potential')
%
figure(2)
plot(Z,rad,'-o')
xlabel('Z')
ylabel('<r>(A)')
title('Periodic Table Mean Radius')
%
