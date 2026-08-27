const path = require('node:path');
const pptxgen = require('pptxgenjs');

// Week 1 is intentionally generated from native PowerPoint text and shapes.
// It has no external image dependencies, so the deck renders headlessly from
// this folder and the code examples remain copyable in PowerPoint.

const pptx = new pptxgen();
const S = pptx.ShapeType;
const W = 13.333;
const H = 7.5;
const here = __dirname;
const packageRoot = path.resolve(here, '..', '..');
const outPath = path.join(packageRoot, 'Lecture_Slides_Week01.pptx');

const C = {
  ink: '10243E',
  navy: '082A4A',
  blue: '1677B8',
  cyan: '1BA7A1',
  teal: '0C857D',
  green: '26804B',
  amber: 'C77717',
  red: 'B3443E',
  muted: '526579',
  line: 'CBD8E4',
  pale: 'F4F7FA',
  paleBlue: 'EAF4FB',
  paleCyan: 'E8F7F5',
  paleGreen: 'EBF7EF',
  paleAmber: 'FFF5E5',
  paleRed: 'FFF0EF',
  white: 'FFFFFF',
  code: '0B2037',
  codeLine: '204A6B',
  codeText: 'F4F8FC',
  darkMuted: 'B7CBE0',
  grid: 'D9E3EC'
};

pptx.layout = 'LAYOUT_WIDE';
pptx.author = 'Computational Methods in Physics';
pptx.company = 'Universiti Putra Malaysia';
pptx.subject = 'PHY4605 Week 1 lecture';
pptx.title = 'Week 1 | From a Physics Model to a Computational Experiment';
pptx.lang = 'en-US';
pptx.theme = {
  headFontFace: 'Aptos Display',
  bodyFontFace: 'Aptos',
  lang: 'en-US'
};

function addText(slide, text, x, y, w, h, opts = {}) {
  slide.addText(text, {
    x, y, w, h,
    fontFace: opts.fontFace || 'Aptos',
    fontSize: opts.fontSize || 14,
    color: opts.color || C.ink,
    bold: opts.bold || false,
    italic: opts.italic || false,
    align: opts.align || 'left',
    valign: opts.valign || 'mid',
    margin: opts.margin === undefined ? 0 : opts.margin,
    breakLine: false,
    fit: opts.fit || 'shrink',
    paraSpaceAfterPt: opts.paraSpaceAfterPt || 0,
    bullet: opts.bullet,
    transparency: opts.transparency,
    charSpacing: opts.charSpacing,
    isTextBox: true
  });
}

function addFooter(slide, number, section = 'PHY4605  /  WEEK 1') {
  addText(slide, section, 0.62, 7.12, 3.4, 0.16, {
    fontSize: 7.5, bold: true, color: C.blue, charSpacing: 1.1
  });
  addText(slide, String(number).padStart(2, '0'), 12.24, 7.09, 0.46, 0.18, {
    fontSize: 8, color: C.muted, align: 'right'
  });
}

function addFrame(slide, kicker, title, subtitle, number, opts = {}) {
  slide.background = { color: opts.background || C.pale };
  slide.addShape(S.line, {
    x: 0.62, y: 0.38, w: 12.05, h: 0,
    line: { color: opts.topLine || C.line, pt: 1.1 }
  });
  addText(slide, kicker.toUpperCase(), 0.65, 0.16, 3.7, 0.16, {
    fontSize: 8, bold: true, color: opts.kickerColor || C.blue, charSpacing: 1.2
  });
  addText(slide, title, 0.62, 0.56, 12.05, 0.54, {
    fontFace: 'Aptos Display', fontSize: opts.titleSize || 25,
    bold: true, color: opts.titleColor || C.navy, valign: 'mid'
  });
  if (subtitle) {
    addText(slide, subtitle, 0.65, 1.14, 11.7, 0.24, {
      fontSize: opts.subtitleSize || 11.5, color: opts.subtitleColor || C.muted
    });
  }
  addFooter(slide, number, opts.section || 'PHY4605  /  WEEK 1');
}

function addCard(slide, x, y, w, h, title, body, opts = {}) {
  slide.addShape(S.roundRect, {
    x, y, w, h,
    rectRadius: 0.06,
    fill: { color: opts.fill || C.white },
    line: { color: opts.line || C.line, pt: opts.linePt || 1.0 }
  });
  if (opts.accent) {
    slide.addShape(S.rect, {
      x, y, w: 0.08, h,
      fill: { color: opts.accent }, line: { color: opts.accent }
    });
  }
  addText(slide, title, x + 0.22, y + 0.14, w - 0.42, opts.titleHeight || 0.25, {
    fontFace: 'Aptos Display', fontSize: opts.titleSize || 15.5,
    bold: true, color: opts.titleColor || C.navy, valign: 'mid'
  });
  if (body) {
    addText(slide, body, x + 0.22, y + (opts.bodyY || 0.51), w - 0.42, h - (opts.bodyY || 0.51) - 0.15, {
      fontFace: opts.bodyFont || 'Aptos', fontSize: opts.bodySize || 13,
      color: opts.bodyColor || C.ink, valign: opts.bodyValign || 'top',
      margin: opts.bodyMargin === undefined ? 0.02 : opts.bodyMargin
    });
  }
}

function addPill(slide, text, x, y, w, color, fill, opts = {}) {
  slide.addShape(S.roundRect, {
    x, y, w, h: opts.h || 0.28,
    rectRadius: 0.08,
    fill: { color: fill || color },
    line: { color: fill || color, transparency: 100 }
  });
  addText(slide, text, x, y + 0.01, w, (opts.h || 0.28) - 0.02, {
    fontSize: opts.fontSize || 8.5, bold: true, color: opts.textColor || C.white,
    align: 'center', charSpacing: opts.charSpacing || 0.3
  });
}

function addCheckpoint(slide, text, x = 9.85, y = 0.16, color = C.amber) {
  addPill(slide, `CHECKPOINT  /  ${text}`, x, y, 2.82, color, color, { h: 0.26, fontSize: 7.1 });
}

function addCode(slide, x, y, w, h, title, code, opts = {}) {
  slide.addShape(S.roundRect, {
    x, y, w, h,
    rectRadius: 0.06,
    fill: { color: opts.fill || C.code },
    line: { color: opts.line || C.codeLine, pt: 1.0 }
  });
  if (title) {
    addText(slide, title.toUpperCase(), x + 0.22, y + 0.14, w - 0.42, 0.18, {
      fontSize: 8, bold: true, color: opts.titleColor || C.darkMuted, charSpacing: 0.9
    });
  }
  addText(slide, code, x + 0.2, y + (title ? 0.42 : 0.2), w - 0.4, h - (title ? 0.55 : 0.36), {
    fontFace: opts.fontFace || 'Courier New',
    fontSize: opts.fontSize || 14.5,
    color: opts.color || C.codeText,
    valign: 'top', margin: 0.02, paraSpaceAfterPt: opts.paraSpaceAfterPt || 0,
    fit: 'shrink'
  });
}

