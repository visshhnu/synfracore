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

## Reverted — Sentry (error tracking, Stage 5 F3, High) — CONFIRMED: fixed the Cloudflare deploy failure

**Update**: Sentry was installed (fully wired, deliberately inert — no DSN set) and then **reverted** after a real Cloudflare Pages deploy failure: `ERROR: A duplicated identifier has been detected in the same function file, aborting.`, from `@cloudflare/next-on-pages`'s own bundling step. Diagnosis: Sentry's `instrumentation.ts` + webpack route-wrapping is a known category of friction with community edge adapters, and this project's adapter version was already flagged (Stage 2 Finding 6) as untested against the Next.js version in use.

**Confirmed fixed**: redeployed after the revert — `Success: Your site was deployed!`, build log shows all 41 edge function routes compiled and uploaded cleanly. The diagnosis was correct.

The revert is safely re-appliable — re-apply Sentry once `next-on-pages` compatibility is confirmed (e.g. after an adapter upgrade, or tested via a preview/branch deploy before merging to main). **Before re-attempting Sentry**: verify compatibility with `@cloudflare/next-on-pages` specifically (not just plain `next build`) *before* merging to main — a branch/preview deploy is the right way to test this, not main.

## New finding — `public/_redirects`'s www→non-www rule has never worked
**Severity: Low**

The confirmed-good deploy log also surfaced this: `Found invalid redirect lines: #2: https://www.synfracore.com/* https://synfracore.com/:splat 301! ... Only relative URLs are allowed.` Cloudflare Pages' `_redirects` file matches on path only, not hostname — a full-URL source line is silently rejected at every deploy and always has been. Removed the dead line (kept the working `/home /` redirect) rather than leave a permanently-rejected line generating a warning on every future deploy. **Real fix still needed** (manual, Cloudflare dashboard): Rules → Redirect Rules → match hostname `www.synfracore.com` → redirect to `synfracore.com`, preserving path. Not urgent unless `www.synfracore.com` is getting real traffic today.

## FIXED — Clerk ↔ Supabase Third-Party Auth integration was never configured
**Severity: Critical (production-impacting) — discovered 2026-07-08 during Phase 3.1 live verification, not part of the original 6-stage audit**

Every signed-in user's `ensureUserRecord()` call (`lib/supabase/ensureUser.ts`) was silently failing on **every** page load that calls it (`/dashboard`, `/onboarding`), for **every** user, the entire time — not a Phase 3.1 regression, not specific to one account. Symptom: a generic "We couldn't sync your profile just now" banner on `/dashboard`; the real error, only visible in server logs, was PostgREST returning `PGRST301: No suitable key was found to decode the JWT`.

**Root cause**: CLAUDE.md's own documented setup step ("Supabase: Authentication → Sign In / Providers → Add provider → Clerk → paste the Clerk domain") had never actually been completed in the Supabase dashboard. Supabase had no way to verify the signature of the JWTs Clerk was issuing, so it rejected all of them at the PostgREST layer — before RLS, before any query logic, before any application code ran at all. Since every `users` row is only ever created via this same upsert path, this also means **no user who signed in before this fix ever got a `users` row created**, and every one of `getProfile()`/`getProgressSummary()`/`getBookmarks()`/`getQuizSummary()`/etc. (`lib/supabase/queries.ts`) had been silently returning empty defaults for that same reason — not because those users had no data, but because the sync that would have created their row never succeeded.

**Fixed** (2026-07-08, dashboard configuration, not a code change): registered the Clerk domain `engaged-bobcat-8.clerk.accounts.dev` under Supabase → Authentication → Sign In / Providers → Third-Party Auth → Clerk. Confirmed fixed live: a real `users` row was created immediately on next `/dashboard` visit, sync banner gone, `/admin` renders correctly for the now-admin account.

**Why this wasn't caught by the original audit**: the audit reviewed code and RLS policy *text* against CLAUDE.md's documented architecture, correctly found the code matched the documented pattern, and had no way to check the *live* Supabase dashboard's actual provider configuration — this class of bug only surfaces by actually signing in and checking server logs, which is exactly what happened here.

