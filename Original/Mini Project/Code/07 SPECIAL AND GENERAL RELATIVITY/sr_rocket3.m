%
% rocket - Compute motion of a  relativistic rocket, variable accel
%
function sr_rocket3
%
clear all;      % Clear memory
help sr_rocket3;    %
%
global alf dmdt
%
fprintf(' Relativistic Rocket Velocity, m*db/dm = bo*(1-b^2) \n');
%
% symbolic solution
%
syms m b bo mo bb
bb = dsolve('Db = bo*(1-b^2)/m','b(mo)=0','m');
bb = simple(bb);
pretty(bb)
%
%
iloop = 0;
irun = 1;
%
while irun > 0
    kk = menu('Pick Another Rocket Payload and Exhaust Velocity?','Yes','No');
    if kk == 2
        irun = -1;
        break
    end
    if kk == 1
        %
        mfmo = input('Enter Payload Mass Ratio Final Mass/Initial Mass < 1: ');
        %
        bo = input('Enter Exhaust Velocity w.r.t. Light in Rocket Frame: ');
        %
        fprintf('Velocity Measured in Frame Where Rocket Was Initially at Rest  \n');
        %
        m = linspace(mfmo,1);   % m as a fraction of mo
        alf = 2.0 .*bo;
        b = abs( (1 - m .^alf) ./(1 + m .^alf));
        gg = 1.0 ./sqrt(1.0 - b .^2);
        bf = b(1);
        gf = 1.0 ./sqrt(1.0 - bf .^2);
        fprintf('Final beta and gamma at the End of the Burn = %g , %g  \n',bf,gf);
        %
        iloop = iloop + 1;
        figure(iloop)
        loglog(m,gg,'-')
        title('Rocket \gamma Factor as a Function of Mass Ratio')
        xlabel('m/mo')
        ylabel('\gamma')
        %
        % numerical integrate to get position
        %
        dmdt = input('Enter Mass Burn Rate (sec-1) as a Fraction of Initial Mass: ');
        tf = (1.0 - mfmo) ./dmdt;    % time at end of burn
        t = (1.0 - m) ./dmdt;      % find time for this mass ratio
        %
        for i = 1:length(m)
            yy(i) = quad(@sr_rock,0,t(i));
        end
        ly = 365 .*24 .*60 .*60; % convert m to light years
        yy = yy ./ly;
        %
        iloop = iloop + 1;
        figure(iloop)
        semilogx(t,yy,'-')
        title('Rocket Position as a Function of Time Before Burn End')
        xlabel('t(sec)')
        ylabel('x(ly)')
        %
    end
end
%
% ----------------------------------------------------------
%
function y = sr_rock(x)
%
global alf dmdt
xx = 1.0 - dmdt .*x;      % convert this t = x , to a mass ratio m/mo
y = abs((1 - xx .^alf) ./(1 + xx .^alf));    % position
%