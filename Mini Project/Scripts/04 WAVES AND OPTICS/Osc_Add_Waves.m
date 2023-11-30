%
% Program to study adding 2 waves
%
clear all;
help Osc_Add_Waves;  % Clear memory and print header
% 
fprintf(' Harmonic Oscillation Introduction \n');
fprintf(' T = 1/f,  w = 2*pi*f, Period, Frequency \n');
fprintf(' d2x/dt2 = kx/m, wo^2 = k/m \n');
fprintf(' x = Acos(wot) \n');
fprintf(' Examples: pendulum wo^2 = g/l, circuit = 1/L*C  \n')
fprintf(' Wave Number = k = 2*pi/lambda = w/c, v = f*lambda  \n')
fprintf(' Two Waves phase difference = path difference*2*pi/lambda  \n')
fprintf(' Adding 2 Waves \n');
%
iloop = 0;
irun = 1;
%
while irun > 0
    kk = menu('Pick Another Pair of Waves - Amplitude Ratio?','Yes','No');
    if kk == 2
        irun = -1;
        break
    end
    if kk == 1
        %
        %
        a1_a2 = input('Input the Ratio of the Amplitudes: ');
        %
        delphi = linspace(0,2*pi); % span the phase differences
        I12 = ((a1_a2) .^2 + 1.0 + 2 .*a1_a2 .*cos(delphi));
        %
        iloop = iloop + 1;
        figure(iloop)
        plot(delphi ./pi, I12,'-')
        title(' Intensity of the Interfering Waves ')
        xlabel(' \Delta\phi / \pi')
        ylabel('I_1_2')
        %
        fprintf(' Waves of Equal Amplitude, = 1, and Phase \n');
        %
        r = input('Input the Fractional Difference of the 2 Frequencies = (w1-w2)/(w1+w2): ');
        wt = linspace(0,2.0 .*pi); % factor cos((w1+w2)*t/2) * factor cos((w1-w2)*t/2), w = (w1+w2)/2 - beats
        A = 2.0 .*cos(wt) .*cos(r .*wt);
        %
        iloop = iloop + 1;
        figure(iloop)
        plot(wt ./pi, A,'-')
        title(' Amplitude of the Interfering Waves ')
        xlabel(' (\omega_1+\omega_2)*t/2 / \pi')
        ylabel('A_1_2')
        %
        ratio = linspace(0,20,20);
        %
        for i = 1:20
            AA(i,:) = 2.0 .*cos(wt(:)) .*cos(ratio(i) .*wt(:));
        end
        for i = 1:20
            iloop = iloop + 1;
            figure(iloop)
            plot(wt ./pi, AA(i,:),'-')
            title(' Oscillation with Two Waves, Ratio of Frequencies = (0,20) ')
            xlabel('(\omega_1+\omega_2)*t/2')
            ylabel('A(t)')
            pause(0.5);
        end
    end
end
%