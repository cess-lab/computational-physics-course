%
% Program to illustrate Transmission and Reflection at an Optical Interface
%
clear all;
help Reflect_Transmit;  % Clear memory and print header
% 
fprintf(' Reflection and Transmission at an Interface \n');
%
fprintf(' Ratio of Indices = ni/nt = 1/n \n')
nnorm = logspace(-1,1);
RN = ((nnorm-1) ./(nnorm+1)) .^2;
TN = 1.0 - RN;
iloop = 1;
figure(iloop)
semilogx(nnorm, RN,'b-', nnorm,TN,'r:')
title('Reflection and Transmission Coefficients at an Interface - Normal Incidence')
xlabel('nref/ninc')
ylabel('R,T')
legend('R','T')
%
irun = 1;
%
while irun > 0
    kk = menu('Pick Another Ratio of Refracted to Incident n?','Yes','No');
    if kk == 2
        irun = -1;
        break
    end
    if kk == 1
        %
        n = input('Input Ratio of n Refracted to n Incident: ');
        %
        fprintf(' Snells Law: sini/sinr = nr/ni = n \n')
        fprintf(' Perpendicular Incidence, R = ((n-1)/(n+1))^2, T = (2/(n+1))^2 \n')
        %
        % Brewster angle - no reflection for longitudinal polarization
        %
        thetab = (360 .*atan(n)) ./(2.0 .*pi);
        fprintf('No Reflection for Parallel Polarization at = %g (deg) \n',thetab)
        thetair = 1;
        if n < 1
            thetair = (360 .*asin(n)) ./(2.0 .*pi);
            fprintf(' Total Internal Reflection at = %g (deg) \n',thetair);            
        end
        %
        thi = linspace(0,pi ./2.0);   % incident angle
        %
        % transverse polarization
        %
        tht = asin(sin(thi)./n);
        R = (sin(thi - tht) ./sin(thi + tht)) .^2;
        T = 1.0 - R;
        for i = 1:length(thi)
            if thi(i) > asin(n)  && n < 1
                T(i) = 0;
                R(i) = 1;
            end
        end
        iloop = iloop + 1;
        %
        figure(iloop)
        plot(thi,real(tht),'-')
        title('Transmitted Angle vs Incident Angle ')
        xlabel('\theta_i')
        ylabel('\theta_t')
        %
        iloop = iloop + 1;
        figure(iloop)
        plot(thi,T,'-',thi,R,':')
        legend('T','R')
        title('Transmission and Reflection Coefficient vs Incident Angle - Transverse Pol')
        xlabel('\theta_i')
        ylabel('R,T')
        %
        % longitudinal polarization
        %
        iloop = iloop + 1;
        R = (tan(thi - tht) ./tan(thi + tht)) .^2;
        T = 1.0 - R;
        for i = 1:length(thi)
            if thi(i) > asin(n)  && n < 1
                T(i) = 0;
                R(i) = 1;
            end
        end
        figure(iloop)
        plot(thi,T,'-',thi,R,':')
        legend('T','R')
        title('Transmission and Reflection Coefficient vs Incident Angle - Parallel Pol')
        xlabel('\theta_i')
        ylabel('R,T')
        %
        % movie for refraction
        %
        si = linspace(0,0.8,5); % incident
        ti = tan(asin(si));
        sr1 = si ./n; % refracted in to out
        sr2 = si .*n;  % refracted out to in
        tr1 = tan(asin(sr1));
        tr2 = tan(asin(sr2));
        for i = 1:5
            xi1(1,i) = -0.1;
            xi2(1,i) =  0.1;
            yi1(1,i) = 1;
            yi2(1,i) = -1;
            xi1(2,i) = -0.1 - ti(i);
            yi1(2,i) = 0.0;
            xi2(2,i) = 0.1 + ti(i);
            xi1(3,i) = -0.1 - ti(i) - tr1(i);
            yi1(3,i) = -1.0;
            xi2(3,i) = 0.1 + ti(i) + tr2(i);
            yi2(3,i) = 1.0;
            if n > 1 && imag(xi2(3,i)) ~= 0
                yi2(3,i) = -0.01;
                xi2(3,i) = 2;
            end
            if n < 1 && imag(xi1(3,i)) ~= 0
                yi1(3,i) = 0.01;
                xi1(3,i) = -2;
            end
        end
        xint = [-3 3]; yint = [0 0];
        iloop = iloop + 1;
        figure(iloop)
        for i = 1:length(si)
            plot(xi1(:,i),yi1(:,i),'-b',xi2(:,i),yi2(:,i),'r-',xint,yint,'g-')
            xlabel('x')
            ylabel('y')
            title('Refract at Interface for This n Value')
            axis([-3 3 -1.5 1.5])
            hold on
            pause(0.5)
        end
        hold off
    end
end
%