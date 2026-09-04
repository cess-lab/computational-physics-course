import fs from "node:fs/promises";
import { execFileSync } from "node:child_process";
import { FileBlob, PresentationFile } from "@oai/artifact-tool";

const root = "/Users/khairuladib/MATLAB-Drive/Kuliah/computational-physics-course";
const out = `${root}/Week02/Lecture_Slides_Week02.pptx`;
const qa = `${root}/Week02/.agent/lecture-slides/qa/round-1`;
const assets = `${root}/Week02/.agent/lecture-slides/assets`;
const eq = `${assets}/equations`;
const plot = `${root}/Week02/.agent/matlab/assets/week02_loop_position.png`;
const imageBytes = {
  launch: await fs.readFile(`${assets}/vertical-launch-matte.png`),
  prediction: await fs.readFile(`${assets}/imagegen/vertical-launch-prediction.png`),
  sampled: await fs.readFile(`${assets}/imagegen/stroboscopic-sampled-positions.png`),
  debugging: await fs.readFile(`${assets}/imagegen/debugging-validation-sign.png`),
  equation: await fs.readFile(`${eq}/vertical-launch-model.png`),
  initial: await fs.readFile(`${eq}/known-initial-value.png`),
  plot: await fs.readFile(plot),
};

const C = { navy: "#0B2B4C", charcoal: "#3F4B57", blue: "#2F6DB2", bluePale: "#EEF5FD", teal: "#2A9D9F", tealPale: "#F0FAF7", gold: "#C98A16", goldPale: "#FFF7E6", red: "#B3262E", redPale: "#FFF2F2", rule: "#AAB4BE", white: "#FFFFFF", muted: "#697684" };
const S = 2 / 3;
function scaled(position) { return Object.fromEntries(Object.entries(position).map(([key, value]) => [key, typeof value === "number" ? value * S : value])); }

async function writeBlob(path, blob) { await fs.writeFile(path, new Uint8Array(await blob.arrayBuffer())); }
function shape(slide, geometry, position, fill = "none", line = { style: "solid", fill: "none", width: 0 }, name) {
  return slide.shapes.add({ geometry, name, position: scaled(position), fill, line, borderRadius: geometry === "roundRect" ? 22 * S : undefined, shadow: "shadow-none" });
}
function text(slide, value, position, opts = {}) {
  const s = shape(slide, "textbox", position, "none", { style: "solid", fill: "none", width: 0 }, opts.name);
  s.text = value;
  s.text.style = { typeface: opts.typeface || "Nunito", fontSize: (opts.size || 28) * S, color: opts.color || C.charcoal, bold: opts.bold || false, alignment: opts.align || "left", verticalAlignment: opts.valign || "top" };
  return s;
}
function box(slide, position, semantic = "blue", title, body) {
  const map = { blue: [C.bluePale, C.blue], teal: [C.tealPale, C.teal], gold: [C.goldPale, C.gold], red: [C.redPale, C.red], neutral: [C.white, C.rule] };
  const [fill, accent] = map[semantic];
  shape(slide, "roundRect", position, fill, { style: "solid", fill: accent, width: 2 });
  if (title) text(slide, title, { left: position.left + 30, top: position.top + 22, width: position.width - 60, height: 60 }, { size: 26, bold: true, color: accent });
  if (body) text(slide, body, { left: position.left + 30, top: position.top + 72, width: position.width - 60, height: position.height - 94 }, { size: 24, color: C.charcoal, typeface: /\b(for|end|assert)\b|=/.test(body) ? "IBM Plex Mono" : "Nunito" });
}
function title(slide, n, heading, subtitle, variant = "T1") {
  const size = variant === "T1" ? 68 : variant === "T2" ? 62 : 56;
  const titlePlaceholder = slide.placeholders.getItem("title");
  titlePlaceholder.text = heading;
  titlePlaceholder.text.style = { typeface: "Nunito", fontSize: size * S, bold: true, color: C.navy, alignment: "left" };
  const subtitlePlaceholder = slide.placeholders.getItem("subtitle");
  subtitlePlaceholder.text = subtitle || "";
  subtitlePlaceholder.text.style = { typeface: "Nunito", fontSize: 30 * S, color: C.charcoal, alignment: "left" };
  const numberPlaceholder = slide.placeholders.getItem("slideNumber");
  numberPlaceholder.text = String(n);
  numberPlaceholder.text.style = { typeface: "Nunito", fontSize: 22 * S, color: C.muted, alignment: "right" };
}
function strip(slide, statement, kind = "teal") {
  const fill = kind === "red" ? C.redPale : C.tealPale; const color = kind === "red" ? C.red : C.teal;
  shape(slide, "roundRect", { left: 115, top: 925, width: 1560, height: 72 }, fill, { style: "solid", fill: color, width: 2 });
  text(slide, statement, { left: 150, top: 938, width: 1490, height: 50 }, { size: 27, bold: true, color, align: "center" });
}
function arrow(slide, x1, y1, x2, y2, color = C.rule) {
  const a = shape(slide, "rightArrow", { left: x1, top: y1, width: x2 - x1, height: y2 - y1 }, color, { style: "solid", fill: color, width: 0 }); return a;
}
function notes(slide, source = "Course-authored content; familiar vertical-launch model.") {
  slide.speakerNotes.textFrame.setText(`[Sources]\n${source}\n[/Sources]`); slide.speakerNotes.setVisible(true);
}
function image(slide, bytes, alt, position, fit = "contain") {
  return slide.images.add({ blob: bytes, contentType: "image/png", alt, fit, position: scaled(position) });
}

