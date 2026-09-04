#!/usr/bin/env python3
"""Build the 17-slide Week 07 cart-context revision without regenerating existing slides."""

from __future__ import annotations

import json
import re
import shutil
from pathlib import Path


ROOT = Path(__file__).resolve().parents[5]
SOURCE = ROOT / "Week07/.agent/lecture-slides/codex-ppt"
TARGET = ROOT / "Week07/.agent/lecture-slides/codex-ppt-cart-context"

OLD_TO_NEW = {
    1: 1,
    2: 3,
    3: 4,
    4: 6,
    5: 7,
    6: 8,
    7: 9,
    8: 10,
    9: 11,
    10: 12,
    11: 13,
    12: 15,
    13: 16,
    14: 17,
}


NEW_SLIDES = {
    2: {
        "number": 2,
        "title": "A Cart Driven by a Fading Thrust",
        "role": "concrete physical setup",
        "intent": "Anchor numerical integration in a low-friction cart driven by compressed air whose thrust decreases as its reservoir empties.",
        "key_points": [
            "A compressed-air reservoir drives a cart along a low-friction track.",
            "As the reservoir empties, its pressure and thrust decrease.",
            "A force sensor records F(t) during the 2.0 s push.",
            "The area under the measured force-time curve gives the cart's impulse."
        ],
        "local_context": "Use a clean side-view teaching schematic: compressed-air cart on a horizontal low-friction track, rear reservoir/nozzle, forward thrust arrow, force sensor or data-acquisition readout, and a small decaying F(t) trace. Treat the cart mass as constant and neglect drag during the short interval. Do not imply a rocket with changing mass.",
        "layout": {
            "composition": "large apparatus schematic across the left two-thirds with a compact physical-story panel on the right",
            "variation": "concrete apparatus context"
        },
        "visual_elements": {
            "main_visual": "side-view compressed-air cart, reservoir, nozzle, low-friction track, thrust arrow, and force sensor",
            "supporting_elements": "small decaying force trace and concise pressure-to-thrust explanation"
        },
        "required_images": [],
        "constraints": [
            "Keep the title left-aligned with the standard navy separator.",
            "Use warm orange/yellow for the reservoir and pressure cue, coral/red for the thrust arrow, and blue for the force-sensor trace.",
            "Show a cart on a track, not a flying rocket.",
            "Do not add a numerical speed result yet.",
            "No logo, watermark, slide number, or outer frame."
        ]
    },
    5: {
        "number": 5,
        "title": "From Reservoir Pressure to Momentum",
        "role": "physical process chain",
        "intent": "Connect the concrete apparatus to the numerical-integration reasoning chain.",
        "key_points": [
            "Reservoir empties -> pressure falls -> thrust decreases.",
            "Force sensor samples the changing thrust.",
            "Each trapezoid adds a small impulse Delta J.",
            "Total impulse changes the cart's momentum: J = Delta p."
        ],
        "local_context": "Use one continuous process chain: compressed-air reservoir empties, pressure falls, force curve decays, samples define trapezoids, trapezoid areas accumulate, cart momentum increases. Preserve F(t)=12 exp(-t/0.8) N and J=integral_0^2 F(t) dt = Delta p. Make clear that each trapezoid is a momentum increment, not just geometric area.",
        "layout": {
            "composition": "left-to-right six-stage causal process with a compact exact equation band below",
            "variation": "causal process map"
        },
        "visual_elements": {
            "main_visual": "reservoir -> pressure -> thrust -> sensor samples -> trapezoids -> momentum",
            "supporting_elements": "exact force model and impulse-momentum equation"
        },
        "required_images": [],
        "constraints": [
            "Keep the title left-aligned with the standard navy separator.",
            "Use warm yellow/orange for reservoir and pressure, coral for thrust, blue for samples, and teal/green only for accumulated momentum.",
            "Preserve F(t)=12 exp(-t/0.8) N, 0 <= t <= 2.0 s, and J = Delta p.",
            "No logo, watermark, slide number, or outer frame."
        ]
    },
    14: {
        "number": 14,
        "title": "Impulse Predicts the Cart's Final Speed",
        "role": "physical payoff",
        "intent": "Turn the validated impulse into an observable final-speed prediction for a constant-mass cart.",
        "key_points": [
            "Assume a 2.0 kg cart starts from rest on a low-friction track.",
            "J = Delta p = m Delta v.",
            "Delta v = 8.8119840132 / 2.0 = 4.4059920066 m/s.",
            "Predicted final speed: approximately 4.41 m/s."
        ],
        "local_context": "Use the analytic reference impulse J=8.8119840132 N s. Assumptions: cart mass remains 2.0 kg, initial speed is 0 m/s, and drag/rolling resistance are neglected over the 2.0 s interval. Show a before/after cart with an impulse arrow and the exact calculation. Make clear that this speed prediction is the physical payoff of the numerical integral.",
        "layout": {
            "composition": "before-and-after cart visual on the left, exact impulse-momentum calculation on the right, assumptions strip along the bottom",
            "variation": "physical result and assumptions"
        },
        "visual_elements": {
            "main_visual": "stationary cart before the push and moving cart after the push",
            "supporting_elements": "J = m Delta v calculation, 4.41 m/s result, and three assumptions"
        },
        "required_images": [],
        "constraints": [
            "Keep the title left-aligned with the standard navy separator.",
            "Use yellow/ochre for the impulse calculation, coral/orange for the motion arrow, and blue for structural labels.",
            "Preserve 2.0 kg, 8.8119840132 N s, 4.4059920066 m/s, and approximately 4.41 m/s exactly.",
            "State constant mass, starts from rest, and negligible resistance.",
            "No logo, watermark, slide number, or outer frame."
        ]
    },
}


