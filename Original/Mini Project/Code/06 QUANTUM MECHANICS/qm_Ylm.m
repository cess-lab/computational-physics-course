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
figure(1)
plot(xx10,zz10,xx11,zz11,':');
title(' Contour of Y1m ');
legend('Y10','Y11');
xlabel('x')
ylabel('z')
%
figure(2)
plot(xx20,zz20,xx21,zz21,':',xx22,zz22,'-.');
title(' Contour of Y2m ');
legend('Y20','Y21','Y22');
xlabel('x')
ylabel('z')
%