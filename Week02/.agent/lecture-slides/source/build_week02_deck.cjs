const path = require('node:path');
const fs = require('node:fs');
const PptxGenJS = require('pptxgenjs');
const JSZip = require('jszip');

const ROOT = '/Users/khairuladib/MATLAB-Drive/Kuliah/computational-physics-course';
const WEEK = path.join(ROOT, 'Week02');
const OUT = process.env.PHY4605_WEEK02_OUT || path.join(WEEK, 'Lecture_Slides_Week02.pptx');
const ASSETS = path.join(WEEK, '.agent/lecture-slides/assets');
const MATLAB = path.join(WEEK, '.agent/matlab/assets');

const pptx = new PptxGenJS();
pptx.defineLayout({ name: 'PHY4605_WIDE', width: 13.333333, height: 7.5 });
pptx.layout = 'PHY4605_WIDE';
pptx.author = 'PHY4605 Computational Methods in Physics';
pptx.company = 'Universiti Putra Malaysia';
pptx.subject = 'Week 02 - Pseudocode, Loops, and Debugging';
pptx.title = 'PHY4605 Week 02 - Pseudocode, Loops, and Debugging';
pptx.lang = 'en-US';
pptx.theme = {
  headFontFace: 'Nunito',
  bodyFontFace: 'Nunito',
  lang: 'en-US'
};

const C = {
  white: 'FFFFFF', navy: '0B2B4C', charcoal: '3F4B57', muted: '697684',
  blue: '2F6DB2', teal: '2A9D9F', green: '3E8E45', gold: 'C98A16',
  red: 'B3262E', rule: 'AAB4BE', grid: 'DDE5EC', paleNavy: 'F4F8FC',
  paleBlue: 'EEF5FD', paleValid: 'F0FAF7', paleGold: 'FFF7E6',
  paleRed: 'FFF2F2', paleNeutral: 'F7F9FB'
};
const SH = pptx.ShapeType;
const IN = px => px / 144;
const PT = px => px * 0.75;
const titleSpec = {
  T1: { size: PT(68), y: IN(60), h: IN(88), subY: IN(152) },
  T2: { size: PT(62), y: IN(60), h: IN(88), subY: IN(152) },
  T3: { size: PT(56), y: IN(60), h: IN(138), subY: IN(205) }
};

pptx.defineSlideMaster({ title: 'PHY4605 Opening', background: { color: C.white }, objects: [] });
pptx.defineSlideMaster({ title: 'PHY4605 Content T1', background: { color: C.white }, objects: [] });
pptx.defineSlideMaster({ title: 'PHY4605 Content T2', background: { color: C.white }, objects: [] });
pptx.defineSlideMaster({ title: 'PHY4605 Content T3', background: { color: C.white }, objects: [] });

