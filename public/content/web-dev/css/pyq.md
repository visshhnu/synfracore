# CSS — PYQ (Previously Asked / Practice Questions)

**Framing note:** CSS has no single proctored certification with a public past-paper archive the way some domains do — freeCodeCamp's Responsive Web Design certification is project-based, not question-bank-based, and W3Schools' exam questions aren't publicly archived either. What follows is built from this guide's own Overview/Intermediate/Advanced/Troubleshooting material, framed as practice questions grounded in real, documented CSS behavior rather than invented "leaked" content.

---

### 1. (Domain: Box Model) A `<div>` is given `width: 200px; padding: 20px; border: 4px solid black;` with default `box-sizing`. What is its actual rendered width, and why?

**Answer:** 248px — `width` under the default `box-sizing: content-box` measures the content area only; padding (20px × 2 sides = 40px) and border (4px × 2 sides = 8px) are added on top of the declared width, not included in it. Setting `box-sizing: border-box` would make the declared `width: 200px` the actual final rendered width instead, with content shrinking internally to accommodate padding and border.

---

### 2. (Domain: Cascade & Specificity) Given `#nav a { color: blue; }` and `.link { color: red; }` on the same `<a class="link">` inside `<nav id="nav">`, which color wins, and why?

**Answer:** Blue — an ID selector (`#nav`) contributes more to specificity than a class selector (`.link`), regardless of which rule appears later in the source. Specificity is compared component by component (ID count first, then class/attribute/pseudo-class count), not by total selector complexity or source order, which only acts as a tiebreaker when specificity is exactly equal.

---

### 3. (Domain: Flexbox) A flex container has three items with `flex: 1 1 auto`, but one item — containing a long, unbroken string — refuses to shrink below its content width, causing overflow. What's the fix?

**Answer:** Add `min-width: 0` to that item. Flex items have an implicit `min-width: auto` by default, which sets a floor based on the item's own content size — this floor silently overrides `flex-shrink` regardless of its value. Setting `min-width: 0` removes that implicit floor and lets the item actually shrink, typically paired with `overflow: hidden` and `text-overflow: ellipsis` for the long text itself.

---

### 4. (Domain: Grid) What does `grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));` actually do, and why does it need no media query to be responsive?

**Answer:** It tells the grid to fit as many columns as possible, each never narrower than 240px, with any remaining space distributed fractionally (`1fr`) among them — as the container narrows, columns that no longer fit at 240px collapse into fewer columns automatically, and as it widens, more columns fit. The responsiveness comes from the browser recalculating how many 240px-minimum tracks fit at the current width on every layout pass, not from any breakpoint-based rule.

---

### 5. (Domain: Positioning) An element has `position: absolute; top: 0; right: 0;` but instead of anchoring to its intended parent card, it jumps to the corner of the entire page. What's the missing piece?

**Answer:** The intended parent needs `position: relative` (or any non-static position) set on it — `absolute` positions relative to the nearest ancestor with a non-static `position`; if none exists up the ancestor chain, it falls back to the page's initial containing block. Adding `position: relative` to the intended parent (with no other visible effect on that parent's own layout) gives the absolutely-positioned child the correct reference point.

---

### 6. (Domain: Responsive Units) Why does a deeply nested element's padding sometimes end up much larger than the single `em` value set on it?

**Answer:** `em` is relative to the current element's own font-size, and compounds through nesting — if several ancestors each set their own font-size in `em` relative to their parent, the effective font-size (and therefore the `em`-based padding derived from it) multiplies at each level. `rem`, relative only to the root element's font-size regardless of nesting depth, avoids this compounding entirely and is the generally safer default for spacing.

---

### 7. (Domain: Custom Properties) Why can't a Sass variable be changed at runtime by JavaScript the way a CSS custom property can?

**Answer:** A Sass variable is resolved entirely at compile time — the build step substitutes its value directly into the output CSS and the variable itself doesn't exist anymore once compiled. A CSS custom property is a genuine runtime value the browser keeps and resolves live, which is exactly why `element.style.setProperty('--brand-color', '#f00')` works from JavaScript and has an immediate visual effect, while there's no equivalent operation possible for a Sass variable after compilation.

---

### 8. (Domain: Performance / CLS) An image loads asynchronously without a `width`/`height` attribute, causing the text below it to jump down once it loads. What's the direct fix and why does it work?

**Answer:** Set explicit `width`/`height` attributes (or CSS `aspect-ratio`) on the `<img>` tag. This lets the browser calculate and reserve the image's final rendered space before the image data has actually arrived, so surrounding content doesn't need to reflow once it loads — without those dimensions, the browser has no way to know how much vertical space to reserve up front.

---

### 9. (Domain: Stacking Context) An element has `z-index: 9999` but still renders behind a sibling section with `z-index: 1`. Both are `position: relative`. What else could explain this?

**Answer:** An ancestor of the `z-index: 9999` element likely has its own stacking-context-triggering property set — commonly `opacity` less than 1, a `transform`, or a `filter` — which traps that whole ancestor (and everything inside it, regardless of its own `z-index`) into one stacking layer that competes as a single unit against the sibling section. The fix is finding and either removing that unintended trigger from the ancestor, or deliberately giving the ancestor itself a higher stacking priority instead of fighting it from a descendant.

---

### 10. (Domain: Modern CSS / @layer) Two stylesheets — a component library's CSS and a project's own override CSS — are fighting via increasingly specific selectors and `!important`. What's the cleaner modern fix, and how does it work?

**Answer:** Wrap each stylesheet in its own `@layer`, and declare the layer order explicitly (`@layer library, overrides;`) so the project's override layer is declared after (and therefore always wins over) the library's layer — regardless of the actual specificity of individual selectors inside either layer. This replaces an escalating specificity/`!important` war with an explicit, maintainable priority order defined once, in one place.
