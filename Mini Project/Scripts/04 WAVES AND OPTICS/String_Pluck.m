%
% Use Fourier Decomposition of Plucked String - 1d Wave Eq
%
clear all; 
help String_Pluck;  % Clear memory and print header
%
% Initialize   - find which function
%
fprintf('String Fixed at x = 0, L, Plucked at x = L/2  \n')
fprintf('y =  sumi( bi*sin(wit) * sin(i*pi*x/L) )  \n')
fprintf(' wi = (v*i*pi)/L ), v = sqrt(To/rho)  \n')
%
v = 2 ;
%
L = 1;
%
for i = 1:2:39
    b(i) = (8 .*sin((i .*pi ) ./2.0)) ./(i .*i .*pi .*pi);
    w(i) = (v .*i .*pi) ./L;
end
for i = 2:2:40
    b(i) = 0;    % odd function
    w(i) = 0;
end
%
x = linspace(0,1,40); % L = 1
t = (5 .* linspace(0,1,40)) ./v ;  % time in x/v units
%
for i = 1:length(t)
    for j = 1:length(x)
        y(i,j) = 0;
        for k = 1:length(b)
            y(i,j) = y(i,j) + (b(k) .*cos(w(k) .*t(i)) .*sin(k .*pi .*x(j)));
        end
    end
end
%
iloop = 1;
figure(iloop)
%
for i = 1:length(t)
    plot(x,abs(y(i,:)),'-')
    title('Movie of Plucked String')
    xlabel('x = (0,L), L = 1')
    ylabel('y')
    %
    pause(0.2)
end
%
irun = 1;
%
while irun > 0
    kk = menu('Pick Another Velocity and Pluck Width ?','Yes','No');
    if kk == 2
        irun = -1;
        break
    end
    if kk == 1
        %
         v = input('Enter the Wave Velocity: ');
         d = input('Enter the Half Width of the Pluck Square Wave: ');
         for i = 1:40
            b(i) = (cos((0.5+d) .*i .*pi) - cos((0.5 - d) .*i .*pi)) ./(i .*pi);
            w(i) = (v .*i .*pi) ./L;
         end
         %
         x = linspace(0,1,40); % L = 1
         t = (5 .* linspace(0,1,40)) ./v ;  % time in x/v units
        %
        for i = 1:length(t)
            for j = 1:length(x)
                yp(i,j) = 0;
                for k = 1:length(b)
                    yp(i,j) = yp(i,j) + (b(k) .*cos(w(k) .*t(i)) .*sin(k .*pi .*x(j)));
                end
            end
        end
        %
        iloop = iloop + 1;
        figure(iloop)
        %
        for i = 1:length(t)
            plot(x,abs(yp(i,:)),'-')
            title('Movie of Plucked String')
            xlabel('x = (0,L), L = 1')
            ylabel('y')
            %
            pause(0.2)
        end
        %
    end
end
%