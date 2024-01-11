%
% Program to Ray Trace the Focus of a Spherical Mirror and Look at
% Aberration
%
clear all;
help Spherical_Mirror;  % Clear memory and print header
% 
fprintf(' Focal Point of a Spherical Mirror, Radius = 1 \n');
%
% unit radius, with incident parallel rays from the left (x < 0)
%
iloop = 0;
irun = 1;
%
while irun > 0
    kk = menu('Pick Another Maximum Incident Ray for the Mirror?','Yes','No');
    if kk == 2
        irun = -1;
        break
    end
    if kk == 1
        %
        ymax = input('Enter The Maximum Value of the Incident Parallel Ray y : ');
        yray = linspace(0,ymax, 10);
        xhit = cos(asin(yray));   % the incident rays
        theta = asin(yray);
        xr(1,:) = [-1 -1 -1 -1 -1 -1 -1 -1 -1 -1];
        xr(2,:) = xhit;
        yr(1,:) = yray(:);
        yr(2,:) = yray(:);
        yr(3,:) = 0.0;
        xr(3,:) = (xhit .*tan(2.0 .*theta) - yray) ./(tan(2.0 .*theta));
        %
        iloop = iloop + 1;
        figure(iloop)
        for i = 1:10
            plot(xr(:,i),yr(:,i),'b-')
            plot(xr(2,i),yr(2,i),'b-',xr(3,i),yr(3,i),'b-')
            hold on
        end
        ym = linspace(0,1);   % the mirror
        xm = sqrt(1 - ym .^2);
        plot(xm,ym,'r-')
        title('Focal Position for Parallel Incident Rays - Aberration')
        xlabel('x')
        ylabel('y')
        axis([-0.0 1.0 0 ymax]);
        %
        hold off
    end
end
%