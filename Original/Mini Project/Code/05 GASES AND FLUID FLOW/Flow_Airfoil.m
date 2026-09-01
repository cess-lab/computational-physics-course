%
% Flow_Airfoil - incompressible and irrotational flow 2-D - stationary streamlines and velocity
% Joukowsky profiles
%
clear all;
help Flow_Airfoil;  % Clear memory and print header
%
% Initialize parameters, x,y grid, and potential psi
% real part of psi is velocity potential, imag part is stream function, v is del(psi)
%
x = linspace(-2, 2, 20);
y = linspace(-2, 2, 20);
%
psi = zeros(20,20);
%
for ii=1:length(x)
    for jj = 1:length(y)
        z(ii,jj) = x(ii) + i .*y(jj); 
    end
end
%
iloop = 0;
irun = 1;
%
while irun > 0
    kk = menu('Another Airfoil?','Yes','No');
    if kk == 2
        irun = -1;
        break
    end
    if kk == 1
        %
        % try airfoil, input radius
        %
        ra = input('Enter Airfoil parameter (0,1) - radius: ');
        alf = input('Enter Angle of Attack for the Airfoil (deg): ');
        alf = (alf) ./(360 ./60);
        %
        kkk = exp(-j .*alf);  % parameter for angle of attack
        %
        eta = z  + sqrt(z .^2 - 1.0) ; % map airfoil to off center circle - root set by condition psi ~ a * z at large z
        p = (kkk .*(eta + ra)) ./(1.0 + ra); % map off axis circle, radius 1+a to unit circle
        psi = (p + 1.0 ./p);  % map unit circle to uniform flow, slit z = +1 to -1
        for ii = 1:length(x)
            for jj = 1:length(y)
                if abs(p(ii,jj)) < 1
                    psi(ii,jj) = 0.0;
                end
            end
        end
        etap = z  - sqrt(z .^2 - 1.0);
        pp = (kkk .*(etap + ra)) ./(1.0 + ra); % map off axis circle, radius 1+a to unit circle
        psi2 = (pp + 1.0 ./pp); 
        for ii = 1:length(x)
            for jj = 1:length(y)
                if abs(pp(ii,jj)) < 1
                    psi2(ii,jj) = 0.0;
                end
            end
        end
        %
        iloop = iloop + 1;
        figure(iloop)
        psij = ( psi+psi2);
        contour(x,y,imag(psij'),50);
        title('Streamlines for Joukowski Profile Airfoil')
        %
        % use gradient now for the velocity computation
        %
        iloop = iloop + 1;
        figure(iloop)
        [vx,vy]=gradient(real(psij'),x(2)-x(1),y(2)-y(1));
        meshc(x,y,vx)
        title('x Velocity Vector For the Airfoil')
        %
        iloop = iloop + 1;
        figure(iloop)
        meshc(x,y,vy)
        title('y Velocity Vector For the Airfoil')
        %
        iloop = iloop + 1;
        figure(iloop)
        quiver(-vx,-vy)
        title('Velocity Vector of the Airfoil')
        %
    end
end
%