# Root finding, step by step

English-language, dependency-free PHY4605 teaching demonstrations. Open `index.html` for bisection or `newton.html` for Newton’s method. The method navigation connects both views. No installation or build is needed.

Use the iteration slider or number spinner to jump between iterations. The stage buttons and Back/Next controls show bracket validation, midpoint evaluation, and interval selection. Follow interval zooms the residual graph; disable it to preserve the original viewing range.

Newton’s method shows evaluation, the local tangent, and its zero-axis crossing as the next estimate. The filled circle marks the current curve point; the diamond marks the tangent’s zero; the open circle evaluates the original curve at the next estimate. Newton starts at 25 degrees for the projectile model and 1 for the square-root example. The analytic projectile derivative includes the degrees-to-radians factor, so its slope is in metres per degree. The same residual tolerances are used in both methods. The final Newton state validates the current estimate without another update. A finite-derivative guard and iteration cap prevent unbounded iteration; convergence is not guaranteed in general.

Examples: the Week 05 projectile model (20 m/s, 35 m target, g = 9.81 m/s², bracket 20–40 degrees, residual tolerance 0.001 m), and x² − 2 on [1, 2] with residual tolerance 0.0001. The final iteration stops before another interval update. The width display counts only completed interval halvings.

Hosted from this repository's dedicated `gh-pages` branch, with GitHub Pages using the branch root. This branch contains website files only; course materials on `main` are independent.

## Visualization design

Analytical job: explain an iterative numerical algorithm using one residual-versus-input Cartesian plot. The SVG renderer owns sampled curve geometry, scales, endpoint and midpoint marks, interval annotations, and responsive labels. Neutral axes provide context; green identifies the curve and retained bracket; rust shading marks the discarded half. Shape, labels, and explanatory text preserve meaning without color.

One chart, at most 241 curve samples, and three point markers are drawn per frame. Native SVG avoids an external chart dependency for this small deterministic model. A 240 ms domain transition preserves orientation during zoom; reduced-motion uses immediate redraw. The fixed-view checkbox is an alternative to automatic zoom. Desktop and mobile use measured plot widths and fewer mobile ticks. Values and all controls are available without hovering; the decision text is announced through a polite live region.

The example, iteration, stage, and zoom setting persist locally in the browser; they are not shared in the URL. If storage is unavailable, the demonstration still works for the session. No personal data or server calls are used. With JavaScript disabled, an explicit fallback message is shown.

Each method uses its own browser storage key. The Newton SVG uses the same single-chart rendering approach, with a dashed rust tangent, explicit current/next point labels, and responsive domains containing the current and next estimates. Reduced-motion disables domain transitions. Bracket shading and width bounds are exclusive to bisection.

For development, `npm run dev` serves at port 8766 on localhost, LAN, and Tailscale interfaces. It does not start automatically. GitHub Pages serves the static files without this development server.
