%
% Use MATLAB ODE tools to solve charged particle in constant E and B Fields
%
function ExB_ODE_NR
%
clear all;  help ExB_ODE_NR      % Clear the memory and print header
global Ex Ey Ez Bz
%
% Initialize  
%
fprintf('Charged Particle in Constant Fields -- E vector and B along z \n ')
%
% units with e/m for electrons = - 1.76 x 10^11 Coulb/kgram
% E in nt/Coulb = V/m
% B in W/m^2 = Nt*sec/Coulb*m = 10 kGauss
% v in m/sec
% a = (e/m)* (E + v x B)
%
fprintf('Units Chosen so That for E,B,v ~ O(1) the Time is ~O(1) \n ')
%
iloop = 0;
irun = 1;
%
while irun > 0
    kk = menu('Pick Another E Field and B Field, Initial Velocity','Yes','No');
    if kk == 2
        irun = -1;
        break
    end
    if kk == 1
        %
        E = input('Enter Electric Field in V/m [Ex Ey Ez]: ');
        Ex = E(1);
        Ey = E(2);
        Ez = E(3);
        Bz = input('Enter Magnetic Field Bz in T: ');
        vo = input('Enter Initial Velocity vx, vy, vz in m/sec [vx vy vz]: ');
        %
        tspan = linspace(0,20);   % equal steps in time in order to makes movies show velocity
        [t,y] = ode45(@EB,tspan,[vo(1) ; vo(2) ; vo(3);0 ; 0 ; 0]); % time range
        % is second argument, initial 
        % conditions are the third arguement. d2x/dt = y(1), d2ydt = y(2)
        % d2zdt = y(3) , dxdt = y(4), dydt = y(5), dzdt = y(6)
        % initial position = (0,0,0)
        %
        iloop = iloop + 1;
        figure(iloop);
        %
        plot(t,y(:,1),'r-',t,y(:,2),'b-',t,y(:,3),'g-')
        title('x Velocity and y Velocity and z Velocity in E and B Field')
        xlabel('t')
        ylabel('dx/dt, dy/dt, dz/dt')
        legend('dx/dt','dy/dt','dz/dt')
        %
        iloop = iloop + 1;
        figure(iloop);
        %
        plot(y(:,1),y(:,2),'b-')
        title('x Velocity vs y Velocity in E and B Field')
        xlabel('vx')
        ylabel('vy')
        %
        iloop = iloop + 1;
        figure(iloop); 
        plot(t,y(:,4),'r-',t,y(:,5),'b-',t,y(:,6),'g-')
        title('x Position and y Position and z Position in E and B Field')
        xlabel('t')
        ylabel(' x , y , z')
        legend('x','y','z')
        %
        iloop = iloop + 1;
        figure(iloop); 
        %
        xx = y(:,4);
        yy = y(:,5);
        jj = length(xx);
        xmax = max(xx);
        xmin = min(xx);
        ymax = max(yy);
        ymin = min(yy);
        for i = 1:jj
            plot(xx(i),yy(i),'o')
            title('x Position vs y Position in E and B Field')
            xlabel('x')
            ylabel('y')
            pause(0.1)
           % axis([xmin, xmax, ymin, ymax])
            hold on
        end
        hold off 
        iloop = iloop + 1;
        figure(iloop); 
        plot(y(:,4),y(:,5))
        title('x Position vs y Position in E and B Field')
        xlabel('x')
        ylabel('y')
        %
    end
end
%
% ---------------------------------------------------------------------------
%
function dydt = EB(t,y)
global Ex Ey Ez Bz
dydt = zeros(6,1);
dydt = [Ex + y(2) .*Bz ; Ey - y(1) .*Bz ; Ez; y(1); y(2); y(3) ];
%
