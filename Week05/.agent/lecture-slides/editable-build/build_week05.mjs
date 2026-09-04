import fs from "node:fs/promises";
import { FileBlob, PresentationFile } from "@oai/artifact-tool";

const ROOT = "/Users/khairuladib/MATLAB-Drive/Kuliah/computational-physics-course";
const WEEK = `${ROOT}/Week05`;
const BUILD = `${WEEK}/.agent/lecture-slides/editable-build`;
const MASTER = `${ROOT}/.agent/lecture-slide-system/masters/PHY4605_Editable_Slide_Master.pptx`;
const FINAL = `${WEEK}/Lecture_Slides_Week05.pptx`;
const RENDER_DIR = `${BUILD}/artifact-render`;
const MONTAGE = `${BUILD}/artifact-deck-montage.webp`;
const SPEECH_PATH = `${WEEK}/.agent/lecture-slides/codex-ppt/speech.md`;

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

const LAYOUT = {
  opening: "/ppt/slideLayouts/slideLayout2.xml",
  t1: "/ppt/slideLayouts/slideLayout3.xml",
  t2: "/ppt/slideLayouts/slideLayout4.xml",
  t3: "/ppt/slideLayouts/slideLayout5.xml",
};

const ASSET = {
  hero: `${ROOT}/.agent/lecture-slide-system/assets/trajectory-comparison-matte.png`,
  model: `${WEEK}/.agent/lecture-slides/codex-ppt/assets/strict/equations/model_residual.png`,
  signs: `${WEEK}/.agent/lecture-slides/codex-ppt/assets/strict/equations/signs.png`,
  validation: `${WEEK}/.agent/lecture-slides/codex-ppt/assets/strict/equations/validation.png`,
  newton: `${WEEK}/.agent/lecture-slides/codex-ppt/assets/strict/equations/newton_update_slope.png`,
  transfer: `${WEEK}/.agent/lecture-slides/codex-ppt/assets/strict/equations/transfer_residuals.png`,
  residualPlot: `${WEEK}/.agent/lecture-slides/codex-ppt/assets/strict/week05_projectile_residual.png`,
};

let IMAGE_BLOBS = new Map();

const NOTES_SOURCES = {
  base: [
    "Week05/README.md",
    "Week05/.agent/manifests/Week05_Content_Manifest.md",
    "Week05/Week05_Lecture_Demonstration_Root_Finding_for_Projectile_Range.m",
    "PHY4605_Lecture_Slide_Design_Spec.md",
  ],
  model: ["Week05/.agent/lecture-slides/codex-ppt/assets/strict/equations/model_residual.tex"],
  signs: ["Week05/.agent/lecture-slides/codex-ppt/assets/strict/equations/signs.tex"],
  validation: [
    "Week05/.agent/lecture-slides/codex-ppt/assets/strict/equations/validation.tex",
    "Week05/.agent/lecture-slides/codex-ppt/assets/strict/tables/bisection_validation.tex",
  ],
  newton: ["Week05/.agent/lecture-slides/codex-ppt/assets/strict/equations/newton_update_slope.tex"],
  transfer: ["Week05/.agent/lecture-slides/codex-ppt/assets/strict/equations/transfer_residuals.tex"],
  plot: ["Week05/.agent/lecture-slides/codex-ppt/assets/strict/week05_projectile_residual.png; MATLAB-generated retained figure"],
  visual: [".agent/lecture-slide-system/assets/trajectory-comparison-matte.png; approved PHY4605 Matte Scientific Cutaway asset"],
};

function mergeSources(...groups) {
  return [...new Set([...(NOTES_SOURCES.base), ...groups.flatMap((group) => group ?? [])])];
}

function parseSpeech(markdown, slideNumber) {
  const pattern = new RegExp(`## Slide ${slideNumber}:[\\s\\S]*?(?=\\n## Slide \\d+:|$)`);
  const match = markdown.match(pattern);
  return match ? match[0].trim() : `Slide ${slideNumber}: Week 05 root finding`;
}

function noteText(speech, slideNumber, sources) {
  const sourceBlock = ["", "[Sources]", ...sources.map((source) => `- ${source}`)].join("\n");
  return `${parseSpeech(speech, slideNumber)}${sourceBlock}`;
}

function noLine() {
  return { style: "solid", fill: "none", width: 0 };
}

function addText(slide, name, text, left, top, width, height, options = {}) {
  const shape = slide.shapes.add({
    geometry: "textbox",
    name,
    position: { left, top, width, height },
    fill: "none",
    line: noLine(),
  });
  shape.text = text;
  shape.text.style = {
    fontSize: options.fontSize ?? 28,
    typeface: options.typeface ?? "Nunito",
    color: options.color ?? C.charcoal,
    bold: options.bold ?? false,
    alignment: options.alignment ?? "left",
    verticalAlignment: options.verticalAlignment ?? "top",
    lineSpacing: options.lineSpacing ?? 1.05,
    wrap: options.wrap ?? "square",
    autoFit: options.autoFit ?? "shrinkText",
    insets: options.insets ?? { top: 0, right: 0, bottom: 0, left: 0 },
  };
  return shape;
}

function addBox(slide, name, left, top, width, height, fill = C.white, lineFill = C.rule, radius = 22) {
  return slide.shapes.add({
    geometry: "roundRect",
    name,
    position: { left, top, width, height },
    fill,
    line: { style: "solid", fill: lineFill, width: 2 },
    borderRadius: radius,
    shadow: "shadow-none",
  });
}

function addRect(slide, name, left, top, width, height, fill = C.white, lineFill = "none", lineWidth = 0) {
  return slide.shapes.add({
    geometry: "rect",
    name,
    position: { left, top, width, height },
    fill,
    line: { style: "solid", fill: lineFill, width: lineWidth },
  });
}

function addLine(slide, name, left, top, width, height, color = C.navy, lineWidth = 4, style = "solid") {
  let x = left;
  let y = top;
  let w = width;
  let h = height;
  if (w < 0) {
    x += w;
    w = -w;
  }
  if (h < 0) {
    y += h;
    h = -h;
  }
  return slide.shapes.add({
    geometry: "line",
    name,
    position: { left: x, top: y, width: w, height: h },
    fill: "none",
    line: { style, fill: color, width: lineWidth },
  });
}

function addCircle(slide, name, left, top, diameter, fill, lineFill = fill, lineWidth = 0) {
  return slide.shapes.add({
    geometry: "ellipse",
    name,
    position: { left, top, width: diameter, height: diameter },
    fill,
    line: { style: "solid", fill: lineFill, width: lineWidth },
  });
}

function addArrow(slide, name, left, top, width, height, fill = C.blue) {
  return slide.shapes.add({
    geometry: "rightArrow",
    name,
    position: { left, top, width, height },
    fill,
    line: { style: "solid", fill: "none", width: 0 },
  });
}

