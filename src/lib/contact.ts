/**
 * Ways to start an email to the site's address. A bare `mailto:` opens nothing
 * useful for someone who reads mail in a browser, so every place that asks for
 * a message also offers Gmail, Outlook and a plain copy of the address.
 */

export type Compose = { to: string; subject?: string; body?: string };

const query = (pairs: Record<string, string | undefined>) =>
  Object.entries(pairs)
    .filter((pair): pair is [string, string] => Boolean(pair[1]))
    .map(([k, v]) => `${k}=${encodeURIComponent(v)}`)
    .join('&');

export function mailtoHref({ to, subject, body }: Compose): string {
  const q = query({ subject, body });
  return `mailto:${to}${q ? `?${q}` : ''}`;
}

export function gmailHref({ to, subject, body }: Compose): string {
  return `https://mail.google.com/mail/?${query({ view: 'cm', fs: '1', to, su: subject, body })}`;
}

export function outlookHref({ to, subject, body }: Compose): string {
  return `https://outlook.office.com/mail/deeplink/compose?${query({ to, subject, body })}`;
}
