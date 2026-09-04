import { FileBlob, PresentationFile } from "@oai/artifact-tool";
const source = "/Users/khairuladib/MATLAB-Drive/Kuliah/computational-physics-course/Week05/.agent/lecture-slides/editable-build/template-starter.pptx";
const p = await PresentationFile.importPptx(await FileBlob.load(source));
const img = p.slides.items[0].images.items[0];
const keys = new Set(); let cur = img; while (cur && cur !== Object.prototype) { Object.getOwnPropertyNames(cur).forEach((k) => keys.add(k)); cur = Object.getPrototypeOf(cur); }
console.log(JSON.stringify({keys:[...keys].sort(), proto:img.toProto?.()},null,2));
