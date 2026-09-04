import fs from "node:fs/promises";
import { readFileSync } from "node:fs";
import path from "node:path";
import { FileBlob, PresentationFile } from "@oai/artifact-tool";

const ROOT = "/Users/khairuladib/MATLAB-Drive/Kuliah/computational-physics-course";
const MASTER = path.join(ROOT, ".agent/lecture-slide-system/masters/PHY4605_Editable_Slide_Master.pptx");
const BUILD_DIR = path.join(ROOT, ".agent/lecture-slides/editable-build");
const QA_DIR = path.join(BUILD_DIR, "qa");
const FINAL_PPTX = path.join(ROOT, "Week05/Lecture_Slides_Week05.pptx");
const SPEECH = path.join(ROOT, "Week05/.agent/lecture-slides/codex-ppt/speech.md");
const ASSET = (rel) => path.join(ROOT, "Week05/.agent/lecture-slides/codex-ppt/assets/strict", rel);
// The PHY4605 design specification is authored on a 1920 x 1080 pixel grid.
// artifact-tool uses the imported PowerPoint master frame (1280 x 720 logical
// units), so all pixel-grid geometry and typography are converted once here.
const DESIGN_TO_PPT = 2 / 3;
const scale = (value) => value * DESIGN_TO_PPT;
const scaleRect = (position) => ({
  left: scale(position.left),
  top: scale(position.top),
  width: scale(position.width),
  height: scale(position.height),
});
const scaleInsets = (insets = {}) => ({
  top: scale(insets.top ?? 0),
  right: scale(insets.right ?? 0),
  bottom: scale(insets.bottom ?? 0),
  left: scale(insets.left ?? 0),
});

const C = {
  navy: "#0B2B4C",
  charcoal: "#3F4B57",
  muted: "#697684",
  blue: "#2F6DB2",
  teal: "#2A9D9F",
  green: "#3E8E45",
  gold: "#C98A16",
  red: "#B3262E",
  purple: "#6F4B9B",
  rule: "#AAB4BE",
  grid: "#DDE5EC",
  paleNavy: "#F4F8FC",
  paleNeutral: "#F7F9FB",
  paleBlue: "#EEF5FD",
  paleValid: "#F0FAF7",
  paleGold: "#FFF7E6",
  paleRed: "#FFF2F2",
  palePurple: "#F5F1FB",
  white: "#FFFFFF",
};

const NO_LINE = { style: "solid", fill: "none", width: 0 };
const line = (fill = C.navy, width = 3, style = "solid") => ({ style, fill, width: scale(width) });

function addShape(slide, geometry, position, opts = {}) {
  const normalizedPosition = geometry === "line"
    ? {
        left: Math.min(position.left, position.left + position.width),
        top: Math.min(position.top, position.top + position.height),
        width: Math.abs(position.width),
        height: Math.abs(position.height),
      }
    : position;
  const shape = slide.shapes.add({
    geometry,
    name: opts.name,
    position: scaleRect(normalizedPosition),
    fill: opts.fill ?? "none",
    line: opts.line ?? NO_LINE,
    borderRadius: opts.borderRadius === undefined ? undefined : scale(opts.borderRadius),
    shadow: "shadow-none",
  });
  if (opts.text !== undefined) {
    shape.text = opts.text;
    shape.text.style = {
      fontSize: scale(opts.fontSize ?? 26),
      typeface: opts.typeface ?? "Nunito",
      bold: opts.bold ?? false,
      italic: opts.italic ?? false,
      color: opts.color ?? C.charcoal,
      alignment: opts.alignment ?? "left",
      verticalAlignment: opts.verticalAlignment ?? "top",
      wrap: opts.wrap ?? "square",
      autoFit: opts.autoFit ?? "shrinkText",
      lineSpacing: opts.lineSpacing ?? 1.05,
      insets: scaleInsets(opts.insets),
    };
  }
  return shape;
}

function addText(slide, text, left, top, width, height, opts = {}) {
  return addShape(slide, "textbox", { left, top, width, height }, { ...opts, text });
}

function addCard(slide, left, top, width, height, fill = C.white, stroke = C.rule, opts = {}) {
  return addShape(slide, "roundRect", { left, top, width, height }, {
    fill,
    line: line(stroke, opts.strokeWidth ?? 2),
    borderRadius: 22,
    name: opts.name,
  });
}

function addImage(slide, filePath, alt, left, top, width, height, opts = {}) {
  return slide.images.add({
    // Embed bytes explicitly. This keeps the image payload intact in the
    // exported PPTX and makes artifact-tool's renderer deterministic.
    blob: readFileSync(filePath),
    contentType: "image/png",
    alt,
    fit: opts.fit ?? "contain",
    position: scaleRect({ left, top, width, height }),
    geometry: opts.geometry,
    borderRadius: opts.borderRadius,
  });
}

function addRule(slide, top, color = C.grid, width = 2) {
  return addShape(slide, "line", { left: 115, top, width: 1690, height: 0 }, { line: line(color, width) });
}

function addArrow(slide, left, top, width = 56, height = 32, color = C.blue) {
  return addShape(slide, "rightArrow", { left, top, width, height }, { fill: color, line: NO_LINE });
}

function addCircle(slide, left, top, diameter, fill, text, opts = {}) {
  return addShape(slide, "ellipse", { left, top, width: diameter, height: diameter }, {
    fill,
    line: opts.line ?? NO_LINE,
    text,
    fontSize: opts.fontSize ?? 22,
    color: opts.color ?? C.white,
    bold: opts.bold ?? true,
    alignment: "center",
    verticalAlignment: "middle",
    autoFit: "shrinkText",
  });
}

function addHeader(slide, title, variant, subtitle, number) {
  const titleHeight = variant === "T3" ? 138 : 88;
  const titleSize = variant === "T1" ? 68 : variant === "T2" ? 62 : 56;
  addText(slide, title, 115, 60, 1580, titleHeight, {
    name: `title-${variant}`,
    fontSize: titleSize,
    bold: true,
    color: C.navy,
    typeface: "Nunito",
    wrap: variant === "T3" ? "square" : "none",
    autoFit: "none",
    lineSpacing: 0.98,
  });
  const subTop = variant === "T3" ? 205 : 152;
  const contentTop = variant === "T3" ? 270 : 225;
  if (subtitle) {
    addText(slide, subtitle, 115, subTop, 1580, 44, {
      name: `subtitle-${variant}`,
      fontSize: 30,
      color: C.charcoal,
      typeface: "Nunito",
      wrap: "none",
      autoFit: "none",
    });
  }
  addRule(slide, contentTop - 25, C.grid, 2);
  if (number !== undefined) {
    addText(slide, String(number), 1764, 976, 40, 28, {
      name: `slide-number-${number}`,
      fontSize: 22,
      color: C.muted,
      typeface: "Nunito",
      alignment: "right",
      verticalAlignment: "middle",
      wrap: "none",
      autoFit: "none",
    });
  }
  return contentTop;
}