function baseTextOpts(extra = {}) {
  return {
    fontFace: 'Nunito', fontSize: PT(28), color: C.charcoal,
    margin: 0, breakLine: false, valign: 'top', fit: 'shrink',
    ...extra
  };
}
function addText(slide, text, x, y, w, h, extra = {}) {
  slide.addText(text, { x: IN(x), y: IN(y), w: IN(w), h: IN(h), ...baseTextOpts(extra) });
}
function addTitle(slide, title, variant = 'T1', subtitle = '') {
  const v = titleSpec[variant];
  slide.addText(title, {
    x: IN(115), y: v.y, w: IN(1580), h: v.h,
    fontFace: 'Nunito', fontSize: v.size, bold: true, color: C.navy,
    margin: 0, fit: 'shrink', breakLine: false, valign: 'top',
    ...(variant === 'T3' ? { lineSpacing: v.size * 0.92 } : {})
  });
  if (subtitle && variant !== 'T3') {
    slide.addText(subtitle, {
      x: IN(115), y: v.subY + IN(16), w: IN(1580), h: IN(44),
      fontFace: 'Nunito', fontSize: PT(30), color: C.charcoal,
      margin: 0, fit: 'shrink', breakLine: false, valign: 'mid'
    });
  }
}
function addSlideNo(slide, n) {
  slide.addText(String(n), {
    x: IN(1764), y: IN(976), w: IN(40), h: IN(28),
    fontFace: 'Nunito', fontSize: PT(18), color: C.muted,
    margin: 0, align: 'right', valign: 'mid'
  });
}
function card(slide, x, y, w, h, fill = C.paleNeutral, line = C.rule, radius = true) {
  slide.addShape(radius ? SH.roundRect : SH.rect, {
    x: IN(x), y: IN(y), w: IN(w), h: IN(h),
    fill: { color: fill }, line: { color: line, width: 1.5 }
  });
}
function circleLabel(slide, n, x, y, fill = C.paleBlue, line = C.blue, textColor = C.blue) {
  slide.addShape(SH.ellipse, { x: IN(x), y: IN(y), w: IN(56), h: IN(56), fill: { color: fill }, line: { color: line, width: 1.5 } });
  addText(slide, String(n), x, y + 5, 56, 42, { fontSize: PT(26), bold: true, color: textColor, align: 'center', valign: 'mid' });
}
function arrowLine(slide, x1, y1, x2, y2, color = C.rule, width = 2.5) {
  slide.addShape(SH.line, {
    x: IN(x1), y: IN(y1), w: IN(x2 - x1), h: IN(y2 - y1),
    line: { color, width, endArrowType: 'triangle' }
  });
}
function addImageContain(slide, file, box, aspect, altText) {
  let w = box.w, h = w / aspect;
  if (h > box.h) { h = box.h; w = h * aspect; }
  const x = box.x + (box.w - w) / 2;
  const y = box.y + (box.h - h) / 2;
  slide.addImage({ path: file, x: IN(x), y: IN(y), w: IN(w), h: IN(h), altText });
}
function codeCard(slide, code, x, y, w, h, lineColor = C.blue, fill = C.paleNavy, fontSizePx = 26) {
  card(slide, x, y, w, h, fill, lineColor);
  slide.addText(code, {
    x: IN(x + 35), y: IN(y + 30), w: IN(w - 70), h: IN(h - 60),
    fontFace: 'IBM Plex Mono', fontSize: PT(fontSizePx), color: C.navy,
    margin: 0, breakLine: false, fit: 'shrink', valign: 'top'
  });
}
function takeaway(slide, text, fill = C.paleNavy, line = C.navy, color = C.navy) {
  card(slide, 115, 925, 1560, 95, fill, line);
  addText(slide, text, 160, 947, 1470, 52, { fontSize: PT(30), bold: true, color, align: 'center', valign: 'mid' });
}
function addNotes(slide, intent, extraSources = []) {
  const sources = [
    'PHY4605 Course Topic and Difficulty Blueprint',
    'PHY4605 Lecture Slide Deck Design Specification',
    'Week02 Content Manifest',
    ...extraSources
  ];
  slide.addNotes(`${intent}\n\n[Sources]\n${sources.map(s => `- ${s}`).join('\n')}`);
}

const hero = path.join(ASSETS, 'vertical-launch-matte.png');
const eqModel = path.join(ASSETS, 'equations/vertical-launch-model.png');
const eqInitial = path.join(ASSETS, 'equations/known-initial-value.png');
const plot = path.join(MATLAB, 'week02_loop_position.png');

for (const f of [hero, eqModel, eqInitial, plot]) {
  if (!fs.existsSync(f)) throw new Error(`Missing required slide asset: ${f}`);
}

// 1 - Opening
{
  const s = pptx.addSlide('PHY4605 Opening');
  addText(s, 'PHY4605 Computational Methods in Physics', 115, 126, 900, 40, { fontSize: PT(26), bold: true, color: C.charcoal });
  addText(s, 'Pseudocode, Loops\nand Debugging', 115, 245, 1080, 210, { fontSize: PT(74), bold: true, color: C.navy, valign: 'top', lineSpacing: 50 });
  addText(s, 'Week 2 | Make Each Step Traceable', 115, 475, 1180, 80, { fontSize: PT(34), color: C.charcoal, valign: 'mid' });
  addImageContain(s, hero, { x: 1230, y: 175, w: 545, h: 570 }, 1024 / 1536, 'Vertical launch shown at launch, mid-flight, and near the peak on one vertical path');
  addText(s, 'model  →  pseudocode  →  loop  →  debug  →  validate', 115, 860, 1500, 70, { fontSize: PT(28), bold: true, color: C.navy, valign: 'mid' });
  addNotes(s, 'Open by asking how a familiar launch equation becomes a sequence of traceable actions.', ['Week02 lecture Live Script']);
}

