'use strict';
(() => {
  const $=id=>document.getElementById(id),force=t=>12*Math.exp(-t/.8),fmt=(x,d=4)=>Number(x).toFixed(d);
  let step=0;
  const titles=['Choose three samples','Fit a quadratic','Find the coefficients','Integrate the fitted curve','Obtain the 1 : 4 : 1 rule','Join the panels'];
  const el=(tag,attrs={},text)=>{const node=document.createElementNS('http://www.w3.org/2000/svg',tag);for(const [key,value] of Object.entries(attrs))node.setAttribute(key,value);if(text!==undefined)node.textContent=text;return node;};
  function data(){const n=Number($('intervals').value),h=2/n,f0=force(0),f1=force(h),f2=force(2*h),A=(f0-2*f1+f2)/2,B=(f2-f0)/2,C=f1;return {n,h,f0,f1,f2,A,B,C,area:h*(f0+4*f1+f2)/3};}
  function update(){const d=data(),descriptions=[
    'Take three equally spaced samples. The first panel spans two intervals, each of width h.',
    'Centre a new coordinate at the middle sample. Fit a quadratic through all three points.',
    'Use the force values at u = −1, 0 and 1 to solve for the three coefficients.',
    'Integrate the fitted quadratic from u = −1 to 1. The odd Bu term cancels; dt = h du.',
    'Substitute the coefficients into the integral. The middle force receives four times the weight of each endpoint.',
    'Adjacent panels share an endpoint. Their two endpoint weights add to 2, giving the composite pattern.'
  ],equations=[
    'F₀ = F(t₀)     F₁ = F(t₀ + h)     F₂ = F(t₀ + 2h)',
    'u = (t − t₁) / h     with t₁ = t₀ + h\n\np(u) = Au² + Bu + C',
    'p(−1) = A − B + C = F₀\np(0) = C = F₁\np(1) = A + B + C = F₂\n\nA = (F₀ − 2F₁ + F₂)/2\nB = (F₂ − F₀)/2     C = F₁',
    'Area ≈ h ∫₋₁¹ (Au² + Bu + C) du\n\n= h (2A/3 + 0 + 2C)',
    'Area ≈ h/3 × (F₀ + 4F₁ + F₂)',
    'J ≈ h/3 × [F₀ + 4F₁ + 2F₂ + ⋯ + 4Fₙ₋₁ + Fₙ]\n\n n must be even'
  ],numbers=[
    `h = ${fmt(d.h,3)} s · samples: ${fmt(d.f0,3)}, ${fmt(d.f1,3)}, ${fmt(d.f2,3)} N`,
    `t₀ = 0 s · t₁ = ${fmt(d.h,3)} s · t₂ = ${fmt(2*d.h,3)} s`,
    `A = ${fmt(d.A,4)} N · B = ${fmt(d.B,4)} N · C = ${fmt(d.C,4)} N`,
    `For this first panel: ${fmt(d.area,6)} N s`,
    `(${fmt(d.h,3)} / 3) × (${fmt(d.f0,3)} + 4 × ${fmt(d.f1,3)} + ${fmt(d.f2,3)}) ≈ ${fmt(d.area,6)} N s`,
    `${d.n} equal intervals form ${d.n/2} quadratic panels. The plot shows the first two.`
  ];
    $('derive-progress').textContent=`STEP ${step+1} OF ${titles.length}`;$('derive-title').textContent=titles[step];$('derive-explanation').textContent=descriptions[step];$('derive-equation').textContent=equations[step];$('derive-number').textContent=numbers[step];$('derive-indicator').textContent=`${step+1} / ${titles.length}`;$('derive-back').disabled=step===0;$('derive-next').disabled=step===titles.length-1;
    $('derive-fit-legend').hidden=step===0;$('derive-area-legend').hidden=step<3;
    $('derive-graph-note').textContent=step===5?`F₂ is shared by the two shown panels, so its weight is 1 + 1 = 2.${d.n>4?' F₄ is shared with the next panel too.':''}`:step===0?'The dots are sampled force values; the area is not estimated yet.':step<3?'The dashed curve is the quadratic fitted to the three samples.':'The shaded region is the area under the fitted quadratic, not the exact force curve.';
    draw(d);
  }
  function draw(d){const chart=$('derivation-chart'),w=chart.parentElement.clientWidth,H=w<420?300:340,L=58,R=w-18,T=24,B=H-55,composite=step===5;const maxY=13,X=u=>L+(u+1.2)/2.4*(R-L),XT=t=>L+t/(4*d.h)*(R-L),Y=y=>B-y/maxY*(B-T),p=u=>d.A*u*u+d.B*u+d.C;
    chart.replaceChildren();chart.setAttribute('viewBox',`0 0 ${w} ${H}`);chart.append(el('title',{id:'derive-chart-title'},'Simpson rule construction'),el('desc',{id:'derive-chart-description'},`${titles[step]}. ${composite?'The first two panels share a sample with combined weight two.':`First panel uses three samples spaced ${fmt(d.h,3)} seconds apart.`} ${step>=3?'The shaded area is under the fitted quadratic.':''}`));
    const defs=el('defs'),clip=el('clipPath',{id:'derive-clip'});clip.append(el('rect',{x:L,y:T,width:R-L,height:B-T}));defs.append(clip);chart.append(defs);const marks=el('g',{'clip-path':'url(#derive-clip)'});chart.append(marks);
    for(const y of [0,3,6,9,12]){marks.append(el('line',{class:'derive-grid',x1:L,x2:R,y1:Y(y),y2:Y(y)}));chart.append(el('text',{class:'derive-tick',x:L-8,y:Y(y)+4,'text-anchor':'end'},String(y)));}
    if(composite){for(let panel=0;panel<2;panel++){const a=2*panel*d.h,b=(2*panel+1)*d.h,c=(2*panel+2)*d.h,fa=force(a),fb=force(b),fc=force(c),cy=2*fb-(fa+fc)/2;marks.append(el('path',{class:'derive-area',d:`M${XT(a)},${Y(0)} L${XT(a)},${Y(fa)} Q${XT(b)},${Y(cy)} ${XT(c)},${Y(fc)} L${XT(c)},${Y(0)} Z`}));marks.append(el('path',{class:'derive-fit',d:`M${XT(a)},${Y(fa)} Q${XT(b)},${Y(cy)} ${XT(c)},${Y(fc)}`}));}for(let i=0;i<5;i++){const t=i*d.h;marks.append(el('circle',{class:'derive-point',cx:XT(t),cy:Y(force(t)),r:5}));chart.append(el('text',{class:'derive-tick',x:XT(t),y:B+20,'text-anchor':i===0?'start':i===4?'end':'middle'},`${i===0||i===4?'1':i===2?'2':'4'}×F${i}`));}chart.append(el('text',{class:'derive-axis',x:(L+R)/2,y:H-5,'text-anchor':'middle'},'Weights from shown panels'));}
    else {if(step>=3){let path=`M${X(-1)},${Y(0)} L${X(-1)},${Y(p(-1))}`;for(let i=1;i<=80;i++){const u=-1+2*i/80;path+=` L${X(u)},${Y(p(u))}`;}path+=` L${X(1)},${Y(0)} Z`;marks.append(el('path',{class:'derive-area',d:path}));}if(step>=1){let path='';for(let i=0;i<=80;i++){const u=-1+2*i/80;path+=`${i?'L':'M'}${X(u)},${Y(p(u))}`;}marks.append(el('path',{class:'derive-fit',d:path}));}[-1,0,1].forEach((u,i)=>{marks.append(el('circle',{class:'derive-point',cx:X(u),cy:Y([d.f0,d.f1,d.f2][i]),r:5}));chart.append(el('text',{class:'derive-tick',x:X(u),y:B+20,'text-anchor':'middle'},step>=4?`${[1,4,1][i]}×F${i}`:`F${i}`));});chart.append(el('text',{class:'derive-axis',x:(L+R)/2,y:H-5,'text-anchor':'middle'},'Sample positions: u = −1, 0, 1'));}
    chart.append(el('rect',{class:'derive-frame',x:L,y:T,width:R-L,height:B-T}),el('text',{class:'derive-axis',x:14,y:(T+B)/2,'text-anchor':'middle',transform:`rotate(-90 14 ${(T+B)/2})`},'Force, F (N)'));
  }
  $('derive-back').addEventListener('click',()=>{if(step>0){step--;update();}});$('derive-next').addEventListener('click',()=>{if(step<titles.length-1){step++;update();}});$('intervals').addEventListener('change',update);new ResizeObserver(()=>draw(data())).observe($('derivation-chart').parentElement);update();
})();
