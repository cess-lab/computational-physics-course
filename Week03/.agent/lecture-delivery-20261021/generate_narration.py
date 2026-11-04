from pathlib import Path
import subprocess,json,concurrent.futures
root=Path(__file__).resolve().parent
skill='/Users/khairuladib/.codex/skills/openai-text-to-speech/scripts/text-to-speech.sh'
instructions='Bercakap dalam Bahasa Melayu Malaysia sebagai pensyarah fizik yang mesra, jelas dan profesional. Kekalkan istilah teknikal English secara natural. Sebut MATLAB sebagai mat-lab; backslash, mesh current, coefficient, dan validation dengan jelas. Baca nombor dan tanda negatif dengan tepat. Kelajuan sederhana untuk pelajar tahun dua. Jangan tambah ayat, muzik, atau penutup sendiri. Gunakan jeda ringkas antara perenggan.'
def generate(i):
 dest=root/'narration-jobs'/f'{i:02}'
 r=subprocess.run([skill,'--input',str(root/'narration-input'/f'slide-{i:02}.txt'),'--instructions',instructions],cwd=dest,capture_output=True,text=True)
 (dest/'result.log').write_text(r.stdout+r.stderr)
 if r.returncode: return {'slide':i,'ok':False,'error':r.stderr[-1000:]}
 files=list((dest/'outputs').glob('*.mp3'))
 return {'slide':i,'ok':True,'path':str(files[-1])}
with concurrent.futures.ThreadPoolExecutor(max_workers=3) as ex:
 for r in ex.map(generate,range(1,16)):
  print(json.dumps(r),flush=True)
