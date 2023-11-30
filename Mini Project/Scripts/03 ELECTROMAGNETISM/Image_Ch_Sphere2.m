%
% Program to Find Induced Charge on a Grounded Sphere by External Charge
% Using Images
%
clear all; help Image_Ch_Sphere2;  % Clear memory and print header
% 
iloop = 0;
irun = 1;
%
while irun > 0
    kk = menu('Pick Another Charge Location?','Yes','No');
    if kk == 2
        irun = -1;
        break
    end
    if kk == 1
        %
        zq = input(' Charge Location in Units of Sphere Radius, > 1: ');
        % use radius a = 1, external charge q = 1
        zi = 1.0 ./zq;
        qi = -zi;
        fprintf('External Charge q=1 on z Axis. Theta is the Angle w.r.t. the z Axis \n');
        fprintf('Image Charge is at zi = a^2/zq with qi = -q*zi/a, a = 1, q = 1  \n');
        %
        % circle
        %
        xa = linspace(-1,1);
        yat = sqrt(1.0 - xa .*xa);
        yab = - yat;
        %
        % potential - grid with "slider" for image location
        %
        x = linspace(-2,2,20);
        z = linspace(-2,2,20);
        ZI = linspace(0.1, 0.9, 10);
        %
        for k = 1:length(ZI)
             for i = 1:length(x)
                for j = 1:length(z)
                 rI = sqrt(x(i) .^2 + (z(j)-ZI(k)) .^2);
                 rq = sqrt(x(i) .^2 + (z(j)-zq) .^2);
                 pot(i,j) = 1.0 ./rq - ZI(k) ./rI;
                end
             end
             %
             iloop = iloop + 1;
             figure(iloop)
             %
             plot(xa,yat,'-g',xa,yab,'-g',0.0,zq,'r*',0.0,ZI(k),'r*')
             %
             xlabel('x')
             ylabel('z')
             title('Equipotentials for zi from 0.1 to 0.9')
             axis([-1.5 1.5 -1 2.5])
             axis('square')
             hold on
             contour(x,z,pot',20,'b')
             hold off
             pause(0.5)
             %
             iloop = iloop + 1;
             figure(iloop)
             %
             plot(xa,yat,'-g',xa,yab,'-g',0.0,zq,'r*',0.0,ZI(k),'r*')
             %
             xlabel('x')
             ylabel('z')
             title('Electric Field for zi from 0.1 to 0.9')
             axis([-1.5 1.5 -1 2.5])
             hold on
             axis('square')
             [ex,ez] = gradient(pot');
             quiver(x,z,ex,ez);
             hold off
             pause(0.5)
        end
        %
        zq = 1.0 ./zq;
        ct = linspace(-1, 1 );
        sig = - ( zq .*(1 - zq .^2)) ./((1.0 + zq .^2 - (2.0 .*ct .*zq)) .^1.5);
        %
        iloop = iloop + 1;
        figure(iloop)
        semilogy(ct,abs(sig))
        title('Induced Charge Density on the Sphere')
        xlabel('cos(\theta)')
        ylabel('\sigma')
        hold off
        %
        zzq = linspace(1.4,5,10);
        zzq = 1.0 ./zzq;
        for i = 1:length(zzq)
             sigg(i,:) = -(zzq(i) .*(1 - zzq(i) .^2)) ./((1.0 + zzq(i) .^2 - (2.0 .*ct .*zzq(i))) .^1.5);
        end
        %
        iloop = iloop + 1;
        figure(iloop)
        for i = 1:length(zzq)
            semilogy(ct,abs(sigg(i,:)));
            hold on
        end
        axis([-1 1 0.1 10])
        hold off
        title('Induced Charge Density on the Sphere, for zq From 1.4 to 5')
        xlabel('cos(\theta)')
        ylabel('\sigma')
        %
    end
end
%