OUTLINE_INSERTS = {
    2: """### Slide 02 - A Cart Driven by a Fading Thrust

- Concrete setup: a compressed-air reservoir drives a `2.0 kg` cart along a low-friction track.
- As the reservoir empties, pressure and thrust decrease.
- A force sensor records `F(t)` over the `2.0 s` push.
- The area under the measured force-time curve is the cart's impulse.
- Visual: side-view cart, reservoir/nozzle, thrust arrow, force sensor, and a small decaying-force trace.
""",
    5: """### Slide 05 - From Reservoir Pressure to Momentum

- Reservoir empties -> pressure falls -> thrust decreases.
- Force sensor samples the changing thrust.
- Each trapezoid adds a small momentum increment `Delta J`.
- The accumulated impulse changes the cart's momentum: `J = Delta p`.
- Visual: one causal process chain from reservoir to momentum.
""",
    14: """### Slide 14 - Impulse Predicts the Cart's Final Speed

- Assume a `2.0 kg` cart starts from rest on a low-friction track.
- `J = Delta p = m Delta v`.
- `Delta v = 8.8119840132 / 2.0 = 4.4059920066 m/s`.
- Predicted final speed: approximately `4.41 m/s`.
- State the constant-mass and negligible-resistance assumptions.
""",
}


SPEECH_INSERTS = {
    2: """## Slide 2: A Cart Driven by a Fading Thrust

To make the model concrete, imagine a small cart on a low-friction track driven by compressed air. As the reservoir empties, its pressure drops, so the forward thrust becomes weaker during the two-second push. A force sensor records that changing thrust as a function of time.

The area under the measured force-time curve is the impulse delivered to the cart. This gives us a physical experiment to keep in mind throughout the chapter: we are not integrating an abstract curve; we are estimating how much the cart's momentum changes.
""",
    5: """## Slide 5: From Reservoir Pressure to Momentum

This process chain connects the apparatus to the computation. The reservoir empties, pressure falls, and thrust decreases. The force sensor samples that changing thrust, and adjacent samples define the trapezoids used by the numerical method.

Each trapezoid represents a small impulse added during one time interval. Summing the trapezoids therefore estimates the total momentum change, because impulse equals delta p. The numerical integration steps now have a direct physical meaning.
""",
    14: """## Slide 14: Impulse Predicts the Cart's Final Speed

Now we can turn the validated impulse into an observable prediction. Suppose the cart has a constant mass of two kilograms, begins from rest, and experiences negligible resistance over the two-second interval. Impulse equals the change in momentum, so delta v is the impulse divided by the mass.

Using the analytic reference impulse gives a speed increase of about four point four one metres per second. This is the physical payoff of the integral: the accumulated area predicts how fast the cart will be moving after the fading thrust has acted.
""",
}


