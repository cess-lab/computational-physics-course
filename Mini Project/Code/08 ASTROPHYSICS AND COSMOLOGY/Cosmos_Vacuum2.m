%
% now look at flat space with a mixture of matter and vacuum energy
% supernova + CMB wiggles indicate omegav ~ 0.71, omegam ~ 0.04, dm = 0.25
%
clear all; 
help Cosmos_Vacuum2; % clear and print header
%
iloop = 0;
irun  = 1;
while irun > 0
    %
    krun = menu('Another Value of Vacuum Omega?','Yes','No');
    if krun == 2
        irun = -1;
        break
    end
    %
    if krun == 1 
        Ho = input('Enter present Ho in km/sec*million lyr (~30): ');
        h = input(' Enter estimate for h (~0.73): ');
        omegv = input(' Enter Value for Vacuum Omega = (0,1): ');
        %
        % Ho in km/sec*million ly, Hubble length and time and critical density
        % Ho = 30 .*h , LH = c/H, tH = 1/H, 
        %
        Ho = Ho .*h; % present Hubble constant
        tHo = 300 ./Ho ; % in byr - Hubble time
        fprintf(' Hubble Time, in byr = %g \n',tHo)
        %
        % specify the fraction of critical density in the vacuum
        % present time t, not n/H due to vacuum energy
        %
        fact = 2.0 ./(3.0 .*sqrt(omegv));
        fact2 = omegv ./(1.0 - omegv);
        R_Ro = logspace(-3,3,100);       % pick R/Ro and solve for t
        t = tHo .*fact .*log(sqrt(1.0 + (R_Ro) .^3 .*fact2) + sqrt((R_Ro) .^3 .*fact2));
        H_Ho = ((R_Ro) .^-3 .*(1.0 - omegv) + omegv) .^0.5;
        %
        % compare to no vacuum energy
        %
        omegvp = 10 .^-10;
        factp = 2.0 ./(3.0 .*sqrt(omegvp));
        fact2p = omegvp ./(1.0 - omegvp);
        tp = tHo .*factp .*log(sqrt(1.0 + (R_Ro) .^3 .*fact2p) + sqrt((R_Ro) .^3 .*fact2p));
        H_Hop = ((R_Ro) .^-3 .*(1.0 - omegvp) + omegvp) .^0.5;
        %
        iloop = iloop + 1;
        figure(iloop)
        loglog(t,R_Ro,'b-')
        title('R/Ro - Time, in byr')
        xlabel('t(byr)')
        ylabel('R/Ro')
        %
        hold on
        loglog(tp,R_Ro,'r:')
        legend('DE','no DE')
        loglog(tHo,1,'g*')
        %
        iloop = iloop + 1;
        figure(iloop)
        loglog(R_Ro,H_Ho,'b-')
        title('H/Ho - Evolution')
        xlabel('R/Ro')
        ylabel('H/Ho')
        %
        hold on
        loglog(R_Ro,H_Hop,'r:')
        legend('DE','no DE')
        loglog(1,1,'g*')
    end
end
%