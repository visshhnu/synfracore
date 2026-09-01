# HTML Certification Guide

## Certifications Available

HTML honestly does not have a single dominant, proctored, industry-recognized certification the way, say, AWS or PostgreSQL do — it's rarely tested in isolation because it's foundational, not a standalone specialization employers hire specifically for. What exists instead is mostly free, self-paced, project-based credentialing bundled into broader front-end curricula:

| Cert / Credential | Provider | Cost | Format |
|---|---|---|---|
| **Responsive Web Design Certification** | freeCodeCamp | Free | Project-based, self-paced, includes real semantic HTML + accessibility coverage |
| **JavaScript Algorithms and Data Structures** (builds on HTML/CSS projects) | freeCodeCamp | Free | Project-based |
| **Front-End Development Libraries** | freeCodeCamp | Free | Project-based |
| **W3Schools HTML Certificate** | W3Schools | Paid | Online MCQ exam |
| **Meta Front-End Developer Professional Certificate** | Meta (via Coursera) | Subscription | Course + graded projects, includes HTML/CSS modules |

*(needs verification — pricing, exact syllabus, and format change on each provider's side; confirm current values directly on the provider's page before treating any of the above as current)*

**The honest framing:** freeCodeCamp's Responsive Web Design Certification is the most genuinely respected free option specifically for HTML/CSS fundamentals — it's project-based (you build real, working pages, not just answer multiple-choice questions) and is widely recognized as a legitimate signal of foundational competence, even without being a "proctored exam" in the traditional sense. Most employers evaluate HTML skill through a portfolio and a live coding/pairing exercise rather than a certificate at all — treat the projects in this course's **Projects** tab as the stronger credential-equivalent for HTML specifically.

---

## Core Topics

```html
<!-- Document structure -->
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Page Title</title>
</head>
<body></body>
</html>

<!-- Semantic layout -->
<header></header>
<nav></nav>
<main></main>
<article></article>
<section></section>
<aside></aside>
<footer></footer>

<!-- Forms with real validation -->
<form action="/submit" method="post">
  <label for="email">Email</label>
  <input type="email" id="email" name="email" required>
  <button type="submit">Submit</button>
</form>

<!-- Tables (genuinely tabular data only) -->
<table>
  <thead><tr><th scope="col">Name</th></tr></thead>
  <tbody><tr><td>Value</td></tr></tbody>
</table>

<!-- Responsive images -->
<img src="photo.jpg" alt="Description" width="800" height="400" loading="lazy">
<picture>
  <source media="(min-width: 800px)" srcset="large.jpg">
  <img src="small.jpg" alt="Description">
</picture>

<!-- Accessibility -->
<button aria-expanded="false" aria-controls="menu">Menu</button>
<div id="menu" role="menu" hidden>...</div>

<!-- Modern disclosure/dialog -->
<details><summary>More info</summary><p>...</p></details>
<dialog id="modal"><p>Modal content</p></dialog>
```

```bash
# Accessibility auditing (built into Chrome, free)
# DevTools -> Lighthouse tab -> run "Accessibility" category

# Validating HTML against the actual spec
# https://validator.w3.org/ -- paste a URL or upload a file
```

---

## Study Resources

- **MDN Web Docs** (developer.mozilla.org) — the authoritative, free day-to-day reference
- **freeCodeCamp** (freecodecamp.org) — free, project-based curriculum with real certification
- **W3C Markup Validator** (validator.w3.org) — checks a page against the actual HTML spec
- **WebAIM** (webaim.org) — accessibility-specific guidance and free auditing tools

## Revision Notes
```
DOCUMENT: doctype + lang + charset (first!) + viewport meta -- every page
SEMANTIC: header/nav/main/article/section/aside/footer -- meaning, not just layout
FORMS: name= attribute for submission | label for=/id= for accessibility
TABLES: genuinely tabular data ONLY -- never for page layout
IMAGES: alt="" required (empty for decorative) | width/height prevents layout shift
ACCESSIBILITY: native element first, ARIA only as a genuine fallback
MODERN: details/summary (disclosure) | dialog (modals) | customElements (Web Components)
```
