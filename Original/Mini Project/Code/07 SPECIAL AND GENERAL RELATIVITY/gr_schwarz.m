%
% radial geodesics in a Schwarzchild space
% 
clear all;  
help gr_schwarz      % Clear the memory and print header
%
% Initialize  
%
syms r drds rs ro drdct so
%
mm = input('Enter Mass in Solar Masses: ');
%
G = 6.67 .*10 .^-11;
Mo = 2.0 .*10 .^30;
c = 3.0 .*10 .^8;
M = mm .*Mo;
rss = (2.0 .*G .*M) ./(c .^2);
rss = rss ./1000.;
%
fprintf('Schwarzchild Radius (km) = %g \n',rss);
%
roo = input('Enter Radius in rs units From Which You Are Released At Rest: ');
%
fprintf('Velocities, dr/ds and dr/dct, drds is Classical Result \n');
%
drds = sqrt((ro-r)/r)*sqrt(rs/ro);
pretty(drds)
%
drdct = sqrt(rs/(ro-rs))*sqrt(ro-r)*(r-rs)/r^1.5;
pretty(drdct)
%
% proper time to reach r = 0
%
so = int(sqrt(ro/rs)*sqrt(r/(ro-r)),r,0,ro);
fprintf('Proper Time to Reach r = 0 \n');
pretty(so)
%
% evaluate and plot the velocities
%
R = linspace(0,roo);
RT = linspace(1.0,roo);
%
rs = rss .*1000;
ro = roo .*rs;
%
for i = 1:100
    r = R(i) .*rs;
    SS(i) = eval(drds);
    r = RT(i) .*rs;
    TT(i) = eval(drdct);
end
%  
figure(1)
plot(R,SS,'-b',RT,TT,'r:')
legend('proper time', 'coordinate time')
ylabel('dr/ds,dr/dct')
xlabel('r/rs')
title('Velocity of Mass Dropped from Point into Black Hole')
%
SSS(100) = 0.0;
TTT(100) = 0.0;
DR = (R(2)-R(1));
DT = (RT(2) - RT(1));
for i = 1:99
    SSS(100-i) = SSS(101-i) + (1.0 ./SS(100-i)) .*DR;
    TTT(100-i) = TTT(101-i) + (1.0 ./TT(100-i)) .*DT;
end
TTT(1) = 100.0;
% 
figure(2)
plot(R,SSS,'-b',RT,TTT,'r:')
legend('proper time', 'coordinate time')
ylabel('interval s,coordinate time ct in rs units')
xlabel('r/rs')
title('Time Intervals of Mass Dropped from Point into Black Hole')
%