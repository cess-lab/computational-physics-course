# PHY4605 Week 02 Practical — Instructor Guide

This hidden guide supports `Week02_Practical_Debug_and_Validate_Projectile_Model.m`.

## Intended evidence

Students should be able to decompose a projectile problem before coding, write dependency-aware pseudocode, preserve units and array shapes, diagnose plausible AI-generated defects, select independent validation checks, and interpret the trajectory physically.

## Delivery and accountability

1. Require every student to submit the Week 02 Google Form section before opening MATLAB, consulting notes or AI, or discussing with the group.
2. Review aggregate responses rather than marking the form. Use one common misconception as the opening debrief.
3. Keep groups of two or three and rotate model, algorithm/implementation, and validation roles from Week 1.
4. Require pseudocode before Copilot use.
5. Ask one randomly selected student per group to explain one dependency, one candidate defect, and one validation check.
6. Require a concise AI decision record when AI materially influenced the work.

## Baseline values

For launch speed `18.0 m/s`, angle `40 deg`, initial height `1.5 m`, and `g = 9.81 m/s^2`:

| Quantity | Expected value |
| --- | ---: |
| Horizontal speed | approximately `13.789 m/s` |
| Initial vertical speed | approximately `11.570 m/s` |
| Flight time | approximately `2.482 s` |
| Horizontal range | approximately `34.225 m` |
| Peak time | approximately `1.179 s` |
| Peak height | approximately `8.323 m` |

## Candidate defects

- assigns a degree value directly to a radians variable;
- reverses the middle and final arguments in the colon expression;
- uses matrix power `^2` instead of element-wise power `.^2` for an array;
- reverses the intended plot axes;
- does not label axes or state units;
- does not stop or check the trajectory at ground level; and
- provides no initial-condition, landing, range, or shape tests.

## Suggested practical marking guide

| Criterion | Marks |
| --- | ---: |
| Decomposition, assumptions, variables, and units | 4 |
| Pseudocode and dependency reasoning | 4 |
| Defect diagnosis and controlled correction | 4 |
| Validation evidence and added test | 5 |
| Physical interpretation, limitation, and AI judgement | 3 |

Do not award full credit for runnable code or a plausible graph without explicit reasoning and validation evidence.
