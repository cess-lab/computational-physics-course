
% Symbolic Math - Series Summation
%
clear all; 
help SM_Sum_Series      % Clear the memory and print header
%
% Initialize  
%
syms  a b n x Y N k yy
%
fprintf('Symbolic Math Series Summation: enter f(x), + - * / ^ cos sin tan sqrt,x a b n \n ')
fprintf(' An Example, x^k k=0 to inf \n')
fin = x^k;
nstart = 0;
nstop = inf;
fsum = symsum(sym(fin),k,nstart,nstop); 
yy = simple(fsum);
pretty(yy)
fprintf(' Other Examples; k , k^2 and k ^3 from 1 to n, also 1/k^2 from 1 to inf \n')
%
irun = 1;
%
while irun > 0
    krun = menu('Another Series?','Yes','No');
    if krun == 2
        irun = -1;
        break
    end
    if krun == 1;
        fin = input(' Enter Term of the Series f(k): ');
        indef = input('Indefinite = 1 or Definite = 0: ');
        if indef == 1
            fsum = symsum(sym(fin),k);
        else
        nstart = input(' Enter Starting Index: ');
        nstop = input(' Enter Ending Index: ');
        fsum = symsum(sym(fin),k,nstart,nstop);
        end
        yy = simple(fsum);
        pretty(yy)
    %
    end
end
%