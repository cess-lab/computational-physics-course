%
% Find Electric Field due to oscillating dipole - radiation
%
clear all;
help EM_Dipole_Rad;  % Clear memory and print header

%
k = 1; % pick wave number of oscillation, then kr will vary << 1 (static) and >> 1 (rad)
%  
fprintf('Dipole oscillating with w. Theta is the observation angle w.r.t. the z Axis \n');
fprintf('Near zone, r < 1/k is static dipole field \n');
fprintf('Far zone, r > 1/k is radiative dipole field \n');
        %
kx = linspace(0,5,20); % kr < 5
kz = linspace(-5,5,20);
for i = 1:length(kx)
    for j = 1:length(kz)   
        kr(i,j) = sqrt(kx(i) .^2 + kz(j) .^2);
        ct = kz(j) ./kr(i,j);
        st = kx(i) ./kr(i,j);
        if kr(i,j) < 1.0;      % limit r < 1 for display purposes
            kr(i,j) = 10000000000000.;
        end
        Er(i,j) = 2.0 .*ct .*sqrt(1.0 + kr(i,j) .^2);
        Er(i,j) = Er(i,j) ./kr(i,j) .^2;
        Et(i,j) = st .*sqrt((1.0 - kr(i,j) .^2) .^2 + kr(i,j) .^2) ;
        Et(i,j) = Et(i,j) ./kr(i,j) .^2 ;
        Ex(i,j) = Er(i,j) .*st  + Et(i,j) .*ct ;
        Ez(i,j) = Er(i,j) .*ct + Et(i,j) .*st;
    end
end
 %
iloop =  1;
figure(iloop)
mesh(kx,kz,Er')
title('Radial E Field * r, k = 1')
xlabel('kx')
ylabel('kz')
%
iloop = iloop + 1;
figure(iloop)
mesh(kx,kz,Et')
title('Theta E Field * r, k = 1')
xlabel('kx')
ylabel('kz')
%
%