function addStep(slide, number, title, body, x, y, w, color = C.blue, opts = {}) {
  slide.addShape(S.ellipse, {
    x, y, w: 0.36, h: 0.36,
    fill: { color }, line: { color }
  });
  addText(slide, String(number), x, y + 0.03, 0.36, 0.18, {
    fontSize: 10.5, bold: true, color: C.white, align: 'center'
  });
  addText(slide, title, x + 0.5, y - 0.02, w - 0.5, 0.21, {
    fontSize: opts.titleSize || 13.5, bold: true, color: C.navy
  });
  addText(slide, body, x + 0.5, y + 0.24, w - 0.5, opts.bodyHeight || 0.34, {
    fontSize: opts.bodySize || 11.5, color: C.muted, valign: 'top'
  });
}

function addArrow(slide, x, y, w, color = C.blue) {
  slide.addShape(S.chevron, {
    x, y, w, h: 0.32,
    fill: { color }, line: { color }
  });
}

function drawTable(slide, x, y, colWidths, rowHeights, rows, opts = {}) {
  let yy = y;
  for (let r = 0; r < rows.length; r++) {
    let xx = x;
    for (let c = 0; c < colWidths.length; c++) {
      const cell = rows[r][c];
      const cellOpts = typeof cell === 'object' ? (cell.options || {}) : {};
      const value = typeof cell === 'object' ? cell.text : cell;
      slide.addShape(S.rect, {
        x: xx, y: yy, w: colWidths[c], h: rowHeights[r],
        fill: { color: cellOpts.fill || (r === 0 ? opts.headerFill || C.navy : (r % 2 ? C.white : opts.altFill || C.pale)) },
        line: { color: cellOpts.line || opts.line || C.line, pt: opts.linePt || 0.7 }
      });
      addText(slide, value, xx + 0.11, yy + 0.04, colWidths[c] - 0.22, rowHeights[r] - 0.08, {
        fontFace: cellOpts.fontFace || opts.fontFace || 'Aptos',
        fontSize: cellOpts.fontSize || opts.fontSize || 11.5,
        color: cellOpts.color || (r === 0 ? C.white : C.ink),
        bold: cellOpts.bold || r === 0,
        align: cellOpts.align || 'left',
        valign: 'mid', margin: 0.01
      });
      xx += colWidths[c];
    }
    yy += rowHeights[r];
  }
}

function addNotes(slide, timing, checkpoint, transition) {
  slide.addNotes(`Timing: ${timing}\nCheckpoint/question: ${checkpoint}\nTransition: ${transition}`);
}

function addCurvePlot(slide, x, y, w, h, series, opts = {}) {
  const padL = 0.54;
  const padR = 0.18;
  const padT = 0.2;
  const padB = 0.48;
  const px0 = x + padL;
  const py0 = y + h - padB;
  const pw = w - padL - padR;
  const ph = h - padT - padB;
  const xMax = opts.xMax || 24;
  const yMin = opts.yMin === undefined ? 0 : opts.yMin;
  const yMax = opts.yMax || 1.05;
  const sx = value => px0 + (value / xMax) * pw;
  const sy = value => py0 - ((value - yMin) / (yMax - yMin)) * ph;

  slide.addShape(S.roundRect, {
    x, y, w, h, rectRadius: 0.05,
    fill: { color: opts.fill || C.white },
    line: { color: opts.line || C.line, pt: 0.9 }
  });
  for (let i = 0; i <= 4; i++) {
    const yy = py0 - (i / 4) * ph;
    slide.addShape(S.line, { x: px0, y: yy, w: pw, h: 0, line: { color: C.grid, pt: 0.65, dash: 'dash' } });
    addText(slide, (yMin + (i / 4) * (yMax - yMin)).toFixed(i === 0 ? 1 : 2), x + 0.05, yy - 0.08, 0.42, 0.16, { fontSize: 8.5, color: C.muted, align: 'right' });
  }
  [0, 6, 12, 18, 24].forEach(t => {
    const xx = sx(t);
    slide.addShape(S.line, { x: xx, y: py0, w: 0, h: -ph, line: { color: C.grid, pt: 0.45, dash: 'dash' } });
    addText(slide, String(t), xx - 0.18, py0 + 0.08, 0.36, 0.16, { fontSize: 8.5, color: C.muted, align: 'center' });
  });
  slide.addShape(S.line, { x: px0, y: py0, w: pw, h: 0, line: { color: C.muted, pt: 1.0 } });
  slide.addShape(S.line, { x: px0, y: py0, w: 0, h: -ph, line: { color: C.muted, pt: 1.0 } });
  addText(slide, opts.xLabel || 'time t (h)', px0 + pw / 2 - 0.65, y + h - 0.22, 1.3, 0.14, { fontSize: 8.8, color: C.muted, align: 'center' });
  addText(slide, opts.yLabel || 'N/N0', x + 0.02, y + 0.04, 0.42, 0.16, { fontSize: 8.8, color: C.muted, rotate: 270, align: 'center' });

  for (const item of series) {
    const points = item.points;
    for (let i = 1; i < points.length; i++) {
      const x1 = sx(points[i - 1][0]);
      const y1 = sy(points[i - 1][1]);
      const x2 = sx(points[i][0]);
      const y2 = sy(points[i][1]);
      slide.addShape(S.line, {
        x: x1, y: y1, w: x2 - x1, h: y2 - y1,
        line: { color: item.color, pt: item.width || 1.2, dash: item.dash }
      });
    }
    if (item.marker) {
      const stride = Math.max(1, Math.floor(points.length / 10));
      for (let i = 0; i < points.length; i += stride) {
        const xx = sx(points[i][0]);
        const yy = sy(points[i][1]);
        slide.addShape(S.ellipse, { x: xx - 0.035, y: yy - 0.035, w: 0.07, h: 0.07, fill: { color: item.color }, line: { color: item.color } });
      }
    }
  }
}

function addLegend(slide, entries, x, y, opts = {}) {
  let xx = x;
  for (const entry of entries) {
    slide.addShape(S.line, { x: xx, y: y + 0.1, w: 0.32, h: 0, line: { color: entry.color, pt: entry.width || 2.0, dash: entry.dash } });
    addText(slide, entry.label, xx + 0.4, y, entry.w || 0.9, 0.22, { fontSize: opts.fontSize || 9.2, color: C.muted });
    xx += entry.gap || (entry.w || 0.9) + 0.6;
  }
}

function exactPoints(step = 0.5) {
  const lambda = Math.log(2) / 6.0;
  const points = [];
  for (let t = 0; t <= 24.0001; t += step) points.push([Number(t.toFixed(5)), Math.exp(-lambda * t)]);
  return points;
}

function eulerPoints(dt, step = dt) {
  const lambda = Math.log(2) / 6.0;
  const factor = 1 - lambda * dt;
  const points = [];
  for (let t = 0; t <= 24.0001; t += step) points.push([Number(t.toFixed(5)), Math.pow(factor, Math.round(t / dt))]);
  return points;
}

function addNativeSlide(kicker, title, subtitle, number, builder, notes, opts = {}) {
  const slide = pptx.addSlide();
  addFrame(slide, kicker, title, subtitle, number, opts);
  if (opts.checkpoint) addCheckpoint(slide, opts.checkpoint, opts.checkpointX, opts.checkpointY, opts.checkpointColor || C.amber);
  builder(slide);
  addNotes(slide, notes.timing, notes.checkpoint, notes.transition);
  return slide;
}

function addRasterSlide(imagePath, notes) {
  const slide = pptx.addSlide();
  slide.addImage({ path: imagePath, x: 0, y: 0, w: W, h: H });
  addNotes(slide, notes.timing, notes.checkpoint, notes.transition);
  return slide;
}

