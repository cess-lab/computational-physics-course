# Computational Methods in Physics

> **Dr. Muhammad Khairul Adib Muhammad Yusof**
> Department of Physics, Faculty of Science, Universiti Putra Malaysia

A comprehensive MATLAB-based course covering computational techniques in physics — from programming fundamentals through advanced simulations in quantum mechanics, relativity, and astrophysics.

---

## Overview

This course teaches students to apply computational methods to real physics problems using MATLAB. The curriculum progresses from core programming concepts through nine major physics domains, with hands-on lab assignments and a culminating mini-project.

- **117** reference simulation scripts
- **8** progressive lab assignments
- **8** major physics domains covered
- **5** real-world datasets included

---

## Repository Structure

```
computational-physics-course/
├── Notes/                      # Lecture materials (MATLAB Live Scripts + PDFs)
│   ├── Notes 0 – Introduction
│   ├── Notes 1 – Programming Fundamentals
│   ├── Notes 2 – Arrays and Matrices
│   ├── Notes 3 – Data Types
│   ├── Notes 4 – Logic and Conditionals
│   ├── Notes 5 – Loops
│   ├── Notes 6 – Algorithm Errors
│   ├── Notes 7 – Functions
│   ├── Notes 8 – Graphics
│   ├── Notes 9 – Random Number Simulation
│   ├── Notes 13 – Data Processing
│   └── Data files (CSV)
├── Lab Assignments/            # Weekly lab exercises (Labs 01–09)
└── Mini Project/
    ├── Code/                   # 117 physics simulation scripts (8 topic folders)
    ├── MiniProject.mlx/.pdf    # Project specification
    ├── MiniProjectTemplate.mlx # Student starter template
    └── Previous Semester Submissions/
```

---

## Course Curriculum

### Phase 1: Programming Fundamentals

| Notes | Topic |
|-------|-------|
| 0 | Course Introduction |
| 1 | Programming Fundamentals |
| 2 | Arrays and Matrices |
| 3 | Data Types |
| 4 | Logic and Conditional Statements |
| 5 | Loops |
| 6 | Algorithm Errors |
| 7 | Functions |
| 8 | Graphics and Visualization |
| 9 | Random Number Simulation |
| 13 | Data Processing |

Each lecture note has a corresponding lab assignment for hands-on practice.

---

### Phase 2: Physics Simulations (Mini Project Topics)

#### 1. Symbolic Mathematics & Numerical Methods
Data fitting, least squares, chi-square analysis, matrix inversion, eigenvalues, symbolic differentiation/integration, Fourier analysis, Taylor series, ODE solving.

#### 2. Classical Mechanics
Kepler orbital mechanics, harmonic and coupled oscillators, chaotic systems, scattering, pendulum dynamics, projectile/rocket motion, Coriolis effects, triatomic molecules.

#### 3. Electromagnetism
Cyclotron dynamics, Helmholtz coils, magnetic shields, current loops, dipole radiation, electric fields of point charges, Poisson/Laplace equations, image charge methods, solar sails.

#### 4. Waves and Optics
Diffraction, Doppler and Cerenkov effects, drum vibrational modes, damped/oscillating waves, wave reflection/transmission, spectral line fitting, spherical lenses and mirrors, string plucking (wave equation).

#### 5. Gases and Fluid Dynamics
Maxwell-Boltzmann distributions, Fermi-Dirac and Bose-Einstein statistics, atmospheric models, fluid flow (pipes, airfoils, wind tunnels), heat diffusion (PDE), viscosity, transport phenomena.

#### 6. Quantum Mechanics
Particle in a box (infinite and finite wells), quantum harmonic oscillator, hydrogen atom, periodic table, Schrödinger equation (1D and 3D), quantum tunneling, Born scattering, wave packet dynamics, spherical harmonics.

#### 7. Special and General Relativity
Time dilation, relativistic kinematics, rocket equations, Compton scattering, photoelectric effect, moving charge radiation, Schwarzschild metric, gravitational radiation and chirps, tidal forces.

#### 8. Astrophysics and Cosmology
Stellar structure, white dwarfs, dark matter, gravitational clustering, cosmological models, Fermi pressure, nucleosynthesis.

---

## Getting Started

### Prerequisites

- MATLAB (R2019b or later recommended)
- MATLAB Symbolic Math Toolbox (for symbolic computation examples)

### Running the Code

1. Clone the repository:
   ```bash
   git clone https://github.com/cess-lab/computational-physics-course.git
   ```
2. Open MATLAB and navigate to the repository folder.
3. For lecture notes, open any `.mlx` file in the `Notes/` directory.
4. For physics simulations, browse the `Mini Project/Code/` subdirectories and run any `.m` script.

### Included Datasets

| File | Description |
|------|-------------|
| `earthquakes-2021.csv` | Seismic event data |
| `ETH-USD.csv` | Cryptocurrency price history |
| `outages.csv` | Power grid outage records |
| `airlinesmall.csv` | Airline traffic statistics |

---

## Assessment

| Component | Description |
|-----------|-------------|
| Lab Assignments (×8) | Weekly hands-on exercises aligned to lecture notes |
| Mini Project | Group project: select a physics topic, implement simulations, and present results |

The mini project template (`MiniProjectTemplate.mlx`) provides a structured starting point. Previous semester submissions are included as reference examples.

---

## Reference

Green, D. (2013). *One Hundred Physics Visualizations Using MATLAB*. World Scientific. (Copy included in `Mini Project/Reference PDF/`)

---

## License

Course materials are owned and managed by Dr. Muhammad Khairul Adib Muhammad Yusof, Department of Physics, Faculty of Science, Universiti Putra Malaysia. Please contact the author for usage permissions.
