// @ts-check
import { defineConfig } from 'astro/config';
import mdx from '@astrojs/mdx';
import sitemap from '@astrojs/sitemap';

// The live site is served from the root of the custom domain, so `base` is
// normally '/'. A test publication sets SITE_BASE (e.g. '/test/') to serve the
// same build from a subfolder, and SITE_TEST=1 to keep it out of search
// engines, the sitemap and the visitor counter.
const base = process.env.SITE_BASE || '/';
const isTest = process.env.SITE_TEST === '1';
const prefix = base.replace(/\/$/, '');

/**
 * Root-relative links written in Markdown (`[catalogue](/works)`) follow the
 * base too. The open call lives in its own repository at /what-the-corpus/ and
 * is left alone.
 */
function rehypeBaseLinks() {
  /** @param {any} node */
  const walk = (node) => {
    if (node.type === 'element' && node.tagName === 'a') {
      const link = node.properties?.href;
      if (
        typeof link === 'string' &&
        link.startsWith('/') &&
        !link.startsWith('//') &&
        !link.startsWith('/what-the-corpus')
      ) {
        node.properties.href = `${prefix}${link}`;
      }
    }
    for (const child of node.children ?? []) walk(child);
  };
  return walk;
}

export default defineConfig({
  site: 'https://omerkurtulus.com',
  base,
  trailingSlash: 'ignore',
  integrations: [
    mdx(),
    ...(isTest
      ? []
      : [
          sitemap({
            // Drafts never reach dist/, but keep the filter explicit so a stray
            // route can never leak into the sitemap.
            filter: (page) => !page.includes('/404'),
          }),
        ]),
  ],
  markdown: {
    rehypePlugins: prefix ? [rehypeBaseLinks] : [],
  },
  vite: {
    define: {
      __SITE_TEST__: JSON.stringify(isTest),
    },
  },
  build: {
    format: 'directory',
  },
});
