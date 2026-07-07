# Stage 3 — Performance, SEO & Accessibility Audit

**Scope**: rendering strategy per route, caching, bundle size, image optimization, Core Web Vitals risks, metadata/OG/schema, sitemap/robots, WCAG basics, mobile responsiveness, loading/empty/error states.

**Context taken seriously**: this is a content/SEO-driven learning platform. Server-rendered, indexable content is treated as non-negotiable throughout — any content page that is client-rendered is flagged Critical, per your instruction, not just noted as a nice-to-have.

**Method**: ran an actual production build (`npm run build`) to get real route-by-route bundle sizes and rendering-mode data (not estimates), read the actual sitemap/robots/metadata/JSON-LD source, grepped for focus-style and image-alt patterns across the codebase.

---

## Finding 1 — Every one of 2,000+ content pages is client-rendered; it is also the single heaviest route on the site
**Severity: Critical**

This is the same underlying issue as Stage 1 Finding 8, examined here specifically through the SEO/CWV lens, with new hard evidence from an actual production build.

**Current implementation**: `app/academies/[academy]/[technology]/[section]/page.tsx` is a server component, but the actual lesson content is fetched and rendered entirely client-side inside `SectionContent.tsx` (`"use client"`, `useEffect` → `fetchContent()` → re-render). The server-rendered HTML for every one of these URLs contains a loading skeleton, not the lesson text.

**New evidence from the production build** (`npm run build` output):

```
Route (app)                                         Size  First Load JS
├ ƒ /academies/[academy]/[technology]/[section]  75.7 kB         244 kB
```

This route ships **75.7 kB of route-specific JS and 244 kB First Load JS — more than double every other route on the site** (baseline shared JS is 103 kB; most routes add only a few hundred bytes to a few kB on top of that). The single most content-heavy, highest-page-count route on the platform is also its heaviest client-side payload, for what should architecturally be the simplest possible page: fetch a static markdown file and render it.

**Why it's Critical, specifically for SEO**: search engine crawlers that don't execute JavaScript (or that time out before hydration completes) index a loading skeleton, not the lesson. For a platform whose primary acquisition channel is organic search on thousands of specific technology/topic pages, this means the core content — the entire reason those pages would rank — may not be visible to the crawler that's supposed to index it. This compounds with Finding 2 below (sitemap gaps): pages that are both missing from the sitemap *and* invisible to non-JS crawling on top of that are effectively undiscoverable through organic search by two independent mechanisms.

**Business impact**: this is the platform's core content-discovery channel, structurally undermined for its single largest content surface.

**Recommended fix**: unchanged from Stage 1 Finding 8 — move the `fetchContent()` call into the server component (it already has `academy`/`technology`/`section` as params) and pass the resolved markdown string into `SectionContent` as an `initialContent` prop, keeping AI-generation interactivity as a client-only island. This also directly reduces the 75.7 kB route bundle, since the content-fetching logic (registry lookup call flow) can move server-side.

**Breaking or non-breaking**: non-breaking to rendered output.

**Migration strategy / rollback**: as described in Stage 1 Finding 8 — single prop-passing change, easily revertible.

---

## Finding 2 — Every route in the app is dynamically server-rendered on every request, including fully static marketing pages — likely due to `ClerkProvider` in the root layout
**Severity: High**

**New evidence from the production build**: the route table marks every single page `ƒ` (Dynamic — server-rendered on demand at request time) **except** `/_not-found`, `/robots.txt`, and `/sitemap.xml`, which are `○` (Static). This includes `/about`, `/privacy`, `/terms`, `/contact` — pages with zero personalization, zero auth-dependent content, and content that essentially never changes between requests.

**Likely root cause**: `app/layout.tsx` wraps the entire application in `<ClerkProvider>` at the root. Clerk's App Router integration reads auth state (cookies/headers) during server rendering to hydrate its client-side auth context correctly — a well-documented side effect of this pattern is that it forces Next.js to treat the entire tree as dynamic, since the root layout is shared by literally every route. A page doesn't need to call `auth()` or `currentUser()` itself to be swept into this — being nested under a layout that reads request-specific data is enough.

**Why it's a problem**: static pages that could be generated once at build time and served instantly from Cloudflare's CDN edge cache are instead re-rendered server-side on every single request. This adds unnecessary edge compute cost (billed) and avoidable latency (a static file served from cache is faster than any server render, however fast) to pages that never needed to be dynamic in the first place — `/about`, `/privacy`, `/terms` have no reason to ever differ between two visitors.

**Business impact**: slower Time to First Byte than necessary on the site's simplest pages, and higher Cloudflare Workers/Pages Functions invocation volume (and cost) than the actual content requires — paying the "personalization tax" on pages with no personalization.

