import { FileBlob, PresentationFile } from "@oai/artifact-tool";
const source = "/Users/khairuladib/MATLAB-Drive/Kuliah/computational-physics-course/Week05/.agent/lecture-slides/editable-build/template-starter.pptx";
const p = await PresentationFile.importPptx(await FileBlob.load(source));
const slide = p.slides.items[1];
function protoKeys(value) {
  const out = new Set(); let current = value;
  while (current && current !== Object.prototype) { Object.getOwnPropertyNames(current).forEach((k) => out.add(k)); current = Object.getPrototypeOf(current); }
  return [...out].sort();
}
console.log(JSON.stringify({ images: protoKeys(slide.images), tables: protoKeys(slide.tables), charts: protoKeys(slide.charts), elements: protoKeys(slide.elements) }, null, 2));
