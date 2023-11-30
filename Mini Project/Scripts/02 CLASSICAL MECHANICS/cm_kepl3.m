%
% Kepler - Program to compute solar system orbits - simple numerical integration
%
function cm_kepl3
%
clear all;            % Clear memory
help cm_kepl3;           % Print header
%
global G Mo
%
% Initialize variables
%
G = 6.67 .*10 .^-11; % MKS units
Mo = 2.0 .*10 .^30;   % solar mass
au = 1.49 .*10 .^11;  % AU = earth-Sun distance, m
yr = 60.0 .*60.0 .*24.0 .*365.0;   % sec
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
        roa = ro .*au ;
        %
        ve = sqrt((2.0 .*G .*Mo) ./roa); % escape velocity
        fprintf('Escape Velocity, v = %g m/sec\n',ve);
        %
        vc = sqrt(G .*Mo ./roa);
        fprintf('Velocity of circular orbit, v = %g m/sec\n',vc);
        T = (2.0 .*pi .*roa) ./vc ;
        fprintf('For circular orbit, period = %g sec\n',T);
        fprintf('For Earth Orbit, 1 au = %g m, period = %g sec\n',au,yr);
        %
        voy = input('Enter initial tangential velocity (AU/yr), 2\pi for Circle: ');
        vox = input('Enter initial radial velocity (AU/yr): ');
        %
        % Set up for plotting the orbit
        %
        % convert to m, sec
        %
        vox = (vox .*au) ./yr ;
        voy = (voy .*au) ./yr ;
        %
        tspan = linspace(0,5.0 .*T,100);
        [t,y] = ode45(@kepler,tspan,[vox roa voy 0]);
        %
        iloop = iloop + 1;
        figure(iloop)
        %
        N = length(tspan);
        Nloop = 0;
        for j = 1:N
            xx(j) = y(j,2) ./roa;
            yy(j) = y(j,4) ./roa;
        end
        for j = 1:N-1
            if  (yy(j+1) .* yy(j) + 0.001 > 0) || (yy(j+1) < 0)
                Nloop = Nloop + 1;
                xxl(Nloop) = xx(j);
                yyl(Nloop) = yy(j);
            else 
                break
            end
        end
         xmax = max(xxl);
         xmin = min(xxl);
         ymax = max(yyl);
         ymin = min(yyl);
         %
         % the movie first, to understand orbital velocity
         %
        for i = 1:Nloop
           plot(xxl(i),yyl(i),'o')
           hold on
           title('Trajectory of Orbit, 5 Circular Periods or Stop on Repeat')
           xlabel('x/ro')
           ylabel('y/ro')
           plot(0.0,0.0,'r*')
           axis([xmin xmax ymin ymax])
           pause(0.1)
        end
        hold off
        %
        iloop = iloop + 1;
        figure(iloop)
        plot(xxl,yyl,'-',0.0,0.0,'r*')
        title('Trajectory of Orbit, 5 Circular Periods or Stop on Repeat')
        xlabel('x/ro')
        ylabel('y/ro')
        axis([xmin xmax ymin ymax]) 
    end
%
end
%
%-----------------------------------------------------------------------------------
%
function dy = kepler(t,y)
global G Mo
%
dy = zeros(4,1);
r = sqrt(y(2) .^2 + y(4) .^2);
fr = -(G .*Mo) ./(r .^2.0);
dy(1) = (y(2) .*fr) ./r;
dy(3) = (y(4) .*fr) ./r;
dy(2) = y(1);
dy(4) = y(3);
%  
