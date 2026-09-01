%
% Windtum - Program to display fluid flow around various shapes
%
clear all; 
help Flow_windtun;  % Clear memory and print header
clf;
%
% Initialize parameters, x,y grid, and potential psi
% real part of psi is velocity potential, imag part is stream function
%
x = linspace(-2, 2, 100);
y = linspace(-2, 2, 100);
%
psi = zeros(100,100);
%
for ii=1:100
    for jj = 1:100
        z(ii,jj) = x(ii) + i .*y(jj);
    end
end
%
% unifrom flow
%
a = input('Enter speed of flow along x axis: ');
psi = a .*z;
contour(x,y,imag(psi'),50);
title('Contour for Uniform Air Flow')
%
% now a sphere  - unit radius, 
%
figure(2)
psi = a .*(z + 1.0 ./z);
for ii=1:100
    for jj = 1:100
        if abs(z(ii,jj)) < 1
            psi(ii,jj) = 0.0;
        end
    end
end
contour(x,y,imag(psi'),50);
title('Contour for Sphere of Radius = 1 at Origin')
%
% now a perpendicular stick
%
figure(3)
psi = a .*sqrt(z .^2 + 1);
contour(x,y,imag(psi'),50);
title('Contour for Line Segment Perpendicular to Flow, Length = 2,  at Origin')
%
% now an inclined stick
%
alf = input('Enter angle of inclination of Line Segment (deg): ');
%
figure(4)
alf = alf ./(360 ./60);
psi=a .*z .*exp(-i .*alf) .*(cos(alf) + i .*sin(alf) .*sqrt(1.0 - (exp(2 .*i .*alf)) ./(z .^2)));
contour(x,y,imag(psi'),50);
title('Contour for Line Segment Inclined to Flow, Length = 2,  at Origin')
%



