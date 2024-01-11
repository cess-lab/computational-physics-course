%
% Symbolic Math - Integration
%
clear all;  
help SM_Int      % Clear the memory and print header
%
% Initialize  
%
syms x a b c d n Y N yy fin fint
%
fprintf('Symbolic Math Indefinite Integration: enter f(x), + - * / ^ cos sin tan sqrt, a,b,c,d,n \n ')
%
% an example
%
fprintf('An Example, Plot Function and Integral \n')
fin = tanh(x)
fint = int(sym(fin));
yy = simple(fint);
pretty(yy)
%
iloop = 1;
figure(iloop)
%
xx = linspace(-5,5);
for i = 1:100
    x = xx(i);
    fx(i) = eval(fin);
    ifx(i) = eval(fint);
end
plot(xx,fx,'r-',xx,ifx,':b')
xlabel('x');
ylabel('f(x), int(f(x)dx)')
title(' tanh(x) and Integral')
legend('f(x)','int(f(x)dx)')
%
irun = 1;
%
while irun > 0
    krun = menu('Another Function?','Yes', 'No');
    if krun == 2
        irun = -1;
        break
    end
    %
    if krun == 1;
        clear( 'x', 'fin', 'fint')
        syms x a b c d n Y N yy fin fint 
        iloop = iloop + 1;
        figure(iloop)
        fin = input(' Enter f(x): ');
        fint = int(sym(fin));
        yy = simple(fint);
        pretty(yy)
        %
        xx = linspace(-5,5);
        for i = 1:100
            x = xx(i);
            fx(i) = eval(fin);
            ifx(i) = eval(fint);
        end
        figure(iloop)
        plot(xx,fx,'r-',xx,ifx,':b')
        xlabel('x');
        ylabel('f(x), int(f(x)dx)')
        title(' Function and Integral')
        legend('f(x)','int(f(x)dx)')
    %
    end
end
%