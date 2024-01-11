%
% cm_dec_scat - Decays and Scattering - Relativistic
%           
clear all; 
help sr_dec_scat;  % Clear memory; print header
%
% Work in dimensionless units as possible
% Decay or Scatter angular distributions
%
iloop = 0;
irun = 1;
%
while irun > 0
    kk = menu('Pick Another Decay Particle or Scattering?','Yes','No');
    if kk == 2
        irun = -1;
        break
    end
    if kk == 1
    m = 1;
    M = input('Enter Mass of Target (Projectile m =1) or Decay Particle (Daughter m = 1) ');
    p = input('Enter Momentum of Incoming Particle in m=1 Units ');
    qq = menu('Scattering or Decay','Scatt','Decay');
    %
    % CM angle is uniform in cos theta cm, spinless
    %
    ctcm = linspace(-1,1);
    %
    e = sqrt(p .*p + 1); % incident energy
    %
    if qq == 1 ; % scattering
        ss = 1 + M .*M + 2.0 .*M .*e;  % cm energy
        ss = sqrt(ss);
        bcm = p ./(e + M);
        gcm = (e + M) ./ss;
        pst = (p .*M) ./ss;
        est1 = sqrt(pst .^2 + 1);
        est2 = sqrt(pst .^2 + M .^2);
    else ;     % decays
        ss = M;
        bcm = p ./e;
        gcm = e ./M;
        pst = sqrt((M ./2) .^2 - m .*m);
        est1 = sqrt(pst .^2 + 1);
        est2 = sqrt(pst .^2 + 1); % M -> m + m , equal mass for decays
    end
    %
    fprintf('CM Energy = %g, beta CM = %g, gamma CM = %g, P in CM = %g\n',ss,bcm,gcm,pst);
    %
    % now find final state momentum and angles
    %
    stcm = sin(acos(ctcm));
    pper = pst .*stcm;
    ppar1 = gcm .*( pst .*ctcm + bcm .*est1);
    ppar2 = gcm .*(-pst .*ctcm + bcm .*est2);
    p1 = sqrt(ppar1 .^2 + pper .^2);
    p2 = sqrt(ppar2 .^2 + pper .^2);
    th1 = atan2(pper,ppar1);
    th2 = atan2(-pper,ppar2);
    %
    % scale to incident momentum and max scattering angle
    %
    th1mx = max(th1);
    th2mx = min(th2);
    fprintf('Maximum(Minimum) Angles for Particle 1 = %g (rad) and 2 = %g\n',th1mx,th2mx);
    %
    iloop = iloop + 1;
    figure(iloop)
    plot(ppar1 ./p,pper ./p,'b-',ppar2 ./p, pper ./p,'r:')
    hold on
    plot(ppar1 ./p,-pper ./p,'b-',ppar2 ./p, -pper ./p,'r:')
    xo =  0;
    yo = 0;
    plot(xo,yo,'g*')
    hold off
    xlabel('p_|_|_/p')
    ylabel('p_T_/p')
    title('Transverse and Longitudinal Momentum of Particles 1, 2 Scaled to Incident Momentum')
    %
    iloop = iloop + 1;
    figure(iloop)
    plot(p1 ./p,p2 ./p)
    xlabel('p1/p')
    ylabel('p2/p')
    title('Momenta of Particle 1 vs Particle 2 in Units of Incident Momentum')
    %
    iloop = iloop + 1;
    figure(iloop)
    plot(th1 ./th1mx,th2 ./th2mx)
    xlabel('\theta_1/\theta_1_m_a_x')
    ylabel('\theta_2/\theta_2_m_a_x')
    title('Angles of Particle 1 vs Particle 2 in Units of Maximum (Minimum) Angle')
    %
         for i = 1:10
            iloop = iloop + 1;
            figure(iloop);
            %
            % incident projectile
            %
            xp(1) = -1;
            yp(1) = 0;
            xp(2) = 0;
            yp(2) = 0;
            xsp(1) = xp(2);
            ysp(1) = yp(2);
            j = i .*10;
            xsp(2) = ppar1(j) ./p;
            ysp(2) = pper(j) ./p;
            plot(xsp,ysp,'r:')
            xst(1) = xp(2);
            yst(1) = yp(2);
            xst(2) = ppar2(j) ./p;
            yst(2) = -pper(j) ./p;
            plot(xp,yp,'b-',xsp,ysp,'r:',xst,yst,'g-.')
            title('Scattering for 10 Representative Angles')
            axis([-1.2 1.2 -1 1]);
            xlabel('x Component of Momentum')
            ylabel('y Component of Momentum')
            legend('projectile/parent','scatt proj','recoil tar')
            pause(1);
         end 
    end
end
%