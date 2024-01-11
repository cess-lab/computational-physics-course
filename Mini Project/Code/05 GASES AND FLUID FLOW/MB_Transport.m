%
% Transport and viscosity and the Maxwell - Boltzmann distribution
%
clear all;  help MB_Transport      % Clear the memory and print header
%
% first setup some data for molecular gases
%
A = [1 4 14 16];   % atomic
A = [2 4 28 32];   % molecular
rhog = [0.084 0.166 1.165 1.332];  % gas density in gm/1000 cm^3
rhol = [0.071 0.125 0.807 1.141];  % liquid density in gm/cm^3
ra = [4.6 1.2 0.7 0.56] ;         % atomic/molecular radius in A
%
iloop = 0;
irun = 1;
%
while irun > 0
    kk = menu('Another Element?','Yes','No');
    if kk == 2
        irun = -1;
        break
    end
    if kk == 1
        %
        iA  = menu('Element','H','He','N','O');
        iGas  = menu('State','gas','liquid');
        AA = A(iA);
        rAA = ra(iA);
        if iGas == 1
            rho = rhog(iA);
            rho = rho ./1000;
        else
            rho = rhol(iA);
        end
        %
        % effective cross section is pi*diameter^2
        sig = pi .*4 .* (rAA .* 10 .^-16);     % rAA is in A, go to cm
        %
        % find mean thermal velocity
        %
        mp = 938.0 .*10 .^6;    % p mass in eV
        c = 3.0 .*10 .^10;    % c in cm/sec
        No = 6.02 .*10 .^23;   % Avagadros # - gm and cm
        ktm = (1.0 ./(40.0 .*mp .*AA)); 
        v = sqrt((8.0 .*ktm) ./pi);
        v = v .*c;            % mean thermal velocity in cm/sec
        n = (No .*rho)./AA;   % number of atoms/cm^3
        %
        fprintf('Cross section for gas scattering = pi*(2*r)^2 = %g (cm^2) \n',sig);
        fprintf('Mean thermal velocity at 300 oK = sqrt(8*kt/pi*mp*A) = %g (cm/sec) \n',v);
        fprintf('Number of molecules/cm^3 = No*rho/A = %g  \n',n);
        %
        nc = (n .*n .*sig .*v) ./sqrt(2); % collisions/cm^3*sec - total
        Nc = nc ./n;   % collisions of a signle molecule - collisions/sec
        tau = 1.0 ./Nc;  % mean time between collisions
        lmean = tau .*v;   % mean free path between collisions
        %
        fprintf('Number of collisions/sec = Nc = n*sig*v/sqrt(2) = %g  \n',Nc);
        fprintf('Mean time between collisions = tau =  1/Nc = %g (sec)  \n',tau);
        fprintf('Mean free path (cm) between collisions) = v*tau = %g  \n',lmean);
        %
        eta = (rho .*lmean .*v) ./3.0 ;     % viscosity
        fprintf('Viscosity = (rho*lmean *v)/3 =  (gm/(cm*sec)) = %g  \n',eta);
        %
        T = linspace(100,900);   % look at temp dependence
        for i = 1: length(T)
            ktm = (1.0 ./(40.0 .*mp .*AA)) .*(T(i) ./300); 
    	    v = sqrt((8.0 .*ktm) ./pi);
            vv(i) = v .*c;            % mean thermal velocity in cm/sec
            n = (No .*rho)./AA;   % number of atoms/cm^3
            ncc(i) = (n .*n .*sig .*vv(i)) ./sqrt(2); % collisions/cm^3*sec - total
            Ncc(i) = ncc(i) ./n;   % collisions of a signle molecule - collisions/sec
            tau = 1.0 ./Ncc(i);  % mean time between collisions
            llmean(i) = tau .*vv(i);   % mean free path between collisions
            %
            etaa(i) = (rho .*llmean(i) .*vv(i)) ./3.0 ;     % viscosity
        end
        %
        iloop = iloop + 1;
        figure(iloop)
        plot(T,vv,'b')
        title('Mean Thermal Velocity vs. T')
        xlabel('T(oK)')
        ylabel('v(cm/sec)')
        %
        iloop = iloop + 1;
        figure(iloop)
        plot(T,1.0 ./Ncc,'b')
        title('Mean Time Between Collisions vs. T')
        xlabel('T(oK)')
        ylabel('time(sec)')
        %
        iloop = iloop + 1;
        figure(iloop)
        plot(T,etaa,'b')
        title('Viscosity vs. T')
        xlabel('T(oK)')
        ylabel('\eta, Viscosity (gm/cm*sec)')   
    %
    end
end
%