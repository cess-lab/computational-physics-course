%
% Program to evaluate edge, long 1-d slit, 2-d aperture diffraction pattern
% MATLAB Fresnel functions
% 
clear all;  
help Edge_diffract    % Clear the memory and print header
%
fprintf(' Absorbing Screen Covers Lower 1/2 Plane y < 0, all x \n ')
fprintf(' Long Slit of Width h, Observed Diffration at zo \n ')
fprintf(' Square Aperture of Width h  Observed Diffration at zo \n ')
%
fprintf(' Observe at zo Distance Behind Screen/Slit/Aperture \n')
fprintf(' Fresnel is Near Zone with zo ~ lambda \n')
%
iloop = 0;
irun = 1;
%
while irun > 0
    kk = menu('Pick Another zo Observation Point ?','Yes','No');
    if kk == 2
        irun = -1;
        break
    end
    if kk == 1
        %
        zo = input('Enter zo in Wavelength Units: ');
        %
        % variable is y in units of wavelength
        %
        ll = menu('Diffraction From ?','Edge','Slit - 1d', 'Aperture 2-d');
        %
        if ll == 1
            yo = linspace(-10,10);
            %
            w = yo .*sqrt(2.0 ./zo);
            %
            C = mfun('FresnelC',w);
            S = mfun('FresnelS',w);
            I = (C + 0.5) .^2 + (S + 0.5) .^2;
            %
            iloop = iloop + 1;
            figure(iloop)
            plot(yo,I)
            xlabel('y/\lambda')
            ylabel('Intensity = I/Io')
            title(' Edge Diffracted Intensity at Distance zo/\lambda')
            %
        end
        %
        if ll == 2
            %
            h = input('Enter Slit Width in Wavelength Units: ');
            yo = linspace(-10,10);
            %
            w1 = (yo - h ./2.0) .*sqrt(2.0 ./zo);
            w2 = (yo + h ./2.0) .*sqrt(2.0 ./zo);
            %
            C1 = mfun('FresnelC',w1);
            C2 = mfun('FresnelC',w2);
            S1 = mfun('FresnelS',w1);
            S2 = mfun('FresnelS',w2);
            I = ((C1 - C2) .^2 + (S1 - S2) .^2) ./2.0;
            %
            iloop = iloop + 1;
            figure(iloop)
            plot(yo,I)
            xlabel('y/\lambda')
            ylabel('Intensity = I/Io')
            title(' Slit Diffracted Intensity at Distance zo/\lambda')
            %
        end
        if ll == 3
            %
            h = input('Enter Square Slit Width in Wavelength Units: ');
            yo = linspace(-10,10,40);
            xo = linspace(-10,10,40);
            %
            w1 = (yo - h ./2.0) .*sqrt(2.0 ./zo);
            w2 = (yo + h ./2.0) .*sqrt(2.0 ./zo);
            v1 = (xo - h ./2.0) .*sqrt(2.0 ./zo);
            v2 = (xo + h ./2.0) .*sqrt(2.0 ./zo);
            %
            C1 = mfun('FresnelC',w1);
            C2 = mfun('FresnelC',w2);
            S1 = mfun('FresnelS',w1);
            S2 = mfun('FresnelS',w2);
            CC1 = mfun('FresnelC',v1);
            CC2 = mfun('FresnelC',v2);
            SS1 = mfun('FresnelS',v1);
            SS2 = mfun('FresnelS',v2);
            for i = 1:length(yo)
                for j = 1:length(xo)
                    I(i,j) = ((C1(i) - C2(i)) .^2 + (S1(i) - S2(i)) .^2) ./2.0;
                    I(i,j) = I(i,j) .*((CC1(j) - CC2(j)) .^2 + (SS1(j) - SS2(j)) .^2) ./2.0;
                end
            end
            %
            iloop = iloop + 1;
            figure(iloop)
            meshc(xo,yo,I')
            xlabel('y/\lambda')
            ylabel('x/\lambda')
            title(' Square Aperture Diffracted Intensity at Distance zo/\lambda')
            %
        end
        %
    end
end
    iloop = iloop + 1;
    figure(iloop)
    for i = 1:20
            zo = 5;
            h = i;
            yo = linspace(-10,10);
            %
            w1 = (yo - h ./2.0) .*sqrt(2.0 ./zo);
            w2 = (yo + h ./2.0) .*sqrt(2.0 ./zo);
            %
            C1 = mfun('FresnelC',w1);
            C2 = mfun('FresnelC',w2);
            S1 = mfun('FresnelS',w1);
            S2 = mfun('FresnelS',w2);
            I = ((C1 - C2) .^2 + (S1 - S2) .^2) ./2.0;
            %    
            plot(yo,I)
            xlabel('y/\lambda')
            ylabel('Intensity = I/Io')
            title(' Slit Diffracted Intensity at Distance zo/\lambda = 5 for h from 1 to 20')
            pause(0.2)
            %
    end
%