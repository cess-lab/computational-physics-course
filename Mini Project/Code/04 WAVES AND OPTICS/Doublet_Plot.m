%
% plot quadruople doublet solutions
%
function[zz,xx,yy] = Doublet_Plot(f1,f2,z,xo,yo)
%
% first quad x F - focal length f1, second x D - f2
% z=1,5 , 1 = quad enter, 2 = exit, 3 = enter 4 = exit, 5=focus
% starting vectors xo, yo
%
global Z Type
%
zz = linspace(0.,z(5));
%
m1=[1.0, z(1); 0.0, 1.0];
x1 = m1 * xo;
y1 = m1 * yo;
%
for i=1:100
   if zz(i) < z(1);
      xx(i) = xo(1) + zz(i) .*xo(2);
      yy(i) = yo(1) + zz(i) .*yo(2);
   end;
   if zz(i) > z(1) & zz(i) < z(2)
      b1=1.0 ./ (0.03 .*f1 .*(zz(i) - z(1)));
      [k,f,phi,my1,mx1]=Quadrupole(b1,1.0,zz(i)-z(1));
      x = mx1 * x1;
      x2 = x;
      xx(i) = x(1);
      y = my1 * y1;
      y2 = y;
      yy(i) = y(1);
   end;
   if zz(i) > z(2) & zz(i) < z(3);
      xx(i) = x2(1) + (zz(i) - z(2)) .*x2(2);
      yy(i) = y2(1) + (zz(i) - z(2)) .*y2(2);
      m2 = [1.0, z(3)-z(2);0., 1.];     
      x3 = m2 * x2;
      y3 = m2 * y2;
   end;
   if zz(i) > z(3) & zz(i) < z(4)
      b2=1.0 ./ (0.03 .*f2 .*(zz(i) - z(3)));
      [k,f,phi,mx2,my2]=Quadrupole(b2,1.0,zz(i)-z(3));
      x = mx2 * x3;
      x4 = x;
      xx(i) = x(1);
      y = my2 * y3;
      y4 = y;
      yy(i) = y(1);
   end;
   if zz(i) > z(4) & zz(i) <= z(5);
      xx(i) = x4(1) + (zz(i) - z(4)) .*x4(2);
      yy(i) = y4(1) + (zz(i) - z(4)) .*y4(2);
      m3 = [1.0, z(5)-z(4);0., 1.];     
      x5 = m3 * x4;
      y5 = m3 * y4;
   end;
   %
end
%