// 01 — Opening: the physical question is the visual anchor.
{
  const slide = pptx.addSlide();
  slide.background = { color: C.navy };
  slide.addShape(S.rect, { x: 0, y: 0, w: 0.22, h: H, fill: { color: C.cyan }, line: { color: C.cyan } });
  addText(slide, 'PHY4605  /  COMPUTATIONAL METHODS IN PHYSICS', 0.72, 0.48, 6.8, 0.2, { fontSize: 9, bold: true, color: '84D6D0', charSpacing: 1.2 });
  addText(slide, 'From a physics model\nto a computational experiment', 0.7, 1.25, 6.4, 1.45, { fontFace: 'Aptos Display', fontSize: 32, bold: true, color: C.white, valign: 'top' });
  addText(slide, 'Week 1  |  Programming fundamentals through radioactive decay', 0.73, 2.92, 5.9, 0.28, { fontSize: 13.5, color: C.darkMuted });
  slide.addShape(S.line, { x: 0.74, y: 3.65, w: 5.55, h: 0, line: { color: '3B6283', pt: 1.1 } });
  addText(slide, 'A sample has a half-life of 6.0 h.\nHow should we simulate one day — and decide whether the answer deserves trust?', 0.73, 4.05, 5.65, 0.9, { fontSize: 20, bold: true, color: C.white, valign: 'top' });
  addPill(slide, 'LECTURE SESSION', 0.73, 6.42, 1.65, C.cyan, C.cyan, { h: 0.3, fontSize: 8.2 });
  addText(slide, 'model  →  code  →  evidence', 2.62, 6.43, 3.3, 0.24, { fontSize: 12.5, color: C.darkMuted });

  // Right-hand experiment card.
  slide.addShape(S.roundRect, { x: 7.35, y: 0.92, w: 5.28, h: 5.95, rectRadius: 0.08, fill: { color: '103B5E' }, line: { color: '2D6385', pt: 1.1 } });
  addText(slide, 'THE WORKED EXPERIMENT', 7.78, 1.34, 4.3, 0.18, { fontSize: 8.5, bold: true, color: '85D8D2', charSpacing: 1.0 });
  addText(slide, 'Radioactive decay', 7.78, 1.72, 4.1, 0.32, { fontFace: 'Aptos Display', fontSize: 22, bold: true, color: C.white });
  addText(slide, 'N(t)  =  N0 exp(-lambda t)', 7.78, 2.35, 4.2, 0.34, { fontFace: 'Courier New', fontSize: 16, color: 'E8FAF9' });
  addText(slide, 'T_half = 6.0 h', 7.78, 2.84, 2.25, 0.24, { fontSize: 14, bold: true, color: 'B7CBE0' });
  addText(slide, 'tMax = 24.0 h', 10.0, 2.84, 2.05, 0.24, { fontSize: 14, bold: true, color: 'B7CBE0', align: 'right' });
  const timelineX = 7.88;
  const timelineY = 4.14;
  slide.addShape(S.line, { x: timelineX, y: timelineY, w: 4.12, h: 0, line: { color: '77B8C9', pt: 2.0 } });
  const fractions = [['0 h', '1.000'], ['6 h', '0.500'], ['12 h', '0.250'], ['18 h', '0.125'], ['24 h', '0.0625']];
  fractions.forEach((pair, i) => {
    const xx = timelineX + i * 1.03;
    slide.addShape(S.ellipse, { x: xx - 0.09, y: timelineY - 0.09, w: 0.18, h: 0.18, fill: { color: i === 4 ? C.amber : C.cyan }, line: { color: i === 4 ? C.amber : C.cyan } });
    addText(slide, pair[0], xx - 0.25, timelineY + 0.22, 0.5, 0.18, { fontSize: 9.5, color: C.darkMuted, align: 'center' });
    addText(slide, pair[1], xx - 0.27, timelineY - 0.55, 0.54, 0.18, { fontFace: 'Courier New', fontSize: 9.5, color: i === 4 ? 'FFD18E' : C.white, align: 'center' });
  });
  addText(slide, 'The number at 24 h is a reference, not yet a numerical method.', 7.78, 5.32, 4.35, 0.52, { fontSize: 14.5, color: C.white, valign: 'top' });
  addText(slide, '01', 12.22, 7.09, 0.46, 0.18, { fontSize: 8, color: C.darkMuted, align: 'right' });
  addNotes(slide, '0–5 min', 'Predict: what fraction remains after one half-life? Can a computed population be negative?', 'Move from the motivating question to the roadmap and learning outcomes.');
}

// 02 — Outcomes and course roadmap. Raster-only image generated with the
// scientific-educational-image-slides workflow; it is the sole visible object.
addRasterSlide(path.join(here, '02_The_Computational_Physics_Cycle.png'), {
  timing: '', checkpoint: 'What makes a result trustworthy?', transition: 'Use the computational-physics cycle to show where the three jobs sit.'
});

// 03 — Cycle diagram.
addNativeSlide('THE WORKFLOW', 'A computational experiment is a loop, not a single command', 'Each arrow carries a decision that should remain visible.', 3, slide => {
  const nodes = [
    { x: 0.86, y: 2.15, w: 2.2, h: 1.12, title: 'Physics question', body: 'What should we predict?', fill: C.paleBlue, color: C.blue },
    { x: 3.38, y: 1.48, w: 2.25, h: 1.12, title: 'Model + assumptions', body: 'What is included?', fill: C.paleCyan, color: C.teal },
    { x: 6.02, y: 1.48, w: 2.25, h: 1.12, title: 'Discretise', body: 'What is approximated?', fill: C.paleAmber, color: C.amber },
    { x: 8.66, y: 2.15, w: 2.25, h: 1.12, title: 'Algorithm', body: 'What repeats?', fill: C.paleGreen, color: C.green },
    { x: 6.02, y: 3.92, w: 2.25, h: 1.12, title: 'MATLAB calculation', body: 'What did we run?', fill: C.paleBlue, color: C.blue },
    { x: 3.38, y: 3.92, w: 2.25, h: 1.12, title: 'Validate + interpret', body: 'Why believe it?', fill: C.paleRed, color: C.red }
  ];
  nodes.forEach(n => addCard(slide, n.x, n.y, n.w, n.h, n.title, n.body, { fill: n.fill, line: n.color, titleColor: n.color, titleSize: 13.5, bodySize: 11.2, bodyY: 0.54, accent: n.color }));
  addArrow(slide, 3.05, 2.47, 0.25, C.blue);
  addArrow(slide, 5.72, 1.93, 0.25, C.teal);
  addArrow(slide, 8.36, 2.47, 0.25, C.amber);
  addArrow(slide, 8.02, 3.42, 0.25, C.green);
  addArrow(slide, 5.72, 4.35, 0.25, C.blue);
  addArrow(slide, 3.06, 3.42, 0.25, C.red);
  addText(slide, 'The last question loops back to the first: does the computation answer the physics question?', 1.02, 5.64, 10.95, 0.38, { fontSize: 17, bold: true, color: C.navy, align: 'center' });
  addCard(slide, 1.95, 6.16, 9.45, 0.66, 'Rule of thumb', 'A graph is evidence only when the model, units, algorithm, and checks are visible.', { fill: C.white, line: C.line, titleColor: C.navy, titleSize: 12.5, bodySize: 11.5, bodyY: 0.30, titleHeight: 0.18 });
}, { timing: '12–18 min', checkpoint: 'At which stage can a unit mistake enter?', transition: 'Zoom into the MATLAB environment that holds this loop.' }, { checkpoint: '12–18 min' });

