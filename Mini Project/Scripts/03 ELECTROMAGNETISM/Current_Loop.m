%
% Program to plot B field of a current loop, far from the loop
% numerically - all point using Biot-Savert
%
clear all; 
help Current_Loop;  % Clear memory and print header
% 
fprintf(' B Field for a Current Loop, Radius a, for r >> a \n');
fprintf(' Dipole Moment = pi*I*a^2 \n');
%
xx = linspace(0,4,20);   % radius in units of a
zz = linspace(0,4,20); 
%
fprintf(' Current Loop in x,y Plane. Theta is the Angle w.r.t. the z Axis \n');
%
for i = 1:length(xx)
    for j = 1:length(zz)
        r = sqrt(xx(i) .^2 + zz(j) .^2);
        st = xx(i) ./r;
        Br(i,j) = sqrt(1.0 - st .*st) .*(2.0 + 2.0 .*r .*r + r .*st)....
          ./(1 + r .*r + 2 .*r .*st) .^2.5  ;
        Bth(i,j) =               - st .*(2.0       - r .*r + r .*st)....
          ./(1 + r .*r + 2 .*r .*st) .^2.5  ;
    end
end
%
figure(1)
meshc(xx,zz,Br')
title('Radial B Field')
xlabel('x/a')
ylabel('z/a')
%
figure(2)
meshc(xx,zz,Bth')
title('Polar B Field, Azimuthal Field = 0')
xlabel('x/a')
ylabel('z/a')
%
fprintf(' B Field for All Points - Biot-Savert \n');
%
xx = linspace(-2,2,20);   % radius in units of a
zz = linspace(-2,2,20); 
phi = linspace(0,2.0 .*pi);     % source integration - loop
Bx = zeros(length(xx),length(zz));
By = zeros(length(xx),length(zz));
Bz = zeros(length(xx),length(zz));
%
for i = 1:length(xx)
    for j = 1:length(zz);         % grid of field points
        for k = 1:length(phi) ;   % intergate over source
            cp = cos(phi(k));
            sp = sin(phi(k));
            rr32 = (xx(i) .^2 + 1 - 2.0 .*xx(i) .*cp + zz(j) .^2) .^1.5 ;
            Bx(i,j) = Bx(i,j) + (zz(j) .*cp) ./rr32;
            By(i,j) = By(i,j) + (zz(j) .*sp) ./rr32;
            Bz(i,j) = Bz(i,j) + (1.0 - xx(i) .*cp) ./rr32;
        end
    end
end
%
figure(3)
contour(xx,zz,Bz',40);
xlabel('x/a')
ylabel('z/a')
title('Contour for Bz')
%
