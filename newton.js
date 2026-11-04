'use strict';
(() => {
  const $ = id => document.getElementById(id);
  const examples = {
    projectile: {
      f: x => 400 / 9.81 * Math.sin(x * Math.PI / 90) - 35,
      df: x => 400 / 9.81 * Math.cos(x * Math.PI / 90) * Math.PI / 90,
      start:25, range:[20,40], tolerance:0.001, xUnit:'°', yUnit:'m', slopeUnit:'m per degree',
      title:'Projectile-range residual', xTitle:'Launch angle, θ (degrees)', yTitle:'Residual (m)',
      equation:'f(θ) = (20² / 9.81) sin(2θ) − 35',
      description:'At 20 m/s, which low launch angle reaches a 35 m target? Assume level ground, g = 9.81 m/s², and no air resistance. Start at 25°. Angles are in degrees.',
      validation:'Substitute the current angle into the original range equation. Stop when |f(xₙ)| < 0.001 m. Negative means falling short; positive means overshooting. The result validates the calculation within the supplied physical model.'
    },
    square: {
      f:x=>x*x-2, df:x=>2*x, start:1, range:[0.8,2], tolerance:0.0001, xUnit:'', yUnit:'', slopeUnit:'dimensionless',
      title:'Square-root residual', xTitle:'x (dimensionless)', yTitle:'Residual (dimensionless)',
      equation:'f(x) = x² − 2;   f′(x) = 2x',
      description:'Find the positive number whose square is two, starting at x₀ = 1. All quantities are dimensionless.',
      validation:'Square the current estimate and subtract two. Stop when |f(xₙ)| < 0.0001. Compare the answer with the independent reference √2 ≈ 1.414213562.'
    }
  };
  let example='projectile',iteration=0,phase=0,zoom=true,history=[],previousDomain=null,animation=0;
  const fmt=(v,d=6)=>v!==0&&Math.abs(v)<1e-5?v.toExponential(3):Number(v.toFixed(d)).toString();
  function buildHistory(){
    const e=examples[example];let x=e.start;history=[];
    for(let n=0;n<30;n++){
      const f=e.f(x),slope=e.df(x),done=Math.abs(f)<e.tolerance;
      const failure=!Number.isFinite(f)||!Number.isFinite(slope)||(!done&&Math.abs(slope)<1e-12);
      const next=done||failure?x:x-f/slope;
      const invalid=failure||!Number.isFinite(next);
      history.push({x,f,slope,next:invalid?x:next,done,failure:invalid});
      if(done||invalid)break;x=next;
    }
    if(!history.at(-1).done&&!history.at(-1).failure)history.at(-1).failure=true;
    $('iteration').max=history.length;$('iteration-number').max=history.length;
  }
  function save(){try{localStorage.setItem('phy4605-newton',JSON.stringify({example,iteration,phase,zoom}));}catch{}}
  function update(animate=true){
    const e=examples[example],s=history[iteration],terminal=s.done||s.failure;
    $('example').value=example;$('zoom').checked=zoom;$('iteration').value=iteration+1;$('iteration-number').value=iteration+1;
    $('iteration-count').textContent=`${iteration+1} of ${history.length}`;
    $('plot-title').textContent=e.title;$('equation').textContent=e.equation;$('model-description').textContent=e.description;$('validation-description').textContent=e.validation;
    $('current-value').textContent=fmt(s.x)+e.xUnit;$('current-residual').textContent=`f(xₙ) = ${fmt(s.f)} ${e.yUnit}`;
    $('slope-value').textContent=phase>0?fmt(s.slope):'—';$('slope-unit').textContent=phase>0?e.slopeUnit:'Not yet evaluated';
    $('next-value').textContent=phase===2&&!terminal?fmt(s.next)+e.xUnit:'—';
    $('next-residual').textContent=terminal?'No further update':phase===2?`f(xₙ₊₁) = ${fmt(e.f(s.next))} ${e.yUnit}`:'Not yet updated';
    document.querySelectorAll('[data-phase]').forEach(b=>{if(+b.dataset.phase===phase)b.setAttribute('aria-current','step');else b.removeAttribute('aria-current');});
    if(s.failure){
      $('stage-title').textContent='Iteration stopped';$('stage-explanation').textContent='A safe finite update is unavailable, or the iteration limit was reached. Choose a different starting estimate or a safeguarded method.';$('calculation').textContent='A root has not been validated.';
    }else if(s.done){
      $('stage-title').textContent='Tolerance reached';$('stage-explanation').textContent='The current estimate satisfies the residual stopping rule. Stop here; another tangent update is unnecessary.';
      $('calculation').textContent=`|f(xₙ)| = ${fmt(Math.abs(s.f))} ${e.yUnit}\n< ${e.tolerance} ${e.yUnit}\nRoot estimate: ${fmt(s.x,8)}${e.xUnit}`;
    }else if(phase===0){
      $('stage-title').textContent='Evaluate the current estimate';$('stage-explanation').textContent='Locate the current estimate on the original curve. The signed vertical distance to the zero line is the residual.';
      $('calculation').textContent=`xₙ = ${fmt(s.x)}${e.xUnit}\nf(xₙ) = ${fmt(s.f)} ${e.yUnit}`;
    }else if(phase===1){
      $('stage-title').textContent='Draw the tangent';$('stage-explanation').textContent='Use the derivative to draw the tangent through the current point. Extend this straight line to the zero-residual axis.';
      $('calculation').textContent=`f′(xₙ) = ${fmt(s.slope)} ${e.slopeUnit}\nTangent: y = f(xₙ) + f′(xₙ)(x − xₙ)`;
    }else{
      $('stage-title').textContent='Use the tangent’s zero crossing';$('stage-explanation').textContent='The diamond is where the tangent reaches zero. Use that input as the next estimate, then evaluate the actual curve there (the open circle).';
      $('calculation').textContent=`xₙ₊₁ = xₙ − f(xₙ) / f′(xₙ)\n= ${fmt(s.x)} − (${fmt(s.f)}) / (${fmt(s.slope)})\n= ${fmt(s.next)}${e.xUnit}`;
    }
    $('residual-value').textContent=fmt(Math.abs(s.f))+(e.yUnit?' '+e.yUnit:'');$('residual-tolerance').textContent=`Stop when below ${e.tolerance}${e.yUnit?' '+e.yUnit:''}`;
    $('previous').disabled=iteration===0&&phase===0;$('next').disabled=terminal;
    draw(animate);
  }
  function node(name,attrs={},text){const el=document.createElementNS('http://www.w3.org/2000/svg',name);for(const[k,v]of Object.entries(attrs))el.setAttribute(k,v);if(text!==undefined)el.textContent=text;return el;}
  function ticks(lo,hi,n){const raw=(hi-lo)/n,p=10**Math.floor(Math.log10(raw)),v=raw/p,step=(v>5?10:v>2?5:v>1?2:1)*p,out=[];for(let x=Math.ceil(lo/step)*step;x<=hi+step*1e-6;x+=step)out.push(Math.abs(x)<step*1e-9?0:x);return out;}
  function domain(){
    const e=examples[example],s=history[iteration],span=e.range[1]-e.range[0];
    let lo=e.range[0],hi=e.range[1];
    if(zoom){const gap=Math.max(Math.abs(s.next-s.x),span*0.0001);lo=Math.min(s.x,s.next)-gap*.45;hi=Math.max(s.x,s.next)+gap*.45;}
    else{lo=Math.min(lo,...history.map(v=>v.x));hi=Math.max(hi,...history.map(v=>v.x));const p=(hi-lo)*.1;lo-=p;hi+=p;}
    const ys=Array.from({length:121},(_,i)=>e.f(lo+(hi-lo)*i/120));
    if(!s.done&&phase>0)ys.push(s.f+s.slope*(lo-s.x),s.f+s.slope*(hi-s.x));
    const min=Math.min(0,...ys),max=Math.max(0,...ys),pad=Math.max(max-min,1e-12)*.15;
    return[lo,hi,min-pad,max+pad];
  }
  function draw(animate){cancelAnimationFrame(animation);const target=domain();if(!animate||!previousDomain||matchMedia('(prefers-reduced-motion: reduce)').matches){previousDomain=target;paint(target);return;}const from=previousDomain.slice(),start=performance.now();function frame(now){const t=Math.min(1,(now-start)/240),p=1-(1-t)**3,d=target.map((v,i)=>from[i]+p*(v-from[i]));previousDomain=d;paint(d);if(t<1)animation=requestAnimationFrame(frame);}animation=requestAnimationFrame(frame);}
  function paint(d){
    if($('chart-wrap').clientWidth<150)return;
    const e=examples[example],s=history[iteration],svg=$('chart'),w=$('chart-wrap').clientWidth,h=w<440?315:375,l=76,r=w-18,t=22,b=h-57;
    const X=x=>l+(x-d[0])/(d[1]-d[0])*(r-l),Y=y=>b-(y-d[2])/(d[3]-d[2])*(b-t);
    svg.setAttribute('viewBox',`0 0 ${w} ${h}`);svg.replaceChildren();svg.append(node('title',{id:'chart-title'},e.title),node('desc',{id:'chart-description'},`Newton iteration ${iteration+1}, stage ${phase+1}. Current estimate ${fmt(s.x)}, residual ${fmt(s.f)}.${phase>0&&!s.done?' The dashed tangent crosses the zero axis at '+fmt(s.next)+'.':''}${s.done?' Residual tolerance reached.':''}`));
    const defs=node('defs'),clip=node('clipPath',{id:'newton-clip'});clip.append(node('rect',{x:l,y:t,width:r-l,height:b-t}));defs.append(clip);svg.append(defs);const g=node('g',{'clip-path':'url(#newton-clip)'});svg.append(g);
    for(const v of ticks(d[2],d[3],4)){g.append(node('line',{class:'grid',x1:l,x2:r,y1:Y(v),y2:Y(v)}));svg.append(node('text',{x:l-8,y:Y(v)+4,'text-anchor':'end'},fmt(v,5)));}
    g.append(node('line',{class:'zero',x1:l,x2:r,y1:Y(0),y2:Y(0)}));
    for(const v of ticks(d[0],d[1],w<440?2:4)){g.append(node('line',{class:'grid',x1:X(v),x2:X(v),y1:t,y2:b}));svg.append(node('text',{x:X(v),y:b+23,'text-anchor':'middle'},fmt(v,5)));}
    let path='';for(let i=0;i<=240;i++){const x=d[0]+(d[1]-d[0])*i/240;path+=`${i?'L':'M'}${X(x)},${Y(e.f(x))} `;}g.append(node('path',{class:'curve',d:path}));
    if(phase>0&&!s.done&&!s.failure)g.append(node('line',{class:'tangent',x1:X(d[0]),x2:X(d[1]),y1:Y(s.f+s.slope*(d[0]-s.x)),y2:Y(s.f+s.slope*(d[1]-s.x))}));
    const px=X(s.x),py=Y(s.f);g.append(node('line',{class:'guide',x1:px,x2:px,y1:py,y2:Y(0)}),node('circle',{class:'current-point',cx:px,cy:py,r:5}),node('text',{class:'point-label',x:px+10,y:py+(s.f>0?-13:22)},'xₙ'));
    if(phase===2&&!s.done&&!s.failure){const nx=X(s.next),ny=Y(0);g.append(node('line',{class:'guide',x1:nx,x2:nx,y1:ny,y2:Y(e.f(s.next))}),node('circle',{class:'endpoint',cx:nx,cy:Y(e.f(s.next)),r:5}),node('path',{class:'midpoint',d:`M${nx},${ny-6}l6,6 -6,6 -6,-6Z`}));if(Math.abs(nx-px)>55)g.append(node('text',{class:'point-label',x:nx+(nx>px?-10:10),y:ny+23,'text-anchor':nx>px?'end':'start'},'xₙ₊₁'));}
    svg.append(node('rect',{class:'axis',x:l,y:t,width:r-l,height:b-t}),node('text',{class:'axis-title','data-axis':'x',x:(l+r)/2,y:h-7,'text-anchor':'middle'},e.xTitle),node('text',{class:'axis-title','data-axis':'y',x:14,y:(t+b)/2,transform:`rotate(-90 14 ${(t+b)/2})`,'text-anchor':'middle'},e.yTitle));
  }
  $('iteration').addEventListener('input',ev=>{iteration=+ev.target.value-1;update();save();});
  $('iteration-number').addEventListener('input',ev=>{if(ev.target.value==='')return;iteration=Math.max(0,Math.min(history.length-1,Math.round(+ev.target.value)-1));update();save();});
  $('iteration-number').addEventListener('blur',()=>{$('iteration-number').value=iteration+1;});
  $('example').addEventListener('change',ev=>{example=ev.target.value;iteration=0;phase=0;previousDomain=null;buildHistory();update(false);save();});
  $('zoom').addEventListener('change',ev=>{zoom=ev.target.checked;update();save();});
  document.querySelectorAll('[data-phase]').forEach(b=>b.addEventListener('click',()=>{phase=+b.dataset.phase;update();save();}));
  $('previous').addEventListener('click',()=>{if(phase>0)phase--;else if(iteration>0){iteration--;phase=2;}update();save();});
  $('next').addEventListener('click',()=>{if(phase<2)phase++;else if(iteration<history.length-1){iteration++;phase=0;}update();save();});
  try{const state=JSON.parse(localStorage.getItem('phy4605-newton'));if(state&&examples[state.example]){example=state.example;iteration=Number.isInteger(state.iteration)?state.iteration:0;phase=Number.isInteger(state.phase)?Math.max(0,Math.min(2,state.phase)):0;zoom=state.zoom!==false;}}catch{}
  buildHistory();iteration=Math.max(0,Math.min(history.length-1,iteration));update(false);new ResizeObserver(()=>draw(false)).observe($('chart-wrap'));
})();
