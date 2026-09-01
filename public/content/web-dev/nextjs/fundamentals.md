# Next.js — Fundamentals

## 1. File-System Routing (the core idea)

The single most important concept in Next.js: **where a file sits in your project determines what URL serves it.** You don't hand-write a routing table mapping URLs to components the way you might with a standalone router library — you create a file in the right place, and the framework wires up the route for you.

```text
# Conceptually:
a route-directory/about/(a page file)   ->  yoursite.com/about
a route-directory/blog/(a page file)    ->  yoursite.com/blog
```

*(needs verification — the exact directory name, exact page-file naming convention, and exact nesting rules are Next.js API surface that has changed across major versions; confirm against current Next.js docs before treating any specific file name as fixed)*

This is the same "a file path maps to a URL" idea used by static file servers generally — Next.js just extends it to full React pages with data and rendering behavior attached.

## 2. Pages and Layouts

A **page** is the component rendered for a specific route. A **layout** is UI shared across multiple pages (a navbar, a footer, a sidebar) without each page having to redeclare it — you define the shared structure once, and Next.js composes it around whichever page actually matched the current URL.

```conceptgrid
{
  "boxes": [
    { "title": "Page", "description": "The unique content for one specific route", "color": "blue" },
    { "title": "Layout", "description": "Shared UI wrapped around multiple pages -- defined once, reused automatically", "color": "purple" },
    { "title": "Nesting", "description": "Layouts can nest -- an outer site-wide layout, an inner section-specific layout, etc.", "color": "amber" },
    { "title": "Why it matters", "description": "Avoids copy-pasting the same navbar/footer JSX into every single page component", "color": "green" }
  ]
}
```

*(needs verification — exact current file convention for declaring a layout, and exact nesting behavior; confirm against current Next.js docs)*

## 3. Client vs. Server Rendering — the distinction, not the API

Every piece of UI in a Next.js app is, at some level, either rendered **on the server** (HTML generated before it reaches the browser) or **on the client** (rendered by JavaScript running in the browser). This distinction existed in web development long before Next.js — Next.js's contribution is making this an explicit, per-component/per-page choice rather than an all-or-nothing decision for your whole app.

- **Server-rendered** content reaches the browser already formed — generally better for first-paint speed and for content that needs to be reliably visible to search engines.
- **Client-rendered** content needs JavaScript to run before it appears — generally necessary for content that depends on interactivity happening after the page loads (a live-updating value, something that reacts to the specific browser it's running in).

*(needs verification — the exact mechanism Next.js currently uses to mark a piece of UI as server- vs. client-rendered; this has changed across versions and is one of the most volatile parts of the entire framework)*

## 4. Static vs. Dynamic Rendering — the concept

Separately from client/server, there's a question of **when** server-rendering work happens:

- **Ahead of time** — the HTML is generated once (e.g. at build time) and the same output is served to every visitor until it's deliberately refreshed.
- **Per request** — the HTML is generated fresh, on the server, every single time someone requests that page.

A blog post that rarely changes is a natural fit for the first; a page showing "your current account balance" is a natural fit for the second. This tradeoff is covered in depth in the Advanced tab — for now, just recognize that it's a real, deliberate choice a Next.js developer makes per page, not something the framework picks for you silently. *(needs verification — exact current API names for choosing between these)*

## 5. Basic Data Fetching

Getting data (from a database, an external API) into a page is a core Next.js concern, since — unlike plain React running entirely in the browser — a Next.js page can fetch data *before* it's ever sent to the browser, as part of server-rendering it.

```jsx
// Conceptual shape -- fetching data before a page renders, so the
// data is already present in the HTML the browser receives, rather
// than showing a loading spinner and fetching after the fact.
// (needs verification -- exact current data-fetching API/convention;
// this is one of the areas that has changed most across versions)
async function Page() {
  const data = await getSomeData();
  return <div>{data.title}</div>;
}
```

## 6. Linking Between Pages

Navigating between pages inside a Next.js app should avoid a full browser page reload — the framework provides a navigation mechanism that swaps content client-side while still producing a real, correct URL that works with the browser's back button, bookmarking, and direct visits.

```jsx
// (needs verification -- exact current navigation component/API name)
<Link href="/about">About</Link>
```

Contrast this with a plain `<a href="/about">` tag, which *would* work but triggers a full page reload — losing the speed benefit of client-side navigation that the framework's own navigation mechanism provides.

## 7. Image and Font Optimization (as a concept)

Unoptimized images and web fonts are two of the most common real causes of slow page loads. Next.js ships built-in handling for both — automatically serving appropriately-sized images and applying sane font-loading defaults — rather than leaving this entirely to the developer to hand-roll on every project.

```jsx
// (needs verification -- exact current image/font optimization APIs;
// both have changed across versions)
```

This is a concrete example of what "batteries included" (from the Overview tab) actually means in practice: a real performance concern handled by the framework instead of being redone, inconsistently, by every team on every project.

## Try It (2 Minutes)

In your scaffolded project (see Installation tab), create a second page at a new route (e.g. one that would resolve to `/about`) and link to it from your home page using the framework's navigation mechanism rather than a plain `<a>` tag. Click between them and notice the URL still changes correctly, but the page doesn't visibly flash/reload the way a full page navigation would. That's client-side navigation — real URLs, without the full-reload cost.