// 04 — MATLAB environment.
addNativeSlide('MATLAB BASICS', 'Four views, one repeatable computational experiment', 'Know where to try, save, inspect, and run.', 4, slide => {
  addCard(slide, 0.72, 1.62, 5.72, 1.84, 'Command Window', 'Try one expression and inspect its answer.\n\n>> log(2)\nans = 0.6931', { fill: C.paleBlue, line: 'B9D9EE', accent: C.blue, titleColor: C.blue, bodyFont: 'Courier New', bodySize: 14.5 });
  addCard(slide, 6.88, 1.62, 5.72, 1.84, 'Editor / Live Editor', 'Save the sequence of choices: text + code + output.\n\nThis becomes the experiment record.', { fill: C.paleCyan, line: 'B9DFDA', accent: C.cyan, titleColor: C.teal, bodySize: 14.2 });
  addCard(slide, 0.72, 3.86, 5.72, 1.84, 'Workspace', 'Variables currently in memory.\n\nUseful for inspection — unsafe as a hidden input.\nStart fresh with clearvars.', { fill: C.paleAmber, line: 'EFD3A4', accent: C.amber, titleColor: C.amber, bodySize: 13.6 });
  addCard(slide, 6.88, 3.86, 5.72, 1.84, 'Current Folder', 'The files MATLAB can see.\n\nKeep the Live Script and related files together.', { fill: C.white, line: C.line, accent: C.navy, titleColor: C.navy, bodySize: 14 });
  addCode(slide, 1.08, 6.05, 11.45, 0.77, 'fresh-run habit', 'clearvars; close all; clc', { fontSize: 17, titleColor: '86D7D0' });
}, { timing: '18–25 min', checkpoint: 'Where would you test log(2), and where would you save the sequence?', transition: 'Turn the environment into a first small script with visible units.' });

// 05 — Variables, operators, comments, names.
addNativeSlide('MATLAB BASICS', 'Readable names make units and assumptions harder to hide', 'The syntax is small; the naming discipline is the real habit.', 5, slide => {
  addCode(slide, 0.72, 1.62, 6.55, 4.75, 'parameter record', `% name the quantity and the unit\nradius_m = 0.02;          % m\narea_m2 = pi*radius_m^2;  % m^2\n\nT_half_h = 6.0;\nlambda_per_h = log(2)/T_half_h; % 1/h`, { fontSize: 15.2 });
  addText(slide, 'Four ideas to notice', 7.75, 1.65, 4.5, 0.26, { fontSize: 18, bold: true, color: C.navy });
  addStep(slide, 1, 'Assignment', 'Use = to store a value in a named variable.', 7.78, 2.2, 4.85, C.blue, { bodyHeight: 0.28 });
  addStep(slide, 2, 'Operators', 'Use +, -, *, /, and ^ to translate an expression.', 7.78, 3.04, 4.85, C.cyan, { bodyHeight: 0.28 });
  addStep(slide, 3, 'Comments', 'Use % to explain a choice to the next reader.', 7.78, 3.88, 4.85, C.amber, { bodyHeight: 0.28 });
  addStep(slide, 4, 'Unit naming', 'A suffix such as _h or _m2 keeps dimensions visible.', 7.78, 4.72, 4.85, C.green, { bodyHeight: 0.3 });
  addCard(slide, 7.74, 5.68, 4.86, 0.78, 'Quick check', 'What are the units of lambda_per_h * dt_h?', { fill: C.paleGreen, line: 'B9DDBF', titleColor: C.green, titleSize: 12.4, bodySize: 11.3, bodyY: 0.37, titleHeight: 0.18 });
}, { timing: '25–32 min', checkpoint: 'Predict the units before running the expression.', transition: 'Use the same naming habits in the Lab 01 warm-up.' });

// 06 — Lab 01 unit conversion.
addNativeSlide('LAB 01 WARM-UP', 'A unit conversion is already a small computational model', 'Make the conversion path explicit before asking MATLAB for a number.', 6, slide => {
  addCard(slide, 0.72, 1.62, 4.22, 4.55, 'Given', 'Tank volume\n\n2 gallons + 4 pints\n\n8 pints = 1 gallon\n1.76 pints = 1 litre\n\nQuestion\nWhat is the volume in litres?', { fill: C.paleBlue, line: 'B9D9EE', accent: C.blue, titleColor: C.blue, bodySize: 16, bodyY: 0.58 });
  addCode(slide, 5.3, 1.62, 7.27, 4.55, 'transparent translation', `gallons = 2;\npints = 4;\npintsPerGallon = 8;\npintsPerLitre = 1.76;\n\ntotalPints = gallons*pintsPerGallon + pints;\nvolumeLitres = totalPints/pintsPerLitre;\n\nfprintf('Volume = %.3f L\\n', volumeLitres)`, { fontSize: 14.8, titleColor: '86D7D0' });
  addPill(slide, 'EXPECTED OUTPUT  /  11.364 L', 3.68, 6.42, 5.98, C.green, C.green, { h: 0.32, fontSize: 10 });
  addText(slide, 'Lab 01 also uses faulty statements and a quadratic-formula warm-up — the same syntax habits apply.', 1.05, 6.92, 11.2, 0.17, { fontSize: 9.6, color: C.muted, align: 'center' });
}, { timing: '32–40 min', checkpoint: 'Pair task: which line makes the unit conversion visible?', transition: 'Now replace the warm-up with a physical model whose value changes over time.' });

// 07 — Physical model.
addNativeSlide('PHYSICAL MODEL', 'Radioactive decay gives us a controlled question', 'A model is an equation plus the assumptions that make it useful.', 7, slide => {
  addCard(slide, 0.72, 1.62, 4.2, 4.5, 'Question', 'A closed sample has a constant half-life of 6.0 h.\n\nHow many undecayed nuclei remain after one day?', { fill: C.paleBlue, line: 'B9D9EE', accent: C.blue, titleColor: C.blue, bodySize: 17, bodyY: 0.58 });
  slide.addShape(S.roundRect, { x: 5.3, y: 1.62, w: 7.27, h: 2.1, rectRadius: 0.06, fill: { color: C.navy }, line: { color: C.navy } });
  addText(slide, 'MODEL EQUATION', 5.62, 1.9, 2.3, 0.18, { fontSize: 8.5, bold: true, color: '86D7D0', charSpacing: 1.0 });
  addText(slide, 'dN/dt = -lambda N', 5.62, 2.28, 6.2, 0.45, { fontFace: 'Courier New', fontSize: 24, bold: true, color: C.white });
  addText(slide, 'N(0) = N0', 5.64, 3.0, 2.7, 0.24, { fontFace: 'Courier New', fontSize: 15, color: 'D5E9F5' });
  addCard(slide, 5.3, 4.02, 2.24, 2.1, 'Included', 'Constant lambda\nClosed sample\nSame time unit', { fill: C.paleGreen, line: 'B9DDBF', accent: C.green, titleColor: C.green, bodySize: 13.2 });
  addCard(slide, 7.84, 4.02, 2.24, 2.1, 'Ignored', 'Changing decay\nInflow or outflow\nInteractions', { fill: C.paleAmber, line: 'EFD3A4', accent: C.amber, titleColor: C.amber, bodySize: 13.2 });
  addCard(slide, 10.38, 4.02, 2.19, 2.1, 'Predict', 'At 6 h?\nAt 24 h?\nCan N < 0?', { fill: C.paleCyan, line: 'B9DFDA', accent: C.cyan, titleColor: C.teal, bodySize: 13.2 });
}, { timing: '40–48 min', checkpoint: 'Which assumption would fail if nuclei entered the sample?', transition: 'Map the symbols and units into names a MATLAB script can carry.' });

