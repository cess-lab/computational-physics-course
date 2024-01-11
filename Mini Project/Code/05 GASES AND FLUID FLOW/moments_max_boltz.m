%
% moments of the Maxwell Boltzman Distribution, energy and velocity
%
clear all; 
help moments_max_boltz;  % Clear memory and print header
%
% Initialize  - symbolic distribution - in kinetic energy E and velocity v
%
syms dNdE k T e IdNdE IEdNdE IE2dNdE EM E2M em e2m erms ddNdE emp norm
syms dNdv M v IdNdv IvdNdv Iv2dNdv vM v2M vm v2m vrms ddNdv vmp normv
%
dNdE = sqrt(e)*exp(-e);  % E in units of kT
pretty(dNdE)
dNdv = v^2*exp(-v^2/2); % v is in units of sqrt(kT/M)
pretty(dNdv)
%
% find norm and first 2 moments of the MB energy and velocity
% distributions
%
iloop = 0;
%
IdNdE = int(dNdE,0,inf);
norm = dNdE/IdNdE;
IEdNdE = int(e*dNdE,0,inf);
IE2dNdE = int(e*e*dNdE,0,inf);
%
IdNdv = int(dNdv,0,inf);
normv = dNdv/IdNdv;
IvdNdv = int(v*dNdv,0,inf);
Iv2dNdv = int(v*v*dNdv,0,inf);
%
em = IEdNdE/IdNdE     % mean
e2m = IE2dNdE/IdNdE;   % mean squared
EM = em*k*T;
E2M = e2m*k*k*T*T;
erms = sqrt(e2m)       % rms
ddNdE = diff(dNdE);
emp = solve(ddNdE)     % most probable
%
vm = IvdNdv/IdNdv
v2m = Iv2dNdv/IdNdv;
vrms = sqrt(v2m)
ddNdv = diff(dNdv);
vmp = solve(ddNdv)
%
% now get numerical values for plots
%
ee = linspace(0,5,100);
for i = 1:100
    e = ee(i);
    dN(i) = eval(norm);
end
%
iloop = iloop + 1;
figure(iloop)
plot(ee,dN,'-b');
%
title('Maxwell Boltzmann Energy Distribution');
xlabel('E/kT')
ylabel('dN/dE')
hold on
eerms = eval(erms);
eemp = eval(emp);
eem = eval(em);
plot(eerms,0.1,'ro',eemp,0.1,'g*',eem,0.1,'k+')
legend(' ','rms','most prob','mean') 
hold off
%
vv = linspace(0,5,100);   % velocity in units of sqrt(kT/M)
for i = 1:100
    v = vv(i);
    dNv(i) = eval(normv);
end
%
iloop = iloop + 1;
figure(iloop)
plot(vv,dNv,'b');
%
title('Maxwell Boltzmann Velocity Distribution');
xlabel('v/sqrt(kT/M)')
ylabel('dN/dv')
hold on
vvrms = eval(vrms);
vvmp = eval(vmp(2));
vvm = eval(vm);
plot(vvrms,0.1,'ro',vvmp,0.1,'g*',vm,0.1,'k+')
legend(' ','rms','most prob','mean') 
%
hold off
%