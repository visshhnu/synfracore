# Stage 6 — Consolidated Roadmap

Synthesizes every finding from Stages 1–5 (`docs/audit/01-*.md` through `05-*.md`) into one sequenced, dependency-aware action plan. Findings already fixed during this engagement are recapped for a complete record, not repeated as open work. Severities are carried over unchanged from their originating stage.

---

## Already fixed this engagement (recap — no action needed)

| Finding | Stage | What was done |
|---|---|---|
| `/api/ai` fully open, unauthenticated, unmetered | 2, F1 (Critical) | Auth required, model/max_tokens pinned server-side, `AI_ASSISTANT_ENABLED` kill switch (defaults closed, zero cost), CORS locked to production origin |
| Sitemap hand-maintained, drifted (68 missing slugs) | 3, F3 (High) | Regenerated from `academies.ts`/`navigation.ts`/content registry as source of truth; verified 1,537 URLs, all previously-missing pages now present |
| `CourseJsonLd`/`BreadcrumbJsonLd` built but unused | 3, F4 (Medium) | Wired into the section-page template with real data; verified live rendering |
| Focus indicator removed on 10 inputs, no replacement | 3, F5 (Medium) | Global `:focus-visible` rule added using the existing `--accent` token |
| README.md wrong on deploy target and product scope | 5, F1 (Critical) | Corrected to Cloudflare Pages/wrangler instructions and verified counts (18 academies, 200+ technologies, 17 certifications) |
| Documented env vars incomplete, no `.env.example` | 5, F5 (Medium) | Added `.env.example` (10 vars) and synced `CLAUDE.md`'s list to match |

---

## In progress — installed but deliberately inert (decision recorded so it isn't lost)

**Error tracking (Stage 5 F3, High)**: `@sentry/nextjs` is installed and fully wired — `instrumentation.ts`, `instrumentation-client.ts`, `next.config.ts`'s `withSentryConfig` wrapper, and all 4 error boundaries (`global-error.tsx`, `dashboard`/`admin`/`onboarding` `error.tsx`) already call `Sentry.captureException` alongside their existing `console.error`. **`NEXT_PUBLIC_SENTRY_DSN` is deliberately left empty** (`.env.example`, `wrangler.toml`), which makes every `Sentry.init()` call a no-op — zero behavior change, zero cost, today.

**Why it's inert, not activated**: a full production build with Sentry installed showed a real bundle-size cost — shared JS 103 kB → 181 kB, middleware 90.8 kB → 177 kB — landing directly on top of Stage 3's already-flagged bundle-size findings (F1 Critical, F2 High). Decision made: **defer activation (fill in the DSN) until Phase 2 below lands**, specifically so the SSR fix (2.1) isn't measured against a baseline that already carries Sentry's weight, and so there's a clean before/after comparison once it does.

**To activate later**: create a Sentry project, add the real DSN to `.env.local` (dev) and the Cloudflare Pages dashboard / `wrangler.toml` (prod), redeploy. No code changes needed at that point — everything is already wired, only the DSN value flips it on.

---

## Phase 1 — Cheap, high-value, do next (no architectural risk)

These are all non-breaking, small, and either close a proven pain point or prevent one.

### 1.1 Wire `validate:roadmaps` into CI + `predeploy`
*Stage 1 F6 (High)* — Add a GitHub Actions workflow running `npm run validate:roadmaps`, `tsc --noEmit`, `npm run lint` on every push. At minimum, add `"predeploy": "npm run validate:roadmaps"` to `package.json` immediately — near-zero effort, and the validator already exists and already caught every roadmap bug fixed this engagement. **Do this before Phase 3's breaking changes below**, since it's the safety net that makes those changes lower-risk to attempt.

### 1.2 Add the `slug_aliases` table + documented rename procedure
*Stage 4 F8 / Stage 5 F6 (Medium)* — Confirmed this session: the `infrastructure → devops` rename orphaned zero rows (lucky timing, not a safeguard), and no alias mechanism exists anywhere. Add a small table (`old_slug`, `new_slug`, `slug_type`) and a one-paragraph documented procedure ("renaming a slug requires: update code → add an alias row → optionally backfill existing rows") so the next rename doesn't repeat the same silent-orphan exposure.

### 1.3 Content registry auto-generation
*Stage 1 F2 (High)* — Replace the hand-maintained 2,013-line `Map` in `lib/content/index.ts` with a script that walks `public/content/` and generates it, eliminating the 6 broken entries and 236 orphaned files (including 20 `installation.md` files, 2,584 lines) found this audit. Do this together with 1.4 below — same generator pattern, same effort to learn once.

### 1.4 Search index auto-generation
*Stage 4 F3 (High)* — `app/search/page.tsx`'s hardcoded `searchIndex` array is the 4th confirmed instance of this exact drift pattern (after the content registry, the old sitemap, and roadmap `steps[]`/`techLinks[]`). Generate it from `getAllTechnologies()` + the (now-fixed) content registry, the same way the sitemap was just fixed. Bundle with 1.3 since both use the identical "generate from `academies.ts` + registry" approach.

