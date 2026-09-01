# HTML & Semantic Markup — Learning Roadmap

## Estimated Time to Job-Ready
**3-5 weeks** of consistent learning (1-2 hours/day) to reach genuine competence — HTML has a small enough surface area that "job-ready" here really means "writes clean, semantic, accessible markup by default," which is achievable faster than most technologies on this platform, but is still routinely done badly by developers who skip straight to a framework without it.

## Phase 1: Document Structure & Core Elements (Week 1)

- Doctype, `html`/`head`/`body`, charset, and viewport meta — get these right by habit, every single page
- Text content elements: headings (`h1`-`h6`), paragraphs, lists (`ul`/`ol`/`li`), links (`a`)
- Semantic layout elements: `header`, `nav`, `main`, `article`, `section`, `aside`, `footer`
- Comfort with browser DevTools' Elements panel — inspecting and understanding the live DOM tree

**Checkpoint:** can you build a simple one-page site (header, a couple of content sections, footer) using only semantic elements, with zero `div`s used for anything a semantic element already covers?

## Phase 2: Forms, Tables & Media (Week 2)

- Form elements and real input types (`email`, `number`, `tel`, `date`), `required`/`pattern` validation
- Labels connected correctly via `for`/`id` — not just placed visually near an input
- Tables for genuinely tabular data — `thead`, `tbody`, `th scope`
- Images: `alt` text written correctly, `picture`/`srcset` for responsive delivery
- Complete a hands-on project: a contact form with proper labels and validation, submitting to a dummy endpoint

**Checkpoint:** if you disconnect a form's CSS entirely, is every field still clearly labeled and usable by keyboard alone? If not, something structural is wrong, not just unstyled.

## Phase 3: Accessibility & Modern HTML (Week 3)

- Accessibility fundamentals: alt text, focus order, keyboard navigability, when ARIA is actually needed vs. when native HTML already provides it
- `details`/`summary` for JavaScript-free disclosure widgets
- `dialog` element for native modals
- Meta tags for SEO/sharing: `title`, `description`, Open Graph basics
- Run a real page through a browser accessibility audit (Lighthouse, in Chrome DevTools) and fix every flagged issue by hand

**Checkpoint:** can you explain, out loud, the difference between `<div role="button" tabindex="0">` and `<button>` — and why you'd almost always pick the second?

## Phase 4: Web Components & Interview Readiness (Week 4-5)

- Web Components: `customElements.define`, Shadow DOM basics, when a native custom element is a reasonable choice vs. a framework component
- Review how HTML you write becomes the DOM, and how frameworks (React, Vue) ultimately render down to the same real elements
- Build the two portfolio projects in the **Projects** tab, focused specifically on semantic correctness and accessibility, not visual polish
- Review this course's Interview Q&A and practice explaining semantic HTML choices out loud, including defending *why* a specific element was chosen over a generic `div`

## Common Pitfalls Specific to HTML (Not Generic Study Advice)

- **Treating HTML as "the easy one" and rushing straight to CSS/JavaScript** — sloppy structural habits formed here (div-soup, missing labels, table-based layout) quietly resurface as accessibility and SEO problems in every framework built on top of it later
- **Reaching for ARIA before checking if a native element already does the job** — `role="button"` on a `div` is a real pattern, but it's a fallback for when no native element fits, not a first choice
- **Skipping `alt` text or filling it with the filename** — `alt="IMG_4821.jpg"` passes no accessibility audit and helps no one
- **Using a heading level for its visual size rather than its actual document position** — `h3` chosen because "it looks the right size" rather than because it's genuinely a subsection of an `h2`, breaks the document outline that screen reader users rely on to navigate

## Getting Your First HTML-Adjacent Role

1. **Portfolio:** semantic, accessible markup is a genuine differentiator — a portfolio project that passes a Lighthouse accessibility audit at 100 stands out more than most junior candidates' work
2. **Resume:** be specific — "built accessible, semantic HTML forms with full keyboard navigation and ARIA where native elements weren't sufficient" is stronger than "experience with HTML"
3. **Know it's foundational, not standalone:** almost no role hires for "HTML developer" alone — this is the base every front-end, full-stack, and even backend-templating role builds on; pair it with this platform's CSS and JavaScript technologies next
4. **Interview prep:** semantic HTML and accessibility questions come up constantly in front-end interviews specifically because they separate candidates who learned HTML properly from those who only ever wrote JSX