def build_spec() -> None:
    spec = json.loads((SOURCE / "deck_spec.json").read_text(encoding="utf-8"))
    by_old = {int(slide["number"]): slide for slide in spec["slides"]}
    slides = []
    for new_number in range(1, 18):
        if new_number in NEW_SLIDES:
            slides.append(NEW_SLIDES[new_number])
            continue
        old_number = next(old for old, new in OLD_TO_NEW.items() if new == new_number)
        slide = dict(by_old[old_number])
        slide["number"] = new_number
        slide["approved_sample"] = True
        slide.pop("sample_approved", None)
        slides.append(slide)

    spec["deck_name"] = "Lecture_Slides_Week07_Cart_Context"
    spec["goal"] += " The deck now uses a compressed-air cart on a low-friction track as the concrete physical narrative and converts the validated impulse into a final-speed prediction."
    spec["deck_context"]["concrete_phenomenon"] = (
        "A 2.0 kg constant-mass cart starts from rest on a low-friction track. "
        "An emptying compressed-air reservoir produces the locked decaying thrust. "
        "A force sensor samples the thrust; trapezoids accumulate impulse; J = Delta p = m Delta v; "
        "using J_exact = 8.8119840132 N s gives Delta v = 4.4059920066 m/s, approximately 4.41 m/s."
    )
    spec["sample_generation_method"]["approved_sample_path"] = "origin_image/slide_08.png"
    spec["approved_style_reference"] = {
        "path": str((TARGET / "origin_image/slide_08.png").resolve()),
        "role": "approved Week 07 Teaching Courseware sample, renumbered from the original Slide 06",
        "fidelity": "match title alignment, horizontal separator, palette family, typography, spacing, and panel treatment; vary layout by slide role"
    }
    spec["slides"] = slides
    (TARGET / "deck_spec.json").write_text(json.dumps(spec, indent=2) + "\n", encoding="utf-8")


def build_images() -> None:
    origin = TARGET / "origin_image"
    origin.mkdir(parents=True, exist_ok=True)
    for old_number, new_number in OLD_TO_NEW.items():
        shutil.copy2(
            SOURCE / f"origin_image/slide_{old_number:02d}.png",
            origin / f"slide_{new_number:02d}.png",
        )


def build_outline() -> None:
    text = (SOURCE / "outline.md").read_text(encoding="utf-8")
    blocks = re.split(r"(?=^### Slide \d{2} - )", text, flags=re.MULTILINE)
    preamble = blocks[0]
    old_blocks = {}
    for block in blocks[1:]:
        match = re.match(r"### Slide (\d{2}) - ", block)
        if match:
            old_blocks[int(match.group(1))] = block
    result = [preamble.replace("**Deck size:** 14 slides", "**Deck size:** 17 slides")]
    for new_number in range(1, 18):
        if new_number in OUTLINE_INSERTS:
            result.append(OUTLINE_INSERTS[new_number] + "\n")
            continue
        old_number = next(old for old, new in OLD_TO_NEW.items() if new == new_number)
        block = old_blocks[old_number]
        block = re.sub(r"^### Slide \d{2} - ", f"### Slide {new_number:02d} - ", block, count=1)
        result.append(block)
    (TARGET / "outline.md").write_text("".join(result), encoding="utf-8")


def build_speech() -> None:
    text = (SOURCE / "speech.md").read_text(encoding="utf-8")
    blocks = re.split(r"(?=^## Slide \d+: )", text, flags=re.MULTILINE)
    preamble = blocks[0]
    old_blocks = {}
    for block in blocks[1:]:
        match = re.match(r"## Slide (\d+): ", block)
        if match:
            old_blocks[int(match.group(1))] = block
    result = [preamble]
    for new_number in range(1, 18):
        if new_number in SPEECH_INSERTS:
            result.append(SPEECH_INSERTS[new_number] + "\n")
            continue
        old_number = next(old for old, new in OLD_TO_NEW.items() if new == new_number)
        block = old_blocks[old_number]
        block = re.sub(r"^## Slide \d+: ", f"## Slide {new_number}: ", block, count=1)
        result.append(block)
    (TARGET / "speech.md").write_text("".join(result), encoding="utf-8")


def main() -> None:
    TARGET.mkdir(parents=True, exist_ok=True)
    build_images()
    build_spec()
    build_outline()
    build_speech()
    print(TARGET)


if __name__ == "__main__":
    main()