// 2 - Prediction
{
  const s = pptx.addSlide('PHY4605 Content T1');
  addTitle(s, 'Start with a physical prediction', 'T1', 'The familiar launch model keeps the new load algorithmic');
  addImageContain(s, hero, { x: 145, y: 260, w: 520, h: 545 }, 1024 / 1536, 'Ball on a strictly vertical launch path without embedded labels');
  card(s, 790, 280, 850, 440, C.paleBlue, C.blue);
  addText(s, 'Before any code', 835, 325, 650, 54, { fontSize: PT(36), bold: true, color: C.navy });
  const items = ['upward is positive', 'air resistance is neglected', 'the first stored position is 0 m', 'the ball rises, reaches a peak, then falls'];
  items.forEach((t, i) => { const y = 405 + i * 68; circleLabel(s, i + 1, 840, y); addText(s, t, 930, y + 8, 620, i === 3 ? 58 : 42, { fontSize: PT(28) }); });
  takeaway(s, 'Prediction first: compare later output with expected behaviour');
  addSlideNo(s, 2);
  addNotes(s, 'Invite students to predict the initial value and overall motion before showing any loop.', ['Week02 lecture Live Script']);
}

// 3 - Model
{
  const s = pptx.addSlide('PHY4605 Content T1');
  addTitle(s, 'Name the model before the algorithm', 'T3', 'Every loop pass evaluates the same familiar position rule');
  addImageContain(s, eqModel, { x: 420, y: 280, w: 1080, h: 150 }, 801 / 165, 'LaTeX-rendered vertical launch position equation');
  const vals = [
    ['y₀', '0 m', C.blue, C.paleBlue], ['v₀', '20 m s⁻¹', C.gold, C.paleGold],
    ['g', '9.81 m s⁻²', C.gold, C.paleGold], ['t_s', '0:0.5:4 s', C.teal, C.paleValid]
  ];
  vals.forEach((a, i) => { const x = 115 + i * 415; card(s, x, 490, 355, 175, a[3], a[2]); addText(s, a[0], x + 30, 525, 295, 45, { fontSize: PT(34), bold: true, color: a[2] }); addText(s, a[1], x + 30, 590, 295, 42, { fontSize: PT(28) }); });
  takeaway(s, 'At each chosen time, calculate one vertical position in metres', C.paleValid, C.teal, C.teal);
  addSlideNo(s, 3);
  addNotes(s, 'State that this is the only physical model used in the Core route. The equation is a retained LaTeX asset.', ['vertical-launch-model.tex/svg/png']);
}

// 4 - Decompose
{
  const s = pptx.addSlide('PHY4605 Content T1');
  addTitle(s, 'Break one physics task into small actions', 'T3', 'Pseudocode says what must happen before MATLAB says how');
  const steps = [
    ['INPUT', 'store parameters and ordered times'],
    ['CALCULATE', 'use the current time in the position equation'],
    ['OUTPUT', 'store one position and later plot the array'],
    ['CHECK', 'confirm the known first value']
  ];
  steps.forEach((a, i) => {
    const x = 145 + i * 420;
    card(s, x, 330, 340, 330, i === 3 ? C.paleValid : C.paleBlue, i === 3 ? C.teal : C.blue);
    addText(s, a[0], x + 30, 375, 280, 42, { fontSize: PT(26), bold: true, color: i === 3 ? C.teal : C.blue, align: 'center' });
    addText(s, a[1], x + 35, 455, 270, 150, { fontSize: PT(27), color: C.charcoal, align: 'center', valign: 'mid' });
    if (i < 3) arrowLine(s, x + 350, 490, x + 400, 490, C.rule, 2.25);
  });
  takeaway(s, 'Pseudocode is an algorithm map, not MATLAB punctuation');
  addSlideNo(s, 4);
  addNotes(s, 'Have students read the four jobs aloud. Emphasise that the decomposition can be checked before any syntax is introduced.');
}

