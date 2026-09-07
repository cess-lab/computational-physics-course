out = '/Users/khairuladib/MATLAB-Drive/Kuliah/computational-physics-course/Week12/.agent/matlab';
set(groot,'defaultFigureVisible','off');
d = readtable(fullfile(out,'practical_projectile_evidence.csv'));
plot(d.Angle_deg,d.BaselineRange_m,'o-','Color',[0.12 0.28 0.46],'LineWidth',1.6)
hold on
plot(d.Angle_deg,d.VariantRange_m,'s--','Color',[0.85 0.48 0.16],'LineWidth',1.4)
hold off
xlabel('Launch angle, theta (degrees)')
ylabel('Horizontal range, R (m)')
title('Projectile Range: One Controlled Speed Modification')
legend('Baseline speed = 18 m/s','Modified speed','Location','northwest')
grid on
exportgraphics(gcf,fullfile(out,'week12_practical_projectile.png'),'Resolution',180)
