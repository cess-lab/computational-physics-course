%
% Program to compute oscillations - single spring, damped and driven
%  
clear;  help cm_osc;  % Clear memory and print header
%
% spring (k,m)  mass and spring constant
% 
syms k m x t y yd B w
%
y = dsolve('D2x=-k*x/m','x(0)=A','Dx(0)=0'); % free oscillation
%
fprintf(' SHM, Initial Position = A, No Initial Velocity \n')
pretty(y)
%
% now a damped oscillation
%
 yd = dsolve('D2x=-k*x/m-b*Dx/m','x(0)=A','Dx(0)=0');
%
fprintf(' SHM - Damped with Amplitude b, Initial Position = A, No Initial Velocity \n')
%pretty(yd);
%
ydr = dsolve('D2x=-k*x/m-b*Dx/m+B*cos(w*t)','x(0)=A','Dx(0)=0');
%
fprintf(' SHM - Damped with Amplitude b, Driven with Amplitude B, Frequency w \n')
%pretty(ydr);
%
% now numerical evaluations
%
irun = 1;
iloop = 0;
%
while irun > 0
    kk = menu('Pick Another Driven, Damped Spring?','Yes','No');
    if kk == 2
        irun = -1;
        break
    end
    if kk == 1
        %
        %kkk = input('Enter Spring Constant k: ');
        %mm = input('Enter Mass on Spring m: ');
        %wo = sqrt(kkk ./mm);
        wo = 1;
        fprintf('Spring Natural Frequency = %g \n',wo); 
        AA = input('Enter Initial Displacement A: ');
        bb = input('Enter Damping Coefficient b/m: ');
        %
        gam = bb ./2.0;
        wnatsq = (wo .^2 - gam .^2);
        if wnatsq < 0
            fprintf('Overdamped \n')
        else
            wnat = sqrt(wnatsq);
            fprintf(' Underdamped Oscillation Frequency = %g \n',wnat);
        end
        %
        tt = linspace(0,10,100);
        k = 1;
        m = 1;
        A = AA;
        b = bb;
        for i = 1:100
            t = tt(i);
            yy(i) = eval(y);
            yyd(i) = eval(yd);
        end
        %
        iloop = iloop + 1;
        figure(iloop)
        for j = 1:length(tt)
            plot(tt(j),real(yy(j)),'bo',tt(j),real(yyd(j)),'r*:')
            hold on
            title(' Spring Motion, Undamped and Damped')
            xlabel('t')
            ylabel('x')
            legend('undamped','damped')
            axis([0 10 -1 1])
            pause(0.1);
        end
        hold off
        iloop = iloop + 1;
        figure(iloop)
        plot(tt,real(yy),'b-',tt,real(yyd),'r:')
        title(' Spring Motion, Undamped and Damped')
        xlabel('t')
        ylabel('x')
        legend('undamped','damped')
        %
        BB = input('Enter Driving Amplitude B: ');
        ww = input('Enter Driving Frequency \omega: ');
        wressq = wo .^2 - (bb .^2) ./2.0;
        wres = sqrt(wressq);
        fprintf('Driven Resonant Frequency = %g \n',wres);
        w = ww;
        B = BB;
        for i = 1:100
            t = tt(i);
            yydr(i) = eval(ydr);
        end
        %
        iloop = iloop + 1;
        figure(iloop)
        plot(tt,real(yyd),tt,real(yydr),':')
        title('Damped Spring Motion, Undriven and Driven')
        xlabel('t')
        ylabel('x')
        legend('undriven','driven')
        %
        www = linspace(0,2 .*wo,25);
        %
        B = BB;
        for j = 1:25
             w = www(j);
            for i = 1:100
                t = tt(i);
                yyydr(i) = eval(ydr);
            end
            ydrmx(j) = max(yyydr);  
        end
        iloop = iloop + 1;
        figure(iloop)
        plot(www,abs(ydrmx))
        title(' Damped Spring Motion, Max Amplitude vs Driving Frequency')
        xlabel('\omega')
        ylabel('x')
        hold on
        plot(wo,AA,'ro',abs(wnat),AA,'b*',abs(wres),AA,'g+',abs(wo-gam),AA+0.5,'r+',abs(wo+gam),AA+0.5,'r+')
        ydrvmx = max(abs(ydrmx));
        ymaxplt = AA+1;
        if ydrvmx > AA+1;
            ymaxplt = ydrvmx;
        end
        axis([min(www),max(www),0.,ymaxplt])
        %
        hold off
        legend('max x','\omegao','\omegadamped','\omegares', 'ResWidth')
        %
    end
end
%

