'use strict';
(() => {
  const $ = id => document.getElementById(id);
  const examples = {
    projectile: {
      f: x => 400 / 9.81 * Math.sin(2 * x * Math.PI / 180) - 35,
      a: 20, b: 40, tolerance: 0.001, xUnit: '°', yUnit: 'm',
      title: 'Projectile-range residual', xTitle: 'Launch angle, θ (degrees)', yTitle: 'Residual (m)',
      equation: 'f(θ) = (20² / 9.81) sin(2θ) − 35',
      description: 'At 20 m/s, which low launch angle reaches a 35 m target? Assume level ground, g = 9.81 m/s², and no air resistance. Angles are in degrees.',
      validation: 'Substitute the tested angle into the range equation. A negative residual means the projectile falls short; a positive residual means it overshoots. Stop when |f(m)| < 0.001 m. This validates the calculation within the supplied physical model.'
    },
    square: {
      f: x => x*x - 2, a: 1, b: 2, tolerance: 0.0001, xUnit: '', yUnit: '',
      title: 'Square-root residual', xTitle: 'x (dimensionless)', yTitle: 'Residual (dimensionless)',
      equation: 'f(x) = x² − 2',
      description: 'Find the positive number whose square is two. Start with the sign-changing interval [1, 2]. All quantities are dimensionless.',
      validation: 'Square the tested midpoint and subtract two. Stop when |f(m)| < 0.0001. Compare with the independent reference √2 ≈ 1.414213562. The residual checks the equation; it is not itself the error in x.'
    }
  };
  let example = 'projectile', iteration = 0, phase = 0, zoom = true, history = [], previousDomain = null, animation = 0;
  const fmt = (x, digits=6) => Math.abs(x) < 0.000001 && x !== 0 ? x.toExponential(3) : Number(x.toFixed(digits)).toString();
  function buildHistory() {
    const e = examples[example]; let a=e.a, b=e.b; history=[];
    for(let n=0;n<30;n++) {
      const m=(a+b)/2, fa=e.f(a), fb=e.f(b), fm=e.f(m), done=Math.abs(fm)<e.tolerance;
      const left=fa*fm<0, na=left?a:m, nb=left?m:b;
      history.push({a,b,m,fa,fb,fm,left,na,nb,done});
      if(done) break; a=na;b=nb;
    }
    $('iteration').max=history.length; $('iteration-number').max=history.length;
  }
  function save() { try { localStorage.setItem('phy4605-bisection',JSON.stringify({example,iteration,phase,zoom})); } catch {} }
  function update(animate=true) {
    const e=examples[example], s=history[iteration];
    $('example').value=example;$('zoom').checked=zoom;
    $('iteration').value=iteration+1;$('iteration-number').value=iteration+1;
    $('iteration-count').textContent=`${iteration+1} of ${history.length}`;
    $('plot-title').textContent=e.title;$('equation').textContent=e.equation;
    $('model-description').textContent=e.description;$('validation-description').textContent=e.validation;
    for(const [id,x,y] of [['left',s.a,s.fa],['mid',s.m,s.fm],['right',s.b,s.fb]]) {
      $(id+'-value').textContent=id==='mid'&&phase===0?'—':fmt(x)+e.xUnit;
      $(id+'-residual').textContent=id==='mid'&&phase===0?'Not yet tested':`f(${id==='left'?'a':id==='mid'?'m':'b'}) = ${fmt(y)}${e.yUnit?' '+e.yUnit:''}`;
    }
    document.querySelectorAll('[data-phase]').forEach(b=>{if(+b.dataset.phase===phase)b.setAttribute('aria-current','step');else b.removeAttribute('aria-current');});
    const stop=phase===2&&s.done;
    if(phase===0) {
      $('stage-title').textContent='Check the bracket';
      $('stage-explanation').textContent='The curve is continuous on this interval. Its endpoint residuals have opposite signs, so at least one root lies inside.';
      $('calculation').textContent=`f(a) = ${fmt(s.fa)}\nf(b) = ${fmt(s.fb)}\nf(a) × f(b) < 0`;
    } else if(phase===1) {
      $('stage-title').textContent='Test the midpoint';
      $('stage-explanation').textContent='Split the interval into two equal halves, then evaluate the residual at the midpoint. Which half still has opposite endpoint signs?';
      $('calculation').textContent=`m = (a + b) / 2 = ${fmt(s.m)}${e.xUnit}\nf(m) = ${fmt(s.fm)}${e.yUnit?' '+e.yUnit:''}`;
    } else if(stop) {
      $('stage-title').textContent='Tolerance reached';
      $('stage-explanation').textContent='The tested midpoint satisfies the residual stopping rule. Substitute it back into the original equation to validate the result.';
      $('calculation').textContent=`|f(m)| = ${fmt(Math.abs(s.fm))}${e.yUnit?' '+e.yUnit:''}\n< ${e.tolerance}${e.yUnit?' '+e.yUnit:''}\nRoot estimate: ${fmt(s.m,8)}${e.xUnit}`;
    } else {
      $('stage-title').textContent=`Keep the ${s.left?'left':'right'} half`;
      $('stage-explanation').textContent=s.left?'f(a) and f(m) have opposite signs. Keep [a, m] and move the right endpoint to the midpoint.':'f(m) and f(b) have opposite signs. Keep [m, b] and move the left endpoint to the midpoint.';
      $('calculation').textContent=`${s.left?'New b':'New a'} = ${fmt(s.m)}${e.xUnit}\nNext bracket: [${fmt(s.na)}, ${fmt(s.nb)}]${e.xUnit}`;
    }
    const completed=iteration+(phase===2&&!s.done?1:0), width=(e.b-e.a)/2**completed;
    $('width-label').textContent=phase===2&&!s.done?'Retained bracket width':'Current bracket width';
    $('width-value').textContent=fmt(width,8)+e.xUnit;
    $('width-bar').style.width=`${100/2**completed}%`;
    $('width-fraction').textContent=`1 / ${2**completed} of the initial width · ${completed} interval ${completed===1?'halving':'halvings'}`;
    $('previous').disabled=iteration===0&&phase===0;$('next').disabled=stop;
    draw(animate);
  }
  function node(name,attrs={},text) {
    const el=document.createElementNS('http://www.w3.org/2000/svg',name);
    for(const [k,v] of Object.entries(attrs))el.setAttribute(k,v);
    if(text!==undefined)el.textContent=text;return el;
  }
  function ticks(lo,hi,n) {const raw=(hi-lo)/n,p=10**Math.floor(Math.log10(raw)),v=raw/p,step=(v>5?10:v>2?5:v>1?2:1)*p;const out=[];for(let x=Math.ceil(lo/step)*step;x<=hi+step*1e-6;x+=step)out.push(Math.abs(x)<step*1e-9?0:x);return out;}
  function targetDomain() {
    const e=examples[example],s=history[iteration],a=zoom?s.a:e.a,b=zoom?s.b:e.b,pad=(b-a)*.14;
    const x=[a-pad,b+pad],ys=Array.from({length:101},(_,i)=>e.f(x[0]+(x[1]-x[0])*i/100));
    const ymin=Math.min(...ys,0),ymax=Math.max(...ys,0),yp=(ymax-ymin)*.13;
    return [x[0],x[1],ymin-yp,ymax+yp];
  }
  function draw(animate) {
    cancelAnimationFrame(animation);const target=targetDomain();
    if(!previousDomain||!animate||matchMedia('(prefers-reduced-motion: reduce)').matches){previousDomain=target;paint(target);return;}
    const start=previousDomain.slice(),at=performance.now();
    function frame(now){const t=Math.min(1,(now-at)/240),ease=1-(1-t)**3;const d=target.map((v,i)=>start[i]+(v-start[i])*ease);previousDomain=d;paint(d);if(t<1)animation=requestAnimationFrame(frame);}
    animation=requestAnimationFrame(frame);
  }
  function paint(d) {
    const e=examples[example],s=history[iteration],svg=$('chart'),w=$('chart-wrap').clientWidth,h=w<440?315:375;
    const l=68,r=w-18,t=22,b=h-57,X=v=>l+(v-d[0])/(d[1]-d[0])*(r-l),Y=v=>b-(v-d[2])/(d[3]-d[2])*(b-t);
    svg.setAttribute('viewBox',`0 0 ${w} ${h}`);svg.replaceChildren();
    svg.append(node('title',{id:'chart-title'},e.title),node('desc',{id:'chart-description'},`Iteration ${iteration+1}, stage ${phase+1}. Left endpoint ${fmt(s.a)}, right endpoint ${fmt(s.b)}. ${phase>0?'Midpoint '+fmt(s.m)+', residual '+fmt(s.fm)+'.':''} Shaded intervals show the retained and discarded halves at stage three. The horizontal line is zero residual.`));
    const defs=node('defs'),clip=node('clipPath',{id:'plot-clip'});clip.append(node('rect',{x:l,y:t,width:r-l,height:b-t}));defs.append(clip);svg.append(defs);
    const g=node('g',{'clip-path':'url(#plot-clip)'});svg.append(g);
    if(phase===2&&!s.done){g.append(node('rect',{class:'discarded',x:X(s.a),y:t,width:X(s.b)-X(s.a),height:b-t}),node('rect',{class:'kept',x:X(s.na),y:t,width:X(s.nb)-X(s.na),height:b-t}));}
    else g.append(node('rect',{class:'kept',x:X(s.a),y:t,width:X(s.b)-X(s.a),height:b-t,opacity:.55}));
    const yTicks=ticks(d[2],d[3],4), xTicks=ticks(d[0],d[1],w<440?2:4);
    for(const v of yTicks){g.append(node('line',{class:v===0?'zero':'grid',x1:l,x2:r,y1:Y(v),y2:Y(v)}));svg.append(node('text',{x:l-8,y:Y(v)+4,'text-anchor':'end'},fmt(v,5)));}
    g.append(node('line',{class:'zero',x1:l,x2:r,y1:Y(0),y2:Y(0)}));
    for(const v of xTicks){g.append(node('line',{class:'grid',x1:X(v),x2:X(v),y1:t,y2:b}));svg.append(node('text',{x:X(v),y:b+23,'text-anchor':'middle'},fmt(v,5)));}
    let path='';for(let i=0;i<=240;i++){const x=d[0]+(d[1]-d[0])*i/240;path+=`${i?'L':'M'}${X(x).toFixed(2)},${Y(e.f(x)).toFixed(2)} `;}g.append(node('path',{class:'curve',d:path}));
    if(phase===2&&!s.done){for(const [label,a,b] of [['Keep',s.na,s.nb],['Discard',s.left?s.m:s.a,s.left?s.b:s.m]])if(X(b)-X(a)>58)g.append(node('text',{x:(X(a)+X(b))/2,y:t+17,'text-anchor':'middle'},label));}
    const points=[['a',s.a,s.fa],['b',s.b,s.fb]];if(phase>0)points.push(['m',s.m,s.fm]);
    for(const [label,x,y]of points){const px=X(x),py=Y(y);g.append(node('line',{class:'guide',x1:px,x2:px,y1:py,y2:Y(0)}));
      if(label==='m')g.append(node('path',{class:'midpoint',d:`M${px},${py-6}l6,6 -6,6 -6,-6Z`}));else g.append(node('circle',{class:'endpoint',cx:px,cy:py,r:5}));
      if(X(s.b)-X(s.a)>65||label==='m')g.append(node('text',{class:'point-label',x:px+(label==='b'? -10:10),y:py+(y>0?-12:22),'text-anchor':label==='b'?'end':'start'},label));
    }
    svg.append(node('rect',{class:'axis',x:l,y:t,width:r-l,height:b-t}),node('text',{'data-axis':'x',class:'axis-title',x:(l+r)/2,y:h-7,'text-anchor':'middle'},e.xTitle),node('text',{'data-axis':'y',class:'axis-title',x:14,y:(t+b)/2,'text-anchor':'middle',transform:`rotate(-90 14 ${(t+b)/2})`},e.yTitle));
  }
  $('iteration').addEventListener('input',ev=>{iteration=+ev.target.value-1;update();save();});
  $('iteration-number').addEventListener('input',ev=>{if(ev.target.value==='')return;iteration=Math.min(history.length-1,Math.max(0,Math.round(+ev.target.value)-1));update();save();});
  $('iteration-number').addEventListener('blur',()=>{$('iteration-number').value=iteration+1;});
  $('example').addEventListener('change',ev=>{example=ev.target.value;iteration=0;phase=0;previousDomain=null;buildHistory();update(false);save();});
  $('zoom').addEventListener('change',ev=>{zoom=ev.target.checked;update();save();});
  document.querySelectorAll('[data-phase]').forEach(b=>b.addEventListener('click',()=>{phase=+b.dataset.phase;update();save();}));
  $('previous').addEventListener('click',()=>{if(phase>0)phase--;else if(iteration>0){iteration--;phase=2;}update();save();});
  $('next').addEventListener('click',()=>{if(phase<2)phase++;else if(iteration<history.length-1){iteration++;phase=0;}update();save();});
  try{const state=JSON.parse(localStorage.getItem('phy4605-bisection'));if(state&&examples[state.example]){example=state.example;phase=Number.isInteger(state.phase)?Math.max(0,Math.min(2,state.phase)):0;zoom=state.zoom!==false;iteration=Number.isInteger(state.iteration)?state.iteration:0;}}catch{}
  buildHistory();iteration=Math.max(0,Math.min(history.length-1,iteration));update(false);
  new ResizeObserver(()=>draw(false)).observe($('chart-wrap'));
})();
