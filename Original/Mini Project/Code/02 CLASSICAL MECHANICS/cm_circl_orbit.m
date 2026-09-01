%
% Program to look at Perturbed Circular Orbits - Stability, and Perihelion Advance 
%
function cm_circl_orbit
%
clear all; 
help cm_circl_orbit;  % Clear memory and print header
% 
global Itype n b
%
fprintf('Circular Orbits - Perturbed \n');
%
% now numerical evaluations
%
irun = 1;
iloop = 0;
%
while irun > 0
    kk = menu('Pick Another Power Law?','Yes','No');
    if kk == 2
        irun = -1;
        break
    end
    if kk == 1
        %
        n = input('Enter Power Law Force n for f(r) ~ 1/r^n : ');
        fprintf('Circular Orbits - Perturbed, Stable only for n < 3 \n'); 
        %
        if n < 3
            fprintf('Stable Perturbations : ')
        else
            fprintf('Unstable Perturbations : ')
        end
        %
        fprintf('For a Given n, Period T^2 ~ radius^(n+1), Kepler is T^2 = r^3 \n')
        %
        % now time interval for 3 circular orbits
        % pick a = radius = 1, f(a) = c/a^n and c = 1% pick m = 1 ==> v = 1
        %
        Itype = 1;
        tspan = linspace(0,2.0 .*pi);
        [t,y] = ode45(@Perihel,tspan,[0.0 0.1]);
        %
        fprintf('Initial position is displaced by x(0) = 0.10 \n ')
        fprintf('Initial velocity is v(o) = 1, Dimensionless Units \n ')
        %
        iloop = iloop + 1;
        figure(iloop)
        plot(t ./(2.0 .*pi),y(:,2))
        xlabel('t(periods)')
        ylabel('x/a')
        title('Deviation from Circular Orbit Over One Unperturbed Period')
        %
    end
     %
end
% now the perihelion advance
%
fprintf('Perihelion Advance - Inverse Square Law Plus Small Inverse Fourth Power \n ')
Itype = 2;
b = input('Input the Coefficient of the Fourth Power : ');
tspan = linspace(0,6.0 .*pi);
[t,y] = ode45(@Perihel,tspan,[0.0 0.1]);       
fprintf('Initial position is displaced by x(0) = 0.10 \n ')
fprintf('Initial velocity is v(o) = 1, Dimensionless Units \n ')
%
iloop = iloop + 1;
figure(iloop)
plot(t ./(2.0 .*pi),y(:,2))
xlabel('t(periods)')
ylabel('x/a')
title('Deviation from Closed Orbit Over Three Periods')
%
iloop = iloop + 1;
figure(iloop)
for i = 1: length(t)
    plot(cos(t(i)) + y((i),2), sin(t(i)),'o')
    axis([min(cos(t) + y(:,2)) max(cos(t) + y(:,2)) min(sin(t)) max(sin(t))])
    xlabel('t(periods)')
    ylabel('x/a')
    title('Orbit Over Three Periods')
    pause(0.1)
    hold on
end
hold off
plot(cos(t) + y(:,2), sin(t),'-')
 xlabel('t(periods)')
 ylabel('x/a')
 title('Orbit Over Three Periods')
%
%-----------------------------------------------------------------------------------
%
function dy = Perihel(t,y)
%
global Itype n b
%
dy = zeros(2,1);
if Itype == 1  ;      % perturbed circ orbits - different force laws - n
    dy(1) = -1.0 ./(1 + y(2)) .^n + 1.0 ./(1.0 + y(2)) .^3  ;
    dy(2) = y(1);  % y(1) = vx, y(2) = x
end
%  
if Itype == 2 ;       % central inverse sq law with small (b) inverse fourth power 
    dy(1) = -1.0 ./(1 + y(2)) .^2 - b ./(1 + y(2)) .^4 + (1.0 + b) ./(1.0 + y(2)) .^3 ;
    dy(2) = y(1);  % y(1) = vx, y(2) = x
end