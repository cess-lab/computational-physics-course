%
% Program to look at bound states, ground state of Schroedinger Eq - force  laws
% 
clear all;  
help qm_forcelaw      % Clear the memory and print header
%
% Initialize  - power law in the potential
%
syms e a b r m n aa aaa ee
fprintf('energy e, potential V = a/r^b, mass m , radial quantum number n \n')
%
aa = (n^2/(m*a*b))^(1/(2-b));
%
fprintf('System Size as a Function of n, m, a and b \n')
pretty(aa)
e = n^((-2*b)/(2-b))*m^(b/(2-b))*a^(2/(2-b));
fprintf('Energy as a Function of n, mass, coupling , and Power Law \n')
pretty(e)
%
iloop = 0;
irun = 1;
%
while irun > 0
    kk = menu('Pick Another Power Law?','Yes','No');
    if kk == 2
        irun = -1;
        break
    end
    if kk == 1
        %
        bb = input('Enter Force Law Coefficient b: ');
        if bb == 1
        fprintf('Coulomb - Bohr Atom \n')
        end
        if bb ==  -2
        fprintf('Harmonic Oscillator \n') 
        end
        %
        fprintf('System Size \n') 
        aaa = (n^2/(m*a*bb))^(1/(2-bb));
        pretty(aaa)
        %
        c1= - (2.0 .*bb) ./(2.0 -bb);
        c2=          bb ./(2.0 -bb);
        c3=         2.0 ./(2.0 - bb);
        fprintf('System Energy \n')
        ee=(n^c1)*(m^c2)*(a^c3);
        %
        pretty(ee)
        %
    end
end
%

