# Bisection, step by step

An English-language, dependency-free PHY4605 teaching demonstration. Open `index.html` in a browser. No installation or build is needed.

Use the iteration slider or number spinner to jump between iterations. The stage buttons and Back/Next controls show bracket validation, midpoint evaluation, and interval selection. Follow interval zooms the residual graph; disable it to preserve the original viewing range.

Examples: the Week 05 projectile model (20 m/s, 35 m target, g = 9.81 m/s², bracket 20–40 degrees, residual tolerance 0.001 m), and x² − 2 on [1, 2] with residual tolerance 0.0001. The final iteration stops before another interval update. The width display counts only completed interval halvings.

Hosted from this repository's dedicated `gh-pages` branch, with GitHub Pages using the branch root. This branch contains website files only; course materials on `main` are independent.

## Visualization design

Analytical job: explain an iterative numerical algorithm using one residual-versus-input Cartesian plot. The SVG renderer owns sampled curve geometry, scales, endpoint and midpoint marks, interval annotations, and responsive labels. Neutral axes provide context; green identifies the curve and retained bracket; rust shading marks the discarded half. Shape, labels, and explanatory text preserve meaning without color.

One chart, at most 241 curve samples, and three point markers are drawn per frame. Native SVG avoids an external chart dependency for this small deterministic model. A 240 ms domain transition preserves orientation during zoom; reduced-motion uses immediate redraw. The fixed-view checkbox is an alternative to automatic zoom. Desktop and mobile use measured plot widths and fewer mobile ticks. Values and all controls are available without hovering; the decision text is announced through a polite live region.

The example, iteration, stage, and zoom setting persist locally in the browser; they are not shared in the URL. If storage is unavailable, the demonstration still works for the session. No personal data or server calls are used. With JavaScript disabled, an explicit fallback message is shown.

For development, `npm run dev` serves at port 8766 on localhost, LAN, and Tailscale interfaces. It does not start automatically. GitHub Pages serves the static files without this development server.
