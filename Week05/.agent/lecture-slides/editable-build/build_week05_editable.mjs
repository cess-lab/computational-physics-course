import fs from "node:fs/promises";
import { importRuntimeModule } from "/Users/khairuladib/.codex/plugins/cache/openai-primary-runtime/presentations/26.826.12353/skills/presentations/container_tools/runtime_helpers.mjs";
const { FileBlob, PresentationFile } = await importRuntimeModule("@oai/artifact-tool");

const ROOT = "/Users/khairuladib/MATLAB-Drive/Kuliah/computational-physics-course";
const BUILD = `${ROOT}/Week05/.agent/lecture-slides/editable-build`;
const STARTER = `${BUILD}/template-starter.pptx`;
const FINAL = `${ROOT}/Week05/Lecture_Slides_Week05.pptx`;
const ASSET = `${ROOT}/Week05/.agent/lecture-slides/codex-ppt/assets/strict`;
const MASTER_ASSET = `${ROOT}/.agent/lecture-slide-system/assets/trajectory-comparison-matte.png`;

const C = {
  navy: "#0B2B4C",
  charcoal: "#3F4B57",
  slate: "#697684",
  lightRule: "#AAB4BE",
  plotGrid: "#DDE5EC",
  blue: "#2F6DB2",
  bluePale: "#EEF5FD",
  navyPale: "#F4F8FC",
  teal: "#2A9D9F",
  tealPale: "#F0FAF7",
  green: "#3E8E45",
  gold: "#C98A16",
  goldPale: "#FFF7E6",
  red: "#B3262E",
  redPale: "#FFF2F2",
  purple: "#6F4B9B",
  purplePale: "#F5F1FB",
  white: "#FFFFFF",
};

const F = { body: "Nunito", mono: "IBM Plex Mono" };

async function writeBlob(path, blob) {
  await fs.mkdir(path.substring(0, path.lastIndexOf("/")), { recursive: true });
  await fs.writeFile(path, Buffer.from(await blob.arrayBuffer()));
}

async function bytes(path) {
  const buffer = await fs.readFile(path);
  return buffer.buffer.slice(buffer.byteOffset, buffer.byteOffset + buffer.byteLength);
}

function noLine() {
  return { style: "solid", fill: "none", width: 0 };
}

function addText(slide, name, text, left, top, width, height, opts = {}) {
  const shape = slide.shapes.add({
    geometry: "textbox",
    name,
    position: { left, top, width, height },
    fill: "none",
    line: noLine(),
  });
  shape.text = text;
  shape.text.style = {
    typeface: opts.typeface || F.body,
    fontSize: opts.fontSize ?? 28,
    bold: opts.bold ?? false,
    italic: opts.italic ?? false,
    color: opts.color || C.charcoal,
    alignment: opts.align || "left",
    verticalAlignment: opts.valign || "top",
    wrap: opts.wrap || "square",
    autoFit: opts.autoFit || "shrinkText",
    lineSpacing: opts.lineSpacing,
    insets: opts.insets || { left: 0, right: 0, top: 0, bottom: 0 },
  };
  return shape;
}

function addBox(slide, name, left, top, width, height, fill, line = C.lightRule, opts = {}) {
  return slide.shapes.add({
    geometry: opts.geometry || "roundRect",
    name,
    position: { left, top, width, height },
    fill,
    line: { style: opts.lineStyle || "solid", fill: line, width: opts.lineWidth ?? 2 },
    borderRadius: opts.radius ?? 22,
  });
}

function addLine(slide, name, x1, y1, x2, y2, color = C.navy, width = 3, style = "solid") {
  const left = Math.min(x1, x2);
  const top = Math.min(y1, y2);
  const w = Math.max(Math.abs(x2 - x1), 1);
  const h = Math.max(Math.abs(y2 - y1), 1);
  return slide.shapes.add({
    geometry: "line",
    name,
    position: { left, top, width: w, height: h },
    fill: "none",
    line: { style, fill: color, width },
  });
}

function addArrow(slide, name, left, top, width, height, fill = C.lightRule) {
  return slide.shapes.add({
    geometry: "rightArrow",
    name,
    position: { left, top, width, height },
    fill,
    line: noLine(),
  });
}

function addCircle(slide, name, cx, cy, diameter, fill, line = fill, lineWidth = 0) {
  return slide.shapes.add({
    geometry: "ellipse",
    name,
    position: { left: cx - diameter / 2, top: cy - diameter / 2, width: diameter, height: diameter },
    fill,
    line: { style: "solid", fill: line, width: lineWidth },
  });
}

async function addImage(slide, name, path, left, top, width, height, alt, fit = "contain") {
  const file = await fs.readFile(path);
  return slide.images.add({
    blob: file.buffer.slice(file.byteOffset, file.byteOffset + file.byteLength),
    contentType: "image/png",
    name,
    alt,
    fit,
    position: { left, top, width, height },
  });
}

function titleBand(slide, number, title, subtitle, variant = "T1") {
  const titleSize = variant === "T3" ? 56 : variant === "T2" ? 62 : 68;
  const titleHeight = variant === "T3" ? 138 : 88;
  addText(slide, `slide-${number}-title`, title, 115, 60, 1580, titleHeight, {
    fontSize: titleSize,
    bold: true,
    color: C.navy,
    wrap: variant === "T3" ? "square" : "none",
    autoFit: "none",
    lineSpacing: variant === "T3" ? 0.92 : undefined,
  });
  addLine(slide, `slide-${number}-title-rule`, 115, variant === "T3" ? 205 : 148, 1695, variant === "T3" ? 205 : 148, C.navy, 3);
  if (subtitle) {
    addText(slide, `slide-${number}-subtitle`, subtitle, 115, variant === "T3" ? 218 : 160, 1580, 44, {
      fontSize: 30,
      color: C.charcoal,
      autoFit: "shrinkText",
      wrap: "none",
    });
  }
  if (number > 1) {
    addText(slide, `slide-${number}-number`, String(number), 1764, 976, 40, 28, {
      fontSize: 22,
      color: C.slate,
      align: "right",
      autoFit: "none",
      wrap: "none",
    });
  }
}

function addBottomStrip(slide, number, text, fill = C.navyPale, line = C.lightRule, color = C.navy) {
  addBox(slide, `slide-${number}-takeaway`, 115, 925, 1560, 82, fill, line, { lineWidth: 2, radius: 22 });
  addText(slide, `slide-${number}-takeaway-text`, text, 150, 947, 1490, 38, {
    fontSize: 30,
    bold: true,
    color,
    align: "center",
    valign: "middle",
    wrap: "none",
  });
}

function addStage(slide, number, x, label, value, fill, stroke, valueColor = C.navy) {
  addBox(slide, `slide-${number}-${label.toLowerCase()}-stage`, x, 300, 500, 250, fill, stroke, { lineWidth: 2, radius: 22 });
  addText(slide, `slide-${number}-${label.toLowerCase()}-label`, label, x + 32, 330, 436, 38, {
    fontSize: 26,
    bold: true,
    color: stroke,
    align: "center",
    wrap: "none",
  });
  addText(slide, `slide-${number}-${label.toLowerCase()}-value`, value, x + 32, 394, 436, 90, {
    fontSize: 34,
    bold: true,
    color: valueColor,
    align: "center",
    valign: "middle",
    wrap: "square",
  });
}

