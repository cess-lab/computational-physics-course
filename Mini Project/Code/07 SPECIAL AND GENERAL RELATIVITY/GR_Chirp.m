%
% Inspiraling Binary due to Grav Radiation
% 
clear all;  
help GR_Chirp      % Clear the memory and print header
%
% Initialize  
%
G = 6.67 .*10 .^-11; % mks units
Mo = 2.0 .*10 .^30;
c = 3.0 .*10 .^8;
%
iloop = 0;
irun = 1;
%
while irun > 0
    kk = menu('Another Binary?','Yes','No');
    if kk == 2
        irun = -1;
        break
    end
    if kk == 1
        %
        mm = input('Enter Star Mass in Solar Masses: ');
        M = mm .*Mo;
        %
        ro = input('Enter Initial Binary Radius in km (< 20): ');
        ro = ro .*1000;
        %
        % find the initial orbital frequency and the time to inspiral
        %
        wo = sqrt((G .*M) ./(4.0 .*(ro .^3)));
        tc = (5.0 .*(ro .^4) .*(c .^5)) ./(32 .*((G .*M) .^3));
        %
        fprintf('Initial Orbital Frequency (Hz) = %g \n',wo);
        fprintf('Inspiral Time (sec) = %g \n',tc); 
        %
        t = linspace(0,tc,400);
        r = ((32 .*((G .*M) .^3) .*(tc - t)) ./(5 .*(c .^5))) .^0.25 ;
        wgr =sqrt((G .*M) ./(4 .*(r .^3)));
        %
        iloop = iloop + 1;
        figure(iloop)
        %
        rr = r ./1000.0;
        plot(t,rr)
        title('Binary Radius vs Time')
        xlabel('t(sec)')
        ylabel('r(km)')
        %
        iloop = iloop + 1;
        figure(iloop)
        %
        plot(t,wgr)
        title('Radiated Frequency vs Time')
        xlabel('t(sec)')
        ylabel('w(Hz)')
        %
        iloop = iloop + 1;
        figure(iloop)
        %
        for i = 1:length(t)
             x1 = r(i) .*cos(wgr(i) .*t(i));
             x2 = - x1;
             y1 = r(i) .*sin(wgr(i) .*t(i));
             y2 = - y1;
             plot(x1,y1,'*',x2,y2,'o')
             title('Binary Stars vs Time')
             xlabel('x(m)')
             ylabel('y(m)')
             axis([-20000 20000 -20000 20000])
             pause(0.03)
        end
        %
    end
end
%