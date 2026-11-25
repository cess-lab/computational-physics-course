'use strict';
(() => {
  const $ = id => document.getElementById(id);
  const position = t => 20*t - 0.5*9.81*t*t;
  const exactVelocity = t => 20 - 9.81*t;
  const format = (value, digits=3) => (Math.abs(value) < 1e-10 ? 0 : value).toFixed(digits);
  let t0=1, h=0.5, method='forward';
  const svgNode = (tag, attrs={}, content) => {
    const node=document.createElementNS('http://www.w3.org/2000/svg',tag);
    for (const [key,value] of Object.entries(attrs)) node.setAttribute(key,value);
    if (content !== undefined) node.textContent=content;
    return node;
  };
  function calculate() {
    const left=method==='forward'?t0:t0-h, right=t0+h;
    const yLeft=position(left), yRight=position(right), delta=right-left;
    const estimate=(yRight-yLeft)/delta, reference=exactVelocity(t0);
    return {left,right,yLeft,yRight,delta,estimate,reference,error:Math.abs(estimate-reference)};
  }
  function update() {
    const s=calculate();
    $('time-display').textContent=`${format(t0,2)} s`;
    $('step-display').textContent=`${format(h,2)} s`;
    $('step-number').value=format(h,2);
    $('sample-a-label').textContent=method==='forward'?'At t₀':'At t₀ − h';
    $('sample-b-label').textContent='At t₀ + h';
    $('sample-a-value').textContent=`${format(s.left,2)} s · ${format(s.yLeft)} m`;
    $('sample-b-value').textContent=`${format(s.right,2)} s · ${format(s.yRight)} m`;
    $('delta-y').textContent=`${format(s.yRight-s.yLeft)} m`;
    $('method-description').textContent=method==='forward'?'Use the position at t₀ and one step later.':'Use positions one step on either side of t₀.';
    $('formula').textContent=method==='forward'?'v ≈ [y(t₀ + h) − y(t₀)] / h':'v ≈ [y(t₀ + h) − y(t₀ − h)] / (2h)';
    $('substitution').textContent=`(${format(s.yRight,5)} − ${format(s.yLeft,5)}) m / ${format(s.delta,2)} s`;
    $('estimate').textContent=`${format(s.estimate,4)} m/s`;
    $('exact').textContent=`${format(s.reference,4)} m/s`;
    $('error').textContent=s.error < 1e-10?'≈ 0 m/s':`${format(s.error,4)} m/s`;
    $('interpretation').textContent=method==='central'?'For this quadratic model, the central estimate matches the analytic slope to floating-point precision.':`With this model, the forward secant underestimates the local velocity by ${format(s.error,4)} m/s. Reduce h to make the sampled interval more local.`;
    draw(s);
  }
  function draw(s) {
    const chart=$('chart'), w=$('chart-wrap').clientWidth, height=w<450?320:380, l=65, r=w-18, top=20, bottom=height-55;
    const X=t=>l+(t/3)*(r-l), Y=y=>bottom-(y/25)*(bottom-top);
    chart.replaceChildren();chart.setAttribute('viewBox',`0 0 ${w} ${height}`);
    chart.append(svgNode('title',{id:'chart-title'},'Vertical position with numerical secant and analytic tangent'),svgNode('desc',{id:'chart-description'},`${method} difference at ${format(t0,2)} seconds with step ${format(h,2)} seconds. Position samples at ${format(s.left,2)} and ${format(s.right,2)} seconds. The numerical slope is ${format(s.estimate,4)} metres per second, compared with analytic velocity ${format(s.reference,4)} metres per second.`));
    const defs=svgNode('defs'), clip=svgNode('clipPath',{id:'diff-clip'});clip.append(svgNode('rect',{x:l,y:top,width:r-l,height:bottom-top}));defs.append(clip);chart.append(defs);
    const marks=svgNode('g',{'clip-path':'url(#diff-clip)'});chart.append(marks);
    for(const y of [0,5,10,15,20,25]) {marks.append(svgNode('line',{class:'grid',x1:l,x2:r,y1:Y(y),y2:Y(y)}));chart.append(svgNode('text',{x:l-8,y:Y(y)+4,'text-anchor':'end'},String(y)));}
    for(const t of (w<450?[0,1,2,3]:[0,0.5,1,1.5,2,2.5,3])) {marks.append(svgNode('line',{class:'grid',x1:X(t),x2:X(t),y1:top,y2:bottom}));chart.append(svgNode('text',{x:X(t),y:bottom+20,'text-anchor':'middle'},String(t)));}
    const path=Array.from({length:151},(_,i)=>{const t=3*i/150;return `${i?'L':'M'}${X(t).toFixed(2)},${Y(position(t)).toFixed(2)}`;}).join(' ');
    marks.append(svgNode('path',{class:'curve',d:path}));
    const tangent=x=>position(t0)+s.reference*(x-t0), secant=x=>s.yLeft+s.estimate*(x-s.left);
    marks.append(svgNode('line',{class:'diff-secant',x1:X(0),y1:Y(secant(0)),x2:X(3),y2:Y(secant(3))}));
    marks.append(svgNode('line',{class:'tangent',x1:X(0),y1:Y(tangent(0)),x2:X(3),y2:Y(tangent(3))}));
    for(const [t,y] of [[s.left,s.yLeft],[s.right,s.yRight]]) {marks.append(svgNode('line',{class:'guide',x1:X(t),y1:Y(y),x2:X(t),y2:bottom}));marks.append(svgNode('circle',{class:'diff-point',cx:X(t),cy:Y(y),r:5.5}));}
    marks.append(svgNode('circle',{class:'target-point',cx:X(t0),cy:Y(position(t0)),r:4}));
    chart.append(svgNode('rect',{class:'axis',x:l,y:top,width:r-l,height:bottom-top}),svgNode('text',{x:(l+r)/2,y:height-5,'text-anchor':'middle'},'Time, t (s)'),svgNode('text',{x:14,y:(top+bottom)/2,'text-anchor':'middle',transform:`rotate(-90 14 ${(top+bottom)/2})`},'Vertical position, y (m)'));
  }
  $('time').addEventListener('input',e=>{t0=Number(e.target.value);update();});
  $('step').addEventListener('input',e=>{h=Number(e.target.value);update();});
  $('step-number').addEventListener('change',e=>{const n=Number(e.target.value);h=Number.isFinite(n)&&e.target.value!==''?Math.min(.5,Math.max(.05,Math.round(n/.05)*.05)):h;$('step').value=h;update();});
  $('method').addEventListener('change',e=>{method=e.target.value;update();});
  new ResizeObserver(()=>draw(calculate())).observe($('chart-wrap'));
  update();
})();
