#!/usr/bin/env node
/**
 * Reports content that needs attention. Never fails the build — it is a
 * to-do list, not a gate.
 *
 *   npm run check:content
 *
 * Flags: works marked `needsReview`, works missing a recording, drafts, and
 * any external URL that no longer resolves (with --links).
 */

import { readdirSync, readFileSync } from 'node:fs';
import { join, resolve, dirname } from 'node:path';
import { fileURLToPath } from 'node:url';

const ROOT = resolve(dirname(fileURLToPath(import.meta.url)), '..');
const CONTENT = join(ROOT, 'src', 'content');

/** Minimal frontmatter reader — enough for reporting, not for validation. */
function readEntries(dir) {
  let files;
  try {
    files = readdirSync(dir).filter((f) => /\.mdx?$/.test(f));
  } catch {
    return [];
  }

  return files.map((file) => {
    const raw = readFileSync(join(dir, file), 'utf8');
    const match = raw.match(/^---\n([\s\S]*?)\n---/);
    const frontmatter = match ? match[1] : '';
    const field = (name) => {
      const line = frontmatter.match(new RegExp(`^${name}:\\s*(.*)$`, 'm'));
      return line ? line[1].trim().replace(/^["']|["']$/g, '') : undefined;
    };
    return {
      file,
      raw,
      frontmatter,
      title: field('title') ?? file,
      // `pages` has no status field at all — absence is not a draft.
      status: field('status'),
      needsReview: field('needsReview') === 'true',
      urls: [...raw.matchAll(/https?:\/\/[^\s"'<>)\]]+/g)].map((m) => m[0]),
      hasMedia: /^media:/m.test(frontmatter),
    };
  });
}

const works = readEntries(join(CONTENT, 'works'));
const pages = readEntries(join(CONTENT, 'pages'));
const research = readEntries(join(CONTENT, 'research'));
const series = readEntries(join(CONTENT, 'series'));

const all = [...works, ...pages, ...research, ...series];

const plural = (n, word) => `${n} ${word}${n === 1 ? '' : 's'}`;

console.log(
  `\nContent: ${plural(works.length, 'work')} · ${plural(series.length, 'album')} · ` +
    `${plural(research.length, 'note')} · ${plural(pages.length, 'page')}\n`,
);

const drafts = all.filter((e) => e.status === 'draft');
if (drafts.length) {
  console.log(`Drafts — not visible on the live site (${drafts.length}):`);
  for (const entry of drafts) console.log(`  · ${entry.title}`);
  console.log('');
}

const review = all.filter((e) => e.needsReview);
if (review.length) {
  console.log(`Needs review — metadata is incomplete or unverified (${review.length}):`);
  for (const entry of review) console.log(`  · ${entry.title}`);
  console.log('');
}

const silent = works.filter((w) => !w.hasMedia);
if (silent.length) {
  console.log(`No recording linked (${silent.length}):`);
  for (const entry of silent) console.log(`  · ${entry.title}`);
  console.log('');
}

if (!drafts.length && !review.length && !silent.length) {
  console.log('Everything is published, reviewed and has a recording.\n');
}

// --- optional link check -----------------------------------------------------

if (process.argv.includes('--links')) {
  const urls = [...new Set(all.flatMap((e) => e.urls))].sort();
  console.log(`Checking ${urls.length} external links…\n`);

  const results = await Promise.all(
    urls.map(async (url) => {
      try {
        // SoundCloud rejects HEAD on some track paths, so fall back to GET.
        let response = await fetch(url, { method: 'HEAD', redirect: 'follow' });
        if (response.status === 405 || response.status === 403) {
          response = await fetch(url, { method: 'GET', redirect: 'follow' });
        }
        return { url, ok: response.ok, status: response.status };
      } catch (error) {
        return { url, ok: false, status: error.message };
      }
    }),
  );

  const broken = results.filter((r) => !r.ok);
  for (const result of results) {
    console.log(`  ${result.ok ? '✓' : '✗'} ${result.status}  ${result.url}`);
  }
  console.log(broken.length ? `\n${broken.length} link(s) need attention.\n` : '\nAll links resolve.\n');
}
