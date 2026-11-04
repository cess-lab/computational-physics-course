from pathlib import Path
import subprocess,json
root=Path(__file__).resolve().parent
for i in (12,13):
 dest=root/'narration-jobs'/f'{i:02}'
 if list((dest/'outputs').glob('*.mp3')): continue
 r=subprocess.run(['/Users/khairuladib/.codex/skills/openai-text-to-speech/scripts/text-to-speech.sh','--input',str(root/'narration-input'/f'slide-{i:02}.txt')],cwd=dest,capture_output=True,text=True,timeout=210)
 (dest/'retry-result.log').write_text(r.stdout+r.stderr)
 print(json.dumps({'slide':i,'ok':r.returncode==0}),flush=True)
