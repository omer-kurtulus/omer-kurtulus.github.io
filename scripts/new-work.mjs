#!/usr/bin/env node
/**
 * Creates a new work file in src/content/works/.
 *
 *   npm run new:work                      interactive prompts
 *   npm run new:work -- --json '{...}'     from a JSON object
 *   npm run new:work -- --file work.json   from a JSON file
 *   npm run new:work -- --json '{...}' --force   overwrite an existing file
 *
 * The JSON modes exist so that Claude Code (see MAINTENANCE.md) can add a work
 * in one non-interactive call. Field names match the frontmatter exactly.
 *
 * After writing, `astro sync` runs so that a schema violation surfaces here
 * rather than at build time.
 */

import { spawnSync } from 'node:child_process';
import { existsSync, mkdirSync, readFileSync, writeFileSync } from 'node:fs';
import { createInterface } from 'node:readline/promises';
import { dirname, join, resolve } from 'node:path';
import { fileURLToPath } from 'node:url';
import { stdin, stdout } from 'node:process';

const ROOT = resolve(dirname(fileURLToPath(import.meta.url)), '..');
const WORKS_DIR = join(ROOT, 'src', 'content', 'works');
const SERIES_DIR = join(ROOT, 'src', 'content', 'series');

const CATEGORIES = ['ai', 'electroacoustic', 'electronic', 'acoustic'];
const STATUSES = ['draft', 'published', 'archived'];
const LINK_TYPES = ['score', 'video', 'research', 'project', 'press', 'program', 'other'];

// ---------------------------------------------------------------------------
// helpers
// ---------------------------------------------------------------------------

/** Turkish-aware slugify: ş→s, ğ→g, ı→i, İ→i, ö→o, ü→u, ç→c. */
export function slugify(input) {
  const map = { ş: 's', Ş: 's', ğ: 'g', Ğ: 'g', ı: 'i', İ: 'i', ö: 'o', Ö: 'o', ü: 'u', Ü: 'u', ç: 'c', Ç: 'c' };
  return input
    .replace(/[şŞğĞıİöÖüÜçÇ]/g, (ch) => map[ch] ?? ch)
    .normalize('NFD')
    .replace(/\p{Diacritic}/gu, '')
    .toLowerCase()
    .replace(/[^a-z0-9]+/g, '-')
    .replace(/^-+|-+$/g, '');
}

function fail(message) {
  console.error(`\n✗ ${message}\n`);
  process.exit(1);
}

/** Splits "a, b, c" into a trimmed array; empty input yields []. */
function list(value) {
  if (Array.isArray(value)) return value.map((v) => String(v).trim()).filter(Boolean);
  if (!value) return [];
  return String(value)
    .split(',')
    .map((v) => v.trim())
    .filter(Boolean);
}

function bool(value, fallback = false) {
  if (typeof value === 'boolean') return value;
  if (value === undefined || value === null || value === '') return fallback;
  return /^(y|yes|true|1)$/i.test(String(value).trim());
}