**Technical impact**: this is an architectural tension between "Clerk wraps everything for auth convenience" and "static generation for pages that don't need auth" — not a one-line fix, since it affects how deeply `ClerkProvider` sits in the tree.

**Recommended fix**: split fully static, auth-independent pages (`/about`, `/privacy`, `/terms`, `/contact`, and similar) into a route group with their own layout that does **not** nest `<ClerkProvider>` — Clerk's components (sign-in button, user button, etc.) aren't needed on these pages anyway if they don't currently render any Clerk UI. If they do need the navbar's sign-in-aware UI, that specific need should be re-evaluated: does `/privacy` really need to show a personalized nav state, or would a simplified static nav there be an acceptable trade for real static generation?

**Breaking or non-breaking**: **Breaking-ish** — requires restructuring the route tree into route groups with different layouts, and needs careful checking that any Clerk-dependent UI (sign-in button in the navbar) still renders correctly on the pages that move out from under `ClerkProvider`, or is deliberately simplified for that subset.

**Migration strategy**: start with the lowest-risk pages first (`/privacy`, `/terms` — content that plausibly never needs any auth-aware UI at all), confirm they build as `○ Static` in the next production build, then evaluate `/about`/`/contact` similarly. Leave app-shell pages (dashboard, admin, onboarding, academy content) under the Clerk-wrapped layout, since those genuinely need auth state.

**Rollback strategy**: move the pages back under the root layout; no data implications, purely a route-tree structural change.

---

## Finding 3 — Sitemap is a separately hand-maintained slug list that has already drifted from the real technology catalog; confirmed real content pages are missing
**Severity: High**

**Current implementation**: `app/sitemap.ts` defines its own hardcoded `techTechs`, `nonTechTechs`, `roadmapSlugs`, `certIds`, and `blogSlugs` arrays — completely independent of `lib/data/academies.ts` (the real technology catalog), `lib/data/navigation.ts` (the real roadmap list), or the real certifications/blog data sources.

**Verified drift** (direct diff of every technology slug in `academies.ts` against every string literal in `sitemap.ts`): **68 slugs in the real catalog don't appear anywhere in the sitemap source.** Most of these are domain-level grouping slugs that aren't standalone routes (e.g. `containers`, `monitoring`, `foundations`) and don't need sitemap entries — but a clear, confirmed subset are **real, live, content-bearing technology pages missing from the sitemap**, including: `jee-advanced`, `jee-main`, `neet-mocktests`, `quant-aptitude`, `reasoning-ability`, `english-language`, `banking-awareness`, `upsc-ethics`, `upsc-interview`, `civil-law-procedure`, `legal-career-growth`, `ca-articleship`, `ca-final`, `credit-analysis`, `python-for-ai`, `cloud-databases`, `architecture-patterns`, `networking-security`, `chaos-engineering`, `capacity-planning`, `anatomy-physiology`, `medical-terminology`, `bchhc-prep`, `cloud-data-warehouses`.

**This is not a one-off oversight — it's a live, ongoing pattern**: several of the missing slugs (`jee-main`, `quant-aptitude`, `reasoning-ability`, `english-language`, `banking-awareness`) are technologies added *during this very engagement* while fixing roadmap routing — proof that adding a real, live page to the catalog does not automatically (or by any enforced process) get it into the sitemap. This is the exact same class of problem as Stage 1 Finding 2 (content registry hand-maintained, already drifted) and Finding 7 (`steps[]`/`techLinks[]` linked only by convention) — a third independent instance of "two files describing the same thing, kept in sync only by a human remembering to update both."

**Business impact**: confirmed-real, live pages are never submitted to Google via the sitemap, which meaningfully hurts their discovery priority and crawl frequency — the sitemap is one of the primary signals search engines use to find and prioritize crawling new/updated pages, especially on a large site where not every page has strong internal link equity pointing to it.

**Recommended fix**: generate the sitemap programmatically from `lib/data/academies.ts` (`getAllTechnologies()` already exists and returns exactly this data), `lib/data/navigation.ts`'s `roadmaps` array, and the real certifications/blog data sources — the same fix pattern as Stage 1 Finding 2's registry-generator recommendation. This makes "sitemap missing a real page" structurally impossible going forward, rather than something to remember to update by hand.

**Breaking or non-breaking**: non-breaking — `sitemap.ts`'s output shape/contract doesn't change, only how the entries are sourced.

**Migration strategy**: write the generator reading from the existing data-layer exports, diff its output against the current hand-written file to confirm no unintended entries change/disappear, then replace.

**Rollback strategy**: single-file revert.

---

## Finding 4 — Structured data components exist for rich content types but are only used site-wide, never on the content pages they were built for
**Severity: Medium**