Nothing to revert if this is ever undone — it's Supabase dashboard state, not a file in this repo.

## FIXED — `app/api/blog`'s Cloudflare KV access never actually worked (likes/comments likely never persisted)
**Severity: High (silent data-loss on a public-facing feature) — discovered 2026-07-08 during Phase 3.4 live verification, not part of the original 6-stage audit; the underlying bug predates this entire engagement**

`app/api/blog/route.ts` read its `BLOG_KV` Cloudflare KV binding as `(globalThis as any).BLOG_KV`. That binding was genuinely configured correctly in the Cloudflare Pages dashboard the whole time (confirmed via screenshot: Settings → Bindings → KV namespace → `BLOG_KV`) — but `@cloudflare/next-on-pages` compiles Next.js into the ES-modules Workers format, where bindings arrive via the fetch handler's `env` argument, not as JS globals (global-as-binding is only true of the legacy Service Worker Workers format). So `kv` was `undefined` on every single request in production, silently, the whole time — meaning the blog like/comment counters have most likely never actually persisted a single interaction, ever. Every "like" click and every comment submission appeared to succeed (the code's own `if (!kv) return { success: true, likes: 1, ... }` fallback is indistinguishable from a real response to a user), but nothing was ever saved.

**Confirmed live** (not just inferred): 21 rapid POST requests to `/api/blog` all returned the identical `{"success":true,"likes":1,"comments":[]}` — never incrementing. To rule out this being Cloudflare KV's own eventual-consistency staleness (a legitimate alternative explanation for "reads looking stale under rapid hits"), sent a second write to the same fresh test slug ~90 seconds later — well past KV's documented worst-case propagation window — and it *still* showed `likes:1`, confirming the binding was never reachable from the code at all, not merely slow to converge.

**Fixed** (2026-07-08, code change, part of Phase 3.4): added `getBlogKv()` to `lib/rateLimit.ts`, using `@cloudflare/next-on-pages`'s own documented `getOptionalRequestContext().env.BLOG_KV` API instead of the broken global reference. Both `app/api/blog/route.ts` and `app/api/subscribe/route.ts` (added in this same phase) now go through it.

**Why this wasn't caught by the original audit**: same category as the Clerk/Supabase finding above — the code *looked* internally consistent (checks for `kv` being falsy, degrades gracefully, matches its own comment "Falls back gracefully if KV not configured") and the Cloudflare dashboard binding was genuinely present, so nothing about either the code or the config in isolation looked wrong. The bug only exists in the gap between them — Next.js-on-Cloudflare's specific binding-access convention — and only surfaces by actually exercising the endpoint live and checking whether data really persists across requests, not by reading either side alone.

**Not yet confirmed**: this fix is committed but not yet deployed/live-verified as of this writing — needs a push + the same live re-test (rapid-fire + delayed-recheck) to confirm real persistence and that Phase 3.4's rate limiting now actually engages.

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

**Update (2026-07-08) — this finding's own premise ("not a known CVE") had gone stale by execution time, and the originally-recommended fix would have been actively dangerous.** By the time this was actually worked on, `next-on-pages`'s entire declared-compatible range (`<=15.5.2`) had become the *vulnerable* side of **CVE-2025-66478** ("React2Shell") — a CVSS 10.0, pre-authentication RCE in React Server Components, disclosed December 2025, affecting exactly this app's architecture (App Router + RSC), actively exploited in the wild. The 15.5.x line's patch landed at `15.5.7`, above the adapter's stated ceiling — meaning there is no version of Next.js that is simultaneously within `next-on-pages`' tested range and patched against this CVE. Pinning down to comply with the adapter (as this item originally suggested) would have reintroduced a critical, live RCE.

