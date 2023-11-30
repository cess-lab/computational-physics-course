%
% Ideal Gas Law and Earth's atmosphere
%
clear all;  help Atmosphere      % Clear the memory and print header
%
fprintf('Ideal Gas Law - PV = NkT \n');
%
fprintf('Density of Air at STP ~ 1.3 kg/m^3 \n');
%
fprintf('Pressure: 1 bar = 10^5 Pa, 1 atm = 760 Torr = 101 kPA \n');
%
fprintf('Pressure Falloff with Altitude, P/Po ~ exp(-rho*g/P)y, ~ 0.12/km \n');
%
fprintf('<E> = 3/2*kT, PV = 2/3<E> \n');
%
fprintf('(<v^2>) = 2*<E>/m = 3*kT/m  \n');
%
fprintf('kT~1/40 eV at STP, beta for a gas of p is 9x10^-5 or v ~ 2.7 km/sec \n');
%
fprintf('Speed  of Sound in O2 at STP is ~ 0.32 km/sec \n');
%
% now a few MB distributions of energy and velocity - O2 example so m = 32*mp
%
ipass = 0;
%
kT(1) = 1 ./40;     % approx for 300 deg K - eV
kT(2) = kT(1) .*5 ./3;   % 500 deg
kT(3) = kT(1) .*7 ./3;   % 700 deg
%
Ao = 32;              % O2 mol weight
Ahe = 4;
mp = 0.938 .*10 .^9 ; % p/n mass in eV
c = 3.0 .*10 .^5   ;  % c in km/sec
%
g = 9.8; % accel at earth surface m/sec^2
re = 6.378 .*10 .^6; % earth radius - m
ve =sqrt(2.0 .*g .*re);  % escape velocity ~ 11.2 km/sec
ve = ve ./1000 ;
%
E = linspace(0,0.2);  % E values for O2 air molecules in eV
%
for i = 1:3
     b = 1.0 ./kT(i);
     dN_dE(i,:) = 2.0 .*sqrt(E ./pi) .*(b .^1.5) .*exp(-b*E);
end
ipass = ipass + 1;
figure(ipass)
plot(E, dN_dE(1,:),'b-',E,dN_dE(2,:),'r:',E,dN_dE(3,:),'g--')
title('Energy Distribution for Molecules')
xlabel('E(eV)')
ylabel('1/N(dN/dE)')
legend('300 K', '500 K', '700 K')
%
vel = sqrt(2.0 .*E ./(Ao .*mp)) .*c ;   % velocity in km/sec, ev units - beta
%
ipass = ipass + 1;
figure(ipass)
plot(E,vel,'-')
title('Mean Velocity of O2 Molecules (km/sec) for Different Kinetic Energies')
xlabel('E(eV)')
ylabel('v(m/sec)')
%
velHe = sqrt(2.0 .*kT(1) ./(Ahe .* mp)) .* c ;   % He velocity in km/sec
velO2 = sqrt(2.0 .*kT(1) ./(Ao .* mp)) .* c ;   %  O2 velocity in km/sec
%
fprintf('Escape Velocity - Earth (km/sec) = %g \n',ve);
fprintf('No He in the Atmosphere?, Thermal He Velocity (km/sec) = %g \n',velHe);
fprintf('O2 Thermal Velocity (km/sec) = %g \n',velO2);
%
b = 1.0 ./kT(1);        % 1/eV units, 30 oK
vv = linspace(0,10) ;   % velocity in km/sec
mHe = 4.0 .*mp;
mO2 = Ao .*mp;
% He, O2 mass in eV
dNdvHe = vv .*vv .*(b .^1.5) .*((mHe) .^1.5) .*exp(-(b .*mHe .*vv .*vv) ./(2.0 .*c .*c));
dNdvO2 = vv .*vv .*(b .^1.5) .*((mO2) .^1.5) .*exp(-(b .*mO2 .*vv .*vv) ./(2.0 .*c .*c));
%
ipass = ipass + 1;
figure(ipass)
semilogy(vv,dNdvHe,'b-',vv,dNdvO2,'r:')
title('Velocity Distribution of He and O2 at 300 Degrees')
xlabel('v(km/sec)')
ylabel('1/N(dN/dv)')
axis([0, 12, 10 .^-40,10 .^20])
hold on 
plot(ve,1 ,'g*')
legend('He', 'O2', 'Escape')
%
hold off
%