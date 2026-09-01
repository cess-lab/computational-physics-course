# Current canonical render dimensions

Master SHA-256: `f1aa3e424a31c908573959cf57852885ef05080b1b779292f4f7bc20ced4e1df`

The artifact-tool canonical proof set in `artifact-1920/` contains nine current
master renders. Every file is exactly `1920 × 1080 px`.

| File | Pixels | SHA-256 |
| --- | --- | --- |
| slide-01.png | 1920 × 1080 | `31ac3edc7c8f9916cd90fd8cfdd35f78700ee8f6d05beb74077028acb5ef645c` |
| slide-02.png | 1920 × 1080 | `bb1be00da4880b9e5816742f68bb7e81f4a00b7288e7f429ba9fc23754cc0da6` |
| slide-03.png | 1920 × 1080 | `a6813862403444b93349721c90e9999768f80cdde5eae34205ebef0ec4b5f446` |
| slide-04.png | 1920 × 1080 | `95e956593196c7d363f8801cb1bb1f478977163aa1f49b03ac02dac5db697e9d` |
| slide-05.png | 1920 × 1080 | `fd275090cb75fb53fb9514c7da139d07cf03430667645680b7f7dd720297726f` |
| slide-06.png | 1920 × 1080 | `57dfa2edef8127a2a0de30296d21ec355208999cf518eda28b20208fcc8c086a` |
| slide-07.png | 1920 × 1080 | `cb7a8acc8ce092792e3e5d10527eea95c3ee59483bab26733c26cd279044a7b4` |
| slide-08.png | 1920 × 1080 | `359051f14f1db58d72211cab6d930555a687478c9857eacb715271939eb30d84` |
| slide-09.png | 1920 × 1080 | `2985aba317f98bfa61e990ceff373be67f81a92d41b3d86b0259368e87f520dc` |

The current full-deck contact sheet is regenerated solely from this set
(`1920 × 1080 px`, SHA-256 `3e2bfdfeedf38ee363ce1cb489dd4c6c57247544124d433ca0d5d083dafc020e`).
The title-region proof is in `title-region-crops-1920/`: each crop is exactly
`1920 × 360 px`, produced from source y=70 through y=429, so it visibly retains
the title, subtitle, anchor, and wrapping. Its 3 × 3 contact sheet is
`title-region-contact-sheet-1920.png` (`1920 × 360 px`, SHA-256
`cbd2c15b18121e329157decbe26af91f8afbd465e075173ea0996bc1ac3be2ca`).
The misleading legacy `artifact-title-crops-1920`, `title-crops-current/`, and
`title-contact-sheet*.png` files were removed rather than retained as ambiguous
canonical proof. Legacy `185c…` dimensions/checksums remain explicitly retired.
