%
% qm_tunn - Particle Scatters off a Potential Well of depth Vo, walls at (0,a)
%           
clear all; 
help qm_tunn;  % Clear memory; print header
%
% Initialize variables hbarc= in eV-A units, me in eV
%
me = 511000.0  ;       % e mass in eV
hbarc = 2000.0 ;       % hbarc in eV*A units
%
iloop = 0;
irun = 1;
%
while irun > 0
    kk = menu('Pick Another Barrier/Well?','Yes','No');
    if kk == 2
        irun = -1;
        break
    end
    if kk == 1
        %
        fprintf('Electron of Energy 5 eV, Scatters off a Potential Well \n')
        fprintf('Ramsauer if E =  -Vo +((hbar*k))^2/2*m, ka = n*pi \n') 
        a = input('Enter Well Full Width, a, in Angstroms : ');
        Vo = input('Enter Well Depth Vo in eV, if <0 it is Barrier Height ');
        %
        % Vo > 0 is the well. Vo < 0 is the barrier. Energy is > 0. Tunnel
        % if -Vo > energy
        % r is reflected amplitude - match psi and dpsi/dx at x = 0
        % p and q are + and - waves inside the well
        % t is the transmitted wave for x > a
        % k is the wave vector for Vo=0, K is in the well
        %
        ee = 5.0;       % e energy in eV
        %
        % find characteristic length for this energy - free particle
        %
        k = sqrt(2.0 .*me .*ee) ./hbarc;
        %
        if Vo > 0 || (Vo < 0 && ee > abs(Vo)) ; % convention is that this is well depth, scatt states
            %
            K = sqrt(2.0 .*me .*(ee + Vo)) ./hbarc;
            ao = pi ./K;   % lowest deep well state
            fprintf('R = 0 at a Well Width = %g (A) for this Depth\n',ao);
            fprintf('R = 0 at Other Ramsauer Points x n(A) for this Depth\n');
            %
            % algebraic solution
            %
            d = k ./K;
            s = sin(K .*a);
            c = cos(K .*a);
            r = j .*s .*(k .^2 - K .^2) .*exp(-j .*k .*a);
            r = r ./(j .*s .*(k .^2 + K .^2) - 2.0 .*k .*K .*c);
            %
            t = exp(-j .*k .*a) .*2 .*k .*K ./(-j .*s .*(k .^2 + K .^2) + 2.0 .*k .*K .*c); 
            p = (t .*(1.0 + d) .*(exp(j .*k .*a - j .*K .*a))) ./2.0;
            q = (t .*(1.0 - d) .*(exp(j .*k .*a + j .*K .*a)))./2.0;  
        end
        %
        % Vo < 0 means barrier of height Vo, tunnel if -Vo > energy
        %
        if Vo < 0 && ee < abs(Vo) ; % convention is that this is barrier height
            %
            K = sqrt(2.0 .*me .*(-Vo - ee)) ./hbarc;
            %
            d = j .*k ./K;
            s = sinh(K .*a);
            c = cosh(K .*a);
            r = s .*(k .^2 + K .^2) .*exp(-j .*k .*a);
            r = r ./(s .*(k .^2 - K .^2) + 2.0 .*j .*k .*K .*c);
            %
            t = exp(-j .*k .*a) .*2 .*k .*K ./(-j .*s .*(k .^2 - K .^2) + 2.0 .*k .*K .*c);
            p = (t .*(1.0 + j .*d) .*(exp(j .*k .*a - K .*a))) ./2.0;
            q = (t .*(1.0 - j .*d) .*(exp(j .*k .*a + K .*a)))./2.0;  
        end
        %
        fprintf('k = %g, K = %g, r = %g, t = %g, p = %g, q = %g, for Ee = 5 eV \n',k,K,r,t,p,q);
        RR = abs(r) .^2;
        TT = abs(t) .^2;
        fprintf('Wavefunctions Squared, R = %g, T = %g \n',RR,TT);
        %
        % plot wave function modulus for incident, reflected transmitted
        % units of a
        %
        xx = linspace(-a,2.0 .*a);
        %
        for i = 1:length(xx)
            psiI(i) = 0.0;
            psiR(i) = 0.0;
            psiT(i) = 0.0;
            psiW(i) = 0.0;
            if xx(i) < 0
                psiI(i) = exp(j .*xx(i) .*k);    % incident
                psiR(i) = r .*exp(-j .*xx(i) .*k);  % reflected
            end;
            if xx(i) > a;
                psiT(i) = t .*exp(j .*xx(i) .*k);  % transmitted
            end
            if xx(i) > 0 && xx(i) < a ;   % in the well
                psiW(i) = p .*exp(j .*xx(i) .*K) + q .*exp( -j .*xx(i) .*K);   % in the well - oscillatory
                if Vo < 0 && ee < abs(Vo)
                    psiW(i) = p .*exp(xx(i) .*K) + q .*exp(-xx(i) .*K); % in well, tunneling
                end
            end
        end
        %
        iloop = iloop + 1;
        figure(iloop)
        fprintf('Wave Functions plotted from x =  %g(A) to x = %g (A)\n',xx(1),xx(100));
        %
        % note flux of reflected wave is negative - phase change on
        % reflection
        %
        plot(xx,real(psiI),'-b',xx,-real(psiR),'r:',xx,real(psiT),'g--',xx,real(psiW),'k-.');
        title('Wavefunctions for Potential Well/Barrier ');
        xlabel('x (A)'); 
        ylabel('re(\psi)');
        legend('I','R','T','W');
        %
        % now find R,T for various Vo and a at fixed ee or k - want to see contour with R = 0 antireflection
        % and rapid falloff in tunnel probability with a and Vo>Ee
        %
        voo = linspace(-10, 10, 50);
        aa = linspace(0.5, 5.5, 40);
        fprintf(' R,T for Vo in (-10 10) eV and a in (0.5 5.5) A \n')
        for ii = 1:length(voo)
            for jj = 1:length(aa)
                if voo(ii) > 0 || (voo(ii) < 0 && ee > abs(voo(ii))) ; % convention is that this is well depth
                    %
                    KK = sqrt(2.0 .*me .*(ee + voo(ii))) ./hbarc;
                    dd = k ./KK;
                    ss = sin(KK .*aa(jj));
                    cc = cos(KK .*aa(jj));
                    rr(ii,jj) = j .*ss .*(k .^2 - KK .^2) .*exp(-j .*k .*aa(jj));
                    rr(ii,jj) = rr(ii,jj) ./(j .*ss .*(k .^2 + KK .^2) - 2.0 .*k .*KK .*cc);
                end
                if voo(ii) < 0 && (ee < abs(voo(ii))) ; % convention is that this is barrier height
                    %
                    KK = sqrt(2.0 .*me .*(-voo(ii) - ee)) ./hbarc;
                    %
                    dd = j .*k ./K;
                    ss = sinh(KK .*aa(jj));
                    cc = cosh(KK .*aa(jj));
                    rr(ii,jj) = ss .*(k .^2 + KK .^2) .*exp(-j .*k .*aa(jj));
                    rr(ii,jj) = rr(ii,jj) ./(ss .*(k .^2 - KK .^2) + 2.0 .*j .*k .*KK .*cc);
                end
                RR(ii,jj) = abs(rr(ii,jj)) .^2;
                if RR(ii,jj) > 1.0;
                    RR(ii,jj) = 1.0;
                end
            end
        end
        TT = 1.0 - RR;
        iloop = iloop + 1;
        figure(iloop)
        mesh(aa,voo,RR);
        title('R for Well/Barrier as a function of Vo and a')
        ylabel('Vo(eV)')
        xlabel('a(A)')
        zlabel('R')
        iloop = iloop + 1;
        figure(iloop)
        mesh(aa,voo,TT)
        title('T for Well/Barrier as a function of Vo and a')
        ylabel('Vo(eV)')
        xlabel('a(A)')
        zlabel('T')
        %
    end
end
%
