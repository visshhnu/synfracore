# Next.js

> **The production framework built on top of React.**

**Category:** Frontend / Web Development
**Learning Path:** What → Why → Learning Modules → Production Example → Interview Prep

**Before you start:** you need solid React — components, props, state, and hooks (`useState`, `useEffect`) should already feel comfortable, not brand-new. Next.js is not a separate language or a replacement for React; it's a layer built directly on top of it, and this course does not re-teach what a component or a hook is. If any of that still feels shaky, finish this platform's own React technology first. See the **Prerequisites** tab for the full detail.

---

## What is Next.js?

Think of React as a box of building blocks — components, state, the rendering engine itself — genuinely powerful, but deliberately unopinionated about everything *around* the blocks. If you start a real application with plain React, you still have to decide, yourself, how a URL becomes a page (routing), how your code gets bundled for the browser (build tooling), and whether a given page should be rendered ahead of time, on a server per-request, or entirely in the browser (rendering strategy). Next.js is the pre-built construction kit that ships with the foundation, wiring, and plumbing already decided for you — file-system-based routing, a build pipeline, and a set of rendering-strategy choices — so you're assembling a house, not first inventing bricks.

Technically: Next.js is a **meta-framework** — a framework built on top of another framework/library (React, in this case) that adds the production concerns React deliberately leaves out: routing derived from your project's file structure, multiple rendering strategies (deciding per-page or per-request how much work happens ahead of time vs. at request time vs. in the browser), and integrated build/bundling tooling. None of this replaces React's component model — a Next.js page is still built out of React components, props, and (where applicable) hooks.

A request arriving at a Next.js application moves through routing and a rendering-strategy decision before a response is produced:

```flow
{
  "layout": "flow",
  "steps": [
    { "label": "Incoming request", "sublabel": "A URL is requested", "color": "blue" },
    { "label": "File-system routing", "sublabel": "URL matched to a route in your project structure", "color": "purple" },
    { "label": "Rendering-strategy decision", "sublabel": "Pre-built ahead of time? Rendered per-request? Sent to the browser to render?", "color": "amber" },
    { "label": "Response", "sublabel": "HTML (and/or data) sent back", "color": "green" }
  ]
}
```

*(needs verification — the exact mechanics of file-system routing and the specific rendering-strategy options/names are Next.js API surface that changes across major versions; recheck against current Next.js docs before treating any specific convention as current)*

## Why Next.js?

Plain React solves rendering and state — it does not solve routing, server-rendering, or build tooling. Left alone, a team building a real production app has to separately choose and wire together a router, a server-rendering setup (if SEO or fast first-paint matters), and a bundler/build pipeline — three separate decisions, three separate sets of documentation, three separate places for the pieces to drift out of sync with each other. Next.js is the "batteries included" answer: one framework that makes these decisions together, coherently, so a team building a production web app isn't reinventing that plumbing from scratch on every project.

**Next.js has changed its core paradigm before — this is real history, not a caveat.** Next.js originally shipped with what's now referred to as the **Pages Router**: a `pages/` directory where each file became a route, with data-fetching functions attached per-page. Later, Next.js introduced the **App Router** as a new paradigm alongside it — a different directory convention and a different data-fetching model built around React's newer server-rendering capabilities. Both paradigms are real and both exist in real codebases and real tutorials you'll encounter — a five-year-old Next.js codebase and a brand-new one can look structurally quite different. This course teaches the concepts that transfer across both (routing-from-files as an idea, rendering-strategy tradeoffs, the value of a meta-framework) rather than teaching one specific router's exact API surface as if it were the only one that ever existed or ever will. *(needs verification — which paradigm is the current default/recommended approach, and what the current version actually is, both change; recheck against current Next.js docs before treating "current best practice" as fixed)*

---

## Learning Modules

### Module 01 — Routing & Project Structure
*How a file in your project becomes a URL, and the two paradigms you'll encounter in real codebases*

**Topics covered:**

