@echo off
title AtomicOS Launcher
set "OUT=%TEMP%\AtomicOS.html"
powershell -NoProfile -Command "$c=Get-Content -LiteralPath '%~f0' -Encoding UTF8; $i=[array]::IndexOf($c,'<!DOCTYPE html>'); if($i -lt 0){Write-Host 'HTML marker not found'; pause; exit 1}; $c[$i..($c.Count-1)] | Set-Content -LiteralPath '%OUT%' -Encoding UTF8; Start-Process $env:OUT"
exit /b
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8"><meta name="viewport" content="width=device-width,initial-scale=1.0">
<title>AtomicOS</title>
<style>
*,*::before,*::after{box-sizing:border-box;margin:0;padding:0}:root{--bg:#0d1117;--bg2:#161b22;--bg3:#1c2333;--card:#1a1f2e;--hov:#252d3d;--brd:#30363d;--txt:#e6edf3;--txt2:#8b949e;--txt3:#484f58;--acc:#7c3aed;--acc2:#6d28d9;--grn:#3fb950;--blu:#58a6ff;--org:#d29922;--red:#f85149;--cyn:#39d2c0;--r:10px;--rs:6px;--rl:14px;--mono:'SF Mono','Cascadia Code',monospace;--sans:-apple-system,BlinkMacSystemFont,'Segoe UI',sans-serif}
html{font-size:14px}body{font-family:var(--sans);background:var(--bg);color:var(--txt);height:100vh;overflow:hidden;display:flex;flex-direction:column}
::-webkit-scrollbar{width:6px}::-webkit-scrollbar-thumb{background:var(--brd);border-radius:3px}
.top{display:flex;align-items:center;gap:12px;padding:10px 20px;background:var(--bg2);border-bottom:1px solid var(--brd);flex-shrink:0}
.logo{font-weight:700;font-size:1.1rem;display:flex;align-items:center;gap:8px}.logo span{background:linear-gradient(135deg,var(--acc),var(--cyn));-webkit-background-clip:text;-webkit-text-fill-color:transparent}
.pill{padding:4px 12px;border-radius:20px;font-size:.75rem;font-weight:600;display:flex;align-items:center;gap:6px}.pill.on{background:rgba(63,185,80,.12);color:var(--grn);border:1px solid rgba(63,185,80,.3)}.pill.off{background:rgba(248,81,73,.12);color:var(--red);border:1px solid rgba(248,81,73,.3)}
.dot{width:7px;height:7px;border-radius:50%;background:currentColor;animation:p 2s infinite}@keyframes p{50%{opacity:.4}}
.sp{flex:1}.btn{background:var(--bg3);border:1px solid var(--brd);color:var(--txt2);padding:6px 14px;border-radius:var(--rs);cursor:pointer;font-size:.78rem;font-weight:600;display:inline-flex;align-items:center;gap:5px;transition:.2s}.btn:hover{background:var(--hov);color:var(--txt)}.btn.p{background:var(--acc);color:#fff;border-color:var(--acc)}.btn.sm{padding:4px 10px;font-size:.72rem}
.mbar{display:flex;gap:10px;padding:10px 20px;background:var(--bg2);border-bottom:1px solid var(--brd);flex-shrink:0;flex-wrap:wrap;align-items:center}
.mg{display:flex;align-items:center;gap:6px}.ml{font-size:.7rem;text-transform:uppercase;letter-spacing:.8px;font-weight:700;padding:3px 8px;border-radius:4px}.ml.pl{background:rgba(88,166,255,.12);color:var(--blu);border:1px solid rgba(88,166,255,.3)}.ml.cd{background:rgba(63,185,80,.12);color:var(--grn);border:1px solid rgba(63,185,80,.3)}.ml.rv{background:rgba(210,153,34,.12);color:var(--org);border:1px solid rgba(210,153,34,.3)}
.sel{background:var(--bg);border:1px solid var(--brd);color:var(--txt);padding:5px 10px;border-radius:var(--rs);font-size:.8rem;min-width:160px;cursor:pointer}.sel:focus{outline:none;border-color:var(--blu)}
.main{display:flex;flex:1;overflow:hidden}
.side{width:280px;background:var(--bg2);border-right:1px solid var(--brd);display:flex;flex-direction:column;flex-shrink:0;transition:.3s}.side.col{width:0;overflow:hidden;border:none}
.sh{padding:14px 16px;border-bottom:1px solid var(--brd);display:flex;align-items:center;justify-content:space-between}.st{font-size:.85rem;font-weight:700;display:flex;align-items:center;gap:6px}
.sc{flex:1;overflow-y:auto;padding:8px}
.mi{padding:10px 12px;border-radius:var(--rs);cursor:pointer;border:1px solid transparent;margin-bottom:4px;transition:.2s}.mi:hover{background:var(--hov)}.mi.act{background:rgba(124,58,237,.15);border-color:var(--acc)}
.mit{font-size:.85rem;font-weight:600;white-space:nowrap;overflow:hidden;text-overflow:ellipsis}.mim{font-size:.7rem;color:var(--txt3);display:flex;gap:8px;margin-top:3px}.mtag{background:var(--bg3);padding:1px 6px;border-radius:3px;font-size:.65rem;color:var(--cyn)}
.msrch{margin:8px;position:relative}.msrch input{width:100%;background:var(--bg);border:1px solid var(--brd);color:var(--txt);padding:8px 12px 8px 32px;border-radius:var(--rs);font-size:.8rem}.msrch input:focus{outline:none;border-color:var(--blu)}.msrch svg{position:absolute;left:10px;top:50%;transform:translateY(-50%);color:var(--txt3);width:14px;height:14px}
.ctr{flex:1;display:flex;flex-direction:column;min-width:0}
.chat{flex:1;overflow-y:auto;padding:20px;display:flex;flex-direction:column;gap:16px}
.msg{display:flex;gap:12px;max-width:900px;width:100%;animation:mi .3s}@keyframes mi{from{opacity:0;transform:translateY(10px)}to{opacity:1;transform:translateY(0)}}.msg.u{align-self:flex-end;flex-direction:row-reverse}
.mav{width:32px;height:32px;border-radius:var(--rs);display:flex;align-items:center;justify-content:center;font-size:.75rem;font-weight:700;flex-shrink:0}.msg.u .mav{background:var(--acc);color:#fff}.msg.a .mav{background:var(--bg3);color:var(--cyn);border:1px solid var(--brd)}.msg.s .mav{background:rgba(210,153,34,.12);color:var(--org);border:1px solid rgba(210,153,34,.3)}.msg.k .mav{background:rgba(57,210,192,.12);color:var(--cyn);border:1px solid rgba(57,210,192,.3)}
.mbb{background:var(--card);border:1px solid var(--brd);border-radius:var(--rl);padding:14px 18px;font-size:.9rem;line-height:1.6}.msg.u .mbb{background:var(--acc);border-color:var(--acc);color:#fff;border-bottom-right-radius:4px}.msg.a .mbb{border-bottom-left-radius:4px}
.mbb pre{background:var(--bg);border:1px solid var(--brd);border-radius:var(--rs);padding:12px;margin:8px 0;overflow-x:auto;font-family:var(--mono);font-size:.8rem}.mbb code{font-family:var(--mono);font-size:.85em;background:var(--bg);padding:2px 5px;border-radius:3px}.mbb pre code{background:none;padding:0}
.mrl{font-size:.65rem;text-transform:uppercase;letter-spacing:.8px;font-weight:700;color:var(--txt3);margin-bottom:4px}.msg.u .mrl{color:rgba(255,255,255,.6)}
.pipe{padding:12px 20px;background:var(--bg2);border-top:1px solid var(--brd);border-bottom:1px solid var(--brd);flex-shrink:0}.ph{display:flex;align-items:center;justify-content:space-between;margin-bottom:10px}.pt{font-size:.8rem;font-weight:700;color:var(--txt2);text-transform:uppercase;letter-spacing:.5px}
.ps{display:flex;gap:6px;overflow-x:auto;padding-bottom:4px}
.pc{min-width:160px;background:var(--card);border:1px solid var(--brd);border-radius:var(--r);padding:10px 12px;flex-shrink:0;cursor:pointer;transition:.2s}.pc:hover{border-color:var(--txt3)}.pc.act{border-color:var(--acc);box-shadow:0 0 12px rgba(124,58,237,.25)}.pc.dn{border-color:var(--grn);background:rgba(63,185,80,.12)}.pc.fl{border-color:var(--red);background:rgba(248,81,73,.12)}.pc.rv{border-color:var(--org);background:rgba(210,153,34,.12)}
.pn{font-size:.65rem;font-weight:700;color:var(--txt3);margin-bottom:4px}.pc.dn .pn{color:var(--grn)}.ptt{font-size:.8rem;font-weight:600;white-space:nowrap;overflow:hidden;text-overflow:ellipsis}.pst{font-size:.65rem;margin-top:4px;color:var(--txt3)}
.inp{padding:16px 20px;background:var(--bg2);border-top:1px solid var(--brd);flex-shrink:0}.iw{display:flex;gap:10px;align-items:flex-end;max-width:900px;margin:0 auto}
.ib{flex:1;background:var(--bg);border:1px solid var(--brd);border-radius:var(--r);padding:12px 16px;color:var(--txt);font-size:.9rem;font-family:var(--sans);resize:none;min-height:48px;max-height:200px;line-height:1.5}.ib:focus{outline:none;border-color:var(--blu);box-shadow:0 0 0 3px rgba(88,166,255,.1)}.ib::placeholder{color:var(--txt3)}
.sb{background:var(--acc);color:#fff;border:none;border-radius:var(--r);width:48px;height:48px;display:flex;align-items:center;justify-content:center;cursor:pointer;flex-shrink:0}.sb:hover{background:var(--acc2)}.sb:disabled{opacity:.4;cursor:not-allowed}
.rp{width:300px;background:var(--bg2);border-left:1px solid var(--brd);display:flex;flex-direction:column;flex-shrink:0;transition:.3s}.rp.col{width:0;overflow:hidden;border:none}
.fi{display:flex;align-items:center;gap:8px;padding:8px 12px;border-radius:var(--rs);cursor:pointer;font-size:.82rem}.fi:hover{background:var(--hov)}.fi.act{background:rgba(124,58,237,.15);color:var(--acc)}
.fn{white-space:nowrap;overflow:hidden;text-overflow:ellipsis}
.fp{flex:1;overflow:auto;padding:16px;background:var(--bg);margin:8px;border-radius:var(--r);border:1px solid var(--brd);font-family:var(--mono);font-size:.78rem;line-height:1.6;white-space:pre-wrap;display:none}.fp.vis{display:block}
.mo{position:fixed;inset:0;background:rgba(0,0,0,.6);backdrop-filter:blur(4px);z-index:1000;display:none;align-items:center;justify-content:center}.mo.op{display:flex}
.md{background:var(--bg2);border:1px solid var(--brd);border-radius:var(--rl);padding:24px;width:90%;max-width:600px;max-height:80vh;overflow-y:auto;box-shadow:0 8px 32px rgba(0,0,0,.4)}.md h2{font-size:1.1rem;margin-bottom:16px;display:flex;align-items:center;gap:8px}
.md label{display:block;font-size:.8rem;font-weight:600;color:var(--txt2);margin-bottom:6px;margin-top:14px}.md input,.md textarea,.md select{width:100%;background:var(--bg);border:1px solid var(--brd);color:var(--txt);padding:10px 12px;border-radius:var(--rs);font-size:.85rem;font-family:var(--sans)}.md input:focus,.md textarea:focus{outline:none;border-color:var(--blu)}.md textarea{min-height:120px;resize:vertical;font-family:var(--mono);font-size:.8rem}
.ma{display:flex;gap:8px;justify-content:flex-end;margin-top:20px}
.tc{position:fixed;bottom:20px;right:20px;z-index:2000;display:flex;flex-direction:column;gap:8px}.tst{background:var(--card);border:1px solid var(--brd);border-radius:var(--r);padding:12px 18px;font-size:.82rem;box-shadow:0 8px 32px rgba(0,0,0,.4);animation:ti .3s;display:flex;align-items:center;gap:8px;max-width:360px}.tst.s{border-color:rgba(63,185,80,.3)}.tst.e{border-color:rgba(248,81,73,.3)}.tst.i{border-color:rgba(88,166,255,.3)}@keyframes ti{from{opacity:0;transform:translateX(40px)}to{opacity:1;transform:translateX(0)}}
.kp{padding:16px;background:var(--bg);border-top:1px solid var(--brd);max-height:200px;overflow-y:auto;font-family:var(--mono);font-size:.75rem;line-height:1.5;display:none}.kp.vis{display:block}
.kl{color:var(--txt3)}.kv{color:var(--cyn)}.ke{color:var(--red)}.ks{color:var(--grn)}
.emp{display:flex;flex-direction:column;align-items:center;justify-content:center;height:100%;color:var(--txt3);text-align:center;gap:12px;padding:40px}.emp p{font-size:.9rem;max-width:300px;line-height:1.5}
</style>
</head>
<body>
<div class="top">
  <div class="logo">⚛️ <span>AtomicOS</span></div>
  <div id="sp" class="pill off"><div class="dot"></div><span id="stx">Connecting…</span></div>
  <div class="sp"></div>
  <button class="btn" onclick="tSide()">🧠 Memory</button>
  <button class="btn" onclick="tKernel()">⚙️ Kernel</button>
  <button class="btn" onclick="tRight()">📁 Files</button>
  <button class="btn" onclick="oHk()">🧹 Housekeeper</button>
  <button class="btn" onclick="oFold()">📂 Folders</button>
</div>
<div class="mbar">
  <div class="mg"><span class="ml pl">Planner</span><select id="pMod" class="sel"><option value="">— select —</option></select></div>
  <div class="mg"><span class="ml cd">Coder</span><select id="cMod" class="sel"><option value="">— select —</option></select></div>
  <div class="mg"><span class="ml rv">Reviewer</span><select id="rMod" class="sel"><option value="">— select —</option></select></div>
  <div class="sp"></div>
  <button class="btn sm" onclick="refMod()">↻ Refresh</button>
</div>
<div class="main">
  <div class="side" id="side">
    <div class="sh"><div class="st">🧠 Memory Vault</div><button class="btn sm" onclick="oMem()">+ New</button></div>
    <div class="msrch"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="11" cy="11" r="8"/><line x1="21" y1="21" x2="16.65" y2="16.65"/></svg><input type="text" id="mSrch" placeholder="Search…" oninput="fMem()"></div>
    <div class="sc" id="mList"><div class="emp" style="padding:20px"><p style="font-size:.78rem">Set memory folder.</p></div></div>
  </div>
  <div class="ctr">
    <div class="chat" id="chat"><div class="emp" id="emp"><p>Describe a task. The OS handles deterministic logic; LLMs handle reasoning.</p></div></div>
    <div class="kp" id="kPanel"></div>
    <div class="pipe" id="pipe" style="display:none"><div class="ph"><div class="pt">⚡ Atomic Pipeline</div><button class="btn sm" onclick="cPipe()">Cancel</button></div><div class="ps" id="pSteps"></div></div>
    <div class="inp"><div class="iw"><textarea class="ib" id="uIn" placeholder="Task or OS command (e.g., 'calc 15% of 850', 'build a snake game')" rows="1"></textarea><button class="sb" id="sBtn" onclick="send()"><svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><line x1="22" y1="2" x2="11" y2="13"/><polygon points="22 2 15 22 11 13 2 9 22 2"/></svg></button></div></div>
  </div>
  <div class="rp" id="rp">
    <div class="sh"><div class="st">📁 Project Files</div><button class="btn sm" onclick="pProj()">Set</button></div>
    <div class="sc" id="fTree"><div class="emp" style="padding:20px"><p style="font-size:.78rem">Set project folder.</p></div></div>
    <div class="fp" id="fPrev"></div>
  </div>
</div>

<div class="mo" id="memMo"><div class="md"><h2>📝 Memory Note</h2><label>Title</label><input type="text" id="mTit"><label>Tags</label><input type="text" id="mTag"><label>Content</label><textarea id="mCon"></textarea><div class="ma"><button class="btn" onclick="cMem()">Cancel</button><button class="btn p" onclick="svMem()">Save</button></div></div></div>
<div class="mo" id="hkMo"><div class="md"><h2>🧹 Housekeeper</h2><p style="font-size:.85rem;color:var(--txt2)">Consolidates duplicates, deletes empty files, weaves [[wiki-links]].</p><div class="ma"><button class="btn" onclick="cHk()">Close</button><button class="btn p" id="hkBtn" onclick="runHk()">Run</button></div></div></div>
<div class="mo" id="fMo"><div class="md"><h2>📂 Folders</h2><label>Memory</label><div style="display:flex;gap:8px"><input type="text" id="mfp" readonly style="flex:1"><button class="btn" onclick="pMem()">Browse</button></div><label>Project</label><div style="display:flex;gap:8px"><input type="text" id="pfp" readonly style="flex:1"><button class="btn" onclick="pProj()">Browse</button></div><div class="ma"><button class="btn p" onclick="cFold()">Done</button></div></div></div>
<div class="tc" id="tc"></div>

<script>
const API='http://localhost:1234/v1';
let mods=[],mems=[],pFiles=[],mDir=null,pDir=null,pSteps=[],pRun=false,pCan=false,chat=[],curAbort=null,editMem=null,warned=false,connT=null,lastFiles=[];
const OS={hits:0,execs:0,log:[]};
const $=id=>document.getElementById(id);

// ── Helpers ──
const esc=s=>String(s??'').replace(/&/g,'&amp;').replace(/</g,'&lt;').replace(/>/g,'&gt;').replace(/"/g,'&quot;').replace(/'/g,'&#39;');
const stripThink=s=>String(s||'').replace(/<think>[\s\S]*?<\/think>/gi,'').replace(/^[\s\S]*?<\/think>/i,'').trim();
const errMsg=e=>e&&e.name==='AbortError'?'Cancelled':(e&&e.message)||String(e);
const stamp=()=>{const d=new Date(),p=n=>String(n).padStart(2,'0');return `${d.getFullYear()}${p(d.getMonth()+1)}${p(d.getDate())}-${p(d.getHours())}${p(d.getMinutes())}${p(d.getSeconds())}`};
const slug=s=>String(s).toLowerCase().replace(/[^a-z0-9]+/g,'-').replace(/^-|-$/g,'').slice(0,60)||'note';
function klog(kind,msg){OS.log.push(`<span class="${kind==='err'?'ke':'ks'}">[OS]</span> ${esc(msg)}`);if(OS.log.length>500)OS.log.shift();if($('kPanel').classList.contains('vis'))renderK()}
function cleanPath(p){return String(p).replace(/\\/g,'/').split('/').filter(x=>x&&x!=='.'&&x!=='..').map(x=>x.replace(/[<>:"|?*\x00-\x1f]/g,'_')).join('/')}
function parseJSONArray(txt){
  const s=String(txt).replace(/```(?:json)?/gi,'');
  const a=s.indexOf('[');if(a<0)return null;
  for(let b=s.lastIndexOf(']');b>a;b=s.lastIndexOf(']',b-1)){try{const v=JSON.parse(s.slice(a,b+1));if(Array.isArray(v))return v}catch{}}
  return null;
}
function exCode(t){
  const blocks=[...String(t).matchAll(/```[^\n]*\n([\s\S]*?)```/g)].map(m=>m[1]);
  if(blocks.length)return blocks.reduce((a,b)=>b.length>a.length?b:a).trim();
  const open=String(t).match(/```[^\n]*\n([\s\S]*)$/);   // unclosed fence (truncated output)
  return (open?open[1]:t).trim();
}
function verdict(t){
  const all=[...String(t).matchAll(/VERDICT\s*:?\s*\**\s*(APPROVED|REVISION[_ ]NEEDED)/gi)];
  if(all.length)return /^APPROVED$/i.test(all[all.length-1][1]);
  if(/REVISION[_ ]NEEDED|NOT\s+APPROVED/i.test(t))return false;
  return /\bAPPROVED\b/i.test(t);
}

window.onload=()=>{conn();setupIn();if(!window.showDirectoryPicker)t("This browser can't open folders. Use Chrome or Edge for Memory and Project folders.",'e',8000)};

// ── AgentOS Kernel ──
const AgentOS={
  route:(inp)=>{
    const m=inp.match(/^(?:calc|calculate|math)\s+(.+)$/i);
    if(m){
      const e=m[1]
        .replace(/(\d+(?:\.\d+)?)\s*(?:%|percent)\s*of\s*/gi,'($1/100)*')   // "15% of 850"
        .replace(/(\d)\s*[x×]\s*(?=[\d(])/gi,'$1*')                           // "3 x 4"
        .replace(/÷/g,'/').replace(/\^/g,'**');
      const clean=e.replace(/[^0-9+\-*/().%\s]/g,'').trim();
      try{const r=Function('"use strict";return('+clean+')')();if(typeof r==='number'&&isFinite(r))return{type:'math',expr:clean,res:+r.toPrecision(12)}}catch{}
      return{type:'math',err:m[1]};
    }
    if(/^(ls|dir|files)$/i.test(inp))return{type:'fs',act:'list'};
    if(/^clear$/i.test(inp))return{type:'sys',act:'clear'};
    return null;
  },
  exec:(cmd)=>{
    OS.execs++;klog('ok','Exec: '+JSON.stringify(cmd));
    if(cmd.type==='math'){addMsg('k',cmd.err?`<span class="ke">Couldn't evaluate:</span> ${esc(cmd.err)}`:`<span class="kv">Exact math:</span> ${esc(cmd.expr)} = <strong>${cmd.res}</strong>`,'AgentOS');return true}
    if(cmd.type==='fs'){
      if(!pDir){addMsg('k','<span class="ke">No project folder set.</span> Click <strong>Set</strong> in the Files panel.','AgentOS');return true}
      ldFiles().then(()=>addMsg('k',`<span class="kv">Filesystem:</span> ${pFiles.length} file(s)${pFiles.length?'<br>'+pFiles.map(f=>esc(f.n)).join('<br>'):''}`,'AgentOS'));
      return true;
    }
    if(cmd.type==='sys'&&cmd.act==='clear'){$('chat').innerHTML='';chat=[];return true}
    return false;
  },
  // Runs code in an iframe with sandbox="allow-scripts" (no allow-same-origin),
  // so generated code cannot reach this page, its folder handles, or your files.
  sandbox:(code,kind)=>new Promise(res=>{
    const id='sb'+Math.random().toString(36).slice(2),logs=[];let done=false,to=null;
    const f=document.createElement('iframe');f.setAttribute('sandbox','allow-scripts');f.style.display='none';
    const onMsg=e=>{if(e.source!==f.contentWindow||!e.data||e.data.__sb!==id)return;logs.push((e.data.t==='err'?'ERR: ':'')+e.data.m)};
    const finish=()=>{if(done)return;done=true;clearTimeout(to);window.removeEventListener('message',onMsg);f.remove();res(logs)};
    window.addEventListener('message',onMsg);
    const catcher=`<script>(function(){var P=function(t,m){try{parent.postMessage({__sb:${JSON.stringify(id)},t:t,m:String(m).slice(0,500)},'*')}catch(_){}};console.log=console.info=console.warn=function(){P('log',[].slice.call(arguments).join(' '))};console.error=function(){P('log','console.error: '+[].slice.call(arguments).join(' '))};window.onerror=function(m,s,l){P('err',m+(l?' (line '+l+')':''))};window.addEventListener('unhandledrejection',function(e){P('err','Unhandled rejection: '+((e.reason&&e.reason.message)||e.reason))})})();<\/script>`;
    if(kind==='html'){const h=code.match(/<head[^>]*>/i);f.srcdoc=h?code.replace(h[0],h[0]+catcher):catcher+code}
    else f.srcdoc=catcher+'<script>'+code.replace(/<\/script/gi,'<\\/script')+'<\/script>';
    to=setTimeout(finish,2000);
    document.body.appendChild(f);
  }),
  diff:(o,n)=>{const ol=o.split('\n'),nl=n.split('\n');let d=[];for(let i=0;i<Math.max(ol.length,nl.length);i++){if(ol[i]!==nl[i])d.push(`- ${ol[i]||''}\n+ ${nl[i]||''}`)}return d.join('\n')}
};

// ── LM Studio connection ──
async function conn(){
  clearTimeout(connT);
  try{
    const r=await fetch(`${API}/models`,{signal:AbortSignal.timeout(5000)});
    if(!r.ok)throw new Error('HTTP '+r.status);
    const all=((await r.json()).data||[]).map(m=>m.id);
    mods=all.filter(id=>!/embed/i.test(id));if(!mods.length)mods=all;
    popMods();setSt(true);warned=false;
    t(`Connected to LM Studio (${mods.length} model${mods.length===1?'':'s'})`,'s');
  }catch(e){
    setSt(false);
    if(!warned){warned=true;t("Can't reach LM Studio at localhost:1234. Start its server and turn on CORS in the server settings.",'e',9000)}
    connT=setTimeout(conn,3000);
  }
}
function setSt(c){$('sp').className='pill '+(c?'on':'off');$('stx').textContent=c?'LM Studio Online':'Reconnecting…'}
function popMods(){['pMod','cMod','rMod'].forEach(id=>{const s=$(id),c=s.value;s.innerHTML='<option value="">— select —</option>';mods.forEach(m=>{const o=document.createElement('option');o.value=m;o.textContent=m;s.appendChild(o)});if(c&&mods.includes(c))s.value=c;if(!s.value&&mods.length)s.value=mods[0]})}
async function refMod(){warned=false;t('Refreshing…','i');await conn()}

async function callLLM(mod,msgs,chunk){
  if(!mod)throw new Error('No model selected');
  const ac=new AbortController();curAbort=ac;
  klog('ok','LLM call → '+mod);
  try{
    const r=await fetch(`${API}/chat/completions`,{method:'POST',signal:ac.signal,headers:{'Content-Type':'application/json'},body:JSON.stringify({model:mod,messages:msgs,stream:!!chunk,temperature:.3,max_tokens:8192})});
    if(!r.ok){let b='';try{b=(await r.text()).slice(0,200)}catch{}throw new Error(`HTTP ${r.status}${b?': '+b:''}`)}
    if(!chunk){const j=await r.json();return j.choices?.[0]?.message?.content||''}
    const rd=r.body.getReader(),dc=new TextDecoder();let f='',buf='';
    const handle=line=>{line=line.trim();if(!line.startsWith('data:'))return;const d=line.slice(5).trim();if(!d||d==='[DONE]')return;try{const dl=JSON.parse(d).choices?.[0]?.delta?.content;if(dl){f+=dl;chunk(dl,f)}}catch{}};
    while(true){const{done,value}=await rd.read();if(done)break;buf+=dc.decode(value,{stream:true});const ls=buf.split('\n');buf=ls.pop();ls.forEach(handle)}
    buf+=dc.decode();if(buf)handle(buf);
    return f;
  }finally{if(curAbort===ac)curAbort=null}
}

function setupIn(){const i=$('uIn');i.onkeydown=e=>{if(e.key==='Enter'&&!e.shiftKey&&!e.isComposing){e.preventDefault();send()}};i.oninput=()=>{i.style.height='auto';i.style.height=Math.min(i.scrollHeight,200)+'px'}}
function setBusy(b){$('sBtn').disabled=b}

async function send(){
  const i=$('uIn'),txt=i.value.trim();if(!txt)return;
  if(pRun){t('Still working. Wait for the current run to finish.','i');return}
  i.value='';i.style.height='auto';$('emp')?.remove();

  // OS Router intercept
  const osCmd=AgentOS.route(txt);
  if(osCmd){OS.hits++;AgentOS.exec(osCmd);return}

  addMsg('u',esc(txt).replace(/\n/g,'<br>'));
  const isBuild=/\b(build|create|make|develop|implement|code|write|generate|design)\b/i.test(txt);
  const{p,c,r}=getMods();
  if(isBuild&&p&&c&&r){chat.push({role:'user',content:txt});await runPipe(txt);return}

  const mod=p||mods[0];if(!mod){t('Select a model first','e');return}
  chat.push({role:'user',content:txt});
  pRun=true;setBusy(true);
  const el=addMsg('a','',mod);
  try{
    const mc=await getMem(txt);
    const m=[{role:'system',content:'You are a helpful AI.'+(mc?'\n\nRelevant memories:\n'+mc:'')},...chat.slice(-20)];
    const f=await callLLM(mod,m,(d,f)=>updMsg(el,f));
    if(!f.trim())updMsg(el,'(empty response)');
    chat.push({role:'assistant',content:stripThink(f)});
  }catch(e){updMsg(el,'❌ '+errMsg(e));chat.pop()}
  finally{pRun=false;setBusy(false)}
}
function getMods(){return{p:$('pMod').value,c:$('cMod').value,r:$('rMod').value}}
function addMsg(role,html,label){
  const a=$('chat'),d=document.createElement('div');d.className='msg '+role;
  const av=role==='u'?'U':role==='s'?'⚡':role==='k'?'⚙️':(label?esc(String(label).split('/').pop().slice(0,2).toUpperCase()):'AI');
  const dots='<div style="display:flex;gap:4px">'+[0,.2,.4].map(x=>`<span style="width:6px;height:6px;background:var(--txt3);border-radius:50%;animation:p .6s infinite alternate ${x}s"></span>`).join('')+'</div>';
  d.innerHTML=`<div class="mav">${av}</div><div class="mbb">${role!=='u'?`<div class="mrl">${esc(label||role)}</div>`:''}<div class="mt">${html||dots}</div></div>`;
  a.appendChild(d);a.scrollTop=a.scrollHeight;return d;
}
function updMsg(el,txt){el.querySelector('.mt').innerHTML=fmt(txt);const c=$('chat');c.scrollTop=c.scrollHeight}
function fmt(t){return String(t).replace(/&/g,'&amp;').replace(/</g,'&lt;').replace(/>/g,'&gt;').replace(/```(\w*)\n([\s\S]*?)```/g,'<pre><code>$2</code></pre>').replace(/`([^`\n]+)`/g,'<code>$1</code>').replace(/\*\*(.+?)\*\*/g,'<strong>$1</strong>').replace(/\[\[(.*?)\]\]/g,'<span style="color:var(--cyn);font-weight:600">[[$1]]</span>').replace(/^### (.+)$/gm,'<h4 style="margin:8px 0 4px;color:var(--cyn)">$1</h4>').replace(/^## (.+)$/gm,'<h3 style="margin:10px 0 4px;color:var(--blu)">$1</h3>').replace(/\n/g,'<br>')}

// ── Atomic pipeline ──
function sbKind(fn,cr,code){
  const ext=fn?(fn.split('.').pop()||'').toLowerCase():'';
  let k=/^m?js$/.test(ext)?'js':/^html?$/.test(ext)?'html':null;
  if(!k&&!fn){const m=String(cr).match(/```(\w+)/);const l=m&&m[1].toLowerCase();k=(l==='js'||l==='javascript')?'js':l==='html'?'html':null}
  if(k==='js'&&/\brequire\s*\(|^\s*(import|export)\s|\bprocess\.|__dirname/m.test(code))return null; // Node/module code can't run in a page sandbox
  return k;
}
function inlineScripts(html,files){
  return html.replace(/<script\b([^>]*?)\bsrc\s*=\s*["']([^"']+)["']([^>]*)>\s*<\/script>/gi,(all,a,src,b)=>{
    const k=cleanPath(src);return files[k]!=null?`<script${a}${b}>${files[k].replace(/<\/script/gi,'<\\/script')}<\/script>`:all;
  });
}
async function runPipe(task){
  const{p,c,r}=getMods();
  pRun=true;pCan=false;setBusy(true);lastFiles=[];
  if(!pDir)t('No project folder set, so files stay in this session only (download buttons at the end).','i',7000);
  addMsg('s','🧠 <strong>Planner</strong> breaking task into atomic steps…','Pipeline');
  const mc=await getMem(task);
  const pp=[
    'Break the task below into small, atomic implementation steps.',
    'Return ONLY a JSON array, no other text:',
    '[{"id":1,"title":"short title","description":"exactly what to implement in this step","output_file":"relative/path.ext"}]',
    "Rules: at most 15 steps. Several steps may target the same output_file: each step receives that file's current contents and returns the complete updated file. Prefer few files.",
    mc?'\nRelevant memories:\n'+mc:'',
    '\nTask: '+task
  ].join('\n');
  let pr;
  try{pr=stripThink(await callLLM(p,[{role:'user',content:pp}]))}
  catch(e){addMsg('s','❌ Planner failed: '+esc(errMsg(e)),'Pipeline');return endPipe()}
  const arr=parseJSONArray(pr);
  if(!arr||!arr.length){addMsg('s','❌ Could not parse the plan:<pre>'+esc(pr.slice(0,3000))+'</pre>','Pipeline');return endPipe()}
  pSteps=arr.slice(0,15).map((s,i)=>({id:s.id??i+1,title:String(s.title||'Step '+(i+1)),description:String(s.description||s.title||''),output_file:s.output_file?cleanPath(s.output_file):''}));
  renPipe();addMsg('s',`✅ <strong>Planner</strong> created ${pSteps.length} steps. Executing…`,'Pipeline');
  const outline=pSteps.map(s=>`${s.id}. ${s.title}${s.output_file?' → '+s.output_file:''}`).join('\n');
  await svMemAuto('Plan: '+task.slice(0,40),['pipeline'],`## Task\n${task}\n\n## Steps\n${pSteps.map(s=>`${s.id}. **${s.title}**: ${s.description}`).join('\n')}`);

  const files={},res=[],CAP=24000;
  for(let i=0;i<pSteps.length;i++){
    if(pCan)break;
    const s=pSteps[i],fn=s.output_file;setStp(i,'act');
    if(fn&&files[fn]===undefined)files[fn]=await rdFile(fn);   // start from what's on disk, if anything
    const cur=fn?files[fn]:'';
    const others=Object.keys(files).filter(k=>k!==fn&&files[k]).map(k=>`- ${k} (${files[k].length} chars)`).join('\n');
    const fence='```';
    const cp=[
      'You are implementing ONE step of a larger plan.',
      '\nOverall task: '+task,
      '\nPlan:\n'+outline,
      `\nCurrent step ${s.id}: ${s.title}\n${s.description}`,
      others?'\nOther files already written:\n'+others:'',
      fn?(cur?`\nCurrent contents of ${fn}:\n${fence}\n${cur.slice(0,CAP)}\n${fence}${cur.length>CAP?'\n(truncated)':''}`:`\n${fn} does not exist yet.`):'',
      fn?`\nReturn the COMPLETE updated contents of ${fn} in ONE fenced code block, keeping everything from earlier steps that still applies.`:'\nReturn your implementation in one fenced code block.'
    ].join('\n');
    const sm=addMsg('a','',c);
    let cr;
    try{cr=await callLLM(c,[{role:'user',content:cp}],(d,f)=>updMsg(sm,`**Step ${s.id}: ${s.title}**\n\n${f}`))}
    catch(e){setStp(i,'fl');updMsg(sm,`**Step ${s.id}**\n❌ ${errMsg(e)}`);if(pCan)break;continue}
    cr=stripThink(cr);
    const code=exCode(cr);
    if(!code){setStp(i,'fl');updMsg(sm,`**Step ${s.id}**\n❌ Empty response`);continue}
    if(fn){files[fn]=code;if(pDir)await svFile(fn,code)}

    // OS sandbox verification
    let sbNote='';
    const kind=sbKind(fn,cr,code);
    if(kind){
      klog('ok',`Sandbox verifying step ${s.id} (${kind})`);
      const logs=await AgentOS.sandbox(kind==='html'?inlineScripts(code,files):code,kind);
      const errs=logs.filter(l=>l.startsWith('ERR'));
      klog(errs.length?'err':'ok',`Step ${s.id} sandbox: ${errs.length} error(s)`);
      if(errs.length){sbNote='\n\nSandbox runtime errors:\n'+errs.slice(0,10).join('\n');addMsg('k',`<span class="ke">Sandbox:</span> ${errs.length} runtime error(s) in step ${esc(s.id)}<br>${errs.slice(0,5).map(esc).join('<br>')}`,'AgentOS')}
    }
    if(pCan)break;

    setStp(i,'rv');
    const rm=addMsg('a','',r);
    const rp=[
      'Review this code for correctness against the step.',
      `Step ${s.id}: ${s.title}\n${s.description}`,
      fn?'File: '+fn:'',
      `Code:\n${fence}\n${code.slice(0,CAP)}\n${fence}${sbNote}`,
      '\nGive brief comments, then end with exactly one final line, either:\nVERDICT: APPROVED\nor\nVERDICT: REVISION_NEEDED'
    ].join('\n');
    let rr;
    try{rr=stripThink(await callLLM(r,[{role:'user',content:rp}],(d,f)=>updMsg(rm,`**Reviewing ${s.id}**\n\n${f}`)))}
    catch(e){setStp(i,'fl');updMsg(rm,`**Review ${s.id}**\n❌ ${errMsg(e)}`);if(pCan)break;continue}
    const app=verdict(rr);
    setStp(i,app?'dn':'nr');
    res.push({id:s.id,t:s.title,app,f:fn});
    await svMemAuto(`Step ${s.id}: ${s.title}`,['pipeline',app?'ok':'rev'],`## ${s.description}\n\n${fn?'File: '+fn+'\n\n':''}${code.slice(0,1500)}\n\n## Review\n${rr.slice(0,800)}`);
  }
  lastFiles=Object.keys(files).filter(k=>files[k]).map(k=>({n:k,c:files[k]}));
  const ok=res.filter(x=>x.app).length;
  let sum=`🏁 <strong>${pCan?'Stopped':'Complete'}.</strong> ${ok}/${res.length} approved. OS hits: ${OS.hits}`;
  if(lastFiles.length)sum+='<br>Files: '+lastFiles.map(f=>'<code>'+esc(f.n)+'</code>').join(', ');
  if(lastFiles.length&&!pDir)sum+='<br><em>Not saved to disk (no project folder).</em><div style="display:flex;gap:6px;flex-wrap:wrap;margin-top:8px">'+lastFiles.map((f,j)=>`<button class="btn sm" onclick="dlFile(${j})">⬇ ${esc(f.n)}</button>`).join('')+'</div>';
  addMsg('s',sum,'Pipeline');
  endPipe();
}
function endPipe(){pRun=false;pCan=false;setBusy(false)}
function dlFile(j){const f=lastFiles[j];if(!f)return;const a=document.createElement('a');a.href=URL.createObjectURL(new Blob([f.c],{type:'text/plain'}));a.download=f.n.split('/').pop();document.body.appendChild(a);a.click();setTimeout(()=>{URL.revokeObjectURL(a.href);a.remove()},1000)}
function renPipe(){const c=$('pSteps');$('pipe').style.display='block';c.innerHTML='';pSteps.forEach((s,i)=>{const d=document.createElement('div');d.className='pc';d.id=`s-${i}`;d.title=(s.output_file?s.output_file+'\n':'')+s.description;d.innerHTML=`<div class="pn">Step ${esc(s.id)}</div><div class="ptt">${esc(s.title)}</div><div class="pst">Pending</div>`;c.appendChild(d)})}
function setStp(i,s){const c=$(`s-${i}`);if(!c)return;c.className='pc '+({act:'act',rv:'act',dn:'dn',nr:'rv',fl:'fl'}[s]||'');c.querySelector('.pst').textContent={act:'⚡ Coding…',rv:'🔍 Reviewing…',dn:'✅ Approved',nr:'⚠️ Needs revision',fl:'❌ Failed'}[s]||s}
function cPipe(){if(!pRun)return;pCan=true;curAbort?.abort();t('Cancelling…','i')}

// ── Memory & Housekeeper ──
function canPick(){if(window.showDirectoryPicker)return true;t('Folder access needs Chrome or Edge.','e');return false}
async function pMem(){if(!canPick())return;try{mDir=await window.showDirectoryPicker({mode:'readwrite'});$('mfp').value=mDir.name;t(`Memory: ${mDir.name}`,'s');await ldMem();cFold()}catch(e){if(e.name!=='AbortError')t('Failed: '+e.message,'e')}}
async function pProj(){if(!canPick())return;try{pDir=await window.showDirectoryPicker({mode:'readwrite'});$('pfp').value=pDir.name;t(`Project: ${pDir.name}`,'s');await ldFiles();cFold()}catch(e){if(e.name!=='AbortError')t('Failed: '+e.message,'e')}}
async function ldMem(){if(!mDir)return;mems=[];try{for await(const[n,h]of mDir){if(h.kind==='file'&&n.toLowerCase().endsWith('.md')){const f=await h.getFile();const tx=await f.text();mems.push({n,h,...parseFM(tx)})}}}catch(e){console.error(e)}mems.sort((a,b)=>String(b.date).localeCompare(String(a.date)));renMem()}
function parseFM(t){t=String(t).replace(/\r\n/g,'\n');const m=t.match(/^---\n([\s\S]*?)\n---\n?([\s\S]*)$/);if(!m)return{fm:{},con:t,tit:'Untitled',tags:[],date:''};const fm={};m[1].split('\n').forEach(l=>{const[k,...v]=l.split(':');if(k&&k.trim())fm[k.trim()]=v.join(':').trim().replace(/^\[|\]$/g,'').split(',').map(s=>s.trim()).filter(Boolean)});return{fm,con:m[2],tit:fm.title?.join(', ')||'Untitled',tags:fm.tags||[],date:fm.date?.[0]||''}}
function renMem(){const l=$('mList');if(mems.length===0){l.innerHTML='<div class="emp" style="padding:20px"><p style="font-size:.78rem">No memories yet.</p></div>';return}l.innerHTML='';mems.forEach((m,i)=>{const d=document.createElement('div');d.className='mi';d.innerHTML=`<div class="mit">${esc(m.tit)}</div><div class="mim"><span>${esc(m.date)}</span>${m.tags.map(tg=>`<span class="mtag">${esc(tg)}</span>`).join('')}</div>`;d.onclick=()=>oMemEd(i);l.appendChild(d)})}
function fMem(){const q=$('mSrch').value.toLowerCase();document.querySelectorAll('.mi').forEach(el=>{el.style.display=el.textContent.toLowerCase().includes(q)?'':'none'})}
function oMem(f){editMem=f?.n||null;$('mTit').value=f?.tit||'';$('mTag').value=(f?.tags||[]).join(', ');$('mCon').value=f?.con||'';$('memMo').classList.add('op')}
function cMem(){editMem=null;$('memMo').classList.remove('op')}
function noteMd(tit,tags,con){const date=new Date().toISOString().split('T')[0];return `---\ntitle: ${String(tit).replace(/\n/g,' ')}\ntags: [${tags.map(x=>String(x).replace(/[,\]\n]/g,' ')).join(', ')}]\ndate: ${date}\n---\n${con}`}
async function writeMem(fn,md){const h=await mDir.getFileHandle(fn,{create:true});const w=await h.createWritable();await w.write(md);await w.close()}
async function svMem(){
  if(!mDir){t('Set a memory folder first','e');return}
  const tit=$('mTit').value.trim()||'Untitled',tags=$('mTag').value.split(',').map(s=>s.trim()).filter(Boolean),con=$('mCon').value;
  const fn=editMem||slug(tit)+'.md';
  try{await writeMem(fn,noteMd(tit,tags,con));t(`Saved: ${fn}`,'s');await ldMem();cMem()}catch(e){t('Save failed: '+e.message,'e')}
}
async function svMemAuto(tit,tags,con){if(!mDir)return;try{await writeMem(`${stamp()}-${slug(tit)}.md`,noteMd(tit,tags,con));await ldMem()}catch(e){console.error(e)}}
async function getMem(q){if(mems.length===0)return'';const words=q.toLowerCase().split(/\s+/).filter(w=>w.length>2);const rel=mems.filter(m=>{const tx=(m.tit+' '+m.tags.join(' ')+' '+m.con).toLowerCase();return words.some(w=>tx.includes(w))}).slice(0,5);if(rel.length===0)return'';return rel.map(m=>`### ${m.tit}\n${m.con.slice(0,500)}`).join('\n\n')}
function oMemEd(i){oMem(mems[i])}
function oHk(){$('hkMo').classList.add('op')}function cHk(){$('hkMo').classList.remove('op')}
async function runHk(){
  if(!mDir){t('Set memory folder','e');return}
  if(mems.length<2){t('Need 2+ notes','i');return}
  const mod=getMods().p||mods[0];if(!mod){t('Select a model first','e');return}
  if(pRun){t('Still working. Wait for the current run to finish.','i');return}
  const b=$('hkBtn');b.disabled=true;b.textContent='Processing…';t('Housekeeper analyzing…','i');
  const LIM=2000,cut=new Set(mems.filter(m=>m.con.length>LIM).map(m=>m.n));
  const sum=mems.map(m=>`### ${m.n}${cut.has(m.n)?' (truncated, do not merge)':''}\n${m.con.slice(0,LIM)}`).join('\n\n');
  const pp=`Analyze these memory files. 1. Merge true duplicates (the merged content must keep ALL information from every source). 2. Mark empty files for deletion. 3. Suggest [[wiki-links]] between related notes. Return ONLY a JSON array: [{"action":"merge","sources":["a.md","b.md"],"target":"a.md","content":"full merged markdown"},{"action":"link","file":"a.md","add_links":["b"]},{"action":"delete","file":"c.md"}]\n\nFiles:\n${sum}`;
  let raw;pRun=true;
  try{raw=stripThink(await callLLM(mod,[{role:'user',content:pp}]))}catch(e){t('Failed: '+errMsg(e),'e');b.disabled=false;b.textContent='Run';pRun=false;return}
  pRun=false;
  const acts=parseJSONArray(raw);
  if(!acts){t('Could not parse the housekeeper response','e');b.disabled=false;b.textContent='Run';return}
  const names=new Set(mems.map(m=>m.n)),okName=n=>typeof n==='string'&&/^[^\\/:*?"<>|]+\.md$/i.test(n);
  let mg=0,lk=0,dl=0,sk=0;
  for(const a of acts){
    try{
      if(a.action==='merge'){
        const src=Array.isArray(a.sources)?a.sources.filter(s=>names.has(s)):[];
        const safe=okName(a.target)&&src.length>=2&&typeof a.content==='string'&&a.content.trim()&&src.every(s=>!cut.has(s))&&(!names.has(a.target)||src.includes(a.target));
        if(!safe){sk++;continue}
        await writeMem(a.target,a.content);
        for(const s of src){if(s!==a.target){try{await mDir.removeEntry(s)}catch{}}}   // never delete the file we just wrote
        mg++;
      }else if(a.action==='link'&&names.has(a.file)&&Array.isArray(a.add_links)){
        const h=await mDir.getFileHandle(a.file);let c=await (await h.getFile()).text();let changed=false;
        for(const l0 of a.add_links){const l=String(l0).replace(/\.md$/i,'').trim();if(l&&!c.includes(`[[${l}]]`)){c+=`\n\nRelated: [[${l}]]`;changed=true}}
        if(changed){const w=await h.createWritable();await w.write(c);await w.close();lk++}
      }else if(a.action==='delete'&&names.has(a.file)){
        const m=mems.find(x=>x.n===a.file);
        if(m&&!m.con.trim()){await mDir.removeEntry(a.file);dl++}else sk++;   // only ever delete genuinely empty notes
      }
    }catch(e){console.error(e);sk++}
  }
  t(`Done. Merged ${mg}, linked ${lk}, deleted ${dl}${sk?`, skipped ${sk} unsafe`:''}`,'s',6000);
  await ldMem();b.disabled=false;b.textContent='Run';
}

// ── Files ──
async function fileHandle(path,create){const parts=path.split('/');let d=pDir;for(const seg of parts.slice(0,-1))d=await d.getDirectoryHandle(seg,{create});return d.getFileHandle(parts[parts.length-1],{create})}
async function rdFile(path){if(!pDir)return '';try{return await (await (await fileHandle(path,false)).getFile()).text()}catch{return ''}}
async function ldFiles(){
  if(!pDir)return;pFiles=[];
  const walk=async(d,pre,depth)=>{for await(const[n,h]of d){if(pFiles.length>=500)return;if(h.kind==='file')pFiles.push({n:pre+n,h});else if(depth<4&&!/^(node_modules|\.git)$/.test(n))await walk(h,pre+n+'/',depth+1)}};
  try{await walk(pDir,'',0)}catch(e){console.error(e)}
  pFiles.sort((a,b)=>a.n.localeCompare(b.n));renFiles();
}
async function svFile(path,con){if(!pDir)return;try{const h=await fileHandle(path,true);const w=await h.createWritable();await w.write(con);await w.close();t(`Saved: ${path}`,'s');await ldFiles()}catch(e){t('Save failed: '+e.message,'e')}}
function renFiles(){const tr=$('fTree');if(pFiles.length===0){tr.innerHTML='<div class="emp" style="padding:20px"><p style="font-size:.78rem">No files.</p></div>';return}tr.innerHTML='';pFiles.forEach((f,i)=>{const d=document.createElement('div');d.className='fi';const ext=f.n.split('.').pop();const col={js:'var(--org)',ts:'var(--blu)',html:'var(--red)',css:'var(--blu)',json:'var(--grn)',py:'var(--cyn)'}[ext]||'var(--txt3)';d.innerHTML=`<span style="color:${col}">📄</span><span class="fn">${esc(f.n)}</span>`;d.onclick=()=>prevFile(i);tr.appendChild(d)})}
async function prevFile(i){const f=pFiles[i];try{const txt=await (await f.h.getFile()).text();const p=$('fPrev');p.textContent=txt;p.classList.add('vis');document.querySelectorAll('.fi').forEach((el,j)=>el.classList.toggle('act',j===i))}catch(e){t('Could not read file: '+e.message,'e')}}

// ── UI ──
function tSide(){$('side').classList.toggle('col')}
function tRight(){$('rp').classList.toggle('col')}
function renderK(){$('kPanel').innerHTML=OS.log.join('<br>')||'<span class="kl">No OS events yet. Try "calc 15% of 850" or "ls".</span>'}
function tKernel(){const p=$('kPanel');p.classList.toggle('vis');if(p.classList.contains('vis'))renderK()}
function oFold(){$('fMo').classList.add('op')}function cFold(){$('fMo').classList.remove('op')}
function t(msg,type='i',ms=4000){const c=$('tc'),d=document.createElement('div');d.className=`tst ${type}`;const ic={s:'✅',e:'❌',i:'ℹ️'};d.textContent=`${ic[type]||''} ${msg}`;c.appendChild(d);setTimeout(()=>{d.style.opacity='0';d.style.transform='translateX(40px)';setTimeout(()=>d.remove(),300)},ms)}
document.onkeydown=e=>{if(e.ctrlKey&&e.key===','){e.preventDefault();oFold()}if(e.key==='Escape'){cMem();cFold();cHk()}}
</script>
</body>
</html>
