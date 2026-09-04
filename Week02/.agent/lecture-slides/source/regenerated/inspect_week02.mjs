import { Presentation } from "@oai/artifact-tool";

const presentation = await Presentation.load(
  "/Users/khairuladib/MATLAB-Drive/Kuliah/computational-physics-course/Week02/Lecture_Slides_Week02.pptx",
);
const inspection = await presentation.inspect({
  kind: "slide,textbox,shape,image,notes,layout",
  maxChars: 60000,
});
console.log(inspection.ndjson);
