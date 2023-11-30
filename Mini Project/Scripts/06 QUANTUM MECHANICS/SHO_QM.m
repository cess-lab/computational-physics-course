%
% Solutions for the Simple Harmonic Oscillator
%
clear all;  
help SHO_QM     % Clear the memory and print header
%
% Initialize  
%
fprintf('There are few Solvable Problems in 3-d QM \n ')
fprintf('Examples are the Hydrogen Atom and the Harmonic Oscillator \n ')
%
mec2 = 511000.0;  % eV - electron mass
hbarc = 2000.0;   % ev*A 
%
labe = hbarc/mec2; % e Compton Wavelength in A
% w/c = 1 in length units, y = x*sqrt(mec2*c/hbarc)*x = sqrt(w/c)/labmdabare)
y = linspace(0,4); % radius in dimensionless units
%
fprintf('Ground State Energy, w^2 = k/m, Eo = hbar*w/2, Energy Level Spacing = 2*Eo \n ')
%Eo = hbar*w/2;   
% ground state energy, w^2 = k/m. 
%
psi0 = (exp((-y .^2) ./2.0)) .^2;
% 
psi1 = psi0 .*4.0 .*y .^2;
% 
psi2 = psi0 .*((4.0 .*y .*y - 2.0) .^2);
%
figure(1)
plot(y,psi0 .*5,'b-',y,psi1 .*2,'r:',y,psi2,'g-.')
title('Simple harmonic Oscillator,1-d, n = 0,1,2')
xlabel('y = x*sqrt(m*w/hbar)')
ylabel('|\Psi(x)|^2')
legend('n=0','n=1','n=2')
%
 