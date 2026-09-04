import { FileBlob, PresentationFile } from "@oai/artifact-tool";

const master = "/Users/khairuladib/MATLAB-Drive/Kuliah/computational-physics-course/.agent/lecture-slide-system/masters/PHY4605_Editable_Slide_Master.pptx";
const presentation = await PresentationFile.importPptx(await FileBlob.load(master));
const inspection = await presentation.inspect({ kind: "slide,layout", maxChars: 12000 });
console.log(inspection.ndjson);
