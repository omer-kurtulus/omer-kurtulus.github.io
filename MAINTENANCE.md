# Maintenance

This file is written for Claude Code. When Ömer says **"add my new work to the
site"**, follow the workflow below exactly.

The site is content-driven: adding a work means adding **one Markdown file** to
`src/content/works/`. Never edit a component, layout or navigation file to add a
work. If a work cannot be expressed in the schema, the schema is the thing to
change — not the pages.

---

## Quick reference

| Task | Command |
| --- | --- |
| Local preview | `npm run dev` → http://localhost:4321 |
| Add a work (interactive) | `npm run new:work` |
| Add a work (non-interactive) | `npm run new:work -- --json '{…}'` |
| What still needs attention | `npm run check:content` |
| Verify every external link | `npm run check:links` |
| Type-check and build | `npm run verify` |

Deployment is automatic: a push to `main` triggers `.github/workflows/deploy.yml`,
which builds and publishes to GitHub Pages at <https://omer-kurtulus.github.io/>.

---

## Workflow: adding a conference, panel or talk

These are not works and must never be filed as one — a fake work file would
distort the category counts, `/works` and the JSON-LD graph. They live in
`src/content/activity/` and share the home page's Recent block with the newest
works.

```yaml
---
title: Whose Music?
kind: conference          # conference | panel | talk | workshop | residency
date: 2026-09-07
datePrecision: day        # day | month | year — cut to what is actually known
organiser: Ulysses Platform
role: Active participant
location: Online          # "Online", or a city
summary: >-
  One or two sentences, under 400 characters.
status: published
needsReview: true         # until a public record of it is confirmed
---
```

`links` takes the same shape as a work's. The row links out when there is at
least one; with none it renders as a plain, unclickable row rather than a dead
link. Never invent a URL to make it clickable.

The home page's Recent block is one chronological feed: every work and every
activity entry from the last three months, newest first, cut into months. Works
and activity are interleaved by `date`, so an activity entry needs a truthful
date for the same reason a work does. A quiet quarter falls back to the three
newest items so the block is never empty.

Add the same event to `## Conferences and panels` in `src/content/pages/cv.md`
by hand — the CV is one written document, not a generated listing.

---

## Workflow: adding a new work

### 1. Read the source

Ömer will normally give a SoundCloud URL. Read the track's own description before
writing anything — it usually contains the program note, instrumentation,
duration, dedication and technical credits in the composer's own words.

SoundCloud pages are JavaScript-rendered, so a plain fetch returns a stub. Use
the public API instead:

```bash
# 1. the profile page carries a hydration blob with the numeric user id
curl -sL -A "Mozilla/5.0" https://soundcloud.com/mer-kurtulu-399116903/tracks -o /tmp/sc.html

# 2. any of the page's JS bundles carries a public client_id
#    (grep the last few <script src=…> files for a 32-character client_id)

# 3. then the track list, descriptions and durations come back as JSON
curl -s "https://api-v2.soundcloud.com/users/220447945/tracks?limit=50&client_id=$CID"
```

The composer's SoundCloud user id is **220447945**.

### 2. Classify the work

`primaryCategory` must be exactly one of `ai`, `electroacoustic`, `electronic`,
`acoustic`. Decide from what the piece *does*, not from how it is tagged:

- **`ai`** — a machine-learning system is part of the compositional or performing
  mechanism: RAVE, nn~, SoMax 2, FluCoMa, corpus navigation, neural synthesis.
- **`electroacoustic`** — acoustic sound sources processed or spatialised;
  acousmatic and fixed-media work; instrument-plus-electronics.
- **`electronic`** — synthesis, generative DSP, live electronics with no acoustic
  source at the centre.
- **`acoustic`** — notated concert music, no electronics.

When a work sits between two, choose the one that describes its *engine*. Put the
second reading in `secondaryTags`. If it is genuinely unclear, ask Ömer rather
than guessing.

### 3. Cross-check what you were told

