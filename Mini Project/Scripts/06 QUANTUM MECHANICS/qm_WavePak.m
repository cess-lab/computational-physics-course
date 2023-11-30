%
% Schroedinger Eq. and Uncertainty for Wave Packets
%
clear all;  
help qm_WavePak      % Clear the memory and print header
%
% Initialize  - get the potential to be evaluated
%
% energy in eV units, length in A and time in 10^-15 sec
%
mec2 = 511000.0;  % eV - electron mass
hbarc = 2000.0;   % ev*A 
hbar = 0.666 ; % eVto = 10^-15 sec
c = 3000.0 ; % units A/to
%
iloop = 0;
irun = 1;
%
while irun > 0
    kk = menu('Pick Another Iniitial Wave Packet?','Yes','No');
    if kk == 2
        irun = -1;
        break
    end
    if kk == 1
        %
        % setup minimum uncertainty wave packet
        %
        dxo = input('Enter Wave Packet Spatial Spread dx(0) (A): ');
        %
        % evaluate expected spreading time - dx = dxo(1+(t/tau)^2)
        %
        dcp = hbarc ./dxo;
        dee = (dcp .^2) ./(2.0 .*mec2);
        tau = hbar ./dee;
        %
        fprintf('tau = %g, Expected Time for Packet Spreading in 10^-15 sec Units: \n ',tau)
        %
        xm = input('Enter Wave Packet Initial Mean Location <x> (A): ');
        fprintf('k = 250*beta (A^-1), E = 3.9 k^2 (eV)A^2) \n')
        bet = input('Enter Wave Packet Initial Velocity w.r.t. c, \beta = v/c: ');
        %
        % find wavenumber
        k = (mec2 .*bet) ./hbarc;
        fprintf('k = %g, in 1/A units - wave number \n',k)
        %
        xx = linspace(-5 .*dxo + xm,5 .*dxo + xm);
        psio = exp(-(xx-xm) .^2 ./(4.0 .*dxo .*dxo) + i .*k .*xx);
        psio = psio ./((2.0 .*pi .*dxo .*dxo) .^0.25); % normalize
        %
        iloop = iloop + 1;
        figure(iloop)
        plot(xx,real(psio))
        title('Minimum Uncertainty Wave Packet - (real(\psi(0))')
        xlabel('x(A)')
        ylabel('real(\psio)')
        %
        iloop = iloop + 1;
        figure(iloop)
        plot(xx,(abs(psio) .^2))
        title('Minimum Uncertainty Wave Packet - |\psi(0)|^2')
        xlabel('x(A)')
        ylabel('|\psi(0)|^2')
        %
    end
end
%
