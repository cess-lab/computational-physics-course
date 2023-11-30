%
% Fermi-Dirac Distribution of Number Density for Finite Temp - use MATLAB
% quad for numerical integration of difficult integrals
%
function Fermi_Dirac_Tne0
%
clear all; 
help Fermi_Dirac_Tne0;  % Clear memory and print header
%
% Initialize  - 
%
global k tt eef 
%
fprintf('dn/dE ~ sqrt(E)/(exp((E-EF)/kT) + 1), EF Depends on Density - Chemical Potential \n')
fprintf('At T = 0, E_F = (hbar*k_F)^2/2m, k_F=(3*pi*pi*N/V)^0.333 \n')
%
% integrals must be done numerically
%
hbarc = 2000.0;          % hbarc in eV*A
mec2 = 511000.0;          % electron mass in eV
k = 1.0 ./(40 .*300);   % Boltzmann const, kT - 1/40 eV at room temp = 300 degrees absolute
%
% constant for integrals - dimensions of (1/E)^3/2/L^3
%
C = (2.0 .*mec2) ./(hbarc .*hbarc);
C = (C .^1.5) ./(2.0 .*pi .*pi);
%
% units of Angstroms or number density in 10^23/cm^3
% first find the T = 0 limits where the integrals are closed form
%
T = linspace(0,80000,20);  % absolute temperature;
EF = linspace(0.,10.0,40);  % Fermi energy (chemical potential) in eV - electrons
%
nz = ((EF .^1.5) .*C .*2) ./3; % zero temo EF
%
figure(1)
plot(EF,nz,'-')
title('Number Density as a Function of Fermi Energy at T = 0')
xlabel('EF(eV)')
ylabel('n(1/A^3)')
%
for i = 1:length(T)
    for j= 1:length(EF)
        %
        % given T and EF, can integrate distribution to find n and energy
        %
        tt = T(i);
        eef = EF(j);
        %
        nn = quad(@FDI,0.000001,100.0);  % density in 1/A^3 units
        n(i,j) = C .*nn;
        %
    end
end
%
figure(2)
meshc(T,EF,n')
title('Number Density as a Function of Absolute Temperature and Fermi Level')
xlabel('Temp(^oK)')
ylabel('E_F(T)- eV')
zlabel('Number Density in 1/A^3 Units')
%
figure(3)
contour(T,EF,n')
title('Number Density as a Function of Absolute Temperature and Fermi Level')
xlabel('Temp(^oK)')
ylabel('E_F(T)- eV')
zlabel('Number Density in 1/A^3 Units')
%
hold on
%
% approximate expansion
%
EFAPP = 5.0 .*(1.0 - ((pi .*k.*T) .^2) ./(12.0 .*25)); 
plot(T,EFAPP,'*')
legend('E_F(T) Approx *')
hold off
%
% --------------------------------------------------------
%
function y = FDI(x)
%
global k tt eef 
%
y = sqrt(x);
y = y ./(exp((x-eef) ./(k .*tt)) + 1.0);
%