%
% solve 1-d Schroedinger Eq using MATLAB PDE solver, Constant V, well or
% SHO, bound states  
%
function PDE_Sch_Well_SHO
clear all; 
help PDE_Sch_Well_SHO;  % Clear memory; print header
%
global xm dxo k Vo a ll
%
% energy in eV units, length in A and time in 10^-15 sec
%
mec2 = 511000.0;  % eV - electron mass
hbarc = 2000.0;   % ev*A 
%
fprintf('Electron of Energy 5 eV, Bound in a Potential Vo > 5 eV Outside (-a,a) Where V = 0 \n')
fprintf('Initial Wave Packet, Centered at x = 0, grid +- 20 A in x \n')
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
        xm = 0.0;  % start in center of well
        % 
        fprintf('k = 250*beta (A^-1), E = 3.9 k^2 (eV)A^2) \n')
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
        t = linspace(0,1,100);   % grid points in 10^-15 sec 
        %
        % find the constant potential for this problem, or take SHO
        % potential, V = x^2
        %
        ll = menu('Pick the Potential','Vo','SHO');
        if ll == 1
                Vo = input('Enter Potential (eV): ');
                a = input('Enter Range of Potential for |x| > a(A): ');
        end
        if ll == 2
                a = input('Enter SHO V = k*x*x, k = : ');
        end
        %
        sol = pdepe(m,@Sch_pde,@Sch_ic,@Sch_bc,x,t);   % eq defined, initial coonditions defined and boundary defined
        %
        psixt = sol(:,:,1);
        %
        iloop = iloop + 1;
        figure(iloop)
        maxpsi = max(abs(psixt(1,:)));
        figure(iloop)
        plot(x,abs(psixt(1,:)));
        axis([-20, 20 ,0 ,maxpsi])
        title('Initial Wave Packet')
        xlabel('x(A)');
        ylabel('|\psi(x,t)|,t units(10^-^1^5 sec)') 
        %
        iloop = iloop + 1;
        figure(iloop)
        for ii = 1:length(t);
            plot(x,abs(psixt(ii,:)));
            axis([-20, 20, 0, maxpsi])
            title('Numerical Solution to Schroedinger Eq for Wave Packet')
            xlabel('x(A)');
            ylabel('|\psi(x,t)|,t units(10^-^1^5 sec)')
            pause(0.1);
        end
        %
    end
end
%-------------------------------------------------------------------------------
function [c,f,s] = Sch_pde(x,t,u,DuDx)
%
global xm dxo k Vo a ll
hbar = 0.666; % units eV,A, 10^-15 sec
mec2 = 511000.0;  % eV - electron mass
hbarc = 2000.0;   % ev*A 
c = j .*hbar;
f = -(hbarc .*hbarc .*DuDx) ./(2.0 .*mec2); % kinetic energy
s = 0.0;   % free particle
if abs(x) > a & ll == 1;   % constant potential
    s = Vo .*u;
end
if ll == 2
    s = a .*x .*x .*u;   % SHO potential
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
pl = ul;
ql = 0.0;
pr = ur;
qr = 0.0;
%
%------------------------------------------------------------------------------
%
% now try to solve the Schroedinger eq numerically for the packet with dxo, xm, and k
%