function addStep(slide, number, x, step, heading, body, accent = C.blue) {
  addCircle(slide, `slide-${number}-step-${step}`, x + 28, 690, 56, accent);
  addText(slide, `slide-${number}-step-${step}-number`, String(step), x + 4, 666, 48, 48, {
    fontSize: 26,
    bold: true,
    color: C.white,
    align: "center",
    valign: "middle",
    autoFit: "none",
    wrap: "none",
  });
  addText(slide, `slide-${number}-step-${step}-heading`, heading, x + 68, 662, 270, 38, {
    fontSize: 24,
    bold: true,
    color: C.navy,
    wrap: "none",
  });
  addText(slide, `slide-${number}-step-${step}-body`, body, x + 68, 706, 270, 70, {
    fontSize: 22,
    color: C.charcoal,
    wrap: "square",
  });
}

function table(slide, number, x, y, width, headers, rows, colWidths, options = {}) {
  const headerH = options.headerH || 68;
  const rowH = options.rowH || 74;
  const totalH = headerH + rowH * rows.length;
  addBox(slide, `slide-${number}-table-bg`, x, y, width, totalH, C.white, options.line || C.lightRule, { lineWidth: 2, radius: 22 });
  let running = x;
  for (let c = 0; c < colWidths.length - 1; c += 1) {
    running += colWidths[c];
    addLine(slide, `slide-${number}-table-v-${c}`, running, y, running, y + totalH, C.lightRule, 1);
  }
  addLine(slide, `slide-${number}-table-header-rule`, x, y + headerH, x + width, y + headerH, C.lightRule, 2);
  for (let r = 1; r < rows.length; r += 1) {
    addLine(slide, `slide-${number}-table-h-${r}`, x, y + headerH + r * rowH, x + width, y + headerH + r * rowH, C.plotGrid, 1);
  }
  const rowValues = [headers, ...rows];
  for (let r = 0; r < rowValues.length; r += 1) {
    let cellX = x;
    for (let c = 0; c < colWidths.length; c += 1) {
      const cellW = colWidths[c];
      addText(slide, `slide-${number}-table-${r}-${c}`, String(rowValues[r][c]), cellX + 8, y + (r === 0 ? 14 : headerH + (r - 1) * rowH + 14), cellW - 16, r === 0 ? headerH - 20 : rowH - 20, {
        fontSize: r === 0 ? (options.headerFont || 22) : (options.bodyFont || 23),
        bold: r === 0 || Boolean(options.boldBody && r > 0),
        color: r === 0 ? C.navy : (options.bodyColor || C.charcoal),
        align: "center",
        valign: "middle",
        wrap: "square",
        autoFit: "shrinkText",
      });
      cellX += cellW;
    }
  }
  return { height: totalH };
}

function projectileArc(slide, number, x0, y0, x1, y1, peakY, color = C.blue) {
  const n = 12;
  let prev = { x: x0, y: y0 };
  for (let i = 1; i <= n; i += 1) {
    const t = i / n;
    const x = x0 + (x1 - x0) * t;
    const y = y0 + (peakY - y0) * 4 * t * (1 - t) + (y1 - y0) * t;
    addLine(slide, `slide-${number}-arc-${i}`, prev.x, prev.y, x, y, color, 5);
    prev = { x, y };
  }
}

function residualCurve(slide, number, x0, zeroY, width, height, color = C.blue) {
  // Low-angle projectile residual: it rises through zero as theta increases.
  // The zero crossing is placed near the locked Newton next estimate.
  const values = [-0.85, -0.72, -0.60, -0.48, -0.36, -0.20, -0.05, 0.10, 0.22, 0.34, 0.46, 0.58];
  let prev;
  for (let i = 0; i < values.length; i += 1) {
    const x = x0 + width * i / (values.length - 1);
    const y = zeroY - height * values[i];
    if (prev) addLine(slide, `slide-${number}-curve-${i}`, prev.x, prev.y, x, y, color, 5);
    prev = { x, y };
  }
}

function addNotes(slide, number, extraSource = "") {
  const notes = [
    "Open by asking students to name the physical quantity that is unknown before they name a numerical method.",
    "Emphasise that the residual is not a new physical law. It is the model prediction compared with the target, expressed in metres.",
    "Use the sign as a directional cue on the low-angle branch: a negative residual is too short and a positive residual is too long.",
    "Read the graph quantitatively. The low-angle bracket is the chosen Core route; the higher crossing is not developed here.",
    "Pause after the midpoint. Students should explain why the midpoint value alone is not enough; the endpoint sign change is the invariant.",
    "Trace the four rows aloud. The important habit is to recompute the midpoint, evaluate it, and update exactly one endpoint.",
    "Point to each line in the scaffold and ask which physical decision it represents. The code is short because the algorithm is explicit.",
    "The stopping rule is one residual test. Then substitute the angle back into the original model so the result has physical meaning.",
    "Introduce Newton as a tangent prediction. Keep the degree-to-radian factor visible; the slope is measured in metres per degree.",
    "Trace the table row by row. At the fourth evaluation the residual is already well below the one-millimetre tolerance.",
    "This is Working exposure. Fewer evaluations do not make Newton automatically more correct; both methods still need residual validation.",
    "Show the failure state with [30,40]. Both endpoint residuals are positive, so the bracket has lost the sign change and must be repaired.",
    "Make the transfer explicit: change the physical model, keep the residual habit. Students should be able to identify the unknown and target.",
    "Use the four prompts as retrieval. Do not provide the answer key; ask students to explain the chain in their own words before practical work.",
  ][number - 1];
  const sourceLines = [
    "[Sources]",
    "- PHY4605 Week 05 course materials: Week05/README.md and Week05/.agent/manifests/Week05_Content_Manifest.md",
    "- Demonstration source: Week05/Week05_Lecture_Demonstration_Root_Finding_for_Projectile_Range.m",
  ];
  if (extraSource) sourceLines.push(`- Visual/equation asset: ${extraSource}`);
  slide.speakerNotes.textFrame.setText(`${notes}\n\n${sourceLines.join("\n")}`);
  slide.speakerNotes.setVisible(true);
}

function clearSlide(slide) {
  for (const shape of [...slide.shapes.items]) shape.delete();
  for (const image of [...slide.images.items]) image.delete();
  slide.background.fill = C.white;
}

