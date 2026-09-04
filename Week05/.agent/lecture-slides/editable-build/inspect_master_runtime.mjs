import { FileBlob, PresentationFile } from "@oai/artifact-tool";

const source = "/Users/khairuladib/MATLAB-Drive/Kuliah/computational-physics-course/.agent/lecture-slide-system/masters/PHY4605_Editable_Slide_Master.pptx";
const presentation = await PresentationFile.importPptx(await FileBlob.load(source));
const result = await presentation.inspect({
  kind: "slide,textbox,shape,image,table,chart,notes,layout",
  include: "id,slide,name,title,text,textPreview,bbox,bboxUnit,preview,alt,isPlaceholder,placeholders",
  maxChars: 250000,
});
console.log(result.ndjson);
