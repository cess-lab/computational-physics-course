%
% Chemical Potential for BE and FD
%
function Chemical_Potential
clear all;  help Chemical_Potential      % Clear the memory and print header
%
fprintf('Chemical Potential for Bose-Einstein and Fermi-Dirac \n')
fprintf('For BE, He4 Nuclei While for FD, e in Li \n')
global LL N_V
%
% constants
%
rho = 0.125 ;  % He density gm/cm^3
rho = rho .*10 .^3;    % density in kg/m^3
No = 6.02 .*10 .^26;   % Avagadros # - kg
Ahe = 4;
N_V = No .*rho ./Ahe;    % number density
h = 6.6 .*10 .^-34;  % Planck const j-sec
hbar = h ./(2.0 .*pi);
k = 1.38 .*10 .^-23; % Boltz const - j/K
m = 1.67 .*10 .^-27;  % p mass kg
%
% look for the critical energy
%
y = (2.0 .*pi .*hbar .*hbar) ./(Ahe .*m);
%
T = logspace(0,3);
L = sqrt(y ./(k .*T));    % characteristic length - deBroglie
Ec = y .*((N_V ./2.61) .^0.6666) ;   % critical energy, spin zero, 2.61 = zeta2/3(0)
Ecev = Ec ./(1.6 .*10 .^-19); % in eV - convert joule
Tc = Ec ./k; % in oK
%
fprintf('Critical Energy and Temperature in He = %g, %g (eV,oK) \n',Ecev, Tc)
%
% find the chemical potential given the number density - explicitly 
%
for i = 1:length(T)
    LL = L(i);
    alf = fminsearch(@minzet,0.5);
    mu(i) = -log(alf);  % chemical potential in kT units
end
%
figure(1)
semilogx(T,real(mu),'-')
ylabel('\mu/kT')
xlabel('T(K)')
title('Chemical Potential for He4')
hold on
semilogx(Tc,0.1,'r*')
hold off
%
% now Lithium for e in metals - FD
%
rho = 0.534 ;  % Li density gm/cm^3
rho = rho .*10 .^3;    % density on kg/m^3
No = 6.02 .*10 .^26;   % Avagadros # - kg
ALi = 6.94;                  % atommic weight
N_V = No .*rho ./ALi;     % number density
me = 9.1 .*10 .^-31;    % me in kG
c1 = 1.6 .*10 .^-19 ;    % eV to j, electron charge
%
% compute T = 0 Fermi Level
%
kf = (3.0 .*pi .*pi .*N_V) .^0.33333;
ef = (hbar .*kf) .^2 ./(2.0 .*me);
ef = ef ./c1; % joule to eV
tf = ef .*40 .*300; % assocaited temperature 
fprintf('Fermi Level and Temperature e in Li = %g eV, %g (oK) \n',ef,tf)
T = logspace(3,5);
%
for i = 1:length(T)
      % chemical potential in Fermi Level (T=0) Units - Approx expansion
      kk = 1.0 ./(40 .*300);
      muf(i) = 1.0 - ((pi .*kk .*T(i)) .^2) ./(12 .*ef .*ef);
      muf(i) = muf(i) - ((pi .*kk .*T(i)) .^4) ./(80 .*ef .^4);
      if muf(i) < 0;
          muf(i) = 0;
      end
end
%
figure(2)
semilogx(T,muf,'-')
ylabel('\mu/E_F')
xlabel('T(K)')
title('Chemical Potential for Li in Fermi Level (T=0) Units')
hold on
semilogx(tf,0.5,'r*')
hold off
%    
function[yy] = minzet(a)
global LL N_V
    % numerical evaluation of the Riemann function
    y = 0;
    for i = 1:500
        y = y +  (a .^i) ./(i .^1.5);
    end  
    yy = abs(LL .^3 .*N_V - y);   
%
