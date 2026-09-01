import fs from "node:fs/promises";
import path from "node:path";
import { Presentation, PresentationFile } from "@oai/artifact-tool";

const projectRoot = "/Users/khairuladib/MATLAB-Drive/Kuliah/computational-physics-course";
const rasterDir = path.join(projectRoot, "Week05/.agent/lecture-slides/raster");
const renderedDir = path.join(projectRoot, "Week05/.agent/lecture-slides/rendered-final");
const finalPptx = path.join(projectRoot, "Week05/Lecture_Slides_Week05.pptx");

const intents = [
  "Frame root finding as an evidence chain rather than a number-returning exercise.",
  "Preview the reasoning chain that connects the orbit model to defensible physical interpretation.",
  "Define a residual as the mismatch that a candidate root must satisfy.",
  "Connect Kepler's orbit model to its residual and derivative forms.",
  "Elicit criteria for accepting a computed root before MATLAB is used.",
  "Show how the analytic bracket supplies global existence evidence.",
  "Use the derivative to complete the uniqueness argument.",
  "Explain how bisection preserves a bracket and shrinks uncertainty.",
  "Explain Newton's method as a local tangent construction with a failure risk.",
  "Compare efficiency and residual evidence for three baseline solvers.",
  "Separate four stopping indicators that answer different numerical questions.",
  "Use convergence plots to expose robustness and risk in the iteration path.",
  "Diagnose why an invalid bracket removes bisection's guarantee before iteration begins.",
  "Expose the large Newton step caused by a small derivative in the stress case.",
  "Show how safeguarded Newton combines a bracket invariant with local speed.",
  "Position fzero as a reference implementation that still requires independent validation.",
  "Guide solver selection using the evidence available for the physical problem.",
  "Synthesize the Week 05 evidence chain and bridge into the practical task.",
];

const checkpoints = [
  "What evidence, beyond a returned number, would make a root trustworthy?",
  "Which stage in this chain is most often skipped when code appears to work?",
  "What does a small residual establish, and what does it not establish?",
  "Which quantities are angles, which are dimensionless, and which variable is unknown?",
  "Would a tiny iteration step alone convince you that Kepler's equation is solved? Why?",
  "Which endpoint signs are required before the intermediate value argument applies?",
  "Why does a positive derivative rule out a second bracketed root here?",
  "What numerical evidence remains available at every bisection iteration?",
  "What happens to the Newton step when the local derivative becomes very small?",
  "Why is the smallest iteration count not automatically the most trustworthy answer?",
  "Which stopping quantity is an error bound, and which is only an implementation report?",
  "What feature of each curve indicates robustness or risk before the final root is reached?",
  "What precondition failed before bisection was allowed to run?",
  "Predict the first Newton step from f(0) and f'(0) before reading the result.",
  "When should the safeguarded method reject a Newton proposal?",
  "Which checks remain the student's responsibility after fzero returns successfully?",
  "Which evidence in your own capstone problem supports a bracket, a guess, or a fallback?",
  "Name the two validation checks your group will preserve in the practical report.",
];

const transitions = [
  "Next, make the complete model-to-evidence arc explicit.",
  "Begin the arc by defining the residual that the solver must satisfy.",
  "Now specialise the generic residual to Kepler's equation.",
  "Before choosing a method, pause to decide what evidence would be sufficient.",
  "Use the physical model to construct a justified bracket.",
  "Existence is not uniqueness, so inspect the derivative next.",
  "With a unique bracketed root established, apply bisection.",
  "Contrast the global bracket strategy with Newton's local tangent strategy.",
  "Test both methods on the baseline orbit and compare with fzero.",
  "Separate the stopping indicators before interpreting convergence plots.",
  "Visualise the iteration history rather than relying only on the final row.",
  "Move from successful convergence to failure diagnosis.",
  "After the invalid bracket, stress-test Newton with a small derivative.",
  "Recover reliability by preserving the bracket and safeguarding Newton.",
  "Compare the safeguarded method with MATLAB's reference solver.",
  "Turn the method evidence into an explicit solver-selection rule.",
  "Close by collecting the complete chain that students will use in the practical.",
  "End with the practical comparison, validation evidence, and reproducible handoff.",
];

const numericalSlides = new Set([6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17]);

function notesFor(slideNumber) {
  const sources = [
    "- Week05_Root_Finding_Bracketing_Newton_and_Reliability.pdf / .tex, aligned section",
    "- Week05_Lecture_Demonstration_Root_Finding_and_Kepler_Orbits.m, aligned section",
    "- Week05_Practical_Compare_Root_Finders_for_Kepler_Equation.m, where relevant",
  ];
  if (numericalSlides.has(slideNumber)) {
    sources.push("- Week05/.agent/qa/validate_week05_model.m for numerical values");
  }
  return [
    `Teaching intent: ${intents[slideNumber - 1]}`,
    `Checkpoint/question: ${checkpoints[slideNumber - 1]}`,
    `Transition: ${transitions[slideNumber - 1]}`,
    "[Sources]",
    ...sources,
  ].join("\n");
}

async function readImageBytes(imagePath) {
  const bytes = await fs.readFile(imagePath);
  return bytes.buffer.slice(bytes.byteOffset, bytes.byteOffset + bytes.byteLength);
}

async function writeBlob(outputPath, blob) {
  await fs.writeFile(outputPath, new Uint8Array(await blob.arrayBuffer()));
}

async function main() {
  await fs.mkdir(renderedDir, { recursive: true });

  const presentation = Presentation.create({
    slideSize: { width: 1920, height: 1080 },
  });

  for (let slideNumber = 1; slideNumber <= 18; slideNumber += 1) {
    const stem = `slide-${String(slideNumber).padStart(2, "0")}`;
    const imagePath = path.join(rasterDir, `${stem}.png`);
    const slide = presentation.slides.add();
    slide.background.fill = "#FFFFFF";
    slide.images.add({
      blob: await readImageBytes(imagePath),
      contentType: "image/png",
      alt: `PHY4605 Week 05 lecture slide ${slideNumber}`,
      fit: "cover",
      position: { left: 0, top: 0, width: 1920, height: 1080 },
      geometry: "rect",
      name: stem,
    });
    slide.speakerNotes.textFrame.setText(notesFor(slideNumber));
    slide.speakerNotes.setVisible(true);
  }

  for (const [index, slide] of presentation.slides.items.entries()) {
    const outputPath = path.join(renderedDir, `slide-${index + 1}.png`);
    await writeBlob(outputPath, await presentation.export({ slide, format: "png", scale: 1 }));
  }

  const montage = await presentation.export({ format: "webp", montage: true, scale: 1 });
  await writeBlob(path.join(renderedDir, "deck-montage.webp"), montage);

  const inspection = await presentation.inspect({
    kind: "slide,image,textbox,shape,chart,table,notes",
    maxChars: 50000,
  });
  await fs.writeFile(path.join(renderedDir, "artifact-inspection.ndjson"), inspection.ndjson);

  const pptx = await PresentationFile.exportPptx(presentation);
  await pptx.save(finalPptx);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