// 08 — Parameter map.
addNativeSlide('PHYSICAL MODEL', 'Map physics symbols to MATLAB names before coding', 'Use names that expose meaning and time units.', 8, slide => {
  drawTable(slide, 0.72, 1.62, [1.32, 2.38, 3.42], [0.48, 0.58, 0.58, 0.58, 0.58, 0.58], [
    [{ text: 'Physics', options: { fill: C.navy, color: C.white } }, { text: 'MATLAB name', options: { fill: C.navy, color: C.white } }, { text: 'Meaning / unit', options: { fill: C.navy, color: C.white } }],
    ['N0', { text: 'N0', options: { fontFace: 'Courier New', bold: true } }, 'initial population / nuclei'],
    ['T_half', { text: 'T_half_h', options: { fontFace: 'Courier New', bold: true } }, 'half-life / h'],
    ['lambda', { text: 'lambda_per_h', options: { fontFace: 'Courier New', bold: true } }, 'decay constant / 1/h'],
    ['tMax', { text: 'tMax_h', options: { fontFace: 'Courier New', bold: true } }, 'final time / h'],
    ['dt', { text: 'dt_h', options: { fontFace: 'Courier New', bold: true } }, 'numerical step / h']
  ], { fontSize: 11.2, altFill: 'F9FBFD' });
  addCode(slide, 8.14, 1.62, 4.44, 2.62, 'parameter record', `N0 = 1000;\nT_half_h = 6.0;\ntMax_h = 24.0;\ndt_h = 0.5;\nlambda_per_h = log(2)/T_half_h;`, { fontSize: 13.8, titleColor: '86D7D0' });
  addCard(slide, 8.14, 4.62, 4.44, 1.75, 'Dimension check', 'lambda_per_h * dt_h\n\n(1/h) * h = 1\n\nThe factor in the Euler update is dimensionless.', { fill: C.paleGreen, line: 'B9DDBF', accent: C.green, titleColor: C.green, bodyFont: 'Courier New', bodySize: 14.2, bodyY: 0.52 });
}, { timing: '48–55 min', checkpoint: 'Why is lambda_per_h named with _per_h?', transition: 'Use the exact solution as a reference before approximating anything.' });

// 09 — Exact reference and prediction.
addNativeSlide('REFERENCE SOLUTION', 'The exact answer is a benchmark for the numerical experiment', 'It tells us what to expect before we write a loop.', 9, slide => {
  slide.addShape(S.roundRect, { x: 0.72, y: 1.62, w: 5.38, h: 2.03, rectRadius: 0.06, fill: { color: C.navy }, line: { color: C.navy } });
  addText(slide, 'EXACT SOLUTION', 1.03, 1.9, 2.2, 0.18, { fontSize: 8.5, bold: true, color: '86D7D0', charSpacing: 1.0 });
  addText(slide, 'N_exact(t) = N0 exp(-lambda t)', 1.03, 2.32, 4.55, 0.4, { fontFace: 'Courier New', fontSize: 19, bold: true, color: C.white });
  addText(slide, 'lambda = ln(2) / T_half = 0.1155 1/h', 1.03, 3.0, 4.65, 0.22, { fontFace: 'Courier New', fontSize: 12.3, color: 'D5E9F5' });
  addText(slide, 'At tMax = 24 h:   N/N0 = 0.0625', 1.03, 3.32, 4.6, 0.22, { fontSize: 14, bold: true, color: 'FFD18E' });

  const timelineX = 6.82;
  const timelineY = 3.0;
  slide.addShape(S.line, { x: timelineX, y: timelineY, w: 5.06, h: 0, line: { color: C.blue, pt: 2.0 } });
  const points = [['0 h', '1.000'], ['6 h', '0.500'], ['12 h', '0.250'], ['18 h', '0.125'], ['24 h', '0.0625']];
  points.forEach((pair, i) => {
    const xx = timelineX + i * 1.265;
    const yy = timelineY - i * 0.27;
    slide.addShape(S.ellipse, { x: xx - 0.095, y: yy - 0.095, w: 0.19, h: 0.19, fill: { color: i === 4 ? C.amber : C.blue }, line: { color: i === 4 ? C.amber : C.blue } });
    addText(slide, pair[0], xx - 0.28, timelineY + 0.28, 0.56, 0.18, { fontSize: 9.5, color: C.muted, align: 'center' });
    addText(slide, pair[1], xx - 0.33, yy - 0.39, 0.66, 0.18, { fontFace: 'Courier New', fontSize: 9.8, color: i === 4 ? C.amber : C.navy, align: 'center' });
  });
  addText(slide, 'Prediction before compute', 0.78, 4.36, 3.1, 0.25, { fontSize: 17, bold: true, color: C.navy });
  addStep(slide, 1, 'One half-life', 'The exact fraction should be 0.5.', 0.8, 4.88, 3.55, C.blue, { bodyHeight: 0.26 });
  addStep(slide, 2, 'Four half-lives', 'The exact fraction should be 0.0625.', 0.8, 5.55, 3.55, C.cyan, { bodyHeight: 0.26 });
  addStep(slide, 3, 'Physical sign', 'N < 0 would be an implementation warning.', 0.8, 6.22, 3.55, C.red, { bodyHeight: 0.26 });
  addCard(slide, 5.15, 4.52, 7.42, 1.95, 'The reference is not the experiment', 'We still need to carry out the discrete update, compare it with this benchmark, and test the timestep. The point is to make approximation visible.', { fill: C.white, line: C.line, accent: C.amber, titleColor: C.amber, bodySize: 15.2 });
}, { timing: '55–62 min', checkpoint: 'Write down 0.5 and 0.0625 before looking at MATLAB output.', transition: 'Approximate the derivative one step at a time with forward Euler.' });

