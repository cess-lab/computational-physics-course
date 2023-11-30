%
% Distribution Functions for Maxwell-Boltzmann, Fermi-Dirac and
% Bose-Einstein
%
clear all;  
help Boltz_BE_FD      % Clear the memory and print header
%
fprintf('Energy Distribution Functions for Boltzmann, Fermi-Dirac and Bose-Einstein \n')
%
% x = E/kt
%
x = logspace(-3,1);
bol = exp(-x);
be = (1.0 - 1.0 ./exp(1)) ./(exp(x) - 1.0);
fd = (1.0 + 1.0 ./exp(1)) ./(exp(x) + 1.0);
%
figure(1)
semilogy(x,bol,'-b',x, be,':r',x,fd,'g--')
axis([ 0 2 0.05 30])
ylabel('f(E), MB, FD, BE')
xlabel('E/kT')
title('Energy Weight Factors')
legend('Boltzmann','Bose-Einstein','Fermi-Dirac')
%
