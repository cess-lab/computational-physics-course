% 
% Program to look at evidence for dark mattr 
% 
clear all;  
help DM_Evidence      % Clear the memory and print header
%
fprintf('Dark Matter is About 1/4 of the Universe by Mass \n')
fprintf('Dark Matter is Inferred from Galactic Rotation Curves \n')
fprintf('Dark Matter is Inferred from Einstein Ring Sizes \n')
fprintf('Dark Matter is Searched for in Scattering Experiments \n')
%
iloop = 0;
%
r = linspace(0,2);
for i = 1:length(r)
    if r(i) < 1
        v(i) = r(i);    % linear inside the galaxy
        vdm(i) = r(i);
    else
        v(i) = 1.0 ./sqrt(r(i));    % falls as sqrt if outside the mass distribution
        vdm(i) = r(i);    % keeps growing if inside DM distribution
    end
end
% 
iloop = iloop + 1; 
figure(iloop)
plot(r,v,'-b',r,vdm,':r')
xlabel('r/R, R = visible radius')
ylabel('velocity')
title('Rotation Curve for a Galexy')
legend('visible','dark')
%
b = 1;        % impact parameter for mass M
dsmdl = 10;   % source to mass distance
dl = 5;       % mass to observer distance
xM(1) = 0;    % set up the lines for the optics
zM(1) = dsmdl;
xs(1) = 0;           xS(1) = 0;
xs(2) = b;           xS(2) = -b;
zs(1) = 0;           zS(1) = 0;
zs(2) = dsmdl;       zS(2) = dsmdl;
xe(1) = b;           xE(1) = -b;
xe(2) = 0;           xE(2) = 0;
ze(1) = dsmdl;       zE(1) = dsmdl;
ze(2) = dsmdl + dl;  zE(2) = dsmdl + dl;
xee(1) = b .*(dsmdl+dl) ./dl; xEE(1) = -xee(1);
xee(2) = b ;                   xEE(2) = -b;
zee(1) = 0;                   zEE(1) = 0;
zee(2) = dsmdl;               zEE(2) = zee(2);
%
iloop = iloop + 1;
figure(iloop)
%
plot(xs,zs,'-b',xS,zS,'-b',xe,ze,'-b',xE,zE,'b-',xM,zM,'g*',xee,zee,':r',xEE,zEE,':r')
xlabel('Ring Size')
ylabel('Source, Mass and Observer Locations')
title('Schematic of Einstein Ring')
%
fprintf('The Galaxy Has a radius of ~ 30,000 LY \n')
fprintf('The Galaxy Rotates every 200 Million Years \n')
%
ly = 9.46 .*10 .^19;  %  m
T = 6.3 .*10 .^19; % period, sec
vdm = (2.0 .*pi .* 30000.0 .*ly) ./T;   % galactic velocity m/sec
vdm = vdm ./1000;  % km/sec
fprintf('Velocity of Galaxy w.r.t. Dark Matter (km/sec) = %g \n',vdm);
%
% kinetic energy of a 200 GeV DM particle
%
Tdm = (200000 .*(vdm ./(3 .*10 .^5)) .^2) ./2.0;
fprintf('Maximum Kinetic Energy of 200 GeV DM Particle (MeV) = %g \n',Tdm);
%

        