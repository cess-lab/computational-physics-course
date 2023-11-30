% 
% Program to look at evidenc for dark mattr 
% 
clear all;  
help Dark_Matter      % Clear the memory and print header
%
fprintf('Dark Matter is About 1/4 of the Universe by Mass \n')
fprintf('Dark Matter is Inferred from Galactic Rotation Curves \n')
fprintf('Dark Matter is Inferred from Einstein Ring Sizes \n')
fprintf('Dark Matter is Searched for in Scattering Experiments \n')
%
iloop = 0;
%
r = linspace(0, 3);
for i = 1:length(r)
    if r(i) < 1
        v(i) = r(i);
        vdm(i) = r(i);
    else
        v(i) = 1.0 ./sqrt(r(i);
        vdm(i) = r(i);
    end
end
% 
iloop = iloop + 1; 
figure(iloop)
plot(r,v,'-b',r,vdm,':-')
xlabel('visible radius')
ylabel('velocity')
title('Rotation Curve for a Galexy')
%
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        