%
% Laplace_z - Laplace Electrostatics - BV, Laplace Eq. Potential, E Field
% Use Complex Variables
%
clear all; 
help Laplace_z;  % Clear memory and print header
%
fprintf('Complex Potential  - Modulus of psi is the Potential V, grad(V) = Electric Field \n')
%
iloop = 0;
irun = 1;
%
while irun > 0
    kk = menu('Pick Another Example','Yes','No');
    if kk == 2
        irun = -1;
        break
    end
    if kk == 1
        %
        % Initialize parameters, x,y grid, and potential psi
        %
        x = linspace(-2, 2, 20);
        y = linspace(-2, 2, 20);
        %
        psi = zeros(20,20);
        %
        for ii=1:20
            for jj = 1:20
                z(ii,jj) = x(ii) + i .*y(jj); 
            end
        end
        %
        iex = input('Enter a Number for an Electrostatic Example- 1 to 5: ');
        %
        if (iex == 1)
            fprintf('Point Charge at the Origin - 2D\n');
            psi = log(abs(z)); % point source at origin, 2-d
        end
        %
        if(iex == 2)
            fprintf('Two Charges - Image Charge for Conducting Plane\n');
            psi = -log(abs(z-0.5)) + log(abs(z+0.5)); % image charge = point charge + plane = 2 point charges
            %
            for ii = 1:20
                for jj = 1:20
                    if real(z(ii,jj)) > 0;
                        psi(ii,jj) = 0; % 1/2 plane re(z) > 0
                    end
                end
            end
        end
        if(iex == 3)
            fprintf('Two Half Circles - Interior Solution\n');
            psi = 4.0 .*real(atan((z))) ./(pi);    % 2 1/2 circles - interior solution  - interior
            %
            for ii = 1:20
                for jj = 1:20
                    if abs(z(ii,jj)) > 1;
                        psi(ii,jj) = 0; % interior solution
                    end
                end
            end
        end
        if(iex == 4)
            fprintf('Two Coaxial Cylinders at V = 0,1 - Interior Solution\n');
            psi = (log(abs(z)) - log(0.5)) ./(log(1.5) - log(0.5));    % 2 coaxial cylinders  - interior
            for ii = 1:20
                for jj = 1:20
                    if abs(z(ii,jj)) > 1.5 | abs(z(ii,jj)) < 0.5;
                        psi(ii,jj) = 0; % interior solution
                    end
                end
            end
        end
        %
        if(iex == 5)
            fprintf('Two Line Charges at V = 0,1 - 1/2 Plane\n');
            psi = atan(imag(z) ./real(z)) ./pi; % 2 line charges at y =0 at V = 0 (x<0) =1 (x>0, Upper 1/2 plane
            for ii = 1:20
                for jj = 1:20
                    if x(ii) < 0;
                        psi(ii,jj) = 0; % interior solution
                    end
                end
            end
        end
        %
        iloop = iloop + 1;
        figure(iloop)
        contour(x,y,psi,20);
        title('Equipotentials')
        xlabel('x')
        ylabel('y')
        %
        iloop = iloop + 1;
        figure(iloop)
        [vx,vy]=gradient(psi,x(2)-x(1),y(2)-y(1));
        meshc(x,y,vx)
        title('x E Field')
        xlabel('x')
        ylabel('y')
        %
        iloop = iloop + 1;
        figure(iloop)
        meshc(x,y,vy)
        title('y E Field')
        xlabel('x')
        ylabel('y')
        %
        iloop = iloop + 1;
        figure(iloop)
        quiver(x,y,vx,vy)
        title('Electric Field')
        xlabel('x')
        ylabel('y')
        %
    end
end
%