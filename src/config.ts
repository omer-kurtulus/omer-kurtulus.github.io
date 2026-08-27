/** Single source of truth for site-wide identity, navigation and profiles. */

export const SITE = {
  name: 'Ömer Kurtuluş',
  /** Used in <title> and structured data. */
  title: 'Ömer Kurtuluş — Composer',
  role: 'Composer',
  tagline:
    'Composer, music technologist and sound artist. Sonic archaeology: composing by excavating and re-authenticating an over-saturated archive.',
  description:
    'Ömer Kurtuluş is a composer, music technologist and sound artist. His work develops sonic archaeology — a compositional stance that treats the inherited archive of musical practice as a stratified field to be excavated, re-situated and re-authenticated — across notated concert music, electroacoustic composition and machine listening.',
  url: 'https://omerkurtulus.com',
  locale: 'en',
  /** Set to an address to show it on the contact page; leave empty to hide. */
  email: 'okurtul@bgsu.edu',
} as const;

/**
 * The track every visitor hears. Nothing about it is shown on the page — no
 * control, no title. Browsers refuse audible autoplay until the visitor has
 * interacted with the origin, so it starts on their first click or keypress
 * anywhere on the site. Set to `null` to remove it entirely.
 */
export const OPENING_TRACK: { url: string; label: string } | null = {
  url: 'https://soundcloud.com/mer-kurtulu-399116903/p-re-cise',
  label: 'P(re)cise',
};

export const NAV = [
  { label: 'Works', href: '/works' },
  { label: 'About', href: '/about' },
  { label: 'CV', href: '/cv' },
  { label: 'Writing', href: '/research' },
  { label: 'Contact', href: '/contact' },
] as const;

export const PROFILES = [
  { label: 'SoundCloud', url: 'https://soundcloud.com/mer-kurtulu-399116903' },
  { label: 'Bandcamp', url: 'https://merkurtulu.bandcamp.com/' },
  {
    label: 'Scores & performances',
    url: 'https://drive.google.com/drive/folders/1TVLEtLhu0pgR1o5KFMcE_nSEQj_jGfAZ?usp=drive_link',
  },
] as const;
