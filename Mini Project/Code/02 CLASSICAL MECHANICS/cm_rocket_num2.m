%
% Solve non-relativistic rocket, numerically using Saturn V as an example 
%
clear all; 
help cm_rocket_num2      % Clear the memory and print header
%
% solve the rocket equation - done in cm_rocket_sym 
% now do some numerical evaluations
%
gg = 9.8; % accel at earth surface m/sec^2
re = 6.378 .*10 .^6; % earth radius - m
veq = (2.0 .*pi .*re) ./(24 .*3.6 .*10^3);    % equatorial launch velocity km/sec
rs = 1.5 .*10 .^11;  % distance to sun - m
me = 6.0 .*10 .^24;  % earth mass - kg
ms = 2.0 .*10 .^30;  % sun mass, - kg
%
vorb = sqrt(gg .*re);   % orbital velocity - circular, low orbit
ve =sqrt(2.0 .*gg .*re);  % escape velocity for Earth ~ 11.2 km/sec
vs = ve .*sqrt(ms .*re ./(me .*rs)); % escape velocity to leave solar system ~ 42 km/sec
%
fprintf('Velocity, Satellite Low Circular Orbit (m/sec) = %g \n',vorb);
fprintf('Escape Velocity - Earth (m/sec) = %g \n',ve);
fprintf('Escape Velocity - Solar System (m/sec) = %g \n',vs);
fprintf('Equatorial Launch Velocity (m/sec) = %g \n',veq);
%
irun = 1;
iloop = 0;
%
while irun > 0
    kk = menu('Pick Another Rocket?','Yes','No');
    if kk == 2
        irun = -1;
        break
    end
    if kk == 1
        %
        % total possible burn time T is mo/(dm/dt)
        % payload ratio  mp/mo = 1-tp/T, tp = burn time for this payload
        %
        mo = input('Input the Rocket Mass (in 10^6 kg units) - Saturn = 4x10^6 kg: ');
        mo = mo .*10 .^6;
        mp = input('Input the Payload Mass (in kg) - Saturn Escape Module = 24610 kg: ');
        vo = input('Input the Exhaust Velocity (in m/sec) - Saturn = 2200 m/sec: ');
        dmdt = input('Input Burn Rate (in kg/sec) - Saturn = 15000 kg/sec: ');
        %      
        T = mo ./dmdt ;  % max possible burn rate, with no payload
        tp = T .*(1 - mp ./mo);  % burn time for this payload
        mpf = mo .*exp(-ve ./vo);  % estimated payload for free rocket to attain escape velocity
        mps = mo .*exp(-vs ./vo);  % escape velocity from the solar system
        %
        fprintf('Maximum Burn Time (sec) = %g \n',T);
        fprintf('Burn Time for This Payload (sec) = %g \n',tp);
        fprintf('Payload Mass for Free Rocket to Attain Earth Escape Velocity = %g \n',mpf);
        fprintf('Payload Mass for Free Rocket to Attain Solar Escape Velocity = %g \n',mps);
        %
        tt = linspace(0,tp);
        tt = tt ./T;
        %
        % the free rocket 
        %
        for i = 1:length(tt)
           x = 1.0 ./(1.0 - tt(i));
           AF(i) = (vo ./T) .*x;
           VF(i) = vo .*log(x);
           YF(i) = vo .*T .*(1.0 - 1 ./x - log(x) ./x);
        end
        tt = tt .*T;
        %
        % the rocket in a uniform field = g 
        %
        tl = -vo ./gg + T; % t=0 is ignition, t = tl is lift time, when acceleration > 0
        ul = T - tl;
        fprintf('Time After Ignition for Acceleration to be > 0, Liftoff = %g \n',tl);
        %
        for i = 1:length(tt)
            if tt(i) < tl
                AG(i) = 0.0;
                VG(i) = 0.0;
                YG(i) = 0.0;
            else
            %
                u = T - tt(i);
                AG(i) = vo ./u - gg;
                VG(i) = -vo .*log(u ./ul) + gg .*(u-ul);
                YG(i) = vo .*(u .*log(u ./ul) - (u-ul)) - gg .*(u-ul) .*(u-ul) ./2.0;
            end
        end
        iloop = iloop + 1;
        figure(iloop)
        semilogy(tt,AF,'-',tt, AG)
        title(' Rocket - Acceleration in m/sec^2')
        xlabel('Burn Time - sec')
        ylabel('Acceleration')
        legend('Free rocket','Rocket in g')
        %
        iloop = iloop + 1;
        figure(iloop)
        semilogy(tt,VF,'-',tt,VG)
        hold on
        semilogy(tt,vorb,'r-',tt,ve,'r:',tt,vs,'r--')
        title(' Rocket - Velocity in m/sec')
        xlabel('Burn Time - sec')
        ylabel('Velocity')
        legend('Free rocket','Rocket in g','Orbital Velocity', 'Earth Escape Velocity', 'Sun Escape Velocity')
        hold off
        %
        iloop = iloop + 1;
        figure(iloop)
        %
        jj = length(YF);
        xmax = max(tt);
        ymax = max(YF);
        for i = 1:jj
           semilogy(tt(i),YF(i),'o',tt(i),YG(i),'*')
           title(' Rocket - Distance m')
           xlabel('Burn Time - sec')
           ylabel('Distance - m')
           pause(0.1)
           axis([0, xmax, 0, ymax])
           hold on
        end
        hold off
        semilogy(tt,YF,'-',tt,YG)
        hold on
        semilogy(tt,re,'r-')
        title(' Rocket - Distance m')
        xlabel('Burn Time - sec')
        ylabel('Distance - m')
        legend('Free rocket','Rocket in g', 'Earth Radius')
        hold off
    % 
    end
end
%