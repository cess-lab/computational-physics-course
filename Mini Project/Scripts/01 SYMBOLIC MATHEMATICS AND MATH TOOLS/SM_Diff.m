%
% Symbolic Math - Differentiation
%
clear all;  
help SM_Diff      % Clear the memory and print header
%
% Initialize  
%
syms  x a b n fin fpr Y N yy finn fprn
%
fprintf('Symbolic Math Differentiation: enter f(x), + - * / ^ cos sin tan sqrt,x a b n \n ')
%
% example
%
fprintf('An Example, Plot Function and Derivative \n ')
fin = sin(x^2)
fpr = diff(sym(fin));
yy = simple(fpr);
pretty(yy)
%
iloop = 1;
figure(iloop)
%
xx = linspace(-5,5);
for i = 1:100
    x = xx(i);
    fx(i) = eval(fin);
    dfx(i) = eval(fpr);
end
plot(xx,fx,'r-',xx,dfx,':b')
xlabel('x');
ylabel('f(x), df(x)/dx')
title(' sin(x^2) and Derivative')
legend('f(x)','df(x)/dx')
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
        clear( 'x', 'fin', 'fpr')
        syms  x a b n fin fpr Y N yy 
        iloop = iloop + 1;
        fin = input(' Enter f(x): ');
        %
        fpr = diff(sym(fin));
        yy = simple(fpr);
        pretty(yy)
        %
        xx = linspace(-5,5);
        for i = 1:100
            x = xx(i);
            fx(i) = eval(fin);
            dfx(i) = eval(fpr);
        end
        figure(iloop)
        plot(xx,fx,'r-',xx,dfx,':b')
        xlabel('x');
        ylabel('f(x), df(x)/dx')
        title(' Function and Derivative')
        legend('f(x)','df(x)/dx')
    %
    end
end
%