#!/usr/bin/env python3
"""
Builds the score strips that run down the side of every page.

A strip is a few consecutive pages of one of Ömer's scores, set side by side as
one long image. Nothing is done to the notation: it is shown as engraved. Only
the running head and foot of each page (title, name, page number) are trimmed,
so a strip is music and nothing else.

    python3 scripts/make-strips.py <folder-with-the-score-pdfs> [out-dir]

Needs `pdftoppm` (poppler) and Pillow. Add a strip by adding a line to STRIPS;
`src/lib/score.ts` picks them up by file name.
"""
import os
import subprocess
import sys
import tempfile

from PIL import Image

DPI = 120
# Trim, as fractions of the page: top, bottom, left, right.
TRIM = (0.062, 0.045, 0.012, 0.012)

# name -> (pdf, first page, last page[, top trim if the running head sits lower])
STRIPS = {
    'home': ('decentre_score.pdf', 8, 11),
    'works': ('Desertron_score.pdf', 9, 12),
    'writing': ('Its_Place_Knows_It_score.pdf', 8, 11),
    'about': ('what_rubs_remain_v5.pdf', 10, 13),
    'cv': ('Liebes-Lied_score_stamped.pdf', 9, 12),
    'contact': ('A_Lip_of_Paper_score.pdf', 8, 11),
    'work-1': ('Kurtulus_Serpent-Unkeyed_score.pdf', 11, 14, 0.105),
    'work-2': ('Borrowed_Lips_Kurtulus_score.pdf', 8, 11),
    'work-3': ('Sublet_Omer_Kurtulus.pdf', 8, 11),
    'work-4': ('APaneOfWood_Kurtulus.pdf', 11, 14),
    'work-5': ('one_to_forty.pdf', 8, 11),
}


def pages(pdf, first, last, tmp):
    prefix = os.path.join(tmp, 'p')
    subprocess.run(
        ['pdftoppm', '-r', str(DPI), '-f', str(first), '-l', str(last), '-gray', '-png', pdf, prefix],
        check=True,
    )
    for name in sorted(os.listdir(tmp)):
        if name.endswith('.png'):
            yield Image.open(os.path.join(tmp, name)).convert('L')


def main():
    src = sys.argv[1]
    out = sys.argv[2] if len(sys.argv) > 2 else os.path.join(os.path.dirname(__file__), '..', 'src', 'assets', 'score')
    os.makedirs(out, exist_ok=True)
    for name, (pdf, first, last, *rest) in STRIPS.items():
        with tempfile.TemporaryDirectory() as tmp:
            trimmed = []
            for page in pages(os.path.join(src, pdf), first, last, tmp):
                w, h = page.size
                t, b, l, r = TRIM
                t = rest[0] if rest else t
                trimmed.append(page.crop((int(w * l), int(h * t), int(w * (1 - r)), int(h * (1 - b)))))
            height = min(p.height for p in trimmed)
            trimmed = [p.resize((round(p.width * height / p.height), height), Image.LANCZOS) for p in trimmed]
            strip = Image.new('L', (sum(p.width for p in trimmed), height), 255)
            x = 0
            for p in trimmed:
                strip.paste(p, (x, 0))
                x += p.width
            path = os.path.join(out, f'strip-{name}.webp')
            strip.save(path, 'WEBP', quality=58, method=6)
            print(f'{path}  {strip.width}x{strip.height}  {os.path.getsize(path) // 1024} KB')


if __name__ == '__main__':
    main()
