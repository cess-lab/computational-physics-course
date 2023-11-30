%
% qm_intro - Schroedinger Eq in Constant Potential, sizes and scatt/bound solutions
%           
clear all; 
help qm_intro;  % Clear memory; print header
%
% Initialize variables hbarc= in eV-A units, me in eV
%
me = 511000.0  ;       % e mass in eV
hbarc = 2000.0 ;       % hbarc in eV*A units
%
fprintf('Basic Constants; hbarc = 2000 eV*A \n');
fprintf('Basic Constants; mec^2 = 511000 eV \n');
fprintf('Basic Constants; E=p^2/2m = hbar^2k^2/2m = 3.9 k^2 (eV*A^2)  \n');
%
ee = 4.0       ;       % e energy in eV
%
iloop = 0;
irun = 1 ;
%
while irun > 0
    kk = menu('Another Constant Potential? Total Energy = 4 eV','Yes','No');
    if kk == 2
        irun = -1;
        break
    end
    if kk == 1
        %
        Vo = input('Enter Potential in eV,>0 or < 0: ');
        %
        % find characteristic length for this Vo
        %
        if ee > Vo
            xo = hbarc ./sqrt(2.0 .*me .*(ee - Vo));
        else
            xo = hbarc ./sqrt(-2.0 .*me .*(ee - Vo));
        end
        %
        fprintf('Characteristic Length = 1/k = %g A\n',xo);
        %
        % plot wave function in A units from -5 to 5
        %
        xx = linspace(-5.0,5.0);
        %
        if ee > Vo
            psi = cos(xx ./xo);
        else
            psi = exp(-xx ./xo);
             for i=1:length(xx)
                if xx(i) < 0;
                    psi(i) = 1.0 ./psi(i);
                end;
            end;
        end
        %
        fprintf('Wave Function plotted from x =  %g A to x = %g A\n',xx(1),xx(100));
        %
        iloop = iloop + 1;
        figure(iloop)
        plot(xx,psi);
        title('Electron Wavefunction for 4 eV Electron');
        xlabel('x in Angstroms');  
        ylabel('\psi');
        if ee > Vo
            legend('Oscillatory \psi')
        else
            legend('Exponential \psi')
        end
        %
    end
end
%