function addImage(slide, name, path, alt, left, top, width, height, fit = "contain") {
  const blob = IMAGE_BLOBS.get(path);
  return slide.images.add({
    ...(blob ? { blob, contentType: "image/png" } : { path }),
    name,
    alt,
    fit,
    position: { left, top, width, height },
  });
}

function addEquation(slide, name, path, alt, left, top, width, height) {
  return addImage(slide, name, path, alt, left, top, width, height, "contain");
}

function setPlaceholderText(slide, itemName, text, style) {
  let placeholder = null;
  try {
    placeholder = slide.placeholders.getItem(itemName);
  } catch (_) {
    placeholder = null;
  }
  if (!placeholder) {
    return addText(slide, itemName, text, style.left, style.top, style.width, style.height, style.text);
  }
  placeholder.position = { left: style.left, top: style.top, width: style.width, height: style.height };
  placeholder.text = text;
  placeholder.text.style = style.text;
  return placeholder;
}

function addChrome(slide, number, title, variant, subtitle = "") {
  const titleStyle = {
    fontSize: variant === "T1" ? 68 : variant === "T2" ? 62 : 56,
    typeface: "Nunito",
    color: C.navy,
    bold: true,
    alignment: "left",
    verticalAlignment: "top",
    lineSpacing: 0.94,
    wrap: variant === "T3" ? "square" : "none",
    autoFit: "shrinkText",
    insets: { top: 0, right: 0, bottom: 0, left: 0 },
  };
  const titleBox = variant === "T3"
    ? { left: 115, top: 60, width: 1580, height: 138 }
    : { left: 115, top: 60, width: 1580, height: 88 };
  setPlaceholderText(slide, "title", title, { left: titleBox.left, top: titleBox.top, width: titleBox.width, height: titleBox.height, text: titleStyle });

  if (subtitle) {
    const subtitleTop = variant === "T3" ? 205 : 152;
    const subtitleStyle = {
      fontSize: 30,
      typeface: "Nunito",
      color: C.charcoal,
      bold: false,
      alignment: "left",
      verticalAlignment: "top",
      lineSpacing: 1.0,
      wrap: "none",
      autoFit: "shrinkText",
      insets: { top: 0, right: 0, bottom: 0, left: 0 },
    };
    setPlaceholderText(slide, "subtitle", subtitle, { left: 115, top: subtitleTop, width: 1580, height: 44, text: subtitleStyle });
  }
  if (number !== null) {
    const numberStyle = {
      fontSize: 22,
      typeface: "Nunito",
      color: C.muted,
      bold: false,
      alignment: "right",
      verticalAlignment: "middle",
      lineSpacing: 1.0,
      wrap: "none",
      autoFit: "shrinkText",
      insets: { top: 0, right: 0, bottom: 0, left: 0 },
    };
    setPlaceholderText(slide, "slideNumber", String(number), { left: 1764, top: 976, width: 40, height: 28, text: numberStyle });
  }
}

function styleTable(table, headerRows = 1, bodySize = 24, alignments = []) {
  table.styleOptions = { headerRow: false, bandedRows: false, bandedColumns: false };
  table.borders.assign({ style: "solid", fill: C.rule, width: 1 });
  for (let r = 0; r < table.rows.length; r += 1) {
    for (let c = 0; c < table.columns.length; c += 1) {
      const cell = table.getCell(r, c);
      cell.fill = r < headerRows ? C.navy : C.white;
      cell.text.style = {
        fontSize: r < headerRows ? 22 : bodySize,
        typeface: "Nunito",
        color: r < headerRows ? C.white : C.charcoal,
        bold: r < headerRows,
        alignment: alignments[c] ?? "left",
        verticalAlignment: "middle",
        wrap: "square",
        autoFit: "shrinkText",
        insets: { top: 10, right: 12, bottom: 10, left: 12 },
      };
    }
  }
}

function addBulletList(slide, name, bullets, left, top, width, height, options = {}) {
  const paragraphs = bullets.map((bullet) => ({
    bulletCharacter: "•",
    marginLeft: options.marginLeft ?? 28,
    indent: -14,
    runs: [bullet],
  }));
  return addText(slide, name, paragraphs, left, top, width, height, {
    fontSize: options.fontSize ?? 28,
    color: options.color ?? C.charcoal,
    typeface: "Nunito",
    lineSpacing: options.lineSpacing ?? 1.15,
    autoFit: "shrinkText",
  });
}

function addWorkflow(slide, labels, y, colors) {
  const start = 115;
  const totalWidth = 1500;
  const gap = 48;
  const itemWidth = (totalWidth - gap * (labels.length - 1)) / labels.length;
  labels.forEach((label, index) => {
    const x = start + index * (itemWidth + gap);
    addBox(slide, `workflow-${index + 1}`, x, y, itemWidth, 64, colors[index] ?? C.paleNeutral, "none", 22);
    addText(slide, `workflow-label-${index + 1}`, label, x + 12, y + 14, itemWidth - 24, 36, {
      fontSize: 25,
      color: C.navy,
      bold: true,
      alignment: "center",
      verticalAlignment: "middle",
    });
    if (index < labels.length - 1) {
      addArrow(slide, `workflow-arrow-${index + 1}`, x + itemWidth + 12, y + 21, 28, 22, C.rule);
    }
  });
}

function addNumberedStep(slide, number, title, x, y, width, accent = C.blue) {
  addCircle(slide, `step-number-${number}`, x, y, 54, accent);
  addText(slide, `step-number-text-${number}`, String(number), x, y + 7, 54, 40, {
    fontSize: 28,
    color: C.white,
    bold: true,
    alignment: "center",
    verticalAlignment: "middle",
  });
  addText(slide, `step-title-${number}`, title, x + 72, y + 4, width - 72, 52, {
    fontSize: 24,
    color: C.navy,
    bold: true,
    verticalAlignment: "middle",
  });
}

function addNumberLine(slide, prefix, left, right, y, minLabel, maxLabel, midpoint = null, options = {}) {
  addLine(slide, `${prefix}-axis`, left, y, right - left, 0, options.axisColor ?? C.navy, options.axisWidth ?? 4);
  addCircle(slide, `${prefix}-left`, left - 12, y - 12, 24, options.leftColor ?? C.navy);
  addCircle(slide, `${prefix}-right`, right - 12, y - 12, 24, options.rightColor ?? C.navy);
  addText(slide, `${prefix}-min`, minLabel, left - 66, y + 28, 132, 34, { fontSize: 22, color: C.navy, bold: true, alignment: "center" });
  addText(slide, `${prefix}-max`, maxLabel, right - 66, y + 28, 132, 34, { fontSize: 22, color: C.navy, bold: true, alignment: "center" });
  if (midpoint) {
    addCircle(slide, `${prefix}-mid`, midpoint.x - 14, y - 14, 28, midpoint.color ?? C.gold);
    addLine(slide, `${prefix}-mid-tick`, midpoint.x, y + 14, 0, 38, midpoint.color ?? C.gold, 3);
    addText(slide, `${prefix}-mid-label`, midpoint.label, midpoint.x - 72, y + 60, 144, 34, { fontSize: 22, color: midpoint.color ?? C.gold, bold: true, alignment: "center" });
  }
}

