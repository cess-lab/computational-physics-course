#!/usr/bin/env python3
"""Reopen one blocked slide after an explicit lecturer workflow change."""

from pathlib import Path
import sys

from slide_run_state import find_slide, locked_jobs, now_iso, set_run_status, update_jobs_run_status


def main() -> int:
    if len(sys.argv) != 2:
        raise SystemExit("usage: reopen_slide_after_user_approval.py DECK_DIR")
    deck_dir = Path(sys.argv[1]).expanduser().resolve()
    conceptual_job = "prompts/slide_11_conceptual.json"
    conceptual_input = [
        {
            "path": str(deck_dir / "origin_image/slide_04.png"),
            "role": "approved sample slide style reference",
            "fidelity": "match palette, typography, density, texture, and visual identity only; do not copy exact layout or content",
        }
    ]
    with locked_jobs(deck_dir) as jobs:
        slide = find_slide(jobs, "slide_11")
        if slide.get("status") != "blocked":
            raise SystemExit(f"slide_11 must be blocked before reopening; got {slide.get('status')}")
        previous_blocker = slide.get("blocker")
        slide.setdefault("blocker_history", []).append(previous_blocker)
        slide["blocker"] = None
        slide["status"] = "pending"
        slide["dispatch"] = None
        slide["result"] = None
        slide["job"] = conceptual_job
        slide["input_images"] = conceptual_input
        slide["requires_context_images"] = True
        slide["reopened"] = {
            "at": now_iso(),
            "reason": "Lecturer approved replacing the strict plot with a generated conceptual evidence graphic.",
            "replacement_job": conceptual_job,
        }
        update_jobs_run_status(jobs)
        jobs["run_status"] = "jobs_prepared"
        jobs["updated_at"] = now_iso()
    set_run_status(deck_dir, "jobs_prepared", "reopened slide_11 after lecturer-approved conceptual-graphic replacement")
    print("slide_11 -> reopened as pending conceptual evidence job")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
