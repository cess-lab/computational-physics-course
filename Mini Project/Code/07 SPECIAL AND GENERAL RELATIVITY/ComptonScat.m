%
% Compton Scattering, gamma + e -> gamma + e
%
clear all;  help ComptonScat      % Clear the memory and print header
%
fprintf('Compton Scattering - Angular Distribution \n')
%
w = input('Input the Incident Photon Energy in MeV: ');
%
% Make Compton angular distribution, evaluated in target rest frame
% roughly isotropic in cm (1+ct^2) - NR, Thompson
% with general boost factor (wp/w)^2
%
% electron mass in MeV
%
  m = 0.511 ;
%
% kinematics is all in relation of incident w to scattered photon energy wp
% as a function of scattering angle of photons ct = cos(theta)
% x is ratio of photon energy to e mass, y is ratio of out/in photon energy
%
  x = w ./m;
  ct = linspace(-1, 1);
  st = sqrt(1.0 - ct .^2);
  y = 1.0 ./(1.0 + x .*(1.0 - ct));
  dsig = y .*y .*( y + 1.0 ./y - (1.0 - ct .*ct)) ; % Kline- Nishina
%
% dsig has a factor (alpha /m)^2 /2 not put in explicitly
% NR limit is dsig/domega --> (alpha/m)^2/2 *(1 + ct^2)
% NR sigma is Thompson result, 8*pi/3 *(alpha/m)^2
%
figure(1)
plot(ct,dsig,'-')
ylabel('d\sigma/d\Omega')
xlabel('cos\theta')
title('Compton Scattering Angular Distribution')
%
figure(2)
ww = logspace(-2,2,6);
for i = 1:length(ww)
  x = ww(i) ./m;
  yy(i,:) = 1.0 ./(1.0 + x .*(1-ct));
  ddsig(i,:) = yy(i,:) .*yy(i,:) .*( yy(i,:) + 1.0 ./yy(i,:) - (1.0 - ct .*ct)) ;
  semilogy(ct,ddsig(i,:))
  hold on
end
%
hold off
ylabel('d\sigma/d\Omega')
xlabel('cos\theta')
title('Compton Scattering Angular Distribution for Photon Energies from 10 keV to 100 MeV')
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
    title('Compton Scattering Angular Contours for Photon Energies from 10 keV to 100 MeV')
    ylabel('x')
    xlabel('z')
    hold on
  end
  hold off
  %