% Generate the retained MATLAB numerical evidence figure for PHY4605 Week 01.
y0_m = 0;
v0_mps = 20;
g_mps2 = 9.81;
t_s = 0:0.1:4;
y_m = y0_m + v0_mps.*t_s - 0.5*g_mps2.*t_s.^2;
fig = figure('Color','w','Position',[100 100 1100 650]);
plot(t_s,y_m,'LineWidth',3,'Color',[0.05 0.26 0.47]);
hold on
plot(t_s(1),y_m(1),'o','MarkerSize',9,'MarkerFaceColor',[0.00 0.50 0.45], ...
    'MarkerEdgeColor',[0.00 0.50 0.45]);
grid on
xlabel('Time, $t$ (s)','Interpreter','latex','FontSize',22)
ylabel('Vertical position, $y$ (m)','Interpreter','latex','FontSize',22)
title('Vertical Motion: Analytical Position Model','Interpreter','latex','FontSize',24)
legend({'$y(t)$ model','$y(0)=0$ validation'},'Interpreter','latex','Location','southwest','FontSize',17)
set(gca,'FontSize',18,'LineWidth',1.1)
exportgraphics(fig,fullfile(fileparts(mfilename('fullpath')),'assets','week01_height_time.png'),'Resolution',220)
save(fullfile(fileparts(mfilename('fullpath')),'assets','week01_height_time_data.mat'),'y0_m','v0_mps','g_mps2','t_s','y_m')
writetable(table(t_s(:),y_m(:),'VariableNames',{'time_s','position_m'}), ...
    fullfile(fileparts(mfilename('fullpath')),'assets','week01_height_time_data.csv'))

