// @ts-check
import { defineConfig } from 'astro/config';
import mdx from '@astrojs/mdx';
import sitemap from '@astrojs/sitemap';

// User site (omer-kurtulus.github.io) — served from the domain root, so no `base`.
export default defineConfig({
  site: 'https://omer-kurtulus.github.io',
  trailingSlash: 'ignore',
  integrations: [
    mdx(),
    sitemap({
      // Drafts never reach dist/, but keep the filter explicit so a stray
      // route can never leak into the sitemap.
      filter: (page) => !page.includes('/404'),
    }),
  ],
  build: {
    format: 'directory',
  },
});
