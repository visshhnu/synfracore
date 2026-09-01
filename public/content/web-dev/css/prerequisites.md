# CSS & Modern Layout — Prerequisites

## What You Need Before Starting

### 1. Basic HTML (required)

You should be comfortable writing plain HTML by hand — elements, attributes, nesting a `<div>` inside another `<div>`, and knowing the difference between a block-level element (`<div>`, `<p>`) and an inline one (`<span>`, `<a>`). This course's Fundamentals tab starts directly with CSS selectors and the box model, assuming HTML structure itself is already comfortable — if writing a small HTML page from scratch (a heading, a couple of paragraphs, a list, a link) still requires looking things up constantly, spend time there first.

### 2. A text editor and a browser (required)

Any code editor works — VS Code is the most common choice and is what the Installation tab's live-reload setup assumes, but any editor that can save a plain `.css` file is fine. Any modern browser (Chrome, Firefox, Edge, Safari) works for following along; this course's DevTools-based debugging examples use Chrome's panel names specifically, though Firefox's and Edge's equivalents are functionally very similar.

### 3. Comfort with the command line (helpful, not required)

Not required for CSS itself — there's no CSS "compiler" to run — but genuinely helpful once a project introduces a build tool, a CSS preprocessor, or a live-reload dev server, all of which are typically started from a terminal. The Installation tab covers this without assuming prior terminal experience.

### 4. What you do *not* need yet

- **Any prior CSS or styling experience** — this course assumes none. Every property and pattern is introduced from scratch, starting at the box model.
- **JavaScript** — CSS is covered here as its own language; JavaScript-driven interactivity (event listeners, DOM manipulation) is out of scope for this technology and lives in this platform's JavaScript material instead.
- **A CSS framework (Tailwind, Bootstrap, etc.)** — deliberately not the starting point. Understanding raw CSS first is what makes a framework's utility classes make sense later, rather than being memorized as opaque shortcuts.
- **Design or visual-design background** — this course teaches the mechanics of how layout and styling actually work, not visual design principles (color theory, typography choice, composition) as a separate discipline.

### Quick self-check

Can you write, without looking anything up, a small HTML page with a heading, two paragraphs, and a list, and explain the difference between `<div>` and `<span>`? If yes, you're ready to start at Fundamentals. If HTML structure itself still feels shaky, build a bit more comfort there first — this course builds directly on top of it rather than re-teaching it.
