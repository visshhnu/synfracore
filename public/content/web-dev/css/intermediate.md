# CSS & Modern Layout — Intermediate

## Responsive Design & Mobile-First Media Queries

A **media query** applies a block of CSS conditionally, based on the viewport (or device) matching certain conditions — most commonly a minimum or maximum width. The mobile-first approach writes base styles for the smallest/simplest case first, then layers `min-width` queries upward to add complexity as the viewport grows:

```css
/* Base styles = mobile, no media query needed */
.card-grid {
  display: grid;
  grid-template-columns: 1fr;
  gap: 1rem;
}

/* Tablet and up */
@media (min-width: 768px) {
  .card-grid {
    grid-template-columns: repeat(2, 1fr);
  }
}

/* Desktop and up */
@media (min-width: 1024px) {
  .card-grid {
    grid-template-columns: repeat(3, 1fr);
  }
}
```

Mobile-first (`min-width`, layering up) is generally preferred over desktop-first (`max-width`, layering down) because the base case — no media query matched — is the most constrained, simplest layout, which also happens to be the right default for the widest range of real devices and slow connections. A desktop-first stylesheet ships its heaviest, most complex layout as the unconditional default, then overrides it downward for mobile — backwards from how most real traffic actually breaks down today.

```flow
{
  "layout": "flow",
  "steps": [
    { "label": "Base styles", "sublabel": "No media query — smallest/simplest case", "color": "slate" },
    { "label": "min-width: 768px", "sublabel": "Tablet layer added", "color": "blue" },
    { "label": "min-width: 1024px", "sublabel": "Desktop layer added", "color": "purple" }
  ]
}
```

## Responsive Units

```css
.hero {
  padding: 2rem;        /* relative to ROOT font-size — predictable, doesn't compound */
  font-size: 1.125rem;
  max-width: 90vw;       /* 90% of viewport width */
  min-height: 60vh;      /* 60% of viewport height */
}

.card {
  width: 100%;           /* relative to parent's content box */
  padding: 1em;           /* relative to THIS element's own font-size — compounds through nesting */
}
```

`rem` is the safer default for spacing and typography specifically because it's anchored to the root element's font-size regardless of nesting depth — an `em` value compounds with every nested element that also sets its own font-size, which is exactly the mechanism behind a confusing class of "why is this padding bigger than I set it to be" bugs.

## CSS Custom Properties (Variables)

Custom properties are real, runtime CSS values — the browser resolves them live, they cascade and inherit like any other property, and they can be overridden at any level of specificity, including inside a media query or a pseudo-class:

```css
:root {
  --brand-color: #2563eb;
  --spacing-unit: 1rem;
  --radius: 8px;
}

.button {
  background: var(--brand-color);
  padding: var(--spacing-unit);
  border-radius: var(--radius);
}

/* Override scoped to dark mode, without touching the .button rule itself */
[data-theme="dark"] {
  --brand-color: #60a5fa;
}

/* Fallback value if the variable isn't defined */
.badge {
  color: var(--badge-color, #999);
}
```

This is fundamentally different from a Sass variable, which is substituted once at compile time and doesn't exist at all in the shipped CSS — a custom property is a genuine runtime value, which is exactly why it's the right tool for a theme toggle or anything JavaScript needs to read or write (`element.style.setProperty('--brand-color', '#f00')`).

## Transitions & Animations

**Transitions** animate a property's change between two states (usually triggered by a state change like `:hover` or a class toggle):

```css
.button {
  background: #2563eb;
  transition: background 0.2s ease, transform 0.2s ease;
}

.button:hover {
  background: #1d4ed8;
  transform: translateY(-2px);
}
```

**Animations** (`@keyframes`) define multi-step motion independent of a state trigger, useful for anything looping or with more than two states:

```css
@keyframes pulse {
  0%   { opacity: 1; }
  50%  { opacity: 0.4; }
  100% { opacity: 1; }
}

.loading-dot {
  animation: pulse 1.2s ease-in-out infinite;
}
```

A real performance rule worth internalizing early: animating `transform` and `opacity` is cheap (the browser can often handle it on the compositor thread, without re-running layout), while animating `width`, `height`, `top`/`left`, or `margin` forces layout recalculation on every frame — genuinely visible as jank on lower-end devices. Prefer `transform: translateX(...)` over animating `left` for exactly this reason.

## Media Query Best Practices

```css
/* Respect a user's reduced-motion preference — a real accessibility requirement,
   not an optional nicety */
@media (prefers-reduced-motion: reduce) {
  * {
    animation-duration: 0.01ms !important;
    transition-duration: 0.01ms !important;
  }
}

/* Print-specific styles — genuinely still relevant for invoices, tickets, receipts */
@media print {
  .no-print { display: none; }
}
```

**Try it:** add `@media (prefers-reduced-motion: reduce)` to a page with a CSS animation, then toggle "Reduce motion" in your OS accessibility settings and reload — confirm the animation actually stops. This is a real, testable accessibility requirement, not a theoretical one.
