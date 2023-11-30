%
% Program to look at Coriolis force, symbolic solution plus numerical 
% Free fall on Surface of the Earth
%
clear all; 
help cm_coriolis;  % Clear memory and print header
% 
fprintf('Coriolis Force, Nothern Hemisphere, w is w*cos, Latitude \n');
%
% look at symbolic ODE solution, z vertical, x south, y east
%
syms y z w g yy zz
%
[yy,zz] = dsolve('D2y=-2*Dz*w','Dy(0)=0','y(0)=0','D2z=g','Dz(0)=0','z(0)=0');
%
fprintf(' z is Vertical, x is South and y is East \n')
%
zz
yy
%
w = ( 2.0 .*pi) ./(24 .*60 .*60);  % Earth rotation, rad/sec
g = 9.8;  % acceleration in m/sec^2
%
% now numerical evaluations
%
irun = 1;
iloop = 0;
%
while irun > 0
    kk = menu('Pick Another Free Fall Height and Latitude?','Yes','No');
    if kk == 2
        irun = -1;
        break
    end
    if kk == 1
        %
        zh = input('Enter Initial Free Fall Height (m): ');
        th = input('Enter Latitude (deg): ');
        th = (2.0 .*pi .*th) ./360.0;
        %
        z = linspace(0,zh);
        zz = z(100)-z;
        %
        % z = gt^2/2 - remove t to find y(z)
        %
        y = - ((g .*w .*cos(th)) .*(((2.0 .*z) ./g) .^1.5)) ./3.0;
        yy = y(1) - y;
        %
        fprintf('Total Eastward Deflection (m) = %g \n',yy(100));
        %
        iloop = iloop + 1;
        figure(iloop)
        plot(yy,zz)
        xlabel('y(m)')
        ylabel('z(m)')
        title('Free Fall Coriolis Deflection')
        %
    end
    %
end
%