/** Quotes a YAML scalar only when it needs it. */
function yamlScalar(value) {
  const str = String(value);
  if (str === '') return "''";
  if (/^[\d.+-]/.test(str) && !/^\d{4}-\d{2}-\d{2}/.test(str)) return JSON.stringify(str);
  if (/[:#>|{}[\],&*!?%@`"']/.test(str) || /^\s|\s$/.test(str)) return JSON.stringify(str);
  return str;
}

/** Emits a folded block scalar so long prose stays readable in the file. */
function yamlBlock(key, value, indent = '') {
  const wrapped = String(value)
    .trim()
    .replace(/\s+/g, ' ')
    .replace(/(.{1,72})(\s|$)/g, '$1\n')
    .trim()
    .split('\n')
    .map((line) => `${indent}  ${line}`)
    .join('\n');
  return `${indent}${key}: >-\n${wrapped}`;
}

function yamlList(key, values, indent = '') {
  if (!values.length) return null;
  return [`${indent}${key}:`, ...values.map((v) => `${indent}  - ${yamlScalar(v)}`)].join('\n');
}

// ---------------------------------------------------------------------------
// build the frontmatter
// ---------------------------------------------------------------------------

function normalise(input) {
  const title = String(input.title ?? '').trim();
  if (!title) fail('`title` is required.');

  const slug = slugify(input.slug || title);
  if (!slug) fail(`Could not derive a slug from "${title}". Pass an explicit \`slug\`.`);

  const category = String(input.primaryCategory ?? '').trim().toLowerCase();
  if (!CATEGORIES.includes(category)) {
    fail(`\`primaryCategory\` must be one of: ${CATEGORIES.join(', ')} (got "${category}").`);
  }

  const status = String(input.status ?? 'draft').trim().toLowerCase();
  if (!STATUSES.includes(status)) {
    fail(`\`status\` must be one of: ${STATUSES.join(', ')} (got "${status}").`);
  }

  // Date drives sorting; year must agree with it or the schema rejects the file.
  const rawDate = String(input.date ?? '').trim();
  const year = Number(input.year ?? (rawDate ? rawDate.slice(0, 4) : NaN));
  if (!Number.isInteger(year) || year < 1900 || year > 2200) {
    fail(`\`year\` must be a four-digit year (got "${input.year ?? ''}").`);
  }
  const date = rawDate || `${year}-01-01`;
  if (Number(date.slice(0, 4)) !== year) {
    fail(`\`date\` (${date}) and \`year\` (${year}) disagree.`);
  }

  const duration = String(input.duration ?? '').trim();
  if (duration && !/^\d{1,2}:\d{2}(?::\d{2})?$/.test(duration)) {
    fail(`\`duration\` must be m:ss or h:mm:ss (got "${duration}").`);
  }

  const featured = bool(input.featured);
  const featuredOrder =
    input.featuredOrder === undefined || input.featuredOrder === ''
      ? undefined
      : Number(input.featuredOrder);
  if (featuredOrder !== undefined && !featured) {
    fail('`featuredOrder` was given but `featured` is false.');
  }

  if (input.series?.id) {
    const seriesFile = join(SERIES_DIR, `${input.series.id}.md`);
    if (!existsSync(seriesFile)) {
      fail(`Series "${input.series.id}" does not exist. Create ${seriesFile} first.`);
    }
  }

  return {
    title,
    slug,
    year,
    date,
    primaryCategory: category,
    secondaryTags: list(input.secondaryTags),
    featured,
    featuredOrder,
    status,
    series: input.series?.id ? input.series : undefined,
    instrumentation: String(input.instrumentation ?? '').trim(),
    duration,
    shortDescription: String(input.shortDescription ?? '').trim(),
    programNote: String(input.programNote ?? '').trim(),
    technology: list(input.technology),
    credits: input.credits ?? [],
    performances: input.performances ?? [],
    media: input.media ?? [],
    links: input.links ?? [],
    sourceUrls: list(input.sourceUrls),
    needsReview: bool(input.needsReview, true),
  };
}

function render(work) {
  const lines = [
    '---',
    `title: ${yamlScalar(work.title)}`,
    `year: ${work.year}`,
    `date: ${work.date}`,
    `primaryCategory: ${work.primaryCategory}`,
  ];

  const tags = yamlList('secondaryTags', work.secondaryTags);
  if (tags) lines.push(tags);

  lines.push(`featured: ${work.featured}`);
  if (work.featuredOrder !== undefined) lines.push(`featuredOrder: ${work.featuredOrder}`);
  lines.push(`status: ${work.status}`);

  if (work.series) {
    lines.push('series:');
    lines.push(`  id: ${work.series.id}`);
    if (work.series.part !== undefined) lines.push(`  part: ${work.series.part}`);
    if (work.series.partLabel) lines.push(`  partLabel: ${yamlScalar(work.series.partLabel)}`);
  }

  if (work.instrumentation) lines.push(`instrumentation: ${yamlScalar(work.instrumentation)}`);
  if (work.duration) lines.push(`duration: ${yamlScalar(work.duration)}`);
  if (work.shortDescription) lines.push(yamlBlock('shortDescription', work.shortDescription));

  const tech = yamlList('technology', work.technology);
  if (tech) lines.push(tech);

  if (work.credits.length) {
    lines.push('credits:');
    for (const credit of work.credits) {
      lines.push(`  - role: ${yamlScalar(credit.role)}`);
      lines.push(`    name: ${yamlScalar(credit.name)}`);
    }
  }

  if (work.performances.length) {
    lines.push('performances:');
    for (const p of work.performances) {
      const entries = Object.entries(p).filter(([, v]) => v);
      if (!entries.length) continue;
      lines.push(`  - ${entries[0][0]}: ${yamlScalar(entries[0][1])}`);
      for (const [key, value] of entries.slice(1)) {
        lines.push(`    ${key}: ${yamlScalar(value)}`);
      }
    }
  }

  if (work.media.length) {
    lines.push('media:');
    for (const item of work.media) {
      lines.push(`  - type: ${item.type ?? 'soundcloud'}`);
      lines.push(`    url: ${yamlScalar(item.url)}`);
      if (item.title) lines.push(`    title: ${yamlScalar(item.title)}`);
      if (item.note) lines.push(yamlBlock('note', item.note, '    '));
    }
  }

  if (work.links.length) {
    lines.push('links:');
    for (const link of work.links) {
      lines.push(`  - label: ${yamlScalar(link.label)}`);
      lines.push(`    url: ${yamlScalar(link.url)}`);
      lines.push(`    type: ${LINK_TYPES.includes(link.type) ? link.type : 'other'}`);
    }
  }

  const sources = yamlList('sourceUrls', work.sourceUrls);
  if (sources) lines.push(sources);

  if (work.needsReview) lines.push('needsReview: true');

  lines.push('---', '');
  lines.push(work.programNote || 'A program note for this work has not been published yet.');
  lines.push('');

  return lines.join('\n');
}

// ---------------------------------------------------------------------------
// interactive mode
// ---------------------------------------------------------------------------

async function prompt() {
  const rl = createInterface({ input: stdin, output: stdout });
  const ask = async (question, fallback = '') => {
    const answer = (await rl.question(fallback ? `${question} [${fallback}] ` : `${question} `)).trim();
    return answer || fallback;
  };

  console.log('\nNew work — press Enter to skip an optional field.\n');

  const title = await ask('Title:');
  if (!title) {
    rl.close();
    fail('A title is required.');
  }

  const year = await ask('Year:', String(new Date().getFullYear()));
  const date = await ask('Date (YYYY-MM-DD):', `${year}-01-01`);
  const primaryCategory = await ask(`Category (${CATEGORIES.join('/')}):`, 'electroacoustic');
  const secondaryTags = await ask('Tags (comma separated):');
  const instrumentation = await ask('Instrumentation:');
  const duration = await ask('Duration (m:ss):');
  const shortDescription = await ask('Short description:');
  const programNote = await ask('Program note (one paragraph, edit the file for more):');
  const technology = await ask('Technology (comma separated):');
  const performers = await ask('Performers / credits (e.g. "Piano: Ada Yıldız", comma separated):');
  const soundcloud = await ask('SoundCloud URL:');
  const extraLinks = await ask('Other links (e.g. "Score: https://…", comma separated):');
  const seriesId = await ask('Album / series id (blank for none):');
  const seriesPart = seriesId ? await ask('Part number in the album:') : '';
  const featured = await ask('Featured on the home page? (y/N):', 'n');
  const featuredOrder = bool(featured) ? await ask('Featured order (lower = earlier):') : '';
  const status = await ask(`Status (${STATUSES.join('/')}):`, 'draft');

  rl.close();

  const credits = list(performers).map((entry) => {
    const [role, ...rest] = entry.split(':');
    return rest.length
      ? { role: role.trim(), name: rest.join(':').trim() }
      : { role: 'Performer', name: role.trim() };
  });

  const links = list(extraLinks).map((entry) => {
    const [label, ...rest] = entry.split(':');
    return { label: label.trim(), url: rest.join(':').trim(), type: 'other' };
  });

  return {
    title,
    year: Number(year),
    date,
    primaryCategory,
    secondaryTags,
    instrumentation,
    duration,
    shortDescription,
    programNote,
    technology,
    credits,
    links: links.filter((l) => /^https?:\/\//.test(l.url)),
    media: soundcloud ? [{ type: 'soundcloud', url: soundcloud }] : [],
    sourceUrls: soundcloud ? [soundcloud] : [],
    series: seriesId ? { id: seriesId, part: seriesPart ? Number(seriesPart) : undefined } : undefined,
    featured: bool(featured),
    featuredOrder,
    status,
    needsReview: true,
  };
}

// ---------------------------------------------------------------------------
// main
// ---------------------------------------------------------------------------

const args = process.argv.slice(2);
const force = args.includes('--force');

function flagValue(name) {
  const index = args.indexOf(name);
  return index !== -1 ? args[index + 1] : undefined;
}

let input;
const jsonArg = flagValue('--json');
const fileArg = flagValue('--file');

if (jsonArg) {
  try {
    input = JSON.parse(jsonArg);
  } catch (error) {
    fail(`--json is not valid JSON: ${error.message}`);
  }
} else if (fileArg) {
  try {
    input = JSON.parse(readFileSync(resolve(fileArg), 'utf8'));
  } catch (error) {
    fail(`Could not read ${fileArg}: ${error.message}`);
  }
} else {
  input = await prompt();
}

const work = normalise(input);
const target = join(WORKS_DIR, `${work.slug}.md`);

if (existsSync(target) && !force) {
  fail(`${target} already exists. Pass --force to overwrite.`);
}

mkdirSync(WORKS_DIR, { recursive: true });
writeFileSync(target, render(work), 'utf8');

console.log(`\n✓ Wrote src/content/works/${work.slug}.md`);
console.log('  Validating against the content schema…');

const sync = spawnSync('npx', ['astro', 'sync'], { cwd: ROOT, stdio: 'inherit' });

if (sync.status !== 0) {
  console.error('\n✗ Schema validation failed. Fix the file above, then run `npm run check`.\n');
  process.exit(sync.status ?? 1);
}

console.log(`\n✓ Schema OK. The work is live at /works/${work.slug}`);
if (work.status === 'draft') {
  console.log('  It is a draft, so it will not appear on the site until status: published.');
}
console.log('  Next: npm run verify, then commit and push.\n');