### 1.5 Clean up dead-directory cruft
*Stage 1 F4 (Medium)* — `git rm -r` the 33 literal `{a,b,c}`-named directories (155 duplicate files, confirmed redundant not unique) under `public/content/`. Also `git rm components/layout/Navbar.tsx.bak` (Stage 3 F7) and add `"/dashboard/", "/admin/", "/onboarding/"` to `robots.ts`'s disallow list (Stage 3 F7). All trivial, zero risk.

### 1.6 Add cache headers for `/content/*.md`
*Stage 3 F6 (Medium)* — Add one `headers()` rule in `next.config.ts` (`public, max-age=3600, stale-while-revalidate=86400` — not `immutable`, since content can change without a URL change). Cheap, directly reduces repeat-fetch latency on the exact path Phase 2.1 below will also touch.

### 1.7 Error tracking — installed, deliberately inert until Phase 2 lands
*Stage 5 F3 (High)* — Done: `@sentry/nextjs` installed and fully wired (see "In progress" section above). **Activation (adding the real DSN) is intentionally deferred until Phase 2.1 ships**, so it's measured against a clean before/after rather than adding its own bundle-size cost on top of a problem already being fixed.

---

## Phase 2 — The two items explicitly deferred to this roadmap (higher effort, need careful sequencing)

### 2.1 Move content fetching server-side (fix client-rendered content pages)
*Stage 1 F8 / Stage 3 F1 (Critical)* — The single largest, most SEO-critical finding across all 5 stages: 2,000+ content pages render a loading skeleton server-side and fetch real content client-side, and that same route is also the heaviest bundle on the site (244 kB vs ~103-111 kB elsewhere, confirmed via production build). Fix: move `fetchContent()` into the server component (`app/academies/[academy]/[technology]/[section]/page.tsx` already has the params it needs) and pass the result into `SectionContent` as a prop, keeping AI-generation as a client-only island.
**Sequencing note**: do this *after* Phase 1.3 (registry auto-generation) — moving to server-side fetching is the right moment to also confirm the registry is trustworthy, so you're not building the server-side path against data you know has gaps.
**Risk**: low technically (non-breaking to rendered output), but touches the single template serving the most traffic — verify against Phase 1.1's CI checks before shipping, and spot-check the same sample pages used in Stage 3 (Linux, Kubernetes, ICD-10-CM, AI fundamentals).

### 2.2 Split static marketing pages out from under `ClerkProvider`
*Stage 3 F2 (High)* — Every route renders dynamically on every request (confirmed via production build — only 3 routes are static), most likely because `ClerkProvider` wraps the root layout and forces the whole tree dynamic. Fix requires a route-group restructure: pull genuinely auth-independent pages (`/privacy`, `/terms` first — lowest risk, no plausible need for auth-aware UI; `/about`/`/contact` next) into a route group with a layout that doesn't nest `ClerkProvider`.
**This is explicitly the higher-risk item of the two** — flagged breaking-ish because it changes what auth context is available to nested pages. Start with `/privacy`/`/terms` only, confirm they build as `○ Static` in the next production build, and only expand to `/about`/`/contact` once that's proven. Do not attempt this on the same day as 2.1 — verify 2.1 is stable first, since both touch rendering-mode behavior and you want to isolate which change caused any regression if one appears.

---

## Phase 3 — Medium-priority structural fixes (plan deliberately, not urgent)

### 3.1 Fix the admin user-list scaling problem
*Stage 4 F2 (High)* — `getAllUsersForAdmin()` does an unbounded full-table fetch across 4 tables plus in-memory JS counting instead of SQL aggregation. Fine today, will not survive real user growth (likely fails well before "millions of users," possibly before tens of thousands). Start with adding `.limit()`/pagination to the `users` query (cheapest partial fix), then replace the JS-side counting with Supabase's `{ count: "exact", head: true }` aggregate queries or a Postgres view.

### 3.2 Mark the dead schema as superseded (and confirm it's truly empty before dropping)
*Stage 4 F1 (Critical, but not urgent-today)* — `docs/synfracore-schema.sql`'s 15 tables (`courses`, `modules`, `lessons`, `progress`, `xp_ledger`, `challenges`, etc.) are confirmed 100% unused by any application code. Marked Critical because of the misleading-future-work risk (a future engineer could reasonably trust this file as authoritative and build against dead tables), not because it's actively harmful today — so it's sequenced here, not Phase 1, since there's no time pressure. Add a superseded notice to the file now (cheap); only run `DROP TABLE` after confirming zero rows in production (`SELECT count(*) FROM lessons`, etc., across all 14).

### 3.3 Tighten auth-middleware fail-open behavior
*Stage 2 F4 (High)* — Middleware currently passes every request through unchecked if Clerk env keys are missing at runtime — the confirmed root cause of an earlier incident this engagement, currently only saved from real impact by RLS and the admin page's own `notFound()` check acting as accidental backstops. Add explicit redirect-to-sign-in behavior for protected routes even in the no-Clerk-keys fallback branch, so the system fails closed by design rather than by lucky downstream coincidence.

