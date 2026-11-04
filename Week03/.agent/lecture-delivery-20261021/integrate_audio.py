from pathlib import Path
import subprocess,json,shutil,csv,math
root=Path(__file__).resolve().parent
studio=root/'remotion-studio'; public=studio/'public'/'audio'; public.mkdir(exist_ok=True)
outputs=root/'outputs'; outputs.mkdir(exist_ok=True)
data=json.loads((studio/'src'/'chapters.json').read_text())
rows=[];t=0
for c in data:
 i=c['slide']; files=sorted((root/'narration-jobs'/f'{i:02}'/'outputs').glob('*.mp3'))
 assert len(files)==1,(i,len(files))
 dst=public/f'slide-{i:02}.mp3'; shutil.copyfile(files[0],dst)
 dur=float(subprocess.check_output(['ffprobe','-v','error','-show_entries','format=duration','-of','csv=p=0',str(dst)],text=True))
 assert dur>10 and dur<c['minutes']*60,(i,dur)
 c.update(durationSeconds=dur,rehearsalFrames=math.ceil((dur+2)*30),audioReady=True)
 rows.append([i,c['title'],round(t,3),dur,c['startMinute']*60,c['minutes']*60])
 t+=dur
(studio/'src'/'chapters.json').write_text(json.dumps(data,ensure_ascii=False,indent=2))
with (outputs/'Week03_Narration_Chapters.csv').open('w') as f:
 w=csv.writer(f);w.writerow(['slide','title','mp3_start_seconds','audio_duration_seconds','class_start_seconds','class_segment_seconds']);w.writerows(rows)
# Re-encode continuous narration as one playable MP3; no silent classroom holds.
concat=root/'narration-concat.txt'; concat.write_text(''.join("file '"+str(public/f'slide-{c["slide"]:02}.mp3')+"'\n" for c in data))
subprocess.run(['ffmpeg','-v','error','-y','-f','concat','-safe','0','-i',str(concat),'-c:a','libmp3lame','-b:a','128k','-metadata','title=PHY4605 Week 03 — BM lecture narration','-metadata','comment=AI-generated speech. Paid OpenAI Audio API, gpt-4o-mini-tts, marin. Spoken script only; classroom holds excluded.',str(outputs/'Week03_Narration_BM.mp3')],check=True)
subprocess.run(['python3',str(root/'refresh_root.py')],check=True)
(root/'audio-manifest.json').write_text(json.dumps({'model':'gpt-4o-mini-tts','voice':'marin','paidOpenAIAPI':True,'aiGeneratedSpeech':True,'audioSeconds':t,'chapterCount':15,'classMinutes':90,'chapters':rows},indent=2))
print(json.dumps({'audioSeconds':round(t,2),'audioMinutes':round(t/60,2),'chapterCount':len(rows),'classMinutes':90}))