**What was actually done**: pinned `next`/`eslint-config-next` to an exact `15.5.20` (latest 15.5.x patch, well past the `15.5.7` fix) instead of the floating `^15.3.3` that had let this drift silently in the first place. The `next-on-pages` peer-dependency warning is now expected to persist permanently — it should not be "fixed" by downgrading, since that direction is the actively dangerous one. See 3.8 below for the durable fix to this recurring tension.

### 3.6 Merge `steps[]`/`techLinks[]` into one linked structure
*Stage 1 F7 (Medium, but explicitly Breaking)* — The structural root cause of essentially every roadmap-routing bug fixed across this entire engagement. Fix is well-understood (merge into `{label, techLink}[]` per roadmap) but is a genuine breaking change touching core roadmap data and its consumers. **Sequence this last among the structural fixes**, once Phase 1.1's CI is in place to catch any regression during the migration, and follow the phased migration already laid out in Stage 1 (add new shape alongside old → migrate consumer → delete old shape only after a full release cycle proves it out).

### 3.7 Remove the `ClerkProvider` + Navbar Clerk-hook coupling that blocks all static rendering
*Discovered during Phase 2.2 (2026-07-08), named here as its own pre-scoped project — not a "performance" sub-task* — Every route in the app renders dynamically (confirmed: only 3 of 41 routes are static in the production build) because `<ClerkProvider>` sits in the root Server Component layout (`app/layout.tsx`) and resolves auth state via `headers()`/`cookies()` during SSR, which forces the entire tree dynamic under Next.js's rules. This is not fixable by a small per-page change: `components/layout/Navbar.tsx` — rendered on every single page — hard-depends on Clerk's `useAuth()` hook plus `<SignInButton>`/`<UserButton>`, all of which throw without a `<ClerkProvider>` ancestor. So no page can be made genuinely static without also solving Navbar's dependency.

**What the real fix requires** (scoped during Phase 2.2, not yet started):
1. Move every existing route under route groups — Next.js only allows one root-layout scheme per app, so introducing a second, `ClerkProvider`-free root layout (for genuinely static pages) means every current route needs to live in *some* group, not just the new one.
2. Build that second, `ClerkProvider`-free root layout with its own `<html>`/`<body>` for static-eligible pages (starting candidates: `/privacy`, `/terms`, `/about`, `/contact`).
3. Build a static-safe Navbar variant for that layout whose Sign In/Dashboard slot is its own small client island with a locally-scoped `<ClerkProvider>` — confirmed safe: Clerk supports nested providers sharing the same session, and the existing Navbar already gates that slot behind `isLoaded &&`, so there's no new loading-flash regression to design around.

