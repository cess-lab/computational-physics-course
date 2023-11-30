%
% Star Models - ODE solutions, numerical integration from r = 0 out
%
function Star_ODE3
clear all;     
help Star_ODE3;  % Clear memory and print header
%
iloop = 0;
irun = 1;
%
while irun > 0
    kk = menu('Another Star Mass and Radius?','Yes','No');
    if kk == 2
        irun = -1;
        break
    end
    if kk == 1
        %
        % input mass and radius in solar units 
        %
        m = input('Enter Mass in Solar Mass Units: ');
        r = input('Enter Radius in Solar Radius Units: ');
        %
        % some data stored in sundat .m file - x = r/R vs m/M, l/L, rho, P, T
        % can compare to model.
        % X = 0.73, Y = 0.25 Z 0.02 - hydrogen, helium, heavy element in sun
        %
        % --------------------------------------------------------------  Solar Constants
        Ro = 7 .* 10 .^10 ;% sun radius cm
        Mo = 2 .* 10 .^33 ;% sun mass gm
        M = m .*Mo;
        R = r .*Ro;
        Lo = 3.85 .*10 .^26 ; %sun luminosity W
        Lo = Lo .* 10 .^7 ;    % erg units
        Po = 2.2 .*10 .^17 ; %sun central pressure gm*cm/sec^2
        To = 1.5 .*10 .^7 ; % sun central temp deg K
        rhoc = 150.0  ; % central sun density gm/cm^3
        Teff = 5760.0 ; % effective black body sun temp
        % -------------------------------------------------------------   Physical Constants
        %
        % now go into ODE solution, Try to input core density and pressure and integrate out in r as an
        % initial value problem
        %
        fprintf('\n Now Solve ODE System for a Convective Hydrogen Star \n');
        RHOc = input('Enter Central Density (kgm/m^3), Sun is 150,000 - ');
        RHOc = RHOc .*0.001;
        Tcc = input('Enter Core Temperature (10^7 K), Sun is 1.5 - ');
        Tcc = Tcc .*10 .^7;
        %
        kb = 1.38 .*10 .^-16 ; % Boltzmann const erg/deg K
        mp = 1.67 .*10 .^-24 ; % proton mass gm
        Pg = (RHOc .*kb .*Tcc) ./(mp); 
        Pgg = Pg .*0.00001; % pressure due to gas collisions - hydrogen
        sig = 5.67 .*10 .^-12 ; % Stefan-B const W/(cm^2 degK^4)
        sig = sig .*10 .^7 ;     % S-B in erg/(sec*cm^2 degK^4) 
        c = 3.0 .*10^10 ; %light speed cm/sec
        a = (4.0 .*sig) ./c; % radiation constant
        Pt = (a .*Tcc .^4) ./3.0;
        Ptt = Pt .*0.00001 ; % pressure due to radiation
        Pc = Pg + Pt;
        fprintf('Core Pressure (kgm*m/sec^2) Due to Gas, %g and Radiation %g  \n',Pgg,Ptt);
        %
        fprintf('dM/dr = 4*pi*r^2*rho - M = mass < r \n')
        fprintf('dP/dr = -rho*G*M/r^2 - Pressure change due to gravity \n')
        fprintf('dL/dr  4*pi*r^2*rho*eps - Luminoisty change due to energy production \n')
        fprintf('dT/dr = -3*kap*rho*L/(16*pi*r^2*a*c*T^3) - Temp change due to opacity kap - radiation \n')
        fprintf('dT/dr = (1-1/g)T/P(dP/dr) - convective temperature gradient \n')
        fprintf('P = (rho*k*T)/mu*mp + (a/3)*T^4 - eq of state, pressure due to gas and radiation \n')
        %
        kap = (7.4 .*10^22 .*RHOc) ./Tcc .^3.5;
        eps = 0.2 .*10^-36 .*RHOc .*Tcc .^5;
        %
        kapp = 0.1 .*kap;
        epss = eps .*0.0001;
        %
        fprintf('Opacity Kappa at Core (m^2/kgm) %g  \n',kapp);
        fprintf('Energy Production Epsilon at Core (W/kgm*sec) %g  \n',epss);
        %
        % pressure comes from gas law + radiative pressure
        % unknowns are M, P, L, T - IC are M(0)=0, P(0) = Pg+Pt, L(0) = 0, T(0) = Tcc
        % density is derived from ideal gas law plus radiative pressure
        % assume a convective gas star - ignoring radiative opacity, ~ sun
        %
        fprintf('Start at r=0, M(0)=L(0)=0, P(0)=Pc, T(0)=Tc, rho derived from P and T \n')
        %
        tspan = linspace(0.001,R,100);
        [t,y] = ode45(@star,tspan,[0 Pc 0 Tcc]); % M, P, L, T
        %
        iloop = iloop + 1;
        figure(iloop);
        %
        MMM = 0.001 .*y(:,1);
        plot(t ./R,MMM)
        xlabel('r/R')
        ylabel('Mass(kgm)')
        title(' Model of Mass Distribution and Solar Data')
        hold on
        load sundat
        Msun = 1.9 .*10 .^30 .*m;
        plot(x,Msun,'o')
        hold off
        %
        iloop = iloop + 1;
        figure(iloop);
        %
        PPP = y(:,2) .*0.00001;
        plot(t ./R,PPP)
        xlabel('r/R')
        ylabel('Pressure(kgm*m/sec^2)')
        title(' Stellar Pressure Distribution - Ionized H Gas , Convective ')
        %
        hold on
        Psol = ((2.0 .*10 .^12) .*(exp(lp)) ./(3.5 .*10 .^7));
        plot(x,Psol,'o')
        hold off
        %
        iloop = iloop + 1;
        figure(iloop);
        %
        LLL = y(:,3) .*10 .^-7;
        plot(t ./R,LLL)
        xlabel('r/R')
        ylabel('Luminosity(W/sec)')
        title(' Stellar Luminosity Distribution')
        %
        hold on
        Lsolar = (3.8 .*10 .^26 .*exp(ll)) ./2.75;
        plot(x,Lsolar,'o')
        hold off
        iloop = iloop + 1;
        figure(iloop);
        %
        plot(t ./R,y(:,4))
        xlabel('r/R')
        ylabel('T(K)')
        title(' Stellar Temperature Distribution')
        %
        hold on
        %Tsolar = (1.5 .*10 .^7 .*exp(lt)) ./1300.0;
        Tsolar = [7.165, 7.102, 6.971, 6.823, 6.676, 6.535, 6.397, 6.256, 6.103, 5.782, 5.046];
        Tsolar = (1.5 .*10 .^7 .*exp(Tsolar)) ./1300.0;
        plot(x, Tsolar,'o')
        axis([0 1 10 .^6 2.0 .*10 .^7])
        hold off
        %
        iloop = iloop + 1;
        figure(iloop);
        %
        rhoo = ((y(:,2)- (a .* y(:,4) .^4) ./3.0) .*mp) ./(kb .*y(:,4));
        Rrhoo = rhoo .*1000;
        plot(t ./R,Rrhoo)
        xlabel('r/R')
        ylabel('\rho(kgm/m^3)')
        title(' Stellar Model for Density Distribution')
        %
        hold on
        Rhosolar = (150000 .*exp(ld)) ./8.2;
        plot(x,Rhosolar,'o')
        hold off
        %
    end
