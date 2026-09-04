# Week 01 slide-worker dispatch ledger

- Coordinating model: `gpt-5.6-luna`
- Coordinating reasoning effort: `max`
- Worker policy: inherited full-history fork; `model` and `reasoning_effort` overrides omitted; worker role `worker`.
- User constraint: only Luna Max workers may be used.
- Selected image backend: built-in `image_gen`, edit-mode family, matching the approved sample generation method.

## Dispatch records

- `slide_01` -> agent `01a05dbb-1eed-73c2-9edc-55bfd32dfe00` (`Locke`); inherited full-history fork; model/effort overrides omitted; prompt `prompts/slide_01.json`.
- `slide_03` -> agent `01a05dbb-2037-77a3-85fb-c77d0b43a68a` (`Aquinas`); inherited full-history fork; model/effort overrides omitted; prompt `prompts/slide_03.json`.
- `slide_04` -> agent `01a05dbb-2271-7be1-996c-db0a013bdb93` (`Arendt`); inherited full-history fork; model/effort overrides omitted; prompt `prompts/slide_04.json`.
- `slide_05` -> agent `01a05dbb-3327-7ed1-88a3-02c3ff22fa73` (`Anscombe`); inherited full-history fork; model/effort overrides omitted; prompt `prompts/slide_05.json`.
- `slide_06` -> agent `01a05dbd-d32f-7a41-b070-095ede0837c7` (`Helmholtz`); inherited full-history fork; model/effort overrides omitted; prompt `prompts/slide_06.json`.
- `slide_07` -> agent `01a05dbd-d54f-7ed3-8714-c26e1ea5d97a` (`Beauvoir`); inherited full-history fork; model/effort overrides omitted; prompt `prompts/slide_07.json`.
- `slide_08` -> agent `01a05dbd-db55-7a80-8a32-b6c58f59d088` (`Hume`); inherited full-history fork; model/effort overrides omitted; prompt `prompts/slide_08.json`.
- `slide_09` -> agent `01a05dbd-e5bf-7f51-ba4d-d49ce9dd6da2` (`Tesla`); inherited full-history fork; model/effort overrides omitted; prompt `prompts/slide_09.json`.
- `slide_10` -> agent `01a05dc0-7320-7782-adf1-5a06bb0df31c` (`Hilbert`); inherited full-history fork; model/effort overrides omitted; prompt `prompts/slide_10.json`.
- `slide_11` -> agent `01a05dc0-7409-7872-98a8-c1572af61a9e` (`Poincare`); inherited full-history fork; model/effort overrides omitted; prompt `prompts/slide_11.json`.
- `slide_12` -> agent `01a05dc0-7504-76e0-bf8f-ea8962810f99` (`Hegel`); inherited full-history fork; model/effort overrides omitted; prompt `prompts/slide_12.json`.
- `slide_13` -> agent `01a05dc0-7e37-7550-8938-92d92b2b5774` (`Meitner`); inherited full-history fork; model/effort overrides omitted; prompt `prompts/slide_13.json`.

## Parent QA edits

- `slide_12`: parent-owned localized built-in-image-tool edit replaced a potentially misleading mini graph with a qualitative curve icon; no new worker or backend was used.
- Dispatch ran in three batches because the live runtime exposed four worker slots at a time; no sequential slide-generation fallback was used.
