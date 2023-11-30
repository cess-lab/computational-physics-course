%
% look at trajectory of a charge in a uniform E field - analytic
%
clear all;      % Clear memory
help sr_E_Accel;    % Print header
%
syms a t z zp b bc zc
%
% dP/dt = b = qEo, dbeta/dt = a (NR) = qEo/m,  dbeta/dt (SR)= a/sqrt(a^2+1)
%
fprintf('Charged Particle in Constant Field Eo \n ')
%
fprintf('dp/dt = q*Eo, p = (q*Eo)*t, beta = p/E = at/sqrt((at)^2 + 1), a = q*Eo/m \n ')
%
b = a*t/sqrt((a*t)^2+1);
z = int(sym('a*t/sqrt((a*t)^2+1)'));
z = z - 1/a;
pretty(z)
%
fprintf('Taylor Expansion for z \n ')
%
zp = taylor(z,'Order',5);
pretty(zp)
%
fprintf('Classical Non-relativistic Results \n ')
%
bc = a*t        % NR classical values
zc = (a*t*t)/2
%
tt = linspace(0,5);
%
a = 1;
%
for i=1:length(tt)
            t = tt(i);
            bb(i) = eval(b); % dzdt
            zz(i) = eval(z); % distance
            bbc(i) = eval(bc);  % NR limits - classical
            zzc(i) = eval(zc);
end
% 
figure(1)
plot(tt,bb,'-b',tt,bbc,'r:')
title('\beta = v/c as a Function of t in a Unifrom Electric Field ')
xlabel('ct')
ylabel('\beta')
legend('SR','Classical')
%
figure(2)
plot(tt,zz,'-b',tt,zzc,'r:')
title('Distance in c*t Units as a function of t')
xlabel('ct')
ylabel('z')
legend('SR','Classical')
%