Compare Ömer's message against the SoundCloud description and any linked
programme or concert listing. Where they disagree, ask. Where a fact is simply
missing — instrumentation, exact date, performers — **leave the field out and set
`needsReview: true`**. Do not invent instrumentation, dates, venues, awards,
degrees or teachers. An empty field is correct; a plausible guess is not.

### 4. Create the content file

```bash
npm run new:work -- --json '{
  "title": "New Work",
  "year": 2026,
  "date": "2026-09-14",
  "primaryCategory": "ai",
  "secondaryTags": ["neural audio", "ambisonics"],
  "instrumentation": "Fixed media, 8 channels",
  "duration": "9:20",
  "shortDescription": "One or two sentences, under 400 characters.",
  "programNote": "The full note. Becomes the Markdown body; edit the file afterwards for headings and paragraphs.",
  "technology": ["Max 9", "RAVE / nn~ (IRCAM ACIDS)"],
  "credits": [{"role": "Composition", "name": "Ömer Kurtuluş"}],
  "performances": [{"date": "2026-09-14", "venue": "…", "city": "…", "country": "…"}],
  "media": [{"type": "soundcloud", "url": "https://soundcloud.com/…"}],
  "links": [{"label": "Score", "url": "https://…", "type": "score"}],
  "sourceUrls": ["https://soundcloud.com/…"],
  "featured": true,
  "featuredOrder": 1,
  "status": "published"
}'
```

The tool slugifies the title (Turkish characters included), writes
`src/content/works/<slug>.md`, and runs `astro sync` so a schema violation
surfaces immediately.

Then open the generated file and format the program note properly — paragraphs,
a `## Technical note` heading where there is one. The Markdown body is what the
detail page renders.

### 5. Place it correctly

Everything below happens automatically once the file exists — do not hand-edit
any page to achieve it:

- a detail page at `/works/<slug>`
- membership of `/works/category/<primaryCategory>`
- position in `/works`, sorted newest-first by `date`
- appearance on the home page if `featured: true` (order by `featuredOrder`)
- a click-to-load SoundCloud player for every `media` entry of type `soundcloud`
- entries in `sitemap-index.xml` and the JSON-LD `MusicComposition` graph

Two things need a decision rather than a default:

- **`featured`** — the home page shows the three newest works automatically, then
  the featured list beneath. Only set `featured: true` if the work should stay on
  the home page after newer work arrives. Renumber the other works'
  `featuredOrder` if you insert one at the top.
- **`status`** — `draft` is invisible on the live site, `published` is live,
  `archived` is reachable and listed but kept out of the home page's foreground.
  Early works use `archived`.

### 6. Albums

If the work belongs to an album or cycle, add:

```yaml
series:
  id: strata      # must match a file in src/content/series/
  part: 3
  partLabel: "III"
```

`id` is validated against `src/content/series/` at build time — an unknown album
fails the build rather than shipping a broken link. To start a new album, create
`src/content/series/<slug>.md` first:

```yaml
---
title: Album Name
year: 2026
ongoing: false      # true for a project still being written — see below
status: published
summary: >-
  One sentence describing the album.
---

The album note, in Markdown.
```

The album then gets its own page at `/works/series/<slug>`, appears in the Albums
block on `/works`, shows in each member work's sidebar, and ranks its siblings
first in Related Works.

Set `ongoing: true` for a project that is still open rather than a finished
album. The site then prints an open range instead of a closed year — "03 works
so far · 2026 — ongoing" in the Albums block, "Ongoing project · 03 · since
2026" on its own page — and the heading on `/works` reads "Albums and projects".
Clear the flag when the project closes.

### 7. Check every link

```bash
npm run check:links
```

Every URL in the content files is requested. Fix anything that does not return
200 before continuing.

### 8. Build and type-check

```bash
npm run verify
```

This runs `astro check` (0 errors required) and `astro build`. Both must pass.
`npm run check:content` afterwards lists anything still marked `needsReview`.

