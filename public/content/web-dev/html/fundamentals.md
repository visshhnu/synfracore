# HTML — Fundamentals

## Document structure — the skeleton every page needs

Every HTML page starts from the same skeleton. Think of it like a building permit's required minimum — the `doctype`, `html`, `head`, and `body` aren't optional decoration, they're what tells the browser "this is a real, standards-mode HTML page" rather than something to guess at.

```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Page Title</title>
</head>
<body>
  <!-- visible content goes here -->
</body>
</html>
```

- `<!DOCTYPE html>` tells the browser to render in standards mode (not a legacy "quirks mode" that reinterprets old, inconsistent browser behavior).
- `lang="en"` matters more than it looks — screen readers use it to select the correct pronunciation, and it's a real accessibility requirement, not decoration.
- `<meta charset="UTF-8">` must come first inside `<head>` (within the first 1024 bytes) — it tells the browser how to decode the byte stream into actual characters, and getting it wrong shows up as garbled text (mojibake) for any non-ASCII character.
- `<meta name="viewport" ...>` tells mobile browsers to render at the device's actual width instead of pretending to be a 980px-wide desktop page and zooming out — without it, a mobile-responsive CSS layout simply won't kick in correctly.

## Semantic layout elements — giving regions actual meaning

Before semantic elements existed, every page was built from generic `<div>`s with class names like `class="header"` — visually fine, but meaningless to a screen reader or search engine, which sees an undifferentiated wall of `div`s. Semantic elements fix this by naming the *role* of a region, not just its appearance.

```html
<body>
  <header>
    <nav>...</nav>
  </header>

  <main>
    <article>
      <h1>Article Title</h1>
      <section>
        <h2>A Subsection</h2>
        <p>Content...</p>
      </section>
    </article>
    <aside>Related links, not core content</aside>
  </main>

  <footer>...</footer>
</body>
```

A useful mental model: `main` is "the actual reason this page exists" (there should be exactly one per page); `article` is content that would make sense standalone if syndicated elsewhere (a blog post, a product card); `section` groups related content under its own heading; `aside` is tangential — related but not essential to the primary content, like a sidebar of related links.

```conceptgrid
{
  "boxes": [
    { "title": "header / footer", "description": "Introductory or closing content for the page, or for a section within it", "color": "blue" },
    { "title": "nav", "description": "A block of navigation links — not every group of links needs this, only genuine navigation", "color": "green" },
    { "title": "main / article / section", "description": "The actual content, nested by how self-contained each piece is", "color": "purple" },
    { "title": "aside", "description": "Tangentially related content — a sidebar, a pull quote, not core reading material", "color": "amber" }
  ]
}
```

## Headings — a hierarchy, not a font-size picker

`<h1>` through `<h6>` describe a document's outline — screen reader users frequently navigate a page by jumping heading-to-heading, the same way a sighted user might skim a table of contents. Choosing a heading level because "it looks the right size" instead of because it's genuinely a subsection of the heading above it breaks that navigation.

```html
<h1>Getting Started with HTML</h1>
  <h2>Document Structure</h2>
    <h3>The doctype</h3>
    <h3>Head vs. body</h3>
  <h2>Semantic Elements</h2>
```

Never skip a level for visual reasons (`h1` straight to `h4` because the `h4` styling "looks right") — style the element with CSS to look however you want; the heading *level* should always reflect actual document structure, not desired appearance.

## Forms — the elements that actually collect data

A form's `name` attribute (not `id`) is what gets sent to the server on submit — a very common beginner bug is a form field with an `id` but no `name`, which submits nothing for that field.

```html
<form action="/submit" method="post">
  <div>
    <label for="email">Email</label>
    <input type="email" id="email" name="email" required>
  </div>

  <div>
    <label for="plan">Plan</label>
    <select id="plan" name="plan">
      <option value="free">Free</option>
      <option value="pro">Pro</option>
    </select>
  </div>

  <button type="submit">Sign Up</button>
</form>
```

The `<label for="email">` / `<input id="email">` pairing does real work, not just visual proximity — clicking the label text focuses the input (helpful for anyone with limited motor precision, including on mobile), and a screen reader announces the label when the input receives focus. A `<label>` with no `for`/`id` connection is just floating text as far as assistive technology is concerned, even if it's positioned right next to the field visually.

`type="email"` isn't just semantic — it triggers real built-in browser validation and, on mobile, a keyboard layout with `@` and `.` easily accessible. Using `type="text"` for an email field throws that away for no benefit.

## Tables — for tabular data, and only tabular data

```html
<table>
  <thead>
    <tr>
      <th scope="col">Product</th>
      <th scope="col">Price</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Widget</td>
      <td>$9.99</td>
    </tr>
  </tbody>
</table>
```

`scope="col"` tells a screen reader that this header applies to the entire column below it — without it, a screen reader user navigating cell-by-cell has no announced context for what each value means. Reaching for `<table>` purely to lay out a page (a habit from before CSS layout existed) is a real anti-pattern: a screen reader announces "table, 3 columns, 5 rows" for something that isn't actually tabular data at all, which is actively confusing rather than neutral.

## Images and media — responsive and accessible by default

```html
<img src="hero.jpg" alt="A developer debugging code on a laptop at a desk" width="800" height="400">

<!-- Responsive: browser picks the right source for viewport/screen density -->
<picture>
  <source media="(min-width: 800px)" srcset="hero-large.jpg">
  <source media="(max-width: 799px)" srcset="hero-small.jpg">
  <img src="hero-small.jpg" alt="A developer debugging code on a laptop at a desk">
</picture>

<!-- Decorative image conveying no information -> empty alt, not omitted -->
<img src="divider-flourish.png" alt="">
```

Always set `width`/`height` (even if CSS later overrides the display size) — the browser reserves the correct amount of space before the image finishes loading, which prevents the page from visibly jumping around as images load in (a real, measurable metric called Cumulative Layout Shift).

## Try it

Build a single page with `header` → `main` (containing one `article` with a real heading hierarchy and a form with two properly-labeled fields) → `footer`. Then open DevTools' Elements panel and confirm the tree structure you see matches exactly what you wrote — that confirms you understand the relationship between your HTML source and the live DOM the browser actually builds from it.
