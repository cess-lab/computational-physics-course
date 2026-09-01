%
% Program to Illustrate Diffraction at a Single Slit and Double Slit
% use MATLAB bessel function for circular aperture
%
clear all; 
help Diffract;  % Clear memory and print header
% 
fprintf(' Diffraction at a Single and Double Slit \n');
%
iloop = 0;
irun = 1;
%
while irun > 0
    kk = menu('Pick Another Single Slit Size?','Yes','No');
    if kk == 2
        irun = -1;
        break
    end
    if kk == 1
        %
        dslit = input('Input Ratio of Slit Width the Incident Wavelength ~ Resolving Power: ');
        %
        fprintf(' Path Difference = d*sintheta, Phase Difference = pi*d*sintheta/lambda ')
        %
        sinth = linspace(0,1.0); % angle of observation
        dphi = pi .*sinth .*dslit;
        I1d = (sin(dphi) ./(dphi)) .^2;
        %
        fprintf(' Phase Difference for Circular Aperture, k*D*sintheta/lambda, D = diameter \n')
        %
        Icirc = (2.0 .*besselj(1,dphi) ./dphi) .^2 ;
        %
        iloop = iloop + 1;
        figure(iloop)
        plot(sinth, I1d,'b-',sinth,Icirc,'r:')
        title('Diffracted Intensity - Single Slit and Circular Aperture ')
        xlabel('sin(\theta)')
        ylabel('I1s')
        legend('slit','circular')
        %
        al = input('Input Ratio of Two Slit Seperation to the Incident Wavelength: ');
        %
        phase = pi .*sinth .*al;
        I2s1d = I1d .*((cos(phase)) .^2);
        iloop = iloop + 1;
        figure(iloop)
        plot(sinth, I2s1d, '-')
        title('Diffracted Intensity - Double Slit, 1 Dimension')
        xlabel('sin(\theta)')
        ylabel('I2s1d')
        %
    end
end
    %
    % movie for circular aperture - vary ka
    %
    iloop = iloop + 1;
    figure(iloop)
    for i = 1:20
        ka =  0.1  + 1 .*(i - 1);
        sinth = linspace(0,1.0); % angle of observation
        dphi = ka .*sinth;
        Icirc = (2.0 .*besselj(1,dphi) ./dphi) .^2 ;
        %
        plot(sinth, Icirc, '-')
        title('Diffracted Intensity - Circular - ka from 0 to 20')
        xlabel('sin(\theta)')
        ylabel('I2s1d')
        axis([0 1.0 0 1])
        pause(0.5)
    end
%