%
% Solve static Laplace Eq. using Gauss Seidel, Cartesian, Boundary Voltages
%
clear all;  help EM_Laplace_Test      % Clear the memory and print header
%
%c solve Laplace Eq numerically - 2-D Cartesian Only
%
fprintf('Solve Finite Difference Eq: 4Vi,j = Vi,j+1 + Vi,j-1 + Vi+1,j + Vi-1,j \n')
%
ng = input('Input the Square Grid Number of Points, 0<x<1,0<y<1: ');
%
% grid is 1 x 1 in x x y
%
del = 1.0 ./(ng-1.0);
xx = (0:ng-1) .*del;
yy = (0:ng-1) .*del;
%
iloop = 0;
irun = 1;
%
while irun > 0
    kk = menu('Another Set of Boundary Voltages','Yes','No');
    if kk == 2
        irun = -1;
        break
    end
    if kk == 1
        %
        syms Vxl Vxr Vyt Vyb
        syms x y a b n 
        fprintf('Input the Voltage Function on the Left Boundary,f(y) \n')
        Vxl = input(': ','s');
        fprintf('Input the Voltage Function on the Right Boundary, f(y) \n')
        Vxr = input(': ','s');
        fprintf('Input the Voltage Function on the Top Boundary, f(x) \n')
        Vyt = input(': ','s');
        fprintf('Input the Voltage Function on the Bottom Boundary, f(x) \n')
        Vyb = input(': ','s');
        %
        % boundary conditions - evaluate symbolic on the grid
        %
        for i = 1:ng
            x = xx(i);
             V(i,1) = eval(Vyb);
             V(i,ng) = eval(Vyt);
            for j = 1:ng
                y = yy(j);
                V(1,j) = eval(Vxl);
                V(ng,j) = eval(Vxr);
            end
        end
        %
        % take mean voltage as starting point of the interior voltages
        %
        Vmean = (V(1,2) + V(ng,2) + V(2,1) + V(2,ng)) ./4.0;
        %
        for i = 2:ng-1
            for j = 2:ng-1
                V(i,j) = Vmean;
            end
        end
        %
        nstep = 10;
        %
        for k = 1:nstep
            for i = 2:ng-1
                for j = 2:ng-1 
                    del = (V(i+1,j) + V(i-1,j) + V(i,j+1) + V(i,j-1)) ./4.0;
                    V(i,j) = del;
                end
            end
        end
        %
        iloop = iloop + 1;
        figure(iloop)
        meshc(xx,yy,V');
        title('Voltage')
        xlabel('x');
        ylabel('y')
        %
        [Ex,Ey] = gradient(V');
        %
        iloop = iloop + 1;
        figure(iloop)
        meshc(xx,yy,Ex)
        title('Ex')
        xlabel('x');
        ylabel('y')
        %
        iloop = iloop + 1;
        figure(iloop)
        meshc(xx,yy,Ey)
        title('Ey')
        xlabel('x');
        ylabel('y')
        %
        iloop = iloop + 1;
        figure(iloop)
        quiver(xx,yy,Ex,Ey)
        title('Ex, Ey')
        xlabel('x')
        ylabel('y')
        %
    end
end
%