**Current implementation**: `components/seo/JsonLd.tsx` exports four components: `WebSiteJsonLd`, `OrganizationJsonLd`, `CourseJsonLd`, `BreadcrumbJsonLd`. Only the first two are actually used anywhere (`app/layout.tsx`, site-wide, once). **`CourseJsonLd` and `BreadcrumbJsonLd` are fully built, exported, and never imported by any page** — confirmed via a repo-wide search.

**Why it's a problem**: `CourseJsonLd` is exactly the schema type search engines use to render rich result treatments (ratings, provider, structured course info) for educational content — the single most relevant schema type for this platform's core content, built and then not wired to a single one of the 2,000+ technology pages it was clearly intended for. `BreadcrumbJsonLd` similarly would improve how search results display the page's location in the site hierarchy (`Home > Academies > DevOps > Kubernetes > Fundamentals`), a well-supported rich-result feature — also unused everywhere.

**Business impact**: a real, already-built SEO enhancement (not something that needs to be designed or coded from scratch) is sitting unused, missing an opportunity for improved search-result presentation across the site's entire content catalog.

**Recommended fix**: wire `CourseJsonLd` into `app/academies/[academy]/[technology]/[section]/page.tsx`'s existing `generateMetadata` / page render (it already computes `tech.name`, `tech.description`, and the canonical URL needed) and `BreadcrumbJsonLd` using the same breadcrumb trail already rendered visibly on that page (`page.tsx:208-218`) — the breadcrumb *data* already exists in the component, it's just not also emitted as JSON-LD alongside the visible nav.

**Breaking or non-breaking**: non-breaking — purely additive `<script type="application/ld+json">` output.

**Migration strategy**: add both components to the one shared section-page template; since it's a single template serving all 2,000+ URLs, this is a one-file change with platform-wide reach.

**Rollback strategy**: remove the two component calls; no data changes.

---

## Finding 5 — Focus indicator removed on 10 form inputs with no replacement — WCAG 2.4.7 (Focus Visible) gap
**Severity: Medium**

**Current implementation**: `outline: "none"` (or `outline: 0`) is set inline on 10 `<input>`/`<textarea>` elements across the codebase — every site search box (`components/layout/Navbar.tsx:93, 152`), the AI assistant chat input (`app/ai-assistant/AIAssistantClient.tsx:210`, `app/ai-assistant/page.tsx:101`), the global search page (`app/search/page.tsx:96`), blog comment input (`components/blog/BlogReactions.tsx:65`), newsletter signup (`components/growth/NewsletterSignup.tsx:44`), and the labs code editor (`components/tech/LabEnvironment.tsx:219`). No `:focus` or `:focus-visible` rule exists anywhere in `app/globals.css` to replace the removed default.

**Why it's a problem**: a keyboard-only user tabbing to any of these inputs gets **no visible indication** that the field now has focus — the browser's native focus ring (the thing `outline: none` removes) was the only visual signal, and nothing replaces it. This is a direct WCAG 2.1 Success Criterion 2.4.7 (Focus Visible, Level AA) failure on some of the site's most-used interactive elements — the global search box appears in the navbar on every single page.

**Business impact**: keyboard-only users (motor-impairment users, power users, and anyone whose mouse/trackpad is temporarily unavailable) cannot visually confirm which field they're about to type into on the site's most common interaction points.

**Technical impact**: none of these inputs currently have any focus styling at all (not just "not obvious" — genuinely absent), since inline styles can't express a `:focus` pseudo-class, and nothing replaces it elsewhere.

**Recommended fix**: add a `:focus-visible` rule to `app/globals.css` targeting these input patterns (e.g. a shared class name applied to all of them, or a global `input:focus-visible, textarea:focus-visible { outline: 2px solid var(--accent); outline-offset: 2px; }` rule) — cheap, consistent, and matches the theme's existing CSS custom property pattern already used elsewhere.

**Breaking or non-breaking**: non-breaking, purely additive visual styling.

**Migration strategy**: one shared CSS rule covers all 10 instances at once, since they're all standard `input`/`textarea` elements — no per-file changes needed if scoped by element type rather than a class that would need adding everywhere.

**Rollback strategy**: remove the added CSS rule.

---

## Finding 6 — `/content/*.md` responses have no explicit cache-control policy, unlike every other static asset type
**Severity: Medium**

**Current implementation**: `next.config.ts`'s `headers()` function sets explicit `Cache-Control: public, max-age=31536000, immutable` for `/fonts/*`, `/_next/static/*`, and `*.webp` — but has no rule for `/content/*.md`, the 2,077 markdown files that every content page's `SectionContent.tsx` fetches client-side on every visit (per Finding 1). These fall back to Cloudflare's default static-asset caching behavior rather than an explicit, guaranteed policy.

