import React from 'react';
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
   {c.slide===4 && <div style={{position:'absolute',left:652,top:598,width:452,height:202,boxSizing:'border-box',padding:20,backgroundColor:'#edf4fa',borderRadius:12,color:'#18354b'}}>
     <div style={{fontSize:25,fontWeight:600,marginBottom:14}}>Keep both vectors as columns</div>
     <pre style={{fontSize:27,lineHeight:1.45,fontFamily:'Menlo, monospace',margin:0}}>x = [I1; I2]  A{'\n'}b = [V1; V2]  V</pre>
     <div style={{fontSize:24,marginTop:12}}>Row 1: left loop · Row 2: right loop</div>
   </div>}
   {c.slide===14 && <div style={{position:'absolute',left:48,top:176,width:744,height:510,boxSizing:'border-box',padding:28,backgroundColor:'#fffdf5',border:'3px solid #c4a35f',borderRadius:16,color:'#18354b'}}>
     <div style={{fontSize:32,fontWeight:700,marginBottom:10}}>Corrected: reorder equation rows</div>
     <div style={{fontSize:25,marginBottom:14}}>Swap rows of A and entries of b together.</div>
     <pre style={{fontSize:32,lineHeight:1.45,fontFamily:'Menlo, monospace',margin:'0 0 12px'}}>A = [ 3  -1]    b = [5]{'\n'}    [-1   4]        [2]</pre>
     <div style={{fontSize:27,color:'#96752f',marginBottom:12}}>↓ Row 2 first; row 1 second</div>
     <pre style={{fontSize:32,lineHeight:1.45,fontFamily:'Menlo, monospace',margin:0}}>Aᵣ = [-1   4]   bᵣ = [2]{'\n'}     [ 3  -1]        [5]</pre>
     <div style={{fontSize:28,color:'#29654d',marginTop:18}}>Keep x = [I1; I2]. Both solves give [2; 1] A.</div>
   </div>}
   <div style={{position:'absolute',left:24+rect[0]*1536,top:24+rect[1]*864,width:rect[2]*1536,height:rect[3]*864,
     border:`4px solid ${color}`,borderRadius:8,pointerEvents:'none',
     opacity:interpolate(frame-stageStart,[0,fps],[0,1],{extrapolateLeft:'clamp',extrapolateRight:'clamp'})}} />
   <div style={{position:'absolute',left:1590,top:38,width:300}}>
    <div style={{fontSize:26,color,marginBottom:26}}><Underline color={color} strokeWidth={2} progress={interpolate(frame,[0,1.3*fps],[0,1],{extrapolateRight:'clamp'})}>Key idea</Underline>{(c.slide===12 || c.slide===13) && <div style={{marginTop:12,fontSize:22}}>Optional exposure</div>}</div>
    <div style={{fontSize:31,lineHeight:1.3,fontWeight:600,overflowWrap:'anywhere'}}>
      {c.focus}
    </div>
    <div style={{height:2,backgroundColor:'#456077',margin:'34px 0'}} />
    <div style={{fontSize:25,color:'#b9d0de',marginBottom:16}}>{speaking?'THINK BEFORE THE REVEAL':'DISCUSS / TRY IN MATLAB'}</div>
    <div style={{fontSize:29,lineHeight:1.38}}>{c.prompt}</div>
    {!speaking && <div style={{fontSize:25,lineHeight:1.4,color:'#d8b76c',marginTop:30}}>Pause here for your response.</div>}
   </div>
   <div style={{position:'absolute',left:30,top:918,width:1860,height:140,borderTop:'2px solid #456077',paddingTop:18,display:'flex',gap:36}}>
    {c.code ? <>
      <pre style={{fontFamily:'Menlo, monospace',fontSize:23,lineHeight:1.38,margin:0,width:1190,overflowWrap:'anywhere',color:'#e3edf2',whiteSpace:'pre-wrap'}}>{c.code}</pre>
      <div style={{fontSize:27,lineHeight:1.3,width:620,color:'#a9d7bb'}}><div style={{marginBottom:10}}>Verified reference</div>{c.result}</div>
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
