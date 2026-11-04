from pathlib import Path
import json,shutil,subprocess
root=Path(__file__).resolve().parent
studio=root/'remotion-studio'
slides=root/'remotion'/'public'/'slides'
shutil.copytree(slides,studio/'public'/'slides',dirs_exist_ok=True)
data=json.loads((root/'chapters.json').read_text())
code={
7:('A_ohm = [3 -1; -1 4];   b_V = [5; 2];\nx_A = A_ohm\\b_V;\nI1_A = x_A(1);   I2_A = x_A(2);','Expected: I1 = 2 A; I2 = 1 A'),
8:('Ishared_A = I1_A - I2_A;','Expected: 1 A in the downward reference direction'),
9:('left_V  = (R1_ohm + Rs_ohm)*I1_A - Rs_ohm*I2_A;\nright_V = -Rs_ohm*I1_A + (R2_ohm + Rs_ohm)*I2_A;','Expected: left = 5 V; right = 2 V; differences ≈ 0 V'),
11:('A_wrong_sign_ohm = [3 1; -1 4];\nx_wrong_sign_A = A_wrong_sign_ohm\\b_V;\nwrong_model_difference_V = A_ohm*x_wrong_sign_A - b_V;','Correct-equation mismatch: [−1.69230769; 0] V'),
14:('x_reordered_A = A_ohm([2 1],:)\\b_V([2 1]);\nx_perturbed_A = A_ohm\\[5; 2.1];','Same row-reordered solution; new input gives [2.00909; 1.02727] A')}
for c in data:
 c['code'],c['result']=code.get(c['slide'],('',c['answer']))
 c['durationSeconds']=c.get('durationSeconds',max(30,len(c['speech'].split())/2.4))
 c['rehearsalFrames']=round((c['durationSeconds']+2)*30)
 c['classFrames']=c['minutes']*60*30
(studio/'src'/'chapters.json').write_text(json.dumps(data,ensure_ascii=False,indent=2))
(studio/'src'/'SlideScene.tsx').write_text('''import React from 'react';
import {AbsoluteFill, CanvasImage, Sequence, staticFile, useCurrentFrame, useVideoConfig, interpolate} from 'remotion';
import {Audio} from '@remotion/media';
import {Underline} from '@remotion/rough-notation';
import chapters from './chapters.json';

export const SlideScene: React.FC<{index: number}> = ({index}) => {
 const c = chapters[index];
 const frame = useCurrentFrame();
 const {fps} = useVideoConfig();
 const speaking = frame < Math.ceil(c.durationSeconds * fps);
 const stage = Math.min(c.rects.length - 1, Math.floor(frame / Math.max(1,c.durationSeconds*fps/c.rects.length)));
 const rect = c.rects[stage];
 const stageStart = stage*c.durationSeconds*fps/c.rects.length;
 const color = c.slide === 11 ? '#e3a49e' : c.slide === 9 ? '#98c6ad' : '#d8b76c';
 return <AbsoluteFill style={{backgroundColor:'#142b3e',color:'#f8faf9',fontFamily:'Arial, sans-serif'}}>
   <CanvasImage src={staticFile(`slides/slide-${String(c.slide).padStart(2,'0')}.png`)} premountFor={fps}
      style={{position:'absolute',left:24,top:24,width:1536,height:864,objectFit:'contain'}} />
   <div style={{position:'absolute',left:24+rect[0]*1536,top:24+rect[1]*864,width:rect[2]*1536,height:rect[3]*864,
     border:`4px solid ${color}`,borderRadius:8,pointerEvents:'none',
     opacity:interpolate(frame-stageStart,[0,fps],[0,1],{extrapolateLeft:'clamp',extrapolateRight:'clamp'})}} />
   <div style={{position:'absolute',left:1590,top:38,width:300}}>
    <div style={{fontSize:26,color,marginBottom:26}}>{c.slide===12 || c.slide===13 ? 'OPTIONAL EXPOSURE' : 'FOLLOW THE REASONING'}</div>
    <div style={{fontSize:34,lineHeight:1.3,fontWeight:600}}>
      <Underline color={color} strokeWidth={2} progress={interpolate(frame,[0,1.3*fps],[0,1],{extrapolateRight:'clamp'})}>{c.focus}</Underline>
    </div>
    <div style={{height:2,backgroundColor:'#456077',margin:'34px 0'}} />
    <div style={{fontSize:25,color:'#b9d0de',marginBottom:16}}>{speaking?'THINK BEFORE THE REVEAL':'DISCUSS / TRY IN MATLAB'}</div>
    <div style={{fontSize:29,lineHeight:1.38}}>{c.prompt}</div>
    {!speaking && <div style={{fontSize:25,lineHeight:1.4,color:'#d8b76c',marginTop:30}}>Pause here for your response.</div>}
   </div>
   <div style={{position:'absolute',left:30,top:918,width:1860,height:140,borderTop:'2px solid #456077',paddingTop:18,display:'flex',gap:36}}>
    {c.code ? <>
      <pre style={{fontFamily:'Menlo, monospace',fontSize:26,lineHeight:1.42,margin:0,width:1190,color:'#e3edf2',whiteSpace:'pre-wrap'}}>{c.code}</pre>
      <div style={{fontSize:27,lineHeight:1.3,width:620,color:'#a9d7bb'}}>Verified reference\n{c.result}</div>
    </> : <>
      <div style={{fontSize:29,width:250,color}}>MODEL → CHECK</div>
      <div style={{fontSize:31,lineHeight:1.35,width:1550}}>{c.slide===15?'State the model and units. Trace a coefficient. Substitute. Interpret the sign.':c.focus}</div>
    </>}
   </div>
   {c.audioReady && <Sequence durationInFrames={Math.ceil(c.durationSeconds*fps)} premountFor={fps} name="AI narration">
     <Audio src={staticFile(`audio/slide-${String(c.slide).padStart(2,'0')}.mp3`)} premountFor={fps}/>
   </Sequence>}
 </AbsoluteFill>;
};
''')
for c in data:
 i=c['slide']; (studio/'src'/f'Slide{i:02}.tsx').write_text(f"import React from 'react';\nimport {{SlideScene}} from './SlideScene';\nexport const Slide{i:02}: React.FC = () => <SlideScene index={{{i-1}}}/>;\n")
(root/'refresh_root.py').write_text('''from pathlib import Path
import json
root=Path(__file__).resolve().parent/'remotion-studio'
data=json.loads((root/'src'/'chapters.json').read_text())
imports="\\n".join(f"import {{Slide{i:02}}} from './Slide{i:02}';" for i in range(1,16))
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
(root/'src'/'Root.tsx').write_text('\\n'.join(lines)+'\\n')
''')
subprocess.run(['python3',str(root/'refresh_root.py')],check=True)
print('Created slide scenes, authored timelines and 17 compositions')
