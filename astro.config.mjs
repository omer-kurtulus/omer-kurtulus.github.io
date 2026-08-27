// @ts-check
import { defineConfig } from 'astro/config';
import mdx from '@astrojs/mdx';
import sitemap from '@astrojs/sitemap';

// Custom domain, served from the root. GitHub still hosts it; only the address
// changed, so there is still no `base`.
export default defineConfig({
  site: 'https://omerkurtulus.com',
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
