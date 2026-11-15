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
assets/fonts/           Hanken Grotesk — self-hosted
  assets/score/           the score strips
  lib/paths.ts            href(): base-aware internal links
  lib/score.ts            which score strip a page gets
scripts/                 new-work.mjs, check-content.mjs, make-strips.py
```

### Content model

Works carry a closed `primaryCategory` (`ai`, `electroacoustic`, `electronic`,
`acoustic`) and a `status` (`draft`, `published`, `archived`). Drafts never reach
the built site. Works can belong to a `series` — an album — which is validated
against `src/content/series/` at build time.

## Design

A white gallery. Small, calm type, a great deal of space, nothing that is not
information: no shadows, no ornament. A pale sage ground with dark green-black
text; every change from one part to the next is marked by a short violet line
(`.sec::before`, and a shorter one between entries); violet is also the line
the repertoire runs under, and selected text is highlighted yellow. Every colour is
a name in `:root` (`--ground`, `--ink`, `--grey`, `--hair`, `--line`,
`--yellow`, `--panel`, …), so the palette is changed in one place. Every section is set
the same way — a quiet grey label on the left, what it names on the right
(`.sec`, `.sec__label`, `.sec__body` in `src/styles/global.css`). Works and
events are entries: a title, a grey line saying what and when, and what it is.

The one picture is the repertoire: in a narrow column at the right edge (a low
band across the top on a phone) one of Ömer's scores runs past under a thin
line as the page is scrolled (`BaseLayout.astro`). `scripts/make-strips.py`
builds the strips straight from the score PDFs, trimming only the running head
and foot; `src/lib/score.ts` picks one per page. They are not the scores of the
works whose pages they run beside, and the caption under the column says so.

Typeface: **Hanken Grotesk** (chosen by Ömer on the test site from five
candidates), self-hosted.

### Test publication

Every internal link goes through `href()` (`src/lib/paths.ts`), so the same
code can be built for a subfolder without touching the live site:

```bash
SITE_BASE=/test/ SITE_TEST=1 npx astro build --outDir dist-test
```

`SITE_TEST=1` adds `noindex`, and leaves out the sitemap and the visitor
counter. Delete `dist-test/CNAME` before publishing a test build anywhere.

## Deployment

Pushing to `main` runs `.github/workflows/deploy.yml`, which builds the site and
publishes it to GitHub Pages. Nothing is deployed by hand.

## Licence

Site code: MIT. Music, program notes, recordings and all other content:
© Ömer Kurtuluş, all rights reserved. Hanken Grotesk is used under the SIL Open Font
License 1.1 — see the `OFL-*.txt` files in `src/assets/fonts/`.