async function build() {
  const presentation = await PresentationFile.importPptx(await FileBlob.load(STARTER));
  const slides = presentation.slides.items;
  if (slides.length !== 14) throw new Error(`Expected 14 starter slides, found ${slides.length}`);
  for (const slide of slides) clearSlide(slide);

  // Slide 1 — opening
  {
    const slide = slides[0];
    addText(slide, "slide-1-course-tag", "PHY4605 Computational Methods in Physics", 115, 126, 900, 38, { fontSize: 26, bold: true, color: C.charcoal, wrap: "none", autoFit: "none" });
    addText(slide, "slide-1-opening-title", "From a Physical Target\nto a Checkable Root", 115, 245, 1080, 210, { fontSize: 74, bold: true, color: C.navy, wrap: "square", autoFit: "none", lineSpacing: 0.92 });
    addText(slide, "slide-1-opening-subtitle", "Week 5 | Root finding", 115, 475, 1180, 80, { fontSize: 34, color: C.charcoal, wrap: "none", autoFit: "none", valign: "middle" });
    addText(slide, "slide-1-question", "Which launch angle makes the range equal to 35 m?", 115, 650, 1030, 54, { fontSize: 32, bold: true, color: C.gold, wrap: "none", autoFit: "none" });
    addText(slide, "slide-1-given", "v0 = 20 m/s", 115, 720, 300, 40, { fontSize: 28, color: C.blue, bold: true, wrap: "none", autoFit: "none" });
    addText(slide, "slide-1-target", "target range = 35 m", 425, 720, 400, 40, { fontSize: 28, color: C.green, bold: true, wrap: "none", autoFit: "none" });
    addLine(slide, "slide-1-ground", 1270, 735, 1735, 735, C.charcoal, 4);
    projectileArc(slide, 1, 1290, 735, 1690, 735, 405, C.blue);
    addCircle(slide, "slide-1-launch-ball", 1290, 735, 28, C.blue);
    addCircle(slide, "slide-1-target-ring", 1690, 735, 42, C.white, C.gold, 5);
    addLine(slide, "slide-1-target-stem", 1690, 735, 1690, 620, C.gold, 3, "dashed");
    addText(slide, "slide-1-target-label", "35 m target", 1570, 575, 240, 38, { fontSize: 26, bold: true, color: C.gold, align: "center", wrap: "none", autoFit: "none" });
    addLine(slide, "slide-1-launch-arrow", 1285, 720, 1345, 650, C.navy, 3);
    addText(slide, "slide-1-speed-label", "v0 = 20 m/s", 1240, 770, 240, 36, { fontSize: 24, bold: true, color: C.blue, align: "center", wrap: "none", autoFit: "none" });
    addText(slide, "slide-1-angle-label", "theta", 1298, 690, 90, 32, { fontSize: 24, bold: true, color: C.gold, wrap: "none", autoFit: "none" });
    addLine(slide, "slide-1-angle-marker", 1300, 735, 1330, 705, C.gold, 3);
    addText(slide, "slide-1-chain", "physical target  →  residual  →  root", 115, 860, 880, 48, { fontSize: 30, bold: true, color: C.navy, wrap: "none", autoFit: "none" });
    addNotes(slide, 1);
  }

  // Slide 2 — model to residual
  {
    const slide = slides[1];
    titleBand(slide, 2, "A target becomes a residual", "Model range minus target range becomes a quantity a solver can drive to zero");
    addStage(slide, 2, 115, "PHYSICAL MODEL", "R(theta)\nfrom the projectile", C.bluePale, C.blue, C.navy);
    addStage(slide, 2, 710, "TARGET CONDITION", "R(theta) = 35 m", C.goldPale, C.gold, C.navy);
    addStage(slide, 2, 1305, "RESIDUAL ZERO", "f(theta) = 0", C.tealPale, C.green, C.green);
    addArrow(slide, "slide-2-arrow-1", 635, 395, 54, 30, C.lightRule);
    addArrow(slide, "slide-2-arrow-2", 1230, 395, 54, 30, C.lightRule);
    await addImage(slide, "slide-2-equation-model-residual", `${ASSET}/equations/model_residual.png`, 350, 585, 1220, 205, "Projectile range model, target condition, and residual definition", "contain");
    addBox(slide, "slide-2-units-strip", 340, 825, 1240, 72, C.navyPale, C.lightRule, { lineWidth: 2, radius: 22 });
    addText(slide, "slide-2-units", "root variable: theta (degree)    |    residual: metres", 380, 844, 1160, 32, { fontSize: 26, bold: true, color: C.navy, align: "center", wrap: "none", autoFit: "none" });
    addNotes(slide, 2, "Week05/.agent/lecture-slides/codex-ppt/assets/strict/equations/model_residual.png");
  }

  // Slide 3 — sign meaning
  {
    const slide = slides[2];
    titleBand(slide, 3, "The residual sign tells you which way to move", "The sign is a physical error: below target or above target", "T2");
    addBox(slide, "slide-3-sign-map", 115, 270, 760, 570, C.navyPale, C.blue, { lineWidth: 2, radius: 22 });
    addText(slide, "slide-3-sign-heading", "Read the sign as a range error", 155, 305, 680, 44, { fontSize: 32, bold: true, color: C.navy, wrap: "none", autoFit: "none" });
    addLine(slide, "slide-3-sign-line", 210, 530, 790, 530, C.navy, 5);
    addLine(slide, "slide-3-negative-half", 210, 530, 470, 530, C.blue, 7);
    addLine(slide, "slide-3-positive-half", 550, 530, 790, 530, C.gold, 7);
    addCircle(slide, "slide-3-zero-marker", 510, 530, 32, C.white, C.navy, 4);
    addText(slide, "slide-3-negative-sign", "f(theta) < 0", 225, 455, 220, 42, { fontSize: 28, bold: true, color: C.blue, align: "center", wrap: "none", autoFit: "none" });
    addText(slide, "slide-3-negative-body", "range below\ntarget", 225, 575, 220, 70, { fontSize: 25, color: C.charcoal, align: "center" });
    addText(slide, "slide-3-zero-sign", "f(theta) = 0", 430, 455, 160, 42, { fontSize: 28, bold: true, color: C.green, align: "center", wrap: "none", autoFit: "none" });
    addText(slide, "slide-3-zero-body", "exact target", 430, 575, 160, 40, { fontSize: 25, color: C.green, align: "center", wrap: "none", autoFit: "none" });
    addText(slide, "slide-3-positive-sign", "f(theta) > 0", 580, 455, 210, 42, { fontSize: 28, bold: true, color: C.gold, align: "center", wrap: "none", autoFit: "none" });
    addText(slide, "slide-3-positive-body", "range above\ntarget", 580, 575, 210, 70, { fontSize: 25, color: C.charcoal, align: "center" });
    addText(slide, "slide-3-branch-note", "On the low-angle branch", 170, 705, 650, 36, { fontSize: 24, bold: true, color: C.navy, align: "center", wrap: "none", autoFit: "none" });
    addBox(slide, "slide-3-move-panel", 955, 270, 850, 570, C.white, C.lightRule, { lineWidth: 2, radius: 22 });
    addText(slide, "slide-3-move-heading", "Turn sign into a direction", 995, 305, 770, 44, { fontSize: 32, bold: true, color: C.navy, wrap: "none", autoFit: "none" });
    addCircle(slide, "slide-3-move-blue", 1040, 430, 42, C.blue);
    addText(slide, "slide-3-move-blue-text", "negative residual", 1090, 405, 610, 34, { fontSize: 28, bold: true, color: C.blue, wrap: "none", autoFit: "none" });
    addText(slide, "slide-3-move-blue-body", "the model falls short of 35 m", 1090, 445, 610, 34, { fontSize: 25, color: C.charcoal, wrap: "none", autoFit: "none" });
    addArrow(slide, "slide-3-move-arrow-up", 1030, 520, 70, 32, C.blue);
    addText(slide, "slide-3-move-up-text", "move to a larger angle on this branch", 1120, 512, 620, 42, { fontSize: 26, bold: true, color: C.navy, wrap: "none", autoFit: "none" });
    addCircle(slide, "slide-3-move-gold", 1040, 630, 42, C.gold);
    addText(slide, "slide-3-move-gold-text", "positive residual", 1090, 605, 610, 34, { fontSize: 28, bold: true, color: C.gold, wrap: "none", autoFit: "none" });
    addText(slide, "slide-3-move-gold-body", "the model overshoots 35 m", 1090, 645, 610, 34, { fontSize: 25, color: C.charcoal, wrap: "none", autoFit: "none" });
    addArrow(slide, "slide-3-move-arrow-down", 1030, 720, 70, 32, C.gold);
    addText(slide, "slide-3-move-down-text", "move to a smaller angle on this branch", 1120, 712, 620, 42, { fontSize: 26, bold: true, color: C.navy, wrap: "none", autoFit: "none" });
    addNotes(slide, 3, "Week05/.agent/lecture-slides/codex-ppt/assets/strict/equations/signs.png");
  }

  // Slide 4 — graph and bracket
  {
    const slide = slides[3];
    titleBand(slide, 4, "The graph gives us a bracket", "A sign change marks the low-angle interval we will keep");
    addBox(slide, "slide-4-bracket-panel", 115, 265, 425, 610, C.bluePale, C.blue, { lineWidth: 2, radius: 22 });
    addText(slide, "slide-4-panel-heading", "Scan before solving", 150, 305, 355, 42, { fontSize: 32, bold: true, color: C.navy, wrap: "none", autoFit: "none" });
    addText(slide, "slide-4-scan", "theta = 10:1:70 degree", 150, 375, 355, 36, { fontSize: 25, typeface: F.mono, color: C.navy, wrap: "none", autoFit: "none" });
    addLine(slide, "slide-4-panel-rule", 150, 438, 505, 438, C.lightRule, 2);
    addText(slide, "slide-4-left-endpoint", "f(20 degree) = -8.7905 m", 150, 485, 355, 68, { fontSize: 27, bold: true, color: C.blue, wrap: "square" });
    addText(slide, "slide-4-right-endpoint", "f(40 degree) = +5.1553 m", 150, 585, 355, 68, { fontSize: 27, bold: true, color: C.gold, wrap: "square" });
    addText(slide, "slide-4-opposite", "opposite signs", 150, 690, 355, 36, { fontSize: 26, bold: true, color: C.green, wrap: "none", autoFit: "none" });
    addText(slide, "slide-4-bracket", "bracket = [20, 40] degree", 150, 735, 355, 46, { fontSize: 28, bold: true, color: C.navy, wrap: "none", autoFit: "none" });
    addText(slide, "slide-4-prompt", "Where does f(theta) cross zero?", 150, 815, 355, 34, { fontSize: 22, italic: true, color: C.charcoal, wrap: "none", autoFit: "none" });
    await addImage(slide, "slide-4-residual-plot", `${ASSET}/week05_projectile_residual.png`, 585, 250, 1195, 660, "MATLAB-generated projectile-range residual plot with low-angle bracket evidence", "contain");
    addNotes(slide, 4, "Week05/.agent/lecture-slides/codex-ppt/assets/strict/week05_projectile_residual.png");
  }

  // Slide 5 — bisection intuition
  {
    const slide = slides[4];
    titleBand(slide, 5, "Bisection keeps a sign change alive", "Bracket first, test the midpoint, keep the half that still straddles zero", "T2");
    addText(slide, "slide-5-top-label", "start with [20, 40] degree", 150, 280, 410, 38, { fontSize: 28, bold: true, color: C.navy, align: "center", wrap: "none", autoFit: "none" });
    addLine(slide, "slide-5-top-line", 185, 385, 565, 385, C.navy, 5);
    addCircle(slide, "slide-5-top-left", 185, 385, 34, C.blue);
    addCircle(slide, "slide-5-top-zero", 375, 385, 30, C.white, C.navy, 4);
    addCircle(slide, "slide-5-top-right", 565, 385, 34, C.gold);
    addText(slide, "slide-5-top-left-label", "f(20) < 0", 135, 435, 100, 30, { fontSize: 23, color: C.blue, bold: true, align: "center", wrap: "none", autoFit: "none" });
    addText(slide, "slide-5-top-right-label", "f(40) > 0", 515, 435, 100, 30, { fontSize: 23, color: C.gold, bold: true, align: "center", wrap: "none", autoFit: "none" });
    addArrow(slide, "slide-5-arrow-1", 615, 370, 70, 30, C.lightRule);
    addText(slide, "slide-5-mid-label", "test midpoint 30 degree", 735, 280, 410, 38, { fontSize: 28, bold: true, color: C.gold, align: "center", wrap: "none", autoFit: "none" });
    addLine(slide, "slide-5-mid-line", 770, 385, 1110, 385, C.navy, 5);
    addCircle(slide, "slide-5-mid-left", 770, 385, 34, C.blue);
    addCircle(slide, "slide-5-mid-point", 940, 385, 38, C.gold);
    addCircle(slide, "slide-5-mid-right", 1110, 385, 34, C.gold);
    addText(slide, "slide-5-mid-value", "f(30) = +0.31194 m", 790, 435, 300, 32, { fontSize: 24, color: C.gold, bold: true, align: "center", wrap: "none", autoFit: "none" });
    addArrow(slide, "slide-5-arrow-2", 1165, 370, 70, 30, C.lightRule);
    addText(slide, "slide-5-keep-label", "keep the sign-changing half", 1290, 280, 420, 38, { fontSize: 28, bold: true, color: C.green, align: "center", wrap: "none", autoFit: "none" });
    addLine(slide, "slide-5-keep-line", 1320, 385, 1650, 385, C.green, 6);
    addCircle(slide, "slide-5-keep-left", 1320, 385, 34, C.green);
    addCircle(slide, "slide-5-keep-right", 1650, 385, 34, C.green);
    addText(slide, "slide-5-keep-value", "new bracket [20, 30] degree", 1320, 435, 330, 32, { fontSize: 24, color: C.green, bold: true, align: "center", wrap: "none", autoFit: "none" });
    addStep(slide, 5, 125, 1, "choose endpoints", "opposite signs", C.blue);
    addStep(slide, 5, 505, 2, "compute midpoint", "m = (a + b)/2", C.gold);
    addStep(slide, 5, 885, 3, "evaluate residual", "read f(m)", C.gold);
    addStep(slide, 5, 1265, 4, "keep the sign change", "replace one endpoint", C.green);
    addBox(slide, "slide-5-question-box", 115, 835, 1560, 72, C.goldPale, C.gold, { lineWidth: 2, radius: 22 });
    addText(slide, "slide-5-question", "Why is the midpoint not enough?", 155, 851, 520, 36, { fontSize: 28, bold: true, color: C.gold, wrap: "none", autoFit: "none" });
    addText(slide, "slide-5-answer", "Because bisection needs a bracket whose endpoint residuals have opposite signs.", 690, 851, 930, 36, { fontSize: 23, color: C.charcoal, wrap: "none", autoFit: "none" });
    addNotes(slide, 5);
  }

  // Slide 6 — first four bisection updates
  {
    const slide = slides[5];
    titleBand(slide, 6, "Bisection shrinks the bracket", "Every row repeats the same four decisions");
    addBox(slide, "slide-6-algorithm", 115, 265, 470, 585, C.navyPale, C.blue, { lineWidth: 2, radius: 22 });
    addText(slide, "slide-6-algorithm-heading", "Plain-language algorithm", 150, 300, 400, 42, { fontSize: 30, bold: true, color: C.navy, wrap: "none", autoFit: "none" });
    const alg = ["Start with opposite endpoint signs", "Compute the midpoint", "Evaluate f(mid)", "Replace one endpoint", "Repeat with the smaller bracket"];
    for (let i = 0; i < alg.length; i += 1) {
      const yy = 380 + i * 82;
      addCircle(slide, `slide-6-alg-${i + 1}`, 175, yy, 48, i === 4 ? C.green : C.blue);
      addText(slide, `slide-6-alg-num-${i + 1}`, String(i + 1), 151, yy - 24, 48, 48, { fontSize: 22, bold: true, color: C.white, align: "center", valign: "middle", wrap: "none", autoFit: "none" });
      addText(slide, `slide-6-alg-text-${i + 1}`, alg[i], 215, yy - 23, 330, 52, { fontSize: 23, color: C.charcoal, valign: "middle", wrap: "square" });
      if (i < alg.length - 1) addLine(slide, `slide-6-alg-line-${i + 1}`, 175, yy + 25, 175, yy + 56, C.lightRule, 2, "dashed");
    }
    addText(slide, "slide-6-invariant", "invariant: f(a) and f(b) keep opposite signs", 150, 790, 400, 54, { fontSize: 23, bold: true, color: C.green, wrap: "square" });
    table(slide, 6, 650, 265, 1155, ["iteration", "current bracket (degree)", "midpoint (degree)", "f(mid) (m)", "keep"], [["1", "[20, 40]", "30", "+0.31194", "[20, 30]"], ["2", "[20, 30]", "25", "-3.7648", "[25, 30]"], ["3", "[25, 30]", "27.5", "-1.5993", "[27.5, 30]"], ["4", "[27.5, 30]", "28.75", "-0.61095", "[28.75, 30]"]], [105, 250, 220, 240, 340], { headerH: 72, rowH: 86, headerFont: 22, bodyFont: 24, bodyColor: C.charcoal });
    addBottomStrip(slide, 6, "The bracket width halves; the sign change is the invariant", C.tealPale, C.teal, C.green);
    addNotes(slide, 6, "Week05/.agent/lecture-slides/codex-ppt/assets/strict/tables/bisection_first_four.png");
  }

  // Slide 7 — bisection scaffold
  {
    const slide = slides[6];
    titleBand(slide, 7, "The scaffold makes each decision visible", "The loop is short because the physical decision is explicit");
    addBox(slide, "slide-7-pseudocode", 115, 270, 525, 585, C.navyPale, C.blue, { lineWidth: 2, radius: 22 });
    addText(slide, "slide-7-pseudo-heading", "Read the loop in plain language", 150, 305, 455, 44, { fontSize: 30, bold: true, color: C.navy, wrap: "none", autoFit: "none" });
    const pseudo = ["choose left and right", "compute midpoint", "evaluate residual", "if small, stop", "otherwise keep the sign change"];
    for (let i = 0; i < pseudo.length; i += 1) {
      const yy = 390 + i * 78;
      addCircle(slide, `slide-7-pseudo-${i + 1}`, 178, yy, 44, i === 3 ? C.green : C.blue);
      addText(slide, `slide-7-pseudo-num-${i + 1}`, String(i + 1), 156, yy - 22, 44, 44, { fontSize: 20, bold: true, color: C.white, align: "center", valign: "middle", wrap: "none", autoFit: "none" });
      addText(slide, `slide-7-pseudo-text-${i + 1}`, pseudo[i], 220, yy - 21, 370, 42, { fontSize: 24, color: C.charcoal, valign: "middle", wrap: "none", autoFit: "none" });
      if (i < pseudo.length - 1) addLine(slide, `slide-7-pseudo-line-${i + 1}`, 178, yy + 24, 178, yy + 54, C.lightRule, 2, "dashed");
    }
    addText(slide, "slide-7-tolerance", "tolerance_m = 1e-3 m", 150, 790, 430, 36, { fontSize: 24, typeface: F.mono, bold: true, color: C.green, wrap: "none", autoFit: "none" });
    addBox(slide, "slide-7-code-box", 700, 270, 1105, 585, C.navyPale, C.blue, { lineWidth: 2, radius: 22 });
    addText(slide, "slide-7-code-label", "MATLAB", 740, 305, 240, 38, { fontSize: 28, bold: true, color: C.blue, wrap: "none", autoFit: "none" });
    const code = [
      "mid_deg = (left_deg + right_deg)/2;",
      "f_mid_m = (v0_mps^2/g_mps2)*sind(2*mid_deg) - target_m;",
      "if abs(f_mid_m) < tolerance_m",
      "    break",
      "end",
      "f_left_m = (v0_mps^2/g_mps2)*sind(2*left_deg) - target_m;",
      "if f_left_m*f_mid_m < 0",
      "    right_deg = mid_deg;",
      "else",
      "    left_deg = mid_deg;",
      "end",
    ].join("\n");
    addText(slide, "slide-7-code", code, 740, 365, 1030, 390, { fontSize: 22, typeface: F.mono, color: C.navy, wrap: "none", autoFit: "shrinkText", lineSpacing: 1.1 });
    addText(slide, "slide-7-code-prompt", "Which line protects the bracket?", 740, 790, 720, 34, { fontSize: 24, italic: true, color: C.gold, wrap: "none", autoFit: "none" });
    addNotes(slide, 7, "Week05/.agent/lecture-slides/codex-ppt/assets/strict/code/bisection_scaffold.png");
  }

  // Slide 8 — stop and validate
  {
    const slide = slides[7];
    titleBand(slide, 8, "Stop once, then substitute back", "A numerical angle matters only if it satisfies the original condition");
    addBox(slide, "slide-8-stop", 115, 275, 520, 555, C.goldPale, C.gold, { lineWidth: 2, radius: 22 });
    addText(slide, "slide-8-stop-heading", "One Core stopping rule", 155, 315, 440, 42, { fontSize: 30, bold: true, color: C.navy, wrap: "none", autoFit: "none" });
    addText(slide, "slide-8-stop-rule", "abs(f_mid_m) < 1e-3 m", 155, 410, 440, 62, { fontSize: 30, typeface: F.mono, bold: true, color: C.gold, wrap: "none", autoFit: "none" });
    addText(slide, "slide-8-stop-explain", "The residual is an error in range, so the tolerance is measured in metres.", 155, 510, 430, 110, { fontSize: 26, color: C.charcoal, wrap: "square" });
    addLine(slide, "slide-8-stop-arrow", 380, 670, 380, 750, C.gold, 4);
    addText(slide, "slide-8-stop-pass", "then validate the root", 180, 765, 400, 36, { fontSize: 26, bold: true, color: C.green, align: "center", wrap: "none", autoFit: "none" });
    await addImage(slide, "slide-8-validation-equation", `${ASSET}/equations/validation.png`, 745, 330, 870, 275, "Validated bisection root, direct range, and residual", "contain");
    addBox(slide, "slide-8-validation-box", 705, 650, 1060, 180, C.tealPale, C.green, { lineWidth: 2, radius: 22 });
    addText(slide, "slide-8-validation-title", "VALIDATION", 745, 680, 240, 34, { fontSize: 26, bold: true, color: C.green, wrap: "none", autoFit: "none" });
    addText(slide, "slide-8-validation-values", "theta* = 29.5679 degree    |    R(theta*) = 35.0004 m    |    f(theta*) = +4.1164e-4 m", 745, 735, 980, 50, { fontSize: 24, typeface: F.mono, bold: true, color: C.navy, wrap: "none", autoFit: "shrinkText" });
    addBottomStrip(slide, 8, "The root is useful because substitution returns the target range", C.tealPale, C.teal, C.green);
    addNotes(slide, 8, "Week05/.agent/lecture-slides/codex-ppt/assets/strict/equations/validation.png; Week05/.agent/lecture-slides/codex-ppt/assets/strict/tables/bisection_validation.png");
  }

  // Slide 9 — Newton concept
  {
    const slide = slides[8];
    titleBand(slide, 9, "Newton follows the local tangent", "One estimate plus a local slope gives the next angle");
    addBox(slide, "slide-9-curve-area", 115, 270, 875, 595, C.white, C.lightRule, { lineWidth: 2, radius: 22 });
    addText(slide, "slide-9-curve-heading", "A tangent predicts the next angle", 155, 305, 790, 42, { fontSize: 30, bold: true, color: C.navy, wrap: "none", autoFit: "none" });
    const gx = 230; const gy = 600; const gw = 660; const gh = 180;
    addLine(slide, "slide-9-axis-x", gx, gy, gx + gw, gy, C.charcoal, 3);
    addLine(slide, "slide-9-axis-y", gx, gy - gh, gx, gy + 110, C.charcoal, 3);
    addText(slide, "slide-9-axis-x-label", "theta (degree)", gx + 230, gy + 88, 250, 30, { fontSize: 22, color: C.charcoal, align: "center", wrap: "none", autoFit: "none" });
    addText(slide, "slide-9-axis-y-label", "f(theta) (m)", gx - 75, gy - 125, 110, 90, { fontSize: 22, color: C.charcoal, align: "center", wrap: "square" });
    addLine(slide, "slide-9-zero-line", gx, gy, gx + gw, gy, C.green, 5, "dashed");
    addText(slide, "slide-9-zero-label", "f(theta) = 0", gx + 535, gy - 28, 150, 30, { fontSize: 22, bold: true, color: C.green, wrap: "none", autoFit: "none" });
    residualCurve(slide, 9, gx + 40, gy, 590, 120, C.blue);
    const currentX = gx + 40 + 590 * 0.46; const currentY = gy + 24;
    const nextX = gx + 40 + 590 * 0.59;
    const tangentSlope = (gy - currentY) / (nextX - currentX);
    addLine(slide, "slide-9-tangent", currentX - 120, currentY + tangentSlope * (-120), nextX + 160, gy + tangentSlope * 160, C.gold, 4, "dashed");
    addCircle(slide, "slide-9-current-point", currentX, currentY, 26, C.blue);
    addCircle(slide, "slide-9-next-point", nextX, gy, 28, C.gold);
    addLine(slide, "slide-9-current-guide", currentX, currentY, currentX, gy, C.blue, 2, "dashed");
    addLine(slide, "slide-9-next-guide", nextX, gy, nextX, gy + 24, C.gold, 2);
    addText(slide, "slide-9-current-label", "current angle\n25 degree", currentX - 90, currentY - 85, 180, 60, { fontSize: 22, bold: true, color: C.blue, align: "center" });
    addText(slide, "slide-9-next-label", "next estimate\n29.115 degree", nextX - 100, gy + 35, 200, 60, { fontSize: 22, bold: true, color: C.gold, align: "center" });
    addText(slide, "slide-9-slope-label", "local slope", currentX + 90, currentY - 12, 150, 32, { fontSize: 22, bold: true, color: C.gold, wrap: "none", autoFit: "none" });
    addBox(slide, "slide-9-equation-box", 1060, 285, 745, 425, C.navyPale, C.lightRule, { lineWidth: 2, radius: 22 });
    await addImage(slide, "slide-9-newton-equation", `${ASSET}/equations/newton_update_slope.png`, 1100, 350, 665, 245, "Newton update and degree-based residual slope", "contain");
    addText(slide, "slide-9-unit-callout", "slope unit = metres per degree", 1110, 630, 650, 36, { fontSize: 26, bold: true, color: C.green, align: "center", wrap: "none", autoFit: "none" });
    addBox(slide, "slide-9-prompt-box", 1060, 750, 745, 115, C.goldPale, C.gold, { lineWidth: 2, radius: 22 });
    addText(slide, "slide-9-prompt", "What does the slope measure?", 1100, 785, 665, 42, { fontSize: 28, bold: true, color: C.gold, align: "center", wrap: "none", autoFit: "none" });
    addNotes(slide, 9, "Week05/.agent/lecture-slides/codex-ppt/assets/strict/equations/newton_update_slope.png");
  }

  // Slide 10 — Newton trace
  {
    const slide = slides[9];
    titleBand(slide, 10, "Newton can jump close to the root", "Four evaluations move from 25 degree to a validated root", "T2");
    addText(slide, "slide-10-table-heading", "Trace the current estimate, residual, slope, and next estimate", 115, 270, 1160, 42, { fontSize: 28, bold: true, color: C.navy, wrap: "none", autoFit: "none" });
    table(slide, 10, 115, 340, 1270, ["eval", "theta (degree)", "f(theta) (m)", "slope (m/degree)", "next theta (degree)"], [["1", "25.000", "-3.7648", "0.91488", "29.115"], ["2", "29.115", "-0.33461", "0.74939", "29.562"], ["3", "29.562", "-0.0042242", "0.73044", "29.567"], ["4", "29.567", "-7.1308e-7", "0.73019", "stop"]], [90, 240, 285, 295, 360], { headerH: 72, rowH: 86, headerFont: 22, bodyFont: 24 });
    addBox(slide, "slide-10-trace-note", 1420, 340, 385, 430, C.navyPale, C.blue, { lineWidth: 2, radius: 22 });
    addText(slide, "slide-10-note-heading", "Each row", 1460, 380, 305, 38, { fontSize: 30, bold: true, color: C.navy, align: "center", wrap: "none", autoFit: "none" });
    addText(slide, "slide-10-note-body", "evaluate\n↓\nslope\n↓\nupdate", 1460, 455, 305, 220, { fontSize: 30, bold: true, color: C.blue, align: "center", valign: "middle", wrap: "square" });
    addText(slide, "slide-10-note-prompt", "What changes between rows?", 1450, 700, 325, 42, { fontSize: 23, italic: true, color: C.gold, align: "center", wrap: "none", autoFit: "none" });
    addBottomStrip(slide, 10, "At eval 4, |f(theta)| = 7.1308e-7 m < 1e-3 m", C.tealPale, C.teal, C.green);
    addNotes(slide, 10, "Week05/.agent/lecture-slides/codex-ppt/assets/strict/tables/newton_trace.png");
  }

  // Slide 11 — working exposure comparison
  {
    const slide = slides[10];
    titleBand(slide, 11, "Working exposure: same root, different route", "Bisection is guarded; Newton is locally fast", "T2");
    addBox(slide, "slide-11-bisection", 115, 290, 770, 500, C.bluePale, C.blue, { lineWidth: 2, radius: 22 });
    addText(slide, "slide-11-bisection-heading", "BISECTION", 160, 335, 680, 44, { fontSize: 32, bold: true, color: C.blue, align: "center", wrap: "none", autoFit: "none" });
    addCircle(slide, "slide-11-bisection-count", 290, 490, 126, C.blue);
    addText(slide, "slide-11-bisection-count-number", "13", 230, 453, 120, 70, { fontSize: 52, bold: true, color: C.white, align: "center", valign: "middle", wrap: "none", autoFit: "none" });
    addText(slide, "slide-11-bisection-count-label", "recorded\niterations", 370, 458, 210, 70, { fontSize: 26, bold: true, color: C.navy, valign: "middle", wrap: "square" });
    addText(slide, "slide-11-bisection-body", "preserves a sign-changing bracket\n\nneeds a valid endpoint pair", 160, 615, 680, 100, { fontSize: 27, color: C.charcoal, align: "center", wrap: "square" });
    addBox(slide, "slide-11-newton", 1020, 290, 770, 500, C.goldPale, C.gold, { lineWidth: 2, radius: 22 });
    addText(slide, "slide-11-newton-heading", "NEWTON", 1065, 335, 680, 44, { fontSize: 32, bold: true, color: C.gold, align: "center", wrap: "none", autoFit: "none" });
    addCircle(slide, "slide-11-newton-count", 1195, 490, 126, C.gold);
    addText(slide, "slide-11-newton-count-number", "4", 1135, 453, 120, 70, { fontSize: 52, bold: true, color: C.white, align: "center", valign: "middle", wrap: "none", autoFit: "none" });
    addText(slide, "slide-11-newton-count-label", "recorded\nevaluations", 1275, 458, 210, 70, { fontSize: 26, bold: true, color: C.navy, valign: "middle", wrap: "square" });
    addText(slide, "slide-11-newton-body", "same low-angle root from 25 degree\n\nneeds a useful slope and start", 1065, 615, 680, 100, { fontSize: 27, color: C.charcoal, align: "center", wrap: "square" });
    addBox(slide, "slide-11-shared-validation", 250, 835, 1420, 72, C.tealPale, C.green, { lineWidth: 2, radius: 22 });
    addText(slide, "slide-11-shared-validation-text", "Both still require residual validation", 300, 853, 1320, 36, { fontSize: 30, bold: true, color: C.green, align: "center", wrap: "none", autoFit: "none" });
    addNotes(slide, 11, "Week05/.agent/lecture-slides/codex-ppt/assets/strict/tables/method_comparison.png");
  }

  // Slide 12 — bad bracket diagnosis
  {
    const slide = slides[11];
    titleBand(slide, 12, "A midpoint is not enough: the bracket must change sign", "The method only works when the endpoints still have opposite signs", "T2");
    addText(slide, "slide-12-current-heading", "Current bracket", 115, 270, 500, 40, { fontSize: 30, bold: true, color: C.navy, align: "center", wrap: "none", autoFit: "none" });
    addLine(slide, "slide-12-current-line", 180, 370, 535, 370, C.navy, 5);
    addCircle(slide, "slide-12-current-left", 180, 370, 34, C.blue);
    addCircle(slide, "slide-12-current-mid", 360, 370, 34, C.gold);
    addCircle(slide, "slide-12-current-right", 535, 370, 34, C.gold);
    addText(slide, "slide-12-current-label", "[20, 40] degree", 180, 425, 355, 36, { fontSize: 27, bold: true, color: C.navy, align: "center", wrap: "none", autoFit: "none" });
    addText(slide, "slide-12-current-values", "f(20) < 0       f(30) > 0       f(40) > 0", 135, 485, 445, 36, { fontSize: 22, typeface: F.mono, color: C.charcoal, align: "center", wrap: "none", autoFit: "shrinkText" });
    addArrow(slide, "slide-12-arrow", 640, 350, 72, 34, C.lightRule);
    addBox(slide, "slide-12-bad-box", 760, 265, 505, 340, C.redPale, C.red, { lineWidth: 2, radius: 22 });
    addText(slide, "slide-12-bad-heading", "BAD UPDATE", 805, 310, 415, 42, { fontSize: 30, bold: true, color: C.red, align: "center", wrap: "none", autoFit: "none" });
    addText(slide, "slide-12-bad-bracket", "[30, 40] degree", 805, 390, 415, 48, { fontSize: 32, typeface: F.mono, bold: true, color: C.red, align: "center", wrap: "none", autoFit: "none" });
    addText(slide, "slide-12-bad-reason", "both endpoint residuals are positive\n\nno sign change remains", 805, 475, 415, 100, { fontSize: 25, color: C.charcoal, align: "center", wrap: "square" });
    addArrow(slide, "slide-12-arrow-repair", 1330, 350, 72, 34, C.lightRule);
    addBox(slide, "slide-12-good-box", 1450, 265, 355, 340, C.tealPale, C.green, { lineWidth: 2, radius: 22 });
    addText(slide, "slide-12-good-heading", "REPAIR", 1490, 310, 275, 42, { fontSize: 30, bold: true, color: C.green, align: "center", wrap: "none", autoFit: "none" });
    addText(slide, "slide-12-good-bracket", "[20, 30] degree", 1490, 400, 275, 48, { fontSize: 28, typeface: F.mono, bold: true, color: C.green, align: "center", wrap: "none", autoFit: "none" });
    addText(slide, "slide-12-good-reason", "f(20) < 0\nf(30) > 0", 1490, 485, 275, 70, { fontSize: 25, typeface: F.mono, color: C.navy, align: "center", wrap: "square" });
    addBox(slide, "slide-12-check-box", 230, 700, 1450, 145, C.goldPale, C.gold, { lineWidth: 2, radius: 22 });
    addText(slide, "slide-12-check-heading", "CHECK AFTER EVERY UPDATE", 275, 735, 510, 34, { fontSize: 26, bold: true, color: C.gold, wrap: "none", autoFit: "none" });
    addText(slide, "slide-12-check-rule", "f(a) * f(b) < 0", 880, 727, 370, 48, { fontSize: 32, typeface: F.mono, bold: true, color: C.navy, align: "center", wrap: "none", autoFit: "none" });
    addText(slide, "slide-12-check-body", "If the signs agree, the bracket is not safe", 1280, 735, 345, 34, { fontSize: 23, color: C.charcoal, align: "center", wrap: "none", autoFit: "none" });
    addNotes(slide, 12);
  }

  // Slide 13 — transfer
  {
    const slide = slides[12];
    titleBand(slide, 13, "The residual pattern transfers to new physics", "Change the model; keep the reasoning chain");
    addText(slide, "slide-13-chain", "physical target  →  residual  →  root  →  validation", 115, 255, 1690, 42, { fontSize: 28, bold: true, color: C.navy, align: "center", wrap: "none", autoFit: "none" });
    addBox(slide, "slide-13-thin-lens", 115, 345, 810, 420, C.bluePale, C.blue, { lineWidth: 2, radius: 22 });
    addText(slide, "slide-13-thin-lens-heading", "THIN LENS", 160, 385, 720, 42, { fontSize: 32, bold: true, color: C.blue, align: "center", wrap: "none", autoFit: "none" });
    addText(slide, "slide-13-thin-lens-target", "target: image distance", 180, 470, 680, 36, { fontSize: 25, color: C.charcoal, align: "center", wrap: "none", autoFit: "none" });
    addText(slide, "slide-13-thin-lens-unknown", "unknown: d_i", 180, 525, 680, 36, { fontSize: 27, bold: true, color: C.navy, align: "center", wrap: "none", autoFit: "none" });
    addText(slide, "slide-13-thin-lens-check", "validate by substitution into the lens equation", 180, 640, 680, 70, { fontSize: 25, color: C.green, bold: true, align: "center", wrap: "square" });
    addBox(slide, "slide-13-rc", 995, 345, 810, 420, C.goldPale, C.gold, { lineWidth: 2, radius: 22 });
    addText(slide, "slide-13-rc-heading", "RC THRESHOLD", 1040, 385, 720, 42, { fontSize: 32, bold: true, color: C.gold, align: "center", wrap: "none", autoFit: "none" });
    addText(slide, "slide-13-rc-target", "target: threshold voltage", 1060, 470, 680, 36, { fontSize: 25, color: C.charcoal, align: "center", wrap: "none", autoFit: "none" });
    addText(slide, "slide-13-rc-unknown", "unknown: t", 1060, 525, 680, 36, { fontSize: 27, bold: true, color: C.navy, align: "center", wrap: "none", autoFit: "none" });
    addText(slide, "slide-13-rc-check", "validate by checking V(t) against the target", 1060, 640, 680, 70, { fontSize: 25, color: C.green, bold: true, align: "center", wrap: "square" });
    await addImage(slide, "slide-13-transfer-equations", `${ASSET}/equations/transfer_residuals.png`, 460, 785, 1000, 105, "Thin-lens and RC residual forms", "contain");
    addNotes(slide, 13, "Week05/.agent/lecture-slides/codex-ppt/assets/strict/equations/transfer_residuals.png");
  }

  // Slide 14 — exit ticket
  {
    const slide = slides[13];
    titleBand(slide, 14, "Exit ticket: explain a root to a future you", "Define it, bracket it, update it, check it", "T2");
    const cards = [
      { x: 115, label: "DEFINE", fill: C.bluePale, stroke: C.blue, icon: "=", prompt: "write the physical target\nand residual" },
      { x: 530, label: "BRACKET", fill: C.navyPale, stroke: C.navy, icon: "< >", prompt: "explain what opposite\nendpoint signs mean" },
      { x: 945, label: "UPDATE", fill: C.goldPale, stroke: C.gold, icon: "→", prompt: "describe one bisection midpoint\nor Newton tangent step" },
      { x: 1360, label: "CHECK", fill: C.tealPale, stroke: C.green, icon: "✓", prompt: "substitute the root into the residual\nand state its physical unit" },
    ];
    for (const card of cards) {
      addBox(slide, `slide-14-${card.label.toLowerCase()}-card`, card.x, 300, 360, 470, card.fill, card.stroke, { lineWidth: 2, radius: 22 });
      addCircle(slide, `slide-14-${card.label.toLowerCase()}-icon`, card.x + 180, 395, 84, C.white, card.stroke, 3);
      addText(slide, `slide-14-${card.label.toLowerCase()}-icon-text`, card.icon, card.x + 128, 365, 104, 60, { fontSize: 36, bold: true, color: card.stroke, align: "center", valign: "middle", wrap: "none", autoFit: "none" });
      addText(slide, `slide-14-${card.label.toLowerCase()}-label`, card.label, card.x + 30, 490, 300, 38, { fontSize: 28, bold: true, color: card.stroke, align: "center", wrap: "none", autoFit: "none" });
      addText(slide, `slide-14-${card.label.toLowerCase()}-prompt`, card.prompt, card.x + 32, 575, 296, 100, { fontSize: 24, color: C.charcoal, align: "center", valign: "middle", wrap: "square" });
    }
    addBox(slide, "slide-14-transfer-ribbon", 270, 825, 1380, 72, C.navyPale, C.lightRule, { lineWidth: 2, radius: 22 });
    addText(slide, "slide-14-transfer-text", "practical transfer: projectile range  •  thin lens  •  RC threshold", 310, 844, 1300, 36, { fontSize: 25, bold: true, color: C.navy, align: "center", wrap: "none", autoFit: "shrinkText" });
    addNotes(slide, 14);
  }

  await fs.mkdir(`${BUILD}/artifact-renders`, { recursive: true });
  for (let i = 0; i < slides.length; i += 1) {
    const png = await presentation.export({ slide: slides[i], format: "png", scale: 1 });
    await writeBlob(`${BUILD}/artifact-renders/slide-${String(i + 1).padStart(2, "0")}.png`, png);
    const layout = await slides[i].export({ format: "layout" });
    await fs.writeFile(`${BUILD}/artifact-renders/slide-${String(i + 1).padStart(2, "0")}.layout.json`, await layout.text(), "utf8");
  }
  const montage = await presentation.export({ format: "webp", montage: true, scale: 1 });
  await writeBlob(`${BUILD}/artifact-renders/deck-montage.webp`, montage);
  const inspect = await presentation.inspect({ kind: "slide,textbox,shape,image,table,chart,notes,layout", maxChars: 200000 });
  await fs.writeFile(`${BUILD}/artifact-renders/final-inspect.ndjson`, inspect.ndjson || "", "utf8");
  const pptx = await PresentationFile.exportPptx(presentation);
  await pptx.save(FINAL);
  console.log(JSON.stringify({ final: FINAL, slideCount: slides.length, renderDir: `${BUILD}/artifact-renders` }, null, 2));
}

build().catch((error) => {
  console.error(error.stack || error.message || String(error));
  process.exitCode = 1;
});
