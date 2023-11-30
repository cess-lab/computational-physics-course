%
% solar sailing using the momentum of light
%
function Solar_Sail2

clear all;      % Clear memory
help Solar_Sail2;    % Print header
%
% Initialize variables 
%
global del
%
G = 6.67 .*10^-11 ;  % Newton constant
Lo = 3.9 .*10^26  ;   % solar luminosity in Watts
au = 1.5 .*10^11 ;  % 1 au in m
Mo = 1.9 .*10^30 ;  % sun's mass in kg
c = 3.0 .*10^8;  ;   % light m/sec
yr = 60 .*60 .*24 .*365;  % year in sec
%
fprintf('Light Pressure is P = (2*L)/(4*pi*r*r*c) \n');
P = (2.0 .*Lo) ./(4.0 .*pi .*au .*au .*c);
fprintf('Light Pressure at 1 AU = %g (nt/m^2) \n',P);
%
iloop = 0;
irun = 1;
%
while irun > 0
    kk = menu('Another Sail Design','Yes','No');
    if kk == 2
        irun = -1;
        break
    end
    if kk == 1
        %
        ro = input('Enter Launch Radius (au): ');
        ro = ro .*au;  % convert to m
        %
        % escape velocity at that location (m/sec)
        %
        ves = sqrt((2.0 .*G .*Mo) ./ro);
        fprintf('Escape Velocity (m/sec) = %g \n',ves);
        %
        asol = (G .*Mo) ./(ro .^2);
        fprintf('Initial Solar Accel (m/sec^2) = %g \n',asol);
        %
        st = input('Enter Solar Sail Thickness in um : ');
        %
        st = st .*10^-6; % in m
        rho = 1000.0;           % sail has density of water ~ mylar
        sr = input('Enter Circular Solar Sail Radius in km : ');
        sr = sr .*1000.0; % in m
        %
        % mass of sail - circular
        %
        sm = rho .*pi .*sr .*sr;
        %
        % payload mass, assumed small
        %
        rpm = input('Enter Payload Ratio x 10^-6 : ');
        pm = rpm .*sm .*10 .^-6;
        %
        fprintf('Sail Mass (kg) = %g , Payload Mass (kg) = %g \n',sm,pm);
        %
        % find total acceleration - make escape velocity?
        %
        const = rho .*st + pm ./(pi .*sr .*sr);   % accel depends only on thickness and density - ignoring payload
        asun = (2.0 .* Lo) ./(4.0 .*pi .*c .*const);
        asun = asun ./ro .^2;        % acceleration due to light ~ only flux and thickness/density
        %
        fprintf('Initial Sail Acceleration(m/sec^2) = %g \n',asun)
        %
        del = (asun - asol) .*ro .*ro;   % constant for accel which goes as 1/r^2
        tspan = linspace(0,10 .*yr,100);  % 1 year tracking
        [t,y] = ode45(@Sail,tspan,[0.0 ro]); % numerical because not solvable analytically 
        %
        fprintf('Velocity After 10 Years (m/sec) = %g \n',y(100,1));
        fprintf('Distance After 10 Years (AU) = %g \n',y(100,2) ./au);
        tottime = (5.0 .*c) ./y(100,1); 
        fprintf('Time (yr) to go 5 Light Years Assuming Rapid Terminal Velocity = %g \n',tottime); 
        %
        iloop = iloop + 1;
        figure(iloop)
        semilogx(t ./yr,y(:,2) ./au)
        xlabel('t(year)')
        ylabel('r(AU)')  
        %
        iloop = iloop + 1;
        figure(iloop)
        for i = 1:length(t)
            escape = ves .*sqrt((ro ) ./y(i,2));
            semilogx(t(i) ./yr,y(i,1),'o')
            xlabel('t(year)')
            ylabel('v(m/sec)')
            title('Velocity vs. Time After Launch  and Escape Velocity at That r')
            axis([0.1 , 10 , min(y(:,1)),max(y(:,1))])
            hold on
            semilogx(t(i) ./yr, escape,'r*')
            legend('Sail v','Escape v')
            pause(0.2)
        end
        hold off
    end
end
%
%-----------------------------------------------------------------------------------
%
function dy = Sail(t,y)
%
global del
% 
    dy = zeros(2,1);
    dy(1) = del ./y(2) .^2  ;
    dy(2) = y(1);  % y(1) = vx, y(2) = x