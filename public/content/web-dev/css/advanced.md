# CSS & Modern Layout — Advanced

## Performance: Critical CSS, Containment, and `will-change`

**Critical CSS** is the minimal set of styles needed to render above-the-fold content, inlined directly in `<head>` so the browser doesn't have to wait for an external stylesheet round-trip before painting anything — the rest of the stylesheet loads async and applies once available. This directly targets **First Contentful Paint (FCP)** and **Largest Contentful Paint (LCP)**, both real Core Web Vitals.

```css
/* CSS Containment — tells the browser a subtree's internals won't affect
   layout/paint outside its own boundary, letting it skip recalculating
   the rest of the page when only this subtree changes */
.independent-widget {
  contain: layout style paint;
}

/* content-visibility — skips rendering work entirely for off-screen content,
   a genuinely large win for long pages (a feed, a long article) */
.below-fold-section {
  content-visibility: auto;
  contain-intrinsic-size: 0 500px; /* estimated size, prevents scrollbar jump */
}
```

```css
/* will-change — a hint to the browser to prepare an optimization (like its
   own compositor layer) BEFORE an animation starts, not during it */
.card {
  will-change: transform;
}
```

`will-change` is easy to overuse — applying it broadly (or leaving it on permanently rather than toggling it on shortly before an animation and removing it after) forces the browser to keep expensive resources reserved for elements that aren't actually animating, which can hurt performance rather than help it. The honest guidance: use it narrowly, right before a known animation, not as a blanket "make it faster" rule.

## CSS Architecture at Scale

**BEM** (Block__Element--Modifier) is a naming convention that keeps specificity flat and predictable at scale by avoiding nested selectors entirely:

```css
/* BEM — every class is a single flat selector, specificity never compounds */
.card { }
.card__title { }
.card__title--large { }
.card--featured { }
```

```html
<div class="card card--featured">
  <h2 class="card__title card__title--large">Title</h2>
</div>
```

The genuine tradeoff between utility-first (Tailwind-style) and component-first (BEM/CSS Modules-style) architecture: utility-first keeps styling co-located with markup and avoids ever inventing new class names, at the cost of verbose HTML and a real learning curve reading someone else's utility soup; component-first keeps HTML clean and readable, at the cost of needing actual naming discipline and a separate stylesheet to maintain. Neither is objectively correct — the decision is a real tradeoff based on team size, design-system maturity, and how much the team values "everything visible in the markup" versus "clean semantic HTML."

## Cascade Layers (`@layer`)

`@layer` lets a codebase define explicit priority *bands* that override normal specificity/source-order rules — a layer declared earlier always loses to one declared later, regardless of the specificity of individual selectors inside them:

```css
@layer reset, base, components, utilities;

@layer reset {
  * { margin: 0; padding: 0; box-sizing: border-box; }
}

@layer components {
  .button { padding: 0.5rem 1rem; background: blue; }
}

@layer utilities {
  .bg-red { background: red !important; }
}
```

This solves a genuinely common production problem: a component library's CSS and a project's own override CSS fighting via specificity wars, where the only working fix used to be piling on `!important` or ever-more-specific selectors. With layers, the *layer order* decides the winner cleanly — `utilities` beats `components` beats `base` beats `reset`, deliberately, by design, rather than by accident of selector complexity.

## Container Queries

Media queries respond to the *viewport*; container queries respond to a specific *container's* own size — the actual missing piece for building genuinely reusable components that adapt based on where they're placed, not just how wide the whole page is:

```css
.card-container {
  container-type: inline-size;
  container-name: card;
}

@container card (min-width: 400px) {
  .card {
    display: grid;
    grid-template-columns: 120px 1fr;
  }
}
```

A card component dropped into a wide main content area and a narrow sidebar can now genuinely adapt its own internal layout per placement, without a media query caring about the whole page's width — which was never actually what the component needed to know. `(needs verification — check current caniuse.com support percentage before citing a specific figure; broad support across major browsers is now real but the exact number moves)`.

## `:has()` — the "Parent Selector"

CSS had no way to select an element based on its *descendants* until `:has()` — a real, long-standing gap finally closed:

```css
/* Style a form field's container differently if it contains an invalid input */
.field:has(input:invalid) {
  border-color: red;
}

/* Style a card differently if it contains an image */
.card:has(img) {
  grid-template-columns: 120px 1fr;
}

/* A genuinely useful sibling-combinator use: style a label based on
   the checkbox state right after it */
.checkbox-row:has(input:checked) {
  background: #eff6ff;
}
```

`(needs verification — check current caniuse.com support percentage before citing a specific figure)` — support across major browsers is now real and current, but this is exactly the category of claim that goes stale fastest, so verify before repeating a specific number in an interview or documentation.

## Modern Selectors: `:is()` and `:where()`

```css
/* Without :is() — three full selectors repeated */
header a:hover, main a:hover, footer a:hover { color: blue; }

/* With :is() — one selector, same effect */
:is(header, main, footer) a:hover { color: blue; }

/* :where() is functionally identical but always contributes ZERO
   specificity — genuinely useful for reset/utility styles that should
   be trivially overridable by anything more specific */
:where(header, main, footer) a { text-decoration: none; }
```

`:is()` takes on the specificity of its most specific argument; `:where()` always has zero specificity regardless of its arguments — a deliberate, useful distinction when writing base/reset styles that are meant to be easy to override later.