// 10 — Euler derivation.
addNativeSlide('NUMERICAL METHOD', 'Forward Euler turns a derivative into a next-value rule', 'The computer repeats one local approximation across the time array.', 10, slide => {
  addText(slide, 'Start with the model', 0.78, 1.72, 2.4, 0.22, { fontSize: 15, bold: true, color: C.muted });
  addText(slide, 'dN/dt = -lambda N', 0.78, 2.12, 3.6, 0.36, { fontFace: 'Courier New', fontSize: 21, bold: true, color: C.navy });
  addArrow(slide, 4.2, 2.12, 0.42, C.blue);
  addText(slide, 'Approximate the slope', 4.94, 1.72, 2.55, 0.22, { fontSize: 15, bold: true, color: C.muted });
  addText(slide, '(N(n+1) - N(n)) / dt  ≈  -lambda*N(n)', 4.94, 2.12, 4.1, 0.56, { fontFace: 'Courier New', fontSize: 16.3, bold: true, color: C.navy, valign: 'top' });
  addArrow(slide, 9.25, 2.12, 0.42, C.cyan);
  addText(slide, 'Rearrange', 9.96, 1.72, 1.8, 0.22, { fontSize: 15, bold: true, color: C.muted });
  addText(slide, 'N(n+1) = N(n)*(1 - lambda*dt)', 9.96, 2.12, 2.45, 0.76, { fontFace: 'Courier New', fontSize: 15.2, bold: true, color: C.teal, valign: 'top' });
  slide.addShape(S.roundRect, { x: 0.78, y: 3.52, w: 11.78, h: 1.08, rectRadius: 0.06, fill: { color: C.paleAmber }, line: { color: 'EFD3A4', pt: 1.0 } });
  addText(slide, 'What changed?', 1.04, 3.82, 1.55, 0.22, { fontSize: 15.5, bold: true, color: C.amber });
  addText(slide, 'The physics model stayed the same. Only time was discretised, so dt becomes part of the numerical method and must be tested.', 2.75, 3.73, 9.25, 0.42, { fontSize: 16, color: C.ink, valign: 'top' });
  addCard(slide, 0.78, 5.04, 3.55, 1.34, 'Smaller dt', 'Usually improves the approximation here.', { fill: C.paleGreen, line: 'B9DDBF', accent: C.green, titleColor: C.green, bodySize: 13.1 });
  addCard(slide, 4.88, 5.04, 3.55, 1.34, 'More steps', 'Increases the computational cost.', { fill: C.paleBlue, line: 'B9D9EE', accent: C.blue, titleColor: C.blue, bodySize: 13.1 });
  addCard(slide, 8.98, 5.04, 3.58, 1.34, 'Large lambda*dt', 'Can make N negative — unphysical.', { fill: C.paleRed, line: 'E6BCB8', accent: C.red, titleColor: C.red, bodySize: 13.1 });
}, { timing: '62–70 min', checkpoint: 'Which part is the approximation: the model or the timestep?', transition: 'Store the time points first so every computed N has a matching time.' });

// 11 — Time array and indexing.
addNativeSlide('MATLAB STRUCTURE', 'Build the aligned time array before the loop', 'The first element stores the initial condition; the rest are destinations.', 11, slide => {
  addCode(slide, 0.72, 1.62, 4.8, 2.45, 'storage plan', `t_h = 0:dt_h:tMax_h;\nN = zeros(size(t_h));\nN(1) = N0;`, { fontSize: 17.5, titleColor: '86D7D0' });
  addText(slide, 'MATLAB index', 6.0, 1.7, 1.5, 0.18, { fontSize: 10, bold: true, color: C.muted, charSpacing: 0.8 });
  const cells = [
    ['1', '0 h', 'N0'], ['2', 'dt_h', 'next'], ['3', '2*dt_h', 'next'], ['4', '3*dt_h', 'next'], ['…', '…', '…']
  ];
  cells.forEach((cell, i) => {
    const xx = 6.0 + i * 1.18;
    const fill = i === 0 ? C.paleAmber : C.paleBlue;
    const border = i === 0 ? 'EFD3A4' : 'B9D9EE';
    slide.addShape(S.roundRect, { x: xx, y: 2.12, w: 0.9, h: 1.05, rectRadius: 0.04, fill: { color: fill }, line: { color: border, pt: 1.0 } });
    addText(slide, cell[0], xx, 2.28, 0.9, 0.22, { fontSize: 15, bold: true, color: C.navy, align: 'center' });
    addText(slide, cell[1], xx - 0.12, 2.62, 1.14, 0.18, { fontFace: 'Courier New', fontSize: 9.3, color: C.muted, align: 'center' });
    addText(slide, cell[2], xx - 0.12, 2.91, 1.14, 0.16, { fontSize: 9.2, color: i === 0 ? C.amber : C.blue, align: 'center' });
  });
  addText(slide, 'One time value  ↔  one population value', 6.0, 3.52, 6.1, 0.3, { fontSize: 16.5, bold: true, color: C.navy, align: 'center' });
  addCard(slide, 0.72, 4.52, 3.75, 1.72, 'Preallocation', 'zeros(size(t_h)) makes the storage plan explicit before values are filled.', { fill: C.paleGreen, line: 'B9DDBF', accent: C.green, titleColor: C.green, bodySize: 13.3 });
  addCard(slide, 4.8, 4.52, 3.75, 1.72, 'Initial condition', 'N(1) = N0 is not optional. It anchors the entire history.', { fill: C.paleAmber, line: 'EFD3A4', accent: C.amber, titleColor: C.amber, bodySize: 13.3 });
  addCard(slide, 8.88, 4.52, 3.68, 1.72, 'Alignment check', 'The arrays must have equal length before plot(t_h, N/N0).', { fill: C.paleBlue, line: 'B9D9EE', accent: C.blue, titleColor: C.blue, bodySize: 13.3 });
}, { timing: '70–77 min', checkpoint: 'What does t_h(1) mean? What does N(1) mean?', transition: 'Fill the remaining array entries with one readable for loop.' });

// 12 — Euler loop.
addNativeSlide('MATLAB STRUCTURE', 'The for loop should look like the algorithm', 'Read current value → apply rule → store next value.', 12, slide => {
  addCode(slide, 0.72, 1.62, 6.12, 4.7, 'the repeated update', `for n = 1:numel(t_h)-1\n    N(n+1) = N(n)*(1 - ...\n        lambda_per_h*dt_h);\nend`, { fontSize: 19, titleColor: '86D7D0' });
  addStep(slide, 1, 'Read current value', 'N(n) belongs to the current time t_h(n).', 7.55, 1.92, 4.62, C.blue, { bodyHeight: 0.3, titleSize: 14 });
  addStep(slide, 2, 'Apply the rule', 'Multiply by the dimensionless factor 1 - lambda*dt.', 7.55, 3.03, 4.62, C.cyan, { bodyHeight: 0.38, titleSize: 14 });
  addStep(slide, 3, 'Store next value', 'N(n+1) belongs to t_h(n+1), preserving the history.', 7.55, 4.25, 4.62, C.amber, { bodyHeight: 0.38, titleSize: 14 });
  addCard(slide, 7.55, 5.47, 4.62, 0.84, 'Classic off-by-one error', 'Writing N(n) on the left overwrites the current value.', { fill: C.paleRed, line: 'E6BCB8', accent: C.red, titleColor: C.red, titleSize: 12.8, bodySize: 11.2, bodyY: 0.42, titleHeight: 0.18 });
}, { timing: '77–85 min', checkpoint: 'Why does the loop stop at numel(t_h)-1?', transition: 'Turn one run into a controlled timestep experiment.' });

