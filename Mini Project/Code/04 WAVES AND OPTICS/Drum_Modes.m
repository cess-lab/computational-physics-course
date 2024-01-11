%
% Circular Drum - 2d Wave Eq
%
clear all; 
help Drum_Modes;  % Clear memory and print header
%
% Initialize   - find which function to plot
%
fprintf('Circular Drum of Radius r = 1 \n ')
fprintf('Radial Jm(Lmnr), Azimuthal cos(m*phi) \n ')
fprintf(' Temporal, cos(Lnmt), speed = 1, J of type m, with root n \n ')
%
roots = [2.405, 5.520,8.654;3.817,7.016,10.17;5.136,8.417,11.62];
%
irun = 1;
iloop = 0;
%
while irun > 0
    kk = menu('Pick Another Mode, n and m ?','Yes','No');
    if kk == 2
        irun = -1;
        break
    end
    if kk == 1
        %
         m = input('Enter the Bessel Function Jm, m = 0,1,2: ');
         n = input('Enter the Order of the Bessel Root n = 1,2,3: ');
         c = 1; % velocity scaled
         %
         lam = roots(m+1,n);
         t = linspace(0,4.0 .*pi ./lam);
         phi = linspace(0, 2.0 .*pi,20);
         r = linspace(0,1,20);
         for i = 1:length(r)
             drumr(i) = besselj(m,lam .*r(i));
             for j = 1:length(phi)
                drumphi(j) = cos(m .*phi(j));
                xx(i,j) = r(i) .*cos(phi(j)); % drum radius - 1
                yy(i,j) = r(i) .*sin(phi(j));
             end
         end
         %
         iloop = iloop + 1;
         figure(iloop);     % movie of drum head
        %
        for i = 1:length(t)
            drum = cos(lam .*t(i));
            for j = 1:length(r)
                for k = 1:length(phi);
                    DRUM(j,k) = drum .*drumr(j) .*drumphi(k);
                end
            end
            mesh(xx,yy,DRUM)
            title('Movie of Drum')
            xlabel('x')
            ylabel('y')
            axis([-1 1 -1 1 -1 1])
            %
            pause(0.2)
        end
        %
    end
end
%