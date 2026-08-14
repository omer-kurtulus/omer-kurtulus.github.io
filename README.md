# omer-kurtulus.github.io

Portfolio site of the composer **Ömer Kurtuluş** — live at
<https://omer-kurtulus.github.io/>.

Static site built with [Astro](https://astro.build). No client-side framework;
the only JavaScript on a page is the ~20 lines that swap in a SoundCloud player
when a visitor asks for one.

## Running it

```bash
npm install
npm run dev        # http://localhost:4321
```

| Script | What it does |
| --- | --- |
| `npm run dev` | Development server with hot reload |
| `npm run build` | Static build into `dist/` |
| `npm run preview` | Serve the built site locally |
| `npm run check` | Astro + TypeScript diagnostics |
| `npm run verify` | `check` then `build` — run this before pushing |
| `npm run new:work` | Add a work (see below) |
| `npm run check:content` | List drafts, unreviewed metadata, works with no recording |
| `npm run check:links` | Request every external URL in the content files |

## Adding a work

Everything on the site is generated from `src/content/`. Adding a work means
adding one file:

```bash
npm run new:work
```

The tool asks for the title, date, category, instrumentation, duration,
description, program note, technology, performers, SoundCloud URL and status,
writes `src/content/works/<slug>.md`, and validates it against the schema.

A new file automatically produces its own detail page, joins the right category,
sorts into the archive by date, appears on the home page if it is featured, gets
a click-to-load player for each linked recording, and enters the sitemap and
structured data. No component or navigation code changes.

**`MAINTENANCE.md` is the full workflow**, written so that Claude Code can add a
work end-to-end — including how to read a SoundCloud description via the API, how
to classify the piece, and what must never be invented.

## Structure

```
src/
  config.ts              site identity, navigation, profiles
  content.config.ts      the schema — one definition for all content
  content/
    works/               one file per work          → /works/<slug>
    series/              albums and cycles          → /works/series/<slug>
    research/            technical notes            → /research/<slug>
    pages/               about, cv, contact
  lib/works.ts           sorting, filtering, related-work scoring
  layouts/               BaseLayout: head, metadata, JSON-LD
  components/            SiteHeader, SiteFooter, WorkRow, PageHeader, SoundCloudPlayer
  pages/                 routes
  styles/global.css      the entire design system
public/fonts/            Karrik, self-hosted
scripts/                 new-work.mjs, check-content.mjs
```

### Content model

Works carry a closed `primaryCategory` (`ai`, `electroacoustic`, `electronic`,
`acoustic`) and a `status` (`draft`, `published`, `archived`). Drafts never reach
the built site. Works can belong to a `series` — an album — which is validated
against `src/content/series/` at build time.

## Design

Contemporary Bauhaus: a modular twelve-column grid, strong typographic hierarchy,
controlled asymmetry, wide negative space, editorial catalogue discipline.

There is no photography, notation, waveform or musical iconography anywhere.
Ornament is CSS-only geometry. Categories are distinguished by rule weight,
geometric mark, numbering and spacing rather than by colour — the single accent
(matte oxide red, `#873B32`) is used sparingly.

Typography is **Karrik** (Jean-Baptiste Morizot & Lucas Le Bihan, Velvetyne),
a grotesque drawn from anonymous, uncredited twentieth-century specimens whose
mismatched details are kept rather than regularised — the same operation the work
performs on sound. It ships in one weight and one italic, so hierarchy is built
from size, case, letter-spacing, colour and space, never from weight.

The palette and every token live in `src/styles/global.css`, with a dark-mode
block driven by `prefers-color-scheme`.

## Deployment

Pushing to `main` runs `.github/workflows/deploy.yml`, which builds the site and
publishes it to GitHub Pages. Nothing is deployed by hand.

## Licence

Site code: MIT. Music, program notes, recordings and all other content:
© Ömer Kurtuluş, all rights reserved. Karrik is used under the SIL Open Font
License 1.1 — see `public/fonts/LICENSE.txt`.
