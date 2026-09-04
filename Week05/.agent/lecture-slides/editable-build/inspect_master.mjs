import fs from "node:fs/promises";
import { FileBlob, PresentationFile } from "@oai/artifact-tool";

const masterPath = "/Users/khairuladib/MATLAB-Drive/Kuliah/computational-physics-course/.agent/lecture-slide-system/masters/PHY4605_Editable_Slide_Master.pptx";
const outDir = "/Users/khairuladib/MATLAB-Drive/Kuliah/computational-physics-course/Week05/.agent/lecture-slides/editable-build/inspect";
await fs.mkdir(outDir, { recursive: true });
const presentation = await PresentationFile.importPptx(await FileBlob.load(masterPath));
const snapshot = await presentation.inspect({
  kind: "slide,layout,master,textbox,shape,image,table,chart,notes",
  maxChars: 120000,
});
await fs.writeFile(`${outDir}/master-inspect.ndjson`, snapshot.ndjson ?? String(snapshot));
const help = presentation.help("*", {
  search: "delete remove duplicate slide collection",
  include: ["index", "examples", "notes"],
  maxChars: 20000,
});
await fs.writeFile(`${outDir}/master-help.txt`, JSON.stringify(help, null, 2));
const proto = presentation.toProto();
await fs.writeFile(`${outDir}/master-proto.json`, JSON.stringify(proto, null, 2));
const summary = {
  slides: presentation.slides.items.length,
  layouts: presentation.layouts.items.map((layout) => ({ id: layout.id, name: layout.name, parentLayoutId: layout.parentLayoutId })),
  masters: presentation.masters.items.map((master) => ({ id: master.id, name: master.name })),
};
await fs.writeFile(`${outDir}/master-summary.json`, JSON.stringify(summary, null, 2));
const api = {
  slideCollectionKeys: Object.keys(presentation.slides),
  slideCollectionProto: Object.getOwnPropertyNames(Object.getPrototypeOf(presentation.slides)),
  slideProto: Object.getOwnPropertyNames(Object.getPrototypeOf(presentation.slides.items[0])),
  layoutProto: Object.getOwnPropertyNames(Object.getPrototypeOf(presentation.layouts.items[0])),
};
await fs.writeFile(`${outDir}/master-api.json`, JSON.stringify(api, null, 2));
console.log(JSON.stringify(summary, null, 2));