const masterDeck = `${root}/.agent/lecture-slide-system/masters/PHY4605_Editable_Slide_Master.pptx`;
const p = await PresentationFile.importPptx(await FileBlob.load(masterDeck));
for (const inheritedSlide of [...p.slides.items]) inheritedSlide.delete();
const L = { opening: "/ppt/slideLayouts/slideLayout2.xml", T1: "/ppt/slideLayouts/slideLayout3.xml", T2: "/ppt/slideLayouts/slideLayout4.xml", T3: "/ppt/slideLayouts/slideLayout5.xml" };

// 1 — opening
{ const s = p.slides.add({ layoutId: L.opening }); s.background.fill = C.white;
  text(s, "PHY4605 Computational Methods in Physics", { left: 115, top: 126, width: 920, height: 40 }, { size: 26, bold: true });
  text(s, "Pseudocode, Loops\nand Debugging", { left: 115, top: 245, width: 1080, height: 210 }, { size: 82, bold: true, color: C.navy });
  text(s, "Week 2 | Make Each Step Traceable", { left: 115, top: 475, width: 1180, height: 60 }, { size: 34 });
  image(s, imageBytes.launch, "Vertical launch path with sampled positions", { left: 1230, top: 175, width: 545, height: 570 });
  text(s, "model  →  pseudocode  →  loop  →  debug  →  validate", { left: 115, top: 860, width: 1500, height: 44 }, { size: 30, bold: true, color: C.navy }); notes(s, "Generated illustration: Week02/.agent/lecture-slides/assets/vertical-launch-matte.png; course-authored content."); }

// 2 — prediction
{ const s = p.slides.add({ layoutId: L.T2 }); s.background.fill = C.white; title(s, 2, "Start with a physical prediction", null, "T2");
  image(s, imageBytes.prediction, "Purpose-built ImageGen visual of a vertical launch and initial conditions", { left: 150, top: 270, width: 470, height: 520 });
  box(s, { left: 700, top: 310, width: 880, height: 360 }, "blue", "Before any code", "1   Upward is positive\n2   Air resistance is neglected\n3   The first stored position is 0 m\n4   The ball rises, reaches a peak, then falls");
  strip(s, "Prediction first: every later check is easier when the expected behaviour is stated"); notes(s); }