// 5 - Pseudocode to code
{
  const s = pptx.addSlide('PHY4605 Content T2');
  addTitle(s, 'Map pseudocode to one code block', 'T3', 'The loop repeats one scalar calculation for every stored time');
  addText(s, 'Pseudocode', 155, 285, 600, 48, { fontSize: PT(36), bold: true, color: C.navy });
  addText(s, 'MATLAB structure', 1030, 285, 620, 48, { fontSize: PT(36), bold: true, color: C.blue });
  card(s, 115, 350, 760, 455, C.paleNeutral, C.navy);
  const pseudo = ['Make one position slot per time', 'Repeat while k moves through the time array', 'Use the current t_s(k)', 'Store the answer into y_m(k)'];
  pseudo.forEach((t, i) => { circleLabel(s, i + 1, 150, 405 + i * 90, C.white, C.navy, C.navy); addText(s, t, 235, 412 + i * 90, 565, 55, { fontSize: PT(27) }); });
  codeCard(s, 'y_m = zeros(size(t_s));\n\nfor k = 1:numel(t_s)\n    t = t_s(k);\n    y_m(k) = ...\nend', 1005, 350, 760, 455, C.blue, C.paleNavy, 26);
  arrowLine(s, 900, 570, 975, 570, C.rule, 2.25);
  addSlideNo(s, 5);
  addNotes(s, 'Match each pseudocode action to the nearby code structure. Keep the model update incomplete until the bounded-completion slide.');
}

// 6 - Loop anatomy
{
  const s = pptx.addSlide('PHY4605 Content T1');
  addTitle(s, 'A for-loop fills one array entry at a time', 'T3', 'The same index selects the matching input and output slots');
  codeCard(s, 'for sample_index = 1:n_samples\n    current_time_s = t_s(sample_index);\n    y_m(sample_index) = y0_m + v0_mps*current_time_s ...\n        - 0.5*g_mps2*current_time_s^2;\nend', 115, 285, 975, 500, C.blue, C.paleNavy, 23);
  const rows = [
    ['index', ['1', '2', '3', '…', '9'], C.blue, C.paleBlue],
    ['time (s)', ['0.0', '0.5', '1.0', '…', '4.0'], C.blue, C.paleBlue],
    ['position (m)', ['0.00', '8.77', '15.10', '…', '1.52'], C.teal, C.paleValid]
  ];
  rows.forEach((r, ri) => {
    addText(s, r[0], 1150, 305 + ri * 155, 230, 38, { fontSize: PT(26), bold: true, color: r[2] });
    r[1].forEach((v, i) => { card(s, 1150 + i * 120, 360 + ri * 155, 104, 62, r[3], r[2]); addText(s, v, 1155 + i * 120, 374 + ri * 155, 94, 34, { fontSize: PT(22), bold: true, align: 'center', valign: 'mid' }); });
  });
  takeaway(s, 'Same index → same time slot → same position slot', C.paleValid, C.teal, C.teal);
  addSlideNo(s, 6);
  addNotes(s, 'Point out that current_time_s is scalar inside the loop, so the model line uses ordinary scalar operators.');
}

// 7 - Trace
{
  const s = pptx.addSlide('PHY4605 Content T1');
  addTitle(s, 'Trace the first two iterations', 'T1', 'Follow the index, current time, calculation, and storage location in order');
  const trace = [
    ['Iteration 1', 'sample_index = 1', 'current_time_s = 0.0 s', 'y_m(1) = 0.00000 m', C.blue, C.paleBlue],
    ['Iteration 2', 'sample_index = 2', 'current_time_s = 0.5 s', 'y_m(2) = 8.77375 m', C.gold, C.paleGold]
  ];
  trace.forEach((a, i) => {
    const x = 115 + i * 850;
    card(s, x, 300, 760, 475, a[5], a[4]);
    addText(s, a[0], x + 40, 345, 650, 52, { fontSize: PT(38), bold: true, color: a[4] });
    [a[1], a[2], a[3]].forEach((t, j) => addText(s, t, x + 45, 455 + j * 95, 650, 48, { fontSize: PT(28) }));
  });
  takeaway(s, 'Trace a symbol, then interpret the stored number physically', C.paleValid, C.teal, C.teal);
  addSlideNo(s, 7);
  addNotes(s, 'Pause after each assignment. Confirm y(0)=0 m and y(0.5)=8.77375 m from the retained MATLAB evidence.');
}

