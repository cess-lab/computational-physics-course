%
% Program to compute the motion of a simple pendulum
% using MATLAB tools
%
function cm_pendul
%
clear all;  
help cm_pendul      % Clear the memory and print header
%
global gL vo tho
%
fprintf('Pendulum - Large Oscillations \n');
%
irun = 1;
iloop = 0;
%
while irun > 0
    kk = menu('Pick Another Pendulum?','Yes','No');
    if kk == 2
        irun = -1;
        break
    end
    if kk == 1
        %
        % Set initial position and velocity of pendulum
        %
        tho = input('Enter Initial Angle (degrees): ');
        tho = (tho .*pi) ./180.0;   % Convert angle to radians
        vo = input('Enter Initial Angular Velocity (degrees/sec): ');   
        vo = (vo .*pi) ./180.0;
        gL = input('Enter g/L in MKS units: ');
        %
        % small angle period, omeg = sqrt(gL);
        %
        omega = sqrt(gL);
        T = (2.0 .*pi) ./omega;
        tt = linspace(0, 2.0 .*T);
        %
        fprintf('Small Angle Circular Frequency = %g 1/sec \n',omega);
        fprintf('Small Angle Period (sec) = %g \n',T);
        fprintf('Period = 2 * pi *sqrt(L/g) Increased by Factor 1 + thetao^2/16 \n');
        %
        % numerical solution using ODE tools
        %
        [t,y] = ode45(@pend,tt,[vo tho]);
        %
        % small angle SHM for comparison
        %
        yyy = tho .*cos(omega .*tt) + (vo .* sin(omega .*tt)) ./omega;
        yyyy = -tho .*omega .*sin(omega .*tt) + vo .*cos(omega .*tt);
        %
        iloop = iloop + 1;
        figure(iloop)
        yy = y(:,1);
        plot(t,yy,'-',tt,yyyy,':')
        title('Angular Velocity')
        xlabel('t(sec)')
        ylabel('d\theta/dt')
        legend('Full Solution','Small Oscillation')
        %
        iloop= iloop + 1;
        figure(iloop)
        zz = y(:,2);
        N = length(t);
        for j = 1:N
            %
            plot(t(j),zz(j),'o',tt(j),yyy(j),'*')
            title('Angular Position')
            xlabel('t(sec)')
            ylabel('\theta(rad)')
            legend('Full Solution','Small Oscillation')
            axis([0 max(t),min(zz),max(zz)])
            pause(0.1)
        end
        plot(t,zz,'b-',tt,yyy,'r:')
        title('Angular Position')
        xlabel('t(sec)')
        ylabel('\theta(rad)')
        legend('Full Solution','Small Oscillation')
    end
end 
%
function dy = pend(t,y)
%
global gL vo tho
%
dy = zeros(2,1);
dy(1) = -gL .*sin(y(2));
dy(2) = y(1);
%