// nanoid@3.3.11 downloaded from https://ga.jspm.io/npm:nanoid@3.3.11/index.browser.js

export{urlAlphabet}from"./url-alphabet/index.js";let random=e=>crypto.getRandomValues(new Uint8Array(e));let customRandom=(e,t,r)=>{let l=(2<<Math.log(e.length-1)/Math.LN2)-1;let n=-~(1.6*l*t/e.length);return(a=t)=>{let o="";while(true){let t=r(n);let h=n|0;while(h--){o+=e[t[h]&l]||"";if(o.length===a)return o}}}};let customAlphabet=(e,t=21)=>customRandom(e,t,random);let nanoid=(e=21)=>crypto.getRandomValues(new Uint8Array(e)).reduce(((e,t)=>{t&=63;e+=t<36?t.toString(36):t<62?(t-26).toString(36).toUpperCase():t>62?"-":"_";return e}),"");export{customAlphabet,customRandom,nanoid,random};