- File-system routing as a concept (a file's location determines its URL) — 🟢 Beginner
- The historical Pages Router vs. App Router distinction, and why both still matter — 🟡 Intermediate *(needs verification — exact current directory/file-naming conventions for each, recheck against current Next.js docs)*
- Shared layouts and nested routing structure — 🟡 Intermediate *(needs verification — specific layout file conventions)*
- Linking between pages without a full page reload — 🟢 Beginner *(needs verification — the specific navigation component/API name)*

### Module 02 — Rendering Strategies
*Deciding, per page, how much work happens ahead of time vs. at request time vs. in the browser*

Every page in a Next.js app makes (explicitly or by default) a rendering-strategy choice: build it once ahead of time and serve the same output to everyone, rebuild it fresh on every request, or hand it to the browser to render client-side. This tradeoff — freshness vs. speed vs. server load — is durable and framework-agnostic in concept, even though the exact APIs Next.js exposes for choosing a strategy have changed across versions.

```conceptgrid
{
  "boxes": [
    { "title": "Rendered ahead of time", "description": "Built once at build time, served identically to everyone -- fastest, but data can go stale until the next build/revalidation", "color": "green" },
    { "title": "Rendered per request", "description": "Built fresh on the server for every request -- always current data, but slower and more server load per visit", "color": "amber" },
    { "title": "Rendered in the browser", "description": "The server sends minimal HTML; the browser does the rendering work with JavaScript -- flexible, but weaker for SEO and first paint", "color": "blue" },
    { "title": "The framework's job", "description": "Next.js lets you choose per-page/per-route rather than committing your whole app to one strategy", "color": "purple" }
  ]
}
```

**Topics covered:**

- Rendering-strategy tradeoffs as a concept (speed vs. freshness vs. SEO) — 🟢 Beginner
- Static/ahead-of-time rendering — 🟡 Intermediate *(needs verification — exact current API name for this strategy)*
- Server-per-request rendering — 🟡 Intermediate *(needs verification — exact current API name for this strategy)*
- Client-side rendering within a Next.js app — 🟡 Intermediate
- Revalidation / re-fetching stale ahead-of-time content — 🔴 Advanced *(needs verification — exact current revalidation API)*

### Module 03 — Data Fetching & API Routes
*Getting data into a page, and exposing your own backend endpoints from within the same project*

**Topics covered:**

- Fetching data for a page/route as a concept — 🟢 Beginner *(needs verification — the exact current data-fetching API/convention)*
- Server-side vs. client-side data fetching, and when each is appropriate — 🟡 Intermediate
- Building an API endpoint inside a Next.js project (a "route handler"/API route) — 🟡 Intermediate *(needs verification — exact current file convention and naming for this feature)*
- Environment variables and keeping server-only secrets off the client bundle — 🔴 Advanced

---

## Production Example

```text
# Production Runbook — "this page is rendering noticeably slower
# than similar pages in the same app"

# Step 1: Identify which rendering strategy the slow page is
# actually using -- is it rebuilt ahead of time, rendered fresh
# per request, or rendered in the browser? A page doing real work
# (a slow database query, an external API call) on every single
# request will be slower than one that only does that work once
# ahead of time and reuses the result.
# (needs verification -- how to inspect/confirm a given page's
# active rendering strategy in the current version's tooling)

# Step 2: Ask whether the content actually NEEDS to be fresh on
# every request. A lot of "render per request" choices are made
# out of caution, not because the underlying data actually changes
# that often -- content that only changes a few times a day is
# usually a better fit for ahead-of-time rendering with periodic
# revalidation than for per-request rendering.

# Step 3: If it does need genuinely fresh data, profile what's
# slow about the per-request work itself -- an unindexed database
# query or a slow upstream API call is a completely different fix
# (index the query, cache the upstream call) than a rendering-
# strategy problem.

# Step 4: Switch strategy or add caching/revalidation as
# appropriate, then re-measure actual response times -- don't
# assume the fix worked without confirming it.
# (needs verification -- exact current caching/revalidation APIs)

# Step 5: Prevention -- default to the least "always fresh, always
# expensive" strategy that the content's actual freshness
# requirements allow, rather than defaulting to per-request
# rendering everywhere out of caution.
```

## Interview Prep

**PSR Formula:** Answer every question: **Problem → Solution → Result**. 45-90 seconds max.

### Common Interview Questions

**Q1. What does Next.js add on top of plain React?**

**A:** **Problem:** plain React only renders components and manages state — it has no opinion on routing, server-rendering, or build tooling, all of which a real production app needs. **Solution:** Next.js is a meta-framework that adds file-system-based routing, a choice of rendering strategies per page, and integrated build tooling on top of React's component model. **Result:** a team doesn't have to separately assemble a router, an SSR setup, and a bundler from scratch — Next.js makes those decisions coherently as one framework.

---

**Q2. Why does rendering-strategy choice actually matter for a real page?**

**A:** **Problem:** the same page rendered three different ways (ahead of time, per request, or in the browser) has genuinely different SEO, first-paint speed, and data-freshness characteristics — picking wrong has real user-facing consequences. **Solution:** content that rarely changes and benefits from speed (a marketing page, a blog post) is a strong fit for ahead-of-time rendering; content that must reflect the very latest state on every load (a live dashboard, a user's current cart) needs per-request or client-side rendering instead. **Result:** this tradeoff is the single most consequential decision in a Next.js page's design, and getting it wrong shows up as either stale data shown to users or unnecessarily slow pages.

---

**Q3. Next.js has had a major routing paradigm shift. What happened, and why does it matter to know this?**

**A:** **Problem:** Next.js originally shipped with the Pages Router (a `pages/` directory, one file per route) and later introduced the App Router as a new, different paradigm alongside it. **Solution:** knowing both exist — not just the newest one — matters because real codebases and real tutorials you'll encounter in the wild span both eras; assuming only one paradigm has ever existed leads to confusion reading an older (or newer) codebase. **Result:** this course deliberately teaches the durable concepts (file-based routing as an idea, rendering-strategy tradeoffs) that transfer across both, rather than treating either specific API surface as permanent. *(needs verification — which router is the current default/recommended starting point for a new project; recheck current Next.js docs)*

---

**Q4. What is a route handler / API route conceptually, and why would you use one instead of a separate backend?**

**A:** **Problem:** a frontend app frequently needs a small backend endpoint — to talk to a database with credentials that can't live in the browser, or to call a third-party API whose key must stay server-side. **Solution:** Next.js lets you define server-only endpoints inside the same project, colocated with your pages, rather than standing up an entirely separate backend service for simple cases. **Result:** for many apps this removes an entire separate deployment/service to maintain — though a genuinely large backend with its own scaling and domain concerns may still warrant a dedicated service. *(needs verification — exact current file convention/name for this feature)*

---

**Q5. Why do image and font optimization get built into the framework instead of being left to the developer?**

**A:** **Problem:** unoptimized images and web fonts are two of the most common, high-impact causes of slow page loads and poor Core Web Vitals scores, and doing this correctly by hand (responsive sizing, lazy loading, avoiding layout shift, font-loading strategy) is fiddly, easy to get wrong, and easy to skip under deadline pressure. **Solution:** Next.js ships built-in image and font handling that applies sane defaults automatically. **Result:** performance work that would otherwise be manually redone on every project, inconsistently, becomes a framework default instead. *(needs verification — exact current image/font optimization APIs)*

---

**Q6. What's the actual difference between server-rendering and client-rendering, and why does it matter for SEO?**

**A:** **Problem:** a search engine crawler (and some social-media link previews) historically has had much better luck reading fully-formed HTML than executing JavaScript to discover content. **Solution:** server-rendering (ahead of time or per request) sends already-populated HTML; client-rendering sends a near-empty shell that JavaScript fills in after load. **Result:** content that needs to be reliably indexable or need to render correctly with JS disabled/slow is a strong argument for a server-rendering strategy over pure client-rendering — this is a durable SEO/performance reason Next.js exists at all, independent of which specific API implements it in a given version.

---

**Q7. How do environment variables work differently on the server vs. the client in a framework like this?**

**A:** **Problem:** a secret (a database password, a private API key) accidentally exposed in client-side JavaScript is visible to anyone who opens the browser's dev tools — a real, common security mistake. **Solution:** Next.js distinguishes server-only environment variables from ones explicitly marked safe to expose to the browser, usually via a naming convention. **Result:** the discipline of deliberately marking what's client-safe (rather than everything being available everywhere by default) is what prevents secrets from silently leaking into a shipped JS bundle. *(needs verification — exact current naming convention for client-exposed environment variables)*

---

**Q8. What is middleware, conceptually, in a framework like Next.js?**

**A:** **Problem:** some logic (auth checks, redirects, locale detection) needs to run for many/all requests before a specific page's own code runs, and duplicating that logic in every single page is repetitive and error-prone. **Solution:** middleware is code that runs centrally, before requests reach their matched route, letting you apply a rule (redirect unauthenticated users, rewrite a URL) once instead of per-page. **Result:** this is a durable "intercept before routing finishes" concept, even as the exact API for defining it has evolved. *(needs verification — exact current middleware API and file convention)*

---

**Q9. Why would a team choose Next.js over assembling React with separate routing/SSR tools themselves?**

**A:** **Problem:** assembling a router, an SSR setup, and a build pipeline from separate, independently-versioned tools means keeping all of them compatible with each other over time — real, ongoing maintenance overhead. **Solution:** a meta-framework like Next.js ships these as one coherent, tested unit maintained together. **Result:** for most production teams this coherence outweighs the flexibility lost by not hand-picking every individual piece — which is exactly why Next.js is one of the most widely adopted ways to ship a real React application in production.

---

**Q10. What is your actual experience building something with Next.js?**

**A:** This is a genuinely personal question — answer with a real project using the Problem → Solution → Result structure: what you built, which rendering strategy you chose for which pages and why, and a real tradeoff or bug you diagnosed. Interviewers are listening for whether you've made a real rendering-strategy decision under real constraints, not recited definitions.

---

## Official Resources

- [Next.js Documentation](https://nextjs.org/docs)
- [nextjs.org — Learn](https://nextjs.org/learn)
- [Vercel — Next.js Blog](https://nextjs.org/blog) (release/version history)

*(needs verification — always confirm you're reading documentation for the version you're actually using; Next.js's docs site version-switches, and copying an example from the wrong version's docs is a common, avoidable source of bugs)*

## Try It (2 Minutes)

Scaffold a new Next.js project (see the **Installation** tab for the full command) and open the default home page file it generates. Change the visible text in it, save, and look at the running dev server in your browser.

```text
# after scaffolding and starting the dev server
# (needs verification -- exact scaffolding command and default file
# location, both change across versions -- see Installation tab)

# 1. Find the default home page file the scaffold generated
# 2. Change a visible piece of text in it
# 3. Save the file
# 4. Watch the browser update without a manual refresh
```

Notice what you *didn't* have to do: configure a router to make that page reachable at your site's root URL, or hand-write a build step to get your change into the browser. That's the "batteries included" value proposition in miniature — the routing and build tooling were already decided for you before you wrote a single line.
