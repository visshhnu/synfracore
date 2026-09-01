# CSS Certification Guide

## Certifications Available

CSS, like the web platform generally, has no single dominant proctored certification the way some other domains do — there is no "CSS Certified Associate" issued by a standards body. What exists is a mix of free skill-verification badges and broader front-end certifications that include CSS as one component:

| Cert | Provider | Cost | Format |
|------|----------|------|--------|
| **Responsive Web Design Certification** | freeCodeCamp | Free | Project-based, self-paced |
| **JavaScript Algorithms and Data Structures** (includes some CSS-adjacent work) | freeCodeCamp | Free | Project-based, self-paced |
| **Front End Development Libraries** | freeCodeCamp | Free | Project-based, self-paced |
| **Meta Front-End Developer (Professional Certificate)** | Meta, via Coursera | Subscription | Video + graded assignments |
| **W3Schools CSS Certificate** | W3Schools | Paid | Timed online exam |

freeCodeCamp's **Responsive Web Design Certification** is the most genuinely useful, widely recognized free option specifically for CSS depth — it requires building real, working projects (including a full CSS Flexbox/Grid layout project) rather than only passing a multiple-choice quiz, which makes it a more credible signal of actual ability than a timed knowledge-recall exam.

*(needs verification — pricing, exact curriculum contents, and format for the Meta and W3Schools options change on the provider's side; confirm current values directly on each provider's page before treating any of the above as current)*

The more common industry reality: most front-end hiring evaluates CSS ability through a live coding exercise or a portfolio review, not a certificate — the Projects tab on this course is deliberately built with that in mind.

---

## Core Topics

```css
/* Modern reset -- a genuinely common production starting point */
*, *::before, *::after {
  box-sizing: border-box;
  margin: 0;
  padding: 0;
}

html {
  color-scheme: light dark;
}

body {
  min-height: 100vh;
  line-height: 1.5;
  -webkit-font-smoothing: antialiased;
}

img, picture, video, canvas, svg {
  display: block;
  max-width: 100%;
}
```

```css
/* Flexbox reference */
.flex-container {
  display: flex;
  flex-direction: row;       /* row | column | row-reverse | column-reverse */
  flex-wrap: wrap;           /* nowrap | wrap | wrap-reverse */
  justify-content: space-between; /* main-axis alignment */
  align-items: center;       /* cross-axis alignment */
  gap: 1rem;
}

.flex-item {
  flex: 1 1 200px; /* grow shrink basis */
  align-self: flex-start; /* override align-items for this one item */
}
```

```css
/* Grid reference */
.grid-container {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
  grid-auto-rows: minmax(100px, auto);
  gap: 1rem;
  place-items: center; /* align-items + justify-items shorthand */
}

.grid-item {
  grid-column: span 2;
  grid-row: 1 / 3;
}
```

```css
/* Custom properties + a basic dark-mode toggle pattern */
:root {
  --bg: #ffffff;
  --fg: #111111;
}

[data-theme="dark"] {
  --bg: #111111;
  --fg: #f5f5f5;
}

body {
  background: var(--bg);
  color: var(--fg);
  transition: background 0.2s ease, color 0.2s ease;
}
```

## Study Resources

- **MDN Web Docs — CSS** (developer.mozilla.org) — authoritative, free, the actual reference this entire course is written against
- **freeCodeCamp — Responsive Web Design** (freecodecamp.org) — free, project-based curriculum
- **CSS-Tricks** (css-tricks.com) — deep, practical guides on specific patterns (their Flexbox and Grid guides are widely cited industry references)
- **Can I Use** (caniuse.com) — browser support tables, essential for any "is this safe to ship" question

## Revision Notes
```
BOX MODEL: content -> padding -> border -> margin | box-sizing: border-box
  makes width/height include padding+border (near-universal default)

CASCADE ORDER: origin (author > user > browser default) -> specificity
  (inline > ID > class/attr/pseudo-class > type) -> source order (tiebreak)

FLEXBOX: one-dimensional (row OR column) | justify-content = main axis,
  align-items = cross axis | flex: grow shrink basis

GRID: two-dimensional (rows AND columns) | fr = fraction of remaining space
  | repeat(auto-fit, minmax(...)) = responsive grid, zero media queries

RESPONSIVE: mobile-first (min-width, layer up) preferred over desktop-first
  (max-width, layer down) | rem doesn't compound, em does

MODERN (verify support before citing %): container queries, :has(),
  @layer -- all broadly supported now but confirm current caniuse numbers
```

## Versioning Note

CSS itself has no version number the way a language runtime does — it's a living set of modules (Flexbox, Grid, Selectors, etc.) each progressing through the standards process independently, and browser support for any given feature changes over time. Anything citing an exact browser-support percentage in this course's Advanced tab is marked `(needs verification — recheck against current source)` for exactly this reason.
