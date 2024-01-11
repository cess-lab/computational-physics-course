% Program to illustrate || and T Doppler and Cerenkov Mach cone
%
clear all; 
help Doppler_Cerenkov;  % Clear memory and print header
% 
fprintf(' Doppler Wavelength Shift - Red, Blue and Transverse \n');
%
iloop = 0;
irun = 1;
%
while irun > 0
    kk = menu('Pick Another Velocity of the Source?','Yes','No');
    if kk == 2
        irun = -1;
        break
    end
    if kk == 1
        %
        v = input('Input Velocity of Source w.r.t. Light, sin(thetac) = 1/n: ');
        %
        % make for 6 emission times and points 
        %
        te = linspace(0,5,6);
        %
        xe = v .*te;  % x position at emission
        ye = 0.0 .*te;
        %
        % sample at 10 times
        %
        t = linspace(0,6,11);
        %
        for i = 1:11 ; % time of snapshot
            if t(i) > te(1);   % after emission at point 1
                r = (t(i) - te(1));
                yr = linspace(0,r,25);
                y1(i,:) = yr;
                x1(i,:) =sqrt(r .^2 - y1(i,:) .^2) + xe(1);
                xx1(i,:) = -sqrt(r .^2 - y1(i,:) .^2) + xe(1);
            end
            if t(i) > te(2);   % after emission at point 2
                r = (t(i) - te(2));
                yr = linspace(0,r,25);
                y2(i,:) = yr;
                x2(i,:) =sqrt(r .^2 - y2(i,:) .^2) + xe(2);
                xx2(i,:) = -sqrt(r .^2 - y2(i,:) .^2) + xe(2);
            end
            if t(i) > te(3);   % after emission at point 3
                r = (t(i) - te(3));
                yr = linspace(0,r,25);
                y3(i,:) = yr;
                x3(i,:) =sqrt(r .^2 - y3(i,:) .^2) + xe(3);
                xx3(i,:) = -sqrt(r .^2 - y3(i,:) .^2) + xe(3);
            end 
            if t(i) > te(4);   % after emission at point 4
                r = (t(i) - te(4));
                yr = linspace(0,r,25);
                y4(i,:) = yr;
                x4(i,:) =sqrt(r .^2 - y4(i,:) .^2) + xe(4);
                xx4(i,:) = -sqrt(r .^2 - y4(i,:) .^2) + xe(4);
            end       
            if t(i) > te(5);   % after emission at point 5
                r = (t(i) - te(5));
                yr = linspace(0,r,25);
                y5(i,:) = yr;
                x5(i,:) =sqrt(r .^2 - y5(i,:) .^2) + xe(5);
                xx5(i,:) = -sqrt(r .^2 - y5(i,:) .^2) + xe(5);;
            end 
            if t(i) > te(6);   % after emission at point 6
                r = (t(i) - te(6));
                yr = linspace(0,r,25);
                y6(i,:) = yr;
                x6(i,:) =sqrt(r .^2 - y6(i,:) .^2) + xe(6);
                xx6(i,:) = -sqrt(r .^2 - y6(i,:) .^2) + xe(6);;
            end 
        end
        %
        iloop = iloop + 1;
        for i = 1:11
            figure(11 .*(iloop -1) +i)
            plot(x1(i,:), y1(i,:),'-',xx1(i,:),y1(i,:),':r')
            hold on
            plot(x2(i,:), y2(i,:),'-',xx2(i,:),y2(i,:),':r')
            plot(x3(i,:), y3(i,:),'-',xx3(i,:),y3(i,:),':r')
            plot(x4(i,:), y4(i,:),'-',xx4(i,:),y4(i,:),':r')
            plot(x5(i,:), y5(i,:),'-',xx5(i,:),y5(i,:),':r')
            plot(x6(i,:), y6(i,:),'-',xx6(i,:),y6(i,:),':r')
            title(' Light Emission at 11 Time Samples ')
            xlabel('x')
            ylabel('y') 
            plot(xe,ye,'g*')
            pause(1);
            hold off
        end
        %
    end
end
%