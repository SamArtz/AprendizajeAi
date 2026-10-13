import { unified } from 'unified';
import remarkParse from 'remark-parse';
import remarkGfm from 'remark-gfm';

// El AST conserva listas, tablas y bloques de código aunque contengan líneas vacías.
export function theorySlides(markdown: string, lessonTitle: string): string[] {
  const source = markdown.replace(/\r\n?/g, '\n');
  const root = unified().use(remarkParse).use(remarkGfm).parse(source);
  const slides: string[] = [];
  let headings: string[] = [];
  const normalize = (value: string) => value.trim().normalize('NFD').replace(/[\u0300-\u036f]/g, '').toLowerCase();
  for (const [index, node] of root.children.entries()) {
    const start = node.position?.start.offset;
    const end = node.position?.end.offset;
    if (start === undefined || end === undefined) continue;
    const text = source.slice(start, end).trim();
    if (!text) continue;
    if (node.type === 'thematicBreak') continue;
    if (node.type === 'heading') {
      // El título de la lección ya está en la cabecera de la tarjeta.
      const plain = text.replace(/^#{1,6}\s+/, '').replace(/\s+#+\s*$/, '');
      if (index === 0 && normalize(plain) === normalize(lessonTitle)) continue;
      headings.push(text);
      continue;
    }
    slides.push([...headings, text].join('\n\n'));
    headings = [];
  }
  if (headings.length) slides.push(headings.join('\n\n'));
  return slides.length ? slides : source.trim() ? [source.trim()] : [];
}
