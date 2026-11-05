import { defineCollection, reference, z } from 'astro:content';
import { glob } from 'astro/loaders';

/**
 * Every page on this site is generated from these collections. Adding a work
 * means adding one file to src/content/works/ — no component, layout or
 * navigation code needs to change. See MAINTENANCE.md.
 */

export const CATEGORIES = ['ai', 'electroacoustic', 'electronic', 'acoustic'] as const;
export const STATUSES = ['draft', 'published', 'archived'] as const;

export type Category = (typeof CATEGORIES)[number];
export type Status = (typeof STATUSES)[number];

/** Display metadata for each category. Order here is the site-wide order. */
export const CATEGORY_META: Record<
  Category,
  { label: string; short: string; blurb: string; rule: string }
> = {
  ai: {
    label: 'AI & Machine Listening',
    short: 'AI',
    blurb:
      'Works built with neural audio synthesis, corpus-based machine listening and interactive agents — RAVE, SoMax 2, FluCoMa.',
    rule: 'var(--rule-thick)',
  },
  electroacoustic: {
    label: 'Electroacoustic',
    short: 'Electroacoustic',
    blurb:
      'Fixed media and instrument-plus-processing works, largely spatial: ambisonic and multichannel composition.',
    rule: 'var(--rule-medium)',
  },
  electronic: {
    label: 'Electronic',
    short: 'Electronic',
    blurb: 'Synthesis, generative DSP structures and live electronics.',
    rule: 'var(--rule-thin)',
  },
  acoustic: {
    label: 'Acoustic',
    short: 'Acoustic',
    blurb: 'Notated concert music for soloists, ensembles and orchestra.',
    rule: 'var(--rule-hair)',
  },
};

/** Non-work public activity: conferences, panels, talks, workshops, and what he has founded. */
export const ACTIVITY_KINDS = [
  'conference',
  'panel',
  'talk',
  'workshop',
  'residency',
  'catalogue',
  'founded',
] as const;

export type ActivityKind = (typeof ACTIVITY_KINDS)[number];

/** Printed label for each kind. Order here is not significant — activity sorts by date. */
export const ACTIVITY_KIND_META: Record<ActivityKind, { label: string }> = {
  conference: { label: 'Conference' },
  panel: { label: 'Panel' },
  talk: { label: 'Talk' },
  workshop: { label: 'Workshop' },
  residency: { label: 'Residency' },
  catalogue: { label: 'Catalogue' },
  // Something Ömer founded and runs (The Agora of New Music). Founder, never "editor".
  founded: { label: 'Founded' },
};

const mediaItem = z.object({
  /** `soundcloud` renders a click-to-load player; everything else renders a link. */
  type: z.enum(['soundcloud', 'youtube', 'vimeo', 'bandcamp', 'audio']),
  url: z.string().url(),
  /** Distinguishes multiple recordings of one work, e.g. "Acoustic documentation". */
  title: z.string().optional(),
  note: z.string().optional(),
});

const linkItem = z.object({
  label: z.string(),
  url: z.string().url(),
  type: z.enum(['score', 'video', 'research', 'project', 'press', 'program', 'other']).default('other'),
});

const creditItem = z.object({
  role: z.string(),
  name: z.string(),
});

const performanceItem = z.object({
  /** ISO date, or just a year/month when the exact day is unknown. */
  date: z.string().optional(),
  event: z.string().optional(),
  venue: z.string().optional(),
  city: z.string().optional(),
  country: z.string().optional(),
  performers: z.string().optional(),
});

