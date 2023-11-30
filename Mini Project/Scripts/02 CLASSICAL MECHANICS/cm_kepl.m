%
% Program to compute solar system orbits, closed and open
%
clear all;            % Clear memory
help cm_kepl;           % Print header
%
G = 6.67 .*10 .^-11; % MKS units
Mo = 2.0 .*10 .^30;   % solar mass, kg
au = 1.49 .*10 .^11;  % AU = earth-Sun distance, m
yr = 60.0 .*60.0 .*24.0 .*365.0;   % year in sec
%
irun = 1;
iloop = 0;
%
while irun > 0
    kk = menu('Pick Another Solar Orbit?','Yes','No');
    if kk == 2
        irun = -1;
        break
    end
    if kk == 1
        %
        ro = input('Enter Initial Distance ro(AU): ');
        %
        fprintf('L^2 is GMro/m^2 for a Circular Orbit at Radius ro \n');
        %
        % Find Effective 1-d Potential - Use centrifugal Potential, V~1/r^2
        %
        xxx = linspace(0.25,10.0);   % r variation in ro units
        Veff = 1 ./(2.0 .*xxx .*xxx) - 1.0 ./xxx;
        xmin = 1 ; % min of Veff
        Veffmin = -1.0 ./2.0;  % Veff at min 
        %
        iloop = iloop + 1;
        figure(iloop)
        plot(xxx,Veff,xmin,Veffmin,'*')
        title(' Effective Potential for L^2, Ec = -1/2,0 > Eellipse > Ecircle')
        xlabel('r/ro')
        ylabel('Veff/(GMm/ro)')
        axis([0 10 -0.6 0.5])
        %
        % circular radius for this L is ro, controlling variable is energy
        % E
        %
        ac = ro .*au; % in m
        %
        ve = sqrt((2.0 .*G .*Mo) ./ac); % escape velocity, circular orbit
        vee = ve ./1000.;
        vo = sqrt((G .*Mo) ./ac);  % circular velocity
        voo = vo ./1000.;
        To = (2.0 .*pi .*ac) ./vo; % circular orbit period
        Too = To ./yr;
        %
        fprintf('Escape Velocity (km/sec) = %g at ac (au) = %g\n',vee,ac ./au);
        fprintf('For circular orbit, v(km/sec) = %g, Period (yr) = %g \n',voo,Too);
        %
        q = input('Enter Total Energy in Units of Circular Energy -G*M*m/2*ro, = q > -1: ');
        ecc = sqrt(1.0 + q); % eccentricity
        %
        if q < -1
            fprintf('No Solution\n');
        end
        if q > 0
            fprintf('Hyperbolic Orbits\n');
            % turning points of potential in terms of ro  - i.e. elliptical axes
            x1 = (1.0 ./q) .*(-1.0  + sqrt(1.0 +q));
            x2 = (1.0 ./q) .*(-1.0 - sqrt(1.0 +q)); % eccentricity is e = sqrt(1+q)
            fprintf('For Hyperbolic Orbit, Turning Point in ro units = %g  \n',x1);
            hold on
            plot(x1,-q .*Veffmin,'o')
            hold off
            %
        end
        if q == 0
            fprintf('Parabolic Orbits\n');
        end
        if q < 0 & q >= -1
            fprintf('Elliptical Orbits\n');
            %
            % find the turning points, axes and period
            %   
            ac = ac ./au ; % circular orbit radius in ro units of au
            ae = ac ./abs(q); % major axis
            be = ae .*sqrt(1.0 - ecc .^2);  % minor axis
            % period
            TT = (2.0 .*pi .*(ae .*au) .^1.5)./sqrt(G .*Mo);
            TT = TT ./yr;
            % turning points of potential in terms of ro  - i.e. elliptical axes
            x1 = (1.0 ./q) .*(-1.0  + sqrt(1.0 +q));
            x2 = (1.0 ./q) .*( -1.0 - sqrt(1.0 +q)); % eccentricity is e = sqrt(1+q)
            %
            fprintf('For Elliptical Orbit, Major/Minor Axes (au) = %g , %g \n',ae,be);
            fprintf('For Elliptical Orbit, Turning Points in ro units = %g , %g \n',x1,x2);
            fprintf('For Elliptical Orbit, Orbital Period (yr) = %g \n',TT);
            fprintf('For Elliptical Orbit, Eccentricity = %g \n',ecc);
            %
            hold on
            plot(x1,-q .*Veffmin,'o', x2,-q .*Veffmin,'o')
            hold off
            %
        end
        %
        % populate cos theta and find the radius r, in ro units - x as above
        %
        iloop = iloop + 1;
        figure(iloop)
        theta = linspace(0,2 .*pi);
        ct = cos(theta);
        st = sin(theta);
        Xr = 1.0 ./(1.0 + ct .*ecc);
        dth = theta(2)-theta(1);
        %
        % numerical integration to get elapsed time on orbit points, t in units of To
        %
        t(1) = 0;
        for i =2:100
            t(i) = t(i-1) + dth ./(2.0 .*pi .*((1.0 + ct(i) .*ecc) .^2));
        end;
        %
        % velocity in units of circular velocity at radius ac
        %
        vel = sqrt(q + 2.0 .*(1.0 + ct .*ecc));
        %
        xx = ct .*Xr;
        yy = st .*Xr;
        %
        plot(xx,yy,'b-',0,0,'r*');
        if q < 0.0 & q >= -1
            hold on
            minx(1) = (x1-x2) ./2;
            minx(2) = (x1-x2) ./2;
            miny(1) = -be;
            miny(2) = be;
            majx(1) = x1;
            majx(2) = -x2;
            majy(1) = 0;
            majy(2) = 0;
            plot(minx,miny,'-r',majx,majy,'g-')
            axis square
            axis equal
            hold off
        end
        title('Orbit for this Choice of ro and E')
        xlabel('x/ro')
        ylabel('y/ro')
        %
        iloop = iloop + 1;
        figure(iloop)
        plot(theta ./(2.0 .*pi),t .*To ./yr)
        xlabel('orbit angle/2\pi')
        ylabel('Time Elapsed (yr)')
        title('Orbital Time as a Function of Orbital Angle')
        %
        iloop = iloop + 1;
        figure(iloop)
        plot(theta ./(2.0 .*pi),vel)
        xlabel('orbit angle/2\pi')
        ylabel('Orbital Velocity')
        title('Orbital Velocity in Units of Circular Velocity at Radius = ro')
    end
%
end
%
