import { FileBlob, PresentationFile } from "@oai/artifact-tool";
const masterPath = "/Users/khairuladib/MATLAB-Drive/Kuliah/computational-physics-course/.agent/lecture-slide-system/masters/PHY4605_Editable_Slide_Master.pptx";
const presentation = await PresentationFile.importPptx(await FileBlob.load(masterPath));
function protoKeys(value) {
  const keys = new Set();
  let current = value;
  while (current && current !== Object.prototype) {
    for (const key of Object.getOwnPropertyNames(current)) keys.add(key);
    current = Object.getPrototypeOf(current);
  }
  return [...keys].sort();
}
console.log(JSON.stringify({
  presentation: protoKeys(presentation),
  slides: protoKeys(presentation.slides),
  firstSlide: protoKeys(presentation.slides.items[0]),
  shapes: protoKeys(presentation.slides.items[0].shapes),
  layouts: protoKeys(presentation.layouts),
}, null, 2));
