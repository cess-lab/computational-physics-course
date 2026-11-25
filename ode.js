'use strict';
(() => {
  const $=id=>document.getElementById(id);
  const room=20, initial=80, finalTime=300;
  let dt=50, tau=100, step=0, states=[];
  const fmt=(value,digits=2)=>Number(value).toFixed(digits);
  const exact=t=>room+(initial-room)*Math.exp(-t/tau);
  const el=(tag,attrs={},text)=>{const node=document.createElementNS('http://www.w3.org/2000/svg',tag);for(const [key,value] of Object.entries(attrs))node.setAttribute(key,value);if(text!==undefined)node.textContent=text;return node;};
  function makeStates(){const count=Math.round(finalTime/dt);states=[{t:0,T:initial}];for(let n=0;n<count;n++){const current=states[n];const rate=-(current.T-room)/tau;states.push({t:(n+1)*dt,T:current.T+dt*rate});}step=0;$('step-slider').max=count;$('step-slider').value=0;}
  function update(){const current=states[step], next=states[step+1], rate=-(current.T-room)/tau, reference=exact(current.t), last=states[states.length-1], exactEnd=exact(finalTime);
    $('step-slider').value=step;$('step-display').textContent=`${step} of ${states.length-1}`;
    $('back').disabled=step===0;$('next').disabled=!next;
    $('current-time').textContent=`${fmt(current.t,1)} s`;$('current-temperature').textContent=`${fmt(current.T,3)} °C`;$('current-rate').textContent=`${fmt(rate,4)} °C/s`;
    $('step-title').textContent=next?'Calculate the next temperature':'Final time reached';
    $('step-description').textContent=next?`At t = ${fmt(current.t,1)} s, use the rate at the current temperature for the next ${fmt(dt,1)} s.`:'All Euler steps have been taken. Compare the final estimate with the exact reference at the same time.';
    $('calculation').textContent=next?`${fmt(current.T,3)} °C + ${fmt(dt,1)} s × (${fmt(rate,4)} °C/s)\n= ${fmt(next.T,3)} °C at ${fmt(next.t,1)} s`:'No further update is needed.';
    $('euler-current').textContent=`${fmt(current.T,3)} °C`;$('exact-current').textContent=`${fmt(reference,3)} °C`;$('current-error').textContent=`${fmt(Math.abs(current.T-reference),3)} °C`;
    $('endpoint-summary').textContent=`For Δt = ${fmt(dt,1)} s: Euler ${fmt(last.T,4)} °C; exact ${fmt(exactEnd,4)} °C; absolute error ${fmt(Math.abs(last.T-exactEnd),4)} °C.`;
    draw(current,next,reference);
  }
  function draw(current,next,reference){const chart=$('chart'),w=$('chart-wrap').clientWidth,height=w<450?320:380,l=65,r=w-18,top=20,bottom=height-55;
    const X=t=>l+t/finalTime*(r-l),Y=T=>bottom-(T-15)/70*(bottom-top);
    chart.setAttribute('viewBox',`0 0 ${w} ${height}`);chart.replaceChildren();
    chart.append(el('title',{id:'chart-title'},'Euler estimates and exact solution for cooling'),el('desc',{id:'chart-description'},`Step ${step} of ${states.length-1}. Current time ${fmt(current.t,1)} seconds, Euler temperature ${fmt(current.T,3)} degrees Celsius, and exact reference ${fmt(reference,3)} degrees Celsius. ${next?`The next Euler estimate is ${fmt(next.T,3)} degrees Celsius at ${fmt(next.t,1)} seconds.`:'Final time reached.'}`));
    const defs=el('defs'),clip=el('clipPath',{id:'ode-clip'});clip.append(el('rect',{x:l,y:top,width:r-l,height:bottom-top}));defs.append(clip);chart.append(defs);const marks=el('g',{'clip-path':'url(#ode-clip)'});chart.append(marks);
    for(const y of [20,40,60,80]){marks.append(el('line',{class:'grid',x1:l,x2:r,y1:Y(y),y2:Y(y)}));chart.append(el('text',{x:l-8,y:Y(y)+4,'text-anchor':'end'},String(y)));}
    for(const t of (w<450?[0,100,200,300]:[0,50,100,150,200,250,300])){marks.append(el('line',{class:'grid',x1:X(t),x2:X(t),y1:top,y2:bottom}));chart.append(el('text',{x:X(t),y:bottom+20,'text-anchor':'middle'},String(t)));}
    marks.append(el('line',{class:'ode-room',x1:l,x2:r,y1:Y(room),y2:Y(room)}));
    const path=Array.from({length:151},(_,i)=>{const t=finalTime*i/150;return `${i?'L':'M'}${X(t).toFixed(2)},${Y(exact(t)).toFixed(2)}`;}).join(' ');marks.append(el('path',{class:'curve',d:path}));
    const shown=states.slice(0,step+1);if(shown.length>1)marks.append(el('path',{class:'ode-path',d:shown.map((p,i)=>`${i?'L':'M'}${X(p.t)},${Y(p.T)}`).join(' ')}));
    for(const p of shown)marks.append(el('circle',{class:'ode-marker',cx:X(p.t),cy:Y(p.T),r:4}));
    if(next){marks.append(el('line',{class:'ode-next',x1:X(current.t),y1:Y(current.T),x2:X(next.t),y2:Y(next.T)}));marks.append(el('circle',{class:'ode-next-marker',cx:X(next.t),cy:Y(next.T),r:5}));}
    marks.append(el('circle',{class:'target-point',cx:X(current.t),cy:Y(current.T),r:6}));
    chart.append(el('rect',{class:'axis',x:l,y:top,width:r-l,height:bottom-top}),el('text',{x:(l+r)/2,y:height-5,'text-anchor':'middle'},'Time, t (s)'),el('text',{x:14,y:(top+bottom)/2,'text-anchor':'middle',transform:`rotate(-90 14 ${(top+bottom)/2})`},'Temperature, T (°C)'));
  }
  $('step-slider').addEventListener('input',e=>{step=Number(e.target.value);update();});
  $('back').addEventListener('click',()=>{if(step>0){step--;update();}});
  $('next').addEventListener('click',()=>{if(step<states.length-1){step++;update();}});
  $('timestep').addEventListener('change',e=>{dt=Number(e.target.value);makeStates();update();});
  $('cooling-time').addEventListener('change',e=>{tau=Number(e.target.value);makeStates();update();});
  makeStates();update();new ResizeObserver(()=>update()).observe($('chart-wrap'));
})();