// 8 - Completion
{
  const s = pptx.addSlide('PHY4605 Content T1');
  addTitle(s, 'Complete the one missing calculation', 'T3', 'Use the current scalar time, then store the result in the matching slot');
  codeCard(s, 'for sample_index = 1:n_samples\n    current_time_s = t_s(sample_index);\n    y_m(sample_index) = __________________________;\nend', 115, 300, 1030, 470, C.blue, C.paleNavy, 25);
  card(s, 1230, 315, 500, 450, C.paleGold, C.gold);
  addText(s, 'Bounded task', 1275, 350, 410, 75, { fontSize: PT(30), bold: true, color: C.gold, align: 'center', valign: 'mid' });
  addText(s, 'Use named model quantities:\ny0_m\nv0_mps\ng_mps2\ncurrent_time_s', 1275, 450, 410, 245, { fontSize: PT(26), align: 'center', valign: 'top' });
  takeaway(s, 'Check: the first loop pass stores y_m(1) = 0 m', C.paleValid, C.green, C.green);
  addSlideNo(s, 8);
  addNotes(s, 'Do not reveal the completed expression immediately. Expected completion is y0_m + v0_mps*current_time_s - 0.5*g_mps2*current_time_s^2.');
}

// 9 - Parameter modification
{
  const s = pptx.addSlide('PHY4605 Content T1');
  addTitle(s, 'Predict before changing a parameter', 'T3', 'Lower the launch speed only; keep the model and loop structure unchanged');
  card(s, 145, 330, 650, 335, C.paleBlue, C.blue);
  addText(s, 'Original input', 190, 375, 560, 48, { fontSize: PT(35), bold: true, color: C.blue });
  codeCard(s, 'v0_mps = 20;', 190, 455, 520, 90, C.blue, C.white, 25);
  addText(s, '20 m s⁻¹; same y0_m, g_mps2, and t_s', 190, 570, 520, 58, { fontSize: PT(24) });
  card(s, 1110, 330, 650, 335, C.paleGold, C.gold);
  addText(s, 'Modify one input', 1155, 375, 560, 48, { fontSize: PT(35), bold: true, color: C.gold });
  codeCard(s, 'v0_lower_mps = 15;', 1155, 455, 520, 90, C.gold, C.white, 23);
  addText(s, '15 m s⁻¹; rerun the same loop pattern', 1155, 570, 520, 58, { fontSize: PT(24) });
  arrowLine(s, 840, 500, 1060, 500, C.rule, 2.5);
  takeaway(s, 'Lower launch speed gives a lower maximum position', C.paleValid, C.teal, C.teal);
  addSlideNo(s, 9);
  addNotes(s, 'This is the bounded parameter modification used in the lecture Live Script: 20 m/s to 15 m/s.');
}

