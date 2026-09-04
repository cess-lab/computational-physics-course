% Native MATLAB scientific-plot replacement for the Slide 1 graph region.
% The surrounding slide remains the approved ImageGen artwork.

baseDir = fileparts(fileparts(mfilename('fullpath')));
slidePath = fullfile(baseDir, 'origin_image', 'slide_01.png');
outDir = fullfile(baseDir, 'drafts');
if ~isfolder(outDir)
    mkdir(outDir);
end
outPath = fullfile(outDir, 'slide_01_matlab_exact-plot.png');

slideImage = imread(slidePath);
[imageHeight, imageWidth, ~] = size(slideImage);
% Remove the generated graph region at pixel level before MATLAB renders the
% exact plot, so no generated axis or sample labels remain underneath.
panelLeft = round(0.31*imageWidth);
panelTop = round(0.22*imageHeight);
slideImage(panelTop:end, panelLeft:end, :) = 255;

% Locked Week 06 model and exact anchors.
t = linspace(0, 5, 501);
y = 20*t - 4.905*t.^2;
t0 = 1.0;
h = 0.20;
y0 = 20*t0 - 4.905*t0^2;
yh = 20*(t0+h) - 4.905*(t0+h)^2;
tPeak = 20/9.81;
yPeak = 20*tPeak - 4.905*tPeak^2;
tGround = 20/4.905;

navy = [36 59 83]/255;
blue = [46 111 185]/255;
ochre = [199 126 0]/255;
white = [1 1 1];

fig = figure('Visible', 'off', 'Color', white, ...
    'Position', [100 100 imageWidth imageHeight], 'Renderer', 'painters');
background = axes(fig, 'Position', [0 0 1 1]);
image(background, slideImage);
axis(background, 'image', 'off');
hold(background, 'on');

plotAxes = axes(fig, 'Position', [0.445 0.175 0.50 0.64], ...
    'Color', 'none', 'XColor', navy, 'YColor', navy, ...
    'FontName', 'Times New Roman', 'FontSize', 21, 'LineWidth', 1.8, ...
    'Box', 'off', 'TickDir', 'out');
hold(plotAxes, 'on');
plot(plotAxes, t, y, 'Color', blue, 'LineWidth', 3.0);
plot(plotAxes, [t0 t0+h], [y0 yh], 'o', ...
    'MarkerSize', 10, 'MarkerFaceColor', blue, 'MarkerEdgeColor', blue);
xline(plotAxes, t0, '--', 'Color', blue, 'LineWidth', 1.5);
xline(plotAxes, t0+h, '--', 'Color', blue, 'LineWidth', 1.5);

xlim(plotAxes, [0 5]);
ylim(plotAxes, [0 22]);
xticks(plotAxes, 0:5);
yticks(plotAxes, 0:5:20);
xlabel(plotAxes, '$t\;\mathrm{(s)}$', 'Interpreter', 'latex', 'FontSize', 26, 'Color', navy);
ylabel(plotAxes, '$y\;\mathrm{(m)}$', 'Interpreter', 'latex', 'FontSize', 26, 'Color', navy);

text(plotAxes, t0, -2.35, '$t_0=1.0\;\mathrm{s}$', ...
    'Interpreter', 'latex', 'HorizontalAlignment', 'center', ...
    'FontSize', 19, 'Color', navy, 'Clipping', 'off');
text(plotAxes, t0+h, -3.75, '$t_0+h$', ...
    'Interpreter', 'latex', 'HorizontalAlignment', 'center', ...
    'FontSize', 19, 'Color', navy, 'Clipping', 'off');
text(plotAxes, tGround, 0.9, '$t=4.08\;\mathrm{s}$', ...
    'Interpreter', 'latex', 'HorizontalAlignment', 'right', ...
    'FontSize', 16, 'Color', ochre);
text(plotAxes, tPeak, yPeak+0.8, 'single maximum', ...
    'HorizontalAlignment', 'center', 'FontName', 'Arial', ...
    'FontSize', 15, 'Color', navy);

exportgraphics(fig, outPath, 'Resolution', 144);
close(fig);
