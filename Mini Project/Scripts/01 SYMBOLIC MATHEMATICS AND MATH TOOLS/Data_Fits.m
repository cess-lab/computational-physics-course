%
% Program to look at simple fits to experimental data
%
function Data_Fits
%
clear all; 
help Data_Fits;  % Clear memory and print header
% 
fprintf(' Data Fit Tools in MATLAB, Polynomial, polyfit, polyval \n');
%
% data on temp along rod between 2 heat baths at fixed temperatures
%
x = [1:9];
T = [ 15.6 17.5 36.6 43.8 58.2 61.6 64.2 70.4 98.8];
for i = 1:9
    sig(i) = 6.7;
end
%
% data on thermocouple voltage as a function of temperature
%
for i = 1:11
    TT(i) = 5.0 .*(i - 1);
    sigV(i) = 0.02;
end
V = [-0.89 -0.69 -0.53 -0.34 -0.15 0.02 0.20 0.42 0.61 0.82 1.03];
%
figure(1)
errorbar(x,T,sig,'o')
title('Temperature Along a Bar Between 2 Heat Baths')
xlabel('x(cm)')
ylabel('T(^oC)')
%
fprintf(' Polynomial Coefficients, Temperature')
P1 = polyfit(x,T,2)
Tf = polyval(P1,x);
hold on
plot(x,Tf,'r-')
hold off
%
figure(3)
plot(x,T,'o')
title('Temperature Along a Bar Between 2 Heat Baths')
xlabel('x(cm)')
ylabel('T(^oC)')
fprintf(' Do Your Own Fits - Tab = Tools, Basic Fitting in Figure 3 and 4 \n');
fprintf(' Compare Fits- tools/basic fitting, show eqs, plot residuals \n');
%
figure(2)
errorbar(TT,V,sigV,'o')
title('Thermocouple Output Voltage as a Function of Temperature')
xlabel('T(^oC)')
ylabel('V(mV)')
%
fprintf(' Polynomial Coefficients, Voltages')
P2 = polyfit(TT,V,2)
Vf = polyval(P2,TT);
hold on
plot(TT,Vf,'r-')
hold off
figure(4)
plot(TT,V,'o')
title('Thermocouple Output Voltage as a Function of Temperature')
xlabel('T(^oC)')
ylabel('V(mV)')
%
%