### 9. Commit and push

```bash
git add -A
git commit -m "Add <Work Title> (<year>)"
git push
```

### 10. Confirm the deployment

```bash
gh run list --limit 1
gh run watch
```

Then confirm the page is actually live:

```bash
curl -sI https://omer-kurtulus.github.io/works/<slug>/ | head -1   # expect 200
```

GitHub Pages can take a minute or two after the workflow reports success.

---

## Editing an existing work

Edit the file in `src/content/works/` and push. Do not rename the file unless the
URL should change — the filename *is* the slug. To change the title but keep the
URL, add an explicit `slug:` field.

## The schema

`src/content.config.ts` is the single definition of what a work may contain.
Adding a field means editing that file and then the components that should render
it. Enums (`primaryCategory`, `status`, link `type`) are closed — a value outside
them fails the build.

Two cross-field rules are enforced there:

- `featuredOrder` may only be set when `featured` is `true`
- `date` and `year` must agree

## Design constraints

These are deliberate (Ömer, 15 Nov 2026, after five rejected designs). Keep them.

- A gallery on a light grey ground (`--ground` #e7e7e5), near-black text, one
  grey for what is quiet. Two signals only: electric blue (`--line` #1f3cff)
  for the short lines that separate the parts and the line the repertoire runs
  under, and yellow (`--yellow`) behind selected text, which stays black.
  Chosen by Ömer on 15 Nov 2026 so that a visitor coming from the Agora does
  not think the two sites came off the same lathe: no white paper + black +
  red, no thin outlined boxes. He rejected ochre, brown, cobalt and turquoise
  earlier; red was dropped because it is the Agora's colour.
- The Agora badge and the commission link sit together in a filled block a
  shade darker than the ground (`--panel`), not an outlined box.
- Typeface: Hanken Grotesk, self-hosted. One face only.
- Nothing illustrative or cartoonish: no drawn ground, no tilted tags, no
  shadows, no boxes, no wavy edges.
- The site must not resemble The Agora of New Music: no cream paper with black
  and dark red, no Bodoni or other high-contrast serif, no letter-spaced
  capital labels.
- The one picture is the repertoire running at the right as the page scrolls —
  the only idea he kept from all five earlier designs. Keep it small. A strip
  never shows a running head or foot, and it is not the score of the work it
  runs beside — keep the caption.
- Every section is a `.sec`: grey label left, content right. Hierarchy comes
  from place and space, hardly from size.
- Internal links go through `href()` from `src/lib/paths.ts`, never a bare
  `"/works"`, so a test build can live in a subfolder (see README, "Test
  publication").

## Sources of truth for biography and CV

About and CV are built from Ömer's own *Tabellarischer Lebenslauf*
(`~/Downloads/Omer_Kurtulus_Tabellarischer Lebenslauf 2.docx` — check for a newer
version before relying on it). Education, mentors, awards, residencies,
performances and teaching all come from that document.

To read it:

```bash
python3 -c "
import zipfile, re, html
z = zipfile.ZipFile('<path to the docx>')
xml = z.read('word/document.xml').decode('utf-8')
xml = re.sub(r'</w:p>', chr(10), xml)
print(html.unescape(re.sub(r'<[^>]+>', '', xml)))
"
```

Hyperlinks live separately in `word/_rels/document.xml.rels` — extract them if you
need the YouTube or Drive URLs.

**Do not invent anything that is not in that document or in a recording's own
description.** Not instrumentation, not dates, not venues, not prizes. If a fact is
missing, leave the field out and set `needsReview: true`. Pending submissions and
unconfirmed competition results stay off the site entirely until they are facts.

## Framing

Ömer's practice is framed as **sonic archaeology** — the through-line of all his
work, acoustic as much as electronic, and not tied to any single piece or
technology. Do not describe it as belonging to the electronics alone, and do not
reduce it to "the sound archaeology of cities"; the cities are a subject of the
*Strata* album, not the definition of the method.
