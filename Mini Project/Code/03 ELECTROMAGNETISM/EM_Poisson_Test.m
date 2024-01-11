%
% Solve static Poisson Eq. using FFT for Periodic BC, Cartesian - MATLAB
%
clear all;  help EM_Poisson_Test      % Clear the memory and print header
%
% solve Poisson Eq numerically - 2-D Cartesian Only
%
fprintf('Solve Finite Difference Eq: 4Vi,j = Vi,j+1 + Vi,j-1 + Vi+1,j + Vi-1,j - rhoi,j*del*del \n')
%
ng = input('Input the Square Grid Number of Points, 0<x<1,0<y<1: ');
%
% grid is 1 x 1 in x x y
%
del = 1.0 ./(ng-1.0);
x = (0:ng-1) .*del;
y = (0:ng-1) .*del;
%
iloop = 0;
irun = 1;
%
while irun > 0
    kk = menu('Another Set of Charged Objects','Yes','No');
    if kk == 2
        irun = -1;
        break
    end
    if kk == 1
        %
        rho = zeros(ng,ng);
        nchpts = 0;   % number of grid points with a fixed charge source
        %
        npt = input('Input Number of Point Charges: ');
        %
        if npt > 0
            for i =1:npt
                fprintf('\n For Charge %g \n',i);
                pt = input('Enter [x,y] Position: ');
                ipt = round(pt(1) ./del);   % nearest grid point
                jpt = round(pt(2) ./del);
                Vpt(i) = input('Input Voltage on Point Charge ');
                rho(ipt,jpt) = Vpt(i) ./(del .^2);    % "area" of point charge
                nchpts = nchpts + 1;
                xpt(nchpts) = x(ipt);
                ypt(nchpts) = y(jpt);
            end
        end
        %
        nrec = input('Input Number of Charged Rectangles: ');
        %
        if nrec > 0
            for i =1:nrec
                fprintf('\n For Rectangle %g \n',i);
                pttr = input('Enter Top Right [x,y] Position: ');
                ptbl = input('Enter Bottom Left [x,y] Position: ');
                Area = abs((pttr(1) - ptbl(1)) .* (pttr(2) - ptbl(2)));
                Vrec(i) = input('Input Voltage on Rectangular Charge: ');
                for j = 2:ng-1
                    for k = 2:ng-1 % no rectangle on the boundary
                        if(x(j)-ptbl(1) > 0) && (x(j) - pttr(1) < 0) && (y(k)-ptbl(2) > 0) && (y(k) - pttr(2)< 0)
                            rho(j,k) = rho(j,k) + Vrec(i) ./Area; % charge density for this voltage and area
                            nchpts = nchpts + 1;
                            xrec(nchpts-npt) = x(j);
                            yrec(nchpts-npt) = y(k);
                        end
                    end
                end
            end
        end 
        %
        % now use FFT or sin expansion to solve for periodic BC or grounded square
        % this assumes boundary is far from the interior charges
        %
        fprintf(' FT of Diff eq for Vij is rhoij*del*del/[2(cos(2*pi*i/N) + cos(2*pi*j/N)-2)] \n')
        %
        % take FFT of the sources in rho
        %
        rhoFFT = fft2(rho);
        cfft = cos((2.0 .*pi ./ng)*(0:ng-1));
        % find FFT of the potential
        for i = 1:ng
            for j = 1:ng
                VFT(i,j) = (rhoFFT(i,j) .*del .*del) ./(2.0 .*(cfft(i) + cfft(j) -2.0 + 0.00001) );
            end
        end
        %
        % now inverse FFT for voltage in space
        V = ifft2(VFT);
        % 
        iloop = iloop + 1;
        figure(iloop)
        meshc(x,y,real(V'));
        title('Voltage')
        xlabel('x');
        ylabel('y')
        hold on
        if npt > 0
            plot(xpt,ypt,'bo')
        end
        if nrec > 0
            plot(xrec,yrec,'rs')
        end
        hold off
        %
        [Ex,Ey] = gradient(real(V'));
        %
        iloop = iloop + 1;
        figure(iloop)
        meshc(x,y,Ex)
        title('Ex')
        xlabel('x');
        ylabel('y')
        %
        iloop = iloop + 1;
        figure(iloop)
        meshc(x,y,Ey)
        title('Ey')
        xlabel('x');
        ylabel('y')
        %
        iloop = iloop + 1;
        figure(iloop)
        quiver(x,y,Ex,Ey)
        title('Ex, Ey')
        xlabel('x')
        ylabel('y')
        hold on
        if npt > 0
            plot(xpt,ypt,'bo')
        end
        if nrec > 0
             plot(xrec,yrec,'rs')
        end
        hold off
        %
    end
end
%