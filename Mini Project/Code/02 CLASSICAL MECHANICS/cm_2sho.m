%
% Program to compute coupled simple harmonic motion
%  
clear;  
help cm_2sho;
%
% Clear memory and print header
%
% for 2 pendula both (k,m) coupled by a spring (k12)
%
syms xx x1 x2 k m k12 A1 A2 X1 X2
%
fprintf('2 pendula with (k,m) and Coupling k12, Solution with Initial Amplitude But No Velocity \n')
fprintf('D2x1=(-k*x1-k12*(x1-x2))/m  , D2x2=(-k*x2+k12*(x1-x2))/m \n')
%
[X1, X2] = dsolve('D2x1=(-k*x1-k12*(x1-x2))/m','D2x2=(-k*x2+k12*(x1-x2))/m','x1(0)=A1','Dx1(0)=0','x2(0)=A2','Dx2(0)=0');
%
% symbolic solution for the 2 displacements
%
%pretty(X1)
%pretty(X2)
%
iloop = 0;
irun  = 1;
while irun > 0
    %
    krun = menu('Another Set of Parameters to Solve?','Yes','No');
    if krun == 2
        irun = -1;
        break
    end
    %
    if krun == 1
        iloop = iloop + 1
        mm = input('Enter Equal Masses: ');  
        kk = input('Enter Equal Spring Constants: ');
        kk12 = input('Enter 1-2 Spring coupling: ');
        AA = input('Enter Initial Displacements of the 2 Springs - [A(1),A(2)]: ');
        m = mm;
        k = kk;
        k12 = kk12;
        A1 = AA(1);
        A2 = AA(2);
        tt = linspace(0,10,100);
        for i=1:100
            t = tt(i);
            xxx1(i) = real(eval(X1));
            xxx2(i) = real(eval(X2));
        end
        %
        figure(iloop)
        plot(tt,xxx1,'b-',tt,xxx2,'r-')
        title('Spring Coupled Motion of 2 Pendula')
        xlabel('t')
        ylabel('x_1, x_2')
        legend('x_1','x_2')
        %
        iloop = iloop + 1;
        figure(iloop)
        plot(tt,xxx1-xxx2,'b-',tt,xxx1+xxx2,'r-')
        title(' \omega for x_1+x_2=sqrt(k/m), \omega for x_1-x_2 =sqrt(k+2k12)/m)')
        xlabel('t')
        ylabel('x_1+- x_2')
        legend('x_1-x_2','x_1+x_2')
        %
        iloop = iloop + 1;
        figure(iloop)
        x1max = max(xxx1);
        x2max= max(xxx2);
        x1min = min(xxx1);
        x2min = min(xxx2);
        xmin = x1min;
        if x2min < x1min
            xmin = x2min;
        end
        xmax = x1max;
        if x2max > x1max
            xmax = x2max;
        end
        xp1(1) = 0; 
        yp1(1) = 1;
        yp1(2) = 0;
        xp2(1) = 0; 
        yp2(1) = 1;
        yp2(2) = 0;
        xc = 0;
        yc = 1;
        %
        for i=1:100  
            xp1(2) = xxx1(i);
            xp2(2) = xxx2(i) ; %+ 5;
            plot(xxx1(i),0,'o',5 + xxx2(i),0,'o')
            hold on
            plot(xp1,yp1,'r-',xp2+5,yp2,'g-',xc,yc,'-')
            xcou(2) = xxx2(i)+5; ycou(1) = 0;
            xcou(1) = xxx1(i); ycou(2) = 0;
            plot(xcou,ycou,'--')
            title('x_1 and x_2 Movie in Time')
            xlabel('x_1           x_2')
            axis([xmin xmax+5 -0.5 1]);
            pause(0.1)
            hold off
        end
%
    end
end
%

