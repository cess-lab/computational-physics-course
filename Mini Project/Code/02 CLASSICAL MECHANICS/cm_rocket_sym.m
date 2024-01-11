%
% Solve non-relativistic rocket, symbolically - no friction or forces
%
clear all;  
help cm_rocket_sym      % Clear the memory and print header
%
% solve the rocket equation - free of forces
%
fprintf('Solve d2y/dt2 = vo /(T-t), vo = exhaust velocity w.r.t. rocket, T is Burn Time = mo/dmdt \n')
%
vs = dsolve('Dy -vo/(T-t)','y(0)=0');
ys = dsolve('D2y -vo/(T-t)','y(0)=0','Dy(0)=0');
v =simple(vs);
v
y = simple(ys);
y
% 
fprintf('Final Velocity = vo*ln(mo/mp), mp = Payload Mass - Works with Multi-Stage Analysis \n')
%
fprintf('Solve With Rocket in a Uniform Gravity Field - g \n')
%
vg = dsolve('Dy -vo/(T-t) + g','y(0)=0');
yg = dsolve('D2y -vo/(T-t) + g','y(0)=0','Dy(0)=0');
v =simple(vg);
v
y = simple(yg);
y
%
% go back to the simple rocket with no forces and make plots
% total possible burn time T is mo/(dm/dt) = 10000
% payload ratio  mp/mo = 1-tp/T, tp = burn time for this payload
%
fprintf('Numerical Results: total possible burn time = T  \n')
fprintf('Payload ratio mp/mo => Payload burn time tp = T(1-mp/mo)  \n')
fprintf('vo = exhaust velocity, acceleration in vo/T units, velocity in vo units  \n')
fprintf('Distance at the end of payload burn in voT units  \n')
%
%
irun = 1;
iloop = 0;
%
while irun > 0
    kk = menu('Pick Another Payload Ratio?','Yes','No');
    if kk == 2
        irun = -1;
        break
    end
    if kk == 1
        %
        mpmo = input('Input the Payload Ratio: ');
        tpT = 1.0 - mpmo; % burn time for this payload
        tt = linspace(0,tpT);
        acel = 1.0 ./(1.0-tt);   % acceleration in vo/T units
        vel = log(1.0 ./(1.0-tt));  % velocity in vo units
        dis = (1.0-tt) .*(1.0 ./(1.0-tt) -1.0 - log(1.0 ./(1.0-tt)));   % distance in voT units
        %
        iloop = iloop + 1;
        figure(iloop)
        for i = 1:length(tt)
            semilogy(tt(i),acel(i),'o')
            axis([0 max(tt) 0 max(acel)])
            title(' Rocket - Acceleration in vo/T units')
            xlabel('Time in Total Possible Burn Time Units from 0 to Payload Burn Time')
            ylabel('Acceleration in vo/T units')
            pause(0.1)
            hold on
        end
        hold off
        %
        iloop = iloop + 1;
        figure(iloop)
        for i = 1:length(tt)
            plot(tt(i),vel(i),'o')
            axis([0 max(tt) 0 max(vel)])
            title(' Rocket - Velocity in vo units')
            xlabel('Time in Total Possible Burn Time Units from 0 to Payload Burn Time')
            ylabel('Velocity in vo units')
            pause(0.1)
            hold on
        end
        hold off
        %
        iloop = iloop + 1;
        figure(iloop)
        for j = 1:length(tt)
            plot(tt(j),dis(j),'o')
            title(' Rocket - Distance in vo*T units')
            xlabel('Time in Total Possible Burn Time Units from 0 to Payload Burn Time')
            ylabel('Distance in vo*T units')
            axis([0,max(tt),0,1])
            pause(0.1)
            hold on
        end
        hold off
        iloop = iloop + 1;
        figure(iloop)
        plot(tt,dis,'-')
        title(' Rocket - Distance in vo*T units')
        xlabel('Time in Total Possible Burn Time Units from 0 to Payload Burn Time')
        ylabel('Distnace in vo*T units')
    %
    end
end
%
