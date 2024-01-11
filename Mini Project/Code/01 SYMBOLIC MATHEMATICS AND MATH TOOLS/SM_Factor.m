%
% Symbolic Math - Factor a Polynomial
%
clear all;  
help SM_Factor      % Clear the memory and print header
%
% Initialize  
%
syms x y a b
%
fprintf('Symbolic Math Polynomial Factorization: enter f(x), + - * / ^ x, y \n ')
fprintf(' An Example \n')
fin = x^2 - y^2
fact = factor(fin) 
%
irun = 1;
%
while irun > 0
    krun = menu('Another Polynomial?','Yes','No');
    if krun == 2
        irun = -1;
        break
    end
    %
    if krun == 1;
        fin = input(' Enter Polynomial to Factor: ');
        fact = factor(fin) 
        %
    end
end
%