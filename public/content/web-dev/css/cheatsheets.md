# CSS Quick Reference

## Box Model

```css
.box {
  box-sizing: border-box; /* width/height include padding + border */
  width: 200px;
  padding: 1rem;
  border: 1px solid #ccc;
  margin: 1rem;
}
```

## Common Selectors

```css
* { }                    /* universal */
p { }                    /* type */
.class { }                /* class */
#id { }                   /* ID */
[data-active] { }         /* attribute exists */
[type="checkbox"] { }     /* attribute equals */
a:hover { }                /* pseudo-class */
li:first-child { }
li:last-child { }
li:nth-child(2n) { }      /* even items */
p::first-line { }         /* pseudo-element */
input:focus-visible { }
.card:has(img) { }        /* parent selector */
:is(h1, h2, h3) { }       /* matches-any, takes highest specificity */
:where(header, footer) a { } /* matches-any, zero specificity */
.parent > .child { }      /* direct child */
.a ~ .b { }                /* general sibling */
.a + .b { }                /* adjacent sibling */
```

## Flexbox

```css
.container {
  display: flex;
  flex-direction: row;             /* row | row-reverse | column | column-reverse */
  flex-wrap: wrap;                 /* nowrap | wrap | wrap-reverse */
  justify-content: space-between;  /* flex-start | center | space-between | space-around | space-evenly */
  align-items: center;             /* stretch | flex-start | center | flex-end | baseline */
  align-content: center;           /* multi-line cross-axis spacing */
  gap: 1rem;
}

.item {
  flex: 1 1 200px;   /* grow shrink basis */
  align-self: center; /* override align-items per item */
  order: 2;            /* visual reorder without changing DOM order */
}
```

## Grid

```css
.container {
  display: grid;
  grid-template-columns: 240px 1fr;
  grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
  grid-template-rows: auto 1fr auto;
  grid-template-areas:
    "header header"
    "sidebar main"
    "footer footer";
  gap: 1rem;
  place-items: center; /* align-items + justify-items */
}

.item {
  grid-column: 1 / 3;     /* or: span 2 */
  grid-row: 2 / 4;
  grid-area: header;      /* matches a named area */
}
```

## Positioning

```css
.static  { position: static; }                       /* default, normal flow */
.relative{ position: relative; top: 4px; left: 4px; } /* offset, keeps its flow space */
.absolute{ position: absolute; top: 0; right: 0; }    /* relative to nearest positioned ancestor */
.fixed   { position: fixed; bottom: 0; }              /* relative to viewport, stays on scroll */
.sticky  { position: sticky; top: 0; }                /* relative until scroll threshold, then fixed-like */
```

## Responsive Units

```css
rem   /* relative to root font-size — doesn't compound */
em    /* relative to element's own font-size — compounds through nesting */
%     /* relative to parent dimension */
vw/vh /* relative to viewport width/height */
fr    /* Grid only — fraction of remaining space */
```

## Media Queries

```css
@media (min-width: 768px) { }              /* mobile-first — layer up */
@media (max-width: 767px) { }              /* desktop-first — layer down */
@media (prefers-reduced-motion: reduce) { }
@media (prefers-color-scheme: dark) { }
@media print { }
```

## Custom Properties

```css
:root {
  --brand: #2563eb;
}

.el {
  color: var(--brand);
  color: var(--missing, #999); /* with fallback */
}
```

## Transitions & Animations

```css
.el {
  transition: transform 0.2s ease, opacity 0.2s ease; /* prefer transform/opacity — cheap to animate */
}

@keyframes pulse {
  0%, 100% { opacity: 1; }
  50%      { opacity: 0.4; }
}

.el {
  animation: pulse 1.2s ease-in-out infinite;
}
```

## Modern Features

```css
/* Container queries */
.container { container-type: inline-size; }
@container (min-width: 400px) { .item { display: grid; } }

/* Cascade layers */
@layer reset, base, components, utilities;
@layer base { body { line-height: 1.5; } }

/* :has() — parent/conditional selector */
.field:has(input:invalid) { border-color: red; }
```
