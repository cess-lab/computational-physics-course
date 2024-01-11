%
% finds quadrupole matrix elements - F and D
%
function[k,f,phi,mx,my] = Quadrupole(bpr,p,l)
%
% gradient bpr (kG/m), momentum p(GeV), quad length l(m)
%
% find k in m^-2
%
k = (0.03 .*bpr) ./p;
%
% find f ~ 1/kl
%
f = 1.0 ./(k .*l);
%
% find phase angle = sqrt(k)l
%
phi = sqrt(k) .*l;
%
mx(1,1) = cos(phi);
mx(2,2) = cos(phi);
mx(1,2) = sin(phi) ./sqrt(k);
mx(2,1) = -sqrt(k) .*sin(phi);
my(1,1) = cosh(phi);
my(2,2) = cosh(phi);
my(1,2) = sinh(phi) ./sqrt(k);
my(2,1) = sqrt(k) .*sinh(phi);
%
end
%
