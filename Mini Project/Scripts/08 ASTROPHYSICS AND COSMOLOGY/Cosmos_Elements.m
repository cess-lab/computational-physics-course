%
% nuc synth - look at big bang nucleosynthesis - only very approximately
% Kolb, Turner"The Early Universe"
%
clear all; 
help Cosmos_Elements; % clear and print header
%
iloop = 0;
irun  = 1;
while irun > 0
    %
    krun = menu('Another Look at Light Elements ?','Yes','No');
    if krun == 2
        irun = -1;
        break
    end
    %
    if krun == 1 
        %
        Ho = input('Enter present Ho in km/sec*million lyr (~30): ');
        % get present value of Ho and h, ~ 30, ~ 0.7
        %
        h = input(' Enter estimate for h (~0.7): ');
        %
        omegb = input('Enter present baryon fraction \Omegab (~0.04): ');
        fprintf('Freezeout for n occurs when expansion H is > p-> n rate \n');
        Tf = input('Enter neutron freezeout temp in MeV (~ 0.8 MeV): ');
        %
        % look at equilibrium abundances of light nuclei, omegab dependence
        % the photon to baryon ratio (entropy) depends on omegab and h
        % freeze out temperature (in MeV) when e+e- anihhilate and n<-> p falls below H 
        %
        eta = h .*h .*omegb .*(2.7 .*(10 .^-8));
        fprintf('Hot Universe and element abundance depends on ratio of B to photons ~ %g\n',eta);
        %
        % n-p mass difference in MeV
        %
        q = 1.29;
        %
        % k -  1 MeV = 1.16 x 10^10 K
        %
        % equilibrium ratio of n/p, T in MeV, freeze out temp Tf, nucleon mass in MeV
        % solve under the constraint 1 = Xp + Xn + X2 + X3 + X4
        %
        T = logspace(-1,1,100);
        M = 938.0;     % p mass
        n_peq = exp(-q ./T);  % equilibrium
        n_pf = exp(-q ./Tf);  % freezeout
        %
        % Xp is unknown, Xn = n/p * Xp, ignore D2 and He3 at high T a la Kolb, Xp = 1/(1+n/p)
        %
        Xn_Xp = n_peq;  % holds above freezeout
        %
        % below Tf take n/p @ Tf
        %
        for i=1:length(T)
            if T(i) < Tf;
                Xn_Xp(i) = n_pf;
            end;
        end;
        %
        Xp = 1.0 ./(1.0 + Xn_Xp);
        Xn = 1.0 - Xp;
        %
        % light elements - need entropy and binding energies
        fprintf('Elemental abundance driven by entropy and binding energy  \n');
        %
        XD = 16.3 .*((T ./M) .^1.5) .*eta .*exp(2.22 ./T).*Xn .*Xp;  % deuterium
        XHe3 = 57.4 .*((T ./M) .^3) .*eta .*eta .*exp(7.72 ./T) .*Xn .*Xp .*Xp;  % He^3
        XHe4 = 113.0 .*((T ./M) .^4.5) .*eta .*eta .*eta .*exp(28.3 ./T) .*Xn .*Xn .*Xp .*Xp; % He^4
        %
        % n/p ratio at freezout ==> He abundance at T ~ 0.1 MeV
        %
        X4f = (2.0 .*n_pf) ./(1.0 + n_pf); % almost all n end up in He4
        %
        for i=1:length(T)
            if XHe4(i) > X4f;
                XHe4(i) = X4f;
            end;
        end;
        for i=1:length(T)
            if T(i) < Tf;
                XHe3(i) = 1.0 - Xp(i)-Xn(i); % -XHe4(i); % ignore D2 and n (eaten by He4)
            end;
        end;
        %
        fprintf('Helium Mass Abundance ~ %g\n',X4f);
        %
        iloop = iloop + 1;
        figure(iloop);
        loglog(T,Xn ./Xp,'-')
        axis([0.1 10 0.1 1])
        grid
        title('T - Xn/Xp Ratio')
        xlabel('T (MeV)')
        ylabel('Xn/Xp')
        %
        iloop = iloop + 1;
        figure(iloop);
        loglog(T,Xp,'-',T,XD .*1000,':',T,XHe4,'--')
        axis([0.1 10 10 .^-6 1])
        title('T - Xp, XD*1000 .., XHe4 --')
        xlabel('T (MeV)')
        ylabel('Xn, XD, XHe4')
        legend('p','D','4He')
        %
    end
end
%