# "What the C*rp*s" — submission form

The open-call page at `/what-the-corpus` embeds a Tally form. Tally has no API
for creating forms, so the form is built by hand once, in the Tally UI, and then
wired to the site by pasting one id.

## 1. Wire it up

Create the form (fields below), publish it, and take the id out of its share
URL — `tally.so/r/**wA5kBn**` → `wA5kBn`. Then in `src/config.ts`:

```ts
export const OPEN_CALL = {
  tallyFormId: 'wA5kBn',   // ← paste here
  deadline: '30 November 2026',  // ← optional; the panel hides while empty
  …
};
```

While `tallyFormId` is empty the page shows an email fallback instead of a broken
embed, so the page is safe to publish before the form exists.

In Tally, under **Share → Embed**, leave *Transparent background* on. The page
already passes `transparentBackground=1&alignLeft=1&hideTitle=1&dynamicHeight=1`,
so the form inherits the site's paper/dark palette instead of arriving in a white
box.

## 2. Fields

Tally field types are named as they appear in its "+" menu.

| # | Field type | Label | Required | Notes |
|---|---|---|---|---|
| 1 | Short answer | Your name | ✅ | "Your legal name. It is not published — see below." |
| 2 | Short answer | Credit name | ✅ | "How you want to be listed on the release. A pseudonym is fine." |
| 3 | Email | Email | ✅ | |
| 4 | Short answer | Where you are | ❌ | "City and/or country, if you'd like it in the credits." |
| 5 | File upload | Your recordings | ❌ | Allow multiple. Accept `.wav,.aif,.aiff,.flac`. See §3 on the size cap. |
| 6 | Link | …or a link to them | ❌ | "Drive, Dropbox, WeTransfer — use this if the files are large." |
| 7 | Long answer | What is it? | ✅ | "The source and the technique, in a sentence or two. 'Bowed cymbal, close mic' is plenty." |
| 8 | Multiple choice | Does anything fade up out of silence? | ❌ | Options: `No, everything has a clear start` / `Yes, some of it is bowed or rubbed` / `Not sure`. Explain in the description that a fade-in has no attack for the slicer to find, so it needs handling. |
| 9 | Checkboxes | Rights | ✅ | Four separate checkboxes, all required — see §4. |
| 10 | Multiple choice | Want the patcher and the technical detail? | ❌ | `Yes` / `No thanks` |
| 11 | Multiple choice | Want to hear the piece your sound ends up in? | ❌ | `Yes` / `No thanks` |
| 12 | Long answer | Anything else | ❌ | |

Add a **Hidden field** called `submission_id` with Tally's `@respondentId`
variable if you want a stable key to match uploads to metadata later. Worth doing
before the first submission, painful to add after the fortieth.

## 3. The size cap

Tally's free plan caps uploads (currently 10 MB per file on Free, higher on paid
tiers). A three-minute 24-bit/48 kHz stereo WAV is roughly 50 MB, so **most real
submissions will not fit the free tier**.

Two ways out, pick one before publishing:

- **Upgrade Tally** — simplest, keeps everything in one place.
- **Lead with the link field** — make field 6 the primary route and reword field
  5 as "small files only". Costs you nothing and has no size ceiling, at the
  price of one extra step for the contributor.

The page's note under the form currently says files over 200 MB need a link.
If you stay on the free tier, change that number in
`src/pages/what-the-corpus.astro` so the page does not promise what the form
cannot do.

## 4. The rights checkboxes

All four required. Wording, verbatim:

- I made this recording, and I have the right to license it.
- It contains no one else's copyrighted work.
- I agree to my credit name being published on the release.
- I have read and accept the licence below.

Then a **description block** under them carrying the licence itself — the same
text as the page, so the two can never drift:

> The contributor retains copyright in the recording. The contributor grants
> Ömer Kurtuluş a worldwide, perpetual, royalty-free, non-exclusive licence to
> use, adapt, transform and recombine the recording within the corpus, and to
> publish the resulting works. The contributor may continue to use the recording
> for any purpose. The contributor is credited on the release.
>
> The album is released under a Creative Commons licence, and may be sold. Your
> legal name is collected so that this permission is meaningful; only your
> credit name is published. Your name and email are used for this project only,
> are not shared, and are deleted on request.

Do not soften "perpetual". A release cannot be unpicked after the fact, and a
licence that can be withdrawn is one that can force an album offline.

## 5. After a submission arrives

Add the person to `src/lib/contributors.ts`:

```ts
{ name: 'Credit Name', location: 'Lisbon', material: 'bowed zither, paper' },
```

The page lists them automatically. Nothing else needs editing.

Keep the audio out of this repo — `omer-kurtulus.github.io` is the website, and
GitHub rejects files over 100 MB. Contributed recordings live in cloud storage.
