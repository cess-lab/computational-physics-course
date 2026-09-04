% MATLAB-rendered scientific-plot corrections for Slides 12 and 13.
% The approved ImageGen slide artwork is retained outside the plot regions.

baseDir = fileparts(fileparts(mfilename('fullpath')));
outDir = fullfile(baseDir, 'drafts');
if ~isfolder(outDir)
    mkdir(outDir);
end

navy = [36 59 83]/255;
blue = [55 112 176]/255;      % forward secant / central secant
sage = [76 122 82]/255;       % exact tangent
ochre = [199 126 0]/255;
white = [1 1 1];

t = linspace(0, 2.30, 461);
y = 20*t - 4.905*t.^2;
t0 = 1.0;
y0 = 15.095;
tangent = @(x) y0 + 10.19*(x-t0);

%% Slide 12: forward secants must lie below the tangent after t0.
slide12 = imread(fullfile(baseDir, 'origin_image', 'slide_12.png'));
[h12,w12,~] = size(slide12);
% Clear only the two graph regions, preserving headings, equations, arrow,
% and the bottom explanatory callout.
slide12(round(0.245*h12):round(0.80*h12), round(0.015*w12):round(0.425*w12), :) = 255;
slide12(round(0.245*h12):round(0.80*h12), round(0.57*w12):round(0.985*w12), :) = 255;

fig12 = figure('Visible','off','Color',white, ...
    'Position',[100 100 w12 h12],'Renderer','painters');
bg12 = axes(fig12,'Position',[0 0 1 1]);
image(bg12,slide12); axis(bg12,'image','off');

ax12a = localAxes(fig12,[0.075 0.30 0.29 0.43],navy);
localForwardPanel(ax12a,t,y,tangent,0.50,blue,sage,navy,'h = 0.5 s');
ax12b = localAxes(fig12,[0.625 0.30 0.29 0.43],navy);
localForwardPanel(ax12b,t,y,tangent,0.10,blue,sage,navy,'h = 0.1 s');
exportgraphics(fig12,fullfile(outDir,'slide_12_matlab_exact-plots.png'),'Resolution',144);
close(fig12);

%% Slide 13: central secant is parallel to the exact tangent for this quadratic.
slide13 = imread(fullfile(baseDir, 'origin_image', 'slide_13.png'));
[h13,w13,~] = size(slide13);
% Clear the old graph only; retain the formula, explanatory text, workflow,
% title, and right-side legend.
slide13(round(0.17*h13):round(0.64*h13), round(0.46*w13):end, :) = 255;
% Clear generated wording that conflicts with the exact quadratic special case.
slide13(round(0.75*h13):round(0.86*h13), round(0.735*w13):round(0.98*w13), :) = repmat(reshape(uint8([238 247 239]),1,1,3), ...
    round(0.86*h13)-round(0.75*h13)+1, round(0.98*w13)-round(0.735*w13)+1);
slide13(round(0.89*h13):round(0.98*h13), round(0.095*w13):round(0.96*w13), :) = repmat(reshape(uint8([255 250 240]),1,1,3), ...
    round(0.98*h13)-round(0.89*h13)+1, round(0.96*w13)-round(0.095*w13)+1);
slide13(round(0.89*h13):round(0.98*h13), round(0.035*w13):round(0.18*w13), :) = repmat(reshape(uint8([255 250 240]),1,1,3), ...
    round(0.98*h13)-round(0.89*h13)+1, round(0.18*w13)-round(0.035*w13)+1);

fig13 = figure('Visible','off','Color',white, ...
    'Position',[100 100 w13 h13],'Renderer','painters');
bg13 = axes(fig13,'Position',[0 0 1 1]);
image(bg13,slide13); axis(bg13,'image','off');

ax13 = localAxes(fig13,[0.525 0.40 0.36 0.40],navy);
plot(ax13,t,y,'Color',navy,'LineWidth',2.3);
hold(ax13,'on');
tLine = linspace(0.48,1.55,80);
plot(ax13,tLine,tangent(tLine),'Color',sage,'LineWidth',2.2);
central = @(x) 10.19*x + 3.67875;
plot(ax13,tLine,central(tLine),'Color',blue,'LineWidth',2.2);
plot(ax13,[0.5 1.5],[8.77375 18.96375],'o', ...
    'MarkerFaceColor',blue,'MarkerEdgeColor',blue,'MarkerSize',8);
