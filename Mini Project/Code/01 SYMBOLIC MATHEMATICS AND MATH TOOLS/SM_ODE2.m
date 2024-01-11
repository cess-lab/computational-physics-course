
% Symbolic Math - Simple Ordinary Diffferential Equations, Up to Second Order
%
clear all;  
help SM_ODE2      % Clear the memory and print header
%
% Initialize  
%
syms  a b c d n x y Y N k m g v re vo yy fsol t
%
fprintf('Symbolic Math ODE - a Few Solvable Examples \n ')
%
irun = 1;
%
while irun > 0
    %
    krun = menu('Another Diff Eq?','Yes','No');
    if krun == 2
        irun = -1;
        break
    end
    if krun == 1;
        def = menu('Type','Simple Harmonic','Gravity','Gravity with Dissipation','Free Particle, Friction');
         %
        if def == 1
            y = dsolve('D2x = -k*x/m','x(0) = 1','Dx(0) = 0');
            yy = simple(y);
            pretty(yy)
            fprintf('x(t) for x(0)=1, Dx(0) = 0, t in units of 1/w, w^2 = k/m \n ')
        end
        if def == 2
            y = dsolve('D2x = -g','x(0) = 0','Dx(0) = 0');
            yy = simple(y);
            pretty(yy)
            fprintf('x(t) for x(0) = 0, Dx(0) = 0, free fall in uniform gravity field \n ')
        end
        if def == 3
            y = dsolve('D2x = -g - k*Dx','x(0) = 0','Dx(0) = 0');
            yy = simple(y);
            pretty(yy)
            fprintf('x(t) for x(0)=0, Dx(0) = 0, free fall in uniform gravity field, velocity force k \n ')
            fprintf('Taylor Expansion of x \n ')
            yy = taylor(y,t,0,'Order',5);
            pretty(yy)
            fprintf('v(t) \n ')
            yy = diff(y,'t');
            pretty(yy)
        end
        if def == 4
            y = dsolve('D2x = -k*Dx','x(0) = 0','Dx(0) = vo');
            yy = simple(y);
            pretty(yy)
            fprintf('x(t) with x(0)=0, Dx(0) = vo, Free particle With Friction \n ')
            fprintf('v(t)')
            y = diff(y,'t');
            yy = simple(y);
            pretty(yy)
         end
    %    
    end
end
 fprintf('Try it yourself, look at help dsolve for examples, use SM_ODE3? ')
 fprintf(' An Example, Dx = -a*x^3, x(0) = b \n')
 fsol = dsolve('Dx = -a*x^3','x(0) = b');
 yy = simple(fsol);
 pretty(yy)
%