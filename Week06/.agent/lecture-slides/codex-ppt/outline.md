# PHY4605 Week 06 Lecture Deck - Draft Outline

**Status:** DRAFT FOR LECTURER REVIEW. Outline only. No Week 06 PPTX or slide-production assets have been created.

**Working title:** From Nearby Values to an Instantaneous Rate

**Audience:** Year-2 physics students who know familiar kinematics but are still developing confidence in translating equations into numerical algorithms and MATLAB.

**Teaching goal:** Interpret a derivative as a physical rate, estimate velocity from two nearby position values using a forward difference, compare a small set of step sizes, validate against an analytic derivative, state simple error, and preserve units and physical meaning.

**Narrative spine:** physical rate -> nearby values -> secant estimate -> familiar vertical-motion model -> one forward-difference calculation -> pseudocode -> MATLAB scaffold -> step-size comparison -> analytic validation -> error and interpretation -> Working exposure central difference -> transfer -> exit ticket.

**Blueprint boundary:** Core content is physical rate/gradient meaning, two nearby values, forward difference, derivative units, a small supplied step-size comparison, analytic/reference validation, and simple error. Central difference and error-versus-step-size behaviour are Working exposure. Error-order derivations, detailed truncation/round-off theory, and higher-order formulas stay out of the Core deck.

## Slide sequence

### Slide 01 - From Nearby Values to an Instantaneous Rate
- **Key points:** `Week 06 | Numerical Differentiation`. Driving question: if a position model is known, how can two nearby values estimate the velocity at one instant?
- **Visual idea:** clean vertical-motion path with two close time markers and one velocity arrow at `t = 1.0 s`.
- **Learning job:** make the derivative a physical quantity before introducing a formula.

### Slide 02 - A derivative is a physical rate
- **Key points:** `dy/dt` means how fast position changes with time; unit is metres per second. Derivatives can also represent field gradients, cooling rates, and other physical rates.
- **Visual idea:** three compact examples: position -> velocity, potential -> field gradient, temperature -> cooling rate.
- **Learning job:** connect notation to physical meaning and units.

### Slide 03 - Numerical differentiation uses two nearby values
- **Key points:** forward difference `v_fd(t0) = [y(t0+h)-y(t0)]/h`. Numerator is a position change; denominator is a time change.
- **Visual idea:** dominant position-versus-time curve with `t0`, `t0+h`, secant line, and an analytic tangent shown only as the reference concept.
- **Learning job:** geometry / representation change from tangent slope to finite secant slope.

### Slide 04 - Reuse a familiar vertical-motion model
- **Key points:** `y(t) = y0 + v0*t - 0.5*g*t^2`, with `y0 = 0 m`, `v0 = 20 m/s`, `g = 9.81 m/s^2`. Target time `t0 = 1.0 s`.
- **Visual idea:** model-to-variables map with units and the expected upward-motion state at `1.0 s`.
- **Learning job:** keep physics familiar so attention stays on the numerical method.

### Slide 05 - Predict before computing
- **Key points:** At `1.0 s` the projectile should still move upward, but slower than its initial `20 m/s`. Therefore the derivative should be positive and below `20 m/s`.
- **Visual idea:** prediction card with `positive`, `< 20 m/s`, and a blank approximate-value prompt.
- **Learning job:** establish a physical bound before MATLAB output appears.

### Slide 06 - Work one forward difference by hand
- **Key points:** Use `h = 0.5 s`, evaluate `y(1.0)` and `y(1.5)`, then divide the change in metres by `0.5 s`. Result: `7.7375 m/s`.
- **Visual idea:** two-value calculation ladder with units carried through every line.
- **Learning job:** show the method as ordinary change-in-output divided by change-in-input.

### Slide 07 - Pseudocode before MATLAB
- **Key points:** choose `t0` and `h` -> evaluate `y(t0)` -> evaluate `y(t0+h)` -> subtract -> divide by `h` -> compare with reference -> repeat for the next supplied `h`.
- **Visual idea:** simple left-to-right algorithm flow with one loop-back arrow for the step-size array.
- **Learning job:** make the computational recipe explicit before code.

### Slide 08 - Read the MATLAB scaffold line by line
- **Key points:** identify target time, step-size array, position evaluations, forward-difference expression, and stored estimates. Keep the code short and heavily commented.
- **Visual idea:** exact MATLAB excerpt with four callouts: TARGET, STEP, TWO VALUES, DIVIDE BY STEP.
- **Learning job:** code tracing / bounded completion.

### Slide 09 - Smaller steps give a more local estimate
- **Key points:** compare `h = 0.50, 0.20, 0.10, 0.05 s`; estimates approach `10.19 m/s`: `7.7375, 9.2090, 9.6995, 9.94475 m/s`.
- **Visual idea:** compact table plus a simple estimate-versus-step-size plot; analytic reference shown as a horizontal line.
- **Learning job:** graph and table interpretation, not formula memorisation.

### Slide 10 - Validate with the analytic derivative
- **Key points:** analytic velocity `v(t) = v0 - g*t`, so `v(1.0 s) = 10.19 m/s`. Compare the numerical estimate with this independent reference.
- **Visual idea:** large green reference check linking the derivative equation to the numerical estimate.
- **Learning job:** make validation a required part of numerical work.

### Slide 11 - State the error with a physical unit
- **Key points:** absolute error `|v_fd-v_exact|` has unit m/s; relative error is a percentage. At `h = 0.05 s`, absolute error is `0.24525 m/s` and relative error about `2.41%`.
- **Visual idea:** error cards with unit-aware labels; avoid a long error-theory derivation.
- **Learning job:** quantify approximation quality simply and correctly.

### Slide 12 - Why is the forward difference only approximate?
- **Key points:** a forward difference uses a finite secant over `h`, while the derivative is the local tangent rate. Smaller `h` makes the secant more local, but `h` is still finite.
- **Visual idea:** side-by-side coarse and fine secants converging visually toward the tangent.
- **Learning job:** conceptual explanation of approximation without truncation-error derivation.

### Slide 13 - Working exposure: a centred estimate
- **Key points:** supplied central difference ` [y(t0+h)-y(t0-h)]/(2h) `. For this quadratic model it matches the analytic derivative to floating-point precision; this special behaviour should not be generalised to every model. A supplied error-versus-step-size view is interpretive only.
- **Visual idea:** symmetric sample points around `t0` and a compact comparison with the forward estimate.
- **Learning job:** breadth without making central difference an independent implementation requirement.

### Slide 14 - Transfer and exit ticket
- **Key points:** Transfer the same reasoning to electric potential -> electric field and temperature -> cooling rate. Exit ticket: identify the derivative and unit, write the forward-difference recipe, explain what smaller `h` changes, and name the validation reference.
- **Visual idea:** two transfer-context cards feeding four response prompts: MEANING, FORMULA, STEP SIZE, CHECK.
- **Learning job:** retrieval and practical preparation without adding a new method.

## Future strict/reference assets if slide production is authorised

- MATLAB-generated position/secant/tangent reference figure from Week 06 QA assets.
- Exact equation assets for the position model, forward difference, analytic derivative, absolute error, and central difference.
- Exact MATLAB code excerpt from the Week 06 lecture demonstration.
- Deterministic step-size table using the locked values in the content manifest.

No slide images, prompt jobs, or PowerPoint files are created at this stage.
