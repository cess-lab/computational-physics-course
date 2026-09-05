% Run in a new MATLAB -batch process from the repository root.
cd('/Users/khairuladib/MATLAB-Drive/Kuliah/computational-physics-course');
set(groot,'defaultFigureVisible','off');
run('Week08/Week08_Lecture_Demonstration_Euler_Cooling.m');
assert(abs(T_after_one_step_C-50)<1e-12);
assert(abs(T_after_two_steps_C-35)<1e-12);
assert(abs(exact_endpoint_C-22.9872241020718)<1e-10);
assert(ode45_max_difference_C<0.05);
out = fullfile(pwd,'Week08','.agent','matlab');
if ~exist(out,'dir'), mkdir(out); end
writetable(comparison,fullfile(out,'cooling_endpoint_evidence.csv'));
save(fullfile(out,'lecture_workspace.mat'));
close all;
palette = [0.12 0.28 0.46; 0.31 0.43 0.56; 0.43 0.57 0.65];
fine_t = linspace(0,300,601);
fine_T = 20+60*exp(-fine_t/100);
plot(fine_t,fine_T,'Color',[0.25 0.45 0.34],'LineWidth',2);
hold on;
for k = 1:3
    h = dt_choices_s(k);
    tt = 0:h:300;
    values = zeros(size(tt)); values(1)=80;
    for n=1:numel(tt)-1
        values(n+1)=values(n)+h*(-(values(n)-20)/100);
    end
    plot(tt,values,'o-','Color',palette(k,:),'LineWidth',1.3,'MarkerSize',4);
    writetable(table(tt',values','VariableNames',{'Time_s','Temperature_C'}), ...
        fullfile(out,sprintf('cooling_h_%g.csv',h)));
end
yline(20,'--','Color',[0.5 0.5 0.5]);
hold off;
xlabel('Time, t (s)'); ylabel('Temperature, T (degrees Celsius)');
title('Euler Timestep Comparison with the Exact Cooling Solution');
legend('Exact','Euler: 50 s','Euler: 25 s','Euler: 12.5 s','Room: 20 C','Location','northeast');
xlim([0 300]); ylim([18 82]); grid on;
set(gcf,'Color','w','Position',[100 100 1200 760]);
exportgraphics(gcf,fullfile(out,'cooling_timestep_reference.png'),'Resolution',160);
close all;
tt=0:50:300; vv=20+60*(0.5).^(0:6);
plot(fine_t,fine_T,'Color',[0.25 0.45 0.34],'LineWidth',2);
hold on; plot(tt,vv,'o-','Color',palette(1,:),'LineWidth',1.6);
hold off; xlim([0 100]); ylim([30 82]); grid on;
xlabel('Time, t (s)'); ylabel('Temperature, T (degrees Celsius)');
title('First Two Euler Updates: 80 to 50 to 35 C');
legend('Exact cooling','Euler: 50 s','Location','northeast');
set(gcf,'Color','w','Position',[100 100 1100 700]);
exportgraphics(gcf,fullfile(out,'cooling_first_steps_reference.png'),'Resolution',160);
disp(version); disp('WEEK08_LECTURE_VALIDATION_PASSED');
