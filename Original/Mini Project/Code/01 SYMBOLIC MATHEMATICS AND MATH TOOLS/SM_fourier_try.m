%
% Fourier - fourier series for analytic function - input
%
clear all; 
help SM_fourier_try;  % Clear memory and print header
%
irun = 1;
iloop = 0;
%
while irun > 0
    %
    krun = menu('Input Another Function?','Yes','No');
    if krun == 2
        irun = -1;
        break
    end
    if krun == 1;
        %
        % Initialize  - get function
        %
        syms x1 x2 t xx a b
        %
        fprintf('Period is T = 1, Enter x(t) for First and Second 1/2 Period \n');
        %
        fprintf('Enter x(t) for t < 1/2 as an equation; e.g., t*cos(t) \n');
        x1 = input(': ','s');   % Read input as a text string
        fprintf('Enter x(t) for t > 1/2 as an equation; e.g., t*cos(t) \n');
        x2 = input(': ','s');   % second part of function
        %
        % period of function is assumed to be scaled to T = 1, could add T later
        %
        T = 1.0;
        %
        tt = linspace(0,T,50);
        %
        N = input('Enter Number of Terms in the Series : ');
        %
        % find cos, sin terms
        % frequency
        %
        w = (2.0 .*pi) ./T;
        %
        % find coefficients of the Fourier series - constant term
        %
        a(1) = (2.0 ./T) .*(int(sym(x1),0,T ./2.0) + int(sym(x2),T ./2.0,T));
        b(1) = 0;
        aa(1) = eval(a(1));
        bb(1) = 0.0;
        %
        for jj = 1:N
            %
            a(jj+1) = (2.0 ./T)*int(sym(x1*cos(jj*w*t)),0,T ./2.0); % first 1/2 period
            a(jj+1)= a(jj+1)+ (2.0 ./T)*int(sym(x2*cos(jj*w*t)),T ./2.0,T); % second
            b(jj+1) = (2.0 ./T)*int(sym(x1*sin(jj*w*t)),0,T ./2.0);
            b(jj+1) = b(jj+1) + (2.0 ./T)*int(sym(x2*sin(jj*w*t)),T ./2.0,T);
            aa(jj+1) = eval(a(jj+1));
            bb(jj+1) = eval(b(jj+1));
            %
        end
        %
        kk = (1:N+1);
        iloop = iloop + 1;
        figure(iloop)
        plot(kk,aa,'*',kk,bb,'o')
        title('Coefficients of the Fourier Series')
        xlabel('Order')
        ylabel('a,b Coefficient')
        legend('cos terms','sin terms')
        %
        fprintf('Even and Odd Fourier Coefficients \n')
        a
        b
        %
        xx = a(1)/2; % constant term - DC
        %
        for ii = 1:N
            xx = xx + a(ii+1)*cos(ii*w*t) + b(ii+1)*sin(ii*w*t);
        end
        for j=1:25
            t = tt(j);
            xp(j) = eval(x1);
            xxx(j) = eval(xx);
        end
        for j = 26:50
            t = tt(j);
            xp(j) = eval(x2); 
            xxx(j) = eval(xx);
        end
        %
        iloop = iloop + 1;
        figure(iloop)
        plot(tt,xp,'r-',tt,xxx,'b-');
        title(sprintf('Fourier Series with %g Terms',N));
        xlabel('t')
        ylabel('x(t)')
        legend('x','Fourier Series for x');
        %
        fprintf('Full Fourier Series \n')
        xx
        %
    end
end
%