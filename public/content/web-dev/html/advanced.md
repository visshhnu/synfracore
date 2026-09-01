# HTML — Advanced

## Web Components — native, framework-free reusable elements

Web Components let you define a genuinely new HTML element with its own encapsulated markup, styles, and behavior — usable in plain HTML with no framework, and interoperable across React/Vue/anything else since it's a real browser API, not a library convention.

```html
<script>
class RatingStars extends HTMLElement {
  static observedAttributes = ['value'];

  connectedCallback() {
    this.shadow = this.attachShadow({ mode: 'open' });
    this.render();
  }

  attributeChangedCallback() {
    if (this.shadow) this.render();
  }

  render() {
    const value = Number(this.getAttribute('value')) || 0;
    this.shadow.innerHTML = `
      <style>
        span { color: #ccc; font-size: 1.5rem; }
        span.filled { color: gold; }
      </style>
      ${'★'.repeat(5).split('').map((s, i) =>
        `<span class="${i < value ? 'filled' : ''}">${s}</span>`).join('')}
    `;
  }
}
customElements.define('rating-stars', RatingStars);
</script>

<rating-stars value="4"></rating-stars>
```

The **Shadow DOM** (`attachShadow`) is the mechanism that makes this genuinely safe to drop into any page — styles defined inside it don't leak out to the rest of the page, and the page's own global CSS doesn't leak in and accidentally override the component's internals. This is real style encapsulation, not a naming convention like BEM that relies on developer discipline to avoid collisions.

## The `dialog` element — native modals, real accessibility for free

```html
<dialog id="confirm-dialog">
  <form method="dialog">
    <p>Delete this item permanently?</p>
    <button value="cancel">Cancel</button>
    <button value="confirm">Delete</button>
  </form>
</dialog>

<button id="open-btn">Delete Item</button>

<script>
  const dialog = document.getElementById('confirm-dialog');
  document.getElementById('open-btn').addEventListener('click', () => {
    dialog.showModal();   // NOT dialog.show() -- showModal() is what
                           // gets you focus trapping and the backdrop
  });
  dialog.addEventListener('close', () => {
    console.log('User chose:', dialog.returnValue);
  });
</script>
```

`showModal()` gets you, entirely free from the browser: focus trapped inside the dialog (Tab can't escape to the rest of the page), Escape-to-close, a native `::backdrop` pseudo-element, and the rest of the page correctly marked inert to assistive technology. A hand-built `<div>`-based modal has to reimplement every one of these manually, and focus trapping in particular is routinely implemented incorrectly even by experienced teams — this is a real, common source of accessibility bugs that `dialog` eliminates by construction.

## HTML injection and the real XSS surface

Any point where untrusted data is inserted into the DOM as *markup* (not text) is a cross-site scripting (XSS) risk — this is fundamentally an HTML-structure problem, not just a JavaScript problem.

```js
// DANGEROUS -- if userInput contains "<img src=x onerror=alert(1)>",
// it executes. innerHTML parses its argument AS HTML, not as text.
element.innerHTML = userInput;

// SAFE -- textContent never parses its argument as markup at all,
// so injected tags render as literal, inert text on the page
element.textContent = userInput;

// If HTML *must* be rendered (rich text from a CMS, for example),
// sanitize it first with a real, maintained library -- never a
// hand-rolled regex, which reliably misses edge cases
element.innerHTML = DOMPurify.sanitize(userInput);
```

```html
<!-- Attribute-context injection is the same class of bug, easy to miss -->
<!-- DANGEROUS if `userBio` isn't escaped: -->
<div title="userBio-goes-here">...</div>
<!-- an attacker-controlled value like  "><script>...</script>  can
     break out of the attribute and inject a real element -->
```

The underlying principle: HTML has no inherent concept of "trusted" vs. "untrusted" content — the parser treats `<script>` the same whether it came from your own template or a form field an attacker filled in. Every framework's built-in escaping (React's JSX auto-escaping, Vue's `{{ }}` interpolation) exists specifically to prevent this class of bug by default — and every framework also has an explicit escape hatch (`dangerouslySetInnerHTML`, `v-html`) that reintroduces exactly this risk the moment untrusted data flows into it unsanitized.

## Browser rendering pipeline — how your HTML actually becomes pixels

```flow
{
  "layout": "flow",
  "steps": [
    { "label": "Parse HTML", "sublabel": "Bytes -> DOM tree", "color": "blue" },
    { "label": "Parse CSS", "sublabel": "Bytes -> CSSOM tree", "color": "purple" },
    { "label": "Render Tree", "sublabel": "DOM + CSSOM combined, visible nodes only", "color": "amber" },
    { "label": "Layout", "sublabel": "Compute exact size/position of every box", "color": "green" },
    { "label": "Paint", "sublabel": "Pixels actually drawn to screen", "color": "slate" }
  ]
}
```

This is exactly why a `<script>` tag placed in `<head>` without `defer`/`async` blocks rendering — the HTML parser hits it, must stop and hand control to the JavaScript engine (since the script could use `document.write` to inject more HTML), fetch and execute it fully, and only then resume parsing the rest of the document. A stylesheet in `<head>` similarly blocks *painting* (not parsing) until it's loaded, specifically to prevent a flash of unstyled content — the render tree can't be built without both the DOM and the CSSOM being ready.

## Document structure at scale — `template` and lazy content

```html
<template id="row-template">
  <tr>
    <td class="name"></td>
    <td class="price"></td>
  </tr>
</template>

<script>
  const template = document.getElementById('row-template');
  function addRow(name, price) {
    const clone = template.content.cloneNode(true);
    clone.querySelector('.name').textContent = name;
    clone.querySelector('.price').textContent = price;
    document.querySelector('tbody').appendChild(clone);
  }
</script>
```

Content inside `<template>` is inert — never rendered, its `img`s never fetched, its scripts never run — until explicitly cloned and inserted via JavaScript. This is the real, native building block that component frameworks' "template" concepts are ultimately modeled on, and it's a genuinely useful pattern on its own for repeated markup (table rows, list items) generated from data without a full framework.

```html
<!-- Native lazy-loading -- defers offscreen image/iframe loading
     without any JavaScript Intersection Observer code -->
<img src="below-the-fold.jpg" loading="lazy" alt="...">
<iframe src="heavy-embed.html" loading="lazy"></iframe>
```

`loading="lazy"` is a real, browser-native performance optimization — for a long page with many images, only the ones near the current viewport are fetched initially, meaningfully reducing initial page weight and load time without any custom scroll-listener code.
