# CSS — Revision Notes

Condensed reference for quick review. Consolidated from this guide's Overview, Intermediate, Advanced, and Troubleshooting material.

---

## Core Concept

```
CSS = presentation layer on top of HTML's structure — separation of
  content (HTML) and presentation (CSS) is the actual design principle,
  not just convention.
Selector + declaration block = a rule. The CASCADE is the real
  conflict-resolution algorithm: origin -> specificity -> source order.
Utility frameworks (Tailwind etc.) are still CSS underneath — same
  cascade, same box model, same mechanics, just generated classes.
```

## Box Model

```
content -> padding -> border -> margin (inside out)
box-sizing: border-box -- width/height include padding+border
  (near-universal production default, set globally with *, *::before, *::after)
```

## Specificity (highest to lowest)

```
inline style > ID (#id) > class/attribute/pseudo-class (.class, [attr], :hover)
  > type (div, p) > universal (*)
!important overrides normal specificity entirely -- escape hatch, not habit
Tie in specificity -> later source order wins
```

## Flexbox vs Grid

```
Flexbox -- ONE-dimensional (row OR column). justify-content = main axis,
  align-items = cross axis. Best for distributing/aligning along one axis.
Grid -- TWO-dimensional (rows AND columns together). fr = fraction of
  remaining space. Best for page-level structure.
Production pattern: Grid for outer structure, Flexbox nested inside
  for alignment -- not an either/or choice.
```

## Responsive Design

```
Mobile-first: base styles = smallest case, layer UP with min-width
  (preferred over desktop-first max-width layering DOWN)
rem -- relative to ROOT font-size, doesn't compound (safer default)
em -- relative to OWN font-size, compounds through nesting
repeat(auto-fit, minmax(240px, 1fr)) -- responsive grid, ZERO media queries
```

## Custom Properties vs Sass Variables

```
CSS custom properties (--var) -- REAL runtime values, cascade, can be
  read/written from JS, resolve live
Sass variables ($var) -- compile-time ONLY, substituted once, don't
  exist in shipped CSS at all
-> custom properties are the right tool for theme toggles / anything
  JS needs to touch at runtime
```

## Performance

```
Animate transform/opacity -- cheap, often compositor-only, no layout
  recalculation per frame
Animate width/height/top/left/margin -- expensive, forces layout
  recalc every frame -- visible jank on lower-end devices
will-change -- hint BEFORE animation starts, remove after -- overuse
  reserves resources for non-animating elements, hurts perf
content-visibility: auto -- skips render work for off-screen content
  (long feeds/pages)
CLS root cause -- almost always missing width/height/aspect-ratio on
  async-loading content (images, embeds, late-injected banners)
```

## Common Failure Modes (verified from this guide's Troubleshooting)

```
Margin appears to "escape" parent -> margin collapse -- fix with
  padding/border on parent, or overflow:hidden / display:flow-root, or gap
z-index not working -> ancestor already trapped in a lower stacking
  context (opacity<1, transform, filter all create new stacking contexts)
Flex item won't shrink -> implicit min-width:auto floor -- fix with
  min-width: 0 on the item
Style won't apply despite correct selector -> a higher-specificity or
  later-source rule is winning -- check Styles panel, don't guess
Layout shift on load -> missing explicit width/height/aspect-ratio on
  async content
```

## Modern Architecture

```
@layer -- explicit priority BANDS, later layer always beats earlier
  regardless of individual selector specificity -- fixes specificity
  wars with third-party CSS cleanly, without !important escalation
BEM -- flat selectors, specificity never compounds, naming discipline
  required
Utility-first (Tailwind) -- styling co-located with markup, verbose
  HTML, no new class names to invent -- real tradeoff, not objectively
  better or worse than component-first
```

## Modern Selectors

```
:is(a, b, c) -- matches any, takes HIGHEST specificity of its arguments
:where(a, b, c) -- matches any, ALWAYS zero specificity -- good for
  resets meant to be trivially overridable
:has(...) -- the "parent selector" -- select based on descendants,
  finally closes a long-standing real gap
```

## Versioning Note

Container queries and `:has()` support percentages, and any specific browser-version support claim `(needs verification — recheck against current source)` — these move over time; check caniuse.com before citing a specific number. The box model, cascade/specificity, Flexbox, and Grid fundamentals covered above are stable, durable fact and safe to treat as such.
