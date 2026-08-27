const fs = require('node:fs');
const path = require('node:path');
const pptxgen = require('pptxgenjs');

// Raster-only Week 1 deck builder.
// ImageGen creates every visible slide element; this script only places one
// full-slide image and stores non-visible speaker notes on each slide.

const here = __dirname;
const packageRoot = path.resolve(here, '..', '..');
const specsPath = path.join(here, 'slide_specs.json');
const specs = JSON.parse(fs.readFileSync(specsPath, 'utf8'));
const outPath = path.join(packageRoot, 'Lecture_Slides_Week01.pptx');

const pptx = new pptxgen();
pptx.layout = 'LAYOUT_WIDE';
pptx.author = 'Computational Methods in Physics';
pptx.company = 'Universiti Putra Malaysia';
pptx.subject = 'PHY4605 Week 1 lecture';
pptx.title = specs.deck.title;
pptx.lang = 'en-US';
pptx.theme = {
  headFontFace: 'Aptos Display',
  bodyFontFace: 'Aptos',
  lang: 'en-US'
};

// 12192000 EMU / 914400 = 13.333333333... in; keep the image edge exact.
const W = 13.333333333333334;
const H = 7.5;

function notesFor(slideSpec) {
  return [
    `Timing: ${slideSpec.notes.timing}`,
    `Checkpoint/question: ${slideSpec.notes.checkpoint}`,
    `Transition: ${slideSpec.notes.transition}`
  ].join('\n');
}

for (const slideSpec of specs.slides) {
  const slide = pptx.addSlide();
  const imagePath = path.join(here, 'raster', `slide-${String(slideSpec.number).padStart(2, '0')}.png`);
  if (!fs.existsSync(imagePath)) {
    throw new Error(`Missing raster asset for slide ${slideSpec.number}: ${imagePath}`);
  }
  slide.addImage({
    path: imagePath,
    x: 0,
    y: 0,
    w: W,
    h: H
  });
  slide.addNotes(notesFor(slideSpec));
}

pptx.writeFile({ fileName: outPath })
  .then(() => console.log(`Wrote ${outPath}`))
  .catch(error => {
    console.error(error);
    process.exitCode = 1;
  });
