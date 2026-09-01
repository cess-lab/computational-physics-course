%
% fit for quadruople doublet thick lense
%
function[matr] = Doublet_Fit(a)
%
global Z Type
% TYpe, = 1 is point to par, 2 = par to point, 3 = point to point
% Z(1-5) is the 5 z boundaries
% a(1-2) are the 2 focal lengths
%
m1=[1.0, Z(1); 0.0, 1.0];
b1=1.0 ./ (0.03 .*a(1) .*(Z(2) - Z(1)));
[k,f,phi,mmy1,mmx1]=Quadrupole(b1,1.0,Z(2)-Z(1));
mx2 = mmx1 * m1;
my2 = mmy1 * m1;
m2 = [1.0, Z(3)-Z(2);0., 1.];     
mx3 = m2 * mx2;
my3 = m2 * my2;
b2=1.0 ./ (0.03 .*a(2) .*(Z(4) - Z(3)));
[k,f,phi,mmx2,mmy2]=Quadrupole(b2,1.0,Z(4)-Z(3));
mx4 = mmx2 * mx3;
my4 = mmy2 * my3;
m3 = [1.0, Z(5)-Z(4);0., 1.];     
mx5 = m3 * mx4;
my5 = m3 * my4;
%
if Type == 1
   matr = abs(mx5(2,2))+abs(my5(2,2));
end;
if Type == 2
   matr = abs(mx5(1,1))+abs(my5(1,1));
end;
if Type == 3
   matr = abs(mx5(1,2))+abs(my5(1,2));
end;
%
end
%
