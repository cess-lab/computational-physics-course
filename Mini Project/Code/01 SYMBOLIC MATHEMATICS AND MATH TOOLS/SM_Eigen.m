%
% Symbolic Math - Square Matrices: Determinants, Inverses Eigenvalues, Eigenvectors
%
clear all;  
help SM_Eigen      % Clear the memory and print header
%
% Initialize  
%
syms  m k w x A Ainv Adet Aeig Veig y 
%
fprintf('Symbolic Matrices: Eignevalues and Eigenvectors  \n ')
fprintf(' An Example - Rotation by x')
A = [cos(x),-sin(x) ; sin(x), cos(x)]
fprintf('Determinint of A \n ')
Adet = det(A);
y = simple(Adet);
pretty(y)
%
% next the inverse;
%
fprintf('Inverse of A \n ')
Ainv = inv(A);
y = simple(Ainv);
pretty(y)
%
% then the eigenvalues and eigevectors ;
%
fprintf('Eigenvalues of A, Diagonals \n ')
 [Veig,Aeig]  = eig(A);
 y = simple(Aeig);
 pretty(y)
 fprintf('Eigenvectors of A, Columns \n ')
 y = simple(Veig);
 pretty(y)
 %
irun = 1;
%
while irun > 0
    krun = menu('Another matrix?','Yes','No');
    if krun == 2
        irun = -1;
        break
    end
    %
    if krun == 1
         A = input(' Enter A, [A11, A12; A21, A22]: ');
        %
        % first the determinint;
        %
        fprintf('Determinint of A \n ')
        Adet = det(A);
        y = simple(Adet);
        pretty(y)
        %
        % next the inverse;
        %
        fprintf('Inverse of A \n ')
        Ainv = inv(A);
        y = simple(Ainv);
        pretty(y)
        %
        % then the eigenvalues and eigenvectors;
        %
        fprintf('Eigenvalues of A \n ')
        [Aeig, Veig] = eig(A);
        y = simple(Aeig);
        pretty(y)
        fprintf('Eigenvectors of A \n ')
        y = simple(Veig);
        pretty(y)
        %
    end
end
%