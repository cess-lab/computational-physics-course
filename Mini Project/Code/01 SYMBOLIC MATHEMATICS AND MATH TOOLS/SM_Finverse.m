%
% Symbolic Math - Inverse of a Function
%
clear all;  
help SM_Finverse      % Clear the memory and print header
%
% Initialize  
%
syms  a b n x y Y N yy
%
fprintf('Symbolic Math Inverse Function: enter f(x), + - * / ^ cos sin tan sqrt,x a b n \n ')
fprintf(' An Example \n')
fin = 1/tan(x)
%
finv = finverse(sym(fin));
yy = simple(finv);
pretty(yy)
%
iloop = 1;
figure(iloop)
%
xx = linspace(-5,5);
for i = 1:100
    x = xx(i);
    fx(i) = eval(fin);
    invfx(i) = eval(finv);
end
plot(xx,fx,'r-',xx,invfx,':b')
xlabel('x');
ylabel('f(x), f(x) inverse')
title(' 1/tan(x) and Inverse')
legend('f(x)','f(x) inverse')
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
        %
        clear('x', 'fx', 'invfx')
        syms  a b n x y Y N yy
        fin = input(' Enter f(x): ');
        %
        finv = finverse(sym(fin));
        yy = simple(finv);
        pretty(yy)
        %
        iloop = iloop + 1;
        %
        xx = linspace(-5,5);
        for i = 1:100
            x = xx(i);
            fx(i) = eval(fin);
            invfx(i) = eval(finv);
        end
        figure(iloop)
        plot(xx,fx,'r-',xx,invfx,':b')
        xlabel('x');
        ylabel('f(x), f(x) inverse')
        title(' f(x) and Inverse')
        legend('f(x)','f(x) inverse') 
    end
end
%