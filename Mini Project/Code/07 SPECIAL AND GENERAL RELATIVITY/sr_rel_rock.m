%
% rocket - Compute motion of a  relativistic rocket, constant acceleration
% = g
%
clear all;      % Clear memory
help sr_rel_rock;    % Print header
%
% Initialize variables (e.g., mass, burn rate, exhaust velocity)
%
g = 9.81;   % Gravitational acceleration (m/s^2)
c = 3.0 .*10 .^8 ; % c in m/sec
yr = 60.0 .*60.0 .*24.0 .*365.0;   % yr in sec
%
fprintf('Proper Acceleration is g \n');
%
iloop = 0;
irun = 1;
%
while irun > 0
    kk = menu('Pick Another Rocket Trip?','Yes','No');
    if kk == 2
        irun = -1;
        break
    end
    if kk == 1
        %
        % express velocity, gamma, time and position of observer at rest in terms of ship time
        %
        tsmax = input('Enter Maximum Ship Time in Years : ');
        %
        ts = linspace(0.0,tsmax);
        imax = length(ts);
        tss = (ts .*g .*yr) ./c ; 
        alf = (g .*yr) ./c    ;  % time in yr, with g ==> alf ~ 1
        bet = tanh(tss);
        gam = cosh(tss);
        tt = sinh(tss) ./alf;
        zz = (cosh(tss)-1.0) ./alf; % distance in lyr
        fprintf('Final Speed w.r.t. c = %g \n',bet(imax));
        fprintf('Final gamma factor = %g \n',gam(imax));
        fprintf('Total Time Elapsed at Home (yr) = %g \n',tt(imax));
        fprintf('Total Distance Travelled in LY (Home) = %g \n',zz(imax));
        %
        % get classical results too
        %
        betc = tss;
        gamc = 1.0 ./sqrt(1.0 - betc .^2);
        ttc = ts;
        zzc = (ttc .*ttc) ./2.0;
        %
        % rockets using light at exhaust velocity
        %
        payc = exp(betc(imax));
        payr = exp(acosh(gam(imax)));
        fprintf('Payload Ratio for Relativistic Rocket = %g - Light Exhaust \n',payr);
        %
        iloop = iloop + 1;
        figure(iloop)
     
        plot(ts,bet,'-b',ts,betc,'r:')
        xlabel('Trip Time (yr)')
        ylabel('Speed w.r.t. c')
        legend('Relativistic','Classical')
        %
        iloop = iloop + 1;
        figure(iloop)
        semilogy(ts,gam)
        xlabel('Trip Time (yr)')
        ylabel('Relativistic \gamma factor')
        %
        iloop = iloop + 1;
        figure(iloop)
        semilogy(ts,tt,'-b',ts,ttc,'r:')
        xlabel('Trip Time (yr)')
        ylabel('Time at Home (yr)')
        legend('Relativistic','Classical')
        %
        iloop = iloop + 1;
        figure(iloop)
        semilogy(ts,zz,'-b',ts,zzc,'r:')
        xlabel('Trip Time (yr)')
        ylabel('Distance Travelled  (lyr)')
        legend('Relativistic','Classical')
        %
    end
end
%