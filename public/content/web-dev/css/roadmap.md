# CSS & Modern Layout — Roadmap

## Estimated Time to Job-Ready

4-8 weeks of consistent practice (roughly 5-8 hours/week) to be genuinely comfortable building and debugging real layouts independently — faster if HTML fundamentals are already solid and practice is deliberate (building real layouts, not just reading), slower if squeezed into sporadic sessions. CSS rewards repetition more than reading — the box model and the cascade only really click after debugging a few real, self-caused layout bugs.

---

## Phase 1: Box Model, Selectors, and the Cascade (Week 1-2)

- The box model — content, padding, border, margin, `box-sizing`
- Selectors — type, class, ID, attribute, pseudo-class/element
- Specificity and the cascade — how conflicting rules actually resolve
- Inheritance — which properties inherit by default and which don't
- Build: a styled single-page bio/profile card using only these fundamentals

**Checkpoint:** Given two conflicting CSS rules on the same element, can you predict which one wins without opening DevTools — and then confirm it in the Styles panel?

---

## Phase 2: Flexbox and Grid (Week 2-4)

- Flexbox — container/item properties, common alignment patterns
- CSS Grid — `grid-template-columns`/`rows`, `fr`, `grid-template-areas`
- Choosing between Flexbox and Grid (and using both together) for a given layout
- Build: a responsive card grid and a full page layout (header/sidebar/main/footer) using Grid

**Checkpoint:** Can you build a three-column card grid that reflows to one column on mobile, using `repeat(auto-fit, minmax(...))` with no media query?

---

## Phase 3: Responsive Design and Modern Features (Week 4-6)

- Mobile-first media queries, responsive units (`rem`, `%`, `vw`/`vh`)
- CSS custom properties (variables) and a basic theme toggle
- Transitions and animations, with a real performance-conscious approach (`transform`/`opacity`)
- Positioning — `relative`, `absolute`, `fixed`, `sticky`, and their real bugs
- Build: a responsive navbar with a mobile hamburger menu, no JavaScript framework required for the CSS itself

**Checkpoint:** Can you explain, from memory, exactly why an `absolute`-positioned element sometimes jumps to the wrong corner of the page — and how to fix it?

---

## Phase 4: Architecture, Performance, and Modern CSS (Week 6-8)

- CSS architecture at scale — BEM vs utility-first tradeoffs
- Performance — critical CSS, `content-visibility`, `will-change` used narrowly
- Cascade layers (`@layer`) for resolving specificity wars deliberately
- Container queries and `:has()` as genuinely production-ready modern tools
- Build: a component-based layout (a card that adapts via container queries) and a short performance pass (fixing a deliberately introduced layout-shift bug) on one of the earlier projects

**Checkpoint:** Given a real production layout bug (a Flexbox item not shrinking, a Grid track sizing wrong, a specificity conflict from a third-party stylesheet), can you diagnose it using DevTools' Styles/Computed/Layout panels in under five minutes?
