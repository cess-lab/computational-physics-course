%
% Range and KE of a slow moving proton
%
clear all;  
help Range_Energy      % Clear the memory and print header
%
% Initialize  
%
mp = 938.3;   % MeV
dedxmin = 1.992;   % water energy loss in MeV*gm/cm^2
rho = 1.0;  % density of water in  gm/cm^3
%
iloop = 0;
irun = 1;
%
while irun > 0
    kk = menu('Pick Another Proton Kinetic Energy','Yes','No');
    if kk == 2
        irun = -1;
        break
    end
    if kk == 1
        To = input('Enter the Inital Kinetic Energy of the Proton (MeV): ');
        %
        dedx = dedxmin .*rho;   % energy loss per unit distance MeV/cm
        %
        R = (To .*To) ./(dedx .*mp);  % range in cm
        fprintf('Range in Water in cm = %g \n',R);
        %
        z = linspace(0,R);
        T = sqrt(To .*To - dedx .*mp .*z);   % kinetic energy as a function of z
        %
        dTdx = (dedx .*mp) ./(2.0 .*T);  
        %
        iloop = iloop + 1;
        figure(iloop)
        plot(z,T)
        title('Kinetic Energy as a Function of Material Traversed, R ~ To^2/m')
        xlabel('z(cm)')
        ylabel(' T(MeV)')
        %
        iloop = iloop + 1;
        figure(iloop)
        plot(z,dTdx)
        title(' Specific Ionization, dT/dx as a Function of Material Traversed ')
        xlabel('z(cm)')
        ylabel('dT/dx(MeV/cm)')
    end
end
%