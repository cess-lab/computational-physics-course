%
% Symbolic Math - Taylor expansion
%
clear all; 
help SM_Taylor      % Clear the memory and print header
%
% Initialize  
%
syms  a b n x Y N yy fin ftay
%
fprintf('Symbolic Math Taylor Expansion: enter f(x), + - * / ^ cos sin tan sqrt,x a b n \n ')
fprintf(' An Example \n')
fin = cos(x)
aoff = 0;
ftay = taylor(sym(fin),x,aoff,'Order',5);
yy = simple(ftay);
pretty(yy)
%
iloop = 1;
figure(iloop)
%
xx = linspace(-5,5);
for i = 1:100
    x = xx(i);
    fx(i) = eval(fin);
    tfx(i) = eval(ftay);
end
plot(xx,fx,'r-',xx,tfx,':b')
xlabel('x');
ylabel('f(x), Taylor(f(x)')
title(' cos(x) and Taylor Expansion Around x = 0, 5 Terms')
legend('f(x)','Taylor(f(x))')
%
irun = 1;
%
while irun > 0
    krun = menu('Another Function?','Yes','No');
    if krun == 2
        irun = -1;
        break
    end
    %
    if krun == 1
        iloop = iloop + 1;
        clear ( 'x' ,'fin', 'ftay')
        syms  a b n x Y N yy fin ftay
        fin = input(' Enter f(x): ');
        nterm = input(' Enter Number of Terms: ');
        aoff = input('Enter a, Expansion About x = a: ');
        ftay = taylor(sym(fin),x,aoff,'Order',nterm);
        yy = simple(ftay);
        pretty(yy)
         %
         xx = linspace(-5,5);
        for i = 1:100
            x = xx(i);
            fx(i) = eval(fin);
            tfx(i) = eval(ftay);
        end
        figure(iloop)
        plot(xx,fx,'r-',xx,tfx,':b')
        xlabel('x');
        ylabel('f(x), Taylor(f(x)dx)')
        title(' f(x) and Taylor Expansion')
        legend('f(x)','Taylor(f(x))')
         %
    end
end
%