function addLabel(slide, text, left, top, width, color = C.charcoal, opts = {}) {
  return addText(slide, text, left, top, width, opts.height ?? 36, {
    fontSize: opts.fontSize ?? 24,
    color,
    bold: opts.bold ?? true,
    alignment: opts.alignment ?? "left",
    verticalAlignment: opts.verticalAlignment ?? "middle",
    wrap: opts.wrap ?? "none",
    autoFit: opts.autoFit ?? "shrinkText",
  });
}

function addTakeaway(slide, text, fill = C.paleNavy, stroke = C.blue, color = C.navy) {
  addCard(slide, 115, 925, 1560, 70, fill, stroke, { strokeWidth: 2 });
  addText(slide, text, 150, 943, 1490, 36, {
    fontSize: 26,
    color,
    bold: true,
    verticalAlignment: "middle",
    wrap: "none",
  });
}

function addTable(slide, values, left, top, width, height, opts = {}) {
  const table = slide.tables.add({
    rows: values.length,
    columns: values[0].length,
    left: scale(left),
    top: scale(top),
    width: scale(width),
    height: scale(height),
    columnWidths: opts.columnWidths?.map(scale),
    values,
  });
  table.borders.assign({ style: "solid", fill: C.rule, width: 1 });
  table.styleOptions = { headerRow: true, bandedRows: false };
  for (let r = 0; r < values.length; r += 1) {
    for (let c = 0; c < values[r].length; c += 1) {
      const cell = table.getCell(r, c);
      cell.fill = r === 0 ? C.navy : (opts.rowFills?.[r] ?? C.white);
      cell.text.style = {
        fontSize: scale(opts.fontSize ?? 23),
        typeface: "Nunito",
        bold: r === 0 || opts.boldCells?.some(([rr, cc]) => rr === r && cc === c) === true,
        color: r === 0 ? C.white : (opts.textColors?.[r]?.[c] ?? C.charcoal),
        alignment: opts.alignment ?? "center",
        verticalAlignment: "middle",
        autoFit: "shrinkText",
        wrap: "square",
        insets: scaleInsets({ top: 7, right: 8, bottom: 7, left: 8 }),
        lineSpacing: 1.0,
      };
    }
  }
  return table;
}

function addCode(slide, code, left, top, width, height, opts = {}) {
  addCard(slide, left, top, width, height, C.paleNeutral, C.rule, { strokeWidth: 2 });
  return addText(slide, code, left + 24, top + 20, width - 48, height - 40, {
    name: opts.name,
    fontSize: opts.fontSize ?? 25,
    typeface: "IBM Plex Mono",
    color: C.navy,
    wrap: "none",
    autoFit: "shrinkText",
    lineSpacing: 1.05,
  });
}

function addNotes(slide, body, sources, provenance = "") {
  const chunks = [body.trim(), "", "[Sources]", ...sources.map((s) => `- ${s}`)];
  if (provenance) chunks.push("", "[Equation provenance]", provenance);
  slide.speakerNotes.textFrame.setText(chunks.join("\n"));
  slide.speakerNotes.setVisible(true);
}

