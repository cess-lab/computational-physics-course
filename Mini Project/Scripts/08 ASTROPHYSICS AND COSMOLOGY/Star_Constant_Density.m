%
% Program to look at Star with Constant Density
%
clear;  
help Star_Constant_Density;  % Clear memory and print header
%
rsun = 6.96 .*10 .^8 ;   % solar radius (m) , mass a mean density
msun = 2.0 .*10 .^30;   % mass (kg)
rhosun = (msun .*3.0) ./(4.0 .*pi .*rsun .^3) ;
fprintf(' Solar Mean Density = %g(kg/m^3) \n' ,rhosun);
%
ms = input('Enter the Stellar Mass in Units of the Mass of the Sun: ');
%
M = ms .*msun;
c = 3.0 .*10^8 ; %light speed m/sec
G = 6.72 .*10^-11 ; % Newton const m^3/kg*sec^2
kb = 1.0 ./(300.0 .*40) ; % Boltzman in eV
mn = 0.936 .*10^9; % nucleon mass eV
hbar = 1.05 .*10 .^-34;
k = 1.38 .*10 .^-23;
rsc = (2.0 .*G .*M) ./(c .^2) ;   % Schwartzchild radius
Ts = (hbar .* c .^3) ./(8.0 .*pi .*G .*M .*k); % Hawking temp
%
fprintf(' Schwartzchild Radius = %g(m) \n' ,rsc);
fprintf(' Hawking Temperature of Black Hole = %g(oK) \n' ,Ts);
%
% find pressure at center of the star - it is rs/(2*R)
%
R = (3.0 .*M ./(4 .*pi .*rhosun)) .^0.3333 ;  % radius of star of solar density
Po = rsc ./(2.0 .*R);
%
fprintf(' Relativistic Star? - Radius = %g m, Ratio P(o)/rho*c*c = %g \n' ,R,Po);
%
T = 30000000.0;
rat = (kb .*T) ./mn; % nucleon gas Po/rho*c*c at temp T
%
fprintf(' Relativistic Star? - Nucleon Gas - P(o)/rho*c*c = kT/Mn*c*c = %g \n' ,rat);
%
fprintf('Critical Density- when mean particle seperation~ deBroglie lambda ~ 2 x 10^9 kg/m^3  \n')
%
