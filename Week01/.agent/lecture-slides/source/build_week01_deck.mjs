import fs from "node:fs/promises";
import path from "node:path";
import { Presentation, PresentationFile } from "@oai/artifact-tool";
import JSZip from "jszip";

const ROOT = "/Users/khairuladib/MATLAB-Drive/Kuliah/computational-physics-course";
const SYSTEM = path.join(ROOT, ".agent/lecture-slide-system");
const WEEK = path.join(ROOT, "Week01");
const OUTPUT = path.join(WEEK, "Lecture_Slides_Week01.pptx");
const QA = path.join(WEEK, ".agent/lecture-slides/qa/terra-sol-round4");
const EQUATIONS_DIR = path.join(WEEK, ".agent/lecture-slides/assets/equations");
const MATLAB_FIGURES_DIR = path.join(WEEK, ".agent/lecture-slides/assets/matlab-figures");
const PROJECTILE = path.join(WEEK, ".agent/lecture-slides/assets/projectile-visual-matte.png");
const ARRAY_MOTION = path.join(WEEK, ".agent/lecture-slides/assets/array-sampled-motion-matte-v2.png");
const LAUNCH_BOUNDARY = path.join(WEEK, ".agent/lecture-slides/assets/launch-boundary-condition-matte.png");
const EQUATION_MOTION = path.join(WEEK, ".agent/lecture-slides/assets/equation-motion-vertical-matte-v2.png");
const HEIGHT_TIME_FIGURE = path.join(MATLAB_FIGURES_DIR, "height_time_evidence.png");
const LAUNCH_SPEED_FIGURE = path.join(MATLAB_FIGURES_DIR, "launch_speed_comparison.png");
const EQUATION_ASSETS = {
  position: path.join(EQUATIONS_DIR, "vertical-motion-position-equation.png"),
  arrayStart: path.join(EQUATIONS_DIR, "array-moment-start.png"),
  arrayPeak: path.join(EQUATIONS_DIR, "array-moment-peak.png"),
  arrayEnd: path.join(EQUATIONS_DIR, "array-moment-end.png"),
  heightZero: path.join(EQUATIONS_DIR, "height-zero.png"),
  heightNearZero: path.join(EQUATIONS_DIR, "height-near-zero.png"),
  launchTime: path.join(EQUATIONS_DIR, "launch-time.png"),
  computedFirstValue: path.join(EQUATIONS_DIR, "computed-first-value.png"),
  symbolT: path.join(EQUATIONS_DIR, "symbol-t.png"),
  symbolY: path.join(EQUATIONS_DIR, "symbol-y.png"),
  symbolV0: path.join(EQUATIONS_DIR, "symbol-v0.png"),
  symbolG: path.join(EQUATIONS_DIR, "symbol-g.png"),
  unitS: path.join(EQUATIONS_DIR, "unit-s.png"),
  unitM: path.join(EQUATIONS_DIR, "unit-m.png"),
  unitMs1: path.join(EQUATIONS_DIR, "unit-ms1.png"),
  unitMs2: path.join(EQUATIONS_DIR, "unit-ms2.png"),
  termY0: path.join(EQUATIONS_DIR, "term-y0.png"),
  termV0t: path.join(EQUATIONS_DIR, "term-v0t.png"),
  termGravity: path.join(EQUATIONS_DIR, "term-gravity.png"),
  termPosition: path.join(EQUATIONS_DIR, "term-position.png"),
  comparisonV0: path.join(EQUATIONS_DIR, "comparison-v0.png"),
  comparisonGY0: path.join(EQUATIONS_DIR, "comparison-g-y0.png"),
};
const EQUATION_SOURCE_BASENAMES = {
  position: "vertical-motion-position-equation",
  arrayStart: "array-moment-start",
  arrayPeak: "array-moment-peak",
  arrayEnd: "array-moment-end",
  heightZero: "height-zero",
  heightNearZero: "height-near-zero",
  launchTime: "launch-time",
  computedFirstValue: "computed-first-value",
  symbolT: "symbol-t",
  symbolY: "symbol-y",
  symbolV0: "symbol-v0",
  symbolG: "symbol-g",
  unitS: "unit-s",
  unitM: "unit-m",
  unitMs1: "unit-ms1",
  unitMs2: "unit-ms2",
  termY0: "term-y0",
  termV0t: "term-v0t",
  termGravity: "term-gravity",
  termPosition: "term-position",
  comparisonV0: "comparison-v0",
  comparisonGY0: "comparison-g-y0",
};
const equationProvenanceBySlide = new WeakMap();
const imageAltByName = {
  "visual-projectile": "A ball at launch, at its highest point, and on return along one vertical dashed path",
  "visual-array-motion": "Eleven evenly spaced snapshots of one ball: launch, rise, highest point, descent, and return",
  "visual-launch-boundary": "A ball on the ground at launch with an upward initial-velocity arrow and downward gravity arrow",
  "visual-equation-motion": "Five time snapshots of one ball at vertical positions: launch, rise, peak, descent, and return; each position has a vertical guide",
  "matlab-height-time-figure": "MATLAB-generated height-versus-time plot for vertical motion with LaTeX-interpreted labels",
  "matlab-launch-speed-figure": "MATLAB-generated comparison of two launch speeds with LaTeX-interpreted labels and legend",
  "week01-matlab-plot": "MATLAB height-versus-time plot for the Week 1 vertical-motion model: the ball starts at 0 metres, rises to one peak, then returns towards 0 metres; the initial-value marker confirms y_m(1) equals 0 metres",
};
Object.assign(imageAltByName, {
  "equation-arrayStart": "LaTeX-rendered expression t(1) equals 0.0 seconds",
  "equation-arrayPeak": "LaTeX-rendered expression t(6) equals 2.0 seconds",
  "equation-arrayEnd": "LaTeX-rendered expression t(11) equals 4.0 seconds",
  "equation-prediction-1": "LaTeX-rendered expression y equals 0 metres",
  "equation-prediction-3": "LaTeX-rendered expression y is approximately 0 metres",
  "equation-launch-time": "LaTeX-rendered expression t equals 0 seconds",
  "equation-launch-height": "LaTeX-rendered expression y equals 0 metres",
  "equation-computed-first-value": "LaTeX-rendered validation result y(1) equals 0.000 metres",
  "equation-symbol-1": "LaTeX-rendered symbol t",
  "equation-symbol-2": "LaTeX-rendered symbol y",
  "equation-symbol-3": "LaTeX-rendered symbol v subscript 0",
  "equation-symbol-4": "LaTeX-rendered symbol g",
  "equation-unit-1": "LaTeX-rendered SI unit seconds",
  "equation-unit-2": "LaTeX-rendered SI unit metres",
  "equation-unit-3": "LaTeX-rendered SI unit metres per second",
  "equation-unit-4": "LaTeX-rendered SI unit metres per second squared",
  "equation-position-model": "LaTeX-rendered equation y of t equals y subscript 0 plus v subscript 0 t minus one half g t squared",
  "equation-term-termY0": "LaTeX-rendered equation term y subscript 0",
  "equation-term-termV0t": "LaTeX-rendered equation term v subscript 0 t",
  "equation-term-termGravity": "LaTeX-rendered equation term minus one half g t squared",
  "equation-term-termPosition": "LaTeX-rendered equation term y of t",
  "equation-comparison-v0": "LaTeX-rendered symbol v subscript 0",
  "equation-comparison-fixed": "LaTeX-rendered expression g and y subscript 0",
});
const imageOrderBySlide = {
  1: ["visual-projectile"],
  2: ["visual-array-motion", "equation-arrayStart", "equation-arrayPeak", "equation-arrayEnd"],
  3: ["equation-prediction-1", "equation-prediction-3", "matlab-height-time-figure"],
  4: ["visual-launch-boundary", "equation-launch-time", "equation-launch-height", "equation-computed-first-value"],
  5: ["equation-symbol-1", "equation-unit-1", "equation-symbol-2", "equation-unit-2", "equation-symbol-3", "equation-unit-3", "equation-symbol-4", "equation-unit-4"],
  7: ["equation-position-model", "visual-equation-motion", "equation-term-termY0", "equation-term-termV0t", "equation-term-termGravity", "equation-term-termPosition"],
  12: ["week01-matlab-plot"],
};

