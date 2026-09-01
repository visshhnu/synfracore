# HTML — Intermediate

## Form validation, beyond `required`

The browser does real validation work for free if you use the right input types and attributes — reimplementing this in JavaScript is both extra work and easy to get subtly wrong (a regex email check that rejects a valid address is a classic self-inflicted bug).

```html
<form>
  <label for="username">Username</label>
  <input type="text" id="username" name="username"
         minlength="3" maxlength="20" pattern="[a-zA-Z0-9_]+"
         title="Letters, numbers, and underscores only, 3-20 characters" required>

  <label for="age">Age</label>
  <input type="number" id="age" name="age" min="13" max="120" required>

  <label for="website">Website</label>
  <input type="url" id="website" name="website" placeholder="https://example.com">

  <button type="submit">Submit</button>
</form>
```

```html
<!-- CSS pseudo-classes react directly to HTML5 validation state -->
<style>
  input:invalid { border-color: red; }
  input:valid { border-color: green; }
  input:required:invalid { background: #fff0f0; }
</style>
```

The flow, end to end: the browser blocks submission and shows a native validation message on an invalid field, before your form's `submit` handler (if any) even runs — this is why relying purely on JavaScript validation for a basic "is this field empty" check duplicates work the browser already does natively, correctly, and accessibly.

```flow
{
  "layout": "flow",
  "steps": [
    { "label": "User submits form", "color": "blue" },
    { "label": "Browser checks constraints", "sublabel": "required, pattern, min/max, type", "color": "purple" },
    { "label": "Invalid: native message shown, submit blocked", "color": "amber" },
    { "label": "Valid: form actually submits", "color": "green" }
  ]
}
```

## Accessible custom widgets — ARIA as a deliberate fallback

Native elements should always be the first choice — a real `<button>` gets keyboard focus, Enter/Space activation, and correct screen-reader announcement automatically. ARIA exists for the genuine remainder: cases where no native element does what's needed.

```html
<!-- A custom dropdown that a native <select> genuinely can't achieve
     (rich content per option) — ARIA fills the real gap here -->
<div class="dropdown">
  <button aria-haspopup="listbox" aria-expanded="false" id="dropdown-btn">
    Choose a plan
  </button>
  <ul role="listbox" aria-labelledby="dropdown-btn" hidden>
    <li role="option" tabindex="-1">Free</li>
    <li role="option" tabindex="-1">Pro</li>
  </ul>
</div>
```

```js
// Keyboard behavior has to be wired manually -- this is the actual cost
// of not using a native element, not a one-line ARIA attribute add
const btn = document.getElementById('dropdown-btn');
const list = btn.nextElementSibling;
btn.addEventListener('click', () => {
  const expanded = btn.getAttribute('aria-expanded') === 'true';
  btn.setAttribute('aria-expanded', String(!expanded));
  list.hidden = expanded;
});
```

The **first rule of ARIA** (a real, documented WAI-ARIA principle) is: no ARIA is better than bad ARIA. `role="button"` on a `div` with no `tabindex` and no keydown handler is worse than a plain unstyled `<div>`, because it now *announces itself* as a button to a screen reader while remaining completely non-functional by keyboard.

## `details`/`summary` — disclosure widgets with zero JavaScript

```html
<details>
  <summary>What payment methods do you accept?</summary>
  <p>We accept all major credit cards, PayPal, and bank transfers.</p>
</details>

<details open>
  <summary>Advanced options</summary>
  <label><input type="checkbox"> Enable beta features</label>
</details>
```

This gets keyboard support, screen-reader-announced expanded/collapsed state, and a click-to-toggle triangle indicator entirely for free from the browser — the equivalent hand-built JavaScript+ARIA accordion is a genuinely common interview/take-home exercise specifically because it reveals whether a candidate knows `details`/`summary` already solves it natively.

## Meta tags — SEO and link previews

```html
<head>
  <title>Acme Widgets — Buy Quality Widgets Online</title>
  <meta name="description" content="Shop premium widgets with free shipping over $50. Handcrafted, sustainably sourced, 30-day returns.">

  <!-- Open Graph -- controls how the page previews when shared on
       social platforms/messaging apps -->
  <meta property="og:title" content="Acme Widgets">
  <meta property="og:description" content="Shop premium widgets with free shipping over $50.">
  <meta property="og:image" content="https://acme.example/og-image.jpg">
  <meta property="og:url" content="https://acme.example/">

  <link rel="canonical" href="https://acme.example/widgets">
</head>
```

`<meta name="description">` doesn't affect ranking directly, but it's frequently what a search engine shows as the result snippet — a missing or generic one means the search engine picks its own excerpt, which is often worse. `rel="canonical"` matters when the same content is reachable at more than one URL (with/without a trailing slash, with tracking parameters) — it tells search engines which one is the "real" one to index, avoiding duplicate-content penalties.

## The DOM, and what actually changes it

The HTML you write is the *source*; the DOM is the live, in-memory tree the browser builds from parsing it, and what JavaScript actually reads and mutates.

```html
<ul id="list">
  <li>Item 1</li>
</ul>
<script>
  const list = document.getElementById('list');
  const item = document.createElement('li');
  item.textContent = 'Item 2 (added by JS)';
  list.appendChild(item);
  // View Source still shows only "Item 1" -- it shows the original
  // file, not the live DOM. DevTools' Elements panel shows both items.
</script>
```

This distinction resolves a very common confusion: "why doesn't View Source show the content I can clearly see on the page?" — because View Source fetches and displays the original HTML response, while the Elements panel in DevTools inspects the live, JavaScript-mutated DOM.

## Responsive images with `srcset` — real bandwidth savings

```html
<img
  src="photo-800w.jpg"
  srcset="photo-400w.jpg 400w, photo-800w.jpg 800w, photo-1600w.jpg 1600w"
  sizes="(max-width: 600px) 400px, (max-width: 1000px) 800px, 1600px"
  alt="Product photo of a ceramic mug on a wooden table">
```

The browser — not the developer — picks which file to actually download, based on the real viewport width and device pixel density at load time. This is a genuine performance win: a phone on a small screen never downloads the 1600px version meant for a large desktop monitor, without any JavaScript or manual device detection.
