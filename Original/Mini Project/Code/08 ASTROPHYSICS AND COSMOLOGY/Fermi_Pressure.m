%
% Program to look at Stellar Masses and e and n Pressure
%
clear;  
help Fermi_Pressure;  % Clear memory and print header
%
fprintf(' Fermion Pressure ~ n^5/3 (NR), ~ n^4/3 (UR) \n');
%
me = 9.1 .*10 .^-31;    % mass of e and neutron, hbar c and G - MKS
mn = 1.69 .*10 .^-27;
hbar = 1.11 .*10 .^-34;
c = 3.0 .*10 .^8;
G = 6.67 .*10 .^-11; 
k = 1.38 .*10 .^-23;
%
rsun = 6.96 .*10 .^8 ;   % solar radius , mass a dnmean density
msun = 2.0 .*10 .^30;
rhosun = (msun .*3.0) ./(4.0 .*pi .*rsun .^3) ; % assumed uniform
%
ms = input('Enter the Stellar Mass in Units of the Mass of the Sun: ');
%
M = ms .*msun;
rsc = (2.0 .*G .*M) ./(c .^2) ;   % Schwartzchild radius
Ts = (hbar .* c .^3) ./(8.0 .*pi .*G .*M .*k); % Hawking temp
%
fprintf(' Schwartzchild Radius = %g(m) \n' ,rsc);
fprintf(' Hawking Temperature of Black Hole = %g(oK) \n' ,Ts);
%
R = logspace(3,9,100);
%
V = (4.0 .*pi .* R .^3) ./3.0;  % volume
N = M ./mn; % number of nucleons
rho = M ./V; % density at this radius, start with solar rho
%
% evaluate gravitational and e, n  pressure
%
Pg = (G .*M .*M) ./(V .^1.3333);
Pg = (Pg .*(4.0 .*pi ./3.0) .^0.33333) ./5.0;
Pe = (3.0 .*N ./(2.0 .*pi .*V)) .^1.66667;
Pe = (Pe .*hbar .*hbar .*pi .*pi .*pi) ./(15.0 .*me);
Pn = (3.0 .*N ./(pi .*V)) .^1.66667;
Pn = (Pn .*hbar .*hbar .*pi .*pi .*pi) ./(15.0 .*mn);
%
bete = (N ./(2.0 .*V)) .^0.33333;
bete = (bete .*pi .*hbar .* 3.0 .^0.1667) ./(me .*c .*2.0 .^0.5);
betn = (N ./V) .^0.33333;
betn = (betn .*pi .*hbar .* 3.0 .^0.1667) ./(mn .*c .*2.0 .^0.5);
%
% look at ratio of pressures of electrons in non-relativistic and
% relativistic regimes
%
pUR_pNR = (5.0 .*me .*c ) ./(4.0 .*hbar .*((3.0 .*pi .*pi) .^0.3333) .*((N ./V) .^0.33333));
%
for i = 1:length(R)
    if bete(i) > 1.0
        bete(i) = 1.0;
        Pe(i) = 0;
    end
    if betn(i) > 1.0
        betn(i) = 1.0;
        Pn(i) = 0;
    end
end
%
fprintf(' If e Pressure Exceeds Gravitational = White Dwarf \n' );
fprintf(' If n (e + p -> n + v) Pressure Exceeds Gravitational = Neutron Star \n' );
fprintf(' If n (e + p -> n + v) Pressure Fails as n Become relativistic = Black Hole \n' );
fprintf(' For M ~ a Few Solar Masses, R of Dwarf ~ 10^7 m, R of n Star ~ 10^4 m and R of a Black Hole ~ 10^3 m \n' );
%
figure(1)
loglog(R,Pg,'-b',R,Pe,'r:',R,Pn,'g.-',rsc,10 .^35,'k*')
xlabel('R(m)')
ylabel('Pressure(Pa)')
title('Pressure of Gravity , Electrons,and Nucleons')
legend('G','e','n')
%
figure(2)
loglog(R,bete,'b-',R,betn,'r:')
xlabel('R(m)')
ylabel('v/c')
title('Velocity Near the Fermi Edge , Electrons,and Nucleons')
legend('e','n')
%
figure(3)
loglog(R,pUR_pNR,'-')
xlabel('R(m)')
ylabel('P_U_R/P_N_R')
title('Ratio of Pressures of Electrons,Relativistic/non - Relativistic')
%