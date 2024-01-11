%
% Mean Energy per Molecule vs. Temp for BE Gas - Critical Temp
%
clear all;  
help Crit_Temp_He4      % Clear the memory and print header
%
fprintf('Critical Temperature for a Bose-Einstein Liquid \n')
fprintf('k*Tc = (2 * pi *hbar^2)/m[(N/V)/s*zeta3/2(1)]^2/3 \n')
%
A = input('Input the Atomic Weight of a Spin 0 Atom (s=1): ');
%
% constants
%
Tcc = 5.2;    % He4 crit temp, K
rho = 0.125 ;  % He density gm/cm^3
rho = rho .*10 .^3;    % density in kg/m^3
No = 6.02 .*10 .^26;   % Avagadros # - kg
N_V = No .*rho ./A;    % number density
h = 6.6 .*10 .^-34;  %Planck const j-sec
hbar = h ./(2.0 .*pi);
k = 1.38 .*10 .^-23; %Boltz const - j/K
m = 1.67 .*10 .^-27;  % p mass kg
%
% find the mean energy/molecule normalized to 3/2kT = classical value at
% high T, low density
%
y = (2.0 .*pi .*hbar ) ./sqrt(A .*m);
%
T = logspace(0,2);
L = y ./sqrt(3.0 .*k .*T);    % characteristic length - deBroglie
L = L .*(10 .^10);   % m -> A convert
y = (2.0 .*pi .*hbar .*hbar) ./(A .*m);
Ec = y .*((N_V ./2.61) .^0.6666) ;   % critical energy
Ecev = Ec ./(1.6 .*10 .^-19);
Tc = Ec ./k;
fprintf('Critical Energy and Temperature = %g eV, %g oK \n',Ecev,Tc)
%
% expansions above and below Tc
%
for i = 1:length(T)
    if T(i) > Tc
        Eav(i) = 1.0 - ((Tc ./T(i)) .^1.5) .*0.46;
    else
        Eav(i) = 0.5134 .*((T(i) ./Tc) .^1.5);
    end
end
%
figure(1)
semilogx(T,Eav,'-')
ylabel('<E>/3/2kT')
xlabel('T(K)')
title('Mean Energy per Molecule Normalized to High T Classical Value')
%
hold on
plot(Tcc,0.5,'r*')
hold off
%
figure(2)
loglog(T,L,'-b')
ylabel('deBroglie Wavelength, \lambda(A)')
xlabel('T(K)')
title('Wavelength of Molecule vs. Temperature')
%
hold on
plot(Tcc,4,'r*')
x(1) = min(T);
x(2) = max(T);
y(1) = ((N_V) .^-0.3333) .*10 .^10;
y(2) = y(1);
plot(x,y,'-g')
axis([1, 100 ,1, 20])
legend('\lambda_d_B', 'Tc','Atom Space')
hold off
%
fprintf('Wavelength Scales as sqrt(1/T*A) \n')
fprintf('Critical Temperature Scales as rho^2/3 / A^5/3 \n')
%