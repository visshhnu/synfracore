# HTML Troubleshooting Guide

## Issue 1: Page renders with garbled characters (mojibake)

**Symptom:** Special characters, accented letters, or symbols display as strange boxes or nonsense characters like `Ã©` instead of `é`.

**Root Cause:** Missing or incorrect `<meta charset>` declaration, or it's placed too late in `<head>` for the browser to have used it before starting to parse the byte stream.

**Debug steps:**
```html
<!-- Check the very first lines of <head> -->
<!DOCTYPE html>
<html>
<head>
  <!-- This MUST be one of the first things inside <head>,
       within the first 1024 bytes of the document -->
  <meta charset="UTF-8">
  ...
```

**Fix patterns:**
```html
<!-- Correct: charset declared first, file actually saved as UTF-8 -->
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>...</title>
</head>
```
- Confirm the file is actually *saved* as UTF-8 in the editor, not just declared as UTF-8 in the meta tag — a mismatch between declared and actual encoding is the most common real cause
- If content is fetched dynamically from a database or API, confirm the server's `Content-Type` response header also specifies `charset=UTF-8`, since that can override the meta tag

---

## Issue 2: Mobile layout is zoomed out / not responsive at all

**Symptom:** A CSS media-query-based responsive layout works fine when resizing a desktop browser window, but on an actual phone the page renders as a tiny, zoomed-out desktop layout.

**Root Cause:** Missing viewport meta tag — without it, mobile browsers assume the page was built for a ~980px desktop viewport and scale the whole thing down to fit, rather than rendering at the device's actual width.

**Debug steps:**
```html
<!-- Check <head> for this exact line -->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
```
```bash
# Test with actual browser DevTools device emulation
# Chrome DevTools: Toggle device toolbar (Ctrl+Shift+M) -> select a real device
```

**Fix patterns:**
```html
<meta name="viewport" content="width=device-width, initial-scale=1.0">
```
- This single line is required for CSS media queries like `@media (max-width: 600px)` to have any real effect on mobile — without it, the browser's viewport width is never actually the small width the media query is checking against

---

## Issue 3: Form submits, but the server receives no value for a field

**Symptom:** A form field is visible, fillable, and looks correct — but the server-side handler (or `console.log(new FormData(form))`) shows the value missing entirely.

**Root Cause:** The input is missing a `name` attribute, is `disabled` rather than `readonly`, or exists outside the actual `<form>` element (even if positioned nearby visually).

**Debug steps:**
```js
// In DevTools console, right before submitting:
const form = document.querySelector('form');
console.log([...new FormData(form).entries()]);
// Any field genuinely missing from this list is not being submitted
```

**Fix patterns:**
```html
<!-- BAD: has id, no name -- submits nothing -->
<input type="text" id="username">

<!-- GOOD -->
<input type="text" id="username" name="username">

<!-- BAD: input is visually near the form but not inside it -->
<form id="signup"></form>
<input type="text" name="email">

<!-- GOOD: either nest it, or explicitly associate via form="" -->
<form id="signup">
  <input type="text" name="email">
</form>
<!-- or, if it truly must live elsewhere in the DOM: -->
<input type="text" name="email" form="signup">
```
- Remember: `disabled` inputs never submit a value; `readonly` inputs do — use `readonly` if the value should still be sent

---

## Issue 4: Screen reader skips or misreads form fields

**Symptom:** An accessibility audit (or manual screen reader test) reports form inputs with no accessible name, or announces the wrong label for a field.

**Root Cause:** `<label>` isn't actually connected to its input — either the `for`/`id` values don't match exactly, or the label is just placed nearby visually with no structural connection at all.

**Debug steps:**
```bash
# Chrome DevTools -> Elements panel -> Accessibility pane (bottom)
# Select the input -> check "Accessible Name" -- if blank, it's unlabeled
```
```html
<!-- Common bug: typo/mismatch between for and id -->
<label for="user-email">Email</label>
<input type="email" id="useremail">  <!-- doesn't match "user-email" -->
```

**Fix patterns:**
```html
<!-- Fix 1: exact matching for/id -->
<label for="email">Email</label>
<input type="email" id="email">

<!-- Fix 2: wrap the input inside the label (no id/for needed at all) -->
<label>
  Email
  <input type="email" name="email">
</label>

<!-- Fix 3: when a visible <label> genuinely isn't appropriate
     (a rare case -- prefer a visible label whenever possible) -->
<input type="search" name="q" aria-label="Search products">
```

---

## Issue 5: Layout shifts / jumps around while images load

**Symptom:** Page content visibly jumps down as images finish loading in, especially on a slower connection — a real, measurable Core Web Vitals metric (Cumulative Layout Shift) as well as a poor user experience.

**Root Cause:** `<img>` tags with no `width`/`height` attributes — the browser has no way to reserve the correct amount of space before the image finishes downloading and its real dimensions are known.

**Debug steps:**
```bash
# Chrome DevTools -> Lighthouse -> run an audit -> check "Cumulative Layout Shift"
# Elements known to cause it are flagged directly with before/after screenshots
```

**Fix patterns:**
```html
<!-- BAD: no dimensions, browser can't reserve space -->
<img src="hero.jpg" alt="...">

<!-- GOOD: browser reserves the correct aspect-ratio box immediately,
     even before the file has downloaded -->
<img src="hero.jpg" alt="..." width="1200" height="600">
```
```css
/* CSS can still control the DISPLAYED size responsively --
   width/height attributes just set the intrinsic aspect ratio */
img { max-width: 100%; height: auto; }
```

---

## Prevention Tips
- Always declare `<meta charset="UTF-8">` and `<meta name="viewport">` as the first two things in `<head>`, on every page, by habit
- Every form input needs both a `name` attribute (for submission) and a connected `<label>` (for accessibility) — treat these as non-negotiable, not optional polish
- Set `width`/`height` on every `<img>` to prevent layout shift, even when CSS will control the final displayed size
- Run a Lighthouse accessibility audit before considering any page "done," not just a visual review
- Test every form and interactive element with the mouse unplugged — keyboard-only navigation surfaces missing `tabindex`, missing labels, and broken focus order immediately
