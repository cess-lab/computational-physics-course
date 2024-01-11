%
% Relativistic Electric Field of a Point Charge
%
clear all;  
help E_SR     % Clear the memory and print header
%
%
fprintf('Electric Field Contour, Point Charge \n')
%
b = input('Input the Charge v/c: ');
%
  gam = 1.0 ./sqrt(1.0 - b .^2); 
  ct = linspace(-1,1);
  st = sqrt(1.0 - ct .^2);
  qq = 1.0 - b .*b .*st .*st;
  dsig = 1.0 ./(gam .^2);
  e = dsig ./(qq .^1.5);
  ex = e .*st;
  ez = e .*ct;
  rmax = max(e);
  %
  figure(1)
  plot(ez,ex,'-',ez,-ex,'-')
  axis([-rmax rmax -rmax rmax]);
  title('Contour of the Electric Field')
  ylabel('x')
  xlabel('z = instantaneous position to observation point')
  %
  beta = linspace(0.0,0.95,6);
  gamma = 1.0 ./sqrt(1.0 - beta .^2);
  for i = 1: length(beta)
      for j = 1:length(st)
        qqq(i,j) = 1.0 - beta(i) .*beta(i) .*st(j) .*st(j);
        ee(i,j) = 1.0 ./(gamma(i) .^2); 
        ee(i,j) = ee(i,j) ./(qqq(i,j) .^1.5);
        exx(i,j) = ee(i,j) .*st(j);
        ezz(i,j) = ee(i,j) .*ct(j); 
    end
     rmaxx(i) = max(ee(i,:));
  end
  rmaxxx = max(rmaxx);
  %
  figure(2)
  for i = 1:length(beta)
    plot(ezz(i,:),exx(i,:),'b-',ezz(i,:),-exx(i,:),'b-')
    axis([-rmaxxx rmaxxx -rmaxxx rmaxxx]);
    title('Contour of the Electric Field for \beta from 0 to 0.9')
    ylabel('x')
    xlabel('z = instantaneous position to observation point')
    hold on
  end
  hold off
  %