plot(ax13,t0,y0,'o','MarkerFaceColor',sage,'MarkerEdgeColor',sage,'MarkerSize',8);
xline(ax13,0.5,'--','Color',blue,'LineWidth',1.0);
xline(ax13,1.0,'--','Color',sage,'LineWidth',1.0);
xline(ax13,1.5,'--','Color',blue,'LineWidth',1.0);
xlim(ax13,[0 2.3]); ylim(ax13,[0 23]);
xticks(ax13,[0 0.5 1 1.5 2]); yticks(ax13,[0 5 10 15 20]);
xlabel(ax13,'$t\;\mathrm{(s)}$','Interpreter','latex','FontSize',17,'Color',navy);
ylabel(ax13,'$y\;\mathrm{(m)}$','Interpreter','latex','FontSize',17,'Color',navy);
text(ax13,1.0,13.3,'parallel lines: same slope $10.19\;\mathrm{m/s}$', ...
    'Interpreter','latex','HorizontalAlignment','center','FontSize',12,'Color',navy);
text(ax13,1.58,22.0,'tangent (exact)','FontName','Arial', ...
    'FontSize',11,'Color',sage,'HorizontalAlignment','center');
text(ax13,1.58,20.8,'central secant','FontName','Arial', ...
    'FontSize',11,'Color',blue,'HorizontalAlignment','center');

% Replace the generated approximation wording with the exact special-case
% statement, preserving the existing check icon and surrounding layout.
resultAxes = axes(fig13,'Position',[0.735 0.14 0.245 0.11], ...
    'Color',[0.93 0.97 0.94],'XColor','none','YColor','none','Visible','off');
text(resultAxes,0.5,0.68,'Exact for this quadratic', ...
    'HorizontalAlignment','center','VerticalAlignment','middle', ...
    'FontName','Arial','FontSize',12,'Color',sage);
text(resultAxes,0.5,0.35,'$y''(1.0)=10.19000\;\mathrm{m/s}$', ...
    'Interpreter','latex','HorizontalAlignment','center', ...
    'VerticalAlignment','middle','FontSize',13,'Color',sage);
noteAxes = axes(fig13,'Position',[0.095 0.02 0.865 0.09], ...
    'Color',[1.0 0.98 0.94],'XColor','none','YColor','none','Visible','off');
text(noteAxes,0.5,0.5,'For this quadratic, the centred difference gives the exact instantaneous velocity at $t_0=1.0\;\mathrm{s}$.', ...
    'Interpreter','latex','HorizontalAlignment','center', ...
    'VerticalAlignment','middle','FontSize',14,'Color',navy);
text(noteAxes,-0.02,0.5,'?', ...
    'HorizontalAlignment','center','VerticalAlignment','middle', ...
    'FontName','Arial','FontWeight','bold','FontSize',28,'Color',ochre);
exportgraphics(fig13,fullfile(outDir,'slide_13_matlab_exact-plot.png'),'Resolution',144);
close(fig13);

function ax = localAxes(fig,pos,navy)
ax = axes(fig,'Position',pos,'Color','none','XColor',navy,'YColor',navy, ...
    'FontName','Times New Roman','FontSize',17,'LineWidth',1.4, ...
    'Box','off','TickDir','out');
hold(ax,'on');
end

function localForwardPanel(ax,t,y,tangent,h,blue,sage,navy,stepLabel)
t0 = 1.0;
y0 = 15.095;
t1 = t0+h;
y1 = 20*t1 - 4.905*t1^2;
secantSlope = (y1-y0)/h;
secant = @(x) y0 + secantSlope*(x-t0);
plot(ax,t,y,'Color',navy,'LineWidth',2.3);
tLine = linspace(0.72,1.75,80);
plot(ax,tLine,tangent(tLine),'Color',sage,'LineWidth',2.1);
plot(ax,[t0 t1],[y0 y1],'-','Color',blue,'LineWidth',2.6);
plot(ax,[t0 t1],[y0 y1],'o','MarkerFaceColor',blue, ...
    'MarkerEdgeColor',blue,'MarkerSize',8);
xline(ax,t0,'--','Color',navy,'LineWidth',1.0);
xlim(ax,[0 2.2]); ylim(ax,[0 22]);
xticks(ax,[0 1 1.5 2]); yticks(ax,[0 5 10 15 20]);
xlabel(ax,'$t\;\mathrm{(s)}$','Interpreter','latex','FontSize',16,'Color',navy);
ylabel(ax,'$y\;\mathrm{(m)}$','Interpreter','latex','FontSize',16,'Color',navy);
text(ax,1.55,20.5,'tangent (exact)','FontName','Arial','FontSize',12, ...
    'Color',sage,'HorizontalAlignment','center');
text(ax,1.55,18.8,['forward secant, ' stepLabel], ...
    'FontName','Arial','FontSize',11,'Color',blue,'HorizontalAlignment','center');
end
