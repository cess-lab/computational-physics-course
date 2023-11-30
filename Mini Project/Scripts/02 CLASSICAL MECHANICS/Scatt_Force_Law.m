%
% Program to compute the trajectory for scattering of diffferent Force Laws
% use MATLAB ode
%
function Scatt_Force_Law
%
clear;  
help Scatt_Force_Law;  % Clear memory and print header
%
global iforce qq
%
% menu
%
fprintf(' Energy and Mass Defined = 1 \n')
%
irun = 1;
iloop = 0;
%
while irun > 0
    kk = menu('Pick Another Force Law?','Yes','No');
    if kk == 2
        irun = -1;
        break
    end
    if kk == 1
        %
        iforce  = menu('F(r) = 1/r^n','n=1','n=2','n=3','n=4');
        qq = menu(' Repel/Attract?','Attractive ', 'Repulsive');
        if qq == 1
            qq = -1;  % attractive
        end
        if qq == 2
            qq = 1;   % repulsive
        end
        %
        E = 1;
        m = 1;
        vo = sqrt((2.0 .*E) ./m);   % units so initial velocity = sqrt(2)
        b = linspace(0.4, 4, 5);   % impact parameter
        %
        tspan = linspace(0,20,20);
        N = length(tspan);
        xc(1) = 0;
        yc(1) = 0; 
        %
        % protect for attractive and central forces
        %
        if qq == -1 && iforce > 2
             b = linspace(1.0, 6.6, 5);
        end
        iloop = iloop + 1;
        figure(iloop)
        for ii = 1:length(b)
            [t,y] = ode45(@impact,tspan,[vo -10 0 b(ii)]); % initial vx = vo, vy = 0, x = -10, y = b
            %
            xx = y(:,2);
            yy = y(:,4);
            for jj = 1:N
                %
                plot(xx(jj),yy(jj),'o',xc,yc,'*')
                title('Trajectory of Scattering for This Force Law')
                xlabel('x')
                ylabel('y')
                if qq == -1
                    axis([-15 20 -20 5])
                end
                if qq == 1
                    axis([-15 20 0 20])
                end
                pause(0.1)
                hold on
            end
            %
            costheta = y(N,2) ./sqrt(y(N,2) .^2 + y(N,4) .^2); % scattered angle
            theta(ii) = acos(costheta);
           % plot(xx,yy,'-',xc,yc,'*')
            %title('Trajectory of Scattering for This Force Law')
            %xlabel('x')
            %ylabel('y')
            %hold on
        end
        hold off
        iloop = iloop + 1;
        figure(iloop)
        plot(b, theta,'-')
        title('Scattering Angle vs. Impact parameter')
        xlabel('b')
        ylabel('\theta')
        %
    end
end
%
%---------------------------------------------------------
function dy = impact(t,y)
global iforce qq
%
dy = zeros(4,1);
r = sqrt(y(2) .^2 + y(4) .^2);
if iforce == 1
   fr = qq .*1.0 ./r .^1.0;
end
if iforce == 2
   fr = qq .*1.0 ./r .^2.0;
end
if iforce == 3
   fr = qq .*1.0 ./r .^3.0;
end
if iforce == 4
   fr = qq .* 1.0 ./r .^4.0;
end
dy(1) = (y(2) ./r) .*fr;
dy(3) = (y(4) ./r) .*fr;
dy(2) = y(1);
dy(4) = y(3);
%