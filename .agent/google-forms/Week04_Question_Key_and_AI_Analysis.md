# Week 04 Individual Check - Question Key and AI Analysis

This is a **draft question/analysis specification only**. Do not create the live Google Form or Classroom coursework until the lecturer approves the Week 04 materials and diagnostic wording.

## Suggested six-question diagnostic

1. **Physical prediction - multiple choice.** Three ideal springs experience the same 8 N force. Their stiffnesses are 50, 100, and 200 N/m. Which spring extends the most? **Key:** 50 N/m.
2. **Units/scaling - multiple choice.** For `x = F./k`, what are the units of `x` when `F` is in N and `k` is in N/m? **Key:** m.
3. **Array/code reasoning - multiple choice.** In a result matrix with one stiffness case per row, what does `extension_m(3,end)` represent when row 3 is the 200 N/m spring? **Key:** extension of the 200 N/m spring at the final/common force value.
4. **Controlled-comparison diagnosis - multiple choice.** A student changes both spring stiffness and the force range for each plotted curve. What is the main problem? **Key:** more than one input changed, so differences cannot be attributed to stiffness alone.
5. **Validation reasoning - short response.** State one independent check for the Hooke-law sweep and explain what error it could reveal. **Expected examples:** zero force gives zero extension; units of `F/k` are metres; same-force ordering `x_50 > x_100 > x_200`; a selected analytical point such as 10 N / 100 N/m = 0.10 m.
6. **Confidence - linear scale 1-5.** Use the same fixed confidence labels as other weeks; there is no correct value.

## Intended evidence

| Category | Expected response | Misconceptions to tag |
| --- | --- | --- |
| Physical prediction | Smaller stiffness gives larger extension at the same force. | Stiffer means larger extension; line colour determines magnitude; changing force and stiffness together is acceptable |
| Units/scaling | N divided by N/m gives m. | Treating N/m as N*m; claiming extension is in N; ignoring dimensional consistency |
| Array/code reasoning | Row selects the stiffness case; `end` selects the final common force sample. | Confusing rows with force samples; treating `end` as the parameter maximum independent of storage layout |
| Controlled comparison | Change one named parameter and hold the model and other inputs fixed. | Believing any overlay is a sweep; allowing different input arrays without recognising confounding |
| Validation reasoning | A specific check linked to a defect it could expose. | "The code ran"; "the graph looks smooth"; naming a check without explaining its diagnostic value |
| Confidence | Use for calibration only. | High-confidence incorrect and low-confidence correct responses are both useful teaching signals |

## Suggested AI-analysis prompt

Analyse the anonymised Week 04 responses as a cohort diagnostic. Do not grade or rank individual students. Report response count and missing data; option percentages for the four conceptual items; the three most common misconceptions; thematic coding of validation answers into limiting case, units, same-input trend, analytical reference, visual-only, code-ran-only, and unclear; confidence calibration; two points to address before group work; and one caution about what cannot be inferred from this ungraded diagnostic. Do not infer misconduct or general programming ability from one check.
