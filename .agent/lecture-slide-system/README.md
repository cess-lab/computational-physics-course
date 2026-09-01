# PHY4605 Editable Lecture-Slide System

This hidden course-level folder contains the reusable production system for PHY4605 lecture and practical-brief PowerPoint decks.

The canonical output is an editable PPTX. PDF and flattened-PPTX files are optional distribution derivatives only.

## Required assets before the first weekly build

- `fonts/Nunito[wght].ttf` and its OFL licence;
- `fonts/IBMPlexMono-Regular.ttf`;
- `fonts/IBMPlexMono-SemiBold.ttf` and the IBM Plex licence;
- `masters/PHY4605_Editable_Slide_Master.pptx` after lecturer approval;
- rendered title and component proofs under `qa/`.

Do not silently substitute fonts when these files are unavailable. The font files are intentionally not fabricated or downloaded by this schema update; stage them from their official licensed sources before building the reusable master.

## Source of truth

- Human-readable design and production rules: `PHY4605_Lecture_Slide_Design_Spec.md` at the course root.
- Machine-readable builder and validator tokens: `PHY4605_Lecture_Slide_Tokens.json` in this folder.

If the two disagree, stop and reconcile them before producing course slides.