**Why it's a problem**: these files change rarely (only when content is edited) but are fetched fresh, client-side, on every single content-page visit across the entire user base — the one asset type in this exact fetch path that would benefit most from aggressive caching has the least explicit caching policy of any static asset category in the config.

**Business impact**: unnecessary repeat network requests for content that's effectively static, adding avoidable latency to every content page's "real content appears" moment (which per Finding 1 already lags behind first paint).

**Recommended fix**: add a `Cache-Control` rule for `/content/(.*).md` — likely `public, max-age=3600, stale-while-revalidate=86400` rather than a full year/`immutable`, since content files *can* change without a URL change (unlike hashed `/_next/static/` assets), so a moderate max-age with revalidation is the safer choice here versus copying the `immutable` fonts/JS pattern verbatim.

**Breaking or non-breaking**: non-breaking, purely a caching-header addition.

**Migration strategy**: add the one `headers()` rule; verify content updates still propagate within the acceptable delay window before considering a longer max-age.

**Rollback strategy**: remove the rule; reverts to current default behavior.

---

## Finding 7 — Minor hygiene: stray backup file committed to git; robots.txt doesn't explicitly exclude private app routes
**Severity: Low**

- `components/layout/Navbar.tsx.bak` is git-tracked (confirmed via `git ls-files`) — a stale backup file sitting in the deployed repo. Harmless functionally (nothing imports a `.bak` file), but repo clutter that risks someone editing the wrong file by mistake. Recommend `git rm` it.
- `app/robots.ts` disallows `/api/` and `/_next/` but doesn't explicitly disallow `/dashboard`, `/admin`, `/onboarding` — these are already behind Clerk's sign-in redirect for unauthenticated crawlers (so they can't actually be indexed with real content), but explicitly excluding them is standard practice and saves a small amount of crawl budget being spent on redirect chains instead of real content.

**Recommended fix**: `git rm components/layout/Navbar.tsx.bak`; add `"/dashboard/", "/admin/", "/onboarding/"` to `robots.ts`'s `disallow` array.

**Breaking or non-breaking**: non-breaking.

---

## What was checked and found solid (no finding needed)

- **Root metadata**: title template, OpenGraph, Twitter card, icons (favicon/apple-touch/android-chrome), `robots: {index: true, follow: true}`, `manifest` — all present and correctly configured in `app/layout.tsx`.
- **Fonts**: self-hosted (`.woff2`, `font-display: swap`) — avoids the render-blocking Google Fonts DNS/request-chain penalty, a good CWV practice already in place.
- **Image usage**: minimal actual `<img>`/`next/image` usage site-wide (the design leans on emoji/icon fonts instead), and every instance found has correct `alt` text (including a deliberate empty `alt=""` on a genuinely decorative icon that's redundant with adjacent visible text — the *correct* use of empty alt, not a bug).
- **Viewport meta / `lang` attribute**: both correctly present in the live-rendered HTML (`<meta name="viewport" content="width=device-width, initial-scale=1">`, `<html lang="en">`).
- **Mobile responsiveness**: spot-checked — 14 `@media` queries in `globals.css` plus component-level responsive breakpoints in `Navbar.tsx`/`Footer.tsx`; no glaring gaps found in static analysis (this area has evidently already had iteration based on prior conversation about mobile nav layout).
- **Semantic landmarks**: `<header>`, `<nav>`, `<main>`/equivalent, `<footer>` are present in the layout/Navbar/Footer components.

---

## Summary table

| # | Finding | Severity |
|---|---|---|
| 1 | Every content page (2,000+) is client-rendered AND the heaviest bundle on the site (244 kB vs ~103-111 kB elsewhere) | **Critical** |
| 2 | Every route dynamically rendered on every request (likely `ClerkProvider` in root layout) — even static marketing pages | High |
| 3 | Sitemap hand-maintained, already drifted — confirmed real pages missing, including some added this engagement | High |
| 4 | `CourseJsonLd`/`BreadcrumbJsonLd` built but never used on content pages | Medium |
| 5 | Focus indicator removed on 10 form inputs, no replacement — WCAG 2.4.7 gap | Medium |
| 6 | No explicit cache policy for `/content/*.md`, unlike every other static asset type | Medium |
| 7 | Stray `.bak` file committed; robots.txt doesn't exclude private routes | Low |

**Recommended order of attack**: 1 (Critical, and the fix also directly helps 2's bundle-size angle) → 3 (cheap, high-value, same generator pattern as Stage 1 Finding 2 — consider doing both together) → 2 (higher effort, plan carefully) → 5 (cheap, one CSS rule) → 6 (cheap, one config rule) → 4 → 7 (whenever convenient).
