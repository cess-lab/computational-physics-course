'use strict';
(() => {
  const $=id=>document.getElementById(id), force=t=>12*Math.exp(-t/.8), duration=2, reference=12*.8*(1-Math.exp(-duration/.8));
  let count=4, added=0, strips=[];
  const fmt=(x,d=4)=>Number(x).toFixed(d);
  const el=(tag,attrs={},text)=>{const node=document.createElementNS('http://www.w3.org/2000/svg',tag);for(const [key,value] of Object.entries(attrs))node.setAttribute(key,value);if(text!==undefined)node.textContent=text;return node;};
  function build(){const width=duration/count;strips=Array.from({length:count},(_,i)=>{const left=i*width,right=(i+1)*width,a=force(left),b=force(right);return {left,right,a,b,area:.5*(a+b)*width};});added=0;$('strip-slider').max=count;$('strip-slider').value=0;}
  function update(){const sum=strips.slice(0,added).reduce((total,s)=>total+s.area,0),total=strips.reduce((a,s)=>a+s.area,0),next=strips[added],width=duration/count;
    $('strip-slider').value=added;$('strip-display').textContent=`${added} of ${count}`;$('count-value').textContent=`${added} / ${count}`;$('width-value').textContent=`${fmt(width,3)} s`;$('sum-value').textContent=`${fmt(sum)} N s`;$('back').disabled=added===0;$('next').disabled=!next;
    $('step-title').textContent=next?'Calculate the next area':'All trapezoids added';
    $('step-description').textContent=next?`Next interval: ${fmt(next.left,3)} to ${fmt(next.right,3)} s. Use the force at each endpoint.`:'The accumulated sum now equals the complete trapezoidal estimate.';
    $('calculation').textContent=next?`½ × (${fmt(next.a,4)} + ${fmt(next.b,4)}) N × ${fmt(width,3)} s\n= ${fmt(next.area,4)} N s`:'The complete area is the sum of all strips.';
    const latest=added?strips[added-1]:null,previous=sum-(latest?latest.area:0);
    $('addition-feedback').textContent=latest?`Added ${fmt(latest.area)} N s for ${fmt(latest.left,3)}–${fmt(latest.right,3)} s: ${fmt(previous)} + ${fmt(latest.area)} ≈ ${fmt(sum)} N s`:'No areas added yet. The outlined orange trapezoid is next.';
    $('partial').textContent=`${fmt(sum)} N s`;$('estimate').textContent=`${fmt(total)} N s`;$('exact').textContent=`${fmt(reference)} N s`;$('error').textContent=`${fmt(Math.abs(total-reference))} N s`;
    $('interpretation').textContent=`The complete estimate is ${fmt(total)} N s. It is positive and below 24 N s. For this convex force curve, trapezoids overestimate the analytic area; refine the intervals to reduce the error.`;
    draw(sum,total);
  }
  function draw(sum,total){const chart=$('chart'),w=$('chart-wrap').clientWidth,height=w<450?320:380,l=65,r=w-18,top=20,bottom=height-55,X=t=>l+t/duration*(r-l),Y=f=>bottom-f/13*(bottom-top);
    chart.setAttribute('viewBox',`0 0 ${w} ${height}`);chart.replaceChildren();
    chart.append(el('title',{id:'chart-title'},'Trapezoidal approximation of the area under a decaying force'),el('desc',{id:'chart-description'},`${count} intervals of width ${fmt(duration/count,3)} seconds; ${added} trapezoids added, accumulated impulse ${fmt(sum)} newton seconds. The full trapezoidal estimate is ${fmt(total)} newton seconds and the analytic reference is ${fmt(reference)} newton seconds.`));
    const defs=el('defs'),clip=el('clipPath',{id:'integration-clip'});clip.append(el('rect',{x:l,y:top,width:r-l,height:bottom-top}));defs.append(clip);chart.append(defs);const marks=el('g',{'clip-path':'url(#integration-clip)'});chart.append(marks);
    for(const y of [0,3,6,9,12]){marks.append(el('line',{class:'grid',x1:l,x2:r,y1:Y(y),y2:Y(y)}));chart.append(el('text',{x:l-8,y:Y(y)+4,'text-anchor':'end'},String(y)));}
    for(const t of (w<450?[0,.5,1,1.5,2]:[0,.25,.5,.75,1,1.25,1.5,1.75,2])){marks.append(el('line',{class:'grid',x1:X(t),x2:X(t),y1:top,y2:bottom}));chart.append(el('text',{x:X(t),y:bottom+20,'text-anchor':'middle'},String(t)));}
    strips.forEach((s,i)=>{const d=`M${X(s.left)},${Y(0)} L${X(s.left)},${Y(s.a)} L${X(s.right)},${Y(s.b)} L${X(s.right)},${Y(0)} Z`;const kind=i<added?'int-acc':i===added?'int-next':'int-future';const style=i<added?{fill:'#8dc8a3',stroke:'#33865a','stroke-width':'1.5'}:i===added?{fill:'#ffdfb5',stroke:'#b85817','stroke-width':'2','stroke-dasharray':'5 3'}:{fill:'none',stroke:'#acbdb2','stroke-width':'1','stroke-dasharray':'3 4'};marks.append(el('path',{class:kind,d,...style}));});
    const path=Array.from({length:151},(_,i)=>{const t=duration*i/150;return `${i?'L':'M'}${X(t).toFixed(2)},${Y(force(t)).toFixed(2)}`;}).join(' ');marks.append(el('path',{class:'curve',d:path}));
    for(let i=0;i<=count;i++){const t=i*duration/count;marks.append(el('circle',{class:'diff-point',cx:X(t),cy:Y(force(t)),r:count===16?3:4}));}
    chart.append(el('rect',{class:'axis',x:l,y:top,width:r-l,height:bottom-top}),el('text',{x:(l+r)/2,y:height-5,'text-anchor':'middle'},'Time, t (s)'),el('text',{x:14,y:(top+bottom)/2,'text-anchor':'middle',transform:`rotate(-90 14 ${(top+bottom)/2})`},'Force, F (N)'));
  }
  $('strip-slider').addEventListener('input',e=>{added=Number(e.target.value);update();});$('back').addEventListener('click',()=>{if(added>0){added--;update();}});$('next').addEventListener('click',()=>{if(added<count){added++;update();}});$('intervals').addEventListener('change',e=>{count=Number(e.target.value);build();update();});
  build();update();new ResizeObserver(()=>update()).observe($('chart-wrap'));
})();
