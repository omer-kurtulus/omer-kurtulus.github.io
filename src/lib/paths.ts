/**
 * Every internal link goes through `href()`, so the same build can be served
 * from the root of the domain (the live site) or from a subfolder (a test
 * publication) without a single hard-coded path.
 */
const BASE = import.meta.env.BASE_URL.replace(/\/$/, '');

/** True for a test publication: no indexing, no sitemap, no visitor counter. */
export const IS_TEST = __SITE_TEST__;

export function href(path: string): string {
  if (!path.startsWith('/') || path.startsWith('//')) return path;
  // The open call is a separate repository served at this path on the domain.
  if (path.startsWith('/what-the-corpus')) return path;
  return `${BASE}${path}` || '/';
}

/** The page's path without the base and without a trailing slash; '/' for home. */
export function routeOf(pathname: string): string {
  const stripped = BASE && pathname.startsWith(BASE) ? pathname.slice(BASE.length) : pathname;
  return stripped.replace(/\/$/, '') || '/';
}