### 3.4 Add rate limiting to public-facing API routes
*Stage 2 F5 (Medium)* — `/api/blog` (comments/likes) and `/api/subscribe` (newsletter) have zero rate limiting or abuse controls. Add per-IP counters via the existing `BLOG_KV` namespace (pattern already proven working); consider Cloudflare Turnstile if spam is observed in practice.

### 3.5 Reconcile the Next.js / `@cloudflare/next-on-pages` version mismatch
*Stage 2 F6 (Medium)* — `next@15.5.19` exceeds what `@cloudflare/next-on-pages@1.13.16` has been tested against (`<=15.5.2`). Not a known CVE, but a real deploy-stability risk running an unvalidated combination. Resolve deliberately (pin `next` down, or find/wait for an adapter release validated against the newer version) in an isolated branch with a full deploy-preview test, independent of other work.

### 3.6 Merge `steps[]`/`techLinks[]` into one linked structure
*Stage 1 F7 (Medium, but explicitly Breaking)* — The structural root cause of essentially every roadmap-routing bug fixed across this entire engagement. Fix is well-understood (merge into `{label, techLink}[]` per roadmap) but is a genuine breaking change touching core roadmap data and its consumers. **Sequence this last among the structural fixes**, once Phase 1.1's CI is in place to catch any regression during the migration, and follow the phased migration already laid out in Stage 1 (add new shape alongside old → migrate consumer → delete old shape only after a full release cycle proves it out).

---

## Phase 4 — Forward-looking, no action needed yet (flagged per your explicit ask, not urgent)

These don't need to happen now — they're documented so a future decision to build the underlying feature starts from an informed position instead of zero.

- **Multi-tenant/B2B seats readiness** (*Stage 4 F6*) — no `organizations`/`organization_members` schema exists; every RLS policy would need retrofitting at once if built reactively. If/when B2B is prioritized, add the scaffolding tables *before* the feature work starts, not during.
- **Real i18n readiness** (*Stage 4 F7*) — current "i18n" is a client-side Google Translate widget with no stored/indexable translated content, providing no SEO benefit in any non-English language. A real implementation later needs locale-prefixed routing and stored per-locale content, not an extension of the widget.
- **Payments/entitlements** (*Stage 5 F8*) — correctly not built yet per `CLAUDE.md`'s own phasing. When built, design against `learner-platform-schema.sql`'s real tables, not by resurrecting the dead `plans`/`subscriptions` tables from Finding 3.2's schema.
- **Content publishing workflow** (*Stage 5 F9*) — every content change currently requires a developer + git commit + redeploy. Worth its own deliberate scoping exercise (a git-based CMS like Tina/Decap is the lowest-effort option given content is already markdown-in-git) once content velocity from non-developers becomes a real bottleneck.
- **Feature-flag system** (*Stage 5 F7*) — one ad-hoc env var (`AI_ASSISTANT_ENABLED`) is the only precedent. Fine until a need arises for percentage rollout or no-redeploy toggling — the existing `BLOG_KV` namespace is a viable low-effort intermediate step when that need arrives.
- **Analytics** (*Stage 5 F4*) — no usage visibility across 2,000+ pages. Not blocking anything, but worth prioritizing once other Phase 1/2 items free up bandwidth, since it would inform *which* future content/architecture work actually matters most.
- **Offline/PWA behavior** (*Stage 5 F10*) — manifest exists, no service worker, no real offline capability. Only worth building if "view previously-opened lessons offline" becomes an explicit product goal.
- **`roadmap_progress` table** (*Stage 4 F5*) — built, RLS'd, indexed, never wired to a feature. Either build roadmap-step progress tracking against it, or note it explicitly as reserved so it isn't accidentally dropped alongside Phase 3.2's genuinely-dead tables.

---

## One-page priority order

1. **1.1** CI + predeploy validator (do first — protects everything after it)
2. **1.2** slug_aliases table
3. **1.3 + 1.4** registry + search-index generators (bundle together)
4. **1.5** dead-directory/file cleanup
5. **1.6** content cache headers
6. **2.1** server-side content fetching (the Critical SEO fix)
7. **Activate Sentry** (fill in `NEXT_PUBLIC_SENTRY_DSN`) — right after 2.1, for a clean before/after bundle-size comparison
8. **2.2** ClerkProvider route-group split (higher risk — isolate from 2.1)
9. **3.1** admin query scaling fix
10. **3.3** middleware fail-closed fix
11. **3.4** API rate limiting
12. **3.5** Next/adapter version reconciliation
13. **3.2** dead-schema superseded-marking (+ verified-empty check before any drop)
14. **3.6** steps/techLinks merge (breaking — last, once CI is proven out)
15. Phase 4 items — revisit if/when their underlying feature is actually prioritized