// 10 - MATLAB evidence plot
{
  const s = pptx.addSlide('PHY4605 Content T1');
  addTitle(s, 'Read the loop output as evidence', 'T3', 'The MATLAB figure must agree with the prediction and the known initial value');
  addImageContain(s, plot, { x: 115, y: 280, w: 1080, h: 575 }, 2107 / 1389, 'MATLAB-generated position-time curves for launch speeds 20 m/s and 15 m/s with initial-value marker');
  card(s, 1260, 285, 515, 550, C.paleNeutral, C.navy);
  addText(s, 'Interpret the\ngraph', 1300, 320, 435, 110, { fontSize: PT(32), bold: true, color: C.navy, valign: 'top' });
  circleLabel(s, 1, 1300, 440, C.white, C.blue, C.blue);
  addText(s, 'both curves begin at 0 m', 1385, 448, 335, 52, { fontSize: PT(24) });
  circleLabel(s, 2, 1300, 525, C.white, C.blue, C.blue);
  addText(s, '15 m s⁻¹ reaches a lower sampled peak', 1385, 529, 335, 70, { fontSize: PT(24) });
  circleLabel(s, 3, 1300, 630, C.white, C.gold, C.gold);
  addText(s, 'Negative y after crossing 0 m extends the algebraic model below the launch level', 1385, 633, 335, 112, { fontSize: PT(22) });
  takeaway(s, 'Interpret the graph’s trend, units, and validity');
  addSlideNo(s, 10);
  addNotes(s, 'Use the retained MATLAB plot. The model is algebraic and does not impose a ground-contact stop, so negative y after return is outside a ground-limited interpretation.', ['Week02/.agent/matlab/generate_week02_plot.m', 'week02_loop_position_data.csv']);
}

// 11 - Defect categories
{
  const s = pptx.addSlide('PHY4605 Content T2');
  addTitle(s, 'Classify the defect before debugging', 'T3', 'Syntax, array/indexing/operator, and physical/logical defects need different evidence');
  const kinds = [
    ['Syntax', 'MATLAB cannot complete the intended code structure', 'missing end, quote, or bracket', C.red, C.paleRed],
    ['Array / indexing / operator', 'Code may run but reads or stores the wrong values', 'wrong index, size, * or .*', C.gold, C.paleGold],
    ['Physical / logical', 'Code runs but implements the wrong physics', 'wrong sign, unit, or assumption', C.teal, C.paleValid]
  ];
  kinds.forEach((a, i) => { const x = 115 + i * 565; card(s, x, 320, 505, 430, a[4], a[3]); addText(s, a[0], x + 35, 365, 435, 60, { fontSize: PT(32), bold: true, color: a[3], align: 'center' }); addText(s, a[1], x + 38, 475, 425, 105, { fontSize: PT(26), align: 'center' }); addText(s, a[2], x + 38, 625, 425, 60, { fontSize: PT(23), bold: true, color: C.navy, align: 'center' }); });
  takeaway(s, '“The code ran” is not proof that the calculation or physics is correct');
  addSlideNo(s, 11);
  addNotes(s, 'Introduce the three categories before diagnosing specific examples.');
}

// 12 - Syntax vs indexing
{
  const s = pptx.addSlide('PHY4605 Content T2');
  addTitle(s, 'Syntax stops; indexing can fail silently', 'T3', 'Use the error location when one exists, then compare the line with the algorithm');
  card(s, 115, 300, 760, 500, C.paleRed, C.red);
  addText(s, 'Syntax defect', 160, 345, 650, 48, { fontSize: PT(35), bold: true, color: C.red });
  codeCard(s, 'for k = 1:numel(t_s)\n    t = t_s(k);\n    y_m(k) = y0_m + v0_mps*t - 0.5*g_mps2*t^2;\n% missing end', 155, 430, 680, 235, C.red, C.white, 21);
  addText(s, 'MATLAB cannot determine where the loop ends', 160, 705, 650, 46, { fontSize: PT(25), bold: true, color: C.red, align: 'center' });
  card(s, 1005, 300, 760, 500, C.paleGold, C.gold);
  addText(s, 'Indexing defect', 1050, 345, 650, 48, { fontSize: PT(35), bold: true, color: C.gold });
  codeCard(s, 'for k = 1:numel(t_s)\n    t = t_s(k);\n    y_bad(1) = y0_m + v0_mps*t - 0.5*g_mps2*t^2;\nend', 1045, 430, 680, 235, C.gold, C.white, 21);
  addText(s, 'Code runs, but every pass overwrites the same storage slot', 1050, 705, 650, 46, { fontSize: PT(25), bold: true, color: C.gold, align: 'center' });
  addSlideNo(s, 12);
  addNotes(s, 'Contrast a structural syntax error with an indexing error that can execute without a MATLAB syntax message.');
}