// 3 — model/units
{ const s = p.slides.add({ layoutId: L.T2 }); s.background.fill = C.white; title(s, 3, "Name the model before the algorithm", null, "T2");
  image(s, imageBytes.equation, "Vertical-motion equation y of t equals y zero plus v zero t minus one half g t squared", { left: 470, top: 260, width: 970, height: 120 });
  box(s, { left: 165, top: 480, width: 300, height: 150 }, "blue", "y₀", "0 m"); box(s, { left: 540, top: 480, width: 300, height: 150 }, "gold", "v₀", "20 m s⁻¹"); box(s, { left: 915, top: 480, width: 300, height: 150 }, "gold", "g", "9.81 m s⁻²"); box(s, { left: 1290, top: 480, width: 300, height: 150 }, "teal", "tₛ", "0:0.5:4 s");
  strip(s, "Plain language: at each chosen time, calculate one vertical position"); notes(s, "Equation asset: Week02/.agent/lecture-slides/assets/equations/vertical-launch-model.tex/.svg/.png; course-authored content."); }

// 4 — algorithm
{ const s = p.slides.add({ layoutId: L.T2 }); s.background.fill = C.white; title(s, 4, "Break one physics task into small actions", null, "T2");
  const xs = [150, 560, 970, 1380]; const labels = [["INPUT", "store parameters\nand chosen times"], ["CALCULATE", "use the current time\nwith the position equation"], ["OUTPUT", "store the position in a\nlater array"], ["CHECK", "confirm the known first\nvalue"]];
  labels.forEach((a,i)=>box(s,{left:xs[i],top:390,width:290,height:200},i===3?"teal":"blue",a[0],a[1])); arrow(s,445,470,530,505); arrow(s,855,470,940,505); arrow(s,1265,470,1350,505); strip(s,"Pseudocode is an algorithm map, not MATLAB punctuation"); notes(s); }

// 5 — pseudocode to code
{ const s = p.slides.add({ layoutId: L.T2 }); s.background.fill = C.white; title(s, 5, "Map pseudocode to one code block", null, "T2");
  box(s,{left:150,top:300,width:700,height:510},"neutral","Pseudocode","1  Make one position slot per time\n2  Repeat while t moves through the time array\n3  Use the current tₛ value\n4  Store the answer into yₘ(sample_index)");
  arrow(s,880,490,1010,530,C.blue); box(s,{left:1060,top:300,width:680,height:510},"blue","MATLAB scaffold","y_m = zeros(size(t_s));\nfor sample_index = 1:numel(t_s)\n    current_time_s = t_s(sample_index);\n    y_m(sample_index) = ...\nend"); notes(s); }

// 6 — loop
{ const s = p.slides.add({ layoutId: L.T2 }); s.background.fill = C.white; title(s, 6, "A for-loop fills one array entry at a time", null, "T2");
  box(s,{left:150,top:300,width:900,height:460},"blue","Loop scaffold","for sample_index = 1:numel(t_s)\n    current_time_s = t_s(sample_index);\n    y_m(sample_index) = y0_m + v0_mps*current_time_s ...\n                      - 0.5*g_mps2*current_time_s^2;\nend");
  image(s, imageBytes.sampled, "Purpose-built ImageGen stroboscopic vertical sampled positions", { left: 1125, top: 305, width: 500, height: 460 }); text(s,"index",{left:1600,top:325,width:180,height:50},{size:24,bold:true,color:C.blue}); text(s,"1  2  3  …  9",{left:1600,top:370,width:220,height:55},{size:26,color:C.navy}); notes(s,"[Sources]\nGenerated with built-in image_gen: assets/imagegen/stroboscopic-sampled-positions.png; role: sample_index to successive stored positions\n[/Sources]"); }

// 7 — trace
{ const s = p.slides.add({ layoutId: L.T2 }); s.background.fill = C.white; title(s, 7, "Trace the first two iterations", null, "T2");
  box(s,{left:180,top:340,width:670,height:340},"blue","Iteration 1","sample_index = 1\ncurrent_time_s = 0.0 s\ny_m(1) = 0.0000 m"); box(s,{left:1070,top:340,width:670,height:340},"gold","Iteration 2","sample_index = 2\ncurrent_time_s = 0.5 s\ny_m(2) = 8.77375 m"); arrow(s,875,490,1035,530,C.rule); strip(s,"Trace one symbol at a time, then say what the stored number means physically"); notes(s); }