function addCurveSchematic(slide, prefix, x0, y0, w, h) {
  addLine(slide, `${prefix}-x-axis`, x0 - 15, y0 + h - 25, w, 0, C.charcoal, 3);
  addLine(slide, `${prefix}-y-axis`, x0, y0 + h - 25, 0, -h + 50, C.charcoal, 3);
  addLine(slide, `${prefix}-zero`, x0, y0 + h / 2 - 25, w - 15, 0, C.rule, 2, "dashed");
  slide.shapes.add({
    geometry: "custom",
    name: `${prefix}-curve`,
    position: { left: x0, top: y0, width: w, height: h },
    fill: "none",
    line: { style: "solid", fill: C.blue, width: 5 },
    customPaths: [{
      width: w,
      height: h,
      commands: [
        { moveTo: { x: 0, y: h - 25 } },
        { lineTo: { x: 90, y: h - 75 } },
        { lineTo: { x: 180, y: h - 125 } },
        { lineTo: { x: 270, y: h - 190 } },
        { lineTo: { x: 360, y: h - 250 } },
        { lineTo: { x: 450, y: h - 325 } },
        { lineTo: { x: 540, y: h - 390 } },
        { lineTo: { x: 630, y: h - 440 } },
      ],
    }],
  });
  const current = { x: x0 + 360, y: y0 + h - 250 };
  const root = { x: x0 + 630, y: y0 + h / 2 - 25 };
  addCircle(slide, `${prefix}-current`, current.x - 11, current.y - 11, 22, C.gold);
  addLine(slide, `${prefix}-tangent`, current.x, current.y, root.x - current.x, root.y - current.y, C.gold, 4);
  addCircle(slide, `${prefix}-root`, root.x - 12, root.y - 12, 24, C.green);
  addText(slide, `${prefix}-current-label`, "current θ", current.x - 70, current.y + 22, 140, 34, { fontSize: 22, color: C.gold, bold: true, alignment: "center" });
  addText(slide, `${prefix}-root-label`, "next θ", root.x - 70, root.y - 52, 140, 34, { fontSize: 22, color: C.green, bold: true, alignment: "center" });
  addText(slide, `${prefix}-zero-label`, "residual = 0", x0 + 5, y0 + h / 2 - 58, 160, 30, { fontSize: 22, color: C.muted, bold: true });
  addText(slide, `${prefix}-slope-label`, "local slope", x0 + 430, y0 + h - 150, 160, 34, { fontSize: 22, color: C.gold, bold: true, alignment: "center" });
}

function addNativeTable(slide, name, config, values, headerRows, bodySize, alignments) {
  const table = slide.tables.add({ ...config, values });
  styleTable(table, headerRows, bodySize, alignments);
  return table;
}

async function writeBlob(path, blob) {
  await fs.writeFile(path, new Uint8Array(await blob.arrayBuffer()));
}

async function readImageBlob(path) {
  const bytes = await fs.readFile(path);
  return bytes.buffer.slice(bytes.byteOffset, bytes.byteOffset + bytes.byteLength);
}

