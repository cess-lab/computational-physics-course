% 
% Symbolic Matrix Inversion
% 
clear all;  
help Matrix_Inv      % Clear the memory and print header
%
% use symbolic math 
%
fprintf('Matrix Inversion, 2 x 2 and 3 x 3 \n')
%
syms b11 b12 b21 b22;
b = [b11, b12;b21, b22];
b
inv(b)
%
syms c11 c12 c13 c21 c22 c23 c31 c32 c33;
c = [c11 c12 c13; c21 c22 c23; c31 c32 c33]
inv(c)
%
fprintf('Use MATLAB inv to invert symbolic or numeric matrices \n')
%