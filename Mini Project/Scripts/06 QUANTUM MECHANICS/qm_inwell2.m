%
% qm_inwell - Particle in a potential well depth Vo, walls at +-a, MATLAB
% tools fminsearch
%
function qm_inwell2
clear all; 
help qm_inwell;  % Clear memory; print header
%
% Initialize variables hbarc= in eV-A units, me in eV
%
global a Vo me hbarc iodd
%
me = 511000.0  ;       % e mass in eV
hbarc = 2000.0 ;       % hbarc in eV*A units
%
fprintf('Particle in a Square Well\n')
%
iloop = 0;
irun = 1;
%
while irun > 0
    kk = menu('Pick Another Well Width and Depth?','Yes','No');
    if kk == 2
        irun = -1;
        break
    end
    if kk == 1
        %
        a = input('Enter Well Width in Angstroms, Walls at +- a : ');
        Vo = input('Enter Well Depth in eV, V=0 Inside,V=Vo Outside : ');
        %
        % find ground state energy for cos, units are eV and A for an electron
        % given a, Vo can solve for electron  energy that matches psi and dpsi/dx at the walls
        % starting value is infinite well but energy reduced by leakage
        %
        koa =  pi ./(2.0 .*a);
        eoa = ((hbarc .*koa) .^2) ./(2.0 .*me);
        e1a = eoa .*4;
        fprintf('Ground State Energy in Inf Box = %g eV \n',eoa);
        fprintf('First Excited State Energy in Inf Box = %g eV \n',e1a);
        iodd = 1;
        eo = fminsearch(@qmwell,eoa-2);
        fprintf('Ground State Energy = %g  eV \n',eo);
        if abs(eo) > Vo
            fprintf('No Ground State Possible')
            break
        end
        iodd = -1;
        e1 = fminsearch(@qmwell,e1a-4);
        fprintf('First Excited State Energy = %g  eV \n',e1);
        if abs(e1) > Vo
            fprintf('No Excited State Possible')
            break
        end
        %
      
        %
        % plot wave function in A units from -a to a
        %
        xx = linspace(-a-1,a+1);
        zz = linspace(-a ./2, a ./2);
        for i=1:100
            Eo(i) = eoa;
            E1(i) = e1a;
            Eoa(i) = eo;
            E1a(i) = e1;
        end
        iloop = iloop + 1;
        figure(iloop)
        plot(zz,Eo,'b-',zz,E1,'b:',zz,Eoa,'r-',zz,E1a,'r:')
        title('Energy of Ground and First Excited State, Infinite and Finite Well')
        ylabel('E(eV)')
        xlabel('x/a')
        hold on
        xxx(1) = xx(1);
        xxx(2) = xx(100);
        yyy(1) = Vo;
        yyy(2) = Vo;
        plot(xxx,yyy,'g-')
        legend(' ', 'Infinite',' ', 'Finite','Vo')
        axis([-a-1, a+1, 0, e1a+2])
        hold off
        %
        xin = hbarc ./sqrt(2.0 .*me .*eo); % inside well length, 1/k
        xout = xin ./sqrt(Vo ./eo - 1.0); % outside well length - tunnel
        %
        % match b.c. at x = a
        %
        b = exp(a ./xout) .*cos(a ./xin);
        %
        for i=1:length(xx)
            if abs(xx(i)) < a
                psi1(i) = cos(xx(i) ./xin);
            elseif xx(i) > 0.0;
                psi1(i) = b .*exp(-xx(i) ./xout);
            elseif xx(i) < 0.0;
                psi1(i) = b .*exp(xx(i) ./xout);
            end
            psi1o(i)= cos(xx(i) .*koa);
            if abs(xx(i)) > a
                psi1o(i) = 0;
            end
        end
        %
        fprintf('Ground State Wave Function plotted from x =  %g A to x = %g A\n',xx(1),xx(100));
        %
        iloop = iloop + 1;
        figure(iloop)
        plot(xx,psi1,'b-',xx,psi1o,'r:');
        title('Electron Wavefunction for Ground State, Inf Well and Square Well');
        xlabel('x in Angstroms');  
        ylabel('\psi');
        legend('Square','Inf')
        %
    end
%
end
%
function QM = qmwell(eo)
%
% finds non-linear solution for 1-D well, of width a, height Vo
%
global a Vo me hbarc iodd
%
if iodd > 0
    QM = abs(tan((a .*sqrt(2.0 .*me .*eo)) ./hbarc)-sqrt(Vo ./eo - 1.0));
else
    QM = abs(cot((a .*sqrt(2.0 .*me .*eo)) ./hbarc)+sqrt(Vo ./eo - 1.0));
end
%
   



