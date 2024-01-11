%
% Program to compute the motion of 2 coupled pendula
% using MATLAB tools, chaotic large angle motion
%
function cm_chaotic
%
clear all;  
help cm_chaotic      % Clear the memory and print header
%
global L vo tho
%
fprintf('Two Coupled Pendulum - Large Oscillations \n');
%
irun = 1;
iloop = 0;
%
while irun > 0
    kk = menu('Pick Another Two Initial Angles?','Yes','No');
    if kk == 2
        irun = -1;
        break
    end
    if kk == 1
        %
        % Set initial position of pendula
        %
        tho = input('Enter Initial Angles (degrees), Velocities = 0,[th1, th2]: ');
        tho = (tho .*pi) ./180.0;   % Convert angle to radians
       % L = input('Enter L in MKS units, m = 1 and g/L = 1: ');
        L = 1;
        vo = [0 0];
        %
        % numerical solution using ODE tools
        %
        tspan = linspace(0,50,100);
        [t2,y2] = ode45(@pend2,tspan,[vo(1) vo(2) tho(1) tho(2)]);
        %
        iloop = iloop + 1;
        figure(iloop)
        yy1 = y2(:,1);
        yy2 = y2(:,2);
        plot(t2,yy1,'-b',t2,yy2,'r:')
        title('Angular Velocity of Pendula')
        xlabel('t(sec)')
        ylabel('d\theta/dt')
        legend('First Pendulum','Second Pendulum')
        %
        iloop = iloop + 1;
        figure(iloop)
        yy3 = y2(:,3);
        yy4 = y2(:,4);
        plot(t2,yy3,'-b',t2,yy4,'r:')
        title('Angular Position of Pendula')
        xlabel('t(sec)')
        ylabel('\theta(t) - rad')
        legend('First Pendulum','Second Pendulum')
        %
        iloop= iloop + 1;
        figure(iloop)
        zz1 = y2(:,3);
        zz2 = y2(:,4);
        N = length(t2);
        for j = 1:N
            %
            xxx1(1) = 0;
            yyy1(1) = 0;
            xxx1(2) = L .*sin(zz1(j));
            yyy1(2) = -L .*cos(zz1(j));
            xxx2(1) = xxx1(2);
            yyy2(1) = yyy1(2);
            xxx2(2) = xxx1(2) +L .*sin(zz2(j));
            yyy2(2) = yyy1(2) -L .*cos(zz2(j));
            plot(xxx1,yyy1,'-b',xxx2,yyy2,'-r',xxx1(1),yyy1(1),'*g',xxx1(2),yyy1(2),'bo',xxx2(2),yyy2(2),'ro')
            title('Two Pendula')
            xlabel('x')
            ylabel('y')
            axis([-1.5 1.5 -2.5 0.5])
            pause(0.1)
        end
    end
end 
%
function dy = pend2(t,y)
%
global L vo tho
%
dy = zeros(4,1);
fact = dy(3) .*dy(4) .*sin(y(3)-y(4)) + 3 .*sin(y(3));
dy(1) = - (L .^2 .*fact) ./2.0;
fact = -dy(3) .*dy(4) .*sin(y(3)-y(4)) + sin(y(4));
dy(2) = - (L .^2 .*fact) ./2.0;
fact = 16.0 - 9.0 .*(cos(y(3)-y(4)) .^2);
dy(3) = 6.0 ./(L .*L .*fact);
dy(3) = dy(3) .*(2.0 .*y(1)-3.0 .*cos(y(3)-y(4)) .*y(2));
dy(4) = 6.0 ./(L .*L .*fact);
dy(4) = dy(4) .*(8.0 .*y(2)-3.0 .*cos(y(3)-y(4)) .*y(1));
%