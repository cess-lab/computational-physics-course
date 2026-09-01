%
% Program to symbolically solve ODE for linear molecule - 3 masses, 2 springs
% k/m = 1, (m/M) ratio = b, outer atoms have mass m, central atom has M 
% 
clear all;  
help cm_triatomic      % Clear the memory and print header
%
syms x1 x2 x3 b t w Aw y bb x xy 
%
% now exactly solve the eqs of motion, with arbitrary initial positions, 0 initial velocities
%
% Initialize  - get Differential Eq to solve, x are w.r.t. equilibrium
% positions
%
[x1, x2, x3] = dsolve('D2x1 = (x2-x1),D2x2 = b*(-2*x2+x1+x3),D2x3=(x2-x3)', .....
               'x1(0)=x(1),x2(0)=x(2),x3(0)=x(3)',....
               'Dx1(0)=0,Dx2(0)=0,Dx3(0)=0');       
%
 fprintf('Symbolic Solution Initial Velocities = 0, Initial Positions x(i) \n')
%
 x1=simple(x1);
 %pretty(x1)
 x2=simple(x2);
 %pretty(x2)
 x3 = simple(x3);
 %pretty(x3)
 %
 % use MATLAB tools to find eigenvalues , y = w^2
 %
 fprintf(' Aw is the Oscillation Matrix for the 3 Atoms, y = w^2 \n')
 Aw = [1-y, -1, 0; -1, 2-y/bb, -1;0, -1, 1-y]
 xy = det(Aw);
 %
 % use eigen tools on MATLAB
 %
 fprintf('Eigenfrequencies = 0, 1, and sqrt(1+2b) \n')
 fprintf(' The Determinant of Aw has Roots y = w^2 of the Eigenfrequencies in sqrt(k/m) Units \n')
 factor(xy)
 %
 iloop = 0;
 irun = 1;
 while irun > 0
     %
     krun = menu('Another Molecule?','Yes','No');
     if krun == 2
         irun = -1;
         break
     end
     %
     if krun == 1;
         iloop = iloop + 1
         x = input('Enter initial displacements [x(1) x(2) x(3)]: ')
         fprintf('Initial Velocities are Zero \n')
         mm = input('Enter Ratio of Small Outer Masses,m, to Inner Mass,M: ');
         b = mm;
         %
         tt = linspace(0,10);
         %
         for i=1:100
            t = tt(i);
            X1(i) = eval(x1);
            X2(i) = eval(x2);
            X3(i) = eval(x3);
         end
         %
         figure(iloop)
         plot(tt,real(X1),tt,real(X2),':',tt,real(X3),'-.')
         title('Motion of the Three Masses, time in 1/\omega Units of Outer Masses')
         xlabel('time')
         ylabel('displacement')
         legend('x1','x2','x3')
         %
         iloop = iloop + 1;
         figure(iloop)
         for i=1:100
               plot(real(X1(i))-10,0.,'o',real(X2(i)),0.,'*',real(X3(i))+10,0.,'o')
               axis([-15 15 -1 1])
               title(' Movie of Motion of the Three Masses')
               xlabel('displacement')
               hold on
               xcou(1) = real(X1(i))-10; ycou(1) = 0;
               xcou(2) = real(X2(i)); ycou(2) = 0;
               xcoup(2) = real(X3(i))+10; ycoup(2) = 0;
               xcoup(1) = real(X2(i)); ycoup(2) = 0;
               plot(xcou,ycou,'--',xcoup,ycoup,'--')
               hold off
               pause(0.1)
         end
     end
 end
%