%
% Potential and Fields for a Collection of Point Charges - Analytic
%
clear all; 
help Point_Elec_Static      % Clear the memory and print header
%
fprintf('Potential and Field for a Series of Point Charges \n')
%
iloop = 0;
irun = 1;
%
while irun > 0
    kk = menu('Pick Another Collection of Charges ?','Yes','No');
    if kk == 2
        irun = -1;
        break
    end
    if kk == 1
        %
        nq = input('Enter the Number of Charges: ');
        for i = 1:nq
            r(i,:) = input('Enter Position, (-100,100) and Charge  [x y q]: ');
        end
        %
        % at xq, yq with strength qq - make lattice of points
        %
        for i = 1:25;
            x(i) = -100 + 8 .* i;
            for j = 1:25
                y(j) = -100 + 8 .*j;
                pot(i,j) = 0.;
                    for k = 1:nq
                        pot(i,j) = pot(i,j) + r(k,3) ./sqrt((x(i)-r(k,1)) .^2 + (y(j)-r(k,2)) .^2);
                        if abs(pot(i,j)) > 100;
                            pot(i,j) = ( pot(i,j) .*100) ./abs(pot(i,j));
                        end;       
                    end;
            end;
        end;
    %
    % surface and countours
    %
    iloop = iloop + 1;
    figure(iloop)
    %
    meshc(x,y,pot')
    title('Potential')
    xlabel('x')
    ylabel('y')
    hold on
    plot(r(:,1),r(:,2),'*')
    hold off
    %
    iloop = iloop + 1;
    figure(iloop)
    [ex,ey] = gradient(pot');
    meshc(x,y,ex)
    title('Ex')
    xlabel('x')
    ylabel('y')
    %
    iloop = iloop + 1;
    figure(iloop)
    meshc(x,y,ey)
    title('Ey')
    xlabel('x')
    ylabel('y') 
    %
    end
end
%

