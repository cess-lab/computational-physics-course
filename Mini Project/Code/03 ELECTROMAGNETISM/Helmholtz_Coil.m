%
% Program to plot B field of a pair of current loops
% numerically - all point using Biot-Savert
%
clear all; 
help Helmholtz_Coil;  % Clear memory and print header
% 
fprintf(' B Field for a Current Loop Pair, Radius = 1, Separation = 2d \n');
%
fprintf(' Current Loops in x,y Plane. Theta is the Angle w.r.t. the z Axis \n');
%
irun = 1;
iloop = 0;
%
while irun > 0
    kk = menu('Pick Another Distance Between Loops','Yes','No');
    if kk == 2
        irun = -1;
        break
    end
    if kk == 1
        %
        % Set d
        %
        d_2 = input('Enter Distance Between Loops: ');
        d = d_2 ./2.0;
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
                    rr32p = (xx(i) .^2 + 1 - 2.0 .*xx(i) .*cp + (zz(j)-d) .^2) .^1.5 ;
                    rr32m = (xx(i) .^2 + 1 - 2.0 .*xx(i) .*cp + (zz(j)+d) .^2) .^1.5 ;
                    dBxp = cp .*(zz(j) - d) + d .*sp;
                    dBxm = cp .*(zz(j) + d) - d .*sp;
                    dByp = d .*(xx(i) - cp) + (zz(j) - d) .*sp;
                    dBym = -d .*(xx(i) - cp) + (zz(j) + d) .*sp;
                    dBzp = (1.0 - xx(i) .*cp);
                    dBzm = dBzp;
                    % current sense is the same for 2 loops - reinforcing
                    Bx(i,j) = Bx(i,j) + (dBxp ./rr32p + dBxm ./rr32m);
                    By(i,j) = By(i,j) + (dByp ./rr32p + dBym ./rr32m);
                    Bz(i,j) = Bz(i,j) + (dBzp ./rr32p + dBzm ./rr32m); 
                end
            end
        end
        %
        iloop = iloop + 1;
        figure(iloop)
        contour(xx,zz,Bz',40);
        xlabel('x/a')
        ylabel('z/a')
        title('Contour for Bz') 
        %
        iloop = iloop + 1;
        figure(iloop)
        mesh(xx,zz,Bz');
        xlabel('x/a')
        ylabel('z/a')
        title('Mesh for Bz')
        %
        iloop = iloop + 1;
        figure(iloop)
        contour(xx,zz,Bx',40);
        xlabel('x/a')
        ylabel('z/a')
        title('Contour for Bx')
    end
end
%