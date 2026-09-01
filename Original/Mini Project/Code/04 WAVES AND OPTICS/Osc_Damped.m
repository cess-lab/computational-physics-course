%
% Program to study damped oscillations - MATLAB diff Eq, dsolve
%
clear all; 
help Osc_Damped;  % Clear memory and print header
% 
fprintf(' Damped Harmonic Oscillator \n');
fprintf(' d2x/dt2 = kx/m -b*dxdt/m, wo^2 = k/m, frictional force - viscosity \n');
%
fprintf(' Undamped Harmonic Oscillator, x(o) = A, dx(0) = 0 \n');
xx = dsolve('D2x = -(k*x)/m','x(0)=A','Dx(0) = 0');
x = simplify(xx);
x
%
fprintf(' Damped Harmonic Oscillator \n');
xxd = dsolve('D2x = -(k*x)/m + b*Dx/m','x(0)=A','Dx(0) = 0');
xd = simplify(xxd);
xd;
%
fprintf(' d = b/(2*m), D = d/wo, x(t) = A*exp(-d*t)*cos(wt) w^2 = wo^2 - d^2, underdamped \n');
fprintf(' x(t) = A*exp[-d +- sqrt(d^2 - wo^2)]*t, overdamped \n');
fprintf(' Example: R,L, C circuit, wo^2 = 1/(LC), d = R/(2L) \n')
%
D = linspace(0,1.2,20);  % D = d/wo, D < 1 underdamped
wot = linspace(0,4 .*pi);
%
for i = 1:20
    if D(i) < 1
        yy(i,:) = exp(-D(i) .*wot) .*cos(wot .*sqrt(1.0 - D(i)));
    else
        yy(i,:) = exp(-D(i) .*wot - sqrt(D(i) - 1) .*wot);
    end
end
%
for i = 1:20
    figure(i)
    plot(wot, yy(i,:),'-')
    title(' Oscillation with Damping, D = 0 to 1.2 ')
    xlabel('wot')
    ylabel('x(t)')
    pause(0.5);
end
%
% driven damped oscillator, driving amplitude = B, frequency = we
%
% scan over driving frequency and adjust damping factor, units with  m = 1
%
fprintf(' Damped, Driven Oscillator - Resonance Behavior, Steady State Solution \n')
%
D = linspace(0.01,0.2,20);  %  resonance, width = ~2d (FWHM)
we = linspace(0.0,2);  % we in units of wo
%
for i = 1:20
        aa(i,:) = (we(:) .^2 - 1.0) .^2;
        bb(i,:) = (2.0 .*D(i) .*we(:)) .^2;
        yy(i,:) = 1.0 ./sqrt(aa(i,:) + bb(i,:)) ;
        maxy(i) = max(yy(i,:));
end
maxyy = max(maxy);
%
for i = 1:20
    figure(i + 20)
    plot(we, yy(i,:),'-')
    axis([0 2 0 maxyy])
    title(' Oscillation with Damping, D = 0.01 to 0.2, Scan Driving Frequency /wo from 0 to 2 ')
    xlabel('we / wo')
    ylabel('x(t)')
    pause(0.5);
end
%
