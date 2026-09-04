import { FileBlob, PresentationFile } from "@oai/artifact-tool";
const masterPath = "/Users/khairuladib/MATLAB-Drive/Kuliah/computational-physics-course/.agent/lecture-slide-system/masters/PHY4605_Editable_Slide_Master.pptx";
const presentation = await PresentationFile.importPptx(await FileBlob.load(masterPath));
const slide = presentation.slides.items[0];
const names = ["title", "subtitle", "body", "slideNumber"];
const out = {};
for (const name of names) {
  try {
    const item = slide.placeholders.getItem(name);
    out[name] = { proto: item?.toProto?.() ?? null, keys: item ? Object.getOwnPropertyNames(Object.getPrototypeOf(item)) : [] };
  } catch (error) {
    out[name] = { error: String(error) };
  }
}
console.log(JSON.stringify({summary: slide.placeholders.summary(), out}, null, 2));
