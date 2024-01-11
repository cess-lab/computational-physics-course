%
% Program to Illustrate Time Dilation With a Gedanken Clock
%
clear all; help SR_Time_Dilate;  % Clear memory and print header
% 
fprintf(' Clock is a Light Source and a Mirror \n');
%
iloop = 0;
irun = 1;
%
while irun > 0
    kk = menu('Pick Another Clock Velocity?','Yes','No');
    if kk == 2
        irun = -1;
        break
    end
    if kk == 1
        %
        b = input('Input the Velocity of the Clock w.r.t. c: ');
        %
        g = 1.0 ./sqrt(1.0 - b .*b);
        %
        % the clock rest frame
        %
        lig = [0 0];  % location of light and mirror in S
        mir = [0 40];
        %
        c = 4;
        imax = 2.0 .*mir(2) ./c;
        for i =1:imax ;   % i is the time in clock ticks
            if i < imax ./2
                yl(i) = c*i;
            else
                yl(i) = 2.0 .*mir(2) - c*i;
            end
        end
        %
        iloop = iloop + 1;
        figure(iloop)
        %
        subplot(1,2,1)
        for i = 1:length(yl)
            plot(lig(1),yl(i),'o',lig(1),lig(2),'*', mir(1),mir(2),'^')
            axis([-1 1 -1 41])
            pause(0.4);
        end
        title('Clock in the Rest Frame')
        xlabel('Clock z position')
        ylabel('Clock x position')
        %
        jmax = floor(g .*imax);   % number of clock ticks in S' moving frame
        fprintf('\n Clock Ticks in Rest Frame = 20, in Moving Frame =  %g \n',jmax);
        %
        for i = 1:jmax
            xlig(i) = b .*c .*i;  % in S', light is at (xlig,0), mirror at (xlig,mir(2))
            r = c .*i;   % location of outgoing light flash
            th = atan((mir(2) .*2) ./(b .*c .*jmax));  % need to "lead" the mirror by theta
            xl(i) = r .*cos(th);
            yl(i) = r .*sin(th);
            if yl(i) > mir(2)
                yl(i) = 2.0 .*mir(2) - yl(i);
            end
        end
        subplot(1,2,2)      
        for i = 1:length(yl)
            plot(xl(i),yl(i),'o',xlig(i),lig(2),'*', xlig(i),mir(2),'^')
            axis([-1 xlig(jmax)+5 -1 41])
            pause(0.4);
        end
        title('Clock in the Moving Frame')
        xlabel('Clock z position')
        ylabel('Clock x position')
        %
    end
end
%