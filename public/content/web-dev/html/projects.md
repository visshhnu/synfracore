# HTML — Portfolio Projects

---

## Project 1: Accessible Personal Portfolio Page

**Level:** Beginner | **Time:** 1 day | **GitHub:** `html-accessible-portfolio`

**What you build:** a single-page personal portfolio (about, projects list, contact form) built with zero `div`-soup — every region uses a real semantic element, every image has meaningful `alt` text, and the whole page passes a Lighthouse accessibility audit at 100 with CSS/JS disabled.

```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Jordan Lee — Front-End Developer</title>
  <meta name="description" content="Portfolio of Jordan Lee, front-end developer.">
</head>
<body>
  <header>
    <h1>Jordan Lee</h1>
    <nav aria-label="Main navigation">
      <a href="#projects">Projects</a>
      <a href="#contact">Contact</a>
    </nav>
  </header>

  <main>
    <section id="projects" aria-labelledby="projects-heading">
      <h2 id="projects-heading">Projects</h2>
      <article>
        <h3>Weather Dashboard</h3>
        <p>A responsive dashboard consuming a public weather API.</p>
      </article>
    </section>

    <section id="contact" aria-labelledby="contact-heading">
      <h2 id="contact-heading">Get in touch</h2>
      <form action="/submit" method="post">
        <label for="name">Name</label>
        <input type="text" id="name" name="name" required>

        <label for="email">Email</label>
        <input type="email" id="email" name="email" required>

        <label for="message">Message</label>
        <textarea id="message" name="message" required></textarea>

        <button type="submit">Send</button>
      </form>
    </section>
  </main>

  <footer>
    <p>&copy; 2026 Jordan Lee</p>
  </footer>
</body>
</html>
```

**Steps:** semantic structure first with zero CSS, run a Lighthouse accessibility audit and fix every flag, then add CSS only after the unstyled page is already fully navigable by keyboard and screen reader alone.

---

## Project 2: Data-Driven Product Table

**Level:** Intermediate | **Time:** 1-2 days | **GitHub:** `html-product-table`

**What you build:** a genuinely tabular product listing (name, price, stock) with correct `thead`/`tbody`/`th scope` structure, a responsive image using `picture`, and a `details`/`summary` filter panel requiring zero JavaScript for basic show/hide behavior.

```html
<details open>
  <summary>Filter products</summary>
  <form>
    <label><input type="checkbox" name="category" value="electronics"> Electronics</label>
    <label><input type="checkbox" name="category" value="home"> Home</label>
  </form>
</details>

<table>
  <caption>Current inventory — updated daily</caption>
  <thead>
    <tr>
      <th scope="col">Product</th>
      <th scope="col">Price</th>
      <th scope="col">In Stock</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <picture>
          <source media="(min-width: 600px)" srcset="mug-large.jpg">
          <img src="mug-small.jpg" alt="Ceramic coffee mug, matte white" width="60" height="60">
        </picture>
        Ceramic Mug
      </td>
      <td>$14.99</td>
      <td>32</td>
    </tr>
  </tbody>
</table>
```

**Steps:** build the table with real semantic markup and a `caption`, add the `details`-based filter, then verify a screen reader correctly announces column headers when navigating cell-by-cell (this is the actual test of whether `scope` was set correctly).

---

## Project 3: Native Web Component Library

**Level:** Advanced | **Time:** 2-3 days | **GitHub:** `html-web-components`

**What you build:** three small, reusable custom elements (a `<rating-stars>`, a `<copy-button>` that copies text to the clipboard, and an `<accessible-tooltip>`) using `customElements.define` and Shadow DOM — usable in plain HTML with no build step or framework.

```html
<script>
class CopyButton extends HTMLElement {
  connectedCallback() {
    this.shadow = this.attachShadow({ mode: 'open' });
    this.shadow.innerHTML = `<button>Copy</button>`;
    this.shadow.querySelector('button').addEventListener('click', async () => {
      await navigator.clipboard.writeText(this.getAttribute('text'));
      this.shadow.querySelector('button').textContent = 'Copied!';
      setTimeout(() => {
        this.shadow.querySelector('button').textContent = 'Copy';
      }, 1500);
    });
  }
}
customElements.define('copy-button', CopyButton);
</script>

<copy-button text="npm install my-package"></copy-button>
```

**Steps:** build each component with Shadow DOM style encapsulation, confirm the button inside each component is keyboard-accessible (real `<button>` inside the shadow root, not a styled `div`), then demo all three dropped into a plain HTML page with no framework or bundler.

---

## Portfolio Checklist
- [ ] Zero `div`s used where a semantic element already fits
- [ ] Every form input has a correctly connected `label`
- [ ] Every meaningful image has real, descriptive `alt` text; decorative images use `alt=""`
- [ ] Heading levels reflect actual document outline, never chosen for visual size
- [ ] Can explain: why `<table>` for layout is a real anti-pattern, and when ARIA is actually warranted vs. a native element