// 13 - Physical sign and validation
{
  const s = pptx.addSlide('PHY4605 Content T2');
  addTitle(s, 'Known value checks the start; physics checks the sign', 'T3', 'One validation cannot expose every possible defect');
  card(s, 115, 300, 720, 450, C.paleValid, C.teal);
  addText(s, 'Known initial value', 160, 345, 620, 48, { fontSize: PT(34), bold: true, color: C.teal, align: 'center' });
  addImageContain(s, eqInitial, { x: 235, y: 445, w: 470, h: 110 }, 375 / 81, 'LaTeX-rendered known initial value y(0)=0 m');
  addText(s, 'assert(y_m(1) == y0_m)', 170, 620, 600, 48, { fontFace: 'IBM Plex Mono', fontSize: PT(25), color: C.navy, align: 'center' });
  card(s, 1010, 300, 760, 480, C.paleRed, C.red);
  addText(s, 'Physical-sign defect', 1055, 345, 660, 48, { fontSize: PT(34), bold: true, color: C.red, align: 'center' });
  codeCard(s, 'y_wrong(k) = y0_m + v0_mps*t ...\n    + 0.5*g_mps2*t^2;', 1070, 430, 640, 160, C.red, C.white, 22);
  addText(s, 'Initial check: PASS at t = 0', 1070, 610, 640, 38, { fontSize: PT(24), bold: true, color: C.green, align: 'center' });
  addText(s, 'Physics check: FAIL - gravity acts upward', 1070, 655, 640, 38, { fontSize: PT(22), bold: true, color: C.red, align: 'center' });
  addText(s, 'Repair: subtract the gravity term', 1070, 710, 640, 38, { fontSize: PT(22), color: C.charcoal, align: 'center' });
  takeaway(s, 'Code evidence and physical reasoning should agree', C.paleValid, C.green, C.green);
  addSlideNo(s, 13);
  addNotes(s, 'Be explicit that y(0)=0 m does not detect the wrong gravity sign. The initial-value check is Core; the sign convention and predicted trajectory provide the necessary physical diagnosis.', ['known-initial-value.tex/svg/png']);
}

// 14 - Exit ticket
{
  const s = pptx.addSlide('PHY4605 Content T1');
  addTitle(s, 'Week 2 exit ticket', 'T1', 'Use the same vertical-launch model and explain your reasoning');
  const qs = [
    'Put input, calculation, output, and check in a sensible order',
    'For sample_index = 2, what time does t_s(sample_index) select?',
    'Give one syntax or indexing defect and the evidence you would inspect',
    'State the initial-value validation and one physical conclusion from the graph'
  ];
  qs.forEach((q, i) => { const y = 280 + i * 125; circleLabel(s, i + 1, 125, y); addText(s, q, 225, y + 4, 1410, 62, { fontSize: PT(30), valign: 'mid' }); if (i < 3) s.addShape(SH.line, { x: IN(225), y: IN(y + 92), w: IN(1370), h: 0, line: { color: C.grid, width: 1.25 } }); });
  takeaway(s, 'Next: solve a 2 × 2 circuit model and validate the currents', C.paleValid, C.green, C.green);
  addSlideNo(s, 14);
  addNotes(s, 'Collect short responses. Retain the distinction between a code-stop syntax defect, a wrong-index defect, and a physical/logical defect.');
}

async function repairNotesMasterOrder(file) {
  const zip = await JSZip.loadAsync(fs.readFileSync(file));
  const part = 'ppt/presentation.xml';
  let xml = await zip.file(part).async('string');
  const match = xml.match(/<p:notesMasterIdLst>[\s\S]*?<\/p:notesMasterIdLst>/);
  if (match) {
    xml = xml.replace(match[0], '');
    xml = xml.replace('</p:sldMasterIdLst>', `</p:sldMasterIdLst>${match[0]}`);
    zip.file(part, xml);
    fs.writeFileSync(file, await zip.generateAsync({ type: 'nodebuffer', compression: 'DEFLATE' }));
  }
}

async function main() {
  await pptx.writeFile({ fileName: OUT, compression: true });
  await repairNotesMasterOrder(OUT);
}

main().catch(err => {
  console.error(err);
  process.exitCode = 1;
});
