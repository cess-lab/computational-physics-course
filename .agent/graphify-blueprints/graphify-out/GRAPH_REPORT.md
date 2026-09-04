# Graph Report - .agent/graphify-blueprints/corpus  (2026-08-31)

## Corpus Check
- Corpus is ~13,574 words - fits in a single context window. You may not need a graph.

## Summary
- 34 nodes · 37 edges · 7 communities (6 shown, 1 thin omitted)
- Extraction: 92% EXTRACTED · 8% INFERRED · 0% AMBIGUOUS · INFERRED: 3 edges (avg confidence: 0.92)
- Token cost: 0 input · 0 output

## Community Hubs (Navigation)
- [[_COMMUNITY_Early Weekly Progression|Early Weekly Progression]]
- [[_COMMUNITY_Course Blueprint and Foundations|Course Blueprint and Foundations]]
- [[_COMMUNITY_Assessment Evidence|Assessment Evidence]]
- [[_COMMUNITY_Live Scripts and Root Finding|Live Scripts and Root Finding]]
- [[_COMMUNITY_Digital Learning Roles|Digital Learning Roles]]
- [[_COMMUNITY_Slide Design and Raster QA|Slide Design and Raster QA]]
- [[_COMMUNITY_Weekly Package Convention|Weekly Package Convention]]

## God Nodes (most connected - your core abstractions)
1. `PHY4605 Course-Material Blueprint` - 8 edges
2. `Google Classroom` - 6 edges
3. `PHY4605 Assessment Blueprint` - 6 edges
4. `Digital Learning and Submission Architecture` - 4 edges
5. `PHY4605 Computational Methods in Physics` - 4 edges
6. `PHY4605 Lecture Slide Deck Design Specification` - 3 edges
7. `PHY4605 MATLAB Live Script Design Specification` - 3 edges
8. `PHY4605 Week 01` - 3 edges
9. `PHY4605 Week 03` - 3 edges
10. `PHY4605 Week 04` - 3 edges

## Surprising Connections (you probably didn't know these)
- `PHY4605 Computational Methods in Physics` --semantically_similar_to--> `Computational Physics Reasoning Chain`  [INFERRED] [semantically similar]
  corpus/README.md → corpus/AGENTS.md
- `PHY4605 Course-Material Blueprint` --references--> `PHY4605 Assessment Blueprint`  [EXTRACTED]
  corpus/AGENTS.md → corpus/PHY4605_Assessment_Blueprint.md
- `PHY4605 Course-Material Blueprint` --references--> `PHY4605 Learning Note Design Specification`  [EXTRACTED]
  corpus/AGENTS.md → corpus/PHY4605_Learning_Note_Design_Spec.md
- `PHY4605 Course-Material Blueprint` --references--> `PHY4605 Lecture Slide Deck Design Specification`  [EXTRACTED]
  corpus/AGENTS.md → corpus/PHY4605_Lecture_Slide_Design_Spec.md
- `PHY4605 Course-Material Blueprint` --references--> `PHY4605 MATLAB Live Script Design Specification`  [EXTRACTED]
  corpus/AGENTS.md → corpus/PHY4605_MATLAB_Live_Script_Design_Spec.md

## Import Cycles
- None detected.

## Hyperedges (group relationships)
- **Weekly Artifact Design Specification Routing** — corpus_agents, corpus_phy4605_learning_note_design_spec, corpus_phy4605_lecture_slide_design_spec, corpus_phy4605_matlab_live_script_design_spec [EXTRACTED 1.00]
- **PHY4605 Digital Course Platform Roles** — corpus_agents_google_classroom, corpus_agents_notebooklm, corpus_agents_matlab [EXTRACTED 1.00]
- **Early Capstone Progression** — corpus_week03_readme_capstone_problem_spaces, corpus_week04_readme_capstone_question_selection, corpus_week05_readme_midsemester_report [INFERRED 0.85]

## Communities (7 total, 1 thin omitted)

### Community 0 - "Early Weekly Progression"
Cohesion: 0.25
Nodes (9): Google Classroom, PHY4605 Week 02, Reliable Computational Workflow, PHY4605 Week 03, Bounded Capstone Problem Spaces, Kirchhoff Linear-System Modelling, PHY4605 Week 04, Capstone Question Selection (+1 more)

### Community 1 - "Course Blueprint and Foundations"
Cohesion: 0.29
Nodes (8): PHY4605 Course-Material Blueprint, PHY4605 Assessment Architecture, Computational Physics Reasoning Chain, PHY4605 Learning Note Design Specification, PHY4605 Academic Scientific Learning Note, PHY4605 Computational Methods in Physics, PHY4605 Week 01, Newton Cooling Onramp Diagnostic

### Community 2 - "Assessment Evidence"
Cohesion: 0.40
Nodes (5): PHY4605 Assessment Blueprint, Defensible Computational Experiment, MathWorks MATLAB Copilot Documentation, TEQSA Assessment Reform for the Age of Artificial Intelligence, Weller et al. Computational-Thinking Practices in Introductory Physics

### Community 3 - "Live Scripts and Root Finding"
Cohesion: 0.40
Nodes (5): PHY4605 MATLAB Live Script Design Specification, PHY4605 Physics-First Reproducible MATLAB Notebook, PHY4605 Week 05, Kepler Equation Root Finding, Weeks 01-06 Mid-Semester Report

### Community 4 - "Digital Learning Roles"
Cohesion: 0.67
Nodes (3): Digital Learning and Submission Architecture, MATLAB, Gemini Notebook / NotebookLM

### Community 5 - "Slide Design and Raster QA"
Cohesion: 0.67
Nodes (3): PHY4605 Lecture Slide Deck Design Specification, ImageGen Full-Slide Raster Contract, scientific-educational-image-slides Skill

## Knowledge Gaps
- **17 isolated node(s):** `PHY4605 Assessment Architecture`, `Gemini Notebook / NotebookLM`, `MATLAB`, `Weekly Student-Facing Package Convention`, `Defensible Computational Experiment` (+12 more)
  These have ≤1 connection - possible missing edges or undocumented components.
- **1 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **Why does `PHY4605 Course-Material Blueprint` connect `Course Blueprint and Foundations` to `Assessment Evidence`, `Live Scripts and Root Finding`, `Digital Learning Roles`, `Slide Design and Raster QA`?**
  _High betweenness centrality (0.506) - this node is a cross-community bridge._
- **Why does `Google Classroom` connect `Early Weekly Progression` to `Course Blueprint and Foundations`, `Live Scripts and Root Finding`, `Digital Learning Roles`?**
  _High betweenness centrality (0.463) - this node is a cross-community bridge._
- **Why does `Digital Learning and Submission Architecture` connect `Digital Learning Roles` to `Early Weekly Progression`, `Course Blueprint and Foundations`?**
  _High betweenness centrality (0.324) - this node is a cross-community bridge._
- **What connects `PHY4605 Assessment Architecture`, `Gemini Notebook / NotebookLM`, `MATLAB` to the rest of the system?**
  _17 weakly-connected nodes found - possible documentation gaps or missing edges._