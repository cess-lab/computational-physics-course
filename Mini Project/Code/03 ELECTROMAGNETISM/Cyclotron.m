% 
% Program to look at Cyclotron Operation - NR only 
% 
clear all;  
help Cyclotron      % Clear the memory and print header
%
% work in dimensionless units as possible
%
fprintf('Cyclotron w = qB/m, r = m*vT/qB = vT/w \n')
fprintf('Relativistic Effects, w Decreases and r Increases by gamma \n')
fprintf('Cyclotron Has a 5 m radius \n')
%
irun = 1;
iloop = 0;
%
while irun > 0
    kk = menu('Pick Another Number of Half Rotations','Yes','No');
    if kk == 2
        irun = -1;
        break
    end
    if kk == 1
        %
        n = input('Enter Number of Half Rotations: ');
        da = input('Enter Energy Kick in Cross Dees ( sqrt radius units): ');
        % 
        t = linspace(0.0, pi .*n,200);
        % initial radius
        a = 0.2;   % initial energy
        %
        NT = length(t);
        %
        xx(1) = a; % starting up
        yy(1) = 0;
        dt = t(2)-t(1);
        %
        for i = 2:NT
            % which half rotation?
            j = 1 +(i *n ./NT);
            aj = a + da .*(j-1);
            xx(i) = xx(i-1) + aj .*cos(t(i)) .*dt;
            yy(i) = yy(i-1) + aj .*sin(t(i)) .*dt;
                
        end
        %
        % draw "dees" 
        %
        xdee = linspace(-5,5);
        ydee = sqrt(25.0 - xdee .^2);
        yp(1)=0.1;     ym(1) = - 0.1;
        xp(1)= -5;     xm(1) =  -5; 
        yp(2) = 0.1;   ym(2) = -0.1;
        xp(2) = 5;     xm(2) = 5;
        iloop = iloop + 1;
        figure(iloop);
        plot(xdee,ydee,'b',xdee,-ydee,'r',xp,yp,'b-',xm,ym,'r-')
        xlabel('x(m)')
        ylabel('y(m)')
        title('Cyclotron Orbits - Non-Relatisivtic')
        %
        hold on
        for i = 1:NT
            plot(xx(i),yy(i),'og')
            pause(0.1)
        end
        hold off
    end
end
%