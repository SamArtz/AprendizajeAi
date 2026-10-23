const {test,after}=require('node:test');const assert=require('node:assert/strict');const {mkdtempSync,rmSync}=require('node:fs');const {tmpdir}=require('node:os');const path=require('node:path');const {execFileSync}=require('node:child_process');
const directory=mkdtempSync(path.join(tmpdir(),'adaptia-learning-'));
execFileSync(process.execPath,[require.resolve('typescript/bin/tsc'),'lib/learning.ts','--outDir',directory,'--module','commonjs','--target','es2019','--skipLibCheck'],{cwd:path.resolve(__dirname,'..')});
const {groupModules,parseCompletedBranches,canStartBranch}=require(path.join(directory,'learning.js'));after(()=>rmSync(directory,{recursive:true,force:true}));
const data=[
 {id:'1',title:'Fundamentos de Modelos Generativos (LLMs)',orden:1},
 {id:'17',title:'Anatomía y Estructura del Prompt',orden:17},
 {id:'18',title:'Privacidad y Reglas de Seguridad Básicas',orden:18},
 {id:'19',title:'Buscadores Tradicionales vs. IA Generativa',orden:19},
 {id:'20',title:'Formateo y Estructuración de Salidas (JSON, Markdown)',orden:20},
].map(branch=>({...branch,modulo:'Básico',description:'',contenido_teorico:'Teoría',preguntas:[{pregunta_id:Number(branch.id)}]}));
test('prompt starts the basic route; LLM follows privacy and search concepts without changing question associations',()=>{
 const original=data.map(b=>b.id);const [module]=groupModules(data);
 assert.deepEqual(module.branches.map(b=>b.id),['17','18','19','1','20']);assert.deepEqual(data.map(b=>b.id),original);
 for(const branch of module.branches)assert.equal(branch.preguntas,data.find(b=>b.id===branch.id).preguntas);
});
test('intermediate and advanced keep database order',()=>{
 for(const level of ['Intermedio','Avanzado'])assert.deepEqual(groupModules(data.map(b=>({...b,modulo:level})))[0].branches.map(b=>b.id),data.map(b=>b.id));
});
test('existing LLM approval survives the move but cannot bypass a missing new prerequisite',()=>{
 const modules=groupModules(data);const branches=modules[0].branches;
 const completed=parseCompletedBranches('["1","17","18"]',modules);
 assert.deepEqual(completed,['17','18','1']);assert.equal(canStartBranch(branches,2,completed),true);assert.equal(canStartBranch(branches,4,completed),false);
 const updated=parseCompletedBranches(JSON.stringify([...completed,'19']),modules);assert.equal(canStartBranch(branches,4,updated),true);
});
test('new progress and malformed/orphan IDs cannot skip the linear route',()=>{
 const modules=groupModules(data);const branches=modules[0].branches;
 assert.deepEqual(parseCompletedBranches('["17"]',modules),['17']);assert.equal(canStartBranch(branches,0,[]),true);assert.equal(canStartBranch(branches,1,[]),false);
 assert.deepEqual(parseCompletedBranches('["unknown","19"]',modules),[]);assert.deepEqual(parseCompletedBranches('bad',modules),[]);
 assert.equal(canStartBranch(branches,-1,[]),false);
});
