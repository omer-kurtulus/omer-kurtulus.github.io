---
title: STRATA II
year: 2026
date: 2026-08-11T10:06:41Z
primaryCategory: ai
secondaryTags:
  - neural audio
  - RAVE
  - machine listening
  - ambisonics
  - sound archaeology
  - field recording
  - Istanbul
  - interactive
featured: true
featuredOrder: 1
status: published
series:
  id: strata
  part: 2
  partLabel: "II"
instrumentation: Interactive fixed media, 12 channels (8 at ear level, 4 overhead)
duration: "10:00"
shortDescription: >-
  Twelve channels of Istanbul field recordings eroded in real time by three
  neural models, none of which has ever heard the city. What survives each pass
  is not the city but what a machine could still carry of it.
technology:
  - Max 9
  - RAVE / nn~ (IRCAM ACIDS)
  - ICST Ambisonics (ZHdK)
  - Composers Desktop Project
  - Python
credits:
  - role: Composition, spatialisation, system design
    name: Ömer Kurtuluş
  - role: Dedication
    name: Halil İbrahim Tutar
media:
  - type: soundcloud
    url: https://soundcloud.com/mer-kurtulu-399116903/strata_ii
    title: Binaural reduction of a live run
    note: Headphones required — this is a binaural reduction of twelve loudspeaker feeds.
sourceUrls:
  - https://soundcloud.com/mer-kurtulu-399116903/strata_ii
---

STRATA II is a work of sonic archaeology. It is the second piece of *Strata*, an
album in which I research sound archaeologies — the layers a city leaves behind
in whatever can still be heard of it.

I dedicate it to my friend Halil İbrahim Tutar, with whom I walked this city so
much, and through whom I came to know its atmosphere.

What interests me here is a shift in what a composer does. The work is less and
less about inventing material, and more about surveying an archive and refining
what is already in it. Whatever survives of a city's sound reaches us damaged: it
has passed through recording media, through decisions about what was worth
keeping, through generations of reproduction that flattened it into something
standard. I wanted to treat that damage as the subject rather than as a defect —
to follow sound as a historical remnant and ask what journey it has taken through
time.

The piece is twelve channels and ten minutes, built from field recordings of
Istanbul. It does not stay fixed. While it plays, three neural models process it
in real time, each feeding its own output back into itself, so the erosion
accumulates as you listen. None of these models has ever heard this city: one was
trained on magnetic fields, one on a hand drum, one on ten thousand stock
sound-library loops. They can only rebuild Istanbul in terms they already
possess, and whatever they cannot hold falls away.

That is the excavation. What is left after each pass is not the city, but what a
machine could still carry of it — and the distance between the two is what the
piece is about.

The system listens to its own output and decides how far to take the erosion.
There is no performer, and it comes out differently every time it runs. What you
are hearing is one run.

## Technical note

The engine is three instances of RAVE (Realtime Audio Variational autoEncoder,
Caillon & Esling, IRCAM ACIDS), running in Max 9 through the `nn~` external, each
wired as a feedback loop so that degradation accumulates continuously rather than
in fixed steps. A listener module measures the spectral drift of the system's own
output against the untouched original and corrects the depth of erosion, so the
piece can neither collapse into noise nor freeze. The three voices are encoded
into a third-order ambisonic field and decoded to twelve loudspeakers; their
elevation is tied to the depth of erosion, so the copy rises above the original
as it takes over.

No model was trained on the source material. This is deliberate.

An earlier piece, *Strata*, excavated the same city by hand.

For the twelve-channel version, the Max project, or the technical documentation,
please get in touch.
