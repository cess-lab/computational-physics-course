'use strict';
(() => {
  const $=id=>document.getElementById(id), force=t=>12*Math.exp(-t/.8), duration=2, reference=12*.8*(1-Math.exp(-duration/.8));
  let count=4, added=0, method='trapezoid', panels=[];
  const fmt=(x,d=4)=>Number(x).toFixed(d);
  const el=(tag,attrs={},text)=>{const node=document.createElementNS('http://www.w3.org/2000/svg',tag);for(const [key,value] of Object.entries(attrs))node.setAttribute(key,value);if(text!==undefined)node.textContent=text;return node;};
  function buildPanels(kind) {
    const h=duration/count, size=kind==='simpson'?2:1;
    return Array.from({length:count/size},(_,i)=>{const left=i*size*h,right=(i+1)*size*h,mid=(left+right)/2,a=force(left),b=force(right),m=force(mid);return {left,right,mid,a,b,m,area:kind==='simpson'?h*(a+4*m+b)/3:h*(a+b)/2};});
  }
  function build(){panels=buildPanels(method);added=0;$('strip-slider').max=panels.length;$('strip-slider').value=0;}
  function update(){const h=duration/count,sum=panels.slice(0,added).reduce((total,p)=>total+p.area,0),next=panels[added],simpson=method==='simpson';
    const trap=buildPanels('trapezoid').reduce((s,p)=>s+p.area,0),sim=buildPanels('simpson').reduce((s,p)=>s+p.area,0),unit=simpson?'panel':'trapezoid',plural=simpson?'panels':'trapezoids';
    $('fit-description').textContent=simpson?'Each Simpson panel fits a parabola through three sampled points; the green curve is the exact force model.':'Each trapezoid uses a straight line between two sampled points; the green curve is the exact force model.';
    $('strip-slider').value=added;$('strip-display').textContent=`${added} of ${panels.length}`;$('slider-label').textContent=simpson?'Simpson panels added':'Trapezoids added';$('strip-slider').setAttribute('aria-label',simpson?'Simpson panels added':'Trapezoids added');$('count-label').textContent=simpson?'Panels added':'Trapezoids added';$('count-value').textContent=`${added} / ${panels.length}`;$('width-value').textContent=`${fmt(h,3)} s`;$('sum-value').textContent=`${fmt(sum)} N s`;$('back').disabled=added===0;$('next').disabled=!next;$('next').textContent=simpson?'Add Simpson panel →':'Add trapezoid →';
    $('step-title').textContent=next?'Calculate the next area':`All ${plural} added`;
    $('step-description').textContent=next?`Next ${unit}: ${fmt(next.left,3)} to ${fmt(next.right,3)} s. ${simpson?'It spans two intervals and uses three sampled forces.':'Use the force at each endpoint.'}`:`The accumulated sum now equals the complete ${simpson?'Simpson':'trapezoidal'} estimate.`;
    $('panel-formula').textContent=simpson?'Area ≈ (h / 3)(F₀ + 4F₁ + F₂)':'Area ≈ ½(Fᵢ + Fᵢ₊₁) Δt';
    $('calculation').textContent=next?(simpson?`(${fmt(h,3)} / 3) s × (${fmt(next.a,4)} + 4 × ${fmt(next.m,4)} + ${fmt(next.b,4)}) N\n= ${fmt(next.area,4)} N s`:`½ × (${fmt(next.a,4)} + ${fmt(next.b,4)}) N × ${fmt(h,3)} s\n= ${fmt(next.area,4)} N s`):'The complete area is the sum of all panels.';
    const latest=added?panels[added-1]:null,previous=sum-(latest?latest.area:0);
    $('addition-feedback').textContent=latest?`Added ${fmt(latest.area)} N s for ${fmt(latest.left,3)}–${fmt(latest.right,3)} s: ${fmt(previous)} + ${fmt(latest.area)} ≈ ${fmt(sum)} N s`:`No areas added yet. The outlined orange ${unit} is next.`;
    $('partial').textContent=`${fmt(sum)} N s`;$('trap-estimate').textContent=`${fmt(trap,6)} N s`;$('simpson-estimate').textContent=`${fmt(sim,6)} N s`;$('exact').textContent=`${fmt(reference,6)} N s`;$('trap-error').textContent=`${fmt(Math.abs(trap-reference),6)} N s`;$('simpson-error').textContent=`${fmt(Math.abs(sim-reference),6)} N s`;
    $('interpretation').textContent=`Both complete estimates use ${count} equal intervals (h = ${fmt(h,3)} s). Simpson uses ${count/2} quadratic panels. Compare their errors with the analytic reference; performance can depend on the function.`;
    draw(sum,simpson?sim:trap);
  }
  function draw(sum,total){const chart=$('chart'),w=$('chart-wrap').clientWidth,height=w<450?320:380,l=65,r=w-18,top=20,bottom=height-55,X=t=>l+t/duration*(r-l),Y=f=>bottom-f/13*(bottom-top),simpson=method==='simpson';
    chart.setAttribute('viewBox',`0 0 ${w} ${height}`);chart.replaceChildren();
    chart.append(el('title',{id:'chart-title'},`${simpson?'Simpson':'Trapezoidal'} approximation of area under a decaying force`),el('desc',{id:'chart-description'},`${count} equal intervals of width ${fmt(duration/count,3)} seconds; ${added} of ${panels.length} ${simpson?'quadratic panels':'trapezoids'} added, accumulated impulse ${fmt(sum)} newton seconds. The complete estimate is ${fmt(total)} newton seconds and analytic reference is ${fmt(reference)} newton seconds.`));
    const defs=el('defs'),clip=el('clipPath',{id:'integration-clip'});clip.append(el('rect',{x:l,y:top,width:r-l,height:bottom-top}));defs.append(clip);chart.append(defs);const marks=el('g',{'clip-path':'url(#integration-clip)'});chart.append(marks);
    for(const y of [0,3,6,9,12]){marks.append(el('line',{class:'grid',x1:l,x2:r,y1:Y(y),y2:Y(y)}));chart.append(el('text',{x:l-8,y:Y(y)+4,'text-anchor':'end'},String(y)));}
    for(const t of (w<450?[0,.5,1,1.5,2]:[0,.25,.5,.75,1,1.25,1.5,1.75,2])){marks.append(el('line',{class:'grid',x1:X(t),x2:X(t),y1:top,y2:bottom}));chart.append(el('text',{x:X(t),y:bottom+20,'text-anchor':'middle'},String(t)));}
    panels.forEach((p,i)=>{const upper=simpson?`Q${X(p.mid)},${Y(2*p.m-(p.a+p.b)/2)} ${X(p.right)},${Y(p.b)}`:`L${X(p.right)},${Y(p.b)}`;const d=`M${X(p.left)},${Y(0)} L${X(p.left)},${Y(p.a)} ${upper} L${X(p.right)},${Y(0)} Z`;const kind=i<added?'int-acc':i===added?'int-next':'int-future';const style=i<added?{fill:'#8dc8a3',stroke:'#33865a','stroke-width':'1.5'}:i===added?{fill:'#ffdfb5',stroke:'#b85817','stroke-width':'2','stroke-dasharray':'5 3'}:{fill:'none',stroke:'#acbdb2','stroke-width':'1','stroke-dasharray':'3 4'};marks.append(el('path',{class:kind,d,...style}));});
    const path=Array.from({length:151},(_,i)=>{const t=duration*i/150;return `${i?'L':'M'}${X(t).toFixed(2)},${Y(force(t)).toFixed(2)}`;}).join(' ');marks.append(el('path',{class:'curve',d:path}));
    for(let i=0;i<=count;i++){const t=i*duration/count;marks.append(el('circle',{class:'diff-point',cx:X(t),cy:Y(force(t)),r:count===16?3:4}));}
    chart.append(el('rect',{class:'axis',x:l,y:top,width:r-l,height:bottom-top}),el('text',{x:(l+r)/2,y:height-5,'text-anchor':'middle'},'Time, t (s)'),el('text',{x:14,y:(top+bottom)/2,'text-anchor':'middle',transform:`rotate(-90 14 ${(top+bottom)/2})`},'Force, F (N)'));
  }
  $('strip-slider').addEventListener('input',e=>{added=Number(e.target.value);update();});$('back').addEventListener('click',()=>{if(added>0){added--;update();}});$('next').addEventListener('click',()=>{if(added<panels.length){added++;update();}});$('intervals').addEventListener('change',e=>{count=Number(e.target.value);build();update();});$('method').addEventListener('change',e=>{method=e.target.value;build();update();});
  build();update();new ResizeObserver(()=>update()).observe($('chart-wrap'));
})();