// 13 — Experiment plan.
addNativeSlide('NUMERICAL EXPERIMENT', 'Hold the physics fixed; vary one numerical choice', 'A fair experiment changes dt and records both result and cost.', 13, slide => {
  addText(slide, 'What stays fixed?', 0.8, 1.68, 2.7, 0.22, { fontSize: 17, bold: true, color: C.navy });
  addText(slide, 'What changes?', 4.63, 1.68, 2.7, 0.22, { fontSize: 17, bold: true, color: C.navy });
  addText(slide, 'What do we record?', 8.47, 1.68, 3.3, 0.22, { fontSize: 17, bold: true, color: C.navy });
  addCard(slide, 0.72, 2.08, 3.45, 2.35, 'Physical model', 'N0 = 1000\nT_half_h = 6.0 h\ntMax_h = 24.0 h\nlambda_per_h = log(2)/T_half_h', { fill: C.paleBlue, line: 'B9D9EE', accent: C.blue, titleColor: C.blue, bodyFont: 'Courier New', bodySize: 13.4 });
  addCard(slide, 4.56, 2.08, 3.45, 2.35, 'Numerical resolution', 'dtValues_h = [2.0 1.0 0.5 0.1]\n\nSame update rule\nDifferent number of steps', { fill: C.paleCyan, line: 'B9DFDA', accent: C.cyan, titleColor: C.teal, bodyFont: 'Courier New', bodySize: 13.3 });
  addCard(slide, 8.4, 2.08, 4.16, 2.35, 'Evidence', 'N_Euler(24 h)/N0\nrelative error\nstep count\nplot against exact reference', { fill: C.paleAmber, line: 'EFD3A4', accent: C.amber, titleColor: C.amber, bodySize: 14 });
  addCode(slide, 0.72, 4.88, 7.28, 1.35, 'experiment skeleton', `dtValues_h = [2.0 1.0 0.5 0.1];\nfor k = 1:numel(dtValues_h)\n    % create t, run Euler, record result\nend`, { fontSize: 13.4, titleColor: '86D7D0' });
  addCard(slide, 8.4, 4.88, 4.16, 1.35, 'Cost is part of the result', 'Steps for dt = 2.0, 1.0, 0.5, 0.1 h:\n12, 24, 48, 240', { fill: C.paleGreen, line: 'B9DDBF', accent: C.green, titleColor: C.green, bodyFont: 'Courier New', bodySize: 13.3 });
}, { timing: '85–92 min', checkpoint: 'What must not change when we compare dt?', transition: 'Read the curves first, then inspect the numerical table.' });

// 14 — Timestep comparison plot.
addNativeSlide('NUMERICAL EXPERIMENT', 'The curves separate when dt is coarse', 'All four runs solve the same model; only the time resolution changes.', 14, slide => {
  const series = [
    { points: exactPoints(0.25), color: C.navy, width: 2.0 },
    { points: eulerPoints(2.0, 2.0), color: C.red, width: 1.7, marker: true },
    { points: eulerPoints(0.5, 0.5), color: C.amber, width: 1.5, marker: true },
    { points: eulerPoints(0.1, 0.1), color: C.cyan, width: 1.25, marker: true }
  ];
  addCurvePlot(slide, 0.72, 1.62, 7.55, 4.8, series, { yMax: 1.05, xLabel: 'time t (h)', yLabel: 'fraction N/N0' });
  addLegend(slide, [
    { label: 'exact', color: C.navy, width: 2.0, w: 0.72, gap: 1.28 },
    { label: 'dt=2.0 h', color: C.red, width: 1.7, w: 1.0, gap: 1.55 },
    { label: 'dt=0.5 h', color: C.amber, width: 1.5, w: 1.0, gap: 1.55 },
    { label: 'dt=0.1 h', color: C.cyan, width: 1.5, w: 1.0, gap: 1.45 }
  ], 1.3, 6.56, { fontSize: 9.1 });
  addCard(slide, 8.65, 1.62, 3.92, 1.47, 'Read the shape', 'Coarse Euler steps fall below the exact curve at 24 h. Fine steps track it more closely.', { fill: C.paleBlue, line: 'B9D9EE', accent: C.blue, titleColor: C.blue, bodySize: 13.2 });
  addCard(slide, 8.65, 3.37, 3.92, 1.47, 'Do not stop at “looks close”', 'The final value and an error measure make the comparison inspectable.', { fill: C.paleAmber, line: 'EFD3A4', accent: C.amber, titleColor: C.amber, bodySize: 13.2 });
  addCard(slide, 8.65, 5.12, 3.92, 1.3, 'Question', 'Which run would you choose for a first report — and what evidence would you cite?', { fill: C.paleCyan, line: 'B9DFDA', accent: C.cyan, titleColor: C.teal, bodySize: 13.2 });
}, { timing: '92–100 min', checkpoint: 'Which curve is the reference? Which curve costs the most?', transition: 'Quantify the visual gap with the approved convergence table.' });

// 15 — Error/convergence table and stability.
addNativeSlide('ERROR + CONVERGENCE', 'Smaller dt improves the result here — at a measurable cost', 'The table is the evidence behind the visual claim.', 15, slide => {
  drawTable(slide, 0.72, 1.62, [1.08, 1.15, 1.82, 1.55, 1.1], [0.46, 0.55, 0.55, 0.55, 0.55], [
    [{ text: 'dt (h)' }, { text: 'lambda*dt' }, { text: 'Euler/N0 at 24 h' }, { text: 'error' }, { text: 'steps' }],
    ['2.0', '0.2310', '0.042735', '31.62%', '12'],
    ['1.0', '0.1155', '0.052536', '15.94%', '24'],
    ['0.5', '0.0578', '0.057505', '7.99%', '48'],
    ['0.1', '0.0116', '0.061499', '1.60%', '240']
  ], { fontSize: 10.2, altFill: 'F9FBFD' });
  addCard(slide, 0.72, 5.0, 6.7, 1.35, 'Reference at 24 h', 'Exact N/N0 = 0.0625. The finest run is closest, but every claim should name the chosen dt and its error.', { fill: C.paleGreen, line: 'B9DDBF', accent: C.green, titleColor: C.green, bodySize: 13.7 });
  addText(slide, 'relative error (%)', 8.12, 1.68, 2.2, 0.18, { fontSize: 10, bold: true, color: C.muted });
  const barX = 8.24;
  const barY = 2.2;
  const barW = 0.7;
  const barH = 3.1;
  const maxErr = 35;
  [0, 10, 20, 30].forEach(v => {
    const yy = barY + barH - (v / maxErr) * barH;
    slide.addShape(S.line, { x: 7.98, y: yy, w: 4.3, h: 0, line: { color: C.grid, pt: 0.65, dash: 'dash' } });
    addText(slide, String(v), 7.62, yy - 0.08, 0.3, 0.16, { fontSize: 8.5, color: C.muted, align: 'right' });
  });
  const errors = [31.62, 15.94, 7.99, 1.60];
  const labels = ['2.0', '1.0', '0.5', '0.1'];
  errors.forEach((err, i) => {
    const xx = barX + i * 0.96;
    const hh = (err / maxErr) * barH;
    slide.addShape(S.rect, { x: xx, y: barY + barH - hh, w: barW, h: hh, fill: { color: i === 3 ? C.cyan : C.amber }, line: { color: i === 3 ? C.cyan : C.amber } });
    addText(slide, `${err.toFixed(2)}%`, xx - 0.12, barY + barH - hh - 0.25, 0.94, 0.16, { fontSize: 8.6, color: C.navy, bold: true, align: 'center' });
    addText(slide, `dt=${labels[i]}`, xx - 0.12, barY + barH + 0.1, 0.94, 0.16, { fontSize: 8.6, color: C.muted, align: 'center' });
  });
  addText(slide, 'A numerical result includes accuracy and cost.', 7.95, 5.82, 4.62, 0.25, { fontSize: 14.5, bold: true, color: C.navy, align: 'center' });
}, { timing: '100–108 min', checkpoint: 'What improved, and what did it cost?', transition: 'Before reporting the number, run validation and reproducibility checks.' });

