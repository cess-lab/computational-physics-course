# Bridge-circuit question: retained source and QA

Date: 2026-10-22 (Asia/Kuala_Lumpur).
Final question: ../../Week03_Bridge_Circuit_Question.png
Backend: built-in image_gen__imagegen; edit with original-bridge-reference.png.
Original generated output: /Users/khairuladib/.codex/generated_images/01a1612d-265c-7cc3-b476-9107dbfb81f6/exec-e31d377e-ecb2-461c-944e-68905d8288ba.png
Exact generation prompt: question-image-prompt.txt.
No manual drawing, overlay, or raster modification was used.

## Visual and scientific inspection
- Nine IEC rectangular resistors, each labelled once with the specified value.
- All original connections preserved: R7 vertical A-B; Rb diagonal A-C; two top series resistors R2/R3; right R8; two lower series resistors R5/R6.
- One source, 24 V; positive terminal above negative.
- I1 left rectangle, I2 lower triangle, I3 upper-right triangle; each arrow clockwise.
- No numerical answer appears in the question.
- Title, task, ohmic assumption, and amperes requirement are legible.
- A/B/C labels added to make the solution's branch directions explicit.

## Exact solution source
Resistance order: R1,R2,R3,R4,R5,R6,R7,R8,Rb.
Values in ohms: 3,1,2,3,2,4,6,3,6.
KVL, taking drops in the clockwise mesh directions:
3I1 + 6(I1-I2) + 3I1 = 24
6(I2-I1) + 6(I2-I3) + (2+4)I2 = 0
(1+2+3)I3 + 6(I3-I2) = 0

A = [12 -6 0; -6 18 -6; 0 -6 12] ohm
b = [24;0;0] V
I = A\b = [2.5;1;0.5] A

Hand check: equation 3 gives I3=I2/2; equation 1 gives I1=2+I2/2.
Equation 2 then gives -12+12I2=0, so I2=1 A.

## Independent computational evidence
verify_bridge.m executed through a fresh MATLAB process using the verified installed path:
'/Applications/MATLAB R2026b.app/bin/matlab' -batch "run('<absolute path to verify_bridge.m>')"
The process exited 0 and all assertions passed.
matlab-validation.log retains the complete output, including startup launcher warnings.
The MCP MATLAB endpoint initially failed because it expects an absent underscore-named application path.
No MATLAB or Codex setup/configuration was changed.

Mesh result: [2.5;1;0.5] A.
Independent node result [VA;VB;VC] = [16.5;7.5;13.5] V relative to source negative.
Node analysis uses conductances assembled independently from the circuit:
[5/6 -1/6 -1/3; -1/6 2/3 -1/6; -1/3 -1/6 1/2] V = [8;0;0] A.
Maximum mesh KVL residual: 1.78e-15 V.
Branch currents [source;R7 A->B;Rb A->C;upper A->C;lower C->B] = [2.5;1.5;0.5;0.5;1] A.
Source power = 24*2.5 = 60 W.
Resistor dissipation = 60 W.
At A: 2.5=1.5+0.5+0.5 A; at B: 1.5+1=2.5 A; at C: 0.5+0.5=1 A.

## Slide production status
Additional six-slide solution outline retained at:
../lecture-slides/codex-ppt-bridge-solution-20261022/outline.md
Awaiting explicit outline and asset-mapping approval.
No final deck spec, speaker notes, prompt jobs, solution-slide images, worker jobs, or PPTX were created.
The standalone question image is a separate requested deliverable, not a deck sample or an approved final deck slide.
Existing Week03 files, including previously modified README.md, were preserved.
