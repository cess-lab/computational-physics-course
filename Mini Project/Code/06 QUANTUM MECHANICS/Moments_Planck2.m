%
% moments of the Planck distribution, energy density for a photon gas
%
clear all; 
help Moments_Planck2;  % Clear memory and print header
%
% Initialize  - symbolic distribution - in energy E
%
syms dUdE k T e IdUdE IEdUdE IE2dUdE EM E2M em e2m erms ddUdE emp norm
%
dUdE = e^3/(exp(e)-1)  % E in units of kT
%
% find norm and first 2 moments of the Planck energy a
% distributions
%
iloop = 0;
%
IdUdE = int(dUdE,0,inf)
norm = dUdE/IdUdE;
IEdUdE = int(e*dUdE,0,inf);
IE2dUdE = int(e*e*dUdE,0,inf);
%
em = IEdUdE/IdUdE     % mean
e2m = IE2dUdE/IdUdE;   % mean squared
EM = em*k*T;
E2M = e2m*k*k*T*T;
erms = sqrt(e2m)       % rms
ddUdE = diff(dUdE);
emp = solve(ddUdE)     % most probable
%
% now get numerical values for plots
%
ee = linspace(0,10,100);
for i = 1:100
    e = ee(i);
    dN(i) = eval(norm);
end
%
iloop = iloop + 1;
figure(iloop)
plot(ee,dN);
%
title('Planck Energy Distribution, dU/dE');
xlabel('E/kT')
ylabel('dU/dE')
hold on
eerms = eval(erms);
eemp = eval(emp);
eem = eval(em);
plot(eerms,0.1,'o',eemp,0.1,'*',eem,0.1,'+')
legend(' ','rms','most prob','mean') 
hold off
%