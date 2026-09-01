# CSS — Portfolio Projects

## Project 1: Responsive Card Grid (No Framework)

**Level:** Beginner | **Time:** 3-5 hours | **GitHub repo name:** `css-responsive-card-grid`

**What you build:** A gallery of product/article cards that reflows from a single column on mobile to a multi-column grid on desktop, entirely with CSS Grid's `auto-fit`/`minmax()` — zero media queries for the reflow itself.

```css
.card-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
  gap: 1.5rem;
  padding: 1.5rem;
}

.card {
  border: 1px solid #e5e7eb;
  border-radius: 8px;
  overflow: hidden;
  box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
  transition: transform 0.2s ease, box-shadow 0.2s ease;
}

.card:hover {
  transform: translateY(-4px);
  box-shadow: 0 8px 16px rgba(0, 0, 0, 0.12);
}

.card img {
  width: 100%;
  aspect-ratio: 16 / 9;
  object-fit: cover;
}

.card-body {
  padding: 1rem;
}
```

Extend it: add a `--card-min-width` custom property so the minimum card width is configurable from one place, and confirm resizing the browser from 320px to 1440px never produces horizontal overflow at any width.

---

## Project 2: CSS-Only Accordion / Tabs Component

**Level:** Intermediate | **Time:** 4-6 hours | **GitHub repo name:** `css-only-accordion`

**What you build:** An expand/collapse accordion (and a tabbed panel variant) using only HTML and CSS — no JavaScript — leveraging the `<details>`/`<summary>` elements and the `:checked` pseudo-class with hidden radio inputs for the tabs version.

```css
/* Accordion — native <details>/<summary>, styled */
details {
  border: 1px solid #e5e7eb;
  border-radius: 6px;
  margin-bottom: 0.5rem;
}

summary {
  padding: 0.75rem 1rem;
  cursor: pointer;
  font-weight: 600;
  list-style: none; /* removes default disclosure triangle */
}

summary::-webkit-details-marker { display: none; }

summary::after {
  content: "+";
  float: right;
  transition: transform 0.2s ease;
}

details[open] summary::after {
  transform: rotate(45deg);
}

details > *:not(summary) {
  padding: 0 1rem 1rem;
}
```

```css
/* Tabs — hidden radio inputs + sibling selectors, zero JavaScript */
.tabs input[type="radio"] { display: none; }
.tab-content { display: none; padding: 1rem; }

#tab1:checked ~ .panels #panel1,
#tab2:checked ~ .panels #panel2 {
  display: block;
}

.tab-label {
  display: inline-block;
  padding: 0.5rem 1rem;
  cursor: pointer;
  border-bottom: 2px solid transparent;
}

#tab1:checked ~ .tab-labels label[for="tab1"],
#tab2:checked ~ .tab-labels label[for="tab2"] {
  border-bottom-color: #2563eb;
  font-weight: 600;
}
```

Extend it: add `prefers-reduced-motion` handling for the rotate transition, and confirm the whole component is fully keyboard-navigable (tab to a summary/label, press Enter/Space to activate) without touching JavaScript.

---

## Project 3: Full Responsive Layout Without a Framework

**Level:** Advanced | **Time:** 8-12 hours | **GitHub repo name:** `css-full-responsive-layout`

**What you build:** A complete, realistic page layout — sticky header, collapsible sidebar, main content area, footer — that adapts across mobile/tablet/desktop using Grid for structure, Flexbox for internal alignment, container queries for a reusable card component, and `@layer` to keep a small "design tokens" layer cleanly separated from component styles.

```css
@layer tokens, base, layout, components;

@layer tokens {
  :root {
    --sidebar-width: 240px;
    --header-height: 64px;
    --gap: 1rem;
  }
}

@layer layout {
  .app-shell {
    display: grid;
    grid-template-columns: var(--sidebar-width) 1fr;
    grid-template-rows: var(--header-height) 1fr;
    grid-template-areas:
      "sidebar header"
      "sidebar main";
    min-height: 100vh;
  }

  @media (max-width: 767px) {
    .app-shell {
      grid-template-columns: 1fr;
      grid-template-areas:
        "header"
        "main";
    }
    .sidebar { display: none; } /* replaced by a mobile drawer, toggled via a checkbox hack or minimal JS */
  }

  .header  { grid-area: header;  display: flex; align-items: center; padding: 0 var(--gap); position: sticky; top: 0; }
  .sidebar { grid-area: sidebar; }
  .main    { grid-area: main;    padding: var(--gap); }
}

@layer components {
  .card-container { container-type: inline-size; }

  @container (min-width: 400px) {
    .card { display: grid; grid-template-columns: 120px 1fr; }
  }
}
```

Extend it: run the finished page through DevTools' Performance panel while resizing the browser, and confirm no unexpected layout-shift entries appear during the sidebar's mobile/desktop breakpoint transition.
