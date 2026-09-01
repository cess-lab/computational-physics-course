%
% Program to look at laminar flow in a cylindrical pipe and parallel plates 
% 
clear all; 
help Flow_Pipe;  % Clear memory and print header
% 
fprintf(' Frictional Force in Fluid Balances Pressure Force\n');
fprintf(' dv/dr = Velocity Gradient = -Pr/(2*eta*L)\n');
fprintf(' v = velocity, P = pressure, R,L = pipe radius, length, eta = viscosity \n');
%
iloop = 0;
irun = 1;
%
while irun > 0
    kk = menu('Another Water Pipe Specified?','Yes','No');
    if kk == 2
        irun = -1;
        break
    end
    if kk == 1
        P = input('Enter Pressure in Atm: ');
        L = input('Enter Pipe Length in m: ');
        R = input('Enter Pipe Radius/ Plate Separation in m: ');
        %
        ll = menu('Choose Configuration','Circular','Parallel Plates');
        P = P .*10 .^5;   % 1 Atm ~ 10^5 Pa
        eta = 1006; % uPa*sec  water viscosity
        eta = eta .*10.^-6;
        if ll == 1
            %
            r = linspace(0,R);
            v = P .*(R .^2 - r .^2) ./(4 .*eta .*L); % boundary condition - water velocity at pipe wall = 0
            %
            fprintf('Velocity at r = 0 = %g (m/sec) \n',v(1));
            %
            dVdt = pi .*P .*(R .^4) ./(8 .*eta .*L);  % volume flow through pipe.
            %
            fprintf('Flow for This Setup = %g (m^3/sec) \n',dVdt);
            %
            iloop = iloop + 1;
            figure(iloop)
            plot(r,v)
            xlabel('r(m)')
            ylabel('v(r) in m/sec')
            title('Velocity Profile for a Circular Pipe')
            %
        end
        %
        if ll == 2
            y = linspace(0,R); % distance between plates
            v = P .*y .*(R - y) ./(2 .*eta .*L); % boundary condition - water velocity at pipe walls = 0
            %
            fprintf('Velocity at y = R/2 (m/sec) %g \n',v(50));
            %
            iloop = iloop + 1;
            figure(iloop)
            plot(y,v)
            xlabel('y(m)')
            ylabel('v(y) in m/sec')
            title('Velocity Profile for Flow Betweeen Two Parallel Plates')
            %  
        end
        %
    end
end
%
