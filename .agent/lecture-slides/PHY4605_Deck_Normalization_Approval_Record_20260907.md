# PHY4605 deck normalization approval record — 2026-09-07

## Approval and scope

The lecturer/user explicitly approved implementation items A, B, C, and D, including the endpoint-only normalization of the current Week 01–13 lecture decks. The approved scope is:

- replace only each deck's title/cover raster and final takeaway raster;
- apply the approved scientific-term title wording and the shared Teaching Courseware title/closing design language;
- preserve interior slide images, equations, MATLAB code, strict scientific assets, slide counts, presenter notes, and numerical content;
- retain Week 14 as a buffer/recovery record rather than a new compulsory deck.

This record approves the current normalization pass. It does not retroactively assert that every predecessor deck has complete historical Codex-PPT production provenance.

## Production and review evidence

- Built-in ImageGen was used for the normalized endpoint rasters; no CLI/API fallback was used.
- The ten parallel endpoint workers used native `gpt-5.6-luna` at `xhigh`, one worker per Weeks 01–10, as listed in `PHY4605_Deck_Normalization_Dispatch_Ledger.md`.
- The coordinating main agent generated the endpoint rasters for Weeks 11–13 with the same built-in ImageGen backend.
- The current deck geometry is 16:9, with `screen16x9` metadata and one full-slide raster image per slide.
- The current endpoint-normalization QA includes endpoint hash matching, interior-media preservation, ZIP integrity, slide/note count checks, and PDF/infographic verification.
- The Sol medium final reviewer completed final acceptance after the residual visual, flow, infographic, and packaging-metadata issues were corrected; the reviewer's historical provenance cautions remain represented in the archived records.

## Historical provenance boundary

The Week 13 provenance-gap record and affected weekly QA records remain as historical evidence of missing predecessor-chain artifacts. They are not deleted or rewritten to imply an original full-deck approval. Current endpoint normalization approval is limited to the scope and evidence listed above.
