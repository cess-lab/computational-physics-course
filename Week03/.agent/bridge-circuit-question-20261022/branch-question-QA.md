# Revised branch-current question

Final image: ../../Week03_Bridge_Circuit_Question.png
Built-in backend: image_gen__imagegen, edit mode.
Prompt: branch-question-image-prompt.txt
Generated source: /Users/khairuladib/.codex/generated_images/01a1612d-265c-7cc3-b476-9107dbfb81f6/exec-e2eca2a5-0d72-4abc-9c18-48ca37a11cdd.png
Previous mesh-current question preserved at assets/mesh-current-question-retired.png.

Visual inspection: all nine resistor names and values, the one 24 V source, its polarity, and original circuit connections retained. A/B/C remain correctly placed. Circular mesh arrows removed. Five physical branch-current labels shown with straight arrows parallel to the actual branches. The current-direction guide agrees with every arrow. No numerical current answers are exposed.

New labels supersede earlier mesh-current labels:
- I1: source/R1/R4 series branch, from B through the source to A.
- I2: R7, A to B.
- I3: Rb, A to C.
- I4: R2/R3/R8 series branch, A to C.
- I5: R6/R5 series branch, C to B.

Instructor-only mapping to earlier verified mesh solution [m1,m2,m3]=[2.5,1,0.5] A:
I1=m1=2.5 A; I2=m1-m2=1.5 A; I3=m2-m3=0.5 A; I4=m3=0.5 A; I5=m2=1 A.
At A: I1=I2+I3+I4. At B: I2+I5=I1. At C: I3+I4=I5.

Question wording now asks for all five physical branch currents. The earlier solution-deck outline uses a superseded mesh-current naming convention and must be revised before approval or production. No new solution-slide generation was authorized through the outline/sample gates in this turn.
