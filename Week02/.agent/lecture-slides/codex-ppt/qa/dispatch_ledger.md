# Week 02 slide-worker dispatch ledger

- Coordinating model: `gpt-5.6-luna`
- Coordinating reasoning effort: `max`
- Worker policy: inherited full-history fork (`fork_context=true`, the platform equivalent of `fork_turns="all"`); model and reasoning-effort overrides omitted; worker role `worker`.
- User/project constraint: only exact-match Luna Max workers may be used for remaining slides.
- Selected image backend: built-in `image_gen`, edit-mode family, matching the approved sample-generation method.

## Dispatch records

| Slide | Agent ID | Nickname | Model / effort | Inheritance | Prompt |
| --- | --- | --- | --- | --- | --- |
| 01 | `01a05e2a-767b-73c1-9686-3945acec9980` | Franklin | `gpt-5.6-luna` / `max` | full-history fork; overrides omitted | `prompts/slide_01.json` |
| 02 | `01a05e2a-794e-7e20-8312-d50f3a0e2560` | Faraday | `gpt-5.6-luna` / `max` | full-history fork; overrides omitted | `prompts/slide_02.json` |
| 03 | `01a05e2a-7f24-7922-b8d7-47ef0d13ef03` | Herschel | `gpt-5.6-luna` / `max` | full-history fork; overrides omitted | `prompts/slide_03.json` |
| 05 | `01a05e2a-8d9b-7913-8875-0109d1455c10` | Curie | `gpt-5.6-luna` / `max` | full-history fork; overrides omitted | `prompts/slide_05.json` |

## Recorded results

| Slide | Selected source | Parent record | QA result |
| --- | --- | --- | --- |
| 01 | `generated_images/01a05e2a-767b-73c1-9686-3945acec9980/exec-6162c314-2c11-4102-aecd-c90c768fb97e.png` | `origin_image/slide_01.png` | cover readable; trajectory and reasoning path present |
| 02 | `generated_images/01a05e2a-794e-7e20-8312-d50f3a0e2560/exec-762afe5d-595c-448e-b88e-3c818fe4bf28.png` | `origin_image/slide_02.png` | prediction sequence readable; labels and trajectory clear |
| 03 | `generated_images/01a05e2a-7f24-7922-b8d7-47ef0d13ef03/exec-c069c20c-ccd9-45dd-a33c-568f6d9bcd59.png` | `origin_image/slide_03.png` | strict equation preserved and visually prominent |
| 05 | `generated_images/01a05e2a-8d9b-7913-8875-0109d1455c10/exec-b08cb5cd-e7ba-4262-8d3b-7209d1aa7210.png` | `origin_image/slide_05.png` | six-step ladder readable; loop-back explicit |

| 06 | `generated_images/01a05e2c-d2b9-74e0-951c-d8f6ab7fe56d/exec-4578ef98-467f-4a17-a33b-24e90b60de1a.png` | `origin_image/slide_06.png` | index 2 aligns the time and position arrays |
| 07 | `generated_images/01a05e2c-d3b3-7fc0-9dc1-8b73618739ca/exec-1b50e141-64f9-428f-8eaa-3218e158405a.png` | `origin_image/slide_07.png` | two-pass trace and exact values readable |
| 08 | `generated_images/01a05e2c-d6cc-73a3-8771-4390d82cd224/exec-a86e03c9-2ea7-4740-bb01-949be5808f67.png` | `origin_image/slide_08.png` | loop roles and MATLAB identifiers clear |
| 09 | `generated_images/01a05e2c-dfb3-73e0-9b09-e5f37c6d1ba6/exec-1be3154f-8260-44f9-b348-28318795d18b.png` | `origin_image/slide_09.png` | scaffold completion and first-value check clear |
| 10 | `generated_images/01a05e2f-db76-7663-8846-98695b395a3e/exec-d18e5dd5-41f8-4043-b2de-7212e186d190.png` | `origin_image/slide_10.png` | controlled one-input comparison readable |
| 12 | `generated_images/01a05e2f-e1ee-7290-a677-f43694eeae98/exec-47d4a20c-4f55-4dc9-955e-64d7cba8c1e9.png` | `origin_image/slide_12.png` | three defect classes and evidence path clear |
| 13 | `generated_images/01a05e2f-ef88-74e1-a8da-a85eea08672d/exec-57dacd4f-4d03-4074-aca0-b5341fd8a005.png` | `origin_image/slide_13.png` | strict initial-value asset and check distinction preserved |
| 11 | `generated_images/01a05e3d-25a2-7211-bca6-10032a26732f/exec-c7cf09d1-656d-4de0-a79e-76ea6c3f6f3b.png` | `origin_image/slide_11.png` | conceptual evidence board; no quantitative plot presented |
| 14 | `generated_images/01a05e3d-269b-71b2-8c73-961b50e998cc/exec-9a811f51-2e21-4111-887e-d3da5ff4cb47.png` | `origin_image/slide_14.png` | four exit-ticket prompts and 2 x 2 bridge readable |