function parseSpeech(text) {
  const map = new Map();
  const matches = [...text.matchAll(/^## Slide (\d+):.*$([\s\S]*?)(?=^## Slide |$)/gm)];
  for (const match of matches) map.set(Number(match[1]), match[2].trim());
  return map;
}

function slideWithLayout(presentation, name) {
  const layout = presentation.layouts.getByName(name);
  const slide = presentation.slides.add({ layoutId: layout.id });
  slide.setLayout(layout);
  slide.background.fill = C.white;
  return slide;
}

function createOpening(p, speech) {
  const slide = slideWithLayout(p, "Opening");
  addText(slide, "PHY4605 Computational Methods in Physics", 115, 126, 760, 38, {
    name: "course-tag",
    fontSize: 26,
    color: C.navy,
    bold: true,
    typeface: "Nunito",
    wrap: "none",
    autoFit: "none",
  });
  addText(slide, "From a Physical Target to a Checkable Root", 115, 245, 1080, 210, {
    name: "opening-title",
    fontSize: 74,
    color: C.navy,
    bold: true,
    typeface: "Nunito",
    wrap: "square",
    autoFit: "shrinkText",
    lineSpacing: 0.96,
  });
  addText(slide, "Week 5 | Turning target conditions into numerical evidence", 115, 475, 1180, 80, {
    name: "opening-subtitle",
    fontSize: 30,
    color: C.charcoal,
    typeface: "Nunito",
    wrap: "none",
    autoFit: "none",
  });
  addShape(slide, "line", { left: 1305, top: 735, width: 420, height: 0 }, { line: line(C.navy, 4) });
  addShape(slide, "line", { left: 1305, top: 735, width: 0, height: -210 }, { line: line(C.navy, 3, "dashed") });
  addShape(slide, "line", { left: 1645, top: 735, width: 0, height: -160 }, { line: line(C.gold, 3, "dashed") });
  const arc = [
    [1315, 525, 1360, 470], [1360, 470, 1410, 425], [1410, 425, 1460, 395],
    [1460, 395, 1510, 382], [1510, 382, 1560, 395], [1560, 395, 1610, 425],
    [1610, 425, 1660, 470], [1660, 470, 1705, 525], [1705, 525, 1725, 575],
  ];
  for (const [x, y, w, h] of arc) addShape(slide, "line", { left: x, top: y, width: w - x, height: h - y }, { line: line(C.blue, 5) });
  addCircle(slide, 1292, 712, 26, C.blue, "", { line: line(C.blue, 2) });
  addCircle(slide, 1710, 562, 26, C.blue, "", { line: line(C.blue, 2) });
  addLabel(slide, "launch angle", 1275, 640, 180, C.navy, { fontSize: 24 });
  addLabel(slide, "target range", 1555, 750, 190, C.gold, { fontSize: 24, alignment: "right" });
  addText(slide, "v₀ = 20 m/s", 1320, 800, 170, 34, { fontSize: 24, color: C.blue, bold: true, wrap: "none" });
  addText(slide, "target = 35 m", 1515, 800, 210, 34, { fontSize: 24, color: C.gold, bold: true, alignment: "right", wrap: "none" });
  addText(slide, "physical model  →  residual  →  root  →  validation", 115, 825, 1500, 70, {
    fontSize: 30,
    color: C.navy,
    bold: true,
    typeface: "Nunito",
    wrap: "none",
    autoFit: "none",
  });
  addNotes(slide, speech.get(1), ["PHY4605 Week 05 Content Manifest", "PHY4605 Lecture Slide Deck Design Specification", "Lecturer-authored projectile-range model"]);
}

function createSlide2(p, speech) {
  const slide = slideWithLayout(p, "Content T2");
  addHeader(slide, "Turn the target condition into a residual", "T2", "The unknown is an angle; the mismatch is a distance", 2);
  const y = 245;
  const boxes = [
    ["PHYSICAL MODEL", "range from\nlaunch angle", C.paleBlue, C.blue],
    ["TARGET CONDITION", "range = 35 m", C.paleGold, C.gold],
    ["RESIDUAL ZERO", "model − target = 0", C.paleValid, C.green],
  ];
  const xs = [115, 670, 1225];
  for (let i = 0; i < boxes.length; i += 1) {
    const [heading, body, fill, stroke] = boxes[i];
    addCard(slide, xs[i], y, 430, 210, fill, stroke);
    addLabel(slide, heading, xs[i] + 28, y + 28, 375, stroke, { fontSize: 24 });
    addText(slide, body, xs[i] + 28, y + 92, 375, 90, { fontSize: 31, color: C.navy, bold: true, lineSpacing: 0.98 });
    if (i < 2) addArrow(slide, xs[i] + 458, y + 86, 52, 34, C.blue);
  }
  addImage(slide, ASSET("equations/model_residual.png"), "LaTeX-rendered projectile range model, target condition, and residual definition", 305, 505, 1310, 220);
  addCard(slide, 115, 760, 520, 110, C.paleBlue, C.blue);
  addLabel(slide, "unknown", 150, 782, 140, C.blue, { fontSize: 24 });
  addText(slide, "launch angle (degree)", 150, 820, 430, 34, { fontSize: 28, color: C.navy, bold: true, wrap: "none" });
  addCard(slide, 680, 760, 520, 110, C.paleValid, C.green);
  addLabel(slide, "residual", 715, 782, 140, C.green, { fontSize: 24 });
  addText(slide, "model range − target range (m)", 715, 820, 450, 34, { fontSize: 27, color: C.navy, bold: true, wrap: "none" });
  addCard(slide, 1245, 760, 560, 110, C.paleGold, C.gold);
  addLabel(slide, "root means", 1280, 782, 160, C.gold, { fontSize: 24 });
  addText(slide, "the target condition is met", 1280, 820, 480, 34, { fontSize: 27, color: C.navy, bold: true, wrap: "none" });
  addNotes(slide, speech.get(2), ["PHY4605 Week 05 Content Manifest", "PHY4605 Lecture Slide Deck Design Specification"], "model_residual.tex; renderer: render-equations-diagrams; PNG: assets/strict/equations/model_residual.png; foreground: #243B53; fit: contain; alt: LaTeX-rendered projectile range model, target condition, and residual definition");
}

function createSlide3(p, speech) {
  const slide = slideWithLayout(p, "Content T2");
  addHeader(slide, "Read the residual sign as physics", "T2", "A sign tells you which side of the target the model sits on", 3);
  const states = [
    { x: 115, label: "undershoot", detail: "model range < target", sign: "negative", color: C.blue, fill: C.paleBlue, marker: 0.33 },
    { x: 670, label: "root", detail: "model range = target", sign: "zero", color: C.green, fill: C.paleValid, marker: 0.50 },
    { x: 1225, label: "overshoot", detail: "model range > target", sign: "positive", color: C.gold, fill: C.paleGold, marker: 0.69 },
  ];
  for (const s of states) {
    addCard(slide, s.x, 250, 430, 410, s.fill, s.color);
    addLabel(slide, s.label, s.x + 28, 282, 365, s.color, { fontSize: 31 });
    addText(slide, s.detail, s.x + 28, 332, 365, 45, { fontSize: 25, color: C.charcoal, wrap: "none" });
    const baseX = s.x + 55;
    const baseY = 500;
    addShape(slide, "line", { left: baseX, top: baseY, width: 320, height: 0 }, { line: line(C.navy, 4) });
    addShape(slide, "line", { left: baseX + 220, top: baseY - 75, width: 0, height: 150 }, { line: line(C.muted, 3, "dashed") });
    addLabel(slide, "target", baseX + 185, 580, 100, C.muted, { fontSize: 22, alignment: "center" });
    addShape(slide, "line", { left: baseX, top: baseY - 45, width: 320 * s.marker, height: 0 }, { line: line(s.color, 7) });
    addCircle(slide, baseX + 320 * s.marker - 13, baseY - 58, 26, s.color, "", { line: line(s.color, 2) });
    addText(slide, s.sign, s.x + 28, 615, 365, 35, { fontSize: 26, color: s.color, bold: true, alignment: "center", wrap: "none" });
  }
  addImage(slide, ASSET("equations/signs.png"), "LaTeX-rendered residual sign meanings: undershoot, root, and overshoot", 220, 710, 1480, 155);
  addTakeaway(slide, "The sign is a physical direction: shorter, equal, or longer than the target", C.paleNavy, C.blue, C.navy);
  addNotes(slide, speech.get(3), ["PHY4605 Week 05 Content Manifest", "PHY4605 Lecture Slide Deck Design Specification"], "signs.tex; renderer: render-equations-diagrams; PNG: assets/strict/equations/signs.png; foreground: #243B53; fit: contain; alt: LaTeX-rendered residual sign meanings");
}

function createSlide4(p, speech) {
  const slide = slideWithLayout(p, "Content T2");
  addHeader(slide, "Find the zero crossing before coding", "T2", "The graph suggests a bracket before the loop begins", 4);
  addCard(slide, 115, 250, 445, 600, C.paleNeutral, C.rule);
  addLabel(slide, "low-angle bracket", 150, 285, 365, C.navy, { fontSize: 31 });
  addText(slide, "Choose endpoints with\nopposite residual signs", 150, 350, 365, 90, { fontSize: 29, color: C.charcoal, bold: true, lineSpacing: 0.98 });
  addCard(slide, 150, 485, 375, 105, C.paleBlue, C.blue);
  addText(slide, "f(20 degree) = −8.7905 m", 178, 517, 320, 38, { fontSize: 27, color: C.blue, bold: true, wrap: "none" });
  addCard(slide, 150, 625, 375, 105, C.paleGold, C.gold);
  addText(slide, "f(40 degree) = +5.1553 m", 178, 657, 320, 38, { fontSize: 27, color: C.gold, bold: true, wrap: "none" });
  addText(slide, "bracket = [20, 40] degree", 150, 770, 375, 40, { fontSize: 28, color: C.navy, bold: true, wrap: "none" });
  addImage(slide, ASSET("week05_projectile_residual.png"), "MATLAB-generated projectile-range residual plot with zero line and labelled axes", 610, 245, 1190, 620, { fit: "contain" });
  addTakeaway(slide, "Use the visible sign change to defend one bracket; the higher-angle crossing is optional stretch", C.paleNavy, C.blue, C.navy);
  addNotes(slide, speech.get(4), ["PHY4605 Week 05 Content Manifest", "MATLAB-generated residual plot from the Week 05 demonstration", "PHY4605 Lecture Slide Deck Design Specification"]);
}

function createSlide5(p, speech) {
  const slide = slideWithLayout(p, "Content T1");
  addHeader(slide, "Bisection keeps a sign change alive", "T1", "Midpoint → residual → retain the sign-changing half", 5);
  addLabel(slide, "current bracket", 160, 250, 350, C.navy, { fontSize: 26 });
  addShape(slide, "line", { left: 185, top: 395, width: 375, height: 0 }, { line: line(C.navy, 5) });
  addCircle(slide, 172, 382, 26, C.blue, "");
  addCircle(slide, 547, 382, 26, C.gold, "");
  addText(slide, "20 degree", 145, 430, 120, 34, { fontSize: 24, color: C.blue, bold: true, wrap: "none" });
  addText(slide, "40 degree", 510, 430, 130, 34, { fontSize: 24, color: C.gold, bold: true, alignment: "right", wrap: "none" });
  addText(slide, "−8.7905 m", 145, 470, 145, 32, { fontSize: 23, color: C.blue, wrap: "none" });
  addText(slide, "+5.1553 m", 500, 470, 145, 32, { fontSize: 23, color: C.gold, alignment: "right", wrap: "none" });
  addArrow(slide, 640, 375, 60, 38, C.blue);
  addLabel(slide, "test the midpoint", 780, 250, 300, C.gold, { fontSize: 26, alignment: "center" });
  addShape(slide, "line", { left: 780, top: 395, width: 310, height: 0 }, { line: line(C.navy, 5) });
  addCircle(slide, 920, 382, 26, C.gold, "");
  addText(slide, "30 degree", 862, 430, 140, 34, { fontSize: 25, color: C.gold, bold: true, alignment: "center", wrap: "none" });
  addText(slide, "f(30 degree) = +0.31194 m", 790, 470, 300, 32, { fontSize: 23, color: C.charcoal, alignment: "center", wrap: "none" });
  addArrow(slide, 1135, 375, 60, 38, C.blue);
  addLabel(slide, "keep the sign-changing half", 1280, 250, 430, C.green, { fontSize: 26, alignment: "center" });
  addShape(slide, "line", { left: 1300, top: 395, width: 300, height: 0 }, { line: line(C.green, 7) });
  addCircle(slide, 1287, 382, 26, C.blue, "");
  addCircle(slide, 1587, 382, 26, C.green, "");
  addText(slide, "20 degree", 1260, 430, 115, 34, { fontSize: 24, color: C.blue, bold: true, wrap: "none" });
  addText(slide, "30 degree", 1495, 430, 125, 34, { fontSize: 24, color: C.green, bold: true, alignment: "right", wrap: "none" });
  addText(slide, "[20, 30] degree", 1370, 470, 180, 32, { fontSize: 24, color: C.green, bold: true, alignment: "center", wrap: "none" });
  const stepXs = [115, 535, 955, 1375];
  const stepText = ["choose\nopposite signs", "compute\nmidpoint", "evaluate\nresidual", "keep the\nsign change"];
  const stepColors = [C.blue, C.gold, C.gold, C.green];
  for (let i = 0; i < 4; i += 1) {
    addCircle(slide, stepXs[i], 600, 50, stepColors[i], String(i + 1), { fontSize: 28 });
    addText(slide, stepText[i], stepXs[i] + 68, 595, 300, 72, { fontSize: 27, color: C.navy, bold: true, lineSpacing: 0.95 });
    if (i < 3) addArrow(slide, stepXs[i] + 360, 610, 55, 34, C.blue);
  }
  addCard(slide, 115, 780, 1690, 110, C.paleGold, C.gold);
  addCircle(slide, 150, 805, 58, C.gold, "?", { fontSize: 39 });
  addText(slide, "Why is the midpoint not enough?", 240, 795, 650, 38, { fontSize: 31, color: C.gold, bold: true, wrap: "none" });
  addText(slide, "Because bisection needs endpoint residuals with opposite signs.", 240, 842, 1300, 34, { fontSize: 26, color: C.charcoal, wrap: "none" });
  addNotes(slide, speech.get(5), ["PHY4605 Week 05 Content Manifest", "Lecturer-approved Slide 05 sample visual reference", "PHY4605 Lecture Slide Deck Design Specification"]);
}

function createSlide6(p, speech) {
  const slide = slideWithLayout(p, "Content T2");
  addHeader(slide, "Trace the first four bisection updates", "T2", "Each row shrinks the interval because the sign change survives", 6);
  addTable(slide, [
    ["iteration", "current bracket (degree)", "midpoint (degree)", "f(mid) (m)", "keep"],
    ["1", "[20, 40]", "30", "+0.31194", "[20, 30]"],
    ["2", "[20, 30]", "25", "−3.7648", "[25, 30]"],
    ["3", "[25, 30]", "27.5", "−1.5993", "[27.5, 30]"],
    ["4", "[27.5, 30]", "28.75", "−0.61095", "[28.75, 30]"],
  ], 115, 260, 1040, 470, {
    columnWidths: [140, 260, 220, 180, 240],
    fontSize: 23,
    rowFills: { 1: C.paleBlue, 2: C.paleNeutral, 3: C.paleNeutral, 4: C.paleNeutral },
    textColors: { 1: { 4: C.green }, 2: { 4: C.green }, 3: { 4: C.green }, 4: { 4: C.green } },
  });
  addLabel(slide, "the retained interval moves toward the root", 1200, 270, 580, C.green, { fontSize: 25, alignment: "center" });
  const intervals = [
    { y: 370, left: 20, right: 40, keepLeft: 20, keepRight: 40, label: "start [20, 40]" },
    { y: 470, left: 20, right: 30, keepLeft: 20, keepRight: 30, label: "after 1 [20, 30]" },
    { y: 570, left: 25, right: 30, keepLeft: 25, keepRight: 30, label: "after 2 [25, 30]" },
    { y: 670, left: 27.5, right: 30, keepLeft: 27.5, keepRight: 30, label: "after 3 [27.5, 30]" },
  ];
  const x0 = 1260;
  const scale = 18;
  for (const i of intervals) {
    addText(slide, i.label, 1195, i.y - 34, 270, 28, { fontSize: 22, color: C.charcoal, alignment: "right", wrap: "none" });
    addShape(slide, "line", { left: x0, top: i.y, width: (i.right - i.left) * scale + 160, height: 0 }, { line: line(C.grid, 4) });
    addShape(slide, "line", { left: x0 + (i.keepLeft - i.left) * scale, top: i.y, width: (i.keepRight - i.keepLeft) * scale + 160, height: 0 }, { line: line(C.green, 8) });
    addCircle(slide, x0 - 10, i.y - 10, 20, C.blue, "");
    addCircle(slide, x0 + (i.keepRight - i.left) * scale + 150, i.y - 10, 20, C.green, "");
  }
  addText(slide, "midpoint → residual → keep", 1200, 770, 560, 36, { fontSize: 28, color: C.navy, bold: true, alignment: "center", wrap: "none" });
  addTakeaway(slide, "The interval becomes smaller because the sign-changing evidence is preserved", C.paleValid, C.green, C.navy);
  addNotes(slide, speech.get(6), ["PHY4605 Week 05 Content Manifest", "Lecturer demonstration values and bisection trace", "PHY4605 Lecture Slide Deck Design Specification"]);
}

const BISECTION_CODE = `bis_left_deg = left_deg;
bis_right_deg = right_deg;
for iteration = 1:max_iterations
    mid_deg = (bis_left_deg + bis_right_deg)/2;
    f_mid_m = (v0_mps^2/g_mps2)*sind(2*mid_deg) - target_m;
    if abs(f_mid_m) < tolerance_m
        break
    end
    f_bis_left_m = (v0_mps^2/g_mps2)*sind(2*bis_left_deg) - target_m;
    if f_bis_left_m*f_mid_m < 0
        bis_right_deg = mid_deg;
    else
        bis_left_deg = mid_deg;
    end
end
bisection_root_deg = mid_deg;`;

function createSlide7(p, speech) {
  const slide = slideWithLayout(p, "Content T1");
  addHeader(slide, "Read the bisection scaffold, line by line", "T1", "The code is the earlier reasoning written in MATLAB", 7);
  const labels = [
    ["1", "MIDPOINT", "centre the current bracket", C.blue],
    ["2", "RESIDUAL", "measure range − target", C.gold],
    ["3", "STOP", "use abs(f_mid_m) < tolerance_m", C.teal],
    ["4", "KEEP SIGN CHANGE", "move one endpoint", C.green],
  ];
  const lx = [115, 535, 955, 1375];
  for (let i = 0; i < labels.length; i += 1) {
    addCircle(slide, lx[i], 225, 38, labels[i][3], labels[i][0], { fontSize: 21 });
    addText(slide, labels[i][1], lx[i] + 52, 225, 175, 30, { fontSize: 22, color: labels[i][3], bold: true, wrap: "none" });
    addText(slide, labels[i][2], lx[i] + 52, 258, 320, 30, { fontSize: 20, color: C.charcoal, wrap: "none" });
  }
  addCode(slide, BISECTION_CODE, 115, 305, 1690, 570, { name: "bisection-code", fontSize: 25 });
  addTakeaway(slide, "The sign-product test decides which endpoint changes; the bracket remains the safety structure", C.paleNavy, C.blue, C.navy);
  addNotes(slide, speech.get(7), ["PHY4605 Week 05 Content Manifest", "MATLAB scaffold from Week 05 lecture demonstration", "PHY4605 Lecture Slide Deck Design Specification"]);
}

function createSlide8(p, speech) {
  const slide = slideWithLayout(p, "Content T2");
  addHeader(slide, "Stop once, then substitute back", "T2", "A loop stop is a decision; substitution is the validation", 8);
  addCard(slide, 115, 250, 520, 570, C.paleBlue, C.blue);
  addLabel(slide, "bisection result", 150, 285, 440, C.blue, { fontSize: 30 });
  addText(slide, "29.5679 degree", 150, 365, 440, 62, { fontSize: 42, color: C.navy, bold: true, wrap: "none" });
  addText(slide, "after 13 recorded iterations", 150, 445, 440, 38, { fontSize: 27, color: C.charcoal, wrap: "none" });
  addCard(slide, 150, 555, 445, 105, C.paleGold, C.gold);
  addLabel(slide, "one stopping rule", 178, 575, 380, C.gold, { fontSize: 24 });
  addText(slide, "abs(residual) < 1e−3 m", 178, 615, 380, 34, { fontSize: 26, color: C.navy, bold: true, wrap: "none" });
  addText(slide, "The answer is an angle; the check is in metres.", 150, 725, 440, 56, { fontSize: 26, color: C.navy, bold: true, lineSpacing: 0.98 });
  addCard(slide, 700, 250, 1105, 310, C.paleValid, C.green);
  addLabel(slide, "substitute into the original model", 735, 285, 650, C.green, { fontSize: 29 });
  addImage(slide, ASSET("equations/validation.png"), "LaTeX-rendered bisection root, substituted range, and residual validation", 745, 350, 1015, 170);
  addTable(slide, [
    ["check", "result", "interpretation"],
    ["root angle", "29.5679 degree", "low-angle launch angle"],
    ["model range", "35.0004 m", "target condition is met"],
    ["residual", "+4.1164 × 10⁻⁴ m", "below 10⁻³ m tolerance"],
  ], 700, 600, 1105, 250, {
    columnWidths: [240, 330, 535],
    fontSize: 22,
    rowFills: { 1: C.paleNeutral, 2: C.paleValid, 3: C.paleValid },
    textColors: { 1: { 1: C.green }, 2: { 1: C.green }, 3: { 1: C.green } },
  });
  addTakeaway(slide, "The model range is 35.0004 m, so the target is met within the 1e−3 m residual tolerance", C.paleValid, C.green, C.navy);
  addNotes(slide, speech.get(8), ["PHY4605 Week 05 Content Manifest", "MATLAB-generated validation values from the Week 05 demonstration", "PHY4605 Lecture Slide Deck Design Specification"], "validation.tex; renderer: render-equations-diagrams; PNG: assets/strict/equations/validation.png; foreground: #243B53; fit: contain; alt: LaTeX-rendered bisection root and residual validation");
}

function createSlide9(p, speech) {
  const slide = slideWithLayout(p, "Content T2");
  addHeader(slide, "Newton follows the local tangent", "T2", "A slope turns one current estimate into a next estimate", 9);
  addCard(slide, 115, 250, 940, 610, C.paleNeutral, C.rule);
  const ox = 215; const zy = 455; const zx = 950;
  addShape(slide, "line", { left: ox, top: zy, width: 720, height: 0 }, { line: line(C.muted, 3, "dashed") });
  addShape(slide, "line", { left: ox, top: 350, width: 0, height: 370 }, { line: line(C.muted, 3) });
  const curve = [[ox, 660, 75, -36], [ox + 75, 624, 70, -55], [ox + 145, 569, 70, -65], [ox + 215, 504, 70, -40], [ox + 285, 464, 75, 12], [ox + 360, 476, 90, 45], [ox + 450, 521, 90, 85], [ox + 540, 606, 110, 68]];
  for (const [x, y, w, h] of curve) addShape(slide, "line", { left: x, top: y, width: w, height: h }, { line: line(C.blue, 5) });
  addShape(slide, "line", { left: ox + 265, top: 570, width: 390, height: -115 }, { line: line(C.gold, 4, "dashed") });
  addCircle(slide, ox + 255, 558, 24, C.gold, "");
  addCircle(slide, zx - 12, zy - 12, 24, C.green, "");
  addLabel(slide, "current estimate", ox + 185, 600, 180, C.gold, { fontSize: 22 });
  addLabel(slide, "next estimate", zx - 55, 390, 190, C.green, { fontSize: 22, alignment: "center" });
  addLabel(slide, "zero residual", zx - 65, zy + 20, 190, C.muted, { fontSize: 22, alignment: "center" });
  addText(slide, "residual curve", 215, 315, 300, 32, { fontSize: 24, color: C.blue, bold: true, wrap: "none" });
  addImage(slide, ASSET("equations/newton_update_slope.png"), "LaTeX-rendered Newton update and degree-based residual slope", 1120, 320, 650, 250);
  addCard(slide, 1120, 625, 650, 170, C.paleGold, C.gold);
  addLabel(slide, "unit check", 1150, 652, 220, C.gold, { fontSize: 25 });
  addText(slide, "slope = metres per degree", 1150, 710, 570, 38, { fontSize: 29, color: C.navy, bold: true, wrap: "none" });
  addText(slide, "The angle update then remains in degree.", 1150, 757, 570, 32, { fontSize: 24, color: C.charcoal, wrap: "none" });
  addTakeaway(slide, "Newton is local: residual, slope, and units stay visible at every update", C.paleNavy, C.blue, C.navy);
  addNotes(slide, speech.get(9), ["PHY4605 Week 05 Content Manifest", "PHY4605 Lecture Slide Deck Design Specification"], "newton_update_slope.tex; renderer: render-equations-diagrams; PNG: assets/strict/equations/newton_update_slope.png; foreground: #243B53; fit: contain; alt: LaTeX-rendered Newton update and degree-based residual slope");
}

const NEWTON_CODE = `newton_theta_deg = newton_start_deg;
newton_history = zeros(max_iterations,4);
for iteration = 1:max_iterations
    f_current_m = (v0_mps^2/g_mps2)*sind(2*newton_theta_deg) - target_m;
    slope_m_per_deg = (v0_mps^2/g_mps2)*cosd(2*newton_theta_deg)*(2*pi/180);
    newton_history(iteration,:) = [iteration, newton_theta_deg, f_current_m, slope_m_per_deg];
    if abs(f_current_m) < tolerance_m
        break
    end
    newton_theta_deg = newton_theta_deg - f_current_m/slope_m_per_deg;
end
newton_root_deg = newton_theta_deg;`;

function createSlide10(p, speech) {
  const slide = slideWithLayout(p, "Content T2");
  addHeader(slide, "Trace Newton from 25 degree", "T2", "The trace records exactly what each tangent update needs", 10);
  addCode(slide, NEWTON_CODE, 115, 250, 930, 625, { name: "newton-code", fontSize: 21 });
  addLabel(slide, "four evaluations", 1105, 250, 650, C.navy, { fontSize: 29, alignment: "center" });
  addTable(slide, [
    ["iteration", "theta (degree)", "residual (m)", "slope (m/degree)", "next angle (degree)"],
    ["1", "25", "−3.7648", "0.91488", "29.115"],
    ["2", "29.115", "−0.33461", "0.74939", "29.562"],
    ["3", "29.562", "−0.0042242", "0.73044", "29.567"],
    ["4", "29.567", "−7.1308 × 10⁻⁷", "0.73019", "stop"],
  ], 1105, 310, 700, 455, {
    columnWidths: [100, 135, 160, 150, 155],
    fontSize: 20,
    rowFills: { 1: C.paleBlue, 2: C.paleNeutral, 3: C.paleNeutral, 4: C.paleValid },
    textColors: { 1: { 4: C.blue }, 2: { 4: C.blue }, 3: { 4: C.blue }, 4: { 4: C.green } },
  });
  addCard(slide, 1105, 795, 700, 80, C.paleValid, C.green);
  addText(slide, "at row 4: abs(residual) < 1e−3 m → stop", 1130, 817, 650, 34, { fontSize: 25, color: C.green, bold: true, alignment: "center", wrap: "none" });
  addTakeaway(slide, "The same residual stopping rule ends Newton after four recorded evaluations", C.paleValid, C.green, C.navy);
  addNotes(slide, speech.get(10), ["PHY4605 Week 05 Content Manifest", "MATLAB Newton scaffold and four-row trace from the Week 05 demonstration", "PHY4605 Lecture Slide Deck Design Specification"]);
}

function createSlide11(p, speech) {
  const slide = slideWithLayout(p, "Content T2");
  addHeader(slide, "Working exposure: same root, different route", "T2", "Different evidence structures can lead to the same physical answer", 11);
  addCard(slide, 115, 260, 770, 530, C.paleBlue, C.blue);
  addCard(slide, 1035, 260, 770, 530, C.paleGold, C.gold);
  addLabel(slide, "BISECTION", 155, 300, 690, C.blue, { fontSize: 32 });
  addLabel(slide, "NEWTON", 1075, 300, 690, C.gold, { fontSize: 32 });
  addText(slide, "keeps a sign-changing bracket", 155, 375, 690, 44, { fontSize: 30, color: C.navy, bold: true, wrap: "none" });
  addText(slide, "uses a local residual slope", 1075, 375, 690, 44, { fontSize: 30, color: C.navy, bold: true, wrap: "none" });
  addCircle(slide, 155, 485, 88, C.blue, "13", { fontSize: 40 });
  addText(slide, "recorded iterations", 270, 510, 360, 34, { fontSize: 26, color: C.charcoal, wrap: "none" });
  addCircle(slide, 1075, 485, 88, C.gold, "4", { fontSize: 40 });
  addText(slide, "recorded evaluations", 1190, 510, 420, 34, { fontSize: 26, color: C.charcoal, wrap: "none" });
  addText(slide, "safety evidence", 155, 645, 280, 34, { fontSize: 24, color: C.blue, bold: true, wrap: "none" });
  addText(slide, "local efficiency", 1075, 645, 280, 34, { fontSize: 24, color: C.gold, bold: true, wrap: "none" });
  addText(slide, "both approach the low-angle root: 29.57 degree", 310, 730, 1290, 38, { fontSize: 29, color: C.navy, bold: true, alignment: "center", wrap: "none" });
  addCard(slide, 115, 830, 1690, 70, C.paleValid, C.green);
  addText(slide, "shared requirement: substitute the result into the residual and interpret the physical unit", 150, 850, 1600, 32, { fontSize: 25, color: C.green, bold: true, alignment: "center", wrap: "none" });
  addNotes(slide, speech.get(11), ["PHY4605 Week 05 Content Manifest", "MATLAB bisection and Newton results from the Week 05 demonstration", "PHY4605 Lecture Slide Deck Design Specification"]);
}

function createSlide12(p, speech) {
  const slide = slideWithLayout(p, "Content T3");
  addHeader(slide, "A midpoint is not enough: the bracket must change sign", "T3", "Arithmetic can start a midpoint; opposite signs justify the method", 12);
  addCard(slide, 115, 300, 760, 520, C.paleRed, C.red);
  addCard(slide, 1045, 300, 760, 520, C.paleValid, C.green);
  addLabel(slide, "SAME-SIGN BRACKET", 155, 335, 680, C.red, { fontSize: 30 });
  addLabel(slide, "SIGN-CHANGING BRACKET", 1085, 335, 680, C.green, { fontSize: 30 });
  for (const panel of [{ x: 180, color: C.red, left: "−", right: "−", lineColor: C.red }, { x: 1110, color: C.green, left: "−", right: "+", lineColor: C.green }]) {
    addShape(slide, "line", { left: panel.x, top: 535, width: 560, height: 0 }, { line: line(panel.lineColor, 6) });
    addCircle(slide, panel.x - 14, 521, 28, panel.color, "");
    addCircle(slide, panel.x + 546, 521, 28, panel.color, "");
    addText(slide, panel.left, panel.x - 8, 575, 35, 35, { fontSize: 30, color: panel.color, bold: true, alignment: "center", wrap: "none" });
    addText(slide, panel.right, panel.x + 552, 575, 35, 35, { fontSize: 30, color: panel.color, bold: true, alignment: "center", wrap: "none" });
  }
  addText(slide, "midpoint exists", 155, 660, 300, 34, { fontSize: 27, color: C.red, bold: true, wrap: "none" });
  addText(slide, "but no sign-change evidence", 155, 710, 550, 34, { fontSize: 27, color: C.red, wrap: "none" });
  addText(slide, "bracket [20, 40] degree", 1085, 660, 420, 34, { fontSize: 27, color: C.green, bold: true, wrap: "none" });
  addText(slide, "f(20) < 0 and f(40) > 0", 1085, 710, 550, 34, { fontSize: 27, color: C.green, wrap: "none" });
  addArrow(slide, 885, 515, 90, 45, C.blue);
  addText(slide, "inspect → repair → start", 835, 610, 220, 100, { fontSize: 22, color: C.blue, bold: true, alignment: "center", lineSpacing: 0.95 });
  addTakeaway(slide, "A same-sign interval does not rule out a root elsewhere; it simply is not a valid bisection bracket", C.paleNavy, C.blue, C.navy);
  addNotes(slide, speech.get(12), ["PHY4605 Week 05 Content Manifest", "PHY4605 Lecture Slide Deck Design Specification"]);
}

function createSlide13(p, speech) {
  const slide = slideWithLayout(p, "Content T2");
  addHeader(slide, "Transfer the residual pattern to new physics", "T2", "The equation changes; the reasoning chain stays stable", 13);
  addCard(slide, 115, 265, 500, 510, C.paleBlue, C.blue);
  addCard(slide, 1305, 265, 500, 510, C.paleGold, C.gold);
  addLabel(slide, "THIN LENS", 150, 305, 430, C.blue, { fontSize: 31 });
  addText(slide, "root variable", 150, 380, 180, 32, { fontSize: 23, color: C.charcoal, bold: true, wrap: "none" });
  addText(slide, "image distance v (m)", 150, 420, 400, 38, { fontSize: 27, color: C.navy, bold: true, wrap: "none" });
  addText(slide, "residual unit", 150, 515, 180, 32, { fontSize: 23, color: C.charcoal, bold: true, wrap: "none" });
  addText(slide, "m⁻¹", 150, 555, 200, 38, { fontSize: 29, color: C.blue, bold: true, wrap: "none" });
  addText(slide, "define → bracket → update → check", 150, 665, 400, 38, { fontSize: 24, color: C.blue, bold: true, wrap: "none" });
  addLabel(slide, "RC CHARGING", 1340, 305, 430, C.gold, { fontSize: 31 });
  addText(slide, "root variable", 1340, 380, 180, 32, { fontSize: 23, color: C.charcoal, bold: true, wrap: "none" });
  addText(slide, "threshold time t (s)", 1340, 420, 400, 38, { fontSize: 27, color: C.navy, bold: true, wrap: "none" });
  addText(slide, "residual unit", 1340, 515, 180, 32, { fontSize: 23, color: C.charcoal, bold: true, wrap: "none" });
  addText(slide, "V", 1340, 555, 200, 38, { fontSize: 29, color: C.gold, bold: true, wrap: "none" });
  addText(slide, "define → bracket → update → check", 1340, 665, 400, 38, { fontSize: 24, color: C.gold, bold: true, wrap: "none" });
  addImage(slide, ASSET("equations/transfer_residuals.png"), "LaTeX-rendered thin-lens and RC-charging residual forms with units", 655, 330, 610, 300);
  addArrow(slide, 600, 820, 100, 38, C.blue);
  addText(slide, "same workflow", 720, 817, 430, 34, { fontSize: 28, color: C.navy, bold: true, alignment: "center", wrap: "none" });
  addArrow(slide, 1210, 820, 100, 38, C.blue);
  addTakeaway(slide, "Your practical model can change; the residual must still carry the correct physical unit", C.paleValid, C.green, C.navy);
  addNotes(slide, speech.get(13), ["PHY4605 Week 05 Content Manifest", "PHY4605 practical transfer contexts", "PHY4605 Lecture Slide Deck Design Specification"], "transfer_residuals.tex; renderer: render-equations-diagrams; PNG: assets/strict/equations/transfer_residuals.png; foreground: #243B53; fit: contain; alt: LaTeX-rendered thin-lens and RC-charging residual forms with units");
}

function createSlide14(p, speech) {
  const slide = slideWithLayout(p, "Content T2");
  addHeader(slide, "Exit ticket — explain a root to a future you", "T2", "Retrieve the reasoning chain without relying on function names", 14);
  const cards = [
    ["DEFINE", "What target condition\ndoes f(x) = 0 encode?", C.paleBlue, C.blue],
    ["BRACKET", "Why do endpoint\nsigns matter?", C.paleValid, C.green],
    ["UPDATE", "What does a midpoint\nor tangent change?", C.paleGold, C.gold],
    ["CHECK", "How do you know the\nroot is physically credible?", C.palePurple, C.purple],
  ];
  const xs = [115, 535, 955, 1375];
  for (let i = 0; i < cards.length; i += 1) {
    const [heading, prompt, fill, stroke] = cards[i];
    addCard(slide, xs[i], 300, 340, 430, fill, stroke);
    addCircle(slide, xs[i] + 28, 330, 54, stroke, String(i + 1), { fontSize: 26 });
    addLabel(slide, heading, xs[i] + 100, 337, 200, stroke, { fontSize: 27 });
    addText(slide, prompt, xs[i] + 28, 445, 280, 120, { fontSize: 28, color: C.navy, bold: true, lineSpacing: 0.98 });
    addShape(slide, "line", { left: xs[i] + 28, top: 620, width: 280, height: 0 }, { line: line(stroke, 2) });
    addText(slide, "write one sentence", xs[i] + 28, 660, 280, 32, { fontSize: 22, color: C.charcoal, italic: true, wrap: "none" });
  }
  addCard(slide, 115, 800, 1690, 82, C.paleNavy, C.blue);
  addText(slide, "transfer: projectile range  →  thin lens  →  RC threshold", 170, 825, 1580, 34, { fontSize: 27, color: C.navy, bold: true, alignment: "center", wrap: "none" });
  addNotes(slide, speech.get(14), ["PHY4605 Week 05 Content Manifest", "PHY4605 Lecture Slide Deck Design Specification"]);
}

async function writeBlob(filePath, blob) {
  await fs.mkdir(path.dirname(filePath), { recursive: true });
  await fs.writeFile(filePath, new Uint8Array(await blob.arrayBuffer()));
}

async function main() {
  await fs.mkdir(QA_DIR, { recursive: true });
  const speech = parseSpeech(await fs.readFile(SPEECH, "utf8"));
  const p = await PresentationFile.importPptx(await FileBlob.load(MASTER));
  while (p.slides.items.length > 0) p.slides.items[0].delete();
  createOpening(p, speech);
  createSlide2(p, speech);
  createSlide3(p, speech);
  createSlide4(p, speech);
  createSlide5(p, speech);
  createSlide6(p, speech);
  createSlide7(p, speech);
  createSlide8(p, speech);
  createSlide9(p, speech);
  createSlide10(p, speech);
  createSlide11(p, speech);
  createSlide12(p, speech);
  createSlide13(p, speech);
  createSlide14(p, speech);
  const inspect = await p.inspect({ kind: "deck,slide,textbox,shape,image,table,notes,layout", maxChars: 50000 });
  await fs.writeFile(path.join(QA_DIR, "artifact-tool-inspect.ndjson"), inspect.ndjson, "utf8");
  for (let i = 0; i < p.slides.items.length; i += 1) {
    const slide = p.slides.items[i];
    const stem = `slide-${String(i + 1).padStart(2, "0")}`;
    await writeBlob(path.join(QA_DIR, `${stem}.png`), await p.export({ slide, format: "png", scale: 1 }));
    await fs.writeFile(path.join(QA_DIR, `${stem}.layout.json`), await (await slide.export({ format: "layout" })).text(), "utf8");
  }
  await writeBlob(path.join(QA_DIR, "full-deck-contact-sheet.webp"), await p.export({ format: "webp", montage: true, scale: 1 }));
  const pptx = await PresentationFile.exportPptx(p);
  await pptx.save(FINAL_PPTX);
  console.log(JSON.stringify({ finalPptx: FINAL_PPTX, slideCount: p.slides.items.length, qaDir: QA_DIR }, null, 2));
}

main().catch((error) => {
  console.error(error.stack || error.message || String(error));
  process.exitCode = 1;
});
