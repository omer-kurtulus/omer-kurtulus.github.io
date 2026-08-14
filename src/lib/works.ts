import { getCollection, type CollectionEntry } from 'astro:content';
import { CATEGORIES, type Category } from '../content.config';

export type Work = CollectionEntry<'works'>;

/** The URL slug for a work: explicit `slug` frontmatter, else the filename. */
export function workSlug(work: Work): string {
  return work.data.slug ?? work.id;
}

export function workPath(work: Work): string {
  return `/works/${workSlug(work)}`;
}

export function categoryPath(category: Category): string {
  return `/works/category/${category}`;
}

export function seriesPath(id: string): string {
  return `/works/series/${id}`;
}

/**
 * Every work in an album, ordered by `series.part` where given and by date
 * otherwise, so a cycle reads front-to-back rather than newest-first.
 */
export function seriesMembers(works: Work[], seriesId: string): Work[] {
  return works
    .filter((w) => w.data.series?.id.id === seriesId)
    .sort((a, b) => {
      const ap = a.data.series?.part ?? Number.MAX_SAFE_INTEGER;
      const bp = b.data.series?.part ?? Number.MAX_SAFE_INTEGER;
      return ap !== bp ? ap - bp : a.data.date.getTime() - b.data.date.getTime();
    });
}

/** Album ids present in a set of works, in first-appearance order. */
export function seriesIds(works: Work[]): string[] {
  const ids: string[] = [];
  for (const work of works) {
    const id = work.data.series?.id.id;
    if (id && !ids.includes(id)) ids.push(id);
  }
  return ids;
}

/** The printed part marker for a work, e.g. "II" or "3". */
export function partLabel(work: Work): string | undefined {
  const series = work.data.series;
  if (!series) return undefined;
  return series.partLabel ?? (series.part !== undefined ? String(series.part) : undefined);
}

/** Newest first; same-day entries fall back to title so ordering is stable. */
function byDateDesc(a: Work, b: Work): number {
  const delta = b.data.date.getTime() - a.data.date.getTime();
  return delta !== 0 ? delta : a.data.title.localeCompare(b.data.title);
}

/**
 * Every work that belongs on the live site, newest first.
 * `draft` never ships; `archived` is included and filtered per-page.
 */
export async function getVisibleWorks(): Promise<Work[]> {
  const works = await getCollection('works', ({ data }) => data.status !== 'draft');
  return works.sort(byDateDesc);
}

export async function getPublishedWorks(): Promise<Work[]> {
  const works = await getCollection('works', ({ data }) => data.status === 'published');
  return works.sort(byDateDesc);
}

export async function getArchivedWorks(): Promise<Work[]> {
  const works = await getCollection('works', ({ data }) => data.status === 'archived');
  return works.sort(byDateDesc);
}

/** Home-page featured list: explicit `featuredOrder` first, then date. */
export function selectFeatured(works: Work[], limit?: number): Work[] {
  const featured = works
    .filter((w) => w.data.featured)
    .sort((a, b) => {
      const ao = a.data.featuredOrder ?? Number.MAX_SAFE_INTEGER;
      const bo = b.data.featuredOrder ?? Number.MAX_SAFE_INTEGER;
      return ao !== bo ? ao - bo : byDateDesc(a, b);
    });
  return limit ? featured.slice(0, limit) : featured;
}

export function byCategory(works: Work[], category: Category): Work[] {
  return works.filter((w) => w.data.primaryCategory === category);
}

/** Counts for every category, including empty ones, in site-wide order. */
export function categoryCounts(works: Work[]): Array<{ category: Category; count: number }> {
  return CATEGORIES.map((category) => ({
    category,
    count: works.filter((w) => w.data.primaryCategory === category).length,
  }));
}

/**
 * Related works, scored: same album counts for 6, same category for 3, each
 * shared tag for 1. Ties break toward the more recent work.
 */
export function relatedWorks(work: Work, all: Work[], limit = 3): Work[] {
  const tags = new Set(work.data.secondaryTags.map((t) => t.toLowerCase()));
  const seriesId = work.data.series?.id.id;

  return all
    .filter((candidate) => candidate.id !== work.id)
    .map((candidate) => {
      let score = candidate.data.primaryCategory === work.data.primaryCategory ? 3 : 0;
      if (seriesId && candidate.data.series?.id.id === seriesId) score += 6;
      for (const tag of candidate.data.secondaryTags) {
        if (tags.has(tag.toLowerCase())) score += 1;
      }
      return { candidate, score };
    })
    .filter(({ score }) => score > 0)
    .sort((a, b) => (b.score !== a.score ? b.score - a.score : byDateDesc(a.candidate, b.candidate)))
    .slice(0, limit)
    .map(({ candidate }) => candidate);
}

/** Groups works by year, newest year first — used by the archive listing. */
export function groupByYear(works: Work[]): Array<{ year: number; works: Work[] }> {
  const groups = new Map<number, Work[]>();
  for (const work of works) {
    const bucket = groups.get(work.data.year);
    if (bucket) bucket.push(work);
    else groups.set(work.data.year, [work]);
  }
  return [...groups.entries()]
    .sort((a, b) => b[0] - a[0])
    .map(([year, entries]) => ({ year, works: entries.sort(byDateDesc) }));
}

/** Zero-padded catalogue number, e.g. 7 -> "07". */
export function catalogueNumber(index: number): string {
  return String(index + 1).padStart(2, '0');
}

export function primaryListenUrl(work: Work): string | undefined {
  return work.data.media.find((m) => m.type === 'soundcloud')?.url ?? work.data.media[0]?.url;
}

/** Extracts a SoundCloud track path for the click-to-load player. */
export function soundcloudEmbedSrc(url: string): string {
  const params = new URLSearchParams({
    url,
    color: '%23873b32',
    auto_play: 'true',
    hide_related: 'true',
    show_comments: 'false',
    show_user: 'true',
    show_reposts: 'false',
    show_teaser: 'false',
    visual: 'false',
  });
  return `https://w.soundcloud.com/player/?${params.toString()}`;
}
