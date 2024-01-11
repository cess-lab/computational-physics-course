%
% Program to solve 2 body NR collsions. Target at rest. No decays
% 
clear all;  
help cm_NR_scatt      % Clear the memory and print header
%
% Initialize  - Setup Momentum and Energy conservation
% 0 + T -> 1 + 2 but non-relativistic so mo = 1 = m1, elastic only
% assume o velocity is in +x, T is at rest
%
fprintf('Non_Relativistic Elastic Scattering, Incident Mass = 1, Target Mass Variable \n')
%
% now some numerical plots
%
irun = 1;
iloop = 0;
while irun > 0
    kk = menu('Pick Another Target Mass?','Yes','No');
    if kk == 2
        irun = -1;
        break
    end
    if kk == 1
        %
        u = input('Enter Target Mass: ');
        %
        % loop on scattering angle of recoiling target
        % find recoil velocity and scattered projectile angle and velocity
        %
        for i = 1:100
            cph(i) = i ./101; % recoil angle 
            sph(i) = sin(acos(cph(i)));
            %
            % graphics for in line collision   
            %
            v2(i) = (2.0 .*cph(i)) ./(1.0 + u);   % recoil velocity
            fact1 = 1.0 + v2(i) .^2 - 2.0 .*v2(i) .*cph(i);
            v1(i) = sqrt(fact1);   % scattered projectile velocity
            st(i) = (v2(i) .*sin(acos(cph(i)))) ./v1(i);  % scattered projectile angle
            ct(i) = cos(asin(st(i)));
            v1y(i) = v1(i) .*st(i);
            v1x(i) = v1(i) .*ct(i);
            v2y(i) = -v2(i) .*sph(i);
            v2x(i) = v2(i) .*cph(i);
        end
        %
        iloop = iloop + 1;
         figure(iloop)
         plot(cph,v2,'-');
         title('Velocity Of Outgoing Target w.r.t. Incoming Velocity vs. Outgoing Angle')
         xlabel('cos\phi')
         ylabel('velocity')
         %
         iloop = iloop + 1;
         figure(iloop)
         plot(ct,v1,'-');
         title('Velocity Of Outgoing Projectile w.r.t. Incoming Velocity vs. Scattering Angle')
         xlabel('cos\theta')
         ylabel('velocity')
         %
         iloop = iloop + 1;
         figure(iloop)
         plot(v1,v2,'-')
         title('Velocity of Projectile vs. Velocity of Target')
         xlabel('v projectile')
         ylabel('v target')
         %
         iloop = iloop + 1;
         for i = 1:10
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
            xsp(2) = v1x(j);
            ysp(2) = v1y(j);
            plot(xsp,ysp,'r:')
            xst(1) = xp(2);
            yst(1) = yp(2);
            xst(2) = v2x(j);
            yst(2) = v2y(j);
            plot(xp,yp,'b-',xsp,ysp,'r:',xst,yst,'g-.')
            title('Scattering for 10 Representative Angles')
            axis([-1.2 1.2 -1 1]);
            xlabel('x Component of Velocity')
            ylabel('y Component of Velocity')
            legend('projectile','scatt proj','recoil tar')
            pause(1);
         end     
    end
    %
end
%
