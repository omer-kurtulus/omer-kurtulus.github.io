/**
 * The score strips: a few consecutive pages of one of Ömer's scores set side
 * by side as one long image (scripts/make-strips.py). One of them stands
 * beside every page and moves as the page is scrolled.
 */
const files = import.meta.glob<{ default: ImageMetadata }>('../assets/score/strip-*.webp', { eager: true });

const STRIPS = new Map<string, ImageMetadata>(
  Object.entries(files).map(([path, mod]) => [path.replace(/^.*strip-(.+)\.webp$/, '$1'), mod.default]),
);

function hash(text: string): number {
  let h = 2166136261;
  for (let i = 0; i < text.length; i++) {
    h ^= text.charCodeAt(i);
    h = Math.imul(h, 16777619);
  }
  return h >>> 0;
}

/** The strips shared between the pages of individual works, albums and categories. */
const WORK_STRIPS = [...STRIPS.keys()].filter((name) => name.startsWith('work-')).sort();

/**
 * Which strip a route gets. Each main page has its own; a work, album or
 * category always gets the same one of the shared set.
 */
export function stripFor(route: string): ImageMetadata {
  const [, top = '', ...rest] = route.split('/');
  const named: Record<string, string> = { '': 'home', research: 'writing', about: 'about', cv: 'cv', contact: 'contact' };
  let name = named[top] ?? 'home';
  if (top === 'works') {
    name = rest.length === 0 ? 'works' : WORK_STRIPS[hash(route) % WORK_STRIPS.length] ?? 'works';
  }
  return STRIPS.get(name) ?? STRIPS.get('home')!;
}
