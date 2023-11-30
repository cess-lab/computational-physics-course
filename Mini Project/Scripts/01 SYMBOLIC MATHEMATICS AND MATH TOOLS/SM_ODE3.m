% Program to symbolically solve ODE
% 
clear all;  
help SM_ODE3      % Clear the memory and print header
%
syms  a b c d n x y Y N k m g v re vo yy fsol t
%
irun = 1;
%
while irun > 0
    %
    krun = menu('Input Another Diff Eq?','Yes','No');
    if krun == 2
        irun = -1;
        break
    end
    if krun == 1;
    %
    % Initialize  - get Differential Eq to solve
    %
    fprintf('Enter Single Differential Eq to Solve y(t); e.g., D2y+a*y=0 \n');
    y_ode = input(': ','s');   % Read input as a text string
    %
    kk = menu('Initial/Boundary Condition','Yes','No');
    %
    if kk == 1
        fprintf('Enter Condition on Function; e.g. y(a) = b, \n'); 
        cond1 =input(': ','s');
    end
    %
    ll = menu('Initial/Boundary Conditions on Dy','Yes','No');
    if ll == 1
        fprintf('Enter Condition on DFunction; e.g. Dy(a) = b, \n'); 
        cond2 =input(': ','s');
    end
    %
    % symbolic solution
    %
    if kk ~= 1 & ll ~= 1
        y = dsolve(y_ode);
    end
    if kk == 1 & ll ~= 1
        y = dsolve(y_ode,cond1);
    end
    if kk == 1 & ll == 1
        y = dsolve(y_ode,cond1,cond2)
    end
    fprintf('Symbolic Solution, y(t) and v(t) \n')
    y
    v = diff(y)
    %
    end
end
%