| 10 | `01a05e2f-db76-7663-8846-98695b395a3e` | Boole | `gpt-5.6-luna` / `max` | full-history fork; overrides omitted | `prompts/slide_10.json` |
| 11 | `01a05e2f-dc88-73b2-8f1a-f4492514408a` | Wegener | `gpt-5.6-luna` / `max` | full-history fork; overrides omitted | `prompts/slide_11.json` |
| 12 | `01a05e2f-e1ee-7290-a677-f43694eeae98` | Tesla | `gpt-5.6-luna` / `max` | full-history fork; overrides omitted | `prompts/slide_12.json` |
| 13 | `01a05e2f-ef88-74e1-a8da-a85eea08672d` | Chandrasekhar | `gpt-5.6-luna` / `max` | full-history fork; overrides omitted | `prompts/slide_13.json` |

## Dispatch records (continued)

| Slide | Agent ID | Nickname | Model / effort | Inheritance | Prompt |
| --- | --- | --- | --- | --- | --- |
| 06 | `01a05e2c-d2b9-74e0-951c-d8f6ab7fe56d` | Mencius | `gpt-5.6-luna` / `max` | full-history fork; overrides omitted | `prompts/slide_06.json` |
| 07 | `01a05e2c-d3b3-7fc0-9dc1-8b73618739ca` | Arendt | `gpt-5.6-luna` / `max` | full-history fork; overrides omitted | `prompts/slide_07.json` |
| 08 | `01a05e2c-d6cc-73a3-8771-4390d82cd224` | Nietzsche | `gpt-5.6-luna` / `max` | full-history fork; overrides omitted | `prompts/slide_08.json` |
| 09 | `01a05e2c-dfb3-73e0-9b09-e5f37c6d1ba6` | Turing | `gpt-5.6-luna` / `max` | full-history fork; overrides omitted | `prompts/slide_09.json` |

## Lecturer-approved replacement dispatch

The first Slide 11 job was blocked because its strict MATLAB plot could not be preserved by image generation. On 2026-09-02 the lecturer approved replacing that asset with a generated conceptual evidence graphic. The original blocked state is retained at `qa/slide11-strict-blocked-run-slide_jobs.json`; the slide was reopened through the controlled migration script in `qa/reopen_slide_after_user_approval.py`.

| Slide | Agent ID | Nickname | Model / effort | Inheritance | Prompt |
| --- | --- | --- | --- | --- | --- |
| 11 | `01a05e3d-25a2-7211-bca6-10032a26732f` | Leibniz | `gpt-5.6-luna` / `max` | full-history fork; overrides omitted | `prompts/slide_11_conceptual.json` |
| 14 | `01a05e3d-269b-71b2-8c73-961b50e998cc` | Socrates | `gpt-5.6-luna` / `max` | full-history fork; overrides omitted | `prompts/slide_14.json` |
