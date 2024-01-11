%
% Program to plot radiation patterns, NR and UR
%
clear all; help Rel_Radiate;  % Clear memory and print header
% 
fprintf(' Radiation of Accelerated Charge Moving Relativistically \n');
beta = input('Enter the Instantaneous Speed of the Charge w.r.t. c: ');
fprintf('The Radiation Field is Plotted w.r.t the Angle Between the Observer and the Velocity \n');
%
gam = 1.0 ./sqrt(1.0 - beta .^2);
ct = linspace(0,1,500);   % cos of the angle 
st = sqrt(1.0 - ct .^2);
%
dPlin = (st .^2) ./(1.0 - beta .*ct) .^5 ;  % radiation when velocity || to acceleration
dPperp = (1 - (st .*st) ./(gam .*gam .*((1.0 - beta .*ct) .^2))) ./(1 - beta .*ct) .^3;
%
fprintf('Linear Radiation Radiates gamma^6 More than NR, Circular gamma^4  \n');
fprintf('For Perpendicular Radiation the Polar Angle is between the Velocity(z) and the Observer \n');
fprintf('For Perpendicular Radiation the x Axis is the Direction of the Acceleration \n');
%
figure(1)
semilogy(st,dPlin,'-')
title('Radiation vs sin for Linear Acceleration')
xlabel('sin(\theta)')
ylabel('dp/d\Omega')
%
figure(2)
semilogy(st,dPperp,'-')
title('Radiation vs sin for Perpendicular Acceleration, Azimuthal Angle = 0')
xlabel('sin(\theta)')
ylabel('dp/d\Omega')
%
ct = linspace(-1,1,500);   % cos of the angle 
st = sqrt(1.0 - ct .^2);
%
bb = linspace(0 , 0.9, 10);
for i = 1:length(bb)
    beta = bb(i);
    dPlinb(i,:) = (st .^2) ./(1.0 - beta .*ct) .^5 ;
end
%
figure(3)
for i = 1:length(bb)
    semilogy(st,dPlinb(i,:));
    title('Radiation vs sin for Linear Acceleration, \beta from 0 to 0.9')
    xlabel('sin(\theta)')
    ylabel('dp/d\Omega')
    hold on
end
hold off
%
for i = 1:length(bb)
    beta = bb(i);
    gam = 1.0 ./sqrt(1.0 - beta .^2);
    dPperp(i,:) = (1 - (st .*st) ./(gam .*gam .*((1.0 - beta .*ct) .^2))) ./(1 - beta .*ct) .^3; 
end
%
figure(4)
for i = 1:length(bb)
    semilogy(st,dPperp(i,:));
    title('Radiation vs sin for Perpendicular Acceleration, \beta from 0 to 0.9')
    xlabel('sin(\theta)')
    ylabel('dp/d\Omega')
    axis([0, 1, 10 .^-2, 10 .^3])
    hold on
end
hold off
%
bb = linspace(0 , 0.6, 7);
figure(5)
  for i = 1:length(bb)
    xxx(i,:) = dPlinb(i,:) .*st;
    zzz(i,:) = dPlinb(i,:) .*ct;   
    plot(zzz(i,:),xxx(i,:),'-b',zzz(i,:),-xxx(i,:),'-b')
    title('Contour of the Parallel Radiation for \beta from 0 to 0.6')
    ylabel('x')
    xlabel('z = instantaneous v axis')
    hold on
  end
  hold off
figure(6)
  for i = 1:length(bb)
    xxx(i,:) = dPperp(i,:) .*st;
    zzz(i,:) = dPperp(i,:) .*ct;   
    plot(zzz(i,:),xxx(i,:),'-r',zzz(i,:),-xxx(i,:),'-r')
    title('Contour of the Perpendicular Radiation for \beta from 0 to 0.6')
    ylabel('x')
    xlabel('z = instantaneous v axis')
    hold on
  end
  hold off
  %