// 8 — bounded completion
{ const s = p.slides.add({ layoutId: L.T2 }); s.background.fill = C.white; title(s, 8, "Complete the one missing calculation", null, "T2");
  box(s,{left:150,top:320,width:950,height:430},"blue","Commented scaffold","for sample_index = 1:n_samples\n    current_time_s = t_s(sample_index);\n    y_m(sample_index) = ____________;\nend");
  box(s,{left:1220,top:380,width:470,height:300},"gold","Bounded task","Quantity already named:\n\ny0_m\nv0_mps\ng_mps2\ncurrent_time_s"); strip(s,"Check after completing: does the first loop pass still store y_m(1) = 0 m?"); notes(s); }

// 9 — parameter change
{ const s = p.slides.add({ layoutId: L.T2 }); s.background.fill = C.white; title(s, 9, "Predict before changing a parameter", null, "T2");
  box(s,{left:190,top:350,width:650,height:300},"blue","Original input","v0_mps = 20;\n\n20 m s⁻¹; same y0_m, g_mps2, and t_s"); arrow(s,880,475,1035,515,C.rule); box(s,{left:1090,top:350,width:650,height:300},"gold","Modify one input","v0_lower_mps = 15;\n\n15 m s⁻¹; rerun the same loop pattern"); strip(s,"Prediction: the lower launch speed should produce a lower maximum position"); notes(s); }

// 10 — output interpretation
{ const s = p.slides.add({ layoutId: L.T2 }); s.background.fill = C.white; title(s, 10, "Read the loop output as evidence", null, "T2");
  image(s, imageBytes.plot, "MATLAB plot of vertical position versus time for two launch speeds", { left: 140, top: 270, width: 1120, height: 590 });
  box(s,{left:1340,top:330,width:420,height:410},"blue","Interpret the graph","1   Both curves begin at 0 m\n\n2   15 m s⁻¹ reaches a lower sample peak\n\n3   Negative after crossing 0 m means the idealised model has been extended below the launch level"); strip(s,"A graph is evidence only when its trend, units, and validity are interpreted"); notes(s,"MATLAB-generated evidence: Week02/.agent/matlab/generate_week02_plot.m and assets/week02_loop_position.png."); }

// 11 — defect types
{ const s = p.slides.add({ layoutId: L.T2 }); s.background.fill = C.white; title(s, 11, "Classify the defect before debugging", null, "T2");
  box(s,{left:135,top:350,width:480,height:300},"red","Syntax","MATLAB cannot complete the intended code structure\n\nmissing end, quote, or bracket"); box(s,{left:720,top:350,width:480,height:300},"gold","Array / indexing / operator","Code may run but reads or stores the wrong values\n\nwrong index, size, or .*"); box(s,{left:1305,top:350,width:480,height:300},"teal","Physical / logical","Code runs but implements the wrong physics\n\nwrong sign, unit, or assumption"); strip(s,"“The code ran” is not proof that the calculation or physics is correct", "red"); notes(s); }

// 12 — use error evidence
{ const s = p.slides.add({ layoutId: L.T2 }); s.background.fill = C.white; title(s, 12, "Use error and array evidence", null, "T2");
  box(s,{left:150,top:320,width:770,height:430},"red","Syntax defect — MATLAB stops","for sample_index = 1:numel(t_s)\n    current_time_s = t_s(sample_index);\n    y_m(sample_index) = y0_m + v0_mps*current_time_s ...\n        - 0.5*g_mps2*current_time_s^2;\n\n% Error cue: “At least one END is missing”");
  box(s,{left:1000,top:320,width:770,height:430},"gold","Indexing defect — MATLAB runs","for sample_index = 1:numel(t_s)\n    current_time_s = t_s(sample_index);\n    y_m(1) = y0_m + v0_mps*current_time_s ...\n        - 0.5*g_mps2*current_time_s^2;\nend\n\n% Array evidence: y_m(2:end) remains 0"); strip(s,"An error pinpoints where MATLAB stopped; the stored array reveals a silent indexing defect"); notes(s); }

