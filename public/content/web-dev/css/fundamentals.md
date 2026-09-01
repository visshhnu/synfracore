# CSS & Modern Layout — Fundamentals

## The Box Model

Every element on a page is a rectangular box, whether it looks like one or not — a heading, a paragraph, a link, all boxes. Each box is built from four layers, from the inside out: **content** (the actual text/image), **padding** (space inside the border, between border and content), **border** (a visible or invisible edge), and **margin** (space outside the border, between this box and its neighbors). Think of it like a framed photo on a wall — the photo itself is the content, the mat around it is padding, the physical frame is the border, and the gap to the next photo on the wall is the margin.

```css
.box {
  width: 200px;
  padding: 20px;
  border: 4px solid #333;
  margin: 16px;
}
/* By default, this box's TOTAL rendered width is:
   200 (content) + 40 (padding, both sides) + 8 (border, both sides) = 248px
   The width you set is NOT the width you get, unless box-sizing changes that. */
```

**`box-sizing: border-box`** changes what `width`/`height` measure — instead of measuring content only, they measure content + padding + border together, so the box above with `box-sizing: border-box` would actually render at exactly 200px wide, with content shrinking to make room for padding/border internally. This matches how most people intuitively expect sizing to work, which is why it's a near-universal production default:

```css
*, *::before, *::after {
  box-sizing: border-box;
}
```

## Selectors & Specificity

A selector answers "which elements does this rule apply to." The main kinds, roughly in increasing specificity:

```css
p { color: black; }                 /* type selector */
.highlight { color: orange; }       /* class selector */
#main-title { color: blue; }        /* ID selector */
a[target="_blank"] { color: green; } /* attribute selector */
li:first-child { font-weight: bold; } /* pseudo-class */
p::first-line { font-style: italic; } /* pseudo-element */
```

When two rules target the same element with conflicting values, the browser resolves it using **specificity** — a score computed per selector, roughly: inline styles beat everything, then count of ID selectors, then count of class/attribute/pseudo-class selectors, then count of type selectors. `#main-title` beats `.highlight` beats `p`, regardless of which one is written later in the file. Only when specificity ties exactly does source order (later wins) settle it.

```conceptgrid
{
  "boxes": [
    { "title": "Inline style", "description": "style=\"...\" on the element itself. Beats every stylesheet rule.", "color": "amber" },
    { "title": "ID selector", "description": "#header — highest specificity among stylesheet rules.", "color": "purple" },
    { "title": "Class / attribute / pseudo-class", "description": ".card, [href], :hover — middle specificity.", "color": "blue" },
    { "title": "Type selector", "description": "div, p, a — lowest specificity. Easiest to override, intentionally.", "color": "slate" }
  ]
}
```

**Try it:** open DevTools on any page, click an element, and look at the Styles panel — every applying rule is listed with its selector, and overridden declarations show with a strikethrough. That strikethrough is specificity losing in real time, made visible.

## The Cascade & Inheritance

"Cascading" names the actual algorithm: for a given property on a given element, the browser gathers every rule that could apply, then resolves the winner by **origin** (browser default styles lose to author styles, which lose to `!important` author styles), then **specificity**, then **source order**. Some properties (like `color` and `font-family`) also **inherit** from a parent element by default if not explicitly set — a `color` set on `body` cascades down through every nested element unless overridden. Layout properties like `width`, `padding`, and `border` never inherit — inheritance is deliberately limited to text-related properties, because inheriting box-model properties would make layouts unpredictable.

```css
body { color: #222; font-family: sans-serif; }
/* Every paragraph, span, and heading inherits color and font-family
   from body unless it sets its own — no need to repeat this on every element */
```

`!important` overrides the entire specificity calculation for that one declaration — genuinely useful as a rare, deliberate override (fighting an inline style from a third-party widget, for instance), but a real anti-pattern as a habit, since a stylesheet full of `!important` breaks the predictable cascade the entire language is built around.

## Flexbox

Flexbox lays out children along a single axis — a row (default) or a column — and is built for distributing and aligning items whose sizes should flex to fill available space.

```css
.nav {
  display: flex;
  justify-content: space-between; /* main axis (row, by default) */
  align-items: center;            /* cross axis */
  gap: 1rem;
}

.nav-item {
  flex: 1 1 auto; /* grow: 1, shrink: 1, basis: auto */
}
```

`justify-content` controls spacing along the main axis (the direction items flow); `align-items` controls alignment along the cross axis (perpendicular to that). `flex-grow`/`flex-shrink`/`flex-basis` (usually written as the shorthand `flex`) control how an individual item claims or gives up space relative to its siblings.

## CSS Grid

Grid is two-dimensional — rows and columns defined together — and is the right tool once a layout needs both axes controlled explicitly, rather than one axis at a time.

```css
.page {
  display: grid;
  grid-template-columns: 240px 1fr;
  grid-template-rows: auto 1fr auto;
  grid-template-areas:
    "sidebar header"
    "sidebar main"
    "sidebar footer";
  min-height: 100vh;
}

.header { grid-area: header; }
.main   { grid-area: main; }
.footer { grid-area: footer; }
.sidebar { grid-area: sidebar; }
```

`fr` is a fraction of remaining space after fixed-size tracks are subtracted — `1fr` in `240px 1fr` means "give the sidebar exactly 240px, then let the second column take up whatever's left." `grid-template-areas` names regions directly, which reads almost like an ASCII diagram of the actual layout — genuinely one of the more readable parts of the whole language.

## Positioning

`position` changes how an element is placed relative to normal document flow:

```css
.static-default { position: static; }     /* normal flow — the default */
.relative { position: relative; top: 4px; } /* offset from where it WOULD be, still takes its normal-flow space */
.absolute { position: absolute; top: 0; right: 0; } /* removed from flow, positioned relative to nearest positioned ancestor */
.fixed { position: fixed; bottom: 0; }    /* removed from flow, positioned relative to the viewport, stays on scroll */
.sticky { position: sticky; top: 0; }     /* relative until a scroll threshold, then behaves like fixed */
```

The most common `absolute` bug: it positions relative to the nearest ancestor that has any `position` other than `static` — if no ancestor has one set, it falls back to positioning relative to the whole page, which is almost never the intent. The fix is deliberately setting `position: relative` on the intended parent, giving the absolutely-positioned child a defined reference point.

**Try it:** in a scratch HTML file, give a parent `<div>` `position: relative` and a child inside it `position: absolute; top: 0; right: 0;` — then remove `position: relative` from the parent and watch the child jump to the corner of the entire page instead. That jump is the containing-block rule made visible.
