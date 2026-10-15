const {test,after}=require('node:test');
const assert=require('node:assert/strict');
const {mkdtempSync,rmSync}=require('node:fs');
const {tmpdir}=require('node:os');
const path=require('node:path');
const {execFileSync}=require('node:child_process');
const directory=mkdtempSync(path.join(tmpdir(),'adaptia-auth-'));
execFileSync(process.execPath,[require.resolve('typescript/bin/tsc'),'lib/password.ts','lib/auth-types.ts','--outDir',directory,'--module','commonjs','--target','es2019','--skipLibCheck'],{cwd:path.resolve(__dirname,'..')});
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
