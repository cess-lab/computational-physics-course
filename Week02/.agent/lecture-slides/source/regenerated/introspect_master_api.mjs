import { FileBlob, PresentationFile } from "@oai/artifact-tool";

const p = await PresentationFile.importPptx(await FileBlob.load("/Users/khairuladib/MATLAB-Drive/Kuliah/computational-physics-course/.agent/lecture-slide-system/masters/PHY4605_Editable_Slide_Master.pptx"));
const slide = p.slides.items[0];
console.log(JSON.stringify({
  slides: Object.getOwnPropertyNames(Object.getPrototypeOf(p.slides)),
  slide: Object.getOwnPropertyNames(Object.getPrototypeOf(slide)),
  shapes: Object.getOwnPropertyNames(Object.getPrototypeOf(slide.shapes)),
}, null, 2));
