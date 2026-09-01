# Next.js — Intermediate

## 1. Dynamic Routes

A real app usually needs routes parameterized by an ID or slug — a product page, a user profile — rather than a fixed URL per page. File-system routing supports this via a special file/folder naming convention that captures part of the URL as a variable your page can read.

```text
# Conceptually: a folder/file name wrapped in a special syntax
# captures that URL segment as a parameter
a route directory named for a dynamic segment -> yoursite.com/products/123
                                                  (the "123" is captured)
```

*(needs verification — exact current dynamic-segment naming syntax; confirm against current Next.js docs)*

```jsx
// Conceptual shape of reading a dynamic route parameter
// (needs verification -- exact current API/prop name for accessing it)
function ProductPage({ params }) {
  return <div>Product {params.id}</div>;
}
```

## 2. Nested Layouts

Layouts (introduced in Fundamentals) can nest — a site-wide layout wrapping everything, with a section-specific layout (e.g. a dashboard sidebar) wrapping only the pages under that section. Each layer only re-renders when something inside its own scope changes, not the whole tree.

```flow
{
  "layout": "stack",
  "steps": [
    { "label": "Root layout", "sublabel": "Wraps the entire app -- navbar, global providers", "color": "blue" },
    { "label": "Section layout", "sublabel": "Wraps only one section, e.g. a dashboard area", "color": "purple" },
    { "label": "Page", "sublabel": "The specific route's unique content", "color": "green" }
  ]
}
```

*(needs verification — exact current nested-layout file convention)*

## 3. Loading and Error States (as a concept)

Two states every real route needs to handle gracefully: what shows while data is still being fetched, and what shows if something goes wrong while rendering that route. Handling both per-route (rather than one single global spinner/error page for the entire app) gives a much better experience — the rest of the app around a slow/broken section can keep working.

*(needs verification — exact current file conventions for declaring a per-route loading state and a per-route error boundary; this is genuinely version-specific)*

## 4. Environment Variables

Server-only secrets (a database password, a private API key) must never end up in code that ships to the browser — anyone can open browser dev tools and read the shipped JavaScript. Next.js distinguishes environment variables meant to stay server-only from ones deliberately marked safe to expose to the client, typically via a naming convention.

```bash
# .env.local (never commit this file)
DATABASE_PASSWORD=secret123        # server-only by default
NEXT_PUBLIC_ANALYTICS_ID=abc123    # deliberately exposed to the browser
```

*(needs verification — exact current naming convention for client-exposed variables; the general "server-only by default, explicit opt-in to expose" principle is durable, but the exact prefix/syntax is framework API surface)*

## 5. API Routes / Route Handlers (as a concept)

You can define server-only endpoints inside the same Next.js project as your pages — useful for talking to a database with credentials that can't live in the browser, or proxying a third-party API call that needs a private key. This removes the need for a fully separate backend service for many apps.

```jsx
// Conceptual shape of a server-only endpoint defined inside the project
// (needs verification -- exact current file convention and export
// pattern for defining one; this has changed across versions)
export async function GET(request) {
  const data = await fetchFromDatabase();
  return Response.json(data);
}
```

## 6. Middleware (as a concept)

Some logic — an auth check, a redirect, locale detection — needs to run centrally, before a request reaches its matched route, rather than being duplicated inside every individual page. Middleware is code that intercepts requests at that point.

```flow
{
  "layout": "flow",
  "steps": [
    { "label": "Incoming request", "color": "blue" },
    { "label": "Middleware runs", "sublabel": "Can redirect, rewrite, or allow through", "color": "amber" },
    { "label": "Matched route's page runs", "color": "green" }
  ]
}
```

*(needs verification — exact current middleware file convention and API; confirm against current Next.js docs)*

## 7. Deployment Basics (as a concept)

A Next.js app's build output needs to run somewhere that understands its rendering strategies (some pages ahead-of-time, some per-request) — this is different from deploying a plain static site, where every page is just a fixed file. Most hosting targets built for Next.js handle this distinction for you; a generic static file host may not, depending on which rendering strategies your app actually uses. *(needs verification — exact current hosting/deployment requirements and options, since this is provider- and version-specific)*

## Try It (2 Minutes)

In your scaffolded project, create a dynamic route for something like a product ID (see the dynamic-segment convention above — verify the exact syntax against current docs first), and read the captured parameter inside the page. Visit two different URLs matching that pattern (e.g. product `1` and product `2`) and confirm the same page component renders different content based purely on the URL — that's the whole point of a dynamic route.
