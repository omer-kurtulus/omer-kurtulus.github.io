---
title: Notes on the STRATA II engine
date: 2026-08-11
summary: >-
  Three RAVE models in continuous feedback, corrected by a listener module that
  measures the system's drift against its own untouched source.
tags:
  - RAVE
  - Max/MSP
  - ambisonics
  - machine listening
status: published
links:
  - label: STRATA II
    url: https://soundcloud.com/mer-kurtulu-399116903/strata_ii
    type: project
needsReview: true
---

*STRATA II* is driven by three instances of RAVE — Realtime Audio Variational
autoEncoder, Caillon & Esling, IRCAM ACIDS — running in Max 9 through the `nn~`
external. Each instance is wired as a feedback loop: its own output is returned to
its input, so degradation accumulates continuously as the piece plays rather than
in discrete generations.

Left alone, a system like this has two failure modes. It either runs away into
noise, or it settles into a fixed point and stops moving. A listener module
prevents both. It measures the spectral drift of the system's current output
against the untouched original and uses that distance to set the depth of erosion,
so the piece is held in the region where the source is still recognisable and
still being lost.

The three voices are encoded into a third-order ambisonic field and decoded to
twelve loudspeakers — eight at ear level, four overhead. Elevation is tied to
erosion depth, so as a copy takes over from the original it physically rises above
it.

None of the three models was trained on the source material. One was trained on
magnetic field recordings, one on a hand drum, one on roughly ten thousand stock
sound-library loops. This is a compositional decision, not a limitation: each
model can only rebuild Istanbul in terms it already possesses, and the gap between
what it reconstructs and what was there is the subject of the piece.

<!--
  NOTE FOR MAINTENANCE: this note is assembled from the technical description
  published alongside the recording. Expand or replace with the composer's own
  writing, then set needsReview: false.
-->
