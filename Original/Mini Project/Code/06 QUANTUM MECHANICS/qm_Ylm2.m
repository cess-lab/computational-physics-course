%
% plot 3-d constant surface. Contour and surf for 2-d
%
clear all;    
help qm_Ylm
%
% try 2-d representation of Yl,m - ignore phi dependence
%
th = linspace(0,180,90);
thr = (th .*2 .*pi) ./360.0;
ct = cos(thr);
st = sin(thr);
%
Y10 = ct;
R = abs(Y10);
zz10 = R .*ct;
xx10 = R .*st;
Y11 = st;
R = abs(Y11);
zz11 = R .*ct;
xx11 = R .*st;
%
Y20 = 1.5 .*Y10 .*Y10 - 0.5;
Y21 = Y11 .*Y10;
Y22 = Y11 .*Y11;
R = abs(Y20);
zz20 = R .*ct;
xx20 = R .*st;
R = abs(Y21);
zz21 = R .*ct;
xx21 = R .*st;
R = abs(Y22);
zz22 = R .*ct;
xx22 = R .*st;
%
% contour of constant Ylm
% 
iloop = 0;
iloop = iloop + 1;
figure(iloop)
plot(xx10,zz10,xx11,zz11,':');
title(' Contour of Y1m ');
legend('Y10','Y11');
xlabel('x')
ylabel('z')
%
iloop = iloop + 1;
figure(iloop)
plot(xx20,zz20,xx21,zz21,':',xx22,zz22,'-.');
title(' Contour of Y2m ');
legend('Y20','Y21','Y22');
xlabel('x')
ylabel('z')
%
% now look at 3-d surface and phi dependence
%
imax = 50;
jmax = 50;
th = pi*[0:1:imax] ./imax;
ph = 2.0*pi*[0:1:jmax] ./jmax;
%
% theta and phi locate the point direction - r the length
%
       for i = 1:imax
           for j = 1:jmax
               r0 = 1; % isotropic Y00
               if r0 < 0.0 
                   r0 = -r0;
               end
               r10 = cos(th(i)); % Y10
               if r10 < 0.0 
                   r10 = -r10;
               end
               r11 = sin(th(i)) .*sin(ph(j)); % Y11
               if r11 < 0.0 
                   r11 = -r11;
               end
               r20 = 3.0 .*((cos(th(i))) .^2) - 1.0; % Y20
               if r20 < 0.0 
                   r20 = -r20;
               end
               r21 = sin(th(i)) .*cos(th(i)) .*cos(ph(j)); % Y21
               if r21 < 0.0 
                   r21 = -r21;
               end
               r22 = (sin(th(i)) .^2) .*sin(2.0 .*ph(j));  % Y22
               if r22 < 0.0 
                   r22 = -r22;
               end
               %
               x0(i,j) = r0 .*sin(th(i)) .*cos(ph(j));
               y0(i,j) = r0 .*sin(th(i)) .*sin(ph(j));
               z0(i,j) = r0 .*cos(th(i));
               x10(i,j) = r10 .*sin(th(i)) .*cos(ph(j));
               y10(i,j) = r10 .*sin(th(i)) .*sin(ph(j));
               z10(i,j) = r10 .*cos(th(i));
               x11(i,j) = r11 .*sin(th(i)) .*cos(ph(j));
               y11(i,j) = r11 .*sin(th(i)) .*sin(ph(j));
               z11(i,j) = r11 .*cos(th(i));
               x20(i,j) = r20 .*sin(th(i)) .*cos(ph(j));
               y20(i,j) = r20 .*sin(th(i)) .*sin(ph(j));
               z20(i,j) = r20 .*cos(th(i));
               x21(i,j) = r21 .*sin(th(i)) .*cos(ph(j));
               y21(i,j) = r21 .*sin(th(i)) .*sin(ph(j));
               z21(i,j) = r21 .*cos(th(i));
               x22(i,j) = r22 .*sin(th(i)) .*cos(ph(j));
               y22(i,j) = r22 .*sin(th(i)) .*sin(ph(j));
               z22(i,j) = r22 .*cos(th(i));
           end
       end
       %
iloop  = iloop +1;
figure(iloop)
surf(x0,y0,z0)
xlabel('x')
ylabel('y')
zlabel('z')
title('Y^0_0')
axis square
iloop  = iloop +1;
figure(iloop)
surf(x10,y10,z10)
xlabel('x')
ylabel('y')
zlabel('z')
title('Y^1_0')
axis square
iloop  = iloop +1;
figure(iloop)
surf(x11,y11,z11)
xlabel('x')
ylabel('y')
zlabel('z')
title('Y^1_1')
axis square
iloop  = iloop +1;
figure(iloop)
surf(x20,y20,z20)
xlabel('x')
ylabel('y')
zlabel('z')
title('Y^2_0')
axis square
iloop  = iloop +1;
figure(iloop)
surf(x21,y21,z21)
xlabel('x')
ylabel('y')
zlabel('z')
title('Y^2_1')
axis square
iloop  = iloop +1;
figure(iloop)
surf(x22,y22,z22)
xlabel('x')
ylabel('y')
zlabel('z')
title('Y^2_2')
axis square
%