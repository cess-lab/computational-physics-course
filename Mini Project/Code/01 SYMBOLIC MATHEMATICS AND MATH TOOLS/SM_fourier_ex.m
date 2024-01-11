%
% Fourier - fourier series for functions, period = [-1/2,1/2]
%
clear all; help SM_fourier_ex;  % Clear memory and print header
%
% Initialize   - find which function
%
fprintf('x = ao/2 + sumk( ak*cos(kwt) + bk*sin(kwt) )  \n')
fprintf('ak = 2*int(x(u)*cos(2*pi*k*u)du, bk = 2*int(x(u)*sin(2*pi*k*u)du  \n')
fprintf('u = t/T, [-1/2,1/2], w = 2*pi/T, w*t = 2*pi*u  \n')
%
%
irun = 1;
iloop = 0;
%
while irun > 0
    %
    krun = menu('Choose Another Function?','Yes','No');
    if krun == 2
        irun = -1;
        break
    end
    if krun == 1;
        itype = menu('Type of Function','Square Wave','Triangle','Sawtooth');
        %
        u = linspace(-0.5,0.5,50); % one period
        %
        if itype == 1
        %
        % form the square wave
        %
            for k = 1:length(u)
                x(k) = 0.0;
                if abs(u(k)) < 0.25;
                    x(k) = 1.0;
                end
            end
        %
        % 5 terms
        %
        ao = 1;
        xf1 = ao ./2.0;
        for k = 1:5
            z(k) = (pi .*k) ./2.0;
            a(k) = sin(z(k)) ./(z(k));
            b(k) = 0.0;
        end;
        fprintf('z = pi*k/2, bk = 0, ak = sin(z)/z \n')
     end
    %
    if itype == 2
        %
        % form the triangle
        %
        for k = 1:length(u)
            if u(k) < 0.0;
                x(k) = 1.0 + 2.0 .*u(k);
            else
                x(k) = 1.0 - 2.0 .*u(k);
            end
        end
        %
        % 5 terms
        %
        ao = 1;
        xf1 = ao ./2.0;
        for k = 1:5
            z(k) = (pi .*k);
            a(k) = 2.0 .*(1.0 - cos(z(k)))  ./(z(k) .^2);
            b(k) = 0.0;
        end;
        fprintf('z = pi*k, bk = 0, ak = 2*(1-cosz)/z^2 \n')
    end 
    %
    if itype == 3
        %
        % form the sawtooth
        %
        x = u;
        %
        % 5 terms
        %
        ao = 0;
        xf1 = ao ./2.0;
        for k = 1:5
            z(k) = (pi .*k);
            b(k) = (sin(z(k)) - z(k) .*cos(z(k))) ./(z(k) .^2);
            a(k) = 0.0;
        end;
        fprintf('z = pi*k, bk = 0, ak = 2*(1-cosz)/z^2 \n')
    end
% 
    fprintf('Cos Coefficients \n')
    a
    fprintf('Sin Coefficients \n')
    b
    %
    for j = 1:length(u)
        xf2(j) = xf1 + a(1) .*cos(2 .*pi .*u(j)) + b(1) .*sin(2 .*pi .*u(j));
        xf3(j) = xf2(j) + a(2) .*cos(4 .*pi .*u(j)) + b(2) .*sin(4 .*pi .*u(j));
        xf4(j) = xf3(j) + a(3) .*cos(6 .*pi .*u(j)) + b(3) .*sin(6 .*pi .*u(j));
        xf5(j) = xf4(j) + a(4) .*cos(8 .*pi .*u(j)) + b(4) .*sin(8 .*pi .*u(j));
        xf6(j) = xf5(j) + a(5) .*cos(10 .*pi .*u(j)) + b(5) .*sin(10 .*pi .*u(j));
    end 
    iloop = iloop + 1;
    figure(iloop)
    plot(u,x,'-',u,xf1,':')
    xlabel('u = t/T')
    ylabel('x and Series for 1 term')
    legend('x', 'Fourier Series for x')
    %
    iloop = iloop + 1;
    figure(iloop)
    plot(u,x,'-',u,xf2,':')
    xlabel('u = t/T')
    ylabel('x and Series for 2 terms')
    legend('x', 'Fourier Series for x')   
    %
    iloop = iloop + 1;
    figure(iloop)
    plot(u,x,'-',u,xf3,':')
    xlabel('u = t/T')
    ylabel('x and Series for 3 terms')
    legend('x', 'Fourier Series for x') 
    %
    iloop = iloop + 1;
    figure(iloop)
    plot(u,x,'-',u,xf4,':')
    xlabel('u = t/T')
    ylabel('x and Series for 4 terms')
    legend('x', 'Fourier Series for x') 
    %
    iloop = iloop + 1;
    figure(iloop)
    plot(u,x,'-',u,xf5,':')
    xlabel('u = t/T')
    ylabel('x and Series for 4 terms')
    legend('x', 'Fourier Series for x') 
    %
    iloop = iloop + 1;
    figure(iloop)
    plot(u,x,'-',u,xf6,':')
    xlabel('u = t/T')
    ylabel('x and Series for 5 terms')
    legend('x', 'Fourier Series for x') 
    %
    end
end
%