// 16 — Validation and reproducibility.
addNativeSlide('VALIDATION', 'A trustworthy result leaves a trail of checks', 'Fresh run, visible assumptions, and a reference make the computation reproducible.', 16, slide => {
  const checks = [
    ['1', 'Physics', 'Question, variables, assumptions, expected trend', C.blue, C.paleBlue],
    ['2', 'Units', 'lambda and t use the same time unit', C.cyan, C.paleCyan],
    ['3', 'Algorithm', 'Update rule, initial condition, index range', C.green, C.paleGreen],
    ['4', 'Numerics', 'At least two dt values and a relative error', C.amber, C.paleAmber],
    ['5', 'Communication', 'Labels, units, legend, and one interpretation', C.red, C.paleRed]
  ];
  checks.forEach((c, i) => {
    const yy = 1.62 + i * 0.85;
    slide.addShape(S.roundRect, { x: 0.72, y: yy, w: 7.3, h: 0.66, rectRadius: 0.04, fill: { color: c[4] }, line: { color: c[3], pt: 0.9 } });
    slide.addShape(S.ellipse, { x: 0.92, y: yy + 0.15, w: 0.34, h: 0.34, fill: { color: c[3] }, line: { color: c[3] } });
    addText(slide, c[0], 0.92, yy + 0.19, 0.34, 0.16, { fontSize: 10, bold: true, color: C.white, align: 'center' });
    addText(slide, c[1], 1.5, yy + 0.13, 1.35, 0.19, { fontSize: 13.2, bold: true, color: c[3] });
    addText(slide, c[2], 2.92, yy + 0.13, 4.75, 0.26, { fontSize: 12.4, color: C.ink });
  });
  addCode(slide, 8.45, 1.62, 4.12, 2.45, 'validation snippets', `assert(abs(N(1)-N0) < eps(N0))\nassert(abs(N_exact_fraction(end)\n    - 0.0625) < 1e-12)\nassert(all(isfinite(N)))\nassert(all(N >= 0))`, { fontSize: 11.8, titleColor: '86D7D0' });
  addCard(slide, 8.45, 4.4, 4.12, 1.55, 'Reproducibility record', 'Parameters + units\ndt + tMax + step count\nMATLAB version if relevant\nvalidation evidence', { fill: C.white, line: C.line, accent: C.navy, titleColor: C.navy, bodySize: 13.2 });
  addPill(slide, 'VALIDATION CHECKS PASSED', 8.87, 6.23, 3.3, C.green, C.green, { h: 0.32, fontSize: 9.2 });
}, { timing: '108–115 min', checkpoint: 'Which check catches a hidden old Workspace value?', transition: 'Use responsible AI as a helper for syntax, never as a substitute for evidence.' });

// 17 — Responsible AI and exit ticket.
addNativeSlide('RESPONSIBLE COMPUTING', 'AI can suggest syntax; it cannot certify physics', 'Keep the model, tests, and interpretation under human control.', 17, slide => {
  addCard(slide, 0.72, 1.62, 5.45, 3.1, 'A safe assistance pattern', '1  Ask for an explanation or syntax suggestion\n2  Read the code line by line\n3  Check units and limiting cases\n4  Compare with N_exact\n5  State the test you performed', { fill: C.paleGreen, line: 'B9DDBF', accent: C.green, titleColor: C.green, bodySize: 14.2, bodyY: 0.54 });
  addCard(slide, 6.52, 1.62, 6.05, 3.1, 'What the assistant cannot establish', 'Whether the physical assumptions fit the sample\nWhether lambda and dt use compatible units\nWhether indexing preserved the history\nWhether the chosen accuracy is adequate for the question', { fill: C.paleRed, line: 'E6BCB8', accent: C.red, titleColor: C.red, bodySize: 14.2, bodyY: 0.54 });
  addText(slide, 'Exit ticket  /  three sentences before you leave', 0.78, 5.08, 6.2, 0.26, { fontSize: 17, bold: true, color: C.navy });
  addStep(slide, 1, 'Model', 'Equation + one assumption.', 0.8, 5.56, 3.65, C.blue, { bodyHeight: 0.26 });
  addStep(slide, 2, 'MATLAB', 'The line that advances one step.', 4.9, 5.56, 3.65, C.cyan, { bodyHeight: 0.26 });
  addStep(slide, 3, 'Evidence', 'Why your chosen dt is acceptable.', 9.0, 5.56, 3.6, C.amber, { bodyHeight: 0.26 });
  addPill(slide, 'CHECKPOINT  /  CAN YOU DEFEND YOUR DT?', 4.35, 6.48, 4.62, C.amber, C.amber, { h: 0.31, fontSize: 8.7 });
}, { timing: '115–118 min', checkpoint: 'What evidence would you show if an AI-generated plot looked plausible?', transition: 'Close by connecting the deck to the approved Live Script and Lab 01 tasks.' });

// 18 — Recap and practical bridge.
addNativeSlide('PRACTICAL BRIDGE', 'Leave with a model, a method, and a test you can rerun', 'The Live Script carries today’s experiment into the practical.', 18, slide => {
  addCard(slide, 0.72, 1.62, 3.7, 2.16, 'Takeaway 1', 'A computational result begins with a model and assumptions — not with a MATLAB command.', { fill: C.paleBlue, line: 'B9D9EE', accent: C.blue, titleColor: C.blue, bodySize: 14.5 });
  addCard(slide, 4.82, 1.62, 3.7, 2.16, 'Takeaway 2', 'dt is part of the numerical method. Smaller is not automatically free.', { fill: C.paleCyan, line: 'B9DFDA', accent: C.cyan, titleColor: C.teal, bodySize: 14.5 });
  addCard(slide, 8.92, 1.62, 3.65, 2.16, 'Takeaway 3', 'Validation and interpretation are required parts of a simulation.', { fill: C.paleAmber, line: 'EFD3A4', accent: C.amber, titleColor: C.amber, bodySize: 14.5 });
  addText(slide, 'Next in the approved Week 1 package', 0.78, 4.2, 4.6, 0.25, { fontSize: 17, bold: true, color: C.navy });
  addStep(slide, 1, 'Run the Live Script', 'Keep the parameter record visible and start from a fresh session.', 0.8, 4.72, 5.55, C.blue, { bodyHeight: 0.3 });
  addStep(slide, 2, 'Change one value at a time', 'Try T_half_h = 3.0, dt_h = 0.1, and N0 = 5000.', 0.8, 5.4, 5.55, C.cyan, { bodyHeight: 0.3 });
  addStep(slide, 3, 'Submit the evidence', 'One labelled plot, one limiting-case check, one interpretation.', 0.8, 6.08, 5.55, C.amber, { bodyHeight: 0.3 });
  addCard(slide, 6.8, 4.2, 5.76, 2.15, 'Bring to the practical', 'A script or Live Script that can simulate decay for a chosen dt. Be ready to show:\n\n• the update rule\n• the timestep comparison\n• why your chosen result is adequate', { fill: C.white, line: C.line, accent: C.green, titleColor: C.green, bodySize: 14.1 });
  addPill(slide, 'MODEL  →  CODE  →  EVIDENCE', 7.75, 6.62, 3.86, C.navy, C.navy, { h: 0.31, fontSize: 9.1 });
}, { timing: '118–120 min', checkpoint: 'State one change you will make in the practical.', transition: 'End with the package handoff: slides, approved Learning Note, and approved MLX in one folder.' });

pptx.writeFile({ fileName: outPath }).then(() => {
  console.log(`Wrote ${outPath}`);
}).catch(error => {
  console.error(error);
  process.exitCode = 1;
});
