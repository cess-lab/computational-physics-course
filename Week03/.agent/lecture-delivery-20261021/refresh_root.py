from pathlib import Path
import json
root=Path(__file__).resolve().parent/'remotion-studio'
data=json.loads((root/'src'/'chapters.json').read_text())
imports="\n".join(f"import {{Slide{i:02}}} from './Slide{i:02}';" for i in range(1,16))
lines=["import React from 'react';", "import {Composition, Folder, Series, useVideoConfig} from 'remotion';", imports]
for name,field in [('Classroom90','classFrames'),('NarrationOnly','rehearsalFrames')]:
 lines += [f'const {name}: React.FC = () => {{', 'const {fps} = useVideoConfig();', 'return <Series>;'.replace(';','')]
 for c in data:
  i=c['slide']; lines.append(f'<Series.Sequence name="Slide {i:02}" durationInFrames={{{c[field]}}} premountFor={{fps}}><Slide{i:02}/></Series.Sequence>')
 lines += ['</Series>;', '};']
lines+=['export const RemotionRoot: React.FC = () => <>',f'<Composition id="Classroom90" component={{Classroom90}} width={{1920}} height={{1080}} fps={{30}} durationInFrames={{{sum(c["classFrames"] for c in data)}}}/>', f'<Composition id="NarrationOnly" component={{NarrationOnly}} width={{1920}} height={{1080}} fps={{30}} durationInFrames={{{sum(c["rehearsalFrames"] for c in data)}}}/>', '<Folder name="Slide-chapters">']
for c in data:
 i=c['slide']; lines.append(f'<Composition id="Slide{i:02}" component={{Slide{i:02}}} width={{1920}} height={{1080}} fps={{30}} durationInFrames={{{c["rehearsalFrames"]}}}/>')
lines+=['</Folder></>;']
(root/'src'/'Root.tsx').write_text('\n'.join(lines)+'\n')
