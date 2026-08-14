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
  url: 'https://omer-kurtulus.github.io',
  locale: 'en',
  /** Set to an address to show it on the contact page; leave empty to hide. */
  email: 'okurtul@bgsu.edu',
} as const;

export const NAV = [
  { label: 'Works', href: '/works' },
  { label: 'About', href: '/about' },
  { label: 'CV', href: '/cv' },
  { label: 'Writing', href: '/research' },
  { label: 'Contact', href: '/contact' },
] as const;

export const PROFILES = [
  { label: 'SoundCloud', url: 'https://soundcloud.com/mer-kurtulu-399116903' },
  {
    label: 'Scores & performances',
    url: 'https://drive.google.com/drive/folders/1TVLEtLhu0pgR1o5KFMcE_nSEQj_jGfAZ?usp=drive_link',
  },
] as const;
