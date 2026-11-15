import type { APIRoute } from 'astro';
import { SITE } from '../config';
import { IS_TEST } from '../lib/paths';

export const GET: APIRoute = () =>
  new Response(
    IS_TEST
      ? 'User-agent: *\nDisallow: /\n'
      : `User-agent: *\nAllow: /\n\nSitemap: ${new URL('sitemap-index.xml', SITE.url).href}\n`,
    { headers: { 'Content-Type': 'text/plain; charset=utf-8' } },
  );