end
%
%-----------------------------------------------------------------------
%
function dy = star(t,y)
%
c = 3.0 .*10^10 ; %light speed cm/sec
G = 6.72 .*10^-8 ; % Newton const cm^3/gm*sec^2
kb = 1.38 .*10 .^-16 ; % Boltzmann const erg/deg K
sig = 5.67 .*10 .^-12 ; % Stefan-B const W/(cm^2 degK^4)
sig = sig .*10 .^7 ;     % S-B in erg/(sec*cm^2 degK^4)
a = (4.0 .*sig) ./c; % radiation constant
mp = 1.67 .*10 .^-24 ; % proton mass gm
%
% y(1) = M, y(2) = P, y(3) = L, y(4) = T
% use ideal gas law to derive the density rho
% t is the parameter = radius here
%
dy = zeros(4,1);
rho = ((y(2)- (a .* y(4) .^4) ./3.0) .*mp) ./(kb .*y(4));
%
dy(1) = 4.0 .*pi .*rho .*t .^2;
dy(2) = -(rho .*G .*y(1))./t .^2;
eps = 0.2 .*10^-36 .*rho .*(y(4) .^5);
dy(3) = dy(1) .*eps;
%kap = (8.0 .*10^22 .*rho) ./(y(4) .^3.5);  go to convective
%dy(4) = -(3.0 .*kap .*rho .*y(3)) ./(16.0 .*pi .*a .*c .*(y(4) .^3) .*t .^2);
dy(4) = ((0.1) .*y(4).*dy(2)) ./y(2);
%