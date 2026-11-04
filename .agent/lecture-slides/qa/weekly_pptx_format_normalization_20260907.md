# Weekly PPTX Format Normalization Record — 2026-09-07

## Scope

The current student-facing lecture decks for Weeks 01–12 and their matching current hidden assembled copies received the packaging-format correction described below. That metadata-only correction did not change slide images, presenter notes, slide counts, or numerical content. The separate user-approved endpoint normalization is recorded in the dispatch and approval records; Week 13 already carried the `screen16x9` metadata and was not repacked in this format operation.

## Corrections

- Changed `p:sldSz` metadata from `screen4x3` to `screen16x9` for Weeks 01–12. Numeric dimensions remain `9,144,000 × 5,143,500` EMU.
- Synchronized `docProps/app.xml` from `On-screen Show (4:3)` to `On-screen Show (16:9)` for Weeks 01–12 so the application metadata agrees with the slide geometry.
- Removed the unintended `p:cxnSp` title-rule connector from all 14 Week 12 slides. Each slide now contains one full-slide picture and zero connector shapes.
- Synchronized each current hidden assembled copy with its root-facing deck. Retired/predecessor artifacts were not changed.
- Re-applied the `screen16x9` presentation-type metadata to the current root-facing and hidden assembled copies for Weeks 01–12 after the endpoint-correction reassembly. The verification below refers to these post-reassembly files; no slide image, note, or numerical content was changed by the metadata pass.

## Verification

- `unzip -t` passed for every current Week 01–12 root deck.
- Every current Week 01–12 deck has matching slide and presenter-note counts: Week 01 has 13/13; Weeks 02–06 have 14/14, Week 07 has 17/17, and Weeks 08–12 have 14/14.
- Every current Week 01–12 deck contains `screen16x9` slide-size metadata and `On-screen Show (16:9)` application metadata; no current deck contains the stale 4:3 values.
- Root and current hidden assembled copies compare byte-for-byte identical for every mapped week.
- Week 12 slides 01–14 each have `pics=1` and `connectors=0`.
- Current root deck hashes:

  - Week 01: `3ab88a1b61a5576dc24b3d595d619e089e26b7b5d04c56a22bba21769c825f3a`
  - Week 02: `6f188582f2579dec75dd84095652a6571758ad6611d107fe2cc9508dcd45a567`
  - Week 03: `bf7728c55412e13442a796ce009d58d034712026784094208e8fdc12bee40a99`
  - Week 04: `2b28215ede2d536fefcf43242ceba6c692849cb3aefbe47cf3db31bd2824e63d`
  - Week 05: `296de2579373217f352c4ed57fb69cffae89c97e0897d3bf65a5f165cb075f9d`
  - Week 06: `eeb6a8863badf7ad36d71f5963ac4dfc5b1556757caa9735f77d485392464b6a`
  - Week 07: `ae923bf1dc364cac929458897e8b188ec79d2d1b30ced952533b34ad54a344f4`
  - Week 08: `8143e2c575e6895e99a4d7e8ee90fc9222bff34bb8c0aad9c6960e219d964dba`
  - Week 09: `4ee2fed41b6b26ec5b4fba20f77adc527e711800c79bfa64070ea0947bc36503`
  - Week 10: `5264ab1b1fb3f2c36d3086c3d5d9d7b8fd731f381916fc0eb3fc847bfd53a480`
  - Week 11: `f566e546335a09d4f37eceebffb7e837d8b5af9b83b97e181e42ab22b9c575c0`
  - Week 12: `0085867361c809f2c963d2274e189044d40eed42b988214d3912fdd28001f08c`

This packaging record does not establish the historical full-deck production chain. Current endpoint-normalization approval and its limited provenance are recorded separately in `.agent/lecture-slides/PHY4605_Deck_Normalization_Approval_Record_20260907.md`.
