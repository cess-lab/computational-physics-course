%
% solve 1-d Schroedinger Eq using MATLAB PDE solver, Constant V, well or
% barrier, scattering 
%
function PDE_Sch
clear all; 
help PDE_Sch;  % Clear memory; print header
%
global xm dxo k Vo a
%
% energy in eV units, length in A and time in 10^-15 sec
%
mec2 = 511000.0;  % eV - electron mass
hbarc = 2000.0;   % ev*A 
hbar = 0.666 ; % eVto = 10^-15 sec
%
fprintf('Electron of Energy 5 eV, Scatters off a Potential Vo at (0,a) \n')
fprintf('Initial Wave Packet, <x(0)>, dxo and k, x axis +- 20 A  \n')
%
iloop = 0;
irun = 1;
%
while irun > 0
    kk = menu('Pick Another Wave Packet?','Yes','No');
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
        %dcp = hbarc ./dxo;
        %dee = (dcp .^2) ./(2.0 .*mec2);
        %tau = hbar ./dee;
        %
        %fprintf('tau = %g, Expected Time for Packet Spreading in 10^-15 sec Units: \n ',tau)
        %
        xm = input('Enter Wave Packet Initial Mean Location <x> (A), Grid of +- 20 A: ');
        bet = input('Enter Wave Packet Initial Velocity w.r.t. c, \beta = v/c: ');
        %
        % find wavenumber, energy - free particle
        %
        k = (mec2 .*bet) ./hbarc;
        E = (hbarc .^2) .*k .*k ./(2.0 .*mec2);
        fprintf('k = %g, in 1/A - wave number, E = %g in eV \n',k,E)
        %
        m = 0 ;  % cartesian coords
        x = linspace(-20,20,50);  % grid points in A 
        t = linspace(0,2,100);   % grid points in 10^-15 sec 
        %
        % find the constant potential for this problem
        %
        Vo = input('Enter Potential (eV): ');
        a = input('Enter Range of Potential from x = 0 to x = a(A): ');
        %
        sol = pdepe(m,@Sch_pde,@Sch_ic,@Sch_bc,x,t);   % eq defined, initial coonditions defined and boundary defined
        %
        psixt = sol(:,:,1);
        %
        iloop = iloop + 1;
        figure(iloop)
        %
        maxpsi = max(abs(psixt(1,:)));
        for ii = 1:length(t);
            plot(x,abs(psixt(ii,:)));
            axis([-20, 20, 0, maxpsi]);
            title('Numerical Solution to Schroedinger Eq for Wave Packet')
            xlabel('x(A)');
            ylabel('|\psi(x,t)|,t (10^-^1^5 sec)')
            pause(0.1);
        end
        iloop = iloop + 1;
        figure(iloop)
        plot(x,abs(psixt(1,:)));
        axis([-20, 20, 0, maxpsi]);
        title('Initial Wave Packet')
        xlabel('x(A)');
        ylabel('|\psi(x,t)|,t units(10^-^1^5 sec)')
        %
    end
end
%-------------------------------------------------------------------------------
function [c,f,s] = Sch_pde(x,t,u,DuDx)
%
global xm dxo k Vo a
hbar = 0.666; % units eV,A, 10^-15 sec
mec2 = 511000.0;  % eV - electron mass
hbarc = 2000.0;   % ev*A 
c = j .*hbar;
f = -(hbarc .*hbarc .*DuDx) ./(2.0 .*mec2); % kinetic energy
%s = 0.0;   % free particle
if x < 0 | x > a
    s = 0;
else
    s = Vo .*u; % constant potential energy
end
%
%-------------------------------------------------------------------------------
function u0 = Sch_ic(x,xm,dxo,k)
%
global xm dxo k Vo a
psio = exp(-(x-xm) .^2 ./(4.0 .*dxo .*dxo) + j .*k .*x); % initial min uncertain packet
u0 = psio ./((2.0 .*pi .*dxo .*dxo) .^0.25);
%
%-------------------------------------------------------------------------------
function [pl,ql,pr,qr] = Sch_bc(xl,ul,xr,ur,t)
%
% assume perfect walls at the boundaries, left and right BC on function and first deriv
%
pl=ul;
ql=0.0;
pr=ur;
qr=0.0;
%
%------------------------------------------------------------------------------
%
% now try to solve the Schroedinger eq numerically for the packet with dxo, xm, and k
%