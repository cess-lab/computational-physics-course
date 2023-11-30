%
% Ray tracing for a thick shperical lense
%
clear all;  
help Spherical_Lense     % Clear the memory and print header
%
% Initialize  
%
fprintf('Lens Radius = 10, Index of Refraction = 1.5 \n ')
fprintf('Lens Makers Equation - 1/f = (n-1)/R \n ')
%
R = 10;
n = 1.5;
%
iloop = 0;
irun = 1;
%
while irun > 0
    kk = menu('Pick Another Shape of the Lense?','Yes','No');
    if kk == 2
        irun = -1;
        break
    end
    if kk == 1
        %
        theta = input('Enter The Angular Size of the Lense in Degrees, < 60: ');
        theta = pi .*theta ./360.0;
        %
        % sagitta and center of the circle forming the lense, center of lense at (0,0)
        % flat face at x=0, wave incident from the left
        %
        s = R .*(1.0 - cos(theta)); % sagitta
        yl = R .*sin(theta); % y boundary of lense
        %
        fprintf('Lense Thickness = %g and 1/2 Height = %g \n ', s , yl)
        %
        % draw the lens
        yd = linspace(-yl,yl,25);
        for i = 1:length(yd)
            xdm(i) = 0;
        end
        xdp = sqrt(R .^2 - yd .^2) -R + s;
        %
        iloop = iloop + 1;
        figure(iloop)
        plot(xdm,yd,'r-',xdp,yd,'r-')
        hold on
        %
        % parallel rays in - impact height b
        %
        b = linspace(-yl,yl,20);
        xdpb = sqrt(R .^2 - b .^2) -R + s; 
        for i = 1:length(b)
            x(1,i) = -R/4;
            y(1,i) = b(i);
            x(2,i) = xdpb(i) ;
            y(2,i) = b(i);
            plot(x(:,i),y(:,i),'b-');  % plot incoming parallel rays
        end
        %
        sinth = b ./R;    % angle of ray w.r.t. normal
        sinthr = n .*sinth;  % refracted angle w.r.t. normal
        phir = asin(sinthr) - asin(sinth);   % angle of refracted ray
        phir = -phir;  % converging
        c = b - tan(phir) .*xdpb;
        fray = (-b + tan(phir) .*xdpb) ./tan(phir);
         for i = 1:length(b)
            x(1,i) = xdpb(i);
            y(1,i) = b(i);
            x(2,i) = fray(i); 
            y(2,i) = 0;
            plot(x(:,i),y(:,i),'b-');  % plot refrated rays to focus @ y = 0
            title('Spherical Lens, Parallel Rays Incident, Focal Aberrations')
            xlabel('x')
            ylabel('y - b')
        end
        %
       hold off
    %
    end
end
%