const works = defineCollection({
  loader: glob({ pattern: '**/*.{md,mdx}', base: './src/content/works' }),
  schema: z
    .object({
      title: z.string().min(1),

      /** Overrides the filename-derived URL slug. Usually omitted. */
      slug: z
        .string()
        .regex(/^[a-z0-9]+(?:-[a-z0-9]+)*$/, 'slug must be lowercase kebab-case')
        .optional(),

      year: z.number().int().min(1900).max(2200),

      /** Sort key. Full ISO date where known, otherwise 1 January of `year`. */
      date: z.coerce.date(),

      primaryCategory: z.enum(CATEGORIES),
      secondaryTags: z.array(z.string()).default([]),

      featured: z.boolean().default(false),
      /** Lower numbers sort first on the home page. Ties fall back to `date`. */
      featuredOrder: z.number().int().optional(),

      status: z.enum(STATUSES).default('draft'),

      /**
       * Membership in an album or cycle. `id` must match a file in
       * src/content/series/ — the build fails otherwise. `part` orders the
       * work within the album; `partLabel` overrides the printed numeral.
       */
      series: z
        .object({
          id: reference('series'),
          part: z.number().int().positive().optional(),
          partLabel: z.string().optional(),
        })
        .optional(),

      instrumentation: z.string().optional(),
      duration: z
        .string()
        .regex(/^\d{1,2}:\d{2}(?::\d{2})?$/, 'duration must be m:ss or h:mm:ss')
        .optional(),

      media: z.array(mediaItem).default([]),

      shortDescription: z.string().max(400).optional(),
      /** Long-form note. Prefer the Markdown body; this is the structured fallback. */
      programNote: z.string().optional(),

      technology: z.array(z.string()).default([]),
      credits: z.array(creditItem).default([]),
      performances: z.array(performanceItem).default([]),
      links: z.array(linkItem).default([]),

      /** Where the metadata came from, for later verification. */
      sourceUrls: z.array(z.string().url()).default([]),

      /** Flags incomplete metadata. Surfaced in `npm run check:content`, never on the site. */
      needsReview: z.boolean().default(false),
    })
    .refine((w) => w.featuredOrder === undefined || w.featured, {
      message: 'featuredOrder is set but featured is false',
      path: ['featuredOrder'],
    })
    .refine((w) => w.date.getUTCFullYear() === w.year, {
      message: 'date and year disagree',
      path: ['date'],
    }),
});

/** Albums and cycles. A work joins one through its `series` field. */
const series = defineCollection({
  loader: glob({ pattern: '**/*.{md,mdx}', base: './src/content/series' }),
  schema: z.object({
    title: z.string(),
    year: z.number().int().min(1900).max(2200),
    summary: z.string().optional(),

    /**
     * Still being written. `year` becomes the year it opened rather than the
     * year it was finished, and the site says so instead of printing a closed
     * date range over work that is not closed.
     */
    ongoing: z.boolean().default(false),

    status: z.enum(STATUSES).default('draft'),
    links: z.array(linkItem).default([]),
    needsReview: z.boolean().default(false),
  }),
});

const pages = defineCollection({
  loader: glob({ pattern: '**/*.{md,mdx}', base: './src/content/pages' }),
  schema: z.object({
    title: z.string(),
    description: z.string().optional(),
    needsReview: z.boolean().default(false),
  }),
});

const research = defineCollection({
  loader: glob({ pattern: '**/*.{md,mdx}', base: './src/content/research' }),
  schema: z.object({
    title: z.string(),
    date: z.coerce.date(),
    summary: z.string().optional(),
    tags: z.array(z.string()).default([]),
    status: z.enum(STATUSES).default('draft'),
    links: z.array(linkItem).default([]),
    needsReview: z.boolean().default(false),
  }),
});

/**
 * Conferences, panels and talks — things Ömer took part in that are not works
 * and not writing. They surface in the home page's Recent block alongside the
 * newest works, so `date` must be the real date of the event.
 */
const activity = defineCollection({
  loader: glob({ pattern: '**/*.{md,mdx}', base: './src/content/activity' }),
  schema: z.object({
    title: z.string().min(1),
    kind: z.enum(ACTIVITY_KINDS),

    /** Full ISO date where known, otherwise the first of the month. */
    date: z.coerce.date(),
    /** Set when only the month or year is known, so the printed date stays honest. */
    datePrecision: z.enum(['day', 'month', 'year']).default('day'),

    /** Who ran it — the platform, festival or institution. */
    organiser: z.string().optional(),
    /** Ömer's part in it, e.g. "Active participant". */
    role: z.string().optional(),
    /** "Online", or a city. */
    location: z.string().optional(),

    summary: z.string().max(400).optional(),

    status: z.enum(STATUSES).default('draft'),
    links: z.array(linkItem).default([]),
    needsReview: z.boolean().default(false),
  }),
});

export const collections = { works, series, pages, research, activity };