const C = {
  white: "#FFFFFF",
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
};

const F = {
  title: "Nunito",
  body: "Nunito",
  code: "IBM Plex Mono",
};

const titleVariants = {
  T1: { fontSize: 68, top: 60, height: 88, subtitleTop: 152, contentTop: 225 },
  T2: { fontSize: 62, top: 60, height: 88, subtitleTop: 152, contentTop: 225 },
  T3: { fontSize: 56, top: 60, height: 138, subtitleTop: 205, contentTop: 270 },
};

function lineNone() {
  return { style: "solid", fill: "none", width: 0 };
}

function addText(slide, text, position, style = {}, name) {
  const shape = slide.shapes.add({
    geometry: "textbox",
    ...(name ? { name } : {}),
    position,
    fill: "none",
    line: lineNone(),
  });
  shape.text = text;
  shape.text.style = {
    typeface: F.body,
    fontSize: 28,
    color: C.charcoal,
    verticalAlignment: "top",
    alignment: "left",
    autoFit: "none",
    wrap: "square",
    insets: { top: 0, right: 0, bottom: 0, left: 0 },
    ...style,
  };
  return shape;
}

function addCard(slide, position, fill = C.paleNeutral, stroke = C.rule, radius = "rounded-xl", name) {
  return slide.shapes.add({
    geometry: "roundRect",
    ...(name ? { name } : {}),
    position,
    fill,
    line: { style: "solid", fill: stroke, width: 2 },
    borderRadius: radius,
  });
}

function addPill(slide, text, position, fill, color) {
  const pill = slide.shapes.add({
    geometry: "roundRect",
    position,
    fill,
    line: lineNone(),
    borderRadius: "rounded-full",
  });
  pill.text = text;
  pill.text.style = {
    typeface: F.body,
    fontSize: 22,
    bold: true,
    color,
    alignment: "center",
    verticalAlignment: "middle",
    autoFit: "none",
    insets: { top: 0, right: 8, bottom: 0, left: 8 },
  };
  return pill;
}

function addSlideNumber(slide, number) {
  addText(
    slide,
    String(number),
    { left: 1764, top: 976, width: 40, height: 28 },
    { fontSize: 22, color: C.muted, alignment: "right", verticalAlignment: "middle" },
    `slide-number-${number}`,
  );
}

function addTitle(slide, title, variant = "T1", subtitle = "") {
  const v = titleVariants[variant];
  const titleShape = addText(
    slide,
    title,
    { left: 115, top: v.top, width: 1580, height: v.height },
    {
      typeface: F.title,
      fontSize: v.fontSize,
      bold: true,
      color: C.navy,
      verticalAlignment: "top",
      lineSpacing: variant === "T3" ? 0.95 : 1,
    },
    `title-${variant}`,
  );
  titleShape.alt = `${variant} title proof: ${title.replaceAll("\n", " ")}`;
  if (subtitle) {
    addText(
      slide,
      subtitle,
      { left: 115, top: v.subtitleTop, width: 1580, height: 44 },
      { fontSize: 30, color: C.charcoal },
      `subtitle-${variant}`,
    );
  }
  return v.contentTop;
}

function addNotes(slide, sources, teaching = "") {
  const lines = [];
  if (teaching) lines.push(teaching, "");
  lines.push("[Sources]", ...sources.map((source) => `- ${source}`));
  const equations = equationProvenanceBySlide.get(slide) || [];
  if (equations.length) {
    lines.push("", "[Equation provenance]", ...equations.map((entry) => (
      `- ${entry.assetKey}: TeX \`${entry.tex}\`; SVG \`${entry.basePath}.svg\`; PNG \`${entry.basePath}.png\`; ` +
      `foreground \`${entry.foreground}\`; target \`${entry.width} × ${entry.height} px\`; fit/crop \`${entry.fit}\`; ` +
      `alt \`${entry.alt}\`; QA \`render-equations-diagrams, PNG scale 6, retained TeX/SVG\``
    )));
  }
  slide.speakerNotes.textFrame.setText(lines.join("\n"));
  slide.speakerNotes.setVisible(true);
}

function addEquationAsset(slide, blob, position, { alt, tex, name, assetKey, foreground = C.navy, fit = "contain" } = {}) {
  const equation = slide.images.add({
    blob,
    contentType: "image/png",
    ...(name ? { name } : {}),
    prompt: `LaTeX-rendered display equation; TeX: ${tex || "retained beside the deck source"}; foreground ${foreground}`,
    alt: alt || "LaTeX-rendered mathematical expression",
    fit,
    position,
  });
  equation.alt = alt || "LaTeX-rendered mathematical expression";
  const key = assetKey || name || "unnamed-equation";
  const base = EQUATION_SOURCE_BASENAMES[key] || key.replace(/^equation-/, "");
  const entries = equationProvenanceBySlide.get(slide) || [];
  entries.push({
    assetKey: key,
    basePath: `Week01/.agent/lecture-slides/assets/equations/${base}`,
    tex: tex || "",
    foreground,
    width: position.width,
    height: position.height,
    fit,
    alt: alt || "LaTeX-rendered mathematical expression",
  });
  equationProvenanceBySlide.set(slide, entries);
  return equation;
}

function addArrow(slide, from, to, color = C.rule, width = 3) {
  const dx = to.x - from.x;
  const dy = to.y - from.y;
  const horizontal = Math.abs(dx) >= Math.abs(dy);
  return slide.shapes.add({
    geometry: horizontal ? (dx >= 0 ? "rightArrow" : "leftArrow") : (dy >= 0 ? "downArrow" : "upArrow"),
    position: horizontal
      ? { left: Math.min(from.x, to.x), top: from.y - Math.max(6, width * 2), width: Math.abs(dx), height: Math.max(12, width * 4) }
      : { left: from.x - Math.max(6, width * 2), top: Math.min(from.y, to.y), width: Math.max(12, width * 4), height: Math.abs(dy) },
    fill: color,
    line: lineNone(),
  });
}

function addCheck(slide, x, y, color = C.green) {
  const circle = slide.shapes.add({
    geometry: "ellipse",
    position: { left: x, top: y, width: 46, height: 46 },
    fill: color,
    line: lineNone(),
  });
  circle.text = "✓";
  circle.text.style = {
    typeface: F.body,
    fontSize: 30,
    bold: true,
    color: C.white,
    alignment: "center",
    verticalAlignment: "middle",
    insets: { top: 0, right: 0, bottom: 2, left: 0 },
  };
  return circle;
}

async function writeBlob(filePath, blob) {
  await fs.writeFile(filePath, new Uint8Array(await blob.arrayBuffer()));
}

function xmlEscape(value) {
  return String(value)
    .replaceAll("&", "&amp;")
    .replaceAll("<", "&lt;")
    .replaceAll(">", "&gt;")
    .replaceAll('"', "&quot;")
    .replaceAll("'", "&apos;");
}

// artifact-tool currently serialises layout relationships but not editable
// PowerPoint placeholders.  Keep this repair in the deterministic master
// source (rather than as a manual PowerPoint overlay) so a rebuilt master has
// a real master -> layout -> slide ownership chain for title treatment and
// slide numbers.  The placeholders intentionally have no default text: a
// dependent deck supplies its own editable content without duplicate ink.
function placeholderXml({ id, name, type, x, y, width, height, fontSize, color, bold = false, alignment = "l", anchor = "t", index } = {}) {
  const ph = type === "title"
    ? '<p:ph type="title"/>'
    : type === "subtitle"
      ? '<p:ph type="subTitle"/>'
      : type === "slide-number"
        ? '<p:ph type="sldNum"/>'
        : `<p:ph type="body" idx="${index || 1}"/>`;
  const anchorAttr = anchor === "ctr" ? ' anchor="ctr"' : "";
  const paragraphAlignment = alignment === "r" ? "r" : "l";
  return `<p:sp><p:nvSpPr><p:cNvPr id="${id}" name="${xmlEscape(name)}"/><p:cNvSpPr/><p:nvPr>${ph}</p:nvPr></p:nvSpPr>` +
    `<p:spPr><a:xfrm xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main"><a:off x="${x}" y="${y}"/><a:ext cx="${width}" cy="${height}"/></a:xfrm><a:prstGeom xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main" prst="rect"><a:avLst/></a:prstGeom><a:noFill xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main"/><a:ln xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main" w="0"><a:noFill/></a:ln></p:spPr>` +
    `<p:txBody><a:bodyPr xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main" wrap="square" lIns="0" tIns="0" rIns="0" bIns="0"${anchorAttr}/><a:lstStyle xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main"/><a:p xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main"><a:pPr algn="${paragraphAlignment}"><a:buNone/><a:defRPr sz="${fontSize}"${bold ? ' b="1"' : ""}><a:solidFill><a:srgbClr val="${color}"/></a:solidFill><a:latin typeface="Nunito"/><a:ea typeface="Nunito"/><a:cs typeface="Nunito"/></a:defRPr></a:pPr><a:endParaRPr sz="${fontSize}"${bold ? ' b="1"' : ""}><a:solidFill><a:srgbClr val="${color}"/></a:solidFill><a:latin typeface="Nunito"/><a:ea typeface="Nunito"/><a:cs typeface="Nunito"/></a:endParaRPr></a:p></p:txBody></p:sp>`;
}

