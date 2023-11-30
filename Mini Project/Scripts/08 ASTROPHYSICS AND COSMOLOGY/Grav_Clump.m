% 
% Program to look at clumping of a system under gravity, zero temperature
% 
clear all;  
help Grav_Clump      % Clear the memory and print header
%
iloop = 0;
irun = 1;
%
while irun > 0
    kk = menu('Another Set of N Particles?','Yes','No');
    if kk == 2
        irun = -1;
        break
    end
    if kk == 1
    %
    clear 'xx' 'yy' 'iclump' 'x' 'y' 'vx' 'vy' 'vxx' 'vyy'
    %
    % put N particles randomly in a 2-d box and let them
    % evolve under mutual gravitational attraction
    %
    fprintf('N Particles in 2-d Evolving Under Mutual Gravitational Attraction \n')
    %
    N = input('Enter a Number of Particles to Track: ');
    %
    % initial conditions, random locations, start with all at rest
    %
        for i = 1:N
            x(i) = rand;
            y(i) = rand;
            vx(i) = 0;
            vy(i) = 0;
            xx(i,1) = x(i);  % initial locations for a movie
            yy(i,1) = y(i);
            vxx(i,1) = 0;
            vyy(i,1) = 0;
            iclump(i) = 0;   % key for a pair of clumped particles
        end
        %
        % initial clumping
        %
        dRij = 0;
        for i = 1:N
            for j = 1:N
                dRij = dRij + (xx(i,1)-xx(j,1)) .^2 + (yy(i,1)-yy(j,1)) .^2;
            end
        end
        dRij = sqrt(dRij) ./(N .^2);
        fprintf('Initial Mean Seperation %g  \n',dRij);
        %
        dt = 0.02;    % time steps
        if N == 3
            dt = 0.012;
        end
        if N > 3
            dt = 0.004;
        end
        kmax = 100;   % max number of time steps
        %
        for k = 2:kmax   % time steps
            l = k-1;
            for i = 1:N  % loop over all particles
            %
            % find force on i from all other particles j
            %
                fx(i) = 0;
                fy(i) = 0;
                for j = 1:N
                    if i ~= j && iclump(j) == 0 ;  % make clumped inert
                        r = sqrt((xx(i,l) - xx(j,l)) .^2 + (yy(i,l) - yy(j,l)) .^2)+ 0.01;
                        fx(i) = fx(i) + (xx(j,l) - xx(i,l)) ./(r .^3);
                        fy(i) = fy(i) + (yy(j,l) - yy(i,l)) ./(r .^3);
                        %
                        % clumping, trap on small r or large force
                        %
                        if r < 0.01 | abs(fx(i)) > 200 | abs(fy(i)) > 200
                            iclump(i) = 1;   % this i*j pair is now inert
                            iclump(j) = 1;
                            vxx(j,k) = 0;
                            vyy(j,k) = 0;
                            xx(j,k) = xx(i,l)+ 0.01;
                            yy(j,k) = yy(i,l)+ 0.01;
                        end
                    end
                end
                %
                vxx(i,k) = vxx(i,l) + fx(i) .*dt;
                vyy(i,k) = vyy(i,l) + fy(i) .*dt;
                xx(i,k) = xx(i,l) + vxx(i,l) .*dt;
                yy(i,k) = yy(i,l) + vyy(i,l) .*dt;
                if iclump(i) > 0
                    vxx(i,k) = 0;
                    vyy(i,k) = 0;
                    xx(i,k) = xx(i,l);
                    yy(i,k) = yy(i,l);
                end
                %
                % keep the particles in the box
                %
                if xx(i,k) < 0 | xx(i,k) > 1
                    vxx(i,k) = -vxx(i,k);
                end
                if yy(i,k) < 0 | yy(i,k) > 1
                    vyy(i,k) = -vyy(i,k);
                end
                %
            end
        end
        %
        % final clumping
        %
        dRij = 0;
        for i = 1:N
            for j = 1:N
                dRij = dRij + (xx(i,kmax)-xx(j,kmax)) .^2 + (yy(i,kmax)-yy(j,kmax)) .^2;
            end
        end
        dRij = sqrt(dRij) ./(N .^2);
        fprintf('Final Mean Seperation %g  \n',dRij);
        %
        fprintf(' Movie of Evolution of the System \n');
        %
        iloop = iloop + 1 ;
        figure(iloop)
        for k = 1:kmax
            plot(xx(:,k),yy(:,k),'o')
            xlabel('x')
            ylabel('y')
            title('Particles Evolving in a 2-d Gravity Field')
            axis([0 1 0 1])
            pause(0.1)
        end
        %
    end
end
%