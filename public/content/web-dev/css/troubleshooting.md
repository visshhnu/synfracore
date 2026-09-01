# CSS Troubleshooting Guide

## Issue 1: Margin Collapse — Unexpected Vertical Spacing

**Symptom:** A child element's `margin-top` appears to push the *parent* down instead of creating space inside it, or two adjacent elements' margins combine into a single margin instead of adding together.

**Root Cause:** Adjacent vertical margins (and a child's top margin against a parent with no separating border/padding/content) collapse into a single margin by CSS specification — this is deliberate, standard behavior, not a bug, though it rarely matches intuition on first encounter.

**Debug steps:**
```
1. DevTools -> Elements -> select the parent -> check the Box Model diagram
   at the bottom of the Styles panel for its actual rendered margin
2. Temporarily add a visible border to the parent and child to see where
   the "missing" space actually is
3. Check: does the parent have zero padding/border AND the child a
   margin-top? That combination is the classic collapse trigger.
```

**Fix patterns:**
```css
/* Option 1: give the parent non-zero padding or border */
.parent { padding-top: 1px; }

/* Option 2: establish a new block formatting context on the parent */
.parent { overflow: hidden; } /* or display: flow-root; -- cleaner, no side effects */

/* Option 3: use gap instead of margin between flex/grid siblings --
   gap never collapses */
.parent { display: flex; flex-direction: column; gap: 1rem; }
```

---

## Issue 2: `z-index` Not Working

**Symptom:** An element with a high `z-index` still renders behind another element with a lower (or no) `z-index`.

**Root Cause:** `z-index` only has effect within a stacking context, and an ancestor may already be trapped in a lower stacking context than the element it's being compared against — `opacity < 1`, `transform`, `filter`, and `position` + `z-index` on an ancestor all create new stacking contexts, which silently caps how high a descendant's `z-index` can actually reach relative to siblings outside that ancestor.

**Debug steps:**
```
1. DevTools -> Elements -> walk up the ancestor chain of the element that
   won't stack correctly
2. Check each ancestor's Computed panel for: position (non-static),
   opacity (< 1), transform (anything but none), filter, will-change
3. The first ancestor with any of those properties set IS the stacking
   context boundary -- z-index on descendants can't escape it
```

**Fix patterns:**
```css
/* Remove the unintended stacking-context trigger from the ancestor,
   if it's not actually needed there */
.ancestor { transform: none; }

/* Or move the z-index'd element outside that ancestor in the DOM */

/* Or deliberately raise the ancestor's own z-index/stacking context
   instead of fighting it from the inside */
.ancestor { position: relative; z-index: 10; }
```

---

## Issue 3: Flexbox Item Won't Shrink

**Symptom:** A flex item overflows its container or refuses to shrink below its content's natural width, even with `flex-shrink: 1` set.

**Root Cause:** Flex items have an implicit `min-width: auto` (or `min-height: auto` for `flex-direction: column`) by default, which sets a floor based on the item's content size — this floor overrides `flex-shrink` regardless of the shrink factor set.

**Debug steps:**
```
1. DevTools -> select the overflowing item -> Computed panel -> check
   min-width (often shows "auto" if not explicitly overridden)
2. Toggle the Layout panel's flex overlay on the parent to visually
   confirm which item is refusing to shrink
```

**Fix patterns:**
```css
.flex-item {
  flex: 1 1 auto;
  min-width: 0; /* the actual fix -- removes the implicit content-based floor */
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
}
```

---

## Issue 4: Specificity War — Style Won't Apply No Matter What

**Symptom:** A CSS rule is written correctly, targets the right element, but simply doesn't apply — often "fixed" by piling on more `!important` or increasingly specific selectors.

**Root Cause:** A different, higher-specificity (or later-in-source, if tied) rule is winning the cascade for that property — this is almost never actually a browser bug or a caching issue, despite how it feels.

**Debug steps:**
```
1. DevTools -> select the element -> Styles panel -> read every rule
   listed, top to bottom -- overridden declarations show struck through
2. Check what's actually winning -- its selector's specificity is
   visible directly in the panel
3. Search the codebase for any !important on that property for that
   element -- often the actual root cause, not a specificity fight at all
```

**Fix patterns:**
```css
/* Prefer matching or slightly exceeding specificity deliberately,
   not escalating with !important */
.card.card--featured { border-color: gold; } /* two classes = still low, but specific enough */

/* For a genuine third-party override that can't be edited directly,
   @layer is the clean modern fix -- author layers beat unlayered styles
   by default in most setups, and layer order gives explicit control */
@layer overrides {
  .card { border-color: gold; }
}
```

---

## Issue 5: Layout Shift (CLS) on Page Load

**Symptom:** Content visibly jumps or reflows shortly after the page appears to have loaded — most noticeable with images, ads, or web fonts.

**Root Cause:** The browser doesn't know the final size of an image (or any asynchronously-loading content) until it finishes loading, so it initially renders zero (or fallback) space and then reflows everything below once the real size is known.

**Debug steps:**
```
1. DevTools -> Performance panel -> record a page reload -> look for
   "Layout Shift" entries in the timeline
2. Lighthouse panel -> run an audit -> check the CLS score and its
   "Avoid large layout shifts" section, which names the specific elements
3. Check each flagged image/embed for a missing width/height or aspect-ratio
```

**Fix patterns:**
```css
img, video, iframe {
  aspect-ratio: attr(width) / attr(height); /* or set explicit values directly */
  width: 100%;
  height: auto;
}

/* Reserve space for content that loads late (an ad slot, a late banner) */
.ad-slot {
  min-height: 250px; /* matches the expected ad size, prevents the jump */
}
```

---

## Prevention Tips

- Set `box-sizing: border-box` globally on every project from day one — it eliminates an entire class of "my width math doesn't add up" confusion before it starts.
- Use `gap` instead of margin for spacing between flex/grid siblings — it sidesteps both margin collapse and first/last-child edge-case overrides.
- Reach for `@layer` instead of `!important` the first time a genuine specificity conflict shows up with a third-party stylesheet or component library — it's the deliberate, maintainable tool for exactly that problem.
- Always set explicit dimensions (or `aspect-ratio`) on images and embeds — this single habit prevents most real-world CLS issues before they ever ship.
- Check the DevTools Layout panel's Flexbox/Grid overlay before guessing at a layout bug — it visually shows the actual tracks/lines the browser is using, which is almost always faster than reasoning about it from the CSS alone.
