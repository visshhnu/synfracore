# HTML — PYQ (Previously Asked / Practice Questions)

**Framing note:** HTML has no single dominant, proctored certification with a public past-paper archive — unlike, say, AWS or CompTIA exams, there is no "leaked question bank" to draw from honestly. What follows is built from this guide's own Overview/Fundamentals/Intermediate/Advanced/Troubleshooting material, framed as practice questions grounded in real, documented HTML/browser behavior rather than invented "leaked" exam content.

---

### 1. (Domain: Document Structure) Why must `<meta charset="UTF-8">` appear within the first 1024 bytes of a document, and what actually breaks if it's placed too late?

**Answer:** The browser has to start decoding the byte stream into characters before it can fully parse the rest of the document, and it needs to know the encoding to do that correctly. If the charset declaration appears too late (after the browser has already started decoding under an assumed default encoding), any non-ASCII characters parsed before that point can be decoded incorrectly, producing garbled text (mojibake) that a later, correct charset declaration cannot retroactively fix for content already parsed.

---

### 2. (Domain: Semantic Elements) Why does a screen reader user's experience differ meaningfully between a page built with `header`/`nav`/`main`/`footer` versus one built entirely from `div`s with matching class names?

**Answer:** Semantic elements are exposed to the accessibility tree with their actual role — a screen reader can announce "navigation region" or let a user jump directly to "main content," skipping repeated header/nav content on every page load. A `<div class="nav">` carries none of that role information to assistive technology by default; it's announced as generic, undifferentiated content, forcing a screen reader user to navigate linearly through everything with no way to skip to the actual content.

---

### 3. (Domain: Forms) A form field has a matching `label for=`/`id=` pair and is visually correct, but the value never reaches the server. What's the most likely missing piece?

**Answer:** A missing `name` attribute on the input. Submission uses `name`, not `id` — a field can be perfectly labeled and accessible while still submitting nothing at all if `name` was never added, since the browser has no attribute to key the submitted value against.

---

### 4. (Domain: Accessibility / ARIA) Why is `role="button"` on a `div` with no `tabindex` and no keydown handler considered worse than an unstyled, unlabeled `div`?

**Answer:** Adding `role="button"` announces the element to assistive technology as an interactive control that a user should be able to activate — but without `tabindex="0"` it's not reachable by keyboard at all, and without a `keydown` handler for Enter/Space it doesn't actually do anything even if focus somehow reaches it. This creates a false affordance: a screen reader user is told "this is a button" and has no way to actually use it, which is a worse experience than not claiming any interactivity in the first place.

---

### 5. (Domain: Tables) Why does using `<table>` purely for page layout cause a real accessibility problem, distinct from it just being outdated style?

**Answer:** A screen reader announces a `<table>` with its row/column count and any header relationships as tabular data — this is actively misleading when the "table" is really just a layout grid with no genuine data relationship between cells, since the user is told to expect structured data that doesn't actually exist. This is a distinct, functional accessibility bug, not merely an aesthetic or maintainability concern.

---

### 6. (Domain: Images / Performance) Why does omitting `width`/`height` attributes on `<img>` cause a measurable Core Web Vitals regression, and how does setting them fix it?

**Answer:** Without explicit dimensions, the browser has no way to know how much space to reserve for an image before it finishes downloading, so surrounding content initially renders as if the image weren't there and then visibly shifts once the image loads and its real size becomes known — this is directly measured as Cumulative Layout Shift. Setting `width`/`height` (even if CSS later controls the displayed size) lets the browser reserve the correct aspect-ratio box immediately, before the file has downloaded at all.

---

### 7. (Domain: Script Loading) Why does a `<script>` tag with no `defer`/`async` in `<head>` block page rendering, and how do `defer` and `async` each change that?

**Answer:** A plain `<script>` in `<head>` forces the HTML parser to stop entirely, fetch and fully execute the script (since it could use `document.write` to inject more markup), and only then resume parsing — this delays everything after it. `defer` fetches the script in parallel with parsing but delays execution until parsing completes, preserving document order across multiple deferred scripts. `async` also fetches in parallel but executes the instant it's ready, regardless of parsing state or order relative to other scripts.

---

### 8. (Domain: Modern HTML) What does `dialog.showModal()` provide for free that a hand-built `<div>`-based modal has to reimplement manually?

**Answer:** Focus trapping (Tab can't escape the dialog to the rest of the page), Escape-to-close, a native `::backdrop` pseudo-element, and marking the rest of the page correctly inert to assistive technology — all genuinely nontrivial to reimplement correctly by hand, with focus trapping in particular a common, real source of accessibility bugs in custom-built modals even from experienced teams.

---

### 9. (Domain: Security) Why is `element.innerHTML = userInput` a genuine XSS risk while `element.textContent = userInput` is not, given both insert a string into the page?

**Answer:** `innerHTML` parses its argument as HTML markup — if `userInput` contains a tag like `<img src=x onerror=alert(1)>`, the browser parses and executes it as real markup, including any embedded event handler. `textContent` never parses its argument as markup at all; any tags in the string render as literal, inert visible text on the page rather than being interpreted as elements, which is exactly why it carries no injection risk for this use case.

---

### 10. (Domain: DOM Fundamentals) A developer adds an item to a list using `list.appendChild()` in JavaScript, but "View Source" in the browser still shows only the original items. Is this a bug?

**Answer:** No — this is expected, correct behavior. "View Source" displays the original HTML file exactly as delivered by the server or read from disk; it never reflects JavaScript-driven changes. The live DOM (visible in DevTools' Elements panel, and what's actually rendered on screen) is a separate, in-memory tree that JavaScript mutates directly — the two can diverge significantly once scripts run, and that divergence is normal, not an error.
