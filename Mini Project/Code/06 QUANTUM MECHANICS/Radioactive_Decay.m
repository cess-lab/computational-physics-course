%
% Program to look at radioactive decays
%
function Radioactive_Decay
%
clear all;
help Radioactive_Decay;  % Clear memory and print header
% 
fprintf(' Monte Carlo Model of Decays Using Random # in MATLAB and Figure Fitting Tools \n');
%
iloop = 0;
irun = 1;
%
while irun > 0
    kk = menu('Pick Another Lifetime (yr)?','Yes','No');
    if kk == 2
        irun = -1;
        break
    end
    if kk == 1
        %
        tau = input('Lifetime in Years: ');
        %
        % generate decays with this lifetime - units years
        %
        b = 1.0 ./tau;
        tmin = 0.0;
        tmax = 10 .*tau;
        %
        for i = 1:1000
            t(i) = log(exp(-b .*tmin)-rand .*(exp(-b .*tmin)-exp(-b .*tmax)));
            t(i) = (-1.0 .*t(i)) ./b;
        end;
        %
        [nd,td] = hist(t,50);
        %
        iloop = iloop + 1;
        figure(iloop)
        semilogy(td,nd,'o')
        hold on
        errorbar(td,nd,sqrt(nd) .*0.99,'o')
        axis([0.0, 5.0 .*tau, 1.0 200.0])
        title('Monte Carlo 1000 Decays - Decay Time')
        xlabel('t(yr)')
        ylabel('# decays')
        hold off
        %
        % now plot the log of the data
        %
        iloop = iloop + 1;
        figure(iloop)
        for i = 1:length(td) - 30
            ndd(i) = nd(i);
            tdd(i) = td(i);
        end  
        ln = log(ndd);
        plot(tdd,ln,'o')
        title('Log of the Decay Histogram Data - Do Linear Fit, MATLAB Fit Tools')
        %
        fprintf(' Slope of Log of decay Histogram ~ 1/tau \n');
        %
    end
end
%