function injectMasterPlaceholders(xml, shapes) {
  if (xml.includes('name="PHY4605 inherited title treatment"')) return xml;
  return xml.replace("</p:grpSpPr>", `</p:grpSpPr>${shapes.join("")}`);
}

// Bind the editable text objects created by artifact-tool to the matching
// placeholders in their inherited layout.  The text stays on the slide (as it
// must for a concrete weekly title or number), but it is no longer an
// independent overlay: PowerPoint resolves it through the title/subtitle/
// slide-number placeholder chain in the approved master.
function bindTextObjectToPlaceholder(xml, objectName, placeholderXmlText) {
  const escapedName = objectName.replace(/[.*+?^${}()|[\]\\]/g, "\\$&");
  // Restrict the match to exactly one shape.  A previous unbounded lookahead
  // could see a later named object and insert a slide-number placeholder into
  // unrelated content shapes before the intended object was reached.
  const pattern = new RegExp(
    `(<p:sp>(?:(?!<\\/p:sp>)[\\s\\S])*?<p:cNvPr\\b[^>]*\\bname="${escapedName}"[^>]*(?:\\/>|>[\\s\\S]*?<\\/p:cNvPr>)(?:(?!<\\/p:sp>)[\\s\\S])*?<p:nvPr)\\s*/>([\\s\\S]*?<\\/p:sp>)`,
    "g",
  );
  return xml.replace(pattern, `$1>${placeholderXmlText}</p:nvPr>$2`);
}

function bindWeeklySlidePlaceholders(xml, slideNumber) {
  if (slideNumber === 1) {
    // The course tag is deliberately an ordinary editable text object.  The
    // Opening layout's body placeholder is reserved for reusable layout
    // treatment, not a second slide-level content binding.  Binding this
    // object made it an unconsumed body placeholder and caused PowerPoint's
    // placeholder audit to reject the opening slide.
    xml = bindTextObjectToPlaceholder(xml, "opening-title", '<p:ph type="title"/>');
    return bindTextObjectToPlaceholder(xml, "opening-subtitle", '<p:ph type="subTitle"/>');
  }
  xml = bindTextObjectToPlaceholder(xml, "title-T1", '<p:ph type="title"/>');
  xml = bindTextObjectToPlaceholder(xml, "title-T2", '<p:ph type="title"/>');
  xml = bindTextObjectToPlaceholder(xml, "title-T3", '<p:ph type="title"/>');
  xml = bindTextObjectToPlaceholder(xml, "subtitle-T1", '<p:ph type="subTitle"/>');
  xml = bindTextObjectToPlaceholder(xml, "subtitle-T2", '<p:ph type="subTitle"/>');
  xml = bindTextObjectToPlaceholder(xml, "subtitle-T3", '<p:ph type="subTitle"/>');
  return bindTextObjectToPlaceholder(xml, `slide-number-${slideNumber}`, '<p:ph type="sldNum"/>');
}

