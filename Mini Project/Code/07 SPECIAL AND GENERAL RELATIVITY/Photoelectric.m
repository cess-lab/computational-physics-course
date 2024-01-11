%
% photoelectric effect, gamma + e (bound) -> e (free)
%
clear all;  
help Photoelectric      % Clear the memory and print header
%
fprintf('Photoelectric Effect - Angular Distribution of e w.r.t. Incident Photon \n')
%
w = input('Input the Incident Photon Energy in keV (NR, < 100): ');
%
% Make PE angular distribution, evaluated in target rest frame
% roughly dipole of photon E field = acceleration - NR
% with "searchlight" factor (1-bet*ct)^-4
%
% electron mass in keV
%
  m = 511.0 ;
%
  b = sqrt( (2.0 .*w) ./m);   % pe takes off the photon energy - binding ignored
  ct = linspace(-1, 1);
  st = sqrt(1.0 - ct .^2);
  dsig = st .*st ./((1.0 - b .*ct) .^4) ;  % appropriate for light elements
%
figure(1)
plot(ct,dsig,'-')
ylabel('d\sigma/d\Omega')
xlabel('cos\theta')
title('Photoelectric Angular Distribution')
%
figure(2)
ww = logspace(-1,2,4);
for i = 1:length(ww)
     bb(i) = sqrt((2.0 .*ww(i)) ./m);   % pe takes off the photon energy - binding ignored
     ddsig(i,:) = st .*st ./((1.0 - bb(i) .*ct) .^4) ;
     plot(ct,ddsig(i,:))
     hold on
end
%
hold off
ylabel('d\sigma/d\Omega')
xlabel('cos\theta')
title('Photoelectric Angular Distribution for Photon Energies from 0.1 to 100 keV')
%
  for i = 1: length(ww)
    % contours
    rmax(i) = max(ddsig(i,:));
    %
    xxx(i,:) = ddsig(i,:) .*st;
    zzz(i,:) = ddsig(i,:) .*ct; 
  end
  %
  figure(3)
  for i = 1:length(ww)
    plot(zzz(i,:),xxx(i,:),'-b',zzz(i,:),-xxx(i,:),'-b')
    title('Photoelectric Angular Contours for Photon Energies from 0.1 to 100 keV ')
    ylabel('x')
    xlabel('z')
    hold on
  end
  hold off
  %