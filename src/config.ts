/** Single source of truth for site-wide identity, navigation and profiles. */

export const SITE = {
  name: 'Ömer Kurtuluş',
  /** Used in <title> and structured data. */
  title: 'Ömer Kurtuluş — Composer',
  role: 'Composer',
  tagline:
    'Neural audio, electroacoustic and notated concert music. Works on the sound archaeologies of cities.',
  description:
    'Ömer Kurtuluş is a composer working across neural audio synthesis, ambisonic electroacoustic composition and notated concert music for soloists, ensembles and orchestra.',
  url: 'https://omer-kurtulus.github.io',
  locale: 'en',
  /** Set to an address to show it on the contact page; leave empty to hide. */
  email: '',
} as const;

export const NAV = [
  { label: 'Works', href: '/works' },
  { label: 'About', href: '/about' },
  { label: 'CV', href: '/cv' },
  { label: 'Research', href: '/research' },
  { label: 'Contact', href: '/contact' },
] as const;

export const PROFILES = [
  { label: 'SoundCloud', url: 'https://soundcloud.com/mer-kurtulu-399116903' },
] as const;
