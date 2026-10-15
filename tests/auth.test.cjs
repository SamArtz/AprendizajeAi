const {test,after}=require('node:test');
const assert=require('node:assert/strict');
const {mkdtempSync,rmSync}=require('node:fs');
const {tmpdir}=require('node:os');
const path=require('node:path');
const {execFileSync}=require('node:child_process');
const directory=mkdtempSync(path.join(tmpdir(),'adaptia-auth-'));
execFileSync(process.execPath,[require.resolve('typescript/bin/tsc'),'lib/password.ts','lib/auth-types.ts','lib/request-origin.ts','--outDir',directory,'--module','commonjs','--target','es2019','--skipLibCheck'],{cwd:path.resolve(__dirname,'..')});
const {hashPassword,verifyPassword,DUMMY_HASH}=require(path.join(directory,'password.js'));
const {progressKey}=require(path.join(directory,'auth-types.js'));
after(()=>rmSync(directory,{recursive:true,force:true}));
test('passwords use unique salts and verify the exact original text',async()=>{
 const original='Contraseña de prueba 🔒 2026';const a=await hashPassword(original);const b=await hashPassword(original);
 assert.notEqual(a,b);assert.notEqual(a,original);assert.equal(await verifyPassword(original,a),true);
 assert.equal(await verifyPassword(original+' ',a),false);assert.equal(await verifyPassword('otra contraseña',a),false);
 assert.equal(await verifyPassword(original,DUMMY_HASH),false);
 for(const malformed of ['', 'plaintext', 'scrypt$bad$bad',a+'$extra'])assert.equal(await verifyPassword(original,malformed),false);
});
test('progress is namespaced by authenticated account and category',()=>{
 assert.notEqual(progressKey(1,'userLevel'),progressKey(2,'userLevel'));
 assert.notEqual(progressKey(1,'userLevel'),progressKey(1,'completedBranches'));
});

const {checkOrigin}=require(path.join(directory,'request-origin.js'));
test('same-origin login accepts the actual Host instead of the internal Next URL',()=>{
 for(const host of ['localhost:3000','127.0.0.1:3000','192.168.1.20:3000','[::1]:3000']){
  const request=new Request('http://0.0.0.0:3000/api/register',{headers:{Host:host,Origin:`http://${host}`}});
  assert.equal(checkOrigin(request,''),true);
 }
 assert.equal(checkOrigin(new Request('http://localhost:3000/api/login',{headers:{Origin:'http://localhost:3000'}}),''),true);
});
test('cross-origin, different ports, missing and forged origins remain blocked',()=>{
 for(const origin of ['https://evil.example','http://localhost:3001','null','http://localhost:3000/path']){
  assert.equal(checkOrigin(new Request('http://0.0.0.0:3000/api/login',{headers:{Host:'localhost:3000',Origin:origin}}),''),false);
 }
 assert.equal(checkOrigin(new Request('http://localhost:3000/api/login'),''),false);
 assert.equal(checkOrigin(new Request('http://localhost:3000/api/login',{headers:{Host:'localhost:3000',Origin:'https://evil.example','X-Forwarded-Host':'evil.example'}}),''),false);
});
test('explicit APP_URL supports proxies and remains the canonical origin',()=>{
 const request=new Request('http://internal:3000/api/register',{headers:{Host:'internal:3000',Origin:'https://aprende.example'}});
 assert.equal(checkOrigin(request,'https://aprende.example/'),true);
 assert.equal(checkOrigin(request,'https://otra.example'),false);
 assert.equal(checkOrigin(request,'not-a-url'),false);
 assert.equal(checkOrigin(request,'*'),false);
});
