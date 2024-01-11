%
% Ideal Gas Laws and the Maxwell - Boltzmann distribution
%
clear all;  help Maxwell_Boltz      % Clear the memory and print header
%
% first setup the "gas' - points with a 2-d M-B energy distribution
%
iloop = 0;
irun = 1;
%
while irun > 0
    kk = menu('Another Gas?','Yes','No');
    if kk == 2
        irun = -1;
        break
    end
    if kk == 1
        %
        nmol = input('Input the Number of Gas Molecules : ');
        ntime = input('Input the Number of Time Steps : ');
        %
        % pick a "temperature" - mass of the gas points defined to be 1
        %
        kT = input('Input the Gas Temperature * k, Mass = 1: ');
        b = 1.0 ./kT;
        %
        for i = 1:nmol
            emin = 0;  % Monte Carlo - pick out of exponential - energy distribution on 2-d
            emax = 25;
            ee = log(exp(-b .*emin)-rand .*(exp(-b .*emin)-exp(-b .*emax)));
            e(i)=(-1.0 .*ee) ./b;         % energy
            p(i) = sqrt(2.0 .*e(i));     % momentum
            phi = 2.0 .*pi .*rand;
            pxo(i) = p(i) .*cos(phi);
            pyo(i) = p(i) .*sin(phi);
        end
        %
        iloop = iloop + 1;
        figure(iloop)
        hist(p,10);
        title('Gas Molecules, 2-d Velocity')
        xlabel('v')
        pm = mean(p);
        fprintf('Mean Velocity %g \n',pm);
        %
        % now make a confining box, length = 1 in x, user input in y
        %
        yt = input('Input the Box Height, Length = 1: ');
        yb = 0;
        xl = 0;
        xr = 1;
        %
        % start the molecules off - random location
        for i = 1:nmol
            xo(i) = rand;
            yo(i) = rand .*yt;
        end
        %
        iloop = iloop + 1;
        figure(iloop)
        plot(xo,yo,'*')
        %
        % now let then move along
        % take time steps for dx~0.05 - for all temperatures and volumes
        %
        dt = 0.05;
        t(1) = 0;
        x = zeros(ntime,nmol);
        y = zeros(ntime,nmol);
        px = zeros(ntime,nmol);
        py = zeros(ntime,nmol);
        for i = 1:nmol
            x(1,i) = xo(i);
            y(1,i) = yo(i);
            px(1,i) = pxo(i);
            py(1,i) = pyo(i);
        end
        %
        ncoll = 0;
        pcoll = 0;
        %
        for j = 2:ntime
            t(j) = t(j-1) + dt;
            for i = 1:nmol
                x(j,i) = x(j-1,i) + px(j-1,i) .*dt;
                y(j,i) = y(j-1,i) + py(j-1,i) .*dt;
                px(j,i) = px(j-1,i);
                py(j,i) = py(j-1,i);
                %
                % check for wall collisions, if yes reverse the momentum component
                %
                if x(j,i) < xl | x(j,i) > xr
                    px(j,i) = -px(j-1,i);
                    if x(j,i) < xl
                        x(j,i) = xl;
                    end
                    if x(j,i) > xr
                        x(j,i) = xr;
                    end
                    ncoll = ncoll + 1;
                    pcoll = pcoll + 2 .*abs(px(j-1,i));
                end
                if y(j,i) < yb | y(j,i) > yt
                    py(j,i) = -py(j-1,i);
                    if y(j,i) < yb   % reset postion at end of time step to a wall
                        y(j,i) = yb;
                    end
                    if y(j,i) > yt
                        y(j,i) = yt;
                    end
                    ncoll = ncoll + 1;
                    pcoll = pcoll + 2 .*abs(py(j-1,i));
                end
            end
            figure(iloop)
            plot(x(j,:),y(j,:),'*')
            title('Gas Molecules in the Box')
            xlabel('x')
            ylabel('y')
            axis([0 1.1 0 yt + 0.1])
            pause(0.2)
        end
    %
    fprintf('\n Number of Wall Collisions %g \n',ncoll);
    fprintf('\n Momentum Impulse to Walls %g \n',pcoll);
    %
    end
end
%