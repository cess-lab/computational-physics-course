%
% Model with gas-gas collisions -> viscosity
%
clear all;  help Viscosity_Model      % Clear the memory and print header
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
        % size of molecule = aa = 0.05, total N possible in 1 x 1 area =
        % 400
        aa = 0.05;
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
        % now make a confining box, length = 1 in x and y
        %
        yt = 1;
        yb = 0;
        xl = 0;
        xr = 1;
        %
        % start the molecules off - random location
        for i = 1:nmol
            xo(i) = rand;
            yo(i) = rand;
        end
        %
        iloop = iloop + 1;
        figure(iloop)
        plot(xo,yo,'*')
        %
        acc = input('Input Acceleration due to External Field ~ 1: ');
        %
        % now let then move along
        % take time steps for, v ~ 1, dx~0.05 - for all temperatures and fields
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
        pcolL = 0;
        pcolR = 0;
        pcolT = 0;
        pcolB = 0;
        %
        for j = 2:ntime
            t(j) = t(j-1) + dt;
            for i = 1:nmol
                x(j,i) = x(j-1,i) + px(j-1,i) .*dt; % thermal motion first
                y(j,i) = y(j-1,i) + py(j-1,i) .*dt;
                px(j,i) = px(j-1,i);
                py(j,i) = py(j-1,i);
                icoll = 0;
                %
                % look for collisions with other molecules - hard sphere,
                % size aa
                %
                for k = 1:nmol
                    if (i ~= k) && ((x(j,i)-x(j-1,k)) .^2 + (y(j,i) - x(j-1,k)) .^2 < aa .*aa .*2)
                        icoll = 1 ;
                        %
                        % elastic collision with molecule - direction randomized 
                        %
                        phcoll = 2.0 .* pi .*rand;
                        px(j,i) = p(i) .*cos(phcoll); % elastic
                        py(j,i) = p(i) .*sin(phcoll);
                        px(j,k) = -p(k) .*cos(phcoll); % kinematics not done exactly
                        py(j,k) = -p(k) .*sin(phcoll);
                        break
                    end
                    if icoll > 0
                        break
                    end
                end
                %
                % impose external field if free path for this time step
                %
                if icoll == 0
                    x(j,i) = x(j,i) + (acc .*dt .*dt) ./2.0;
                    px(j,i) = px(j,i) + acc .*dt;
                end
                %
                % check for wall collisions, if yes reverse the momentum component
                %
                if x(j,i) < xl | x(j,i) > xr
                    px(j,i) = -px(j-1,i);
                    if x(j,i) < xl
                        x(j,i) = xl;
                        pcolL = pcolL + 2 .*abs(px(j-1,i));
                    end
                    if x(j,i) > xr
                        x(j,i) = xr;
                        pcolR = pcolR + 2 .*abs(px(j-1,i));
                    end
                    ncoll = ncoll + 1;
                    pcoll = pcoll + 2 .*abs(px(j-1,i));
                end
                if y(j,i) < yb | y(j,i) > yt
                    py(j,i) = -py(j-1,i);
                    if y(j,i) < yb   % reset postion at end of time step to a wall
                        y(j,i) = yb;
                         pcolB = pcolB + 2 .*abs(py(j-1,i));
                    end
                    if y(j,i) > yt
                        y(j,i) = yt;
                         pcolT = pcolT + 2 .*abs(py(j-1,i));
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
            axis([0 1.1 0 1.1])
            pause(0.2)
        end
    %
    fprintf('Number of Wall Collisions %g \n',ncoll);
    fprintf('Momentum Impulse to Walls %g \n',pcoll);
    fprintf('Momentum Impulse to Left and Right x Walls %g , %g \n',pcolL,pcolR);
    fprintf('Momentum Impulse to Top and Bottom y Walls %g , %g \n',pcolT,pcolB);
    %
    end
end
%