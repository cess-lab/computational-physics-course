const fs = require('node:fs');
const path = require('node:path');
const pptxgen = require('pptxgenjs');

const here = __dirname;
const packageRoot = path.resolve(here, '..', '..');
const specs = JSON.parse(fs.readFileSync(path.join(here, 'slide_specs.json'), 'utf8'));
const outPath = path.join(packageRoot, 'Lecture_Slides_Week02.pptx');

const pptx = new pptxgen();
pptx.layout = 'LAYOUT_WIDE';
pptx.author = 'Computational Methods in Physics';
pptx.company = 'Universiti Putra Malaysia';
pptx.subject = 'PHY4605 Week 2 lecture';
pptx.title = specs.deck.title;
pptx.lang = 'en-US';

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
  slide.addImage({ path: imagePath, x: 0, y: 0, w: W, h: H });
  slide.addNotes(notesFor(slideSpec));
}

pptx.writeFile({ fileName: outPath })
  .then(() => console.log(`Wrote ${outPath}`))
  .catch(error => {
    console.error(error);
    process.exitCode = 1;
  });
