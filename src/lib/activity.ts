import { getCollection, type CollectionEntry } from 'astro:content';

export type Activity = CollectionEntry<'activity'>;

/** Newest first; same-day entries fall back to title so ordering is stable. */
function byDateDesc(a: Activity, b: Activity): number {
  const delta = b.data.date.getTime() - a.data.date.getTime();
  return delta !== 0 ? delta : a.data.title.localeCompare(b.data.title);
}

/** Every activity entry that belongs on the live site, newest first. */
export async function getPublishedActivity(): Promise<Activity[]> {
  const entries = await getCollection('activity', ({ data }) => data.status === 'published');
  return entries.sort(byDateDesc);
}

/**
 * The printed date, cut to the precision that is actually known. A month-only
 * entry prints "September 2026", never an invented day.
 */
export function activityDate(entry: Activity): string {
  const { date, datePrecision } = entry.data;
  if (datePrecision === 'year') return String(date.getUTCFullYear());

  const options: Intl.DateTimeFormatOptions =
    datePrecision === 'month'
      ? { month: 'long', year: 'numeric', timeZone: 'UTC' }
      : { day: 'numeric', month: 'long', year: 'numeric', timeZone: 'UTC' };

  return new Intl.DateTimeFormat('en-GB', options).format(date);
}
