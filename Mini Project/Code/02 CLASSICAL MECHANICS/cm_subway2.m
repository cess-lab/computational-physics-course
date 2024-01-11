%
% earth subway - compute free fall through chord of earth
%
clear all;      % Clear memory
help cm_subway2;    % Print header
%
% Initialize variables, subway is defined by chord 
%  
g = 9.81;   % Gravitational acceleration (m/s^2)
re = 6.38 .*10 .^6;  % Earth radius (m)
%
fprintf('"Free" Subway - Earth Radius = %g (m) \n',re);
%
irun = 1;
iloop = 0;
%
while irun > 0
    kk = menu('Pick Another Subway Distance?','Yes','No');
    if kk == 2
        irun = -1;
        break
    end
    if kk == 1
    %
    % pick chord for "free" subway
    %
        dist = input('Enter Subway Distance in km : ');
        dist = dist .*1000;
        theta = asin(dist ./(2.0 .*re));
        depth = re .*(1-cos(theta));
        sdist = (re .*2.0 .*theta);
        %
        fprintf('Free Subway Max Depth = %g (m) \n',depth);
        fprintf('Free Subway Distance Along Earth = %g (m) \n',sdist);
        %
        % Gauss law - uniform Earth density ==> force due to distance to earth
        % center, mass inside scales at r^3
        % eq of motion is; accel = gx/re, due to |a| = GM/r^2~ r and dir
        % cosine= x/r
        % start with no velocity, supply no energy = "free subway" - "drop" to destination
        % simple harmonic motion  
        % 
        omega = sqrt(g ./re ); % SHM frequency
        T = (2.0 .*pi) ./omega; % period 
        T = T ./2.0;    % trip is one way = 1/2 period
        fprintf('Circular Frequency = %g Trip Time = %g (sec) \n',omega,T)
        %
        t = linspace(0,T);
        x = - re .*sin(theta) .*cos(omega .*t);
        %
        N = length(t);
        for jj=1:N
            plot(t(jj),real(x(jj)-x(1)),'o')
            title('Movie of Subway Trip')
            xlabel('time(sec)')
            ylabel('Distance Traversed by Subway (m)')
            axis([0 t(N) 0 max(x-x(1))])
            pause(0.1)
        end
        iloop = iloop + 1;
        figure(iloop)
        plot(t,real(x-x(1)))
        title('x(m) as a function of t along the subway')
        xlabel('t(sec)')
        ylabel('x(m)')
        %
    end
end
%