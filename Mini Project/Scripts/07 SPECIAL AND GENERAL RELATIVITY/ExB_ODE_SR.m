%
function ExB_ODE_SR
%
% Use MATLAB ODE tools to solve charged particle in constant E and B Fields
%
clear all;  help ExB_ODE_SR      % Clear the memory and print header
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
% a = (e/m)* (E + v x B) -NR, dP/dt = q(E + pxB/E) - SR
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
        Po = input('Enter Initial Momentum in m Units, m = 1, [Px Py Pz]: ');
        %
        [t,y] = ode45(@EB,[0 100],[Po(1) ; Po(2) ; Po(3);0 ; 0 ; 0]);
        %
        % time range is second argument, initial 
        % conditions are the third arguement. Px = y(1), Py = y(2)
        % Pz = y(3) , dxdt = y(4), dydt = y(5), dzdt = y(6)
        % initial position = (0,0,0)
        %
        iloop = iloop + 1;
        figure(iloop);
        %
        plot(t,y(:,1),'b-',t,y(:,2),'r:',t,y(:,3),'g-.')
        title('x Momentum and y Momentum and z Momentum in E and B Field')
        xlabel('t')
        ylabel('Px Py Pz')
        legend('Px','Py','Pz')
        %
        iloop = iloop + 1;
        figure(iloop);
        %
        plot(y(:,1),y(:,2),'b-')
        title('x Momentum vs y Momentum in E and B Field')
        xlabel('Px')
        ylabel('Py')
        %
        iloop = iloop + 1;
        figure(iloop); 
        %
        plot(t,y(:,4),'b-',t,y(:,5),'r:',t,y(:,6),'g-.')
        title('x Position and y Position and z Position in E and B Field')
        xlabel('t')
        ylabel(' x , y , z')
        legend('x','y','z')
        %
        iloop = iloop + 1;
        figure(iloop); 
        plot(y(:,4),y(:,5))
        title('x Position vs y Position in E and B Field')
        xlabel('x')
        ylabel('y')
    end
end
%
% ---------------------------------------------------------------------------
%
function dydt = EB(t,y)
global Ex Ey Ez Bz
P = sqrt(y(1) .^2 + y(2) .^2 + y(3).^2); % momentum
E = sqrt(P .^2 + 1); % energy   
dydt = [Ex + (y(2) .*Bz) ./E ; Ey - (y(1) .*Bz) ./E ; Ez; y(1) ./E; y(2) ./E; y(3)./E ];
%
