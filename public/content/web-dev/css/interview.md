# CSS — Interview Questions

**Q: What's the difference between `visibility: hidden`, `display: none`, and `opacity: 0`?**

They differ in both rendering and interaction. `display: none` removes the element entirely from layout — it takes up no space and isn't in the accessibility tree. `visibility: hidden` keeps the element's space reserved in layout but makes it invisible and non-interactive (though its children can override with `visibility: visible`). `opacity: 0` keeps the element fully in layout, fully interactive (still clickable, still focusable, still occupies its space), just visually transparent — a real, easy mistake is using `opacity: 0` to "hide" something and then discovering it still intercepts clicks meant for whatever's visually behind it.

**Q: Why does `margin-top` sometimes seem to "escape" its parent and affect the parent's position instead?**

This is margin collapsing — specifically the case where a child's `margin-top` and the parent's own top edge collapse into a single margin when there's no border, padding, or content separating them. The fix is adding `padding-top: 1px` (or any non-zero padding/border) to the parent, or `overflow: hidden` on the parent (which establishes a new block formatting context and prevents the collapse), or simply using the child's margin on the parent instead. This trips people up specifically because the CSS *looks* correct — the margin is set exactly where you'd expect, it just doesn't apply where you'd expect.

**Q: How would you center a div both horizontally and vertically?**

The modern, simplest answer is Flexbox on the parent: `display: flex; justify-content: center; align-items: center;`. Grid's `place-items: center` is equally valid and arguably even shorter. The old `position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);` trick still works and is worth knowing because it's still common in older codebases, but it's no longer the best default — it removes the element from flow, which Flexbox/Grid centering doesn't require.

**Q: What's the difference between `inline`, `block`, and `inline-block`?**

`block` elements take the full available width, start on a new line, and respect `width`/`height`/vertical `margin`. `inline` elements flow within text, only take up as much width as their content, and ignore `width`/`height` and vertical `margin` entirely (a common source of "why isn't my margin-top doing anything" on a `<span>`). `inline-block` is the middle ground — flows inline like text but respects `width`/`height` and margin like a block element, which is exactly why it used to be a common (if slightly hacky) layout tool before Flexbox existed.

**Q: What actually causes Cumulative Layout Shift (CLS), and how do you prevent it?**

CLS measures unexpected movement of visible content after it's already rendered — most commonly caused by images or embeds without explicit dimensions (the browser doesn't know how much space to reserve until the image finishes loading, so surrounding content jumps once it does), web fonts swapping in with different metrics than the fallback font, or content injected above existing content (a banner, an ad) without reserved space. The fix is almost always explicit `width`/`height` or `aspect-ratio` on media, and reserving space up front for anything that loads asynchronously.

**Q: Explain how `z-index` actually works — why doesn't a high `z-index` always win?**

`z-index` only has meaning within a stacking context, and only applies to positioned elements (`position` other than `static`). A `z-index: 9999` element can still render *below* a `z-index: 1` element if they belong to different stacking contexts — a parent with a lower `z-index` (or one with `opacity < 1`, or a `transform`, both of which create a new stacking context implicitly) can trap its children's stacking below a sibling's contents entirely, regardless of how high the trapped child's own `z-index` is set. Debugging this means checking DevTools' Layers/3D view or manually walking up the ancestor chain for anything that creates a new stacking context, not just bumping the number higher.

**Q: What's the difference between `em`, `rem`, `%`, `vw`/`vh`, and `px`?**

`px` is an absolute unit — fixed regardless of context, which is exactly why it doesn't respect a user's browser font-size preference for accessibility. `em` is relative to the current element's own font-size and compounds through nested elements that also set font-size. `rem` is relative only to the root (`html`) element's font-size, so it doesn't compound — generally the safer default for spacing/typography. `%` is relative to the parent's corresponding dimension. `vw`/`vh` are relative to the viewport's width/height — 1vw is 1% of viewport width, useful for truly viewport-relative sizing like a full-bleed hero section.

**Q: How do you debug a Flexbox item that won't shrink even though its siblings are?**

Check for a `min-width`/`min-height` that's implicitly `auto` by default on flex items — an item's content (especially unbreakable content like a long unwrapped string or a wide image) can force a minimum size that overrides `flex-shrink`, even at `flex-shrink: 1`. Explicitly setting `min-width: 0` on the item lets it actually shrink below its content's natural size, which is the fix in the large majority of cases where `flex-shrink` "isn't working."

**Q: What is a stacking context, and what creates one besides `z-index`?**

A stacking context is a self-contained layer of rendering — children are stacked relative to each other and to that context's own position, but the whole context stacks as one unit relative to siblings outside it. Besides `position` + `z-index`, a new stacking context is also created by `opacity` less than 1, any `transform`, `filter`, `will-change` naming a triggering property, and `isolation: isolate`. This matters in practice because a component library adding `transform` for an unrelated animation can silently change how that component's own internal `z-index` values interact with the rest of the page.

**Q: What's the actual difference between Flexbox's `gap` and using margins between items?**

`gap` applies spacing only *between* items — never on the outer edges of the first/last item — which is exactly the spacing behavior most layouts actually want and margin doesn't give you without extra `:first-child`/`:last-child` overrides. `gap` also doesn't participate in margin collapsing and doesn't require any nth-child logic to avoid double-spacing between items. It's the strictly better default for spacing flex/grid children today; margin-based spacing between siblings is mostly a legacy pattern from before `gap` had broad Flexbox support.
