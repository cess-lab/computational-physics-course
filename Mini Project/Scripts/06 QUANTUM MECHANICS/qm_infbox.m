%
% qm_infbox - Particle in an infinitely high box, walls at +-a
%           
clear all; 
help qm_infbox;  % Clear memory; print header
%
% Initialize variables hbarc= in eV-A units, me in eV
%
me = 511000.0  ;       % e mass in eV
hbarc = 2000.0 ;       % hbarc in eV*A units
%
fprintf('Quantum Electron in a Very Deep Box\n')
%
iloop = 0;
irun = 1;
%
while irun > 0
    kk = menu('Pick Another Box Width ','Yes','No');
    if kk == 2
        irun = -1;
        break
    end
    if kk == 1
        %
        a = input('Enter Box Width in Angstroms, Walls at +- a : ');
        %
        % find ground state energy for cos, units are eV and A for an electron
        %
        xo = (2.0 .*a) ./pi;
        eo = ((hbarc ./xo) .^2) ./(2.0 .*me);
        %
        fprintf('Ground State Energy = %g eV for Electron in Box of 1/2 Width = %g A\n',eo,a);
        %
        % plot wave function in A units usinh a width
        %
        xx = linspace(-1.5 .*a,1.5 .*a);
        %
        psi1 = cos(xx ./xo);
        psi2 = sin((2.0 .*xx) ./xo);
        psi3 = cos((3.0 .*xx)./xo);
        for i=1:length(xx)
            if abs(xx(i)) > a
                psi1(i) = 0.;
                psi2(i) = 0.;
                psi3(i) = 0.;
            end
        end
        %
        fprintf('Wave Functions plotted from x =  %g A to x = %g A\n',xx(1),xx(100));
        %
        iloop = iloop + 1;
        figure(iloop)
        %
        plot(xx,psi1,'b-',xx,psi2,'r:',xx,psi3,'g-.');
        title('Electron Wavefunctions for 3 Lowest Energy States');
        xlabel('x in Angstroms');  
        ylabel('\psi');
        legend(' n=1',' n=2',' n=3')
        %
    end
end
%

   



