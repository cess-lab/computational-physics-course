import { FileBlob, PresentationFile } from "@oai/artifact-tool";
const masterPath = "/Users/khairuladib/MATLAB-Drive/Kuliah/computational-physics-course/.agent/lecture-slide-system/masters/PHY4605_Editable_Slide_Master.pptx";
const presentation = await PresentationFile.importPptx(await FileBlob.load(masterPath));
const slide = presentation.slides.items[1];
const keys = (value) => {
  const out = new Set();
  let current = value;
  while (current && current !== Object.prototype) {
    Object.getOwnPropertyNames(current).forEach((k) => out.add(k));
    current = Object.getPrototypeOf(current);
  }
  return [...out].sort();
};
console.log(JSON.stringify({
  placeholderKeys: keys(slide.placeholders),
  summary: slide.placeholders.summary(),
  title: slide.placeholders.getItem("title")?.toProto?.() ?? null,
  subtitle: slide.placeholders.getItem("subtitle")?.toProto?.() ?? null,
  slideNumber: slide.placeholders.getItem("slideNumber")?.toProto?.() ?? null,
}, null, 2));
