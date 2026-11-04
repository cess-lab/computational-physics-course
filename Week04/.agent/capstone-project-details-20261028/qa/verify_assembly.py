import json,hashlib,zipfile,xml.etree.ElementTree as E
from pathlib import Path
import fitz
from PIL import Image,ImageChops,ImageStat
root=Path(__file__).resolve().parents[1]
ppt=root/(root.name+'.pptx')
pdf=root/'qa/rendered'/ (root.name+'.pdf')
jobs=json.loads((root/'slide_jobs.json').read_text())
assert len(jobs['slides'])==12
assert all(s['status'] in ['accepted','recorded'] for s in jobs['slides'])
ns={'a':'http://schemas.openxmlformats.org/drawingml/2006/main','p':'http://schemas.openxmlformats.org/presentationml/2006/main'}
with zipfile.ZipFile(ppt) as z:
 slides=[n for n in z.namelist() if __import__('re').fullmatch(r'ppt/slides/slide\d+\.xml',n)]
 notes=[n for n in z.namelist() if __import__('re').fullmatch(r'ppt/notesSlides/notesSlide\d+\.xml',n)]
 assert len(slides)==len(notes)==12
 dims=E.fromstring(z.read('ppt/presentation.xml')).find('p:sldSz',ns)
 assert abs(int(dims.attrib['cx'])/int(dims.attrib['cy'])-16/9)<1e-5
 for n in range(1,13):
  tree=E.fromstring(z.read(f'ppt/slides/slide{n}.xml'))
  pics=tree.findall('.//p:pic',ns);assert len(pics)==1
  off=tree.find('.//p:pic/p:spPr/a:xfrm/a:off',ns);ext=tree.find('.//p:pic/p:spPr/a:xfrm/a:ext',ns)
  assert off.attrib=={'x':'0','y':'0'}
  assert ext.attrib['cx']==dims.attrib['cx'] and ext.attrib['cy']==dims.attrib['cy']
  note=' '.join(t.text or '' for t in E.fromstring(z.read(f'ppt/notesSlides/notesSlide{n}.xml')).findall('.//a:t',ns))
  assert len(note)>200
  rel=E.fromstring(z.read(f'ppt/slides/_rels/slide{n}.xml.rels'))
  image_rel=next(r.attrib['Target'] for r in rel if r.attrib['Type'].endswith('/image'))
  image_path='ppt/'+image_rel.replace('../','')
  assert hashlib.sha256(z.read(image_path)).digest()==hashlib.sha256((root/f'origin_image/slide_{n:02d}.png').read_bytes()).digest()
doc=fitz.open(pdf);assert len(doc)==12
out=root/'qa/rendered/pages';out.mkdir(exist_ok=True)
comparisons=[]
for i,page in enumerate(doc):
 pix=page.get_pixmap(matrix=fitz.Matrix(1672/page.rect.width,1672/page.rect.width),alpha=False)
 target=out/f'slide_{i+1:02d}.png';pix.save(target)
 source=Image.open(root/f'origin_image/slide_{i+1:02d}.png').convert('RGB').resize((pix.width,pix.height))
 rendered=Image.open(target).convert('RGB')
 mae=sum(ImageStat.Stat(ImageChops.difference(source,rendered)).mean)/3
 comparisons.append({'slide':i+1,'render_mean_absolute_error':round(mae,3)})
 assert mae<12,(i+1,mae)
record={'slide_count':12,'notes_count':12,'aspect_ratio':'16:9','one_full_canvas_image_per_slide':True,'embedded_image_hashes_match_sources':True,'all_states_complete':True,'pdf_render_pages':12,'render_source_comparisons':comparisons,'pptx_sha256':hashlib.sha256(ppt.read_bytes()).hexdigest(),'backend':'built-in image tool','parent_full_size_source_inspection':'all 12 complete','known_limitations':'Image-based slides; scientific illustrations are conceptual, not numerical simulation output.'}
(root/'qa/assembly_validation.json').write_text(json.dumps(record,indent=2)+'\n')
print(json.dumps(record,indent=2))