**Interim mitigation already shipped** (Phase 2.2, commit `2805c85`): a `Cache-Control` header on `/privacy` and `/terms` set via `middleware.ts` (not `next.config.ts` — see that commit for why `next.config.ts`'s `headers()` silently no-ops on Cloudflare for any dynamically-rendered route). This cuts repeat-visit cost on two pages; it does **not** change their rendering mode and does nothing for the other 38+ dynamic routes.

**Update (2026-07-08) — attempted, made real progress, hit a genuine blocker, deliberately not merged.** Explored on a dedicated branch (`phase-3.7-static-marketing-pages`, committed but not merged — left in place so this work isn't lost). Two significant findings:

**1. The original diagnosis above was wrong, and the real fix is much smaller than scoped.** Confirmed via Clerk's own docs and a real build: regular `<ClerkProvider>` (no `dynamic` prop) does **not** force dynamic rendering by itself. The actual cause of every route being dynamic is `export const runtime = "edge"`, set once in the single root layout and inherited by every route beneath it — Next.js explicitly disables static generation for any page under an edge-runtime layout, unconditionally, regardless of ClerkProvider or anything else. Confirmed empirically: a route group with no edge-runtime export, using the **exact, unmodified** real `Navbar`/`ClerkProvider`/`Footer` (no static-safe Navbar variant, no nested-provider tricks), still builds as genuinely `○ Static`. So step 3 above (build a static-safe Navbar variant) turned out to be unnecessary — the entire fix is: route-group split (step 1) + a `ClerkProvider`-free-*looking* but actually just edge-runtime-free layout for static candidates (step 2, minus the Navbar rework).

**2. A real, confirmed blocker: `notFound()` calls triggered from *within* a matched route break under multiple root layouts.** Specifically Clerk's `auth.protect()` — which calls `notFound()` internally by default, and which every one of `/dashboard`, `/admin`, `/onboarding`, `/profile` relies on for its signed-out behavior — stops resolving to the app's custom `not-found.tsx` correctly once there's more than one root layout:
- With a single top-level `app/not-found.tsx` (today's structure): hitting `/dashboard` signed-out throws a hard `"not-found.tsx doesn't have a root layout"` error, 500 status.
- Giving each route group its own `not-found.tsx` (the fix Next's own docs recommend for multi-root-layout apps) removes the hard error — status goes back to 404 — but the actual rendered page silently falls back to Next.js's **generic, unbranded** 404 page instead of the app's real one.
- Confirmed via a temporary worktree of unmodified `main` that this is a genuine regression, not pre-existing behavior: the identical unauthenticated `/dashboard` request on `main` correctly shows the real custom 404 content today.
- Plain unmatched-URL 404s (no `notFound()`, no matched route at all) are **unaffected** either way — this is specific to the middleware-triggered `notFound()` path.

**Two candidate fixes identified, neither applied — both are product/security-posture calls, not unilateral engineering ones:**
- Change `auth.protect()` to redirect to `/sign-in` instead of calling `notFound()` for these routes. Fixes the bug cleanly, but reverses a deliberate existing decision to hide these pages' existence via 404 rather than reveal them via a redirect (see the "so a non-admin can't tell the page exists" comment on the admin page).
- Adopt Next's experimental `global-not-found.js` + `globalNotFound` flag (introduced 15.4.0, still marked experimental in Next's current docs) — untested whether it actually resolves the *middleware-triggered* case specifically (it's documented for the plain-unmatched-URL case), and stacks another experimental-feature risk onto a deploy pipeline that already caused one real incident this engagement (Sentry/`next-on-pages`).

**Decision: stopped here rather than push further into an increasingly deep Next.js edge case.** `main` is untouched. The branch (with the corrected diagnosis, the working `RootShell`/`AppChrome` shared-layout components, and the confirmed-static `/privacy`/`/terms` build) is preserved for whoever picks this up next — **start from the branch's findings, not from scratch, and resolve the `notFound()`/multi-root-layout question (likely via a product decision on the redirect-vs-hide question) before attempting to merge.**

**Do not re-derive this from scratch next time performance/SEO work comes up** — start from this item.

**Update (2026-07-09) — the real blocker turned out to be adapter-wide, not specific to this item's route-group approach. See "CONFIRMED — Static rendering is structurally blocked..." after 3.9 below: `@cloudflare/next-on-pages` can't correctly route the Server Action Clerk's SDK fires globally on sign-in, which blocks *any* static page on this adapter, not just the ones this item was trying to convert. 3.8 is now the prerequisite for this item, not a separate alternative to it.**

### 3.8 Migrate off `@cloudflare/next-on-pages` to `@opennextjs/cloudflare`
*Discovered during Phase 3.5 (2026-07-08), named here as its own pre-scoped project — not something to attempt inside a routine dependency bump* — `@cloudflare/next-on-pages` is **Cloudflare's own deprecated adapter** (its install output says so directly: `Please use the OpenNext adapter instead: https://opennext.js.org/cloudflare`), and per 3.5 above, it's already latest (`1.13.16`) with no newer release in progress to track current Next.js versions. Its declared peer range for Next.js (`>=14.3.0 && <=15.5.2`) is now frozen in the past.

**Why this isn't a one-time fix**: 3.5 wasn't a fluke — it's the first instance of a structural, recurring conflict. Next.js ships security patches on its own schedule (this project already hit one CVSS-10.0 RCE within one audit cycle); a deprecated, unmaintained adapter's peer range does not move to track them. Every future Next.js security patch has some chance of landing outside whatever range `next-on-pages` was last tested against, forcing the exact same choice this finding faced: stay compliant with the adapter and risk running vulnerable code, or go out-of-range and carry an unacknowledged (if currently harmless) deploy-stability risk. Neither is sustainable as a repeating pattern for a platform meant to run 10-12+ years.

**Recommended fix**: migrate to `@opennextjs/cloudflare` (the actively maintained, Cloudflare-endorsed successor) as its own deliberate project — not bundled with a routine version bump, since adapter migrations change the actual build/deploy pipeline (`wrangler.toml`, the `pages:build`/`deploy` scripts in `package.json`, possibly KV/binding access patterns like the one just fixed in Phase 3.4). Test via a branch + preview deploy before merging to main, same caution already called out for 3.5 itself.

**Not urgent today** (the app deploys and runs fine on the current adapter), but should be picked up well before the next time a Next.js security patch forces this same choice again — reactively doing an adapter migration under CVE time pressure is a worse position than doing it deliberately now.

**Update (2026-07-08) — attempted a local-only proof of concept, blocked on Windows, but surfaced a bigger, separate finding.** Explored on a dedicated branch (`phase-3.8-opennext-poc`, committed but not merged, pushed to GitHub as a reference — no production/domain changes attempted, per the agreed scope). Two things came out of it:

**1. Confirmed this is a genuine Pages→Workers product migration, not a drop-in adapter swap.** `@opennextjs/cloudflare` deploys to Cloudflare *Workers*, not Cloudflare *Pages* — a different hosting product. A real migration needs: a new `wrangler.toml`/`.jsonc` in the Workers config format; all five secrets (`CLERK_SECRET_KEY`, `SUPABASE_SERVICE_ROLE_KEY`, `RESEND_API_KEY`, `CLERK_WEBHOOK_SIGNING_SECRET`, `DIGEST_SECRET`) manually re-entered into a new Workers project (Cloudflare's own docs confirm these don't carry over automatically); the `BLOG_KV` binding reconfigured there too; and a deliberate custom-domain cutover for `synfracore.com` from the Pages project to the new Workers one (Cloudflare recommends validating on a preview/`workers.dev` URL first, then cutting over — no promise of zero downtime).

**2. Could not get a working local build.** `npx opennextjs-cloudflare build` fails consistently with `esbuild: Invalid alias name: "next/dist/compiled/{node-fetch,ws,@ampproject/toolbox-optimizer,edge-runtime}"`, reproduced identically across three different configurations (ruling out the next.config.ts dev-init call, the coexisting Pages `wrangler.toml`, and the config file's name as the cause). OpenNext's own build output includes an explicit warning: *"OpenNext is not fully compatible with Windows... could encounter unpredictable failures during runtime"* — the same class of limitation `@cloudflare/next-on-pages` already has on this machine (established earlier this engagement: `spawn npx ENOENT`). This doesn't rule out OpenNext working via Cloudflare's own remote (Linux) build environment — the current adapter has never worked locally on Windows either, only via Cloudflare's CI — but it does mean this can't be locally verified before pushing, same constraint as today.

**3. A separate, more promising finding for 3.7's actual goal, discovered as a byproduct.** Per OpenNext's setup instructions, every `export const runtime = "edge"` export was removed across the app (required for OpenNext regardless). Rebuilding with plain `next build` (no OpenNext, no route groups, no multi-root-layout) — just edge runtime removed, on top of unmodified `main` — produced **20 of 42 routes going genuinely `○ Static`** (`/`, `/about`, `/academies`, `/ai-assistant`, `/blog`, `/career`, `/careers`, `/certifications`, `/community`, `/contact`, `/interview`, `/labs`, `/learn`, `/privacy`, `/projects`, `/pyqs`, `/roadmaps`, `/search`, `/terms`, `/troubleshooting`), a much bigger win than 3.7's original two-page scope. Confirmed the app still works correctly this way: `/dashboard` and `/admin` signed-out still show the real custom 404 (not a generic fallback), because this approach never introduces a second root layout — it sidesteps 3.7's entire `notFound()`/multi-root-layout blocker by construction, since there's only ever one root layout. **This suggests a much smaller, safer path to most of 3.7's value** — see 3.9 below.

**Update (2026-07-09) — 3.9 attempted that exact path and hit a new, adapter-wide blocker (Clerk's Server Action needs edge runtime everywhere, not scopeable), fully written up in the consolidated finding right after 3.9. That finding elevates this item (3.8) from "not urgent today" to the actual prerequisite for static rendering to work on this app at all — see there for the full reasoning before picking this back up.**

---

### 3.9 Invert the edge-runtime pattern: opt in per-route instead of inheriting it site-wide
*Discovered during Phase 3.8 (2026-07-08) as a byproduct of the OpenNext POC, named here as its own pre-scoped project — a likely-better alternative to 3.7's route-group approach, not a duplicate of it* — `export const runtime = "edge"` sits in the single root layout today and every route inherits it, which (per 3.7's corrected diagnosis) is the actual reason nearly every route is dynamic — not `ClerkProvider`. Confirmed via a real build: removing it entirely (with no other changes — no route groups, no second root layout) makes 20 of 42 routes go genuinely static, and the app still works correctly, including `/dashboard`/`/admin`'s signed-out 404 behavior (which 3.7's route-group approach broke).

**Proposed approach**: remove `runtime = "edge"` from the root layout, then explicitly re-add `export const runtime = "edge";` only to the routes that genuinely need per-request dynamic execution under `@cloudflare/next-on-pages` (the ones already showing `ƒ` for real data-dependent reasons — `/dashboard`, `/admin`, `/onboarding`, `/academies/[academy]/...`, `/api/*`, etc.) — inverting today's "opt out" pattern to an explicit "opt in" one.

**Why this is likely better than 3.7's route-group approach**: no multi-root-layout at all, so no `not-found.tsx`/`global-error.tsx` ambiguity to solve — 3.7's entire confirmed blocker doesn't exist here by construction. No Navbar changes needed (already established in 3.7's investigation). Much smaller diff than moving every route into groups.

**What's not yet verified**: this was tested with `plain next build` only, not through the actual `@cloudflare/next-on-pages` bundling step — needs the same branch + preview-deploy verification discipline as 3.5/3.7 before trusting it live. Also needs to double check every route currently relying on the *inherited* edge runtime doesn't have some non-obvious dependency on it beyond what a route-by-route audit would catch.

**Sequencing note**: probably supersedes 3.7 rather than sitting alongside it — worth deciding explicitly whether to attempt this instead of 3.7's route-group approach, not both.

**Update (2026-07-09) — attempted, made things worse, root cause now conclusively identified. See the consolidated finding immediately below — this is not a 3.9-specific problem, it's the same wall 3.7 and 3.8 each hit independently.**

---

## CONFIRMED — Static rendering is structurally blocked on `@cloudflare/next-on-pages` until 3.8 is done (2026-07-09)

Three independent attempts — 3.7 (route groups), 3.9 (edge-runtime opt-in), and 3.8's own POC — each separately tried to get *any* page statically generated while staying on the current adapter, and each hit a different symptom of the exact same underlying incompatibility. This time it was investigated to the actual root cause, confirmed directly in source and live, not just inferred from a symptom.

**The root cause**: Clerk's own SDK (`@clerk/nextjs`) uses a genuine Next.js Server Action internally — `invalidateCacheAction` in `node_modules/@clerk/nextjs/dist/esm/app-router/server-actions.js`:
```js
"use server";
async function invalidateCacheAction() {
  void (await cookies()).delete(`__clerk_invalidate_cache_cookie_${Date.now()}`);
}
```
`ClerkProvider.js` fires this from `window.__internal_onBeforeSetActive` on sign-in (and other "set active" events — sign-out is explicitly skipped on Next 15/16, which is why sign-in and sign-out symptoms differed slightly in testing). `@cloudflare/next-on-pages` has a confirmed, independently-documented limitation (real GitHub issues/discussions on the adapter's own repo, not speculation): **Server Actions return a 405 on any page that doesn't have `runtime = "edge"`.** Since `ClerkProvider` must be global — Navbar renders sign-in/sign-up on every page, by design, not a mistake — this Server Action can fire from wherever the user happens to be standing when they sign in. That means **every single page needs `runtime = "edge"` for Clerk to function correctly on this adapter, which is fundamentally incompatible with any page being statically generated at all** — not a scoping problem fixable with a more careful `ClerkProvider` placement.

**Confirmed live, not just in theory**: pushed a fix attempt (`phase-3.9-clerk-static-investigation`, implementing Clerk's own officially-documented `<ClerkProvider dynamic>` + `<Suspense>` pattern for the five auth-critical routes) to a real Cloudflare preview deploy. It made things *worse*, not better — sign-in hung indefinitely with no message, `/dashboard`/`/admin`/`/onboarding` stopped working, and the browser console showed exactly the `405` + "unexpected response" signature this documented limitation produces. Traced the mechanism directly in `node_modules/@clerk/nextjs`'s source afterward to confirm it precisely, rather than stopping at "the symptom matches."

**How this ties 3.7, 3.8, and 3.9 together** — each was solving the same goal and hit a different face of the same wall:
- **3.7** (route groups, multiple root layouts): blocked by `notFound()` ambiguity — a *routing* symptom of trying to isolate static pages from the rest of the app.
- **3.9** (edge-runtime opt-in, single root layout): looked correct through every check that didn't involve a real signed-in browser session — build output, curl, even the first live `curl`-based check — until actual sign-in/sign-out testing surfaced the Server Action 405. This is the one that got furthest before failing, precisely because the failure mode only manifests through real Clerk interaction, which none of the earlier verification steps exercised.
- **3.8** (`@opennextjs/cloudflare`): uses Node.js runtime via Cloudflare's `nodejs_compat` flag, not `next-on-pages`' per-route edge-Function compilation model — very likely does **not** have this specific Server-Actions-need-edge-runtime limitation, since the limitation is specific to how `next-on-pages` compiles routes, not to Next.js or Clerk themselves.

**This elevates 3.8 from "nice to eventually do, the durable fix for 3.5's recurring CVE-drift conflict" to the actual prerequisite for static rendering to ever work on this app at all.** It is no longer a parallel, optional improvement sitting alongside 3.7/3.9 — it is the *only* known path off this wall. Until 3.8 is actually completed (a real, working, live deploy — not just the local POC already attempted, which remains blocked on this Windows machine per its own entry above), static rendering for this app is not achievable on the current adapter. Full stop.

**Do not attempt any further static-page work on the current adapter** — no route groups, no edge-runtime removal, no variation or combination of either — until 3.8 is actually done. Every such attempt from this point forward is a known, confirmed dead end on `@cloudflare/next-on-pages`, not worth re-investigating from scratch. (If 3.8 itself is eventually completed and turns out to have some *comparable* limitation, that would need to be established freshly at that point — not assumed one way or the other from here.)

---

## Phase 3 close-out (2026-07-08)

**Shipped and live**, one item at a time, each its own commit, each build/tsc-verified and (where rendering was affected) live-verified on synfracore.com before moving on:
- **3.1** — admin user-list pagination + O(rows) counting, plus the Clerk↔Supabase Third-Party Auth gap and the `app/api/blog` KV-access bug it surfaced along the way (both separately recorded, both fixed).
- **3.3** — auth middleware now fails closed, not open, when Clerk keys are missing.
- **3.4** — per-IP rate limiting on `/api/blog` and `/api/subscribe`, verified live end-to-end (real incrementing, real 429).
- **3.5** — the Next.js/`next-on-pages` version reconciliation that turned out to be a live CVSS-10.0 RCE near-miss (CVE-2025-66478) rather than the "not a known CVE" the original finding assumed — pinned to a patched version instead of downgrading into the vulnerable range.
- **3.2** — `docs/synfracore-schema.sql` marked superseded; confirmed all 14 dead tables are empty in production; deliberately left in place (not dropped) pending a real decision on the gamification/XP/challenges roadmap.
- **3.6** — `steps[]`/`techLinks[]` merged into one linked structure across all 22 roadmaps/152 steps, closing the root cause of essentially every roadmap-routing bug fixed this entire engagement.

**Investigated, deferred, findings preserved** (not shipped — both need a decision before either is picked back up):
- **3.7** — ClerkProvider/Navbar decoupling. Corrected a wrong diagnosis (it's `runtime = "edge"`, not ClerkProvider) but hit a real, confirmed regression: `notFound()` calls from Clerk's `auth.protect()` break under multiple root layouts. Branch `phase-3.7-static-marketing-pages`, pushed, not merged.
- **3.8** — `@opennextjs/cloudflare` migration. Confirmed it's a genuine Pages→Workers hosting migration, not an adapter swap; local build blocked by an OpenNext-acknowledged Windows incompatibility. Branch `phase-3.8-opennext-poc`, pushed, not merged.

**Queued as the next lead**: **3.9**, surfaced as a byproduct of the 3.8 investigation — remove `runtime = "edge"` from the root layout and opt specific routes back in, instead of 3.7's route-group split. Confirmed via a real build to unlock static generation for 20 of 42 routes (vs. 3.7's 2) while sidestepping 3.7's `notFound()` blocker entirely, since it never introduces a second root layout. Not yet verified through the actual `next-on-pages` bundling step or live — that's the starting point for next session.

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
- **Set an explicit `afterSignOutUrl` on `<UserButton />`** (*discovered 2026-07-08, investigating the 3.9 revert*) — `components/layout/Navbar.tsx`'s `<UserButton />` has no `afterSignOutUrl` configured, so signing out currently flashes the real 404 page for whatever protected route you were on (e.g. `/dashboard`) before Clerk's own default navigation takes you home — two separate, expected steps, not a bug. Confirmed pre-existing (identical on the commit right before Phase 3.9, via `git diff`), unrelated to any Phase 3 work. Not urgent — cosmetic only — but a one-line fix (`<UserButton afterSignOutUrl="/" />` or similar) whenever this UX is worth smoothing over.

---

## One-page priority order

1. **1.1** CI + predeploy validator (do first — protects everything after it)
2. **1.2** slug_aliases table
3. **1.3 + 1.4** registry + search-index generators (bundle together)
4. **1.5** dead-directory/file cleanup
5. **1.6** content cache headers
6. **2.1** server-side content fetching (the Critical SEO fix)
7. **Re-evaluate Sentry** — reverted after a Cloudflare deploy failure (likely `next-on-pages` incompatibility); test compatibility on a branch/preview deploy before re-attempting on main
8. **2.2** ClerkProvider route-group split (higher risk — isolate from 2.1)
9. **3.1** admin query scaling fix
10. **3.3** middleware fail-closed fix
11. **3.4** API rate limiting
12. **3.5** Next/adapter version reconciliation
13. **3.2** dead-schema superseded-marking (+ verified-empty check before any drop)
14. **3.6** steps/techLinks merge (breaking — last, once CI is proven out)
15. **3.8** `@cloudflare/next-on-pages` → `@opennextjs/cloudflare` migration — **now the prerequisite for 3.7 and 3.9, not a parallel item.** Confirmed (2026-07-09): static rendering is structurally impossible on the current adapter regardless of approach (Clerk's globally-fired Server Action 405s on any non-edge page) — see the consolidated finding after 3.9. Local build still blocked on this Windows machine; needs verification via Cloudflare's own remote build before this can move further.
16. **3.7 / 3.9** ClerkProvider decoupling / edge-runtime opt-in — **both confirmed dead ends on the current adapter, do not retry either until 3.8 is actually done.** Kept here only as historical record of what was tried; not actionable on their own anymore.
17. Phase 4 items — revisit if/when their underlying feature is actually prioritized
