/**
 * Contributors to "What the C*rp*s".
 *
 * Add one entry per person as submissions arrive; the open-call page renders
 * the list automatically. `name` is how they asked to be credited on the
 * release — it may be a pseudonym and need not match their legal name, which
 * is collected in the form and kept private.
 */

export interface Contributor {
  /** Credit name, exactly as the contributor asked to be listed. */
  name: string;
  /** Optional: city and/or country, shown after the name. */
  location?: string;
  /** Optional: what they sent, in a few words ("bowed zither, prepared snare"). */
  material?: string;
}

export const CONTRIBUTORS: Contributor[] = [
  // { name: 'Example Name', location: 'Istanbul', material: 'bowed cymbal, paper' },
];
