%
% Program to compute the trajectory of a projectile with air resistance
%  
clear; 
help cm_ballis_sym;  % Clear memory and print header
%
syms g k x y t vo alf ax ay p q pp qq ttt
%
% eqs of motion of projectile falling under gravity
%
fprintf('Projectile Motion, Air Resistance  - Acceleration = k*dy/dt \n');
fprintf(' Air resistance k (sec^-1), Initial Angle/Velocity alf, vo -  x(t) and y(t) \n');
%
p = dsolve('D2x+k*Dx=0','Dx(0)=vo*cos(alf)','x(0)=0');
pp = dsolve('D2x=0','Dx(0)=vo*cos(alf)','x(0)=0');
pretty(p)
fprintf('x(t) With No Resistance \n')
pretty(pp)
%
q = dsolve('D2y+k*Dy+g=0','Dy(0)=vo*sin(alf)','y(0)=0');
qq = dsolve('D2y+g=0','Dy(0)=vo*sin(alf)','y(0)=0');
pretty(q)
fprintf('y(t) With No Resistance \n')
pretty(qq)
%
% terminal velocity
%
fprintf('y Velocity With Air Resistance \n');%
ttt = diff(q,t);
pretty(ttt)
%
gg = 9.8; % MKS units m/sec^2
kkk = 0.1;  % has 1/T units
%
irun = 1;
iloop = 0;
%
while irun > 0
    kk = menu('Pick Another Initial Velocity and Angle?','Yes','No');
    if kk == 2
        irun = -1;
        break
    end
    if kk == 1
        %
        syms g k x y t vo alf ax ay p q pp qq ttt
        fprintf('Projectile Motion, Air Resistance  - Initial Velocity vo \n');
        %
        voo = input('Enter Initial Projectile Velocity (m/sec): ');
        %
        aa = input('Enter Initial Projectile Angle (deg): ');
        %
        aa = (aa .*2 .*pi) ./360.0;
        %
        % pick max time from no resistance case
        %
        tt = linspace(0, (2.0 .*voo .*sin(aa)) ./gg);
        %
        p = dsolve('D2x+k*Dx=0','Dx(0)=vo*cos(alf)','x(0)=0');
        pp = dsolve('D2x=0','Dx(0)=vo*cos(alf)','x(0)=0');
        q = dsolve('D2y+k*Dy+g=0','Dy(0)=vo*sin(alf)','y(0)=0');
        qq = dsolve('D2y+g=0','Dy(0)=vo*sin(alf)','y(0)=0');
        alf = aa;
        %
        g = gg;
        k = kkk;
        vo = voo;
        %
        for i=1:100
            t = tt(i);
            xxx(i) = eval(p); % resistance dxdt
            yyy(i) = eval(q); % resistance dydt
            if yyy(i) < 0;
                yyy(i) = 0;
            end
        end
        % 
        for i=1:100
            t = tt(i);
            Xxx(i) = eval(pp); % free fall
            Yyy(i) = eval(qq);
            if Yyy(i) < 0
                Yyy(i) = 0;
            end
        end
        %
        iloop = iloop + 1;
        %
        figure(iloop)
        plot(tt,xxx,tt,Xxx,':')
        title('x as a function of t, with and without air resistance')
        xlabel('t(sec)')
        ylabel('x(m)')
        %
        iloop = iloop + 1;
        figure(iloop)
        plot(tt,yyy,tt,Yyy,':')
        title('y as a function of t, with and without air resistance')
        xlabel('t(sec)')
        ylabel('y(m)')
        %
        iloop = iloop + 1;
        figure(iloop)
        jj = length(xxx);
        xmax = max(Xxx);
        ymax = max(Yyy);
        for i = 1:jj
           plot(xxx(i),yyy(i),'bo',Xxx(i),Yyy(i),'r*')
           title('x as a function of y, with and without air resistance')
           xlabel('x(m)')
           ylabel('y(m)')
           pause(0.1)
           axis([0, xmax, 0, ymax])
           legend('Air Resist','No Resist')
           hold on
        end
        hold off
        iloop = iloop + 1;
        figure(iloop)
        plot(xxx,yyy,'-b',Xxx,Yyy,'r:')
        title('x as a function of y, with and without air resistance')
        xlabel('x(m)')
        ylabel('y(m)')
        legend('Air Resist','No Resist')
        %
    end
end