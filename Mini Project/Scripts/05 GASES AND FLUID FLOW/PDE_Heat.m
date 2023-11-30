%
% solve 1-d Diffusion Eq using MATLAB PDE solver
%
function PDE_Heat
clear all; 
help PDE_Heat;  % Clear memory; print header
global itype k
%
% Temperature in C deg, x in cm and t in sec
%
k = 2 ;  % thermal conductivity in area/time  or cm^2/sec
fprintf('k = %g, Thermal Conductivity, length^2/time: \n ',k)
%
% setup initial Temp distribution as a function of x
%
iloop = 0;
irun = 1;
%
while irun > 0
    kk = menu('Another Initial Temperature Distribution?','Yes','No');
    if kk == 2
        irun = -1;
        break
    end
    if kk == 1
        itype = menu('Temperature Distribution','delta','rectangular', 'triangular' ,'tri-ears ');
        %
        m = 0 ;  % cartesian coords
        x = linspace(-20,20,80);  % grid points incm 
        t = linspace(0,2,100);   % grid points in sec 
        %
        % find the constant potential for this problem
        %
        sol = pdepe(m,@Heat_pde,@Heat_ic,@Heat_bc,x,t);   % eq defined, initial coonditions defined and boundary defined
        %
        psixt = abs(sol(:,:,1));
        %
        iloop = iloop + 1;
        figure(iloop)
        %
        for ii = 1:length(t);
            plot(x,abs(psixt(ii,:)));
            title('Numerical Solution to Heat Eq')
            xlabel('x(cm)');
            ylabel('Temp(x,t), C^o ,t(sec)')
            maxs = max(abs(psixt(1,:)));
            axis([-20 20 0 maxs])
            pause(0.2);
        end
        iloop = iloop + 1;
        figure(iloop)
        plot(x,abs(psixt(1,:)));
        title('Initial/Final Temperature Distribution, C^o')
        xlabel('xcm)');
        ylabel('Temp(x,0), C^o, tsec)')
        %
        hold on
        plot(x,abs(psixt(length(t),:)),'r:');
        hold off
    end
end
%
%-------------------------------------------------------------------------------
function [c,f,s] = Heat_pde(x,t,u,DuDx)
global itype k
%
c = 1;
f = k .*DuDx;
s = 0;
%
%-------------------------------------------------------------------------------
function u0 = Heat_ic(x)
%
global itype k
for ii = 1:length(x)
    u0(ii) = 0;
end
if itype == 1
    for ii = 1:length(x)
        if abs(x(ii)) < 0.3 
            u0(ii) = 100;
        end
    end
end
if itype == 2
    for ii = 1:length(x)
        if abs(x(ii)) < 5
            u0(ii) = 10;
        end
    end
end
if itype == 3
    for ii = 1:length(x)
        if abs(x(ii)) < 5
            if x(ii) < 0
                u0(ii) = abs(x+5);
            else
                u0(ii) = abs(x-5);
            end
        end
    end
end
if itype == 4
    for ii = 1:length(x)
        if abs(x(ii)) < 5
            u0(ii) = abs(x);
        end
    end
end
%
%-------------------------------------------------------------------------------
function [pl,ql,pr,qr] = Heat_bc(xl,ul,xr,ur,t)
%
% assume perfect walls at the boundaries, left and right BC on function and first deriv
%
pl=ul;
ql=0.0;
pr=ur;
qr=0.0;
%
%------------------------------------------------------------------------------