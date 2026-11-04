from pathlib import Path
import subprocess,concurrent.futures
root=Path(__file__).resolve().parent
out=root/'qa'; out.mkdir(exist_ok=True)
def render(i):
 r=subprocess.run(['npx','remotion','still',f'Slide{i:02}',str(out/f'slide-{i:02}.png'),'--frame=60','--log=error'],cwd=root/'remotion-studio',capture_output=True,text=True)
 return i,r.returncode,r.stderr[-500:]
with concurrent.futures.ThreadPoolExecutor(max_workers=2) as ex:
 for r in ex.map(render,range(1,16)):print(r,flush=True)
