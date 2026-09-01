# Next.js Quick Reference

**A note before using this page:** more than any other cheatsheet on this platform, treat every specific API/file/config name below as needing a live check against current Next.js docs before shipping it in real code — this technology's API surface has genuinely shifted paradigms before (see the Roadmap and Overview tabs), and a cheatsheet is exactly the format most likely to go stale silently.

```text
CONCEPTUAL MODEL (durable -- safe to rely on without re-checking)
------------------------------------------------------------------
File-system routing    -- a file's location in your project
                           determines its URL
Rendering strategies   -- ahead-of-time / per-request / client-side,
                           chosen per page based on freshness needs
Meta-framework          -- adds routing + rendering + build tooling
                           on top of plain React, which provides none
                           of that on its own
Two router paradigms    -- Pages Router (original) and App Router
                           (introduced later) both exist in real
                           codebases; know both exist, don't assume
                           only one ever has
```

```text
SCAFFOLDING & PROJECT SETUP
(needs verification -- exact current CLI command/flags)
------------------------------------------------------------------
npx create-next-app@latest my-app     # scaffold a new project
cd my-app && npm run dev              # start local dev server
npm run build                          # production build
npm run start                          # run the production build locally
```

```text
ROUTING (needs verification -- exact current file-naming convention
per router paradigm; the two paradigms use genuinely different
conventions, do not mix them)
------------------------------------------------------------------
A file's path within the routing directory maps to a URL segment.
Dynamic segments are parameterized (e.g. a product-detail page
keyed by an ID). Shared layouts wrap multiple routes without each
route re-implementing common chrome (nav, footer).
```

```jsx
// NAVIGATION (needs verification -- exact current component/hook name)
// Client-side navigation between pages avoids a full page reload,
// unlike a plain <a> tag -- the conceptual reason this exists is
// durable even though the exact API name has moved before.
```

```jsx
// DATA FETCHING (needs verification -- exact current API/caching
// semantics; this is one of the most version-volatile areas of
// the entire framework)
// Conceptual shape: request data on the server (avoiding a round
// trip from the browser), with the framework given control over
// whether/how the result is cached and later revalidated.
```

```bash
# ENVIRONMENT VARIABLES
# Server-only -- fine in server-only code, NEVER shipped to the client bundle
DATABASE_PASSWORD=secret123

# Deliberately client-exposed -- ONLY for values genuinely safe to be public
# (needs verification -- exact current client-exposed naming convention)
NEXT_PUBLIC_SOME_ID=abc123
```

```text
RENDERING STRATEGY DECISION (durable as a framework, tag the exact
API name per strategy -- needs verification)
------------------------------------------------------------------
Content barely changes / same for everyone -> ahead-of-time rendering
Content must reflect the current moment for every visitor -> per-request
Purely interactive, no SEO/first-paint need -> client-side rendering
```

```text
COMMON DEBUGGING CHECKLIST
------------------------------------------------------------------
Hydration mismatch          -> check for Date.now()/Math.random()/
                                window access directly during render
Stale data on a live page   -> check the page's rendering strategy
                                and revalidation config, don't assume
env var undefined client-side -> check server-only vs client-exposed
                                naming convention
Works locally, fails in CI  -> Node version drift, import path
                                casing, missing CI env vars
```
