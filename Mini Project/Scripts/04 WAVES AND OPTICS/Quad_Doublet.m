%
% Program to make quadrupole doublet ray trace, thick lense - MATLAB
% fminsearch for solutions such as point to parallel
%
clear all;
help Quad_Doublet;  % Clear memory and print header
% 
%
global Z Type
%
% fits thick lense doublet to
% pt -> pl (1), pl -> pt (2), Pt -> pt (3)
%
% starting values using thin lense
%
fprintf('Incident Beam at z=0, Variable Drift, 5m QF, 5 m Drift, 5m QD, and 7.5 m Outgoing Beam \n');
%
iloop = 0;
irun = 1;
%
while irun > 0
    kk = menu('Pick Another Distance to First Quad','Yes','No');
    if kk == 2
        irun = -1;
        break
    end
    if kk == 1
        zz = input(' Enter Distance from z = 0 to First Quad Entrance: ');
        itype = input(' Enter Constraint,=1,2,3 = point to parallel, parallel to point, point to point: '); 
        %
        [ptpl,plpt,ptpt,x1,x2,x3,x4,x5,y1,y2,y3,y4,y5] = ....
        Thin_Lense(zz+2.5,10.,10.,itype);
        %
        % z boundaries for thick lense - 5 m quads
        %
        Z = [zz, zz+5,zz+10,zz+15,zz+22.5];
        %
        Type = itype;
        %
        if itype == 1
            ao(1) = ptpl(1);
            ao(2) = ptpl(2);
            xo = [0.; 1.0];
            yo = [0.; 1.0];
        end;
        if itype == 2
            ao(1) = plpt(1);
            ao(2) = plpt(2);
            xo = [1.0; 0.0];
            yo = [1.0; 0.0];
        end;
        if itype == 3
            ao(1) = ptpt(1);
            ao(2) = ptpt(2);
            xo = [0.; 1.0];
            yo = [0.; 1.0];
        end;
        %
        fprintf('Thin Lense - Starting Values (m) = %g \n',ao);
        %
        % fit to minimize matrix elements in x and y simultaneously
        %
        a = fminsearch('Doublet_Fit',ao);
        %
        fprintf('Thick Lense - fminsearch solution (m) = %g \n',a);
        %
        % plot the fit
        %
        [zz,xx,yy] = Doublet_Plot(a(1),a(2),Z,xo,yo);
        %
        iloop = iloop + 1;
        figure(iloop)
        xmaxx = max(xx);
        plot(zz,abs(xx),'-',zz,abs(yy),':')
        title('Thick Lense Quad Doublet')
        xlabel('z(m)')
        ylabel('|x|,|y|')
        legend('x','y')
        hold on
        xq(1) = Z(1);
        yq(1) = 0.0;
        xq(2) = Z(1);
        yq(2) = xmaxx;
        plot(xq,yq,'r-');
        xq(1) = Z(2);
        yq(1) = 0.0;
        xq(2) = Z(2);
        yq(2) = xmaxx;
        plot(xq,yq,'r-');
        xq(1) = Z(3);
        yq(1) = 0.0;
        xq(2) = Z(3);
        yq(2) = xmaxx;
        plot(xq,yq,'r-');
        xq(1) = Z(4);
        yq(1) = 0.0;
        xq(2) = Z(4);
        yq(2) = xmaxx;
        plot(xq,yq,'r-');
        %
        hold off
        %
    end
end
%