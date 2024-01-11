%
% Program to Find the Born Approximation to the Scattering Amplitude
%
function qm_BornScatt3
%
clear all;  
help qm_BornScatt3       % Clear the memory and print header
%
% Initialize  - get the potential to be evaluated
%
syms r q A b a V
global qqq itype
%
kk = 1;
iloop = 0;
%
fprintf('Example - 3-d Square Well, r < a \n');
%
V = 1;
A = int(V*r*sin(q*r)/q,r,0,a);
pretty(A)% symbolic solution
%
qq = linspace(0.1,10,50);
a = 1;    % q in 1/a units
for i = 1:length(qq)
    q = qq(i);
    AA(i) = eval(A);
end
%
iloop = iloop + 1;
figure(iloop)
plot(qq,AA,'b-')
title('Square Well, Width a, Born Amplitude')
xlabel('qa')
ylabel('A(q)')
%
fprintf('Example - Coulomb, No e Screening g \n');
%
syms q a V r
V = '1/r';
A = int(V*r*sin(q*r)/q,r);
pretty(A)% symbolic solution
%
fprintf('Example - Coulomb, e Screening \n');
%
V = 'exp(-r/a)/r';
A = int(V*r*sin(q*r)/q,r);
pretty(A)   % symbolic solution
%
a = 1000.0; 
r = 0;
for i = 1:length(qq)
    q = qq(i);
    AA(i) = -eval(A);
    AA(i) = AA(i) ./10.0;
    if AA(i) > 1
        AA(i) = 0;
    end
end
%
iloop = iloop + 1;
figure(iloop)
loglog(qq,AA,'-r')
title('Coulomb Born Amplitude')
xlabel('q ')
ylabel('A(q)')
axis([0.4 ,10, 0.001, 1])
%
iloop = iloop + 1;
while kk == 1
        %
        kk = menu('Another Scattering Amplitude Evaluation?','Yes','No');
        %
        if kk == 2
            break
        end
        %
        itype = menu('Choose Potential','1/r^1/2','1/r','1/r^3/2','1/r^2','1/r^3','e^-a*r/r');
        %
        qq = linspace(0.1,4,20);
        for i=1:length(qq)
            qqq = qq(i);
            AAA(i) = quad(@Born_amp,0.001,100);   % numerical integration in r
        end
        AAA = AAA ./AAA(1);
        % 
        %iloop = iloop + 1;
        figure(iloop)
        semilogy(qq,abs(AAA),'-b');
        title('Born Amplitude as a Function of q'); 
        xlabel('q')
        ylabel('A(q)');
        hold on
end
hold off
%
%------------------------------------------------------------------------------------------------------
        %
function y = Born_amp(x)
%
global qqq itype
%
if itype == 1
 VV = 1.0 ./sqrt(x);
elseif itype == 2
 VV = 1.0 ./x;
elseif itype == 3 
 VV = 1.0 ./sqrt(x .^3);
elseif itype == 4
 VV = 1.0 ./x .^2;
elseif itype == 5
 VV = 1.0 ./x .^3;
elseif itype == 6
 VV = exp(-x) ./x;
end
y =  (VV .*x .*sin(qqq .*x) .*exp(-0.001 .*x)) ./(qqq);
%
% add convergence factor x > 1000
%