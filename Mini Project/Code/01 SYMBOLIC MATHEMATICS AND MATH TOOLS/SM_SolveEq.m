
% Symbolic Math - Solve an Equation
%
clear all;  
help SM_SolveEq      % Clear the memory and print header
%
% Initialize  
%
syms  a b c n x Y N yy
%
fprintf('Symbolic Math Solution of Equation: enter f(x), + - * / ^ cos sin tan sqrt,x a b c n \n ')
fprintf(' An Example, Solves f(x) = 0 \n')
fin = a*x^2 + b*x + c
%
fsol = solve(sym(fin));
yy = simple(fsol);
pretty(yy)
    %
irun = 1;
%
while irun > 0
    krun = menu('Another Equation?','Yes','No');
    if krun ==2
        irun = -1;
        break
    end
    %
    if krun == 1;
        fin = input(' Enter f(x): ');
        %
        fsol = solve(sym(fin));
        yy = simple(fsol);
        pretty(yy)
        %
    end
end
%