async function repairExportedPptx(filePath) {
  const zip = await JSZip.loadAsync(await fs.readFile(filePath));
  const themeFiles = Object.keys(zip.files).filter((name) => /^ppt\/.*theme[^/]*\.xml$/i.test(name));
  for (const themeFile of themeFiles) {
    let themeXml = await zip.file(themeFile).async("string");
    themeXml = themeXml
      .replace(/(<a:majorFont>[\s\S]*?<a:latin typeface=")[^"]*(" \/>)/, "$1Nunito$2")
      .replace(/(<a:minorFont>[\s\S]*?<a:latin typeface=")[^"]*(" \/>)/, "$1Nunito$2")
      .replace(/(<a:majorFont>[\s\S]*?<a:ea typeface=")[^"]*(" \/>)/, "$1Nunito$2")
      .replace(/(<a:minorFont>[\s\S]*?<a:ea typeface=")[^"]*(" \/>)/, "$1Nunito$2")
      .replace(/(<a:majorFont>[\s\S]*?<a:cs typeface=")[^"]*(" \/>)/, "$1Nunito$2")
      .replace(/(<a:minorFont>[\s\S]*?<a:cs typeface=")[^"]*(" \/>)/, "$1Nunito$2");
    zip.file(themeFile, themeXml);
  }

  for (const fileName of Object.keys(zip.files).filter((name) => /^ppt\/slides\/slide\d+\.xml$/.test(name))) {
   let slideXml = await zip.file(fileName).async("string");
   const slideNumber = Number(fileName.match(/slide(\d+)\.xml$/)?.[1] || 0);
   slideXml = bindWeeklySlidePlaceholders(slideXml, slideNumber);
   let imageIndex = 0;
   slideXml = slideXml.replace(/<p:nvPicPr>[\s\S]*?<\/p:nvPicPr>/g, (pictureBlock) => {
     return pictureBlock.replace(/<p:cNvPr\b([^>]*)\/>/, (_match, rawAttributes) => {
       imageIndex += 1;
       const nameMatch = rawAttributes.match(/\bname="([^"]*)"/);
        const orderedName = imageOrderBySlide[slideNumber]?.[imageIndex - 1];
        const name = orderedName || nameMatch?.[1] || `image-${path.basename(fileName, ".xml")}-${imageIndex}`;
       const alt = imageAltByName[name] || `PHY4605 scientific visual or LaTeX-rendered equation (${name})`;
        const attributes = rawAttributes
          .replace(/\s+descr="[^"]*"/, "")
          .replace(/\s+name="[^"]*"/, "");
        return `<p:cNvPr${attributes} name="${xmlEscape(name)}" descr="${xmlEscape(alt)}"/>`;
     });
   });
    zip.file(fileName, slideXml);
  }

  const EMU = 9525;
  const openingShapes = [
    placeholderXml({ id: 10, name: "PHY4605 inherited course tag treatment", type: "body", index: 10, x: 115 * EMU, y: 126 * EMU, width: 760 * EMU, height: 38 * EMU, fontSize: 1950, color: "3F4B57", bold: true }),
    placeholderXml({ id: 11, name: "PHY4605 inherited title treatment", type: "title", x: 115 * EMU, y: 245 * EMU, width: 1080 * EMU, height: 210 * EMU, fontSize: 6150, color: "0B2B4C", bold: true }),
    placeholderXml({ id: 12, name: "PHY4605 inherited subtitle treatment", type: "subtitle", x: 115 * EMU, y: 475 * EMU, width: 1180 * EMU, height: 80 * EMU, fontSize: 2550, color: "3F4B57" }),
  ];
  const contentShapes = (variant) => {
    const titleFont = variant === "T1" ? 5100 : variant === "T2" ? 4650 : 4200;
    const titleHeight = variant === "T3" ? 138 * EMU : 88 * EMU;
    const subtitleY = variant === "T3" ? 205 * EMU : 152 * EMU;
    return [
      placeholderXml({ id: 10, name: "PHY4605 inherited title treatment", type: "title", x: 115 * EMU, y: 60 * EMU, width: 1580 * EMU, height: titleHeight, fontSize: titleFont, color: "0B2B4C", bold: true }),
      placeholderXml({ id: 11, name: "PHY4605 inherited subtitle treatment", type: "subtitle", x: 115 * EMU, y: subtitleY, width: 1580 * EMU, height: 44 * EMU, fontSize: 2250, color: "3F4B57" }),
      placeholderXml({ id: 12, name: "PHY4605 inherited slide-number treatment", type: "slide-number", x: 1764 * EMU, y: 976 * EMU, width: 40 * EMU, height: 28 * EMU, fontSize: 1650, color: "697684", alignment: "r", anchor: "ctr" }),
    ];
  };
  const layoutFiles = Object.keys(zip.files).filter((name) => /^ppt\/slideLayouts\/slideLayout\d+\.xml$/.test(name));
  for (const layoutFile of layoutFiles) {
    let layoutXml = await zip.file(layoutFile).async("string");
    const layoutName = layoutXml.match(/<p:cSld name="([^"]+)"/)?.[1];
    // The library-generated fallback title layout is not used by PHY4605
    // decks, but retain the same inherited treatment so no layout is an
    // empty exception in the reusable master.
    if (layoutName === "Title Slide") layoutXml = injectMasterPlaceholders(layoutXml, contentShapes("T1"));
    if (layoutName === "Opening") layoutXml = injectMasterPlaceholders(layoutXml, openingShapes);
    if (layoutName === "Content T1") layoutXml = injectMasterPlaceholders(layoutXml, contentShapes("T1"));
    if (layoutName === "Content T2") layoutXml = injectMasterPlaceholders(layoutXml, contentShapes("T2"));
    if (layoutName === "Content T3") layoutXml = injectMasterPlaceholders(layoutXml, contentShapes("T3"));
    zip.file(layoutFile, layoutXml);
  }
  const masterShapes = [
    placeholderXml({ id: 10, name: "PHY4605 inherited title treatment", type: "title", x: 115 * EMU, y: 60 * EMU, width: 1580 * EMU, height: 88 * EMU, fontSize: 5100, color: "0B2B4C", bold: true }),
    placeholderXml({ id: 11, name: "PHY4605 inherited subtitle treatment", type: "subtitle", x: 115 * EMU, y: 152 * EMU, width: 1580 * EMU, height: 44 * EMU, fontSize: 2250, color: "3F4B57" }),
    placeholderXml({ id: 12, name: "PHY4605 inherited slide-number treatment", type: "slide-number", x: 1764 * EMU, y: 976 * EMU, width: 40 * EMU, height: 28 * EMU, fontSize: 1650, color: "697684", alignment: "r", anchor: "ctr" }),
  ];
  for (const masterFile of Object.keys(zip.files).filter((name) => /^ppt\/slideMasters\/slideMaster\d+\.xml$/.test(name))) {
    const masterXml = await zip.file(masterFile).async("string");
    zip.file(masterFile, injectMasterPlaceholders(masterXml, masterShapes));
  }

  const repairedPath = `${filePath}.repaired`;
  await fs.writeFile(repairedPath, await zip.generateAsync({ type: "nodebuffer", compression: "DEFLATE" }));
  await fs.rename(repairedPath, filePath);
}

async function main() {
  await fs.mkdir(QA, { recursive: true });
  const projectileBytes = await fs.readFile(PROJECTILE);
  const arrayMotionBytes = await fs.readFile(ARRAY_MOTION);
  const launchBoundaryBytes = await fs.readFile(LAUNCH_BOUNDARY);
  const equationMotionBytes = await fs.readFile(EQUATION_MOTION);
  const heightTimeFigureBytes = await fs.readFile(HEIGHT_TIME_FIGURE);
  const launchSpeedFigureBytes = await fs.readFile(LAUNCH_SPEED_FIGURE);
  const equationBytes = {};
  for (const [key, filePath] of Object.entries(EQUATION_ASSETS)) {
    equationBytes[key] = await fs.readFile(filePath);
  }

  const presentation = Presentation.create({ slideSize: { width: 1920, height: 1080 } });
  presentation.theme.colorScheme = {
    name: "PHY4605",
    themeColors: {
      accent1: C.blue,
      accent2: C.teal,
      accent3: C.gold,
      accent4: C.purple,
      accent5: C.green,
      accent6: C.red,
      bg1: C.white,
      bg2: C.paleNeutral,
      tx1: C.navy,
      tx2: C.charcoal,
      dk1: C.navy,
      dk2: C.charcoal,
      lt1: C.white,
      lt2: C.paleNeutral,
      hlink: C.blue,
      folHlink: C.purple,
    },
  };

  const master = presentation.masters.add("PHY4605 Borderless White Master");

  for (const layoutName of ["Opening", "Content T1", "Content T2", "Content T3"]) {
    const layout = presentation.layouts.add(layoutName);
    layout.setParentLayoutId(master.id);
  }

  // Slide 1 — opening system proof.
  {
    const slide = presentation.slides.add({ layout: "Opening" });
    slide.background.fill = C.white;

    addText(
      slide,
      "PHY4605 Computational Methods in Physics",
      { left: 115, top: 126, width: 760, height: 38 },
      { fontSize: 26, bold: true, color: C.charcoal },
      "course-tag",
    );
    addText(
      slide,
      "Physics to Arrays and Plots",
      { left: 115, top: 245, width: 1080, height: 210 },
      { typeface: F.title, fontSize: 82, bold: true, color: C.navy, lineSpacing: 0.94 },
      "opening-title",
    );
    addText(
      slide,
      "Week 1 | From Motion to MATLAB",
      { left: 115, top: 475, width: 1180, height: 80 },
      { fontSize: 34, color: C.charcoal },
      "opening-subtitle",
    );

    // One restrained visual frame; exact labels remain editable PowerPoint objects.
    slide.images.add({
      blob: projectileBytes,
      contentType: "image/png",
      name: "visual-projectile",
      prompt: "PHY4605 Matte Scientific Cutaway: a vertical projectile shown at three positions on one dashed trajectory; no text",
      alt: "A ball at launch, at its highest point, and on return along one vertical dashed path",
      fit: "contain",
      position: { left: 1305, top: 200, width: 420, height: 530 },
    });
    addText(slide, "highest point", { left: 1560, top: 182, width: 190, height: 38 }, { fontSize: 22, bold: true, color: C.gold });
    addText(slide, "return", { left: 1580, top: 480, width: 150, height: 36 }, { fontSize: 22, bold: true, color: C.blue });
    addText(slide, "launch", { left: 1575, top: 690, width: 150, height: 36 }, { fontSize: 22, bold: true, color: C.blue });
    addArrow(slide, { x: 1275, y: 295 }, { x: 1275, y: 535 }, C.charcoal, 4);
    addText(slide, "gravity", { left: 1170, top: 395, width: 90, height: 36 }, { fontSize: 22, bold: true, color: C.charcoal, alignment: "right" });

    const chainY = 825;
    const chain = [
      ["physical model", C.paleBlue, C.blue],
      ["arrays", C.paleNeutral, C.navy],
      ["plot", C.paleGold, C.gold],
      ["validation", C.paleValid, C.green],
    ];
    chain.forEach(([label, fill, color], i) => {
      addPill(slide, label, { left: 115 + i * 260, top: chainY, width: 210, height: 54 }, fill, color);
      if (i < chain.length - 1) addArrow(slide, { x: 334 + i * 260, y: chainY + 27 }, { x: 364 + i * 260, y: chainY + 27 }, C.rule, 2);
    });
    addNotes(slide, [
      "PHY4605 Lecture Slide Deck Design Specification",
      "OpenAI ImageGen; PHY4605 Matte Scientific Cutaway visual-only projectile illustration; generated 2026-08-31",
      "Standard constant-acceleration kinematics; lecturer-authored",
    ]);
  }

  // Slide 2 — T1 title and array/index visual.
  {
    const slide = presentation.slides.add({ layout: "Content T1" });
    slide.background.fill = C.white;
    addTitle(slide, "Arrays store physical moments", "T1", "Each index identifies one measurement time");

    slide.images.add({
      blob: arrayMotionBytes,
      contentType: "image/png",
      name: "visual-array-motion",
      prompt: "PHY4605 Matte Scientific Cutaway: eleven aligned samples of one vertical projectile, with the central peak marked in gold; visual-only",
      alt: "Eleven evenly spaced snapshots of one ball: launch, rise, highest point, descent, and return",
      fit: "contain",
      position: { left: 325, top: 215, width: 1270, height: 410 },
    });

    // The editable index rail is deliberately centred beneath the corresponding
    // eleven visual samples, so each array position reads as one moment in the same motion.
    const x0 = 524;
    const y = 575;
    const step = 86;
    slide.shapes.add({ geometry: "line", position: { left: x0, top: y, width: step * 10, height: 0 }, line: { style: "solid", fill: C.rule, width: 4 }, fill: "none" });
    for (let i = 0; i < 11; i += 1) {
      const key = i === 0 || i === 5 || i === 10;
      slide.shapes.add({
        geometry: "line",
        position: { left: x0 + step * i, top: 543, width: 0, height: 17 },
        line: { style: "solid", fill: C.paleBlue, width: 2 },
        fill: "none",
      });
      slide.shapes.add({
        geometry: "ellipse",
        position: { left: x0 + step * i - (key ? 18 : 10), top: y - (key ? 18 : 10), width: key ? 36 : 20, height: key ? 36 : 20 },
        fill: key ? C.blue : C.white,
        line: { style: "solid", fill: C.blue, width: key ? 3 : 2 },
      });
      addText(slide, String(i + 1), { left: x0 + step * i - 28, top: y + 38, width: 56, height: 30 }, { fontSize: 22, bold: true, color: key ? C.blue : C.muted, alignment: "center" });
    }

    const moments = [
      { x: x0 - 155, heading: "launch", equation: "arrayStart", tex: "t(1)=0.0\\,\\mathrm{s}", desc: "initial condition", fill: C.paleBlue, color: C.blue },
      { x: x0 + step * 5 - 155, heading: "middle", equation: "arrayPeak", tex: "t(6)=2.0\\,\\mathrm{s}", desc: "at the peak", fill: C.paleGold, color: C.gold },
      { x: x0 + step * 10 - 155, heading: "end", equation: "arrayEnd", tex: "t(11)=4.0\\,\\mathrm{s}", desc: "near return", fill: C.paleValid, color: C.green },
    ];
    moments.forEach((m) => {
      addCard(slide, { left: m.x, top: 660, width: 310, height: 166 }, m.fill, m.color);
      addText(slide, m.heading, { left: m.x + 26, top: 682, width: 258, height: 36 }, { fontSize: 30, bold: true, color: m.color });
      addEquationAsset(slide, equationBytes[m.equation], { left: m.x + 26, top: 730, width: 258, height: 42 }, { name: `equation-${m.equation}`, assetKey: m.equation, tex: m.tex, foreground: m.color, alt: `LaTeX-rendered expression ${m.tex}` });
      addText(slide, m.desc, { left: m.x + 26, top: 782, width: 258, height: 32 }, { fontSize: 24, color: C.charcoal });
    });
    addText(slide, "The number in parentheses selects one physical moment from the array", { left: 115, top: 872, width: 1500, height: 42 }, { fontSize: 28, bold: true, color: C.navy });
    addSlideNumber(slide, 2);
    addNotes(slide, ["PHY4605 Lecture Slide Deck Design Specification", "PHY4605 Course Topic and Difficulty Blueprint", "OpenAI ImageGen; PHY4605 Matte Scientific Cutaway visual-only eleven-sample motion illustration aligned with the editable index rail; generated 2026-08-31", "LaTeX array-moment assets: `array-moment-start.tex`, `array-moment-peak.tex`, and `array-moment-end.tex`; rendered by `render-equations-diagrams`; transparent PNGs inserted in the three editable callout cards; matching SVG and TeX retained in `.agent/lecture-slide-system/assets/equations`"]);
  }

  // Slide 3 — T2 title and editable chart.
  {
    const slide = presentation.slides.add({ layout: "Content T2" });
    slide.background.fill = C.white;
    addTitle(slide, "A labelled plot turns values into evidence", "T2", "Axes, units, and shape must agree with the model");

    addCard(slide, { left: 115, top: 260, width: 420, height: 570 }, C.paleBlue, C.blue);
    addText(slide, "Before plotting", { left: 151, top: 298, width: 340, height: 44 }, { fontSize: 34, bold: true, color: C.navy });
    const predictionRows = [
      { label: "starts at", equation: "heightZero", tex: "y=0\\,\\mathrm{m}", alt: "LaTeX-rendered expression y equals zero metres", color: C.blue },
      { label: "rises to", text: "one maximum", color: C.gold },
      { label: "returns to", equation: "heightNearZero", tex: "y\\approx 0\\,\\mathrm{m}", alt: "LaTeX-rendered expression y is approximately zero metres", color: C.blue },
    ];
    predictionRows.forEach((row, i) => {
      addText(slide, row.label, { left: 151, top: 390 + i * 118, width: 170, height: 34 }, { fontSize: 26, color: C.charcoal });
      if (row.equation) {
        addEquationAsset(slide, equationBytes[row.equation], { left: 151, top: 428 + i * 118, width: 300, height: 48 }, { name: `equation-prediction-${i + 1}`, assetKey: row.equation, tex: row.tex, foreground: row.color, alt: row.alt });
      } else {
        addText(slide, row.text, { left: 151, top: 432 + i * 118, width: 300, height: 44 }, { fontSize: 32, bold: true, color: row.color });
      }
    });
    addPill(slide, "prediction first", { left: 151, top: 742, width: 250, height: 50 }, C.white, C.blue);

    slide.images.add({
      blob: heightTimeFigureBytes,
      contentType: "image/png",
      name: "matlab-height-time-figure",
      prompt: "MATLAB-generated numerical evidence; source and data retained under .agent/lecture-slide-system/assets/matlab-figures",
      alt: "MATLAB-generated height-versus-time plot for vertical motion with LaTeX-interpreted labels",
      fit: "contain",
      position: { left: 605, top: 250, width: 1130, height: 610 },
    });
    addText(slide, "Does the curve match all three predictions?", { left: 605, top: 872, width: 900, height: 44 }, { fontSize: 30, bold: true, color: C.navy });
    addSlideNumber(slide, 3);
    addNotes(slide, ["PHY4605 Lecture Slide Deck Design Specification", "Standard constant-acceleration kinematics; y(t) = 20t - 4.905t^2", "MATLAB figure `assets/matlab-figures/height_time_evidence.png`, generated by `source/generate_master_matlab_figures.m` from retained `height_time_evidence_data.mat` and `.csv`; title, axes, and all figure text use the LaTeX interpreter", "LaTeX equation assets: `height-zero.tex` and `height-near-zero.tex`; rendered by `render-equations-diagrams`; transparent PNGs inserted with editable explanatory labels; asset directory `.agent/lecture-slide-system/assets/equations`"]);
  }

  // Slide 4 — T3 title and visible validation.
  {
    const slide = presentation.slides.add({ layout: "Content T3" });
    slide.background.fill = C.white;
    addTitle(slide, "A boundary check can reveal an error\nthat a smooth curve hides", "T3", "Use a known condition before trusting the full result");

    addText(slide, "Known condition", { left: 115, top: 320, width: 560, height: 44 }, { fontSize: 34, bold: true, color: C.navy });
    slide.images.add({
      blob: launchBoundaryBytes,
      contentType: "image/png",
      name: "visual-launch-boundary",
      prompt: "Launch-boundary close-up with ball, ground, initial-velocity arrow, gravity arrow, no text",
      alt: "A ball on the ground at launch with an upward initial-velocity arrow and downward gravity arrow",
      fit: "contain",
      position: { left: 115, top: 375, width: 330, height: 355 },
    });
    addCard(slide, { left: 480, top: 390, width: 325, height: 330 }, C.paleBlue, C.blue);
    addText(slide, "At launch", { left: 515, top: 432, width: 255, height: 42 }, { fontSize: 32, bold: true, color: C.blue });
    addEquationAsset(slide, equationBytes.launchTime, { left: 515, top: 505, width: 255, height: 42 }, { name: "equation-launch-time", assetKey: "launchTime", tex: "t=0\\,\\mathrm{s}", foreground: C.navy, alt: "LaTeX-rendered expression t equals zero seconds" });
    addText(slide, "must give", { left: 515, top: 583, width: 255, height: 38 }, { fontSize: 26, color: C.charcoal });
    addEquationAsset(slide, equationBytes.heightZero, { left: 515, top: 628, width: 255, height: 48 }, { name: "equation-launch-height", assetKey: "heightZero", tex: "y=0\\,\\mathrm{m}", foreground: C.navy, alt: "LaTeX-rendered expression y equals zero metres" });

    addText(slide, "Computed result", { left: 930, top: 320, width: 560, height: 44 }, { fontSize: 34, bold: true, color: C.navy });
    addCard(slide, { left: 930, top: 390, width: 760, height: 330 }, C.paleValid, C.green);
    addEquationAsset(slide, equationBytes.computedFirstValue, { left: 975, top: 452, width: 520, height: 48 }, { name: "equation-computed-first-value", assetKey: "computedFirstValue", tex: "y(1)=0.000\\,\\mathrm{m}", foreground: C.green, alt: "LaTeX-rendered validation result y of one equals zero point zero zero zero metres", });
    addCheck(slide, 1580, 450);
    addText(slide, "The first array value satisfies the launch condition", { left: 975, top: 580, width: 640, height: 80 }, { fontSize: 30, color: C.charcoal });

    addCard(slide, { left: 115, top: 790, width: 1575, height: 110 }, C.paleGold, C.gold);
    addText(slide, "A smooth graph is not enough: test at least one value that physics already tells you", { left: 160, top: 822, width: 1480, height: 48 }, { fontSize: 32, bold: true, color: C.navy, alignment: "center" });
    addSlideNumber(slide, 4);
    addNotes(slide, ["PHY4605 Lecture Slide Deck Design Specification", "Standard initial-condition validation for vertical motion", "LaTeX display assets: `launch-time.tex`, `height-zero.tex`, and `computed-first-value.tex`; rendered by `render-equations-diagrams`; transparent PNGs inserted with alt text and matching SVG/TeX retained in `.agent/lecture-slide-system/assets/equations`", "OpenAI ImageGen; PHY4605 Matte Scientific Cutaway visual-only launch-boundary illustration; generated 2026-08-31"]);
  }

  // Slide 5 — body hierarchy.
  {
    const slide = presentation.slides.add({ layout: "Content T1" });
    slide.background.fill = C.white;
    addTitle(slide, "Names and units keep the model readable", "T1", "Translate each physical quantity before writing code");

    const rows = [
      { symbolAsset: "symbolT", symbolTex: "t", name: "time", code: "t", unitAsset: "unitS", unitTex: "\\mathrm{s}", unitWidth: 42, unitHeight: 17, unitTopOffset: 41, fill: C.paleBlue, color: C.blue },
      { symbolAsset: "symbolY", symbolTex: "y", name: "vertical position", code: "y", unitAsset: "unitM", unitTex: "\\mathrm{m}", unitWidth: 42, unitHeight: 17, unitTopOffset: 41, fill: C.paleValid, color: C.teal },
      { symbolAsset: "symbolV0", symbolTex: "v_0", name: "initial velocity", code: "v0", unitAsset: "unitMs1", unitTex: "\\mathrm{m\\,s^{-1}}", unitWidth: 160, unitHeight: 26, unitTopOffset: 36, fill: C.paleGold, color: C.gold },
      // symbol-g.{tex,svg,png} is rendered with --fg #C98A16 to match this row.
      { symbolAsset: "symbolG", symbolTex: "g", name: "gravitational acceleration", code: "g", unitAsset: "unitMs2", unitTex: "\\mathrm{m\\,s^{-2}}", unitWidth: 160, unitHeight: 26, unitTopOffset: 36, fill: C.paleGold, color: C.gold },
    ];
    const cols = [115, 315, 870, 1370];
    ["physics symbol", "meaning", "MATLAB name", "unit"].forEach((label, i) => {
      addText(slide, label, { left: cols[i], top: 266, width: i === 1 ? 490 : 340, height: 38 }, { fontSize: 24, bold: true, color: C.muted });
    });
    rows.forEach((row, i) => {
      const top = 330 + i * 128;
      slide.shapes.add({ geometry: "roundRect", position: { left: 115, top, width: 1575, height: 98 }, fill: row.fill, line: { style: "solid", fill: row.color, width: 2 }, borderRadius: "rounded-lg" });
      addEquationAsset(slide, equationBytes[row.symbolAsset], { left: 155, top: top + 22, width: 110, height: 48 }, { name: `equation-symbol-${i + 1}`, assetKey: row.symbolAsset, tex: row.symbolTex, foreground: row.color, alt: `LaTeX-rendered symbol ${row.symbolTex}` });
      addText(slide, row.name, { left: 315, top: top + 25, width: 490, height: 48 }, { fontSize: 30, color: C.charcoal });
      addText(slide, row.code, { left: 870, top: top + 23, width: 300, height: 50 }, { typeface: F.code, fontSize: 30, bold: true, color: C.navy });
      addEquationAsset(slide, equationBytes[row.unitAsset], { left: 1370, top: top + row.unitTopOffset, width: row.unitWidth, height: row.unitHeight }, { name: `equation-unit-${i + 1}`, assetKey: row.unitAsset, tex: row.unitTex, foreground: C.charcoal, alt: `LaTeX-rendered SI unit ${row.unitTex}` });
    });
    addText(slide, "Readable names reduce syntax mistakes and make unit checks easier", { left: 115, top: 872, width: 1500, height: 44 }, { fontSize: 30, bold: true, color: C.navy });
    addSlideNumber(slide, 5);
    addNotes(slide, ["PHY4605 Lecture Slide Deck Design Specification", "SI units for one-dimensional vertical motion", "LaTeX symbol/unit assets: `symbol-*.tex` and `unit-*.tex`; rendered by `render-equations-diagrams`; transparent PNGs inserted as display-math assets; SVG and TeX retained in `.agent/lecture-slide-system/assets/equations`"]);
  }

  // Slide 6 — pseudocode and code hierarchy.
  {
    const slide = presentation.slides.add({ layout: "Content T1" });
    slide.background.fill = C.white;
    addTitle(slide, "Short code should expose the physics", "T1");
    addText(slide, "The algorithm appears before the MATLAB syntax", { left: 115, top: 165, width: 1580, height: 50 }, { fontSize: 30, color: C.charcoal }, "subtitle-T1");

    addText(slide, "Plain-language algorithm", { left: 115, top: 260, width: 660, height: 46 }, { fontSize: 34, bold: true, color: C.navy });
    const steps = [
      "Choose the model parameters",
      "Create an array of times",
      "Calculate height at every time",
      "Plot height against time",
      "Check the launch value",
    ];
    steps.forEach((step, i) => {
      const top = 340 + i * 100;
      addPill(slide, String(i + 1), { left: 115, top, width: 54, height: 54 }, i === 4 ? C.paleValid : C.paleBlue, i === 4 ? C.green : C.blue);
      addText(slide, step, { left: 200, top: top + 8, width: 590, height: 46 }, { fontSize: 28, color: C.charcoal });
      if (i < steps.length - 1) addArrow(slide, { x: 142, y: top + 58 }, { x: 142, y: top + 92 }, C.rule, 2);
    });

    addCard(slide, { left: 900, top: 260, width: 790, height: 570 }, C.paleNavy, C.blue);
    addText(slide, "MATLAB", { left: 940, top: 294, width: 680, height: 40 }, { fontSize: 28, bold: true, color: C.blue });
    const code = [
      "% model parameters",
      "v0 = 20;       % m/s",
      "g  = 9.81;     % m/s^2",
      "",
      "% array of times",
      "t = linspace(0,4,11);",
      "",
      "% height at every time",
      "y = v0.*t - 0.5*g.*t.^2;",
      "",
      "plot(t,y,'LineWidth',2)",
      "y(1)            % boundary check",
    ].join("\n");
    addText(slide, code, { left: 940, top: 356, width: 690, height: 425 }, { typeface: F.code, fontSize: 26, color: C.navy, lineSpacing: 1.14 }, "code-sample");
    addText(slide, ".* and .^ apply the operation to every array element", { left: 115, top: 872, width: 1500, height: 44 }, { fontSize: 30, bold: true, color: C.navy });
    addSlideNumber(slide, 6);
    addNotes(slide, ["PHY4605 Lecture Slide Deck Design Specification", "MATLAB documentation: array operators and plot"]);
  }

  // Slide 7 — equation-to-meaning proof.
  {
    const slide = presentation.slides.add({ layout: "Content T1" });
    slide.background.fill = C.white;
    addTitle(slide, "The equation links each term to motion", "T1", "Read the model from left to right before evaluating it");

    // Display equations are deterministic LaTeX assets; explanatory labels remain editable.
    addEquationAsset(slide, equationBytes.position, { left: 610, top: 220, width: 700, height: 144 }, {
     name: "equation-position-model",
      assetKey: "position",
      tex: "y(t)=y_0+v_0t-\\frac{1}{2}gt^2",
      foreground: C.navy,
      alt: "LaTeX-rendered equation: y of t equals y subscript zero plus v subscript zero t minus one half g t squared",
    });

    slide.images.add({
      blob: equationMotionBytes,
      contentType: "image/png",
      name: "visual-equation-motion",
      prompt: "PHY4605 Matte Scientific Cutaway: a strictly one-dimensional vertical-motion y(t) time sequence with launch, rise, gold-highlighted peak, descent, and return; no horizontal trajectory or text",
      alt: "Five time snapshots of one ball at vertical positions: launch, rise, peak, descent, and return; each position has a vertical guide",
      fit: "contain",
      position: { left: 160, top: 370, width: 1480, height: 320 },
    });

    const terms = [
      { x: 115, equation: "termY0", tex: "y_0", head: "starting position", fill: C.paleNeutral, color: C.navy },
      { x: 525, equation: "termV0t", tex: "v_0t", head: "upward contribution", fill: C.paleBlue, color: C.blue },
      { x: 935, equation: "termGravity", tex: "-\\frac{1}{2}gt^2", equationTop: 688, equationHeight: 90, head: "gravity contribution", fill: C.paleGold, color: C.gold },
      { x: 1345, equation: "termPosition", tex: "y(t)", head: "predicted position", fill: C.paleValid, color: C.green },
    ];
    terms.forEach((term) => {
      addCard(slide, { left: term.x, top: 680, width: 350, height: 152 }, term.fill, term.color);
      addEquationAsset(slide, equationBytes[term.equation], { left: term.x + 24, top: term.equationTop || 712, width: 302, height: term.equationHeight || 48 }, { name: `equation-term-${term.equation}`, assetKey: term.equation, tex: term.tex, foreground: term.color, alt: `LaTeX-rendered equation term ${term.tex}` });
      addText(slide, term.head, { left: term.x + 24, top: 780, width: 302, height: 40 }, { fontSize: 24, bold: true, color: C.navy, alignment: "center", verticalAlignment: "middle" });
    });

    addCard(slide, { left: 260, top: 850, width: 1260, height: 76 }, C.paleValid, C.teal);
    addText(slide, "Unit check: every term on the right must have units of metres", { left: 305, top: 869, width: 1170, height: 42 }, { fontSize: 30, bold: true, color: C.teal, alignment: "center" });
    addSlideNumber(slide, 7);
    addNotes(slide, ["PHY4605 Lecture Slide Deck Design Specification", "Standard constant-acceleration kinematics equation", "LaTeX equation assets: `vertical-motion-position-equation.tex`, `term-y0.tex`, `term-v0t.tex`, `term-gravity.tex`, and `term-position.tex`; renderer `render-equations-diagrams`; transparent PNG fallback inserted after retaining matching SVG; foreground colours are encoded by semantic term role; target boxes use fit-contain; alt text attached; asset directory `.agent/lecture-slide-system/assets/equations`", "OpenAI ImageGen; PHY4605 Matte Scientific Cutaway visual-only strictly vertical y(t) time-sequence illustration, with no horizontal projectile path; generated 2026-08-31"]);
  }

  // Appendix slide — deferred until after the complete Core route.
  const addWorkingExposureAppendix = () => {
    const slide = presentation.slides.add({ layout: "Content T2" });
    slide.background.fill = C.white;
    addTitle(slide, "Working exposure: selected values", "T2", "Read a few model outputs before drawing the full graph");
    addText(slide, "For the same vertical-motion model, each selected time has one computed height.", { left: 115, top: 278, width: 1510, height: 44 }, { fontSize: 30, color: C.charcoal });
    const values = [
      { time: "0.0 s", height: "0.00 m", label: "launch", fill: C.paleBlue, color: C.blue },
      { time: "1.0 s", height: "15.10 m", label: "rising", fill: C.paleNeutral, color: C.navy },
      { time: "2.0 s", height: "20.38 m", label: "near the peak", fill: C.paleGold, color: C.gold },
      { time: "3.0 s", height: "15.86 m", label: "falling", fill: C.paleNeutral, color: C.navy },
      { time: "4.0 s", height: "1.52 m", label: "near return", fill: C.paleValid, color: C.teal },
    ];
    values.forEach((value, index) => {
      const left = 115 + index * 325;
      addCard(slide, { left, top: 390, width: 285, height: 290 }, value.fill, value.color);
      addText(slide, value.time, { left: left + 28, top: 432, width: 230, height: 44 }, { fontSize: 30, bold: true, color: value.color, alignment: "center" });
      addText(slide, value.height, { left: left + 28, top: 515, width: 230, height: 54 }, { fontSize: 34, bold: true, color: C.navy, alignment: "center" });
      addText(slide, value.label, { left: left + 28, top: 595, width: 230, height: 54 }, { fontSize: 24, color: C.charcoal, alignment: "center" });
    });
    addCard(slide, { left: 180, top: 760, width: 1420, height: 104 }, C.paleValid, C.teal);
    addText(slide, "Check the pattern: height rises, reaches one maximum, then falls toward the launch height.", { left: 225, top: 782, width: 1330, height: 60 }, { fontSize: 30, bold: true, color: C.teal, alignment: "center" });
    addSlideNumber(slide, 13);
    addNotes(slide, ["PHY4605 Lecture Slide Deck Design Specification", "Working exposure only: selected outputs from y(t) = 20t - 0.5(9.81)t^2 for t = 0, 1, 2, 3, 4 s. This is a logical/table support slide, not a parameter sweep."]);
  };

  // Slide 8 — Core recap checkpoint.
  {
    const slide = presentation.slides.add({ layout: "Content T1" });
    slide.background.fill = C.white;
    addTitle(slide, "Trace one model from physics to a graph", "T1", "Use the same reasoning chain every time you model");

    // Arrows first so they stay behind the nodes.
    [425, 820, 1215].forEach((x) => addArrow(slide, { x, y: 445 }, { x: x + 80, y: 445 }, C.rule, 3));
    const nodes = [
      { x: 115, no: "01", head: "Model", body: "question, direction,\nvariables, and units", fill: C.paleBlue, color: C.blue },
      { x: 510, no: "02", head: "Algorithm", body: "time array, calculate,\nplot, then check", fill: C.paleNeutral, color: C.navy },
      { x: 905, no: "03", head: "Code", body: "read the dots in .*\nand .^ before running", fill: C.paleGold, color: C.gold },
      { x: 1300, no: "04", head: "Evidence", body: "prediction, labelled plot,\nand launch-value check", fill: C.paleValid, color: C.green },
    ];
    nodes.forEach((node) => {
      addCard(slide, { left: node.x, top: 270, width: 330, height: 400 }, node.fill, node.color);
      addPill(slide, node.no, { left: node.x + 28, top: 300, width: 64, height: 46 }, C.white, node.color);
      addText(slide, node.head, { left: node.x + 28, top: 378, width: 275, height: 50 }, { fontSize: 34, bold: true, color: node.color });
      addText(slide, node.body, { left: node.x + 28, top: 465, width: 275, height: 165 }, { fontSize: 25, color: C.charcoal, lineSpacing: 1.18 });
    });

    addCard(slide, { left: 115, top: 740, width: 1575, height: 118 }, C.paleNeutral, C.navy);
    addText(slide, "Checkpoint: which step would help you find a wrong sign in the model?", { left: 160, top: 774, width: 1485, height: 70 }, { fontSize: 32, bold: true, color: C.navy, alignment: "center" });
    addSlideNumber(slide, 8);
    addNotes(slide, ["PHY4605 Course Topic and Difficulty Blueprint", "PHY4605 Week 01 content manifest"]);
  }

  // Slide 9 — explicit array construction and indexing Core repair.
  {
    const slide = presentation.slides.add({ layout: "Content T1" });
    slide.background.fill = C.white;
    addTitle(slide, "Build the time array first", "T1", "The model needs one time value for each computed height");
    addCard(slide, { left: 115, top: 285, width: 720, height: 420 }, C.paleBlue, C.blue);
    addText(slide, "Two ways to make 41 samples", { left: 155, top: 325, width: 620, height: 60 }, { fontSize: 34, bold: true, color: C.navy });
    addText(slide, "t_s = 0:0.1:4;", { left: 165, top: 420, width: 580, height: 60 }, { typeface: F.code, fontSize: 34, bold: true, color: C.navy });
    addText(slide, "or", { left: 165, top: 510, width: 100, height: 44 }, { fontSize: 28, color: C.muted });
    addText(slide, "t_s = linspace(0,4,41);", { left: 165, top: 580, width: 610, height: 60 }, { typeface: F.code, fontSize: 34, bold: true, color: C.navy });
    addCard(slide, { left: 930, top: 285, width: 760, height: 420 }, C.paleValid, C.green);
    addText(slide, "Read one indexed value", { left: 970, top: 325, width: 650, height: 48 }, { fontSize: 34, bold: true, color: C.green });
    addText(slide, "length(t_s)     % 41", { left: 980, top: 430, width: 610, height: 52 }, { typeface: F.code, fontSize: 30, color: C.navy });
    addText(slide, "t_s(11)         % 1.0 s", { left: 980, top: 540, width: 610, height: 52 }, { typeface: F.code, fontSize: 30, color: C.navy });
    addText(slide, "MATLAB indices start at 1: t_s(1) is the launch time", { left: 115, top: 800, width: 1500, height: 48 }, { fontSize: 32, bold: true, color: C.navy });
    addSlideNumber(slide, 9);
    addNotes(slide, ["PHY4605 Week 01 content manifest", "MATLAB documentation: colon operator, linspace, and array indexing"]);
  }

  // Slide 10 — element-wise operator diagnosis Core repair.
  {
    const slide = presentation.slides.add({ layout: "Content T1" });
    slide.background.fill = C.white;
    addTitle(slide, "Dots tell MATLAB to work through an array", "T1", "Use element-wise operators when time contains many values");
    const examples = [
      { x: 115, head: "scalar arithmetic", code: "20 * 3", result: "one number", fill: C.paleNeutral, color: C.navy },
      { x: 560, head: "every time value", code: "v0_mps .* t_s", result: "one value for every time", fill: C.paleBlue, color: C.blue },
      { x: 1005, head: "array square", code: "t_s.^2", result: "every time value squared", fill: C.paleGold, color: C.gold },
    ];
    examples.forEach((item) => {
      addCard(slide, { left: item.x, top: 320, width: 390, height: 330 }, item.fill, item.color);
      addText(slide, item.head, { left: item.x + 30, top: 365, width: 330, height: 44 }, { fontSize: 30, bold: true, color: item.color });
      addText(slide, item.code, { left: item.x + 30, top: 470, width: 330, height: 58 }, { typeface: F.code, fontSize: 30, bold: true, color: C.navy });
      addText(slide, item.result, { left: item.x + 30, top: 565, width: 330, height: 52 }, { fontSize: 25, color: C.charcoal });
    });
    addCard(slide, { left: 115, top: 760, width: 1575, height: 100 }, C.paleGold, C.gold);
    addText(slide, "Checkpoint: explain why the model line contains .* and .^", { left: 155, top: 790, width: 1495, height: 42 }, { fontSize: 32, bold: true, color: C.gold, alignment: "center" });
    addSlideNumber(slide, 10);
    addNotes(slide, ["PHY4605 Course Topic and Difficulty Blueprint", "MATLAB documentation: array vs matrix operations"]);
  }

  // Slide 11 — bounded code trace and graph interpretation.
  {
    const slide = presentation.slides.add({ layout: "Content T1" });
    slide.background.fill = C.white;
    addTitle(slide, "Run the model, then read the graph", "T1", "Prediction comes before the plot; a known value checks the result");
    addCard(slide, { left: 115, top: 270, width: 760, height: 555 }, C.paleNavy, C.blue);
    addText(slide, "Trace this short fragment", { left: 155, top: 310, width: 650, height: 44 }, { fontSize: 34, bold: true, color: C.blue });
    addText(slide, ["t_s = 0:0.1:4;", "y_m = 20.*t_s - 0.5*9.81*t_s.^2;", "plot(t_s,y_m,'LineWidth',2)", "xlabel('Time (s)')", "ylabel('Vertical position (m)')", "assert(abs(y_m(1)) < 1e-12)"].join("\n"), { left: 155, top: 395, width: 660, height: 340 }, { typeface: F.code, fontSize: 25, color: C.navy, lineSpacing: 1.22 });
    slide.images.add({ blob: await fs.readFile(path.join(MATLAB_FIGURES_DIR, "week01_height_time.png")), contentType: "image/png", name: "week01-matlab-plot", prompt: "MATLAB-generated numerical evidence", alt: "MATLAB height-versus-time graph for the Week 1 vertical-motion model", fit: "contain", position: { left: 955, top: 255, width: 730, height: 520 } });
    addText(slide, "Prediction: rise, one peak, then fall. Check: y_m(1) = 0 m", { left: 115, top: 860, width: 1520, height: 42 }, { fontSize: 30, bold: true, color: C.navy });
    addSlideNumber(slide, 11);
    addNotes(slide, ["PHY4605 Week 01 content manifest", "MATLAB figure generated by Week01/.agent/matlab/generate_week01_plot.m from retained MAT and CSV data"]);
  }

  // Slide 12 — student-facing exit ticket.
  {
    const slide = presentation.slides.add({ layout: "Content T1" });
    slide.background.fill = C.white;
    addTitle(slide, "Week 1 exit ticket", "T1", "Use the same ball model and answer in one or two sentences");
    const prompts = [
      "Name the output variable and its unit",
      "What does t_s(11) select?",
      "Which operator lets MATLAB square every value in t_s?",
      "State one prediction for the graph and one value you can validate",
    ];
    prompts.forEach((prompt, i) => {
      const top = 270 + i * 135;
      addPill(slide, String(i + 1), { left: 125, top, width: 58, height: 58 }, C.paleBlue, C.blue);
      addText(slide, prompt, { left: 220, top: top + 6, width: 1370, height: 64 }, { fontSize: 32, color: C.charcoal });
      if (i < prompts.length - 1) slide.shapes.add({ geometry: "line", position: { left: 220, top: top + 92, width: 1370, height: 0 }, line: { style: "solid", fill: C.grid, width: 2 }, fill: "none" });
    });
    addCard(slide, { left: 115, top: 850, width: 1575, height: 88 }, C.paleValid, C.green);
    addText(slide, "Next time: turn the same physical model into a traceable algorithm", { left: 155, top: 875, width: 1495, height: 40 }, { fontSize: 30, bold: true, color: C.green, alignment: "center" });
    addSlideNumber(slide, 12);
    addNotes(slide, ["PHY4605 Course Topic and Difficulty Blueprint", "Week 02 connection: pseudocode, loops, and debugging"]);
  }

  // Working exposure begins only after the complete 12-slide Core route.
  addWorkingExposureAppendix();

  const layoutSummary = {
    masters: presentation.masters.items.map((item) => ({ id: item.id, name: item.name })),
    layouts: presentation.layouts.items.map((item) => ({ id: item.id, name: item.name })),
    slides: presentation.slides.items.length,
  };
  await fs.writeFile(path.join(QA, "master-layout-summary.json"), JSON.stringify(layoutSummary, null, 2));

  for (const [index, slide] of presentation.slides.items.entries()) {
    const stem = `slide-${String(index + 1).padStart(2, "0")}`;
    await writeBlob(path.join(QA, `${stem}.png`), await presentation.export({ slide, format: "png", scale: 1 }));
    const layout = await slide.export({ format: "layout" });
    await fs.writeFile(path.join(QA, `${stem}.layout.json`), await layout.text());
  }

  await writeBlob(path.join(QA, "master-proof-montage.webp"), await presentation.export({ format: "webp", montage: true, scale: 1 }));
  const inspection = await presentation.inspect({ kind: "slide,textbox,shape,image,chart,notes,layout", maxChars: 100000 });
  await fs.writeFile(path.join(QA, "master-proof-inspect.ndjson"), inspection.ndjson);

  const pptx = await PresentationFile.exportPptx(presentation);
  await pptx.save(OUTPUT);
  await repairExportedPptx(OUTPUT);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