// 13 — validation
{ const s = p.slides.add({ layoutId: L.T3 }); s.background.fill = C.white; title(s, 13, "Known value checks the start; physics checks the sign", null, "T3");
  box(s,{left:180,top:330,width:560,height:390},"teal","Known initial value","At t = 0 s, the equation gives\n\nassert(y_m(1) == y0_m)"); image(s, imageBytes.initial, "Initial height y of zero equals zero metres", { left: 315, top: 500, width: 300, height: 75 }); image(s, imageBytes.debugging, "Purpose-built ImageGen visual for downward gravity and a rejected upward-sign expectation", { left: 790, top: 300, width: 370, height: 430 }); box(s,{left:1200,top:330,width:570,height:390},"red","Physical-sign defect","y_wrong(sample_index) = y0_m + v0_mps*t_s(sample_index)\n    + 0.5*g_mps2*t_s(sample_index)^2\n\nInitial check: PASS at t = 0\nPhysics check: FAIL — gravity acts downward"); strip(s,"Validation is strongest when code evidence and physical reasoning agree"); notes(s,"Equation asset source: Week02/.agent/lecture-slides/assets/equations/known-initial-value.tex/.svg/.png; TeX: y(0)=0\\,\\mathrm{m}. [Sources]\nGenerated with built-in image_gen: assets/imagegen/debugging-validation-sign.png; role: gravity-sign validation\n[/Sources]"); }

// 14 — exit
{ const s = p.slides.add({ layoutId: L.T2 }); s.background.fill = C.white; title(s, 14, "Week 2 exit ticket", null, "T2");
  const qs = ["Put input, calculation, output, and check in a sensible order", "For sample_index = 2, what time does t_s(sample_index) select?", "Give one syntax or indexing defect and the evidence you would inspect", "State the initial-value validation and one physical conclusion from the graph"]; qs.forEach((q,i)=>{ text(s, String(i+1), {left:180,top:320+i*130,width:55,height:45},{size:30,bold:true,color:C.blue}); text(s,q,{left:260,top:320+i*130,width:1450,height:70},{size:28,color:C.charcoal}); shape(s,"line",{left:260,top:385+i*130,width:1450,height:0},"none",{style:"solid",fill:"#DDE5EC",width:2}); }); strip(s,"Next week: assemble and solve a 2×2 circuit model, then validate the currents"); notes(s); }

await fs.mkdir(qa, { recursive: true });
for (const [i, slide] of p.slides.items.entries()) await writeBlob(`${qa}/slide-${String(i+1).padStart(2,"0")}.png`, await p.export({ slide, format: "png", scale: 1 }));
await writeBlob(`${qa}/deck-montage.webp`, await p.export({ format: "webp", montage: true, scale: 1 }));
const pptx = await PresentationFile.exportPptx(p); await pptx.save(out);
const imageDescriptions = {
  "/slide[1]": "Vertical launch with sampled positions",
  "/slide[2]": "Vertical launch and peak height",
  "/slide[3]": "Vertical-motion equation",
  "/slide[6]": "Stroboscopic sampled positions for the loop index",
  "/slide[10]": "MATLAB plot of vertical position against time",
  "/slide[13]": "Initial height y of zero equals zero metres",
};
const pictures = JSON.parse(execFileSync("officecli", ["query", out, "picture", "--json"], { encoding: "utf8" })).data.results;
for (const picture of pictures) {
  const slidePath = picture.path.match(/^\/slide\[\d+\]/)[0];
  execFileSync("officecli", ["set", out, picture.path, "--prop", `alt=${imageDescriptions[slidePath]}`], { stdio: "inherit" });
}
