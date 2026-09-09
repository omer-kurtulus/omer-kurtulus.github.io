import type { Activity } from './activity';
import type { Work } from './works';

/**
 * The home page's Recent block is one chronological feed, not two lists: a
 * conference and a work published in the same week should sit next to each
 * other in date order. This is the union that makes that possible.
 */
export type RecentItem =
  | { kind: 'work'; date: Date; title: string; work: Work }
  | { kind: 'activity'; date: Date; title: string; entry: Activity };

/** How far back the feed reaches. */
export const RECENT_WINDOW_MONTHS = 3;

/** The fewest rows worth showing; below this the window is ignored. */
const MINIMUM_ROWS = 3;

/** Newest first; same-day entries fall back to title so ordering is stable. */
function byDateDesc(a: RecentItem, b: RecentItem): number {
  const delta = b.date.getTime() - a.date.getTime();
  return delta !== 0 ? delta : a.title.localeCompare(b.title);
}

export function windowStart(now = new Date()): Date {
  const cutoff = new Date(now);
  cutoff.setMonth(cutoff.getMonth() - RECENT_WINDOW_MONTHS);
  return cutoff;
}

/**
 * Everything from the last three months, newest first.
 *
 * A quiet quarter would otherwise leave the block empty, so when the window
 * holds fewer than three rows it is dropped and the newest three are shown
 * instead. `windowed` says which of the two happened, so the page can label
 * itself honestly rather than claiming a date range it is not showing.
 */
export function recentFeed(
  works: Work[],
  activity: Activity[],
  now = new Date(),
): { items: RecentItem[]; windowed: boolean } {
  const all: RecentItem[] = [
    ...works.map((work): RecentItem => ({
      kind: 'work',
      date: work.data.date,
      title: work.data.title,
      work,
    })),
    ...activity.map((entry): RecentItem => ({
      kind: 'activity',
      date: entry.data.date,
      title: entry.data.title,
      entry,
    })),
  ].sort(byDateDesc);

  const cutoff = windowStart(now);
  const inWindow = all.filter((item) => item.date >= cutoff);

  return inWindow.length >= MINIMUM_ROWS
    ? { items: inWindow, windowed: true }
    : { items: all.slice(0, MINIMUM_ROWS), windowed: false };
}

/**
 * The feed cut into months, newest first. Twelve rows in a single run read as
 * an undifferentiated list — worse when seven of them are one album published
 * on one day — so the month is printed once and the rows sit under it.
 */
export function groupByMonth(
  items: RecentItem[],
): Array<{ key: string; label: string; items: RecentItem[] }> {
  const groups: Array<{ key: string; label: string; items: RecentItem[] }> = [];

  for (const item of items) {
    const key = `${item.date.getUTCFullYear()}-${item.date.getUTCMonth()}`;
    const last = groups.at(-1);

    if (last?.key === key) {
      last.items.push(item);
    } else {
      groups.push({
        key,
        label: new Intl.DateTimeFormat('en-GB', {
          month: 'long',
          year: 'numeric',
          timeZone: 'UTC',
        }).format(item.date),
        items: [item],
      });
    }
  }

  return groups;
}
