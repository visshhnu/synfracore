# HTML — Revision Notes

Condensed reference for quick review. Consolidated from this guide's Overview, Intermediate, Advanced, and Troubleshooting material.

---

## Core Concept

```
HTML = structure/meaning layer. CSS = presentation. JS = behavior.
Browser parses HTML -> builds the DOM (a live in-memory tree) --
  this is what's actually rendered, and what CSS/JS operate on.
Frameworks (React/Vue) don't replace HTML -- they GENERATE it.
  A styled div is not a substitute for real semantic elements.
```

## Document Structure — Non-Negotiable Basics

```
<!DOCTYPE html> -- standards mode, not legacy quirks mode
lang="en" on <html> -- real accessibility requirement (screen
  reader pronunciation), not decoration
<meta charset="UTF-8"> -- MUST be first in <head>, within first
  1024 bytes -- missing/late causes mojibake (garbled characters)
<meta name="viewport" content="width=device-width, initial-scale=1.0">
  -- required for responsive CSS media queries to work on mobile at all
```

## Semantic Layout Elements

```
header/footer -- intro/closing content for page or a section
nav -- genuine navigation link blocks
main -- ONE per page, the actual reason the page exists
article -- standalone, syndicatable content (blog post, product card)
section -- thematic grouping, usually has its own heading
aside -- tangential content (sidebar), not core reading material
div/span -- generic wrapper, correct ONLY when no semantic element fits
```

## Forms — Common Real Bugs

```
Missing name="" attribute -> field submits NOTHING (id alone is not enough)
label for="x" / input id="x" -- must match EXACTLY, or use nested label
disabled inputs never submit; readonly inputs DO submit
Real input types (email/number/tel/url/date) get free browser
  validation + correct mobile keyboard -- don't default to type="text"
```

## Accessibility — The Real Rule

```
Native element FIRST (button, a, select) -- gets keyboard focus,
  Enter/Space activation, correct screen-reader announcement FREE
ARIA is a FALLBACK for genuine gaps, not a first choice
role="button" with no tabindex + no keydown handler = WORSE than
  a plain div (announces as interactive, remains non-functional)
alt="" (empty, not omitted) for decorative images
alt="descriptive text" for meaningful images -- never the filename
```

## Modern Elements (Reduce JS Dependency)

```
<details>/<summary> -- disclosure widget, zero JS, free keyboard support
<dialog> + .showModal() -- native modal: focus trap, Escape-to-close,
  ::backdrop, inert background -- ALL free. .show() does NOT get these.
<template> -- inert markup (not rendered/fetched) until JS clones it
customElements.define() + Shadow DOM -- native reusable components,
  framework-free, real style encapsulation (not just a naming convention)
```

## Common Failure Modes (verified from this guide's Troubleshooting)

```
Garbled characters       -> missing/late <meta charset>, or file not
                             actually saved as UTF-8
Mobile layout not responsive -> missing viewport meta tag
Form field submits nothing   -> missing name=, disabled instead of
                             readonly, or input outside the <form>
Screen reader skips a field  -> label for=/id= mismatch or no
                             structural label connection at all
Layout jumps while loading   -> <img> missing width/height attributes
```

## Security — HTML Injection / XSS

```
innerHTML = untrustedInput  -> DANGEROUS, parses argument AS markup
textContent = untrustedInput -> SAFE, never parsed as markup
If HTML must be rendered from untrusted input -- sanitize with a
  real library (DOMPurify), never a hand-rolled regex
Attribute-context injection is the same bug class -- always escape
  untrusted values inserted into attributes too
```

## Rendering Pipeline (Why Script Placement Matters)

```
Parse HTML -> DOM | Parse CSS -> CSSOM | Render Tree (DOM+CSSOM,
  visible nodes only) -> Layout (exact box sizes/positions) -> Paint
Plain <script> in <head> BLOCKS parsing entirely until fetched+run
defer -- fetch parallel, execute after parsing, in document order
  (right default for DOM-dependent app scripts)
async -- fetch parallel, execute the instant ready, unordered
  (right for independent scripts like analytics)
```

## Versioning Note

HTML5 as a living standard (WHATWG) has been stable in its core model for over a decade — semantic elements, the DOM, forms, and accessibility fundamentals in this guide are durable, not volatile. What genuinely needs periodic re-checking: browser support percentages for newer/experimental elements, exact certification pricing/format from any provider `(needs verification — recheck against current source)`, and any experimental API still actively in flux across browsers.
