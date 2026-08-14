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

export const collections = { works, series, pages, research };
