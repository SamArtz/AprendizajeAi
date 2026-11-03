const {test,after}=require('node:test');
const assert=require('node:assert/strict');
const {mkdtempSync,rmSync}=require('node:fs');
const {tmpdir}=require('node:os');
const path=require('node:path');
const {execFileSync}=require('node:child_process');
const directory=mkdtempSync(path.join(tmpdir(),'adaptia-legal-'));
execFileSync(process.execPath,[require.resolve('typescript/bin/tsc'),'lib/legal-chat.ts','--outDir',directory,'--module','commonjs','--target','es2020','--skipLibCheck'],{cwd:path.resolve(__dirname,'..')});
const {canUseLegalChat,canGenerateLegalAnswer,readLegalQuestion,generateLegalAnswer}=require(path.join(directory,'legal-chat.js'));
after(()=>rmSync(directory,{recursive:true,force:true}));
test('pilot is closed by default and pending documents need explicit test activation',()=>{
 assert.equal(canUseLegalChat('one@example.com',''),false);
 assert.equal(canUseLegalChat('ONE@example.com','one@example.com, two@example.com'),true);
 assert.equal(canUseLegalChat('someone@example.com','one@example.com'),false);
 assert.equal(canGenerateLegalAnswer(false,''),false);
 assert.equal(canGenerateLegalAnswer(false,'false'),false);
 assert.equal(canGenerateLegalAnswer(false,'true'),true);
});
test('request validation rejects oversized bodies and malformed questions',async()=>{
 const request=body=>new Request('https://adaptia.test/api/chat-juridico',{method:'POST',headers:{'Content-Type':'application/json'},body:JSON.stringify(body)});
 assert.equal(await readLegalQuestion(request({question:'aguinaldo'})),'aguinaldo');
 for(const question of ['', 'a', 'x'.repeat(501),42,null]) assert.equal(await readLegalQuestion(request({question})),null);
 assert.equal(await readLegalQuestion(request({question:'valid',padding:'x'.repeat(5000)})),null);
});
const source={id:'ct:198:1',articulo:'198',parte:1,total_partes:1,texto:'Texto del compendio.',paginas_pdf:[46]};
const response=(answer,status='completed')=>new Response(JSON.stringify({status,output:[{content:[{type:'output_text',text:JSON.stringify(answer)}]}]}));
test('provider uses server credentials, no stored response, bounded sources and legal notes',async()=>{
 const previous=process.env.OPENAI_API_KEY;process.env.OPENAI_API_KEY='unit-test-placeholder';
 try {
  const result=await generateLegalAnswer('aguinaldo',[source],[{texto:'Nota legal'}],async(url,options)=>{
   assert.equal(url,'https://api.openai.com/v1/responses');
   const body=JSON.parse(options.body);assert.equal(body.store,false);
   assert(body.instructions.includes('pendiente de verificar'));
   assert(body.input.includes('Nota legal'));
   assert.deepEqual(body.text.format.schema.properties.citations.items.enum,[source.id]);
   return response({answer:'Según el fragmento…',citations:[source.id],insufficient:false});
  });
  assert.deepEqual(result.sources,[source]);
 } finally {if(previous===undefined) delete process.env.OPENAI_API_KEY;else process.env.OPENAI_API_KEY=previous;}
});
test('fabricated citations, unsupported complete answers, truncated responses and provider failures are rejected',async()=>{
 const previous=process.env.OPENAI_API_KEY;process.env.OPENAI_API_KEY='unit-test-placeholder';
 try {
  for(const value of [{answer:'inventada',citations:['unknown'],insufficient:false},{answer:'sin fuentes',citations:[],insufficient:false}]) {
   await assert.rejects(generateLegalAnswer('consulta',[source],[],async()=>response(value)));
  }
  await assert.rejects(generateLegalAnswer('consulta',[source],[],async()=>response({},'incomplete')));
  await assert.rejects(generateLegalAnswer('consulta',[source],[],async()=>new Response('',{status:429})));
 } finally {if(previous===undefined) delete process.env.OPENAI_API_KEY;else process.env.OPENAI_API_KEY=previous;}
});
