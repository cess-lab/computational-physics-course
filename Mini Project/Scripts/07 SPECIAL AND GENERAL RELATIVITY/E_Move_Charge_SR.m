%
% Electric Field of Moving Charge
%
clear all;  
help E_Move_Charge_SR      % Clear the memory and print header
%
% Initialize  
%
fprintf('Charged particle Moving Along z Axis \n ')
fprintf('Velocity w.r.t. c is b, Observation point at (b,0,0) \n ')
fprintf('Units for E is Exmax = e/b^2  \n')
fprintf('Units for t is +- 5 units of b/v \n ')
%
iloop = 0;
irun = 1;
%
while irun > 0
    kk = menu('Pick Another Value of beta','Yes','No');
    if kk == 2
        irun = -1;
        break
    end
    if kk == 1
        be = input('Enter Velocity of Charge beta: ');
        % 
        % tprime = t*v/be
        %
        tp = linspace( -5,5);
        g = 1.0 ./sqrt(1.0 - be .^2);
        fact = 1.0 ./(1.0 + (g .*tp) .^2) .^1.5;
        Ex = g .*fact;
        Ez = - g .*tp .*fact;
        %
        iloop = iloop + 1;
        figure(iloop)
        plot(tp,Ex)
        title('Ex in Units of e/b^2')
        xlabel('tprime = tv/b')
        ylabel(' Ex')
        %
        iloop = iloop + 1;
        figure(iloop)
        plot(tp,Ez)
        title('Ez in Units of e/b^2')
        xlabel('tprime =  t*v/b')
        ylabel('Ey')
        %
        % movie of the motion
        %
         iloop = iloop + 1;
        for i = 1:length(tp)
            figure(iloop)
            xb(1) = tp(i);
            xb(2) = 0;
            yb(1) = 0;
            yb(2) = 1;
            xex(1) = 0.0;
            xex(2) = Ez(i);
            yex(1) = 1;
            yex(2) = Ex(i) + 1;
            plot(tp(i),0.0,'*',xb,yb,'b:',xex,yex,'-r')
            axis([-6 6 -1 5])
            title('E in Units of e/b^2')
            xlabel('tprime =  t in units of b/v')
            ylabel('E')
            pause(0.1)
        end
    end
end
%