%
% Program to Find B Field Inside Mu Metal Shield
%
clear all; help Magnetic_Shield;  % Clear memory and print header
%
fprintf('Magnetic Shielding - Using Sphere with High mu Value \n')
%
iloop = 0;
irun = 1;
%
while irun > 0
    kk = menu('Pick Another Sphere Mu and Thickness','Yes','No');
    if kk == 2
        irun = -1;
        break
    end
    if kk == 1
        %
        b = input(' Enter Radius of Outer Shell / Inner Shell > 1: ');
        %
        fprintf('External B Field Along z Axis. Spherical Coordinates \n');
        %
        fprintf('Magnetic Potential = -Bo*z Far From the Sphere, Take Bo = 1 \n');
        %
        % take inner shell radius a = 1
        %
        zz = linspace(-3, 3,30 );
        yy = linspace(-3, 3, 30);
        %
        mu = input(' Enter Magnetic Permeability u > 1: ');
        fprintf('Field Inside the Sphere is Reduced by a Factor ~ 9/2*u if b^3 >> 1 \n')
        %
        % exact solutions - Jackson, a = 1 and Bo = 1
        %
        xu = (2.0 .*mu + 1.0) .* (mu + 2.0) -( 2.0 .*((mu - 1.0) .^2)) ./(b .^3);
        alf = ((2.0 .*mu + 1.0) .*(mu - 1.0) .*(b .^3 - 1.0)) ./xu;
        del = (9.0 .*mu) ./xu;
        bet = (del .*(2.0 .*mu - 1.0)) ./mu;
        gam =  (del .*(1.0 - mu)) ./mu;
        %
        for i = 1:length(zz);
            for j = 1:length(yy)
                r = sqrt(zz(i) .^2 + yy(j) .^2);
                ct = zz(i) ./r;
                if r > b
                    phib(i,j) = -r .*ct + (alf .*ct) ./(r .^2); 
                end
                if  r < 1
                    phib(i,j) = (del .*r .*ct);
                end
                if r < b & r > 1
                    phib(i,j) = (bet .*r .*ct) + (gam .*ct) ./(r .^2);
                end
            end
        end
        %
        % points for the circles - plots
        x1 = linspace(-1,1);
        y1 = sqrt(1 - x1 .^2);
        x2 = linspace(-b,b);
        y2 = sqrt(b .^2 - x2 .^2);
        %
        iloop = iloop + 1;
        figure(iloop)
        contour(zz,yy,phib,60);
        title('Magnetic Equipotentials ')
        xlabel('zz')
        ylabel('yy')
        hold on
        plot(x1,y1,'r-',x1,-y1,'r-',x2,y2,'g-',x2,-y2,'g-')
        hold off
        %
        iloop = iloop + 1;
        figure(iloop)
        [bz,by] = gradient(phib');
        quiver(zz,yy,bz,by);
        title('Magnetic Fields ')
        xlabel('zz')
        ylabel('yy')
        hold on
        plot(x1,y1,'r-',x1,-y1,'r-',x2,y2,'g-',x2,-y2,'g-')
        hold off
        %
        iloop = iloop + 1;
        figure(iloop)
        contour(zz,yy,bz)
        title('Bz Contour')
        xlabel('zz')
        ylabel('yy')
        hold on
        plot(x1,y1,'r-',x1,-y1,'r-',x2,y2,'g-',x2,-y2,'g-')
        hold off
        %
        iloop = iloop + 1;
        figure(iloop)
        contour(zz,yy,by)
        title('By Contour')
        xlabel('zz')
        ylabel('yy')
        hold on
        plot(x1,y1,'r-',x1,-y1,'r-',x2,y2,'g-',x2,-y2,'g-')
        hold off
        %
    end
end
%
