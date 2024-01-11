%
% qm_step - Particle of energy ee incident from left scatters off step for x > 0 of height Vo = 5 eV
%           
clear all; help qm_step;  % Clear memory; print header
%
% Initialize variables hbarc= in eV-A units, me in eV
%
me = 511000.0  ;       % e mass in eV
hbarc = 2000.0 ;       % hbarc in eV*A units
%
fprintf('Scattering of an Electron at a Potential Step of Height = 5 eV at x > 0\n')
%
iloop = 0;
irun = 1;
%
while irun > 0
    kk = menu('Pick Another Incident Energy?','Yes','No');
    if kk == 2
        irun = -1;
        break
    end
    if kk == 1
        %
        ee = input('Enter Electron Energy : ');
        %
        Vo = 5; % Step height for x > 0, V = 0 for x < 0
        % 
        % find propagation vectors for x < 0 k = 1/xo and K = 1/xop for x > 0
        %
        k = sqrt(2.0 .*me .*ee) ./hbarc; % for x < 0 oscillatory
        if ee > Vo ; % - formally K -> iK, good for both signs- use osciaaltory solution
            K = sqrt(2.0 .*me .*(ee - Vo)) ./hbarc; % oscillatory x > 0
            t = 2.0 .*k ./(k + K);
            r = t - 1;
            RR = abs(r) .^2;
            TT = 1.0 - RR;
        else
            K = sqrt(2.0 .*me .*(Vo - ee)) ./hbarc; % exponential x > 0
            t = 2.0 .*k ./(k + j .* K);
            r = t - 1;
            RR = abs(r) .^2;
            TT = 1 - RR;
        end
        %
        % for E < Vo match conditions are 1+r=t and ik(1-r) = -Kt, 
        % for E > Vo match conditions are 1+r=t and ik(1-r) = iKt
        %
        fprintf('r = %g, t = %g \n',r,t)
        fprintf('k = %g, K = %g (in 1/A), R = %g and T = %g for Vo = 5 eV and Ee = %g eV\n',k,K,RR,TT,ee)
        %
        % plot wave function in A units from -5 to 5
        %
        xx = linspace(-5.0,5.0);
        %
        for i = 1:length(xx)
            if xx(i) < 0
                psiI(i) = exp(j .*k .*xx(i));
                psiR(i) = r .*exp(-j .*k .*xx(i));
                psiT(i) = 0.0;
            else;
                psiT(i) = t .*exp(- K .*xx(i));
                psiI(i) = 0.0;
                psiR(i) = 0.0; 
                if ee > Vo
                    psiT(i) = t .*exp(j .*K .*xx(i));
                end
            end
        end
        %
        fprintf('Incident, Transmitted, and Reflected Waves Plotted From x =  %g A to x = %g A\n',xx(1),xx(100));
        %
        iloop = iloop + 1;
        figure(iloop)
        plot(xx,real(psiI),'b-',xx,real(psiR),'r:',xx,real(psiT),'g--');
        title('Reflection and Transmission at a Potential Step');
        xlabel('x in Angstroms'); 
        ylabel('re(\psi)');
        legend('I','R','T')
       %
    end
end
%
% now vary E to plot reflection coefficient
% 
eee = linspace(2,8,40);
        for jj = 1:length(eee)
            kkk(jj) = sqrt(2.0 .*me .*eee(jj)) ./hbarc;
            if eee(jj) > Vo
                KK(jj) = sqrt(2.0 .*me .*(eee(jj) - Vo)) ./hbarc; % oscillatory x > 0
                tt(jj) = ( 2.0 .*kkk(jj)) ./(kkk(jj) + KK(jj));
                %
            else
                KK(jj) = sqrt(2.0 .*me .*(Vo - eee(jj))) ./hbarc; % exponential x > 0
                tt(jj) = (2.0 .*kkk(jj)) ./(kkk(jj) + j .*KK(jj));
                %
            end
            rr(jj) = tt(jj) - 1.0;
            RRR(jj) = abs(rr(jj)) .^2;
        end
        TTT = 1.0 - RRR;
        iloop = iloop + 1;
        figure(iloop)
        plot(eee ./Vo,RRR,'-b',eee ./Vo,TTT,'r:')
        legend('R','T')
        title('Reflection and Transmission at a Step')
        xlabel('Ee/Vo')
        ylabel('R,T, |\psi|^2')
        axis([0.4 1.6 0 1])
        %   



