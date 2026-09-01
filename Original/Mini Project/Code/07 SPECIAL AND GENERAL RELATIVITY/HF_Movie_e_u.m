%
% movie for HF data, e  and muons incident
%
clear all;  
help HF_Movie_e_u      % Clear the memory and print header
%
% load electron and muon data
%
load e156 ; % data from test beam on Pb stack - e and u
%
fprintf('Hanging File Test Beam Data \n')
fprintf('Shows depth distribution for electrons and muons \n')
fprintf('Hanging File stack is 40 plates of 1/8" Pb \n')
fprintf('horizontal axis is plate number, vertical is energy in that plate \n')
%
figure(1)
%
for j = 1:40
          jplate = 1:j ;
          EL(j) = el1(1,j);
          plot(jplate,EL,jplate,EL,'*')
          axis([0 40 0 12 ])
          title('Energy distribution vs depth for 150 GeV incident electrons')
          xlabel('depth in calorimeter, plate #')
          ylabel('energy at a given depth')
          hold on
          pause(0.1)
end
hold off
figure(2)
j = 1:40;
%
sume = 0;
for i = 2:20
    for ii = 1:40
        EL1(i,ii) = el1(i,ii);
        sume = sume + EL1(i,ii);
    end
 plot(j,EL1(i,:),j,EL1(i,:),'*')
 title('Energy distribution vs depth for 150 GeV incident electrons')
 xlabel('depth in calorimeter, plate #')
 ylabel('energy at a given depth')
 pause(1)
end
%
load hfmu15
mu15 = mu15 ./100. ;
figure(3)
%
j = 1:40;
sum1 = 0;
for i = 1:10
     for ii = 1:40
        EU1(i,ii) = mu15(i,ii);
        sum1 = sum1 + EU1(i,ii);
     end
 plot(j,EU1(i,:),j,EU1(i,:),'*')
 title('Energy distribution vs depth for 15 GeV incident muons')
 xlabel('depth in calorimeter, plate#')
 ylabel('energy at a given depth')
 pause(1)
end;
%
load hfmu240
mu240 = mu240 ./100. ;
figure(4)
j = 1:40;
sum2 = 0;
for i = 1:10
    for ii = 1:40
        EU2(i,ii) = mu240(i,ii);
        sum2 = sum2 + EU2(i,ii);
     end
 plot(j,EU2(i,:),j,EU2(i,:),'*')
 title('Energy distribution vs depth for 240 GeV incident muons')
 xlabel('depth in calorimeter, plate#')
 ylabel('energy at a given depth')
 pause(1)
end;
%
sum1 = sum1 ./10.;
sum2 = sum2 ./10.;
sume = sume ./20;
fprintf(' Mean Total Energy in 40 Plates for 15 and 240 GeV Muons = %g, %g (GeV) \n',sum1,sum2)
fprintf(' Mean Total Energy in 40 Plates for 150 GeV Electrons = %g (GeV) \n',sume)
%