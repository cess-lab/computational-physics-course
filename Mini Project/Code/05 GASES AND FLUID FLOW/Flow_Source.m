%
% Flow_Source - incompressible and irrotational flow 2-D - stationary streamlines and velocity
%
clear all; 
help Flow_Source;  % Clear memory and print header
%
% Initialize parameters, x,y grid, and potential psi
% real part of psi is velocity potential, imag part is stream function, v is del(psi)
%
x = linspace(-2, 2, 20);
y = linspace(-2, 2, 20);
%
psi = zeros(20,20);
%
for ii=1:20
    for jj = 1:20
        z(ii,jj) = x(ii) + i .*y(jj); % constant flow
    end
end
%
% source at y = 0, x = +- 0.5
%
psi = log(z - 0.5) - log(z + 0.5);
figure(1)
contour(x,y,imag(psi'),30);
title('Streamlines for Source and Sink')
xlabel('x')
ylabel('y')
%
% now a Source and a Barrier 
%
figure(2)
psi = log(z-0.5) + log(z+ 0.5);
%
for ii=1:20
    for jj = 1:20
        if x(ii) < 0
            psi(ii,jj) = 0.0;
        end
    end
end
contour(x,y,imag(psi'),30);
title('Streamlines for Source and Barrier ')
xlabel('x')
ylabel('y')
%
[vx,vy]=gradient(real(psi'),x(2)-x(1),y(2)-y(1));
figure(3)
meshc(x,y,vx)
title('x Velocity For the Source + Barrier')
xlabel('x')
ylabel('y')
%
figure(4)
meshc(x,y,vy)
title('y Velocity For the Source + Barrier')
xlabel('x')
ylabel('y')
%
psi = i .*log(z- 0.5) - i .*log(z + 0.5);
figure(5)
contour(x,y,imag(psi'),30);
title('Streamlines for Rotational Source Flow')
xlabel('x')
ylabel('y')
%