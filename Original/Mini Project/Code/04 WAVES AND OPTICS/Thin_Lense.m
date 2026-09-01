%
% thin lense approx for doublets - starting values for fits
%
function[fpttpl,fpltpt,fpttpt,x1,x2,x3,x4,x5,y1,y2,y3,y4,y5] = ....
   Thin_Lense(L,l,Lo,itype)
%
% thin lense values for  D and F focal length
% x is DF, y is FD,f(1) is first quad focal length, f(2) is second
%
fpttpl(1) = L .*sqrt(l ./(L + l)) ;
fpttpl(2) = (l .*L) ./fpttpl(1);
fpltpt(1) = sqrt(l .*(l + Lo));
fpltpt(2) = (l .*Lo) ./fpltpt(1);
c = L + l + Lo;
fpttpt(1) = L .*sqrt((l .*(l+Lo)) ./((l+L) .*c));
fpttpt(2) = (l .*L .*Lo) ./(c .*fpttpt(1));
%
if itype == 1
   f1 = fpttpl(1);
   f2 = fpttpl(2);
   xo = [0.;1.];
end;
if itype == 2
   f1 = fpltpt(1);
   f2 = fpltpt(2);
   xo = [1.;0.];
end;
if itype == 3
   f1 = fpttpt(1);
   f2 = fpttpt(2);
   xo = [0;1];
end;
%
% x position and angle matrices
%
m1 = [1., L; 0., 1.];
m2 = [1., L;1.0 ./f1  ,1.0+L ./f1];
m3 = [1.0 + l ./f1 , L + l + (L .*l) ./f1;1.0 ./f1, 1.0 + L ./f1];
m4(1,1) = m3(1,1);
m4(1,2) = m3(1,2);
m4(2,1) = -l ./(f1 .*f2) + 1.0 ./f1 - 1.0 ./f2;
m4(2,2) = 1.0 + L ./f1 - (L + l) ./f2 - (L .*l) ./(f1 .*f2);
m5(2,1) = m4(2,1);
m5(2,2) = m4(2,2);
m5(1,1) = 1.0 + l ./f1 - Lo ./f2 -(Lo .*l) ./(f1 .*f2) + Lo ./f1;
m5(1,2)= l+L+Lo +(L .*(Lo+l)) ./f1 - (l .*L .*Lo) ./(f1 .*f2)-(Lo .*(L + l)) ./f2;
%
x1 = m1 * xo;
x2 = m2 * xo;
x3 = m3 * xo;
x4 = m4 * xo;
x5 = m5 * xo;
%
% now the y vectors
%
f1 = -f1;
f2 = -f2;
m1 = [1., L; 0., 1.];
m2 = [1., L;1.0 ./f1  ,1.0+L ./f1];
m3 = [1.0 + l ./f1 , L + l + (L .*l) ./f1;1.0 ./f1, 1.0 + L ./f1];
m4(1,1) = m3(1,1);
m4(1,2) = m3(1,2);
m4(2,1) = -l ./(f1 .*f2) + 1.0 ./f1 - 1.0 ./f2;
m4(2,2) = 1.0 + L ./f1 - (L + l) ./f2 - (L .*l) ./(f1 .*f2);
m5(2,1) = m4(2,1);
m5(2,2) = m4(2,2);
m5(1,1) = 1.0 + l ./f1 - Lo ./f2 -(Lo .*l) ./(f1 .*f2) + Lo ./f1;
m5(1,2)= l+L+Lo +(L .*(Lo+l)) ./f1 - (l .*L .*Lo) ./(f1 .*f2)-(Lo .*(L + l)) ./f2;
%
y1 = m1 * xo;
y2 = m2 * xo;
y3 = m3 * xo;
y4 = m4 * xo;
y5 = m5 * xo;
%