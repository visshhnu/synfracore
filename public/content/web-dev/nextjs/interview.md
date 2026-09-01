# Next.js — Interview Questions

**Q: What does a meta-framework like Next.js add on top of plain React?**

Plain React handles rendering components and managing state — it makes no decisions about routing, server-rendering, or build tooling. A meta-framework adds those production concerns as a coherent package: file-system-based routing, a choice of rendering strategies, and integrated build tooling, so a team isn't separately assembling and maintaining compatibility between a router, an SSR setup, and a bundler picked independently.

---

**Q: Why does rendering-strategy choice matter so much for SEO and performance?**

Search engine crawlers and social-media link previews have historically had much better luck reading fully-formed HTML than executing JavaScript to discover content — so content that needs to be reliably indexable is a strong argument for a server-rendering strategy over pure client-side rendering. Separately, ahead-of-time-rendered content is typically the fastest to serve (no per-request work), while per-request rendering guarantees freshness at the cost of speed. Picking the wrong one for a given page's actual needs shows up as either stale data or unnecessarily slow load times.

---

**Q: Explain the historical Pages Router to App Router shift. Why does knowing this matter, even if it's "old news"?**

This is real, documented history, not speculation: Next.js originally shipped with the Pages Router (a directory where each file became a route, using per-page data-fetching functions), and later introduced the App Router as a new paradigm alongside it, with a different directory convention and data-fetching model. It matters because real codebases and real tutorials span both eras — encountering an older codebase using the original paradigm, or a newer one using the App Router, without knowing both exist is a real, avoidable source of confusion. *(needs verification — which paradigm is the current default/recommended starting point for a new project; recheck current Next.js docs)*

---

**Q: What is a route handler / API route, conceptually, and when would you use one?**

It's a server-only endpoint defined inside the same Next.js project as your pages — useful when you need to talk to a database or a third-party API using credentials that can't safely live in browser-shipped JavaScript. It removes the need for a fully separate backend service for many apps, though a large backend with its own scaling/domain concerns may still warrant a dedicated service. *(needs verification — exact current file convention/API for defining one)*

---

**Q: What's the actual purpose of built-in image and font optimization, beyond convenience?**

Unoptimized images and web fonts are two of the most common, highest-impact causes of slow page loads and poor Core Web Vitals scores. Doing this correctly by hand — responsive image sizing, lazy loading, avoiding layout shift, a sound font-loading strategy — is fiddly and easy to skip under deadline pressure. Building it into the framework turns a manually-redone performance task into a consistent default. *(needs verification — exact current image/font optimization APIs)*

---

**Q: How do server-only and client-exposed environment variables differ, and why does the distinction matter?**

A secret shipped into client-side JavaScript is readable by anyone who opens browser dev tools — a real, common security mistake. Next.js keeps environment variables server-only by default, requiring a deliberate, explicit marker (typically a naming convention) to expose a specific variable to the client bundle. This "opt-in to expose, not opt-in to hide" default is what prevents accidental secret leaks. *(needs verification — exact current naming convention)*

---

**Q: What is middleware, and why run logic there instead of inside each page?**

Middleware runs centrally, intercepting requests before they reach their matched route — useful for logic that would otherwise need to be duplicated in every page (an auth check, a redirect, locale detection). Centralizing it means the rule is applied once, consistently, rather than copy-pasted (and potentially drifting) across many individual pages. *(needs verification — exact current middleware API/file convention)*

---

**Q: What's the difference between an ahead-of-time-rendered page and a per-request-rendered page, in terms of what actually happens on the server?**

An ahead-of-time-rendered page's HTML is generated once (e.g. at build time) and the same output is served to every visitor until deliberately refreshed — near-zero per-visit server work. A per-request-rendered page runs its rendering work fresh, on the server, for every single request — guarantees current data, but real, repeated server cost. The right choice depends entirely on how fresh a given page's content genuinely needs to be. *(needs verification — exact current API names for each)*

---

**Q: Why might a page that "worked fine locally" behave differently once deployed, specifically around caching?**

Ahead-of-time rendering and revalidation behavior can differ between a local dev server (which often re-renders freely on every request in development mode) and a production deployment (which may serve genuinely cached content until a revalidation condition is met). A developer testing only locally can miss a caching bug that only shows up once real caching is actually in effect in production. See the Troubleshooting tab for a concrete version of this. *(needs verification — exact current dev-vs-production caching behavior)*

---

**Q: Is Next.js a replacement for React, or something you use alongside it?**

Alongside it, not a replacement — every Next.js page is still built from React components using the same component model, props, and hooks a plain React app would use. Next.js adds routing, rendering-strategy choices, and build tooling on top; it doesn't replace React's core rendering model underneath.
