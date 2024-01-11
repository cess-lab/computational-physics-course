%
% Cosmos - find flat space quantities in matter and radiation dominated eras
%
clear all; 
help Cosmos_Power_Law2; % clear and print header, source "Cosmology' - Edward Harrison
%
iloop = 0;
irun  = 1;
while irun > 0
    %
    krun = menu('Another Hubble Constant?','Yes','No');
    if krun == 2
        irun = -1;
        break
    end
    %
    if krun == 1
        %
        % get present value of H and h
        %
        Ho = input('Enter present Ho in km/sec*million lyr (~30): ');
        h = input(' Enter estimate for h (~0.73): ');
        %
        % we assume omega = 1 (flat space)
        % To = CBR temp at present
        % Ho = 30 .*h , LH = c/H, tH = 1/H, t = n/H, vH = c(1+q), q = (1-n)/n, present time ct
        %
        n = 2.0 ./3.0 ; % matter dominated, flat GR, R dependence on t
        H = Ho .*h; % present Hubble constant
        To = 2.73; % CBR temp in deg K
        tH = 300 ./H ; % Hubble Time in byr
        q = (1.0 - n) ./n; % Deceleration parameter
        to = tH ./(1.0 + q); % Age in byr
        %
        fprintf('Hubble Time in byr = %g\n',tH);
        fprintf('Present time in byr = %g\n',to);
        %
        rhoc = 2.0 .*(10) .^-29 .*h .*h ; %  present crit density in gm/cm^3
        rhor = 4.6 .*(10) .^-34 ; % present CBR density in gm/cm^3
        %
        % project back to equal densities - boundary of radiation/matter
        % dominated, matter goes as /t^2, radiation as 1/t^8/3
        %
        teq = to .*(rhor ./rhoc) .^1.5; % power law scaling to equal density of m and rad
        rhoeq = rhoc .* (to ./teq) .^2;       % matter density at equality
        Teq = To .*(to ./teq) .^0.6666;   % temp of CBR at equal density
        %
        fprintf('Density at Equal Radiation and Matter in gm/cm^3 = %g\n',rhoeq);
        fprintf('Temperature at Equal Density - degree K = %g\n',Teq);
        %
        % c = 3 x 10^5 km/sec, 1 yr = 3.16 x 10^7 sec,
        % 1ly = 9.46 x 10^12 km
        % convert to sec, sec-1
        %
        tos = tH .*(3.16 .* 10 .^16);  % convert to in bly to sec
        teqs = teq .*tos;
        %
        fprintf('Time at Equal Density - sec = %g\n',teqs);
        %
        % extrapolate back in rad dominated era, matter n = 3/2, rad n = 2
        %
        tearly = 0.1; % in sec
        rhome = rhoeq .*(teqs ./tearly) .^1.5;
        rhore = rhoeq .*(teqs ./tearly) .^2;
        Tearly = Teq .*(teqs ./tearly) .^ 0.5;
        %
        fprintf('Time (in radiation dominated) at sec = %g\n',tearly);
        fprintf('Matter Density at That Time = %g\n',rhome);
        fprintf('Radiation Density at That Time = %g\n',rhore);
        fprintf('Radiation Temperature at That Time = %g\n',Tearly);
        %
        % now plots of interesting quantities
        %
        xom(1) = tos; xom(2) = teqs; yom(1) = rhoc; yom(2) = rhoeq;
        xor(1) = tos; xor(2) = teqs; yor(1) = rhor; yor(2) = rhoeq;
        xoT(1) = tos; xoT(2) = teqs; yoT(1) = To; yoT(2) = Teq;
        xer(1) = teqs; xer(2) = tearly; yer(1) = rhoeq; yer(2) = rhore;
        xem(1) = teqs; xem(2) = tearly; yem(1) = rhoeq; yem(2) = rhome;
        xeT(1) = teqs; xeT(2) = tearly; yeT(1) = Teq; yeT(2) = Tearly;
        xrh1(1) = tos; xrh1(2) = tearly; yrh1(1) = 1; yrh1(2) = 1;
        xrh2(1) = tos; xrh2(2) = tearly; yrh2(1) = 150.0; yrh2(2) = 150.0;
        xrh3(1) = tos; xrh3(2) = tearly; yrh3(1) = 5.0 .*10 .^5; yrh3(2) = yrh3(1);
        xT1(1) = tos; xT1(2) = tearly; yT1(1) = 163000.0; yT1(2) = yT1(1);
        xT2(1) = tos; xT2(2) = tearly; yT2(1) = 2.0 .*10 .^10; yT2(2) = yT2(1);
        %
        iloop = iloop + 1; 
        figure(iloop)
        loglog(xom,yom,'-b',xem,yem,'b-',xor,yor,'r:',xer,yer,'r:',xrh1,yrh1,'-g',xrh2,yrh2,':g',xrh3,yrh3,'-.g')
        legend('','matter','','radiation','water','sun','white dwarf')
        grid
        title(' Density - Time, in gm/cm^3 and K degree units')
        xlabel('t(sec)')
        ylabel('\rho(gm/cm^3)')
        %
        iloop = iloop + 1; 
        figure(iloop)
        loglog(xoT,yoT,'-b',xeT,yeT,'-r',xT1,yT1,'g-',xT2,yT2,'g:')
        grid
        title(' Radiation Temperature ')
        legend('matter dominated','radiation dominated','H 13.6 eV', 'D 2.2 MeV')
        xlabel('t(sec)')
        ylabel('T(K)')
        %
    end
end
%

