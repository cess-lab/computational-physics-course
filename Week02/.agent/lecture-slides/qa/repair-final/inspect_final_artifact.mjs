import fs from 'node:fs/promises';
import { FileBlob, PresentationFile } from '@oai/artifact-tool';

const deck = '/Users/khairuladib/MATLAB-Drive/Kuliah/computational-physics-course/Week02/Lecture_Slides_Week02.pptx';
const output = '/Users/khairuladib/MATLAB-Drive/Kuliah/computational-physics-course/Week02/.agent/lecture-slides/qa/repair-final/artifact-inspect.ndjson';
const presentation = await PresentationFile.importPptx(await FileBlob.load(deck));
const snapshot = await presentation.inspect({
  kind: 'deck,slide,textbox,shape,image,notes',
  include: 'id,slide,name,textPreview,bbox,alt',
  maxChars: 24000,
});
await fs.writeFile(output, snapshot.ndjson + '\n');
