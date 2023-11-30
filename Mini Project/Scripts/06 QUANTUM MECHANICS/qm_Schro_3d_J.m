%
% 3-d Schroedinger Eq. for free particle, u
%
clear all;  
help qm_Schro_3d_J      % Clear the memory and print header
%
% Initialize 
%
syms l u q r uu Jo J1
%
uu = dsolve('D2u-u*l*(l+1)/r^2+q^2*u=0','r');  % q^2=2m(E)/hbarc2, psi=u/r*Ylm
%Q = q;
%
pretty(uu)
Jo = (besselj(1/2,q*r)) ;
J1 = (besselj(3/2,q*r));
fprintf(' J for l = 0, 1  \n ')
pretty(Jo)
pretty(J1)
%
u = (besselj(l+1/2,q*r))^2*r;     % psi^2*r^2 - density = u^2 
%
% numerical inputs
%
me = 511000.0;  % eV - electron mass in eV
hbarc = 2000.0;   % ev*A 
E = 10.0;   % eV
k = sqrt(2.0 .*me .*E) ./hbarc;
%
fprintf('Wave Number k for a 10 eV Free Particle = %g in A^-1 \n ',k)
%
rr = linspace(0,5);   % radius in A
q = k;
l = 0;
u = (besselj(l+1/2,q*r))^2*r;
for i = 1:100
    r = rr(i);
    psi0(i) = eval(u);
end
syms q l r u 
q = k;
l = 1;
u = (besselj(l+1/2,q*r))^2*r; 
for i = 1:100
    r = rr(i);
    psi1(i) = eval(u);
end
syms q l r u
q = k;
l = 2;
u = (besselj(l+1/2,q*r))^2*r;  
for i = 1:100;
    r = rr(i);
    psi2(i) = eval(u);
end
%
plot(rr,psi0,'-b',rr,psi1,'r:',rr,psi2,'g-.');
title('Schroedinger Eq Solution - Radial for Free Particle, \psi=Y_l^m*u/r')
xlabel('r(A)')
ylabel('|\psi(r)|^2*r^2 - 10 eV electron')
legend('l=0','l=1','l=2')
%