async function main() {
  await fs.mkdir(BUILD, { recursive: true });
  await fs.mkdir(RENDER_DIR, { recursive: true });
  const speech = await fs.readFile(SPEECH_PATH, "utf8");
  IMAGE_BLOBS = new Map(await Promise.all(Object.values(ASSET).map(async (path) => [path, await readImageBlob(path)])));
  const presentation = await PresentationFile.importPptx(await FileBlob.load(MASTER));

  for (const oldSlide of [...presentation.slides.items]) {
    oldSlide.delete();
  }

  const slides = [];
  const addSlide = (layoutId) => {
    const slide = presentation.slides.add({ layoutId });
    slide.setViewportSize(1920, 1080);
    slide.background.fill = C.white;
    slides.push(slide);
    return slide;
  };

  // Slide 1 — opening master
  {
    const slide = addSlide(LAYOUT.opening);
    setPlaceholderText(slide, "title", "From a Physical Target\nto a Checkable Root", {
      left: 115, top: 245, width: 1080, height: 210,
      text: { fontSize: 74, typeface: "Nunito", color: C.navy, bold: true, alignment: "left", verticalAlignment: "top", lineSpacing: 0.94, wrap: "square", autoFit: "shrinkText", insets: { top: 0, right: 0, bottom: 0, left: 0 } },
    });
    setPlaceholderText(slide, "subtitle", "Week 5 | Root finding with bisection and Newton", {
      left: 115, top: 475, width: 1180, height: 80,
      text: { fontSize: 34, typeface: "Nunito", color: C.charcoal, bold: false, alignment: "left", verticalAlignment: "top", lineSpacing: 1.0, wrap: "none", autoFit: "shrinkText", insets: { top: 0, right: 0, bottom: 0, left: 0 } },
    });
    addText(slide, "course-tag", "PHY4605 Computational Methods in Physics", 115, 126, 760, 38, { fontSize: 26, color: C.charcoal, bold: true, verticalAlignment: "middle" });
    addImage(slide, "opening-hero", ASSET.hero, "Two projectile trajectories with different ranges", 1230, 175, 545, 570, "contain");
    addText(slide, "hero-label-left", "same launch speed", 1230, 760, 260, 36, { fontSize: 24, color: C.muted, bold: true, alignment: "left" });
    addText(slide, "hero-label-right", "different angles", 1505, 760, 270, 36, { fontSize: 24, color: C.blue, bold: true, alignment: "right" });
    addWorkflow(slide, ["physical model", "residual", "bracket", "validation"], 860, [C.paleBlue, C.paleNeutral, C.paleGold, C.paleValid]);
    addText(slide, "opening-note", "Find the angle that makes the predicted range meet the target", 115, 950, 1500, 34, { fontSize: 24, color: C.muted, verticalAlignment: "middle" });
    slide.speakerNotes.textFrame.setText(noteText(speech, 1, mergeSources("visual")));
    slide.speakerNotes.setVisible(true);
  }

  // Slide 2 — residual definition
  {
    const slide = addSlide(LAYOUT.t2);
    addChrome(slide, 2, "Turn the target condition into a residual", "T2", "The root is the angle that makes predicted range equal the target");
    const cols = [115, 680, 1245];
    const fills = [C.paleBlue, C.paleGold, C.paleValid];
    const headings = ["physical model", "target condition", "residual = 0"];
    headings.forEach((heading, i) => {
      addBox(slide, `model-stage-${i + 1}`, cols[i], 285, 460, 105, fills[i], i === 0 ? C.blue : i === 1 ? C.gold : C.green);
      addText(slide, `model-stage-heading-${i + 1}`, heading, cols[i] + 28, 318, 404, 42, { fontSize: 30, color: i === 0 ? C.blue : i === 1 ? C.gold : C.green, bold: true, alignment: "center", verticalAlignment: "middle" });
      if (i < headings.length - 1) addArrow(slide, `model-stage-arrow-${i + 1}`, cols[i] + 475, 327, 62, 28, C.rule);
    });
    addEquation(slide, "equation-model-residual", ASSET.model, "LaTeX-rendered projectile range model and residual definition", 190, 455, 1540, 230);
    addText(slide, "residual-explanation", "The residual is the signed miss: predicted range minus target range", 220, 720, 1480, 50, { fontSize: 30, color: C.navy, bold: true, alignment: "center", verticalAlignment: "middle" });
    addWorkflow(slide, ["predict range", "subtract 35 m", "seek zero"], 815, [C.paleBlue, C.paleGold, C.paleValid]);
    slide.speakerNotes.textFrame.setText(noteText(speech, 2, mergeSources("model")));
    slide.speakerNotes.setVisible(true);
  }

  // Slide 3 — residual sign meaning
  {
    const slide = addSlide(LAYOUT.t1);
    addChrome(slide, 3, "Read the residual sign as physics", "T1", "A residual carries direction, not just error size");
    const cards = [
      { x: 115, fill: C.paleBlue, line: C.blue, heading: "undershoot", body: "range below target", sign: "negative", arrow: "shorter" },
      { x: 710, fill: C.paleValid, line: C.green, heading: "exact hit", body: "range matches target", sign: "zero", arrow: "root" },
      { x: 1305, fill: C.paleGold, line: C.gold, heading: "overshoot", body: "range above target", sign: "positive", arrow: "longer" },
    ];
    cards.forEach((card, i) => {
      addBox(slide, `sign-card-${i + 1}`, card.x, 285, 500, 410, card.fill, card.line);
      addText(slide, `sign-heading-${i + 1}`, card.heading, card.x + 32, 325, 436, 42, { fontSize: 34, color: card.line, bold: true, alignment: "center", verticalAlignment: "middle" });
      addLine(slide, `sign-baseline-${i + 1}`, card.x + 80, 455, 340, 0, C.navy, 4);
      addCircle(slide, `sign-target-${i + 1}`, card.x + 238, 443, 24, card.line);
      addCircle(slide, `sign-ball-${i + 1}`, card.x + 110 + (i === 0 ? 50 : i === 2 ? 270 : 128), 425, 48, C.navy);
      addLine(slide, `sign-travel-${i + 1}`, card.x + 140, 425, i === 0 ? 82 : i === 2 ? 224 : 128, 0, card.line, 3, "dashed");
      addText(slide, `sign-symbol-${i + 1}`, card.sign, card.x + 32, 520, 436, 48, { fontSize: 32, color: card.line, bold: true, alignment: "center", verticalAlignment: "middle" });
      addText(slide, `sign-body-${i + 1}`, card.body, card.x + 32, 590, 436, 40, { fontSize: 26, color: C.charcoal, alignment: "center", verticalAlignment: "middle" });
      addText(slide, `sign-arrow-${i + 1}`, card.arrow, card.x + 32, 635, 436, 32, { fontSize: 22, color: card.line, bold: true, alignment: "center", verticalAlignment: "middle" });
    });
    addEquation(slide, "equation-sign-meanings", ASSET.signs, "LaTeX-rendered residual sign meanings", 255, 745, 1410, 112);
    addBox(slide, "sign-takeaway", 115, 878, 1560, 62, C.paleNavy, "none", 22);
    addText(slide, "sign-takeaway-text", "The sign tells the algorithm which direction of miss must be corrected", 150, 891, 1490, 36, { fontSize: 26, color: C.navy, bold: true, alignment: "center", verticalAlignment: "middle" });
    slide.speakerNotes.textFrame.setText(noteText(speech, 3, mergeSources("signs")));
    slide.speakerNotes.setVisible(true);
  }

  // Slide 4 — bracket from MATLAB residual plot
  {
    const slide = addSlide(LAYOUT.t1);
    addChrome(slide, 4, "Find the zero crossing before coding", "T1", "Bracket first: opposite endpoint signs fence a root");
    addBox(slide, "bracket-evidence", 115, 285, 450, 565, C.paleNeutral, C.rule);
    addText(slide, "bracket-heading", "candidate bracket", 150, 325, 380, 42, { fontSize: 34, color: C.navy, bold: true, alignment: "center", verticalAlignment: "middle" });
    addText(slide, "bracket-a-label", "left endpoint", 155, 410, 170, 30, { fontSize: 22, color: C.muted, bold: true });
    addText(slide, "bracket-a-value", "20 degree", 155, 443, 330, 42, { fontSize: 30, color: C.navy, bold: true });
    addText(slide, "bracket-a-residual", "f(20 degree) = −8.7905 m", 155, 490, 360, 36, { fontSize: 24, color: C.blue });
    addLine(slide, "bracket-rule", 155, 552, 370, 0, C.rule, 2);
    addText(slide, "bracket-b-label", "right endpoint", 155, 595, 170, 30, { fontSize: 22, color: C.muted, bold: true });
    addText(slide, "bracket-b-value", "40 degree", 155, 628, 330, 42, { fontSize: 30, color: C.navy, bold: true });
    addText(slide, "bracket-b-residual", "f(40 degree) = +5.1553 m", 155, 675, 360, 36, { fontSize: 24, color: C.gold });
    addBox(slide, "bracket-conclusion", 150, 750, 380, 64, C.paleValid, C.green);
    addText(slide, "bracket-conclusion-text", "opposite signs → keep [20, 40]", 170, 766, 340, 34, { fontSize: 24, color: C.green, bold: true, alignment: "center", verticalAlignment: "middle" });
    addImage(slide, "residual-plot", ASSET.residualPlot, "MATLAB-generated projectile-range residual plot for a 35 m target", 610, 280, 1120, 600, "contain");
    addText(slide, "graph-callout", "zero crossing", 1120, 328, 240, 34, { fontSize: 24, color: C.green, bold: true, alignment: "center" });
    addLine(slide, "graph-callout-line", 1220, 365, 0, 60, C.green, 3, "dashed");
    addBox(slide, "graph-takeaway", 610, 888, 1120, 52, C.paleGold, "none", 22);
    addText(slide, "graph-takeaway-text", "The graph suggests where to look; the endpoint signs make the start defensible", 640, 899, 1060, 30, { fontSize: 24, color: C.navy, bold: true, alignment: "center", verticalAlignment: "middle" });
    slide.speakerNotes.textFrame.setText(noteText(speech, 4, mergeSources("plot")));
    slide.speakerNotes.setVisible(true);
  }

  // Slide 5 — editable reconstruction of approved sample
  {
    const slide = addSlide(LAYOUT.t1);
    addChrome(slide, 5, "Bisection keeps a sign change alive", "T1", "Test the midpoint, then keep the sign-changing half");
    addText(slide, "bisection-axis-label", "launch angle, theta (degree)", 115, 252, 520, 36, { fontSize: 27, color: C.navy, bold: true });
    addNumberLine(slide, "bisection-top", 210, 560, 375, "20 degree", "40 degree", { x: 385, label: "30 degree", color: C.gold }, { leftColor: C.navy, rightColor: C.navy });
    addText(slide, "bisection-zero-label", "zero residual", 315, 295, 180, 32, { fontSize: 22, color: C.navy, bold: true, alignment: "center" });
    addLine(slide, "bisection-zero-marker", 385, 327, 0, 36, C.navy, 3, "dashed");
    addText(slide, "bisection-test", "test the midpoint", 650, 292, 250, 36, { fontSize: 28, color: C.gold, bold: true, alignment: "center" });
    addText(slide, "bisection-keep", "keep the sign-changing half", 1140, 292, 470, 36, { fontSize: 28, color: C.green, bold: true, alignment: "center" });
    addArrow(slide, "bisection-top-arrow-1", 600, 355, 72, 34, C.blue);
    addArrow(slide, "bisection-top-arrow-2", 1000, 355, 72, 34, C.blue);
    addNumberLine(slide, "bisection-mid", 735, 965, 375, "20 degree", "30 degree", null, { leftColor: C.green, rightColor: C.green, axisColor: C.green });
    addText(slide, "bisection-mid-left-value", "f(20 degree) = −8.7905 m", 640, 425, 360, 34, { fontSize: 21, color: C.charcoal, alignment: "center", verticalAlignment: "middle" });
    addText(slide, "bisection-mid-right-value", "f(30 degree) = +0.31194 m", 1010, 425, 360, 34, { fontSize: 21, color: C.charcoal, alignment: "center", verticalAlignment: "middle" });
    const steps = ["choose opposite signs", "compute midpoint", "evaluate residual", "keep the sign change"];
    const stepXs = [115, 530, 945, 1360];
    stepXs.forEach((x, i) => {
      addNumberedStep(slide, i + 1, steps[i], x, 610, 355, i === 3 ? C.green : i === 1 || i === 2 ? C.gold : C.blue);
      if (i < stepXs.length - 1) addArrow(slide, `bisection-step-arrow-${i + 1}`, x + 355, 626, 44, 28, C.blue);
    });
    addBox(slide, "bisection-question", 115, 760, 1560, 120, C.paleGold, C.gold);
    addCircle(slide, "bisection-question-mark", 150, 788, 64, C.gold);
    addText(slide, "bisection-question-mark-text", "?", 150, 796, 64, 50, { fontSize: 40, color: C.white, bold: true, alignment: "center", verticalAlignment: "middle" });
    addText(slide, "bisection-question-title", "Why is the midpoint not enough?", 250, 785, 560, 36, { fontSize: 30, color: C.gold, bold: true, verticalAlignment: "middle" });
    addText(slide, "bisection-question-body", "Because bisection needs a bracket whose endpoint residuals have opposite signs", 250, 830, 1250, 34, { fontSize: 24, color: C.charcoal, verticalAlignment: "middle" });
    slide.speakerNotes.textFrame.setText(noteText(speech, 5, mergeSources()));
    slide.speakerNotes.setVisible(true);
  }

  // Slide 6 — bisection trace
  {
    const slide = addSlide(LAYOUT.t2);
    addChrome(slide, 6, "Trace the first four bisection updates", "T2", "Track the interval and the residual before the next midpoint");
    addNativeTable(slide, "bisection-trace-table", { rows: 5, columns: 5, left: 115, top: 290, width: 1180, height: 500, columnWidths: [140, 300, 250, 270, 220] }, [
      ["iteration", "current bracket\n(degree)", "midpoint\n(degree)", "f(mid) (m)", "keep"],
      ["1", "[20, 40]", "30", "+0.31194", "[20, 30]"],
      ["2", "[20, 30]", "25", "−3.7648", "[25, 30]"],
      ["3", "[25, 30]", "27.5", "−1.5993", "[27.5, 30]"],
      ["4", "[27.5, 30]", "28.75", "−0.61095", "[28.75, 30]"],
    ], 1, 24, ["center", "center", "center", "center", "center"]);
    addText(slide, "trace-diagram-heading", "the sign-changing half survives", 1340, 292, 430, 46, { fontSize: 28, color: C.green, bold: true, alignment: "center" });
    const intervals = [[20, 40], [20, 30], [25, 30], [27.5, 30]];
    intervals.forEach((range, i) => {
      const y = 410 + i * 92;
      addText(slide, `trace-range-label-${i + 1}`, `row ${i + 1}`, 1320, y - 28, 90, 30, { fontSize: 22, color: C.muted, bold: true, alignment: "right", verticalAlignment: "middle" });
      const x1 = 1450 + (range[0] - 20) * 12;
      const x2 = 1450 + (range[1] - 20) * 12;
      addLine(slide, `trace-range-line-${i + 1}`, x1, y, x2 - x1, 0, C.green, 6);
      addCircle(slide, `trace-range-left-${i + 1}`, x1 - 11, y - 11, 22, C.green);
      addCircle(slide, `trace-range-right-${i + 1}`, x2 - 11, y - 11, 22, C.green);
      addText(slide, `trace-range-text-${i + 1}`, `[${range[0]}, ${range[1]}]`, 1410, y + 30, 340, 30, { fontSize: 22, color: C.green, bold: true, alignment: "center" });
    });
    addBox(slide, "trace-takeaway", 115, 845, 1560, 62, C.paleValid, "none", 22);
    addText(slide, "trace-takeaway-text", "Each row leaves one sign change intact, so the root stays inside the next bracket", 150, 859, 1490, 34, { fontSize: 26, color: C.green, bold: true, alignment: "center", verticalAlignment: "middle" });
    slide.speakerNotes.textFrame.setText(noteText(speech, 6, mergeSources("Week05/.agent/lecture-slides/codex-ppt/assets/strict/tables/bisection_first_four.tex")));
    slide.speakerNotes.setVisible(true);
  }

  // Slide 7 — bisection scaffold
  {
    const slide = addSlide(LAYOUT.t2);
    addChrome(slide, 7, "Read the bisection scaffold, line by line", "T2", "The loop is a translation of the sign-preserving algorithm");
    addBox(slide, "bisection-code-card", 115, 285, 1690, 560, C.paleNavy, C.rule);
    addText(slide, "bisection-code-label", "MATLAB scaffold", 150, 315, 320, 36, { fontSize: 28, color: C.blue, bold: true });
    const code = `bis_left_deg = left_deg;\nbis_right_deg = right_deg;\nfor iteration = 1:max_iterations\n    mid_deg = (bis_left_deg + bis_right_deg)/2;\n    f_mid_m = (v0_mps^2/g_mps2)*sind(2*mid_deg) - target_m;\n    if abs(f_mid_m) < tolerance_m\n        break\n    end\n    f_bis_left_m = (v0_mps^2/g_mps2)*sind(2*bis_left_deg) - target_m;\n    if f_bis_left_m*f_mid_m < 0\n        bis_right_deg = mid_deg;\n    else\n        bis_left_deg = mid_deg;\n    end\nend\nbisection_root_deg = mid_deg;`;
    addText(slide, "bisection-code", code, 150, 360, 1620, 430, { fontSize: 25, typeface: "IBM Plex Mono", color: C.navy, lineSpacing: 1.04, wrap: "none", autoFit: "shrinkText", insets: { top: 0, right: 0, bottom: 0, left: 0 } });
    const callouts = [
      ["1", "midpoint", C.gold],
      ["2", "stop on residual", C.green],
      ["3", "test left sign", C.blue],
      ["4", "replace one bound", C.green],
    ];
    callouts.forEach((item, i) => {
      const x = 150 + i * 405;
      addCircle(slide, `code-callout-circle-${i + 1}`, x, 815, 34, item[2]);
      addText(slide, `code-callout-number-${i + 1}`, item[0], x, 819, 34, 24, { fontSize: 18, color: C.white, bold: true, alignment: "center", verticalAlignment: "middle" });
      addText(slide, `code-callout-label-${i + 1}`, item[1], x + 48, 815, 300, 30, { fontSize: 22, color: item[2], bold: true, verticalAlignment: "middle" });
    });
    addBox(slide, "code-prompt", 115, 875, 1560, 50, C.paleGold, "none", 22);
    addText(slide, "code-prompt-text", "Which line protects the sign change?", 150, 885, 1490, 30, { fontSize: 24, color: C.gold, bold: true, alignment: "center", verticalAlignment: "middle" });
    slide.speakerNotes.textFrame.setText(noteText(speech, 7, mergeSources("Week05/.agent/lecture-slides/codex-ppt/assets/strict/code/bisection_scaffold.tex")));
    slide.speakerNotes.setVisible(true);
  }

  // Slide 8 — bisection validation
  {
    const slide = addSlide(LAYOUT.t1);
    addChrome(slide, 8, "Stop once, then substitute back", "T1", "A small residual matters only after checking the physical model");
    addBox(slide, "bisection-result-card", 115, 285, 590, 535, C.paleBlue, C.blue);
    addText(slide, "bisection-result-heading", "bisection result", 150, 330, 520, 42, { fontSize: 34, color: C.blue, bold: true, alignment: "center", verticalAlignment: "middle" });
    addText(slide, "bisection-root", "29.5679 degree", 150, 420, 520, 62, { fontSize: 42, color: C.navy, bold: true, alignment: "center", verticalAlignment: "middle" });
    addText(slide, "bisection-iterations", "13 recorded iterations", 150, 510, 520, 40, { fontSize: 28, color: C.charcoal, alignment: "center", verticalAlignment: "middle" });
    addBox(slide, "bisection-stop-rule", 160, 615, 500, 86, C.white, C.blue);
    addText(slide, "bisection-stop-rule-text", "stop: |residual| < 1e-3 m", 180, 640, 460, 36, { fontSize: 26, color: C.blue, bold: true, alignment: "center", verticalAlignment: "middle" });
    addText(slide, "bisection-result-note", "Use the root as an input to the model, not as the final claim", 160, 745, 500, 52, { fontSize: 24, color: C.muted, alignment: "center" });
    addBox(slide, "validation-card", 800, 285, 1005, 535, C.paleValid, C.green);
    addText(slide, "validation-heading", "substitution check", 840, 325, 925, 42, { fontSize: 34, color: C.green, bold: true, alignment: "center", verticalAlignment: "middle" });
    addEquation(slide, "validation-equation", ASSET.validation, "LaTeX-rendered root substitution and residual check", 865, 385, 875, 155);
    addNativeTable(slide, "validation-table", { rows: 4, columns: 3, left: 840, top: 565, width: 925, height: 210, columnWidths: [230, 290, 405] }, [
      ["check", "result", "interpretation"],
      ["root angle", "29.5679 degree", "low-angle launch angle"],
      ["model range", "35.0004 m", "target condition is met"],
      ["residual", "+4.1164 × 10⁻⁴ m", "below 10⁻³ m tolerance"],
    ], 1, 22, ["left", "center", "left"]);
    addBox(slide, "validation-takeaway", 115, 860, 1560, 58, C.paleValid, "none", 22);
    addText(slide, "validation-takeaway-text", "Validation closes the loop: the reported angle reproduces the target range", 150, 874, 1490, 32, { fontSize: 26, color: C.green, bold: true, alignment: "center", verticalAlignment: "middle" });
    slide.speakerNotes.textFrame.setText(noteText(speech, 8, mergeSources("validation")));
    slide.speakerNotes.setVisible(true);
  }

  // Slide 9 — Newton geometry and update
  {
    const slide = addSlide(LAYOUT.t1);
    addChrome(slide, 9, "Newton follows the local tangent", "T1", "A tangent turns the residual into a local correction");
    addBox(slide, "newton-geometry-card", 115, 285, 900, 560, C.paleNeutral, C.rule);
    addCurveSchematic(slide, "newton-schematic", 235, 345, 690, 410);
    addText(slide, "newton-geometry-caption", "use the local slope to predict a better angle", 185, 785, 760, 36, { fontSize: 26, color: C.navy, bold: true, alignment: "center" });
    addBox(slide, "newton-equation-card", 1080, 285, 725, 560, C.paleGold, C.gold);
    addText(slide, "newton-equation-heading", "Newton update", 1120, 330, 645, 42, { fontSize: 34, color: C.gold, bold: true, alignment: "center", verticalAlignment: "middle" });
    addEquation(slide, "newton-update-equation", ASSET.newton, "LaTeX-rendered Newton update and degree-based residual slope", 1130, 420, 625, 210);
    addText(slide, "newton-unit-note", "Because theta is in degree, the slope must be in m per degree", 1140, 690, 605, 76, { fontSize: 25, color: C.charcoal, bold: true, alignment: "center", verticalAlignment: "middle" });
    addBox(slide, "newton-takeaway", 115, 875, 1560, 50, C.paleGold, "none", 22);
    addText(slide, "newton-takeaway-text", "Newton moves by residual divided by local slope", 150, 885, 1490, 30, { fontSize: 24, color: C.gold, bold: true, alignment: "center", verticalAlignment: "middle" });
    slide.speakerNotes.textFrame.setText(noteText(speech, 9, mergeSources("newton")));
    slide.speakerNotes.setVisible(true);
  }

  // Slide 10 — Newton trace
  {
    const slide = addSlide(LAYOUT.t2);
    addChrome(slide, 10, "Trace Newton from 25 degree", "T2", "Starting at 25 degree reaches the same low-angle root in four evaluations");
    addBox(slide, "newton-code-card", 115, 285, 790, 520, C.paleNavy, C.rule);
    addText(slide, "newton-code-label", "short update fragment", 150, 325, 720, 36, { fontSize: 28, color: C.blue, bold: true, alignment: "center" });
    addText(slide, "newton-code-fragment", "newton_theta_deg = newton_theta_deg - f_current_m/slope_m_per_deg;", 150, 470, 720, 90, { fontSize: 25, typeface: "IBM Plex Mono", color: C.navy, lineSpacing: 1.12, wrap: "none", autoFit: "shrinkText", insets: { top: 0, right: 0, bottom: 0, left: 0 } });
    addText(slide, "newton-code-note", "read the direction: residual and slope set the correction", 150, 690, 720, 70, { fontSize: 24, color: C.muted, bold: true, alignment: "center" });
    addNativeTable(slide, "newton-trace-table", { rows: 5, columns: 5, left: 960, top: 285, width: 845, height: 520, columnWidths: [90, 120, 185, 265, 185] }, [
      ["iteration", "theta\n(degree)", "residual\n(m)", "slope\n(m/degree)", "next angle\n(degree)"],
      ["1", "25", "−3.7648", "0.91488", "29.115"],
      ["2", "29.115", "−0.33461", "0.74939", "29.562"],
      ["3", "29.562", "−0.0042242", "0.73044", "29.567"],
      ["4", "29.567", "−7.1308 × 10−7", "0.73019", "stop"],
    ], 1, 22, ["center", "center", "center", "center", "center"]);
    addBox(slide, "newton-stop-badge", 115, 845, 1560, 62, C.paleValid, "none", 22);
    addText(slide, "newton-stop-badge-text", "At iteration 4, the residual is below 1e-3 m, so the update stops", 150, 859, 1490, 34, { fontSize: 26, color: C.green, bold: true, alignment: "center", verticalAlignment: "middle" });
    slide.speakerNotes.textFrame.setText(noteText(speech, 10, mergeSources("Week05/.agent/lecture-slides/codex-ppt/assets/strict/code/newton_scaffold.tex", "Week05/.agent/lecture-slides/codex-ppt/assets/strict/tables/newton_trace.tex")));
    slide.speakerNotes.setVisible(true);
  }

  // Slide 11 — working exposure comparison
  {
    const slide = addSlide(LAYOUT.t2);
    addChrome(slide, 11, "Working exposure: same root, different route", "T2", "Compare what each method preserves and what it needs");
    addText(slide, "comparison-left-tag", "BRACKETED", 115, 285, 790, 38, { fontSize: 26, color: C.blue, bold: true, alignment: "center" });
    addText(slide, "comparison-right-tag", "LOCAL", 1015, 285, 790, 38, { fontSize: 26, color: C.gold, bold: true, alignment: "center" });
    addNativeTable(slide, "method-comparison-table", { rows: 3, columns: 4, left: 115, top: 345, width: 1690, height: 330, columnWidths: [240, 430, 260, 760] }, [
      ["method", "update idea", "recorded evaluations", "what it preserves / needs"],
      ["Bisection", "midpoint and\nsign-changing half", "13", "preserves a bracket"],
      ["Newton", "current − residual/slope", "4", "needs a useful slope and start"],
    ], 1, 25, ["left", "left", "center", "left"]);
    addBox(slide, "comparison-check", 115, 750, 1690, 120, C.paleValid, C.green);
    addText(slide, "comparison-check-title", "shared validation", 150, 775, 260, 34, { fontSize: 26, color: C.green, bold: true, verticalAlignment: "middle" });
    addText(slide, "comparison-check-body", "Substitute the reported angle back into the range model before interpreting the result", 445, 772, 1310, 48, { fontSize: 26, color: C.navy, bold: true, verticalAlignment: "middle" });
    addText(slide, "comparison-note", "Working exposure: method choice is about evidence and conditions, not just speed", 115, 900, 1690, 34, { fontSize: 24, color: C.muted, bold: true, alignment: "center" });
    slide.speakerNotes.textFrame.setText(noteText(speech, 11, mergeSources("Week05/.agent/lecture-slides/codex-ppt/assets/strict/tables/method_comparison.tex")));
    slide.speakerNotes.setVisible(true);
  }

  // Slide 12 — debugging the bracket
  {
    const slide = addSlide(LAYOUT.t3);
    addChrome(slide, 12, "A midpoint is not enough: the bracket must change sign", "T3", "A midpoint helps only after you prove the endpoints straddle a zero");
    addBox(slide, "same-sign-card", 115, 335, 700, 440, C.paleRed, C.red);
    addText(slide, "same-sign-heading", "same-sign start", 155, 375, 620, 42, { fontSize: 34, color: C.red, bold: true, alignment: "center", verticalAlignment: "middle" });
    addNumberLine(slide, "same-sign-line", 235, 690, 520, "20 degree", "30 degree", { x: 462, label: "midpoint", color: C.gold }, { leftColor: C.red, rightColor: C.red, axisColor: C.red });
    addText(slide, "same-sign-residuals", "both endpoint residuals are negative", 175, 635, 580, 40, { fontSize: 26, color: C.red, bold: true, alignment: "center" });
    addText(slide, "same-sign-blocked", "blocked start", 175, 700, 580, 38, { fontSize: 28, color: C.red, bold: true, alignment: "center" });
    addArrow(slide, "repair-arrow", 855, 512, 190, 38, C.gold);
    addText(slide, "repair-label", "check signs first", 835, 460, 230, 34, { fontSize: 24, color: C.gold, bold: true, alignment: "center" });
    addBox(slide, "sign-changing-card", 1110, 335, 695, 440, C.paleValid, C.green);
    addText(slide, "sign-changing-heading", "sign-changing start", 1150, 375, 615, 42, { fontSize: 34, color: C.green, bold: true, alignment: "center", verticalAlignment: "middle" });
    addNumberLine(slide, "sign-changing-line", 1225, 1685, 520, "20 degree", "40 degree", null, { leftColor: C.green, rightColor: C.green, axisColor: C.green });
    addText(slide, "sign-changing-residuals", "endpoint residuals have opposite signs", 1170, 635, 575, 40, { fontSize: 26, color: C.green, bold: true, alignment: "center" });
    addText(slide, "sign-changing-valid", "bisection can update", 1170, 700, 575, 38, { fontSize: 28, color: C.green, bold: true, alignment: "center" });
    addBox(slide, "bracket-warning", 115, 840, 1560, 72, C.paleGold, C.gold);
    addText(slide, "bracket-warning-text", "A midpoint is a test point; the bracket is the guarantee", 150, 858, 1490, 36, { fontSize: 28, color: C.gold, bold: true, alignment: "center", verticalAlignment: "middle" });
    slide.speakerNotes.textFrame.setText(noteText(speech, 12, mergeSources()));
    slide.speakerNotes.setVisible(true);
  }

  // Slide 13 — transfer to new physics
  {
    const slide = addSlide(LAYOUT.t2);
    addChrome(slide, 13, "Transfer the residual pattern to new physics", "T2", "Any physical equation can become a root problem");
    addBox(slide, "thin-lens-card", 115, 285, 760, 380, C.paleBlue, C.blue);
    addText(slide, "thin-lens-heading", "thin lens", 150, 325, 690, 42, { fontSize: 34, color: C.blue, bold: true, alignment: "center", verticalAlignment: "middle" });
    addText(slide, "thin-lens-question", "Find the image distance that makes the lens equation balance", 165, 410, 660, 76, { fontSize: 26, color: C.charcoal, alignment: "center", verticalAlignment: "middle" });
    addText(slide, "thin-lens-bracket", "bracket a distance, then preserve the sign change", 165, 545, 660, 40, { fontSize: 24, color: C.blue, bold: true, alignment: "center" });
    addBox(slide, "rc-card", 1045, 285, 760, 380, C.paleGold, C.gold);
    addText(slide, "rc-heading", "RC charging", 1080, 325, 690, 42, { fontSize: 34, color: C.gold, bold: true, alignment: "center", verticalAlignment: "middle" });
    addText(slide, "rc-question", "Find the time at which the capacitor reaches a threshold voltage", 1095, 410, 660, 76, { fontSize: 26, color: C.charcoal, alignment: "center", verticalAlignment: "middle" });
    addText(slide, "rc-bracket", "bracket a time, then validate by substitution", 1095, 545, 660, 40, { fontSize: 24, color: C.gold, bold: true, alignment: "center" });
    addEquation(slide, "transfer-equations", ASSET.transfer, "LaTeX-rendered thin-lens and RC residual definitions", 210, 685, 1500, 165);
    addWorkflow(slide, ["define residual", "bracket or start", "update", "substitute back"], 865, [C.paleBlue, C.paleGold, C.paleNeutral, C.paleValid]);
    slide.speakerNotes.textFrame.setText(noteText(speech, 13, mergeSources("transfer")));
    slide.speakerNotes.setVisible(true);
  }

  // Slide 14 — exit ticket
  {
    const slide = addSlide(LAYOUT.t2);
    addChrome(slide, 14, "Exit ticket — explain a root to a future you", "T2", "Make the reasoning chain visible in one minute");
    const prompts = [
      ["model", "What physical quantity are you matching?", C.paleBlue, C.blue],
      ["residual", "What does zero mean here?", C.paleGold, C.gold],
      ["method", "How did your bracket or slope move the guess?", C.paleNeutral, C.navy],
      ["validation", "What did substitution prove?", C.paleValid, C.green],
    ];
    prompts.forEach((item, i) => {
      const x = 115 + i * 397;
      addBox(slide, `exit-card-${i + 1}`, x, 300, 350, 390, item[2], item[3]);
      addText(slide, `exit-card-heading-${i + 1}`, item[0], x + 26, 340, 298, 42, { fontSize: 32, color: item[3], bold: true, alignment: "center", verticalAlignment: "middle" });
      addLine(slide, `exit-card-rule-${i + 1}`, x + 60, 412, 230, 0, item[3], 2);
      addText(slide, `exit-card-question-${i + 1}`, item[1], x + 34, 480, 282, 130, { fontSize: 26, color: C.navy, bold: true, alignment: "center", verticalAlignment: "middle" });
      addText(slide, `exit-card-prompt-${i + 1}`, "write one sentence", x + 34, 630, 282, 34, { fontSize: 22, color: C.muted, alignment: "center", verticalAlignment: "middle" });
    });
    addBox(slide, "exit-workflow", 115, 750, 1560, 112, C.paleNavy, "none", 22);
    addText(slide, "exit-workflow-label", "your explanation", 145, 770, 230, 34, { fontSize: 24, color: C.navy, bold: true, verticalAlignment: "middle" });
    addText(slide, "exit-workflow-text", "physical model  →  residual  →  algorithm  →  code  →  check  →  interpretation", 385, 770, 1240, 50, { fontSize: 27, color: C.navy, bold: true, alignment: "center", verticalAlignment: "middle" });
    addText(slide, "exit-final", "A root is not just a number: it is a defensible physical match", 115, 900, 1690, 36, { fontSize: 26, color: C.green, bold: true, alignment: "center", verticalAlignment: "middle" });
    slide.speakerNotes.textFrame.setText(noteText(speech, 14, mergeSources()));
    slide.speakerNotes.setVisible(true);
  }

  for (let i = 0; i < slides.length; i += 1) {
    const stem = `slide-${String(i + 1).padStart(2, "0")}`;
    await writeBlob(`${RENDER_DIR}/${stem}.png`, await presentation.export({ slide: slides[i], format: "png", scale: 1.5 }));
    await fs.writeFile(`${RENDER_DIR}/${stem}.layout.json`, await (await slides[i].export({ format: "layout" })).text());
  }
  await writeBlob(MONTAGE, await presentation.export({ format: "webp", montage: true, scale: 0.35 }));
  const inspect = await presentation.inspect({ kind: "slide,textbox,shape,image,table,notes,layout", maxChars: 240000 });
  await fs.writeFile(`${BUILD}/final-inspect.ndjson`, inspect.ndjson);
  const proto = presentation.toProto();
  await fs.writeFile(`${BUILD}/final-proto.json`, JSON.stringify(proto, null, 2));
  const pptx = await PresentationFile.exportPptx(presentation);
  await pptx.save(FINAL);
  const summary = {
    final: FINAL,
    slideCount: slides.length,
    renderDir: RENDER_DIR,
    montage: MONTAGE,
    layoutIds: LAYOUT,
    notesVisible: slides.every((slide) => slide.speakerNotes.isVisible()),
  };
  await fs.writeFile(`${BUILD}/build-summary.json`, JSON.stringify(summary, null, 2));
  console.log(JSON.stringify(summary, null, 2));
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
