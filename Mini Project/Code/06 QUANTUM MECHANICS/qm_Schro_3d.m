%
% 3-d Schroedinger Eq. for free particle, u
%
clear all;  
help qm_Schro_3d      % Clear the memory and print header
%
% Initialize 
%
syms l u b r E hbarc2 m
%
uu = dsolve('D2u-u*l*(l+1)/r^2+b*u=0','r');  % b=2m(E)/hbarc2, psi=u/r*Ylm
%
pretty(uu)
%
me = 511000.0;  % eV - electron mass in eV
hbarc = 2000.0;   % ev*A 
E = 10.0;   % eV
k = sqrt(2.0 .*me .*E) ./hbarc;
%
% the J is well behaved near the origin, plot for a few l values
%
fprintf('Wave Number k for a 10 eV Free Particle = %g in A^-1 \n ',k)
%
rr = linspace(0,5);   % radius in A
%
q = k .*rr;
psi0 = sin(q) ./q;
psi0 = (q .*psi0) .^2;
psi1 = sin(q) ./(q .^2) - cos(q) ./q;
psi1 = (q .*psi1) .^2;
psi2 = (3.0 ./(q.^3) - 1.0 ./q) .* sin(q) - (3.0 .*cos(q)) ./(q .^2);
psi2 = (q .*psi2) .^2;
%
plot(rr,psi0,rr,psi1,':',rr,psi2,'-.');
title('Schroedinger Eq Solution - Radial for Free Particle, \psi=Yl^m*u/r')
xlabel('r(A)')
ylabel('|\psi(r)|^2*r^2 - 10 eV electron')
legend('l=0','l=1','l=2')
%
