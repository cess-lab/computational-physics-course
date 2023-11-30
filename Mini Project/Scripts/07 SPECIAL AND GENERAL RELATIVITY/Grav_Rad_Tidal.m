% 
% Tidal Forces and Gravity, Deformations for a Grav Wave detector 
% 
clear all;  
help Grav_Rad_Tidal      % Clear the memory and print header
%
 fprintf('Tidal Force, Fz = 2*z(GMm)/r^3, Fx = -x(GMm)/r^3 \n')
%
% F is divergenceless, define Tidal Potential
%
z = linspace(-10,10,50);
x = linspace(-10,10,50);
for i = 1:length(z)
    for j = 1:length(x)
        pot_tid(i,j) = -(z(i) .^2 - x(j) .^2 ./2.0)./sqrt(z(i) .^2 + x(j) .^2) .^3;
    end
end
%
figure(1)
meshc(x,z,pot_tid);
title('Tidal Potential')
xlabel('x')
ylabel('z')
%
[ftx,ftz] = gradient(pot_tid);
%
figure(2)
meshc(x,z,ftx)
title('Tidal Force Fx')
xlabel('x')
ylabel('z')
%
figure(3)
meshc(x,z,ftz)
title('Tidal Fiorce Fz')
xlabel('x')
ylabel('z')
%
% now look at test mass acceleration
%
 fprintf('Gravity Wave - Response of 4 Test Masses \n')
%
figure(4)
wt = linspace(0, 4.0 .*pi);
%
xx(1) = -1;
xx(2) = 1;
yy(1) = 0;
yy(2) = 0;
XX(1) = 0;
XX(2) = 0;
YY(1) = -1;
YY(2) = 1;
%
for i = 1:length(wt)
    xxx(1,i) = xx(1) .*(1.0 + 0.25 .*cos(wt(i)));
    xxx(2,i) = xx(2) .*(1.0 + 0.25 .*cos(wt(i)));
    YYY(1,i) = YY(1) .*(1.0 - 0.25 .*cos(wt(i)));
    YYY(2,i) = YY(2) .*(1.0 - 0.25 .*cos(wt(i)));
    plot(xxx(:,i),yy(:),'-o',XX(:),YYY(:,i),':o');
    axis([-2 2 -2 2])
    title('Gravitational Wave - Action on Test Masses')
    xlabel('x')
    ylabel('y')
    pause(0.1)
%
end
