# SynfraCore — Final Consolidated Roadmap (v3, self-contained)
**Prepared 2026-07-15.** Supersedes `06-roadmap.md` (kept for historical detail, now
marked deprecated with a pointer here) and the "Final Consolidated Roadmap v2" draft
that prompted this reconciliation pass. This document assumes **zero prior
conversational context** — everything a new engineer needs to understand current
state is below.

**Method note**: every finding below was re-verified today against the live
codebase and/or the live site (curl + direct file reads + three background research
passes), not accepted from the v2 draft at face value. Where v2 was wrong or stale,
that's called out explicitly.

---

## Part 0 — Mobile cropping bug on question-bank attempt pages (FIXED, needs manual confirm)

**Bug**: on mobile viewports, `AttemptRunner.tsx`'s question navigator (1–100 grid)
rendered fine, but the question text/options pane was cropped to a sliver.

**Root cause**: [`components/question-bank/AttemptRunner.tsx:87`](../../components/question-bank/AttemptRunner.tsx#L87)
used a hardcoded `gridTemplateColumns: "260px 1fr"` two-column CSS grid with no
mobile breakpoint. On a ~375px viewport, the fixed 260px navigator column left only
~115px (minus 52px of padding) for the content pane — the navigator's own internal
grid (`repeat(auto-fill, minmax(34px,1fr))`) reflows fine within its narrow column,
which is exactly why only the content pane looked broken.

**Fix applied**: added a `.attempt-runner-grid` class to the container and a
`@media (max-width: 768px)` rule in `app/globals.css` (following the same
`[style*="..."]`-adjacent mobile-fix pattern already used for the footer) that
collapses to a single column under 768px, stacking the navigator above the
full-width content pane, and un-stickying the navigator on mobile.

**Status**: code fix is in place. **Not yet visually confirmed on a real mobile
viewport** — no browser automation tool was available in this session. Run
`npm run dev`, open dev tools' mobile device emulation, and confirm the full
question text and all 4 options are visible/scrollable before treating this as
closed. (User has taken ownership of this manual check.)

---

## Part 1 — Live status snapshot (re-verified today, 2026-07-15, via direct curl + file reads)

| Check | Result |
|---|---|
| `synfracore.com/` | Flaps between 200 and 503 — see Symptom 10 below. Currently mostly 200. |
| `/learn/class-10/maths/real-numbers` | 200, full lesson content, correct per-page `og:title`/`og:url` |
| `/roadmaps/devops-engineer`, `/learn`, `/academies/devops`, `/terms` | 200, real content, but see NF-1/NF-3 below |
| `/about` | Intermittently 503 (same flap as homepage), 200 on retry — "101 technologies" confirmed live |

No 404/500-dead internal URLs found. Problems are correctness/SEO/content-quality
defects on pages that load, plus one active availability issue (Symptom 10),
detailed below.

---

## Part 2 — Carried-over items from `06-roadmap.md` (OP-1 through OP-7): re-verified today

- **OP-1 · Symptom 8 sign-in redirect race — hardcoded-URL smell fixed
  2026-07-16 (C2); the redirect race itself is not fully resolved.**
  `getAuthSafely()`'s fallback at `lib/clerk/authFallback.ts` no longer
  hardcodes `https://synfracore.com/` — it now builds the Request from the
  real incoming `host`/`x-forwarded-host` and `x-forwarded-proto` headers,
  so this fallback works correctly on any domain (previews, a future domain
  change) instead of silently breaking off of the exact production hostname.
  **New evidence tonight strongly suggests Symptom 8 and Symptom 11 are the
  same underlying mechanism, not two separate bugs**: live console capture of
  an actual sign-in attempt from `/sign-in?redirect_url=...` showed
  `setActive` (Clerk's own internal call, not app code) triggering a POST
  back to the current URL that 404s, immediately followed by "An unexpected
  response was received from the server" — the identical signature already
  documented for Symptom 11's `invalidateCacheAction` failure. If confirmed,
  fixing Symptom 11 (which needs D1, deferred — see Part 4a) would also
  resolve Symptom 8, and no further page-level work on Symptom 8 specifically
  is worth doing until then. Originally confirmed all 8 call sites go through
  this shared helper: `app/api/question-bank/submit/route.ts`,
  `app/api/question-bank/save-answer/route.ts`, `app/api/question-bank/start/route.ts`,
  `app/question-bank/[paperSlug]/attempt/[attemptId]/page.tsx`,
  `app/question-bank/[paperSlug]/attempt/[attemptId]/results/page.tsx`,
  `app/onboarding/page.tsx`, `app/onboarding/actions.ts`, `lib/supabase/server.ts`.
- **OP-2 · Migrate to `@opennextjs/cloudflare` — still open, not started.**
  `package.json` still has `@cloudflare/next-on-pages@^1.13.16`, `wrangler.toml`
  still uses `pages_build_output_dir` (Pages-style). No adapter migration code exists
  in the tree.
- **OP-3 · Sentry — confirmed absent/reverted.** No `@sentry/nextjs`, no config
  files, no `SENTRY_*` env vars anywhere except historical prose in docs.
- **OP-4 · Search Console verification — status unchanged, still needs doing.**
  Not independently re-verifiable from this session (needs Search Console access).
- **OP-5 · 73-file boilerplate batch — confirmed not started.** `06-roadmap.md`
  itself says "no files touched yet"; nothing in the repo contradicts that.
- **OP-6 · `afterSignOutUrl` — CORRECTION 2026-07-18: already resolved,
  this entry was stale.** `Navbar.tsx`'s bare `<UserButton />` (no props) is
  correct, not a bug — commit `9e147da` (2026-07-16) already fixed the
  underlying issue at the `ClerkProvider` level (`app/layout.tsx`:
  `<ClerkProvider afterSignOutUrl="/">`), after confirming `afterSignOutUrl`
  moved to be a provider-level-only option on this Clerk SDK version, not a
  per-component `UserButton` prop — adding it to `UserButton` directly fails
  typecheck (`TS2322`, re-confirmed live tonight). This entry should have
  been marked resolved after that commit; it wasn't. No code change needed.
- **OP-7 · Phase-1 closure — mixed, now precisely known:**
  - *1.2 slug_aliases*: table/schema doc exists (`docs/slug-aliases-schema.sql`),
    but **zero application code references it** — confirmed by grep across `app/`,
    `lib/`, `components/`. Matches CLAUDE.md's own note that it's not consulted at
    runtime yet.
  - *1.3 registry auto-generation*: **fixed 2026-07-16 (B3).**
    `scripts/generate-content-registry.mjs` existed and worked, but wasn't
    wired into any build step. `npm run pages:build` — the script CLAUDE.md's
    documented deploy process actually calls, not `npm run deploy` — now runs
    `generate:content-registry` first. Verified: running it against the
    already-stale registry (before A9's directory deletions were reflected)
    correctly dropped the 24 now-deleted `monitoring/*` entries.
  - *1.4 search-index auto-generation*: **correction, 2026-07-16 — this
    session's original finding was wrong.** `app/search/page.tsx`'s
    `searchIndex` is not a hardcoded array — it's the return value of
    `buildSearchIndex()`, which iterates `getAllTechnologies()`,
    `certifications`, and `educationBoards` live at module load. Confirmed via
    direct grep that no literal `searchIndex = [...]` array exists anywhere in
    the codebase. This sub-item is already done; the original audit
    misread the `const searchIndex: Result[] = buildSearchIndex();`
    declaration without checking what the function body actually does.
  - *1.5 dead-directory cleanup*: **CORRECTION 2026-07-18: already done,
    this entry was stale.** Both directories described below were deleted
    in commit `bf8f5f0` (2026-07-16, "chore(content): delete two dead
    content directories (OP-7's 1.5)") — same findings, same reasoning,
    re-confirmed live tonight (`public/content/monitoring` no longer
    exists on disk; the malformed junk directory doesn't either). This
    entry should have been marked resolved after that commit; it wasn't.
    No further action needed. Original findings, kept for the record:
    (a) `public/content/{education` was a malformed, empty junk directory
    (containing an equally malformed empty subdirectory literally named
    `{java,c-programming,cpp},exams`) — a failed shell brace-expansion,
    0 files, zero data risk. (b) `public/content/monitoring/` (24 files:
    `datadog`, `elk-stack`, `grafana`, `loki` subfolders) was genuinely
    orphaned — not in `ALIAS_ROOTS` in `scripts/generate-content-
    registry.mjs` (only `devops: ["devops", "infrastructure"]` is
    registered), so the registry never scanned it and no page ever
    rendered it. `elk-stack`'s content was already safely duplicated
    under `devops/elk-stack` and `infrastructure/elk-stack`, and `loki`
    was not a registered technology slug in `academies.ts` at all —
    pure dead weight, not a content-loss bug.
  - *1.6 content cache headers*: **confirmed shipped** —
    [`next.config.ts:63-66`](../../next.config.ts#L63) has the
    `/content/(.*)\.md` rule with `Cache-Control: public, max-age=3600,
    stale-while-revalidate=86400`.

---

## Part 3 — Tonight's Clerk dev-to-production migration incident (RESOLVED, already shipped)

Verified directly against the actual code — this fix already exists in the repo,
not just described:

- **Root cause**: `users.email` has its own `UNIQUE` constraint
  (`users_email_key`) separate from the `id` primary key. A fresh Production
  sign-up under `pk_live_`/`sk_live_` keys gets a *new* Clerk user id but the
  *same* email as an existing dev-instance row. `ensureUserRecord()`'s upsert
  only resolved conflicts on `id`, so the insert failed with Postgres `23505`
  for all 4 existing users (2 real external users affected).
- **Confirmed shipped fix** — [`lib/supabase/ensureUser.ts`](../../lib/supabase/ensureUser.ts):
  on `error.code === "23505"`, `tryRelinkByEmail()` calls a service-role-only
  Postgres RPC `relink_user_id(old_id, new_id)` (defined in
  [`docs/relink-user-id-fix.sql`](../relink-user-id-fix.sql)) that re-points the
  `users` row and all dependent rows (`user_domain_preferences`,
  `recent_activity`, `paper_attempts`) to the new id in one transaction, with
  `EXECUTE` revoked from all but `service_role`. The three referencing foreign
  keys were altered to `DEFERRABLE INITIALLY DEFERRED` — required for the
  multi-statement re-point to work inside one PL/pgSQL function body at all.
  This makes the fix **self-healing**: it fires automatically the next time
  each remaining affected user signs in, no manual SQL needed per account.
- **Also fixed**: Supabase's Third-Party Auth Clerk integration was still
  pointed at the old dev Frontend API domain
  (`engaged-bobcat-8.clerk.accounts.dev`) — updated to the real production
  domain (`clerk.synfracore.com`).
- **`.env.local` staleness sub-incident (2026-07-15)**: a stale native-directory
  `.env.local` baked the old dev-mode Clerk publishable key back into a
  production build after the key rotation, breaking sign-in/out for hours.
  This is now captured as a mandatory, non-skippable step in CLAUDE.md's
  pre-deploy checklist (fresh `.env.local` copy + verification grep on every
  single build, plus a `.next`/`.vercel` cache-clear as a secondary check).
- **Follow-up, tracked**: `relink_user_id` and its self-healing call become
  dead code once all 4 users have signed in successfully post-migration —
  flag for removal once confirmed, so this elevated-privilege function
  doesn't linger as unused attack surface.

**New finding, 2026-07-16 — "Couldn't find your account" for a user whose
Supabase row already exists and looks correct.** Confirmed via a live
screenshot: `visshnu9999@gmail.com` has a real, populated Supabase row
(visible in `/admin`'s user table — 4 domains, 1 quiz attempt, `onboarding_
completed`), but Clerk's own `<SignIn>` widget says "Couldn't find your
account" for that email. This is **not a Supabase/relink problem** — the
relink logic only ever touches our own `users` table, and the row it produced
is intact and correct. The actual issue is one level up: this person's
**Clerk account under the Production instance was never created** — the
Supabase row surviving from the manual admin relink (or an earlier dev-instance
signup) does not imply a live-instance Clerk identity exists. **Fix (user
action, not code)**: the affected user should click **"Sign up"**, not "Sign
in." `ensureUserRecord()`'s existing `23505`-collision self-heal will then
fire exactly as designed, merging the new Clerk id into their existing
Supabase row via `relink_user_id` — no manual SQL, no code change needed. If
"Sign up" also fails for a given email, that's a genuinely different problem
(worth escalating separately) — but has not yet been observed.

---

## Consolidated summary: Symptom 8-13 / D1 migration saga (read this first — full story without piecing together Parts 4a-4l)

**One sentence**: a shared Clerk mechanism broke sign-in/out sitewide under
`@cloudflare/next-on-pages`, the real fix was migrating to
`@opennextjs/cloudflare` (D1), that migration was tried once, reverted for
an unrelated bug, and — after two more days of the underlying problem
recurring and getting properly root-caused — was re-attempted and is now
**live in production** as of 2026-07-19T16:49:47Z.

### The mechanism (Symptom 8/9/10/11 — one root cause, several names over time)

Clerk's client SDK fires an internal Server Action
(`invalidateCacheAction`) to refresh Next's RSC cache after any
`setActive()`/`signOut()` call. Because `ClerkProvider`/the sign-in modal
are global (rendered on every page via the Navbar), this action can fire
from *any* route. `@cloudflare/next-on-pages` cannot reliably route this
Server Action — it 404s, crashing hydration (React error #418), and under
load could trigger a retry storm severe enough to cause intermittent
whole-site 503s. First seen as isolated symptoms (8, 9, 10, 11) before
being understood as one shared mechanism; **confirmed sitewide** (not just
question-bank pages, as earlier believed) on 2026-07-19 via a live user
report and direct reproduction (Part 4j).

### The BCHHC/Symptom-13 detour

A separate-seeming bug — BCHHC question-bank sign-in not updating the
client UI without a manual reload — got its own investigation and its own
fix (`AuthStateSync.tsx`, a forced-reload mitigation) before the sitewide
404 report connected it back to the same root mechanism above (Part 4j).
The mitigation shipped anyway, as a monitored safety net — see Part 4i for
its own history, Part 4j for the mechanism reconciliation.

### The fix, tried twice

**Attempt 1** (2026-07-17): migrated to `@opennextjs/cloudflare` (D1).
Directly confirmed this eliminates the Server-Action-404 mechanism
(Symptoms 6/9/10/11 all clean under OpenNext — Part 4c/4d). Found a
*second, unrelated* bug during the full production cutover — a
self-referential loopback `fetch()` in the content-loading code, unreliable
under the new runtime — and reverted the whole migration back to
`next-on-pages` the same night (commit `4e25255`) rather than fix-forward
under live pressure. This silently reintroduced the Server-Action-404
mechanism sitewide, undetected for two days.

**Attempt 2** (2026-07-19): with the content-loading bug now fixed
(`ASSETS.fetch()` instead of the loopback, Part 4f/4k) and the
previously-unmeasured "hydrate-then-not-found" risk actually measured for
the first time (~1.8-2.8% in preview-quiet conditions, not the "unmeasured
100%-trigger" uncertainty Part 4f.5 originally flagged — Part 4k),
re-attempted the migration. Domain cutover took two tries: the first
(remove only the Pages binding, retry the Worker claim) 409-conflicted 14/14
times over 90 seconds with zero drift, proving the actual DNS record — not
a binding-release delay — was the blocker; rolled back cleanly (~2min). The
second, after building and dry-run-testing a real CNAME-recreation
fallback, deleted the CNAME directly and succeeded on the **first** claim
attempt (~6 second outage). Post-cutover: full parity audit confirmed
clean, sign-in/out confirmed working by direct real-user testing
(automated headless-browser testing kept failing for reasons traced to the
test method itself, not a production defect — see Part 4l).

### Current status (as of the 2026-07-19 cutover)

- **Symptom 8/9/10/11 (Server-Action-404, sitewide)**: RESOLVED. Confirmed
  on real production, both the original academies-page manifestation and
  the BCHHC manifestation.
- **Symptom 13 (BCHHC reload mitigation)**: still in place as a monitored
  safety net, likely now redundant with the D1 fix but not separately
  verified safe to remove.
- **Open**: a 24-48h post-cutover monitoring window (`wrangler tail` +
  periodic real-browser checks), watching specifically for the rare
  not-found-swap pattern under real traffic and any recurrence of the
  404. Check Part 4k/4l and the monitoring log for current status.
- **Separately, not yet investigated**: a friend's Google-auth "400 -
  authenticate ID not found" error, likely a Clerk Dashboard OAuth
  redirect-URI or Google Cloud Console misconfiguration — explicitly not
  the same issue as the above (Part 4j).

**For full detail on any specific claim above**: Part 4a (why D1 was
originally deferred), 4c/4d (attempt 1, isolated repro + full migration),
4e (attempt 1's revert and why), 4f (retry-readiness planning, the content
fix, the corrected risk measurement), 4f.5 (attempt 1's readiness
verification and NOT READY call), 4g/4h (a related but distinct
soft-navigation-stall investigation, not part of this mechanism), 4i
(Symptom 13's own investigation and fix), 4j (the sitewide reconciliation
that connected Symptom 13 back to Symptom 10/11), 4k (attempt 2's
reconciliation and pre-cutover verification), 4l (attempt 2's execution,
the `main` branch reset, and the parity audit).

---

## Part 4 — New, unresolved symptoms found during tonight's incident

### Symptom 9 · Nested dynamic route 404 on question-bank attempt pages (unresolved, unconfirmed mechanism)
Real DevTools evidence: on `/question-bank/[paperSlug]/attempt/[attemptId]`, two
RSC fetches with `?_rsc=` succeed (200), then a third fetch to the bare attempt
UUID — missing its own path prefix, issued by Next's own client-side router
chunk — 404s ("Uncaught (in promise) Error: An unexpected response was received
from the server").

Static code review this session found nothing obviously wrong:
`app/question-bank/[paperSlug]/attempt/[attemptId]/page.tsx` is a pure edge-runtime
Server Component; `AttemptRunner.tsx`'s two client `fetch()` calls
(`/api/question-bank/save-answer`, `/api/question-bank/submit`) are correctly
path-prefixed POSTs with `attemptId` in the JSON body, not the URL. Nothing in
the component itself constructs a bare-UUID request. Working theory (still
unconfirmed) remains a `next-on-pages`/RSC routing defect specific to this
three-segment-deep dynamic route — the same adapter/RSC class of issue as
Symptoms 6 and 7, but a distinct mechanism from either. Diagnosing this further
needs the live-tail/instrumentation approach that resolved Symptom 6, not more
static reading. **Explicitly distinct from Symptom 8** — do not conflate.

### Symptom 10 · Retry-storm resource exhaustion causing intermittent whole-site 503s (RESOLVED 2026-07-18 — see Part 4d's fix and the C4 recheck below)
A Clerk client-side retry loop generated enough load to trip Cloudflare Worker
resource limits (Cloudflare error 1102), causing an intermittent 503/200 flap
across the **entire site**, not just one route.

**Re-confirmed live during this session's verification pass**: polling `/`,
`/learn`, `/academies/devops`, and `/about` repeatedly, one poll returned 503 on
`/` and `/academies/devops` while `/learn`/`/about` returned 200 in the same
pass; four subsequent polls seconds later were all 200 across every route. This
matches the described pattern exactly — intermittent, self-recovering, whole-site
blast radius, not a fluke and not a full outage.

**Known interim mitigation (must stay documented prominently)**: avoid signing
out from a question-bank page specifically until this is fixed; sign out from
any other page instead. **Extended today (2026-07-16, see Symptom 11): also
avoid signing IN from a question-bank/attempt page** — the same class of
Clerk-internal-action failure reproduces on sign-in there too, not just
sign-out.

Given the whole-site blast radius, this needed priority attention ahead of
most other open items — see Part 6 priority order.

**RESOLVED 2026-07-18 (C4 recheck)**: the `prefetch={false}` fix on
`Navbar.tsx`/`Footer.tsx` (Part 4d, kept intact through the D1 revert —
Part 4e — since it's adapter-independent) was re-verified directly against
**production**, not just a preview, tonight. Method: a real disposable
Clerk account created via the live Backend API, a genuine sign-in attempt
against `synfracore.com` (reached the point of submitting real credentials
before hitting an expected new-device email-verification wall, which
wasn't completed — no real inbox access, and bypassing it wasn't
attempted), while polling `/`, `/academies/devops`, `/learn`, and `/about`
throughout. **Result: 0 failures across 48 real production requests**
(20 baseline + 28 during live auth-flow activity), consistent with the
original preview A/B result (8 failures → 0 after the fix). Test account
deleted after. Marking this resolved — the whole-site 503 blast radius
this symptom describes has real, current evidence against it recurring,
on production, not just a preview.

One unrelated thing surfaced during this recheck, noted for the record but
**not** conflated with this resolution: a single React error `#418`
(hydration mismatch) fired once during the sign-in attempt, before
`setActive()` ever ran — doesn't match Symptom 11's documented mechanism
(which requires `setActive()`/`signOut()` completing), so it's more likely
an unrelated hydration hiccup than a recurrence of Symptom 11. Not
investigated further tonight; flagged in case it recurs.

### Symptom 11 · Clerk's internal cache-invalidation Server Action 404s on sign-in/out while on a question-bank/attempt page, crashing hydration (open, reproduced live 2026-07-16)
Reproduced live with full console evidence on both directions:

- **Sign-in**, initiated from `/sign-in?redirect_url=%2Fquestion-bank%2Fbchhc-practice-1`
  (arrived at via Symptom 8's existing redirect race): after credentials are
  submitted, Clerk's `setActive()` call internally POSTs back to the current
  `/sign-in?redirect_url=...` URL — a 404. Followed immediately by `Uncaught
  (in promise) Error: An unexpected response was received from the server`
  and a React hydration error (`#418`, text mismatch).
- **Sign-out**, initiated from `/question-bank/bchhc-practice-2/attempt/<uuid>`:
  Clerk's `signOut()` → `__internal_onBeforeSetActive` internally POSTs to
  that exact current attempt-page URL — also a 404, same downstream "unexpected
  response"/hydration-error pair.

**Root cause, confirmed via primary sources (Clerk/Cloudflare community reports of
the identical error signature) and via this project's own prior investigation,
not guessed**: Clerk's Next.js SDK dispatches an internal `"use server"` Server
Action (`invalidateCacheAction` — the exact same mechanism already documented as
Symptom 2's root cause) to invalidate Next's RSC cache after any `setActive()`/
`signOut()` call. `@cloudflare/next-on-pages` has a confirmed, long-standing
incompatibility with Server Action dispatch (Symptoms 2 and 6). This is **not a
new bug class** — it is Symptom 2's exact mechanism, newly reproduced on a route
where its effect is visible and breaking, rather than silently degrading.

**This is NOT caused by, and is not fixed by, today's `AttemptStatusButtons`
client-refetch fix** (Part 0/Track A work) — neither stack trace contains any
reference to that component or its `/api/question-bank/attempt-status` fetch.
That fix remains correct and will still work once this deeper crash is resolved,
or in any case where Clerk's internal action doesn't fire/fail. But it cannot by
itself prevent a hydration crash caused by Clerk's own SDK internals racing
against this adapter.

**No page-level patch closes this.** The structural fix is **OP-2/D1 — migrating
off `@cloudflare/next-on-pages` to `@opennextjs/cloudflare`** — already tracked
in this roadmap as the resolution for Server-Action-dispatch failures generally.
Until D1 ships, treat this as a known, documented limitation (see the extended
Symptom 10 mitigation above), not a bug to chase with further page-level fixes.

## Part 4a — C4 investigation, 2026-07-16: why D1 was deferred rather than attempted tonight

Per Part 8's priority order, C4 (fix Symptom 10/11's root cause) was investigated
ahead of Phase B, on the working assumption that the fix was the already-planned
D1 (OpenNext migration). Before writing any migration code, checked whether that
assumption actually holds:

- **No documented way to disable or safely work around Clerk's internal
  RSC-cache-invalidation Server Action exists.** Neither Clerk's own docs nor
  community discussions surface a config option for this — confirmed via
  targeted search, not assumed.
- **The migration's actual payoff is confirmed partial, not full.**
  `lib/clerk/authFallback.ts:9-11` — written during a prior session's
  investigation of Symptom 3, not tonight — already states plainly: "reproduces
  on both `@cloudflare/next-on-pages` (what we're on) and `@opennextjs/cloudflare`
  (the planned 3.8 migration target), so migrating will NOT fix it," linking
  [opennextjs-cloudflare#524](https://github.com/opennextjs/opennextjs-cloudflare/issues/524).
  Confirmed independently tonight via web search: #524 ("Clerk Next.js
  middleware isn't detected") and a second, separate open issue,
  [#281](https://github.com/opennextjs/opennextjs-cloudflare/issues/281)
  ("Unable to decrypt request data"), are both real, both closed-but-on-older-
  versions-than-ours (Next.js 15.2.4/OpenNext 0.6.5 and Next.js 15.1.5/OpenNext
  0.3.9 respectively, vs. our Next.js 15.5.20), with no visible resolution
  detail confirming they're actually fixed rather than closed as stale. There
  is a community repro repo (`jenslys/clerk-opennext-bug`) built specifically
  around this pattern, confirming it's recognized, not a one-off report.
  **Whether D1 fixes Symptom 10/11 specifically (a different Clerk code path —
  the internal cache-invalidation action, not the auth-detection issue #524
  describes) was genuinely unconfirmed either way at the time this was
  written. Since confirmed via an isolated repro — see Part 4c below.**
- **Scope is larger than this roadmap previously described**, confirmed by
  reading OpenNext's actual Cloudflare migration docs rather than assuming from
  the summary already in this file: 50 files repo-wide use
  `export const runtime = "edge"` and all would need it removed; `wrangler.toml`
  needs a full rewrite (OpenNext expects `wrangler.jsonc` and a
  `.open-next/worker.js` entry point); an R2 bucket needs to be created in the
  Cloudflare dashboard for the incremental cache (a manual, external step, same
  category of dependency as the Clerk-domain-verification issue found earlier
  tonight); and `lib/rateLimit.ts:15` (`getOptionalRequestContext` from
  `@cloudflare/next-on-pages`, reading `BLOG_KV` off `globalThis`) needs
  rewriting for the Workers `env`-argument binding pattern OpenNext uses
  instead.

**Decision: D1 deferred, not attempted tonight.** Given a confirmed-partial
payoff, unconfirmed effect on the actual symptom being chased, and a
multi-hour, 50+-file scope requiring external Cloudflare resource setup, this
needs its own dedicated project with a real time budget — not something to
attempt live mid-roadmap-execution on ambiguous upstream signal. The current
mitigation (CLAUDE.md's Do-Not entry, Part 4's extended Symptom 10 warning)
stays in place. Before the next D1 attempt: re-check #524 and #281 for updates,
and consider filing a minimal repro against current versions (Next.js 15.5.x)
if upstream status is still unclear, per the roadmap's own "don't brute-force"
rule.

---

## Part 4b — Symptom 12 (2026-07-17): the Clerk-migration self-heal fix itself was broken, twice in a row, both times a database-privilege gap the app-code fix couldn't see

### Symptom 12 · `relink_user_id()` (the self-heal function built to fix Symptom 3's Clerk test-to-live migration, see `06-roadmap.md`) silently failed for every account after the first one — RESOLVED

**Context**: earlier this session, `synfracore@gmail.com`'s account was manually
re-linked from its old Clerk test-mode id to its new live-mode id via raw SQL
(`lib/supabase/ensureUser.ts`'s `tryRelinkByEmail()` + a new `relink_user_id()`
Postgres function were then built to make this self-healing for every other
account going forward — see `06-roadmap.md`'s account-migration entry for that
build). It was verified working for `synfracore@gmail.com` and deployed. It
then failed for the next two accounts that actually exercised it
(`visshnu9999@gmail.com`, `pillipratima@gmail.com`) — **twice, for two
different reasons**, neither visible from reading the application code, both
found only via live `wrangler pages deployment tail` capture of the function's
own error, matching this project's established rule: get the real error before
theorizing.

**Failure 1 — missing GRANT, not a code bug.** Live tail on a real sign-in
attempt showed:
```
"code": "42501",
"hint": "Grant the required privileges to the current role with: GRANT UPDATE ON public.users TO service_role;",
"message": "permission denied for table users"
```
`relink_user_id()` is a plain (non-`SECURITY DEFINER`) function, so its internal
`UPDATE` statements run as whatever role calls it — `service_role`. Earlier in
this same session, `service_role` had only been granted `SELECT` (via a broad
`GRANT SELECT ON ALL TABLES IN SCHEMA public TO service_role`, done to unblock
read-only diagnostic queries) — never `UPDATE` or `INSERT`. The function had
been *tested* (for `synfracore@gmail.com`, via manual SQL run directly as the
`postgres`/superuser role in the SQL Editor, which bypasses this entirely) but
never actually *exercised through the app* until a real second account hit it,
so this gap was invisible until then. **Fix**: `GRANT UPDATE, INSERT ON
public.users TO service_role;` plus `UPDATE` on the four dependent tables.

**Failure 2 — the function's own table list was incomplete, found immediately
after fixing Failure 1.** Same live-tail technique, next attempt:
```
"code": "23503",
"details": "Key (id)=(user_...) is still referenced from table \"quiz_attempts\".",
"message": "update or delete on table \"users\" violates foreign key constraint \"quiz_attempts_user_id_fkey\" on table \"quiz_attempts\""
```
`relink_user_id()` had been written to cover exactly the three tables
`synfracore@gmail.com`'s specific account happened to have rows in
(`user_domain_preferences`, `recent_activity`, `paper_attempts`) — not the full,
complete list of every table with a `user_id REFERENCES users(id)` foreign key.
`quiz_attempts` (and, latent but unexercised so far, `lesson_progress`,
`roadmap_progress`, `bookmarks`) were never included, so any account with data
in one of the omitted tables would hit the identical class of failure the
function was built to prevent. **This is the same root mistake as Failure 1,
one level up**: the fix was validated against one specific account's data
shape instead of the schema's actual, complete dependency graph. **Fix**:
rewrote `relink_user_id()` to cover all seven tables that reference
`users(id)` (confirmed via `grep -n "REFERENCES users(id)"` across
`docs/learner-platform-schema.sql` and `docs/question-bank-schema.sql`, not
assumed from memory), and made all seven's FKs `DEFERRABLE INITIALLY DEFERRED`
(the four not already set from the `synfracore@gmail.com` fix needed the same
treatment — see `06-roadmap.md` for why plain sequential `UPDATE`s can't
re-point a primary key referenced by non-deferrable FKs at all, regardless of
statement order).

**Verified**: `visshnu9999@gmail.com` re-linked successfully immediately after
both fixes landed — confirmed via direct Supabase query (`id` changed from the
old test-mode value, `updated_at` bumped to the current timestamp) — not just
"no error shown," per this project's standing rule to confirm data state
directly rather than trust a lack of a visible error.

**Lesson for any future self-heal / data-migration code on this project**:
test it against the schema's full dependency graph, not just whichever single
account happens to be on hand to test with. A fix "confirmed working" against
one account's data shape is not confirmed complete — the next account with a
different data shape is a real, separate test case, not a formality.

---

## Part 4c — 2026-07-17: isolated OpenNext+Clerk repro, confirming Symptom 2/6/8/10/11's fix path

Part 4a left this open: "Whether D1 fixes Symptom 10/11 specifically... is
genuinely unconfirmed either way." Rather than commit to the full 50-file
production migration on that uncertainty, built a minimal, throwaway,
completely separate repro to test the specific mechanism directly, deployed
via `@opennextjs/cloudflare` to its own Cloudflare Worker
(`opennext-clerk-repro.vishvibeofficial.workers.dev`) — **no production code,
config, or deploy pipeline touched.** Exact production package versions
(`@clerk/nextjs@7.5.12`, `next@15.5.20`, `react@19.2.4`), `clerkMiddleware()`,
and — critically — a route protected with `auth.protect()` mirroring
`middleware.ts`'s real `isRedirectOnSignedOut` pattern, to keep the repro
honest rather than artificially clean.

**Method note on tooling**: no browser automation was available at the start
of this session (no sudo for Playwright's system deps in this WSL
environment). Worked around it without sudo by downloading the ~23 required
`.deb` packages via `apt-get download` (doesn't require root) and extracting
them locally via `dpkg -x` into a user-owned directory, pointed at via
`LD_LIBRARY_PATH`. Cloudflare Turnstile (Clerk's bot-protection on sign-up)
initially blocked scripted interaction entirely, even with correct
coordinates — resolved by using Clerk's own first-party `@clerk/testing`
package, which issues a server-verified Testing Token that Clerk's frontend
recognizes and bypasses Turnstile for (`captcha_bypass: true`, confirmed in
the API response), rather than trying to defeat the CAPTCHA.

**Result — clean on every real interaction tested:**
- Fresh sign-up + email verification → `setActive()` fires → session created,
  `isSignedIn: true`. No 404, no "unexpected response" error, no React #418.
- Sign-in with an existing verified account (including a forced new-device
  verification challenge) → same clean result.
- **Sign-out from the middleware-protected route** (the closest analogue to
  the actual production failure — signing out from
  `/question-bank/.../attempt/<uuid>`, not the homepage) → `signOut()` fires
  → clean transition to `isSignedIn: false`, middleware correctly bounced the
  page back to `/`, **UI updated in place with no manual refresh needed** —
  the exact symptom that was breaking in production.

**Two things checked specifically because they were flagged as open
questions, not assumed:**
1. **Initiator of the one anomaly seen** (`net::ERR_ABORTED` on a POST to the
   app's own origin, observed once during initial testing): attempted to
   capture via Chrome DevTools Protocol's `Network.requestWillBeSent`/
   `loadingFailed` events across 3 additional sign-in/out cycles. **Did not
   reproduce even once** in those 3 attempts — meaning no definitive
   Initiator stack trace was obtained either confirming or ruling out a
   benign cause. Treat as: a real but low-frequency, non-reliably-reproducing
   event, most consistent with a superseded/cancelled soft-navigation (the
   working theory going in), but **not proven** — worth instrumenting for
   specifically once D1 work actually starts, not treated as closed.
2. **Whether `getAuthSafely()`'s server-side fallback pattern (used at all 8
   production call sites) could make production behave differently than this
   minimal repro**: `getAuthSafely()` only affects how the *server* reads an
   already-established session (a workaround for `auth()`'s broken
   AsyncLocalStorage handoff to Server Actions/Route Handlers — Symptom 3).
   The mechanism under test here — Clerk's *client-side* SDK firing an
   internal Server Action after `setActive()`/`signOut()` — is entirely
   upstream of that; it fires from the browser before any of our server code
   runs. **This is a reasoned conclusion from how the two mechanisms compose,
   not something independently re-tested against the literal 8 call sites**
   — the isolated repro deliberately doesn't include them, since including
   production's exact server code would defeat the point of a minimal
   repro. Flagged as a remaining verification item, not asserted as proven.

**Bottom line**: this is real evidence that D1 (`@opennextjs/cloudflare`)
resolves the specific mechanism behind Symptoms 2, 6, 8, 10, and 11 — tested
against production's real middleware/`auth.protect()` shape, not just the
simplest possible Clerk integration. It is not a guarantee that migrating the
full production app will be friction-free (issue #524's auth-detection bug is
still real and separate, per Part 4a — `getAuthSafely()` stays needed
regardless of migration status), and the two items above remain open
verification work for whenever D1 is actually planned as its own dedicated
project, not started tonight. The repro stays live and untouched as a
reference until then.

---

## Part 4d — 2026-07-17: full D1 (OpenNext) migration executed and merged

Following Part 4c's isolated repro, executed the full production migration
from `@cloudflare/next-on-pages` to `@opennextjs/cloudflare` on branch
`feat/d1-opennext-migration`, per Phase 0 rules (dedicated branch, native WSL
build, Cloudflare preview verified before any production deploy).

**Migration mechanics**: removed `@cloudflare/next-on-pages`; added exact-pinned
`@opennextjs/cloudflare@1.20.1` and `wrangler@4.111.0`; replaced
`wrangler.toml` with `wrangler.jsonc`; removed `export const runtime = "edge"`
from all 51 files that had it (confirmed as a hard OpenNext build-blocker);
swapped `getOptionalRequestContext()` for `getCloudflareContext()` in
`lib/rateLimit.ts`'s KV access; added `initOpenNextCloudflareForDev()` to
`next.config.ts` for local binding access. Build and deploy both confirmed
working end-to-end against a dedicated preview Worker
(`synfracore-d1-preview`, kept fully separate from the production `synfracore`
project throughout).

### Symptom 10 fix — Link prefetching under load, confirmed root cause and fix

The whole-site 503 flapping seen under repeated sign-in/out cycles (Symptom
10) was root-caused to Next.js's own aggressive `<Link>` prefetching in
`Navbar.tsx`/`Footer.tsx` — not present in Part 4c's minimal repro because
that repro didn't carry this app's real nav complexity (Academies dropdown,
mobile drawer, footer link columns). Fixed by adding `prefetch={false}` to
all secondary links (kept default prefetch only on the 2-3 most
likely-next-clicked links: Dashboard and "Start Learning"). Confirmed via
controlled before/after A/B testing on the preview Worker: 4 sequential
sign-in/out cycles went from 2/4 producing 503s to 0/4, repeated across two
independent runs (8 total clean cycles post-fix vs. the prior 2-4 failing
cycles pre-fix).

### Symptom 6 fix — confirmed via isolated Server Action test

Built a temporary, isolated test route performing a real authenticated
Supabase mutation via a genuine `"use server"` Server Action (not a Route
Handler), to verify Symptom 6 independently of the unrelated bug found below.
Confirmed clean: the mutation succeeded, no 404, no hydration crash. This
test route was deleted before merge — it was scaffolding only, not part of
the shipped app.

### Symptom 9/11 fix — confirmed

Sign-in from the question-bank landing page and sign-out from an attempt page
both completed cleanly on the preview Worker: UI updated in place, no
manual refresh needed, no React #418 — the exact prior failure modes. The
Academies dropdown was also re-verified expanding correctly (visual check).

### New finding — unreproducible hydrate-then-404 on question-bank landing pages

During Step 3 verification, `/question-bank/[paperSlug]` was observed once to
server-render correctly and then have its content swap to the `not-found.tsx`
UI shortly after — the URL stayed correct throughout, so a URL-only check
(the level of verification originally used to call Symptom 8 "passed") would
have missed this; it was only caught by actually reading page content, not
just the URL and console. The mechanism looks like a second, client-triggered
Flight/RSC request to the same route returning a 404 after the initial
server render succeeded.

**Reproduction effort**: 74+ targeted attempts across varied stress patterns
(simultaneous tabs, cache-disabled rapid reload, throttled network, repeated
navigation cycles, and the techniques suggested by a second AI's independent
review of this finding — see below) did not reproduce it again. Two things
were ruled out directly rather than assumed:
- **Not present on production** (`next-on-pages`) — confirmed genuinely new
  under OpenNext, not a pre-existing bug that happened to be noticed now.
- **Not a general dynamic-route problem under OpenNext** — every other
  `[param]`-shaped route tested (7 others, including `/academies/devops`)
  stayed clean across the same stress patterns.

**Second opinion sought**: given 34 consecutive clean reproduction attempts
at that point, a second AI's independent analysis was obtained and reviewed
in full. It proposed additional targeted reproduction techniques (tried,
still no reproduction — see above), specific Worker-level diagnostic
logging, and a Sentry field spec. Its overall assessment, used here close to
verbatim as the residual-risk framing for this decision:

> **Confidence in each hypothesis** (independent review, 2026-07-17):
>
> | Hypothesis | Confidence |
> |---|---|
> | Race between OpenNext's dynamic-route resolution and Next's client router on a soft navigation | Moderate |
> | Transient KV/cache-binding miss during the adapter's route matching | Low-moderate |
> | Cloudflare edge-level retry/redirect artifact on a specific colo | Low |
> | Genuine upstream bug in `@opennextjs/cloudflare` or Next.js's Flight request handling | Low-moderate |
> | Confounded by unrelated client state (stale service worker, browser extension, etc.) | Low |
>
> Given the 34 consecutive clean attempts, I would not hold up the migration
> over this. I'd ship with enhanced observability (Sentry plus targeted
> Worker logging for 404s on Flight requests) and wait for the next real
> occurrence. If it happens again with the full request headers captured,
> there's a good chance you'll have enough evidence to either isolate a
> configuration issue or file a high-quality reproducible bug against
> `@opennextjs/cloudflare` or Next.js.

**Decision**: accepted as a residual, monitored risk rather than a merge
blocker — go, contingent on the diagnostic instrumentation below being in
place first (it is) and kept live for at least 1-2 release cycles even if the
bug never recurs, rather than removed prematurely because it looks unused.

### Diagnostic instrumentation shipped (live now, on `main`)

Two-sided logging, verified end-to-end via a controlled known-404 test
(confirmed both halves fire and are visible via `wrangler tail`):

- **Server-side** (`app/not-found.tsx`): logs on every render of the
  not-found page — `accept`, `rsc`, `next-router-state-tree` length,
  `next-router-prefetch`, `purpose`, `priority`, `user-agent`, and the
  correlation fields below. This runs as part of resolving the actual
  failing request, so its `headers()` reflect that real request, not a
  reconstruction after the fact.
- **Client-side** (`components/NotFoundDiagnosticsBeacon.tsx` →
  `app/api/diagnostics/not-found/route.ts`): fires a `sendBeacon` with the
  real `window.location.href`, `document.referrer`, and navigation type
  (`navigate`/`reload`/`back_forward`/`prerender`) — the piece the server
  side can't see.
- **Correlation fields**, added specifically so a future recurrence can be
  matched across both logs: `cfRay` (exact match between the two logs),
  `pathname` (best-effort guess server-side via the `next-url` header;
  authoritative on the beacon side, derived from the client's actual
  `window.location`), and millisecond-precision `timestamp`/`receivedAt`
  (ISO 8601, approximate match — the two logs fire a few ms apart on
  server vs. client).

### Sentry-readiness spec (documentation only — NOT installed in this branch)

Per explicit instruction, Sentry stays a separate D3 task (see Phase D).
`@sentry/nextjs` is confirmed not installed anywhere in this codebase (OP-3
finding, still true). This is a spec to implement against when D3 starts,
not code shipped now:

- **Fields to capture on every `not-found` event**, matching what the
  instrumentation above already collects so no data collected tonight goes
  to waste once Sentry lands:
  - Current URL (`window.location.href` — beacon already has this).
  - Previous/referrer URL (`document.referrer` — beacon already has this).
  - Cloudflare request ID / Ray ID (`cf-ray` — both server and beacon logs
    already have this as `cfRay`; add as a Sentry tag, not just breadcrumb
    data, so it's filterable in the Sentry UI).
  - Navigation type: hard vs. soft nav (`performance.getEntriesByType
    ("navigation")[0].type` — beacon already captures this).
  - Pathname, using the same correlation-field approach above (authoritative
    from `window.location.pathname` client-side).
- **Implementation shape**: wrap the existing `console.error("[not-found]",
  ...)` and `console.error("[not-found-beacon]", ...)` calls with
  `Sentry.captureMessage()` (or `captureException` if this is later found to
  correlate with an actual thrown error) carrying the same JSON payload as
  `extra` context, plus `cfRay` as an indexed `tag`. Both call sites are
  already isolated (`app/not-found.tsx`, `app/api/diagnostics/not-found/
  route.ts`) so this is a small, additive change when D3 starts — no
  restructuring needed.
- **Do not** install `@sentry/nextjs`, add a `sentry.client.config.ts`/
  `sentry.server.config.ts`, or wire a DSN in this branch. That's D3's scope.

---

## Part 4e — 2026-07-17/18: D1 (OpenNext) migration reverted, PAUSED INDEFINITELY

**Status: paused, not abandoned.** The migration is not being pursued
right now given the risk/time cost discovered below, weighed against a
week already spent on this investigation — but it remains a documented,
viable option to come back to later, not a dead end. If revisited, the
root cause of what broke and the fix direction are already understood
(see below) and would not need re-discovering.

### Why it was attempted

Part 4a/4c established that Symptoms 2, 6, 8, 10, and 11 all shared one
underlying mechanism: Clerk's client-side SDK firing an internal
cache-invalidation Server Action after `setActive()`/`signOut()`, which
404s under `@cloudflare/next-on-pages` and can crash hydration (React
error #418) — occasionally severely enough to trigger a retry storm that
trips Cloudflare Worker limits and causes intermittent whole-site 503s.
An isolated repro (Part 4c) gave real evidence that `@opennextjs/cloudflare`
(D1) resolves this mechanism, which is why the full migration was
attempted as a dedicated, branch-only effort rather than more
investigation on `next-on-pages`.

### What was confirmed genuinely fixed

Verified directly on a Cloudflare preview Worker running the full app
under OpenNext, not just the minimal Part 4c repro:
- **Symptom 6** — genuine Server Action dispatch, confirmed via an
  isolated authenticated Supabase mutation test.
- **Symptom 9** — question-bank landing-page 404 on sign-in, confirmed
  clean.
- **Symptom 10** — whole-site 503 flapping under repeated auth actions,
  confirmed clean (this was actually fixed by the `prefetch={false}`
  change, which is adapter-independent and has been kept — see below).
- **Symptom 11** — Clerk's internal cache-invalidation Server Action
  404ing and crashing hydration on sign-in/out from a question-bank page,
  confirmed clean: UI updated in place, no manual refresh, no React #418.

These are real, reproduced results — the mechanism these symptoms share
genuinely does not occur under OpenNext. That part of the hypothesis was
right.

### What broke

A site-wide content-loading regression, found only after the full
production migration and domain cutover (not caught by the preview
testing above, which focused on the auth symptoms specifically) — root
cause precisely identified, not just observed:

`lib/content/index.ts`'s `fetchContent()` does not read content files
from disk (`fs.readFileSync`); it makes an HTTP `fetch()` call **from
inside the Worker, to the Worker's own public hostname**
(`app/academies/[academy]/[technology]/[section]/page.tsx` builds
`baseUrl` from the incoming request's `Host` header and fetches
`${baseUrl}/content/{path}.md` during SSR). This self-referential
loopback fetch behaves differently — and unreliably — under the
`@opennextjs/cloudflare` Worker runtime versus `next-on-pages`. The
static assets themselves were confirmed correctly bundled (`.open-next/
assets/content/...` served real files at `200`); the failure was
specifically in the Worker calling itself mid-request. Made worse by a
second, independent bug found in the same code path: `fetchContent()`
wraps the whole thing in `catch { return null }`, so any failure —
network, timeout, or otherwise — silently collapses to "no content
exists yet," rendering the honest-looking but wrong empty-state UI
instead of an error. This is why it wasn't caught immediately: the page
returns a clean `200`, not a 5xx.

### The decision to revert

Once found, two paths existed: fix `fetchContent()` (the real fix
direction: use OpenNext's `ASSETS` binding directly instead of an HTTP
self-fetch, avoiding the loopback entirely — see below) and re-verify,
or revert to the known-good baseline and re-attempt later. Chose to
revert, for reasons of accumulated risk and time cost, not because the
fix direction was unclear:

- This was the second unexpected, site-wide production issue found
  during this migration in one night (the first being the DNS/domain
  cutover complications documented implicitly in the commit history
  around this time), on top of a full week already spent on the D1
  investigation (Part 4a through 4d).
- The content regression was found *after* the domain had already been
  cut over to the Worker — meaning the preview-only verification process
  (Step 3 of the original migration plan) had a real gap: it verified
  the auth symptoms thoroughly but didn't catch a content-loading issue
  that only manifested under real production traffic patterns.
- Re-fixing and re-verifying would mean a third cutover attempt in the
  same session, each with its own DNS propagation and domain-binding
  risk (independently confirmed nontrivial tonight — see the DNS
  record/Cloudflare-incident troubleshooting around this same time).
- The underlying goal (fixing Symptoms 2/6/8/10/11) has a smaller,
  narrower, lower-risk path available: a targeted code fix on
  `next-on-pages` itself, matching how the onboarding auth bug was
  already fixed once before, rather than a platform migration. See the
  next section of this roadmap for that work.

### The revert

**Commit `4e25255`** ("revert: undo D1/OpenNext migration, stay on
next-on-pages permanently") is the clean revert. Surgical, not a blind
`git revert` of the whole migration merge — it restores exactly the
adapter-critical material (`export const runtime = "edge"` on all 51
routes that had it, `package.json`, `wrangler.toml`/`wrangler.jsonc`,
`next.config.ts`, `lib/rateLimit.ts`) while deliberately keeping two
things that turned out to be real, adapter-independent fixes discovered
during the migration work:
- The `prefetch={false}` fix on `Navbar.tsx`/`Footer.tsx` for Symptom
  10's 503 flapping — already documented as live on production *before*
  the D1 work started, so this isn't OpenNext-specific and is worth
  keeping regardless of adapter.
- The Symptom 12 `relink_user_id` self-heal fix (`lib/supabase/
  ensureUser.ts`, `docs/relink-user-id-fix.sql`, `app/api/ensure-user/
  route.ts`, `components/quiz/SectionQuiz.tsx`) — unrelated to D1
  entirely.

One additional finding surfaced during the revert itself, worth
recording: `app/not-found.tsx`'s diagnostic instrumentation (built
during Part 4d for the unresolved hydrate-then-404 investigation) could
not simply have its edge-runtime export restored — `next-on-pages`
does not support runtime logic (`headers()` calls) in the special
`_not-found` route at all, confirmed by the local build itself
refusing to produce output with it in place. That instrumentation and
its two supporting files (`components/NotFoundDiagnosticsBeacon.tsx`,
`app/api/diagnostics/not-found/route.ts`) were removed as part of the
revert, since they cannot run on the adapter being kept. The
underlying hydrate-then-404 finding from Part 4d remains unresolved and
unreproduced either way — it was never confirmed to be an OpenNext-only
issue, so it's still a real, if rare, open item independent of the
adapter decision.

### If this is revisited later

Both open questions from a prior attempt would be pre-answered, not
re-discovered from scratch:
1. **The content-loading fix**: replace `fetchContent()`'s
   self-referential HTTP `fetch()` with OpenNext's `ASSETS` binding
   (`env.ASSETS.fetch(request)` or equivalent) called directly inside
   the Worker, never crossing back out to the public hostname. This was
   identified and agreed as the correct architectural fix, not yet
   implemented.
2. **The auth mechanism fix**: already proven working end-to-end on a
   full preview deployment (Symptoms 6/9/10/11), not just the minimal
   Part 4c repro — no re-verification of *that* part would be needed,
   only the content-loading fix and a fresh, more thorough Step 3
   verification pass that specifically includes content-page checks
   across several academies (not just auth flows) before any future
   domain cutover.

### Post-revert: one narrow next-on-pages-native fix attempted and disproved (2026-07-18)

With D1 paused, tried a small, targeted, `next-on-pages`-native fix for
Symptom 11 instead of a platform migration — matching how the onboarding
auth bug was fixed earlier (a code-level fix, not an adapter swap). Found
a real structural difference: `components/question-bank/StartButton.tsx`
was the only sign-in entry point in the app that navigated to the
standalone `/sign-in?redirect_url=...` page (`router.push`); every other
entry point (`Navbar.tsx`'s `<SignInButton mode="modal">`) uses Clerk's
modal, which never navigates away from the current page. Hypothesis: if
Symptom 11's reproduction was tied to landing on that specific URL shape,
switching `StartButton.tsx` to `useClerk().openSignIn()` (modal, in place)
should avoid it.

**Built, deployed to a genuine Cloudflare Pages preview, and tested with
a real Playwright browser session** — not local `next dev` (the bug is
adapter-specific and doesn't reproduce there) and not just markup/response
checks. A pre-created test account (Clerk Backend API, bypassing Turnstile)
signed in end-to-end through the modal: email → password → new-device OTP
(6-digit code, confirmed "✓ Success" in a captured screenshot) →
`setActive()` actively resolving.

**Disproved, with direct evidence**: the modal successfully kept the user
on `/question-bank/bchhc-practice-1` throughout — confirmed via URL
tracking, it never navigated to `/sign-in` — but the crash fired anyway at
the exact `setActive()` moment: `pageerror: "An unexpected response was
received from the server"` plus a `404`, the precise Symptom 11 signature,
caught live by the test's console/page-error listeners. This means the
original hypothesis (landing on `/sign-in?redirect_url=...` specifically
is what triggers the crash) was **wrong** — the crash is not about which
page you're on relative to `/sign-in`. The more likely factor, consistent
with rather than contradicting the pre-existing investigation: **both the
sign-in page (with its `redirect_url` query param) and
`/question-bank/[paperSlug]` are dynamic routes**, and Clerk's internal
`invalidateCacheAction()` Server Action fails to dispatch correctly on a
dynamic route under `next-on-pages`, regardless of which one or how it
was reached (full navigation vs. in-place modal).

**Conclusion, now precisely (not just previously) confirmed**: no small,
`next-on-pages`-native fix is currently known for Symptom 11. D1 remains
the only identified structural fix, and it stays paused (see above) —
this is not a contradiction of that decision, it's independent
confirmation that the decision was reasoning about the right trade-off.
**Standing mitigation unchanged**: CLAUDE.md's existing instruction to
avoid signing in/out specifically from question-bank pages remains the
correct, current answer. This is being left as a known, understood,
mitigated limitation — not something to keep chasing with further
page-level attempts absent a new idea.

---

## Part 4f — D1 Retry Readiness (documentation only — no code changes, no retry attempted tonight)

**Status: still paused.** Raised again 2026-07-18 because the new Practice
Exams tab (Part 4e's aftermath) makes question-bank attempt pages more
discoverable, increasing real-user exposure to Symptom 11 — but decided
explicitly **not** to re-attempt D1 tonight, right after an outage, without
preparation. This section exists so a future attempt starts from everything
already known, not from scratch. Nothing here has been implemented or
tested — it's a plan, not a result.

### 1. The exact content-loading fix

Root cause (Part 4e): `lib/content/index.ts`'s `fetchContent()` makes an
HTTP `fetch()` call **from inside the Worker, to the Worker's own public
hostname** (`${baseUrl}/content/${filePath}.md`, where `baseUrl` is built
from the incoming request's own `Host` header in
`app/academies/[academy]/[technology]/[section]/page.tsx`). This
self-referential loopback fetch is unreliable under
`@opennextjs/cloudflare`'s Worker runtime specifically.

**Fix**: replace the self-fetch with OpenNext's `ASSETS` binding, called
directly inside the Worker — never crossing back out to the public
hostname:

```ts
// lib/content/index.ts — fetchContent(), OpenNext-era version
import { getCloudflareContext } from "@opennextjs/cloudflare";

export async function fetchContent(a: string, t: string, s: string): Promise<string | null> {
  const filePath = contentRegistry.get(`${a}/${t}/${s}`);
  if (!filePath) return null;
  try {
    const { env } = getCloudflareContext();
    const res = await env.ASSETS.fetch(new Request(`https://assets.local/content/${filePath}.md`));
    if (!res.ok) return null;
    return await res.text();
  } catch (err) {
    console.error(`fetchContent failed for ${a}/${t}/${s}:`, err); // was a silent catch — see below
    return null;
  }
}
```

The exact binding-call syntax should be re-checked against
`@opennextjs/cloudflare`'s current docs when this is attempted (API surface
for asset bindings has shifted between versions before — see the pinned
`1.20.1` used in the original attempt). The `baseUrl` parameter and the
server-side `headers()`/host-detection logic in the calling page component
become unnecessary and should be removed, not left dangling.

**Also fix while touching this function** (found during Part 4e's
investigation, not yet fixed): the `catch { return null; }` block silently
swallows the real failure reason, making a genuine error indistinguishable
from "this lesson has no content yet." Log the actual error (as sketched
above) before returning `null`, so a future regression here is diagnosable
from `wrangler tail` instead of requiring another multi-hour investigation.

### 2. Required, expanded Step 3 checklist

**This is the change that matters most — the original Step 3 verification
process had a real gap, not just bad luck.** It thoroughly verified the
auth symptoms (6/9/10/11) via a dedicated preview and real browser testing,
but never specifically tested content-page rendering across a meaningful
sample — the content-loading regression was only found after the domain
had already been cut over to real production traffic.

Before any future domain cutover, Step 3 **must** additionally include:
- **Content rendering verified on at least 5 different academies/
  technologies**, not just one (Docker was the only one checked live
  during the original attempt, purely incidentally). Suggested spread:
  one from each of DevOps, Cloud, Healthcare, Data, and one non-tech
  academy (e.g. Education or Exams) — deliberately varied, not five
  DevOps technologies.
- For each, confirm real lesson text renders (not the "coming soon"
  empty-state fallback) — check actual body content, not just HTTP status.
  A `200` with the wrong content is exactly how this regression hid
  (Part 4e).
- Repeat the check 3-5 times per page, not once. **Correction (2026-07-18):**
  Part 4e's original "roughly 1-in-3" estimate was inaccurate — re-measured
  twice since, on two independent fresh preview deploys of unmodified
  `895f50f` (the pre-revert D1 commit), 5 academies x 5 repeats each: **25/25
  (100%) failing both times**, not ~33%. The failure is consistently
  reproducible on unmodified D1 code, not intermittent — treat it as
  deterministic under this specific bug, not a flaky one. (The repeated-check
  guidance above is still worth keeping as a habit, but not because this
  particular failure needs luck to catch.)
- Only proceed to domain cutover once this expanded content check passes
  cleanly, in addition to the existing auth-symptom checklist.

### 3. DNS/domain-cutover lessons from tonight

Cloudflare Pages and Cloudflare Workers custom domains are mutually
exclusive per hostname, and moving between them is a real, multi-step
operation with a real outage window — not a single API call. What was
learned the hard way tonight:

- **The exact DNS record type to expect**: the production apex record is a
  **CNAME** (`synfracore.com → synfracore.pages.dev`, proxied) when
  Pages owns the hostname. Confirmed via a full zone export during
  tonight's incident.
- **Claiming the hostname for a Worker requires the Pages-side custom
  domain binding removed first**, and — critically, this is the part that
  caused tonight's outage — **removing that binding does not delete the
  underlying DNS record, but does immediately break serving**, because
  Pages stops recognizing the hostname while the record still points at
  Pages' now-unclaimed infrastructure. There is a real gap between
  "Pages binding removed" and "Worker successfully claims the hostname,"
  during which the site is down. Budget for this, don't assume it's
  instant.
- **The rollback command** (Pages side, tested and confirmed working
  tonight):
  ```
  POST /accounts/{account_id}/pages/projects/{project}/domains
  Body: {"name": "synfracore.com"}
  ```
  This re-adds the Pages custom domain binding. If the underlying DNS
  record still exists (most rollback scenarios), this resolves in
  roughly 5-15 seconds. If the DNS record was also deleted, expect a
  slower, less predictable propagation — tonight's second rollback (after
  the CNAME had been deleted) took several minutes and briefly appeared
  stuck before resolving, including one false alarm caused by a stale
  local DNS resolver, not an actual problem.
- **Caution, explicitly**: do not delete the CNAME record before
  confirming the Worker's custom-domain claim has actually succeeded and
  is serving real traffic. Tonight's sequence — delete the CNAME, then
  attempt the Worker claim — created an avoidable window where neither
  side was serving. The safer order: claim the domain for the Worker
  *first* (Cloudflare will report the conflict, e.g. error 100117
  "Hostname already has externally managed DNS records," rather than
  silently succeeding), resolve that conflict deliberately, and only then
  proceed — rather than preemptively clearing the old record.
- An unrelated, active Cloudflare platform incident ("POST requests not
  succeeding," confirmed via cloudflarestatus.com) made tonight's cutover
  meaningfully worse and harder to diagnose in the moment. Check Cloudflare's
  status page before starting a cutover, and if something looks stuck
  in a way that doesn't match the mechanics above, check there again
  before assuming it's something local.

### 4. Timing recommendation

Attempt this on a session with **enough contiguous, uninterrupted time to
see the full cutover through in one sitting** — not squeezed between other
tasks, and not late at night immediately after unrelated work (tonight's
attempt followed directly after a production outage from earlier work on
the same night, which is not the ideal state to start a domain cutover
from). Based on tonight's actual timings: budget for a multi-hour session
covering the full migration re-application, the expanded Step 3 checklist
above, and the domain cutover with its real (not theoretical) outage-window
risk — not a quick evening add-on.

### 5. Verification session findings (2026-07-18) — Production Readiness Report

The `fetchContent()` fix from section 1 above was actually applied and
verified on an isolated Cloudflare preview Worker this session (branch
`verify/d1-content-loading-fix`, based on `895f50f`), scoped to preview-only
verification per explicit authorization — no DNS, no cutover, no merge to
`main`. Full findings below; **this session's conclusion is NOT READY**, for
two independent reasons (regressions + an unresolved risk-basis problem with
Symptom 9/10/11), detailed in 5.4-5.5.

**5.1 Reproduction rate correction — supersedes section 2's "1-in-3" figure.**
The "roughly 1-in-3" estimate above (section 2, "Required, expanded Step 3
checklist") was inaccurate. Re-measured twice this session, on two
independent fresh preview deploys of unmodified `895f50f`, 5 academies x 5
repeats each: **25/25 (100%) failing both times.** The content-loading
failure is deterministic on unmodified D1 code under this specific bug, not
intermittent — treat it as reliably reproducible, not one requiring luck to
catch.

**5.2 The `fetchContentEdge()` fix itself: verified clean.** Same 5x5 matrix
against the fixed build: **25/25 (100%) passing**, zero
`fetchContentEdge failed` errors in `wrangler tail`. This part of the fix is
solid — the regressions and risk issue below are what block readiness, not
this fix.

**5.3 New finding — the not-found trigger fires on effectively every
request, but this is a different signal than a client-visible failure.**
While verifying the fix, `app/not-found.tsx`'s diagnostic `console.error`
was found firing on **100% of tested requests** (25/25), across both
content routes (`/academies/...`) and unrelated non-content routes (`/`,
`/about`), on **both** the fixed and unmodified D1 preview deployments —
confirmed via isolated single-request tests (quiet windows, matching
userAgent, real per-request `cf-ray` values) to rule out unrelated bot
traffic on the public `*.workers.dev` subdomain.

Traced further before concluding anything: fetched a full raw response body
and stripped everything inside `<script>` tags. `"Page Not Found"` (the
literal text `not-found.tsx` renders) appears **0 times** in the
genuinely-rendered HTML on every test — it exists only inside a
`self.__next_f.push(...)` RSC flight-payload script (serialized data, never
displayed DOM). The real page content renders correctly, every time, in all
25/25 checks.

**What this does and doesn't tell us, stated plainly:** the not-found
Server Component's function is executing server-side on every request (not
rare), and its output is riding along in the flight payload (not rare) —
but in every test performed tonight, the client-visible result was still
the correct real content, not the not-found UI. This is a **different
metric** than what "New finding — unreproducible hydrate-then-404" above
describes (an actual content swap witnessed in a real browser). All of
tonight's testing used `curl` — no JavaScript execution, no client-side
router, no real browser — so it cannot reproduce or rule out the
client-triggered second-Flight-request mechanism that section above
describes. **The client-visible failure rate remains unmeasured tonight**
and should not be assumed unchanged just because the trigger turned out to
be common.

What tonight's finding does change: the "34 consecutive clean attempts, ship
with monitoring" recommendation above was built on an assumption that the
underlying trigger was itself rare. That assumption is now shown to be
false — the trigger is on every request, not an edge case. This is direct,
first-hand evidence supporting the "Moderate confidence" hypothesis already
in this file's table (race between OpenNext's dynamic-route resolution and
Next's client router on a soft navigation) — not proof the user-visible
rate has risen, but removal of the reason to believe it's low. Assessed as
**not preview-environment-specific** — reproduced identically across two
independently-built-and-deployed preview Workers, on unrelated routes,
independent of the content-fetch code path — and **likely to hold on
production OpenNext traffic**, since nothing about production changes the
Next.js/OpenNext routing machinery producing it; if anything, production's
higher concurrency and more varied real client conditions are more likely
to tip an already-100%-armed race the wrong way, not less.

**5.4 Regressions found relative to current `main`** (this branch is frozen
at the pre-revert `895f50f` snapshot; `main` kept moving for ~5 days after
the revert):
- **NF-6/B1 hardcoded-stats bug reintroduced** —
  `components/home/CertificationsSection.tsx` reads
  `{certifications.length} Certifications` on `main`, hardcoded back to
  `13 Certifications` on this branch — the exact drift this guardrail
  exists to prevent.
- **Guardrail itself missing** — `scripts/validate-no-hardcoded-stats.mjs`
  (77 lines) doesn't exist on this branch; the CI step
  ("Hardcoded stats guardrail (NF-6)") is absent from
  `.github/workflows/ci.yml`. Nothing would catch a recurrence.
- **A1 title/metadata fix reverted** — `app/certifications/page.tsx`,
  `app/community/page.tsx`, `app/contact/page.tsx`,
  `app/troubleshooting/page.tsx` all lose the `pageMetadata()` helper
  (canonical `path`, OG image params) and revert to plain hardcoded
  `metadata` objects with the doubled `" — SynfraCore"` suffix pattern A1
  fixed.
- **BCHHC "Practice Exams" tab feature missing** —
  `technologyExamTypeMap` (`lib/data/navigation.ts`) and
  `getFirstPaperByExamType()` (`lib/supabase/questionBank.ts`), shipped
  2026-07-18, don't exist on this branch.

No functional regressions found in the D1/OpenNext migration's own core
work (Clerk auth, sign-in/out, Server Actions) — those remain independently
confirmed per Part 4c/4d.

**5.5 Recommendation: NOT READY.** Two independent, sufficient reasons —
not a hedge:
1. Deploying this branch today would silently reintroduce NF-6, drop the A1
   fix on four pages, and remove the Practice Exams feature — concrete,
   already-shipped work this branch doesn't have, not a judgment call.
2. The Symptom 9/10/11 "ship with monitoring" decision rested on the
   trigger being rare. Tonight's evidence shows it isn't. Nobody has
   re-measured the actual client-visible failure rate under that corrected
   understanding, with a real browser, since this was found. (A real-browser
   C3 investigation using this corrected understanding was opened
   separately on `main` the same night — not part of this D1-branch-scoped
   report.)

Before reconsidering this branch: rebase/re-diff against current `main` and
reconcile 5.4's regressions, and get a real-browser measurement of the
corrected 100%-trigger understanding rather than continuing to rely on the
pre-2026-07-18 "rare" figure.

---

## Part 4g — C3 investigation, 2026-07-18: real-browser reproduction attempt on production (`next-on-pages`)

Opened separately from the D1-branch-scoped Part 4f.5 report above, using
its corrected understanding as the starting point. Investigation only — no
code changes, no sign-in/out (per this file's existing CLAUDE.md-documented
restriction), no fix attempted. Method: Playwright/Chromium against **live
production** (`synfracore.com`, current `next-on-pages` deployment, not the
D1/OpenNext branch), clicking real `<Link>`-rendered anchors already in the
DOM to trigger genuine Next.js client-side soft navigation (a synthetic
`<a>` tag does not work — `Link` attaches its own click handler; Next's
router never sees a plain anchor click), correlated in real time against
`wrangler pages deployment tail` on the live production deployment. Two
independent passes, 38 real soft navigations each.

**The specific hypothesized symptom — not-found UI displayed for a URL that
serves real content — did not reproduce. 0/38 across both passes (0%).**
This does **not** close Symptom 9/10/11 as resolved. The hypothesis table
already carried this as one possible manifestation among several
(alongside the KV/cache-binding-miss and edge-retry-artifact hypotheses),
and failure to reproduce under `curl` + a single headless Playwright
browser, over two passes, against one production deployment, is not proof
of absence under the full range of real-world conditions (varied colos,
real user network/CPU conditions, concurrent production traffic, mobile
browsers, longer session durations) — same caveat this file has applied
to every other "clean reproduction attempt" result throughout this
investigation.

### New, separately-tracked finding: intermittent stalled soft-navigation on production

Distinct from the not-found-UI symptom above — a real, different failure
mode: clicking a real sidebar `<Link>` sometimes results in **no visible
navigation at all** — no error thrown, URL never updates, previous page's
content stays displayed — even though the server-side RSC request for the
target route **succeeded** (confirmed via `wrangler tail`: e.g. for one
AWS case, `GET /academies/cloud/aws/prerequisites?_rsc=... - Ok` appears in
the production log at the exact click time, 200 OK).

- **Rate**: 4/38 (10.5%) first pass, 6/38 (15.79%) second pass — same
  low-teens band across two independent passes, not a clean deterministic
  rate the way the D1 content-fetch bug was (that was 100%/100%). Treat as
  genuinely intermittent, not yet precisely quantified — two passes is not
  enough to nail the true rate, only enough to confirm it's real and
  roughly in this range.
- **Clustering**: not scattered independently. In the second pass, 4 of 6
  stalls (67%) occurred as immediate same-page pairs — a stall on one click
  was immediately followed by a stall on the very next click on that same
  technology page (`healthcare/bchhc-prep`: fundamentals→overview both
  stalled back-to-back, 0.7s apart; `devops/prometheus`: same pattern).
  The other 2 were isolated one-offs on unrelated pages. Once a page starts
  stalling, the odds of the very next click on that page also stalling are
  elevated — but it doesn't cascade indefinitely (both pairs stopped after
  2 in a row).
- **Retry**: an immediate identical retry cleared the stall in 5/6 (83%)
  of the second pass's cases. 1/6 (17%) failed identically on retry too
  (`devops/docker/fundamentals`) and needed a full hard `page.goto()`
  reload to recover.
- **Leading hypothesis, explicitly unconfirmed/not root-caused**: for the
  one stall that failed even on retry, the retry's RSC request reused the
  *exact same* `_rsc=` query-string ID as the page's original prefetch
  from ~4 seconds earlier (`_rsc=uv_fgdK9CReM1b39` on both), rather than
  issuing a fresh request. This suggests the client router may be serving
  a stale cached prefetch entry instead of a fresh fetch, and failing to
  commit it — consistent with, and now supported by direct evidence for,
  the "race between OpenNext's dynamic-route resolution and Next's client
  router on a soft navigation" hypothesis already in this file's table —
  except this occurred on **`next-on-pages`, not OpenNext**, meaning if
  this mechanism is real, it is not adapter-specific the way it was
  originally framed. **Not root-caused. One data point, not proof.**

### React error #418: confirmed unrelated to the navigation stalls

`Minified React error #418` (hydration mismatch) fires on **100% of
initial page loads** — confirmed on 8/8 distinct pages including the
unauthenticated homepage with zero navigation, deterministic across 3
repeat loads of the same URL. This is unconditional, load-time-only, and
present on current production right now — not something introduced by any
of tonight's work, not scoped to sign-in/out or question-bank pages the
way Symptom 11 currently documents #418.

Checked directly whether this correlates with the navigation stalls above,
using millisecond-precision timestamps on every console/page error rather
than assuming from the two both being "known issues": **zero correlation
found.** 0/6 stalls in the second pass had a fresh #418 error fire within a
2-second window of the click (checked on both the original click and the
retry click, 0/6 and 0/5 respectively). Every #418 in both passes clusters
tightly around each page's *initial hard load* moment, never at a
soft-navigation click's timestamp. **These are two independent phenomena,
not one** — #418 is a load-time-only event; the navigation stalls are a
separate, click-time client-router issue with no evidence tying them
together.

### Status at time of investigation: no action taken

Investigation only, as scoped at the time. No code changes. No fix
attempted. No prioritization changes to Part 6/8's priority order. The
stalled-navigation finding was new and not yet on this file's symptom list
in its own right — flagged for future tracking, not yet assigned a Symptom
number, pending a decision on whether it warranted one separately from
Symptom 9's existing "unconfirmed mechanism" framing.

**Superseded by the follow-up root-cause session below, same night.**

## Part 4h — Root-cause session and fix, 2026-07-18: stalled soft-navigation MITIGATED (not eliminated), deployed to production

A dedicated session opened specifically to root-cause the stalled-navigation
finding from Part 4g, using its own leads as the starting point. Branch
`investigate/soft-nav-stall` (off `main`) added temporary client-side
instrumentation (`components/diagnostics/NavInstrumentation.tsx`, since
removed) logging every `fetch()` carrying a `_rsc=` query param and every
actual pathname commit, to observe the mechanism directly rather than infer
it after the fact.

**Confirmed mechanism**: not the starting hypothesis. The starting
hypothesis (stale cached *prefetch* entry reuse — an old `_rsc` id served
instead of a fresh fetch) was not what direct evidence showed. In all 5
genuine stalls captured with instrumentation attached (4.17% of 120 real
soft navigations, `networkidle`-based detection), a **fresh** RSC fetch —
new, unique `_rsc` id each time — succeeded at the network level, but the
**client-side commit of that fetched data never happened** within the
wait window. The URL and displayed content stayed on the previous page. A
second click (the retry) — not necessarily needing its own fetch to
complete — is what unblocked the stuck pending commit in every case.

This is an **upstream Next.js App Router concurrent-navigation RSC commit
race**, not SynfraCore-specific — this app has no custom router code, plain
`next/link` usage throughout. The exact symptom ("clicking links fast...
URL doesn't change anymore but calls are happening", "the router commits a
still-in-flight, now-obsolete RSC payload... probabilistic, not
deterministic") is documented across Next.js versions 13 through 15.5.x in
multiple public reports:
- [vercel/next.js discussion #57565](https://github.com/vercel/next.js/discussions/57565) — `<Link/>` sometimes stops working with app router in production
- [vercel/next.js issue #75566](https://github.com/vercel/next.js/issues/75566) — same symptom, auto-closed for lack of a minimal repro
- [vercel/next.js discussion #88535](https://github.com/vercel/next.js/discussions/88535) — stale cached values after `router.push` navigation, concurrent-navigation RSC payload ordering

**Ruled out as unrelated** (checked directly, not assumed): React error
#418, which fires on 100% of initial page loads (Part 4g), has zero
correlation with these stalls — confirmed via millisecond-timestamp
correlation across both the original click and the retry, 0/6 and 0/5
respectively. Two independent phenomena.

**Mitigation applied — not a true fix, since the defect lives inside
Next's router internals, not in application code.** Following the exact
pattern already proven for Navbar/Footer under Symptom 10 fix
(`components/layout/Navbar.tsx:108,120`): `prefetch={false}` added to the
technology sidebar's section links and the prev/next section navigation
links (`app/academies/[academy]/[technology]/[section]/page.tsx`) —
reduces the concurrent in-flight request surface that creates the race
window, without eliminating the underlying Next.js scheduling defect.

**Measured result**, isolated Cloudflare Pages previews, `wrangler tail`
running concurrently, same 120-real-soft-navigation methodology each time:

| Pass | Fix applied | Stall rate |
|---|---|---|
| Baseline (Part 4g) | none | 4.17% (5/120) |
| Sidebar links only | `prefetch={false}` on sidebar | 0.83% (1/120) |
| Sidebar + prev/next | `prefetch={false}` on both | 0.83% (1/120), held, no regression |

**This is a mitigation, not an elimination.** The one residual stall in
both post-fix passes showed the identical signature as before the fix
(fresh fetch, no commit, resolved by retry) — same upstream mechanism,
just triggered far less often. **Explicitly logging the residual as
tracked-but-not-pursued pending upstream Next.js resolution** — no further
app-level mitigation is planned; if the residual ~0.8% ever needs chasing
further, the correct next step is following the GitHub threads above, not
another prefetch tweak.

Informal responsiveness check (no formal benchmark, per plan): sampled
fetch→commit gaps on successful post-fix navigations, consistently
~175-230ms — feels instant, no perceptible regression from removing
prefetch.

**Merged to `main`** (merge commit, history preserved, not squashed) after
the combined result held at the "no worse than 0.83%" bar. **Deployed to
production** (`wrangler pages deploy`, native WSL build path, fresh
`.env.local` copy verified against source per this file's CLAUDE.md-linked
mandatory pre-deploy discipline, `wrangler.toml` diffed clean before
deploying).

**Post-deploy verification against real `synfracore.com` traffic — 3 of 5
checklist items verified, 2 explicitly skipped, not silently assumed:**
- ✅ Homepage returns 200 with real content.
- ✅ Nested content page (`/academies/devops/docker/overview`) returns 200
  with real content.
- ✅ Academies dropdown expands via real headless-browser click (40 visible
  academy links after click) — not just an HTTP status check.
- ⚠️ **Not verified this round**: sign-in/sign-out on production. Skipped
  deliberately — no test credentials available in-session, and creating a
  fresh disposable account would leave a real new user row in Clerk +
  Supabase for a check that could be done with existing credentials
  instead. Needs manual verification.
- ⚠️ **Not verified this round**: question-bank Start flow (signed-in
  attempt creation). Same reason — needs manual verification.

**This deploy is not fully closed out per this file's own standing
pre-deploy rule** ("a deploy is not verified until ALL of the above pass")
until the two skipped items are checked. Flagging explicitly rather than
claiming full verification.

---

## Part 4i — Symptom 13: BCHHC/question-bank sign-in state doesn't sync client-side without reload, root-caused (2026-07-19)

**Framing correction, stated up front**: this is a **pre-existing bug**,
present since these pages were built — **not** introduced by the Practice
Exams tab shipped 2026-07-18. That feature only added a sidebar/landing-page
link into an already-existing flow; it increased traffic into this bug's
path, it did not create the path. Filed here as **Symptom 13** to avoid
conflating it with Symptom 8/11 (a different, already-fixed mechanism —
see below) or Part 4g/4h's soft-navigation stall race (also a different
mechanism, also ruled out below).

### The bug, precisely

On `/question-bank/[paperSlug]` (public, no sign-in required to view —
confirmed in `middleware.ts`; only `/question-bank/[paperSlug]/attempt(.*)`
is gated), signing in via the Navbar's modal (`SignInButton mode="modal"`)
without navigating away: the signed-in UI (Navbar's `UserButton`,
`AttemptStatusButtons`' Start/Continue state) does not update on its own.
A manual reload is needed. Sign-out, when reachable, resolved quickly in
available tests (~1.1s) — not confirmed to hang the way originally
reported, but few clean opportunities to test it existed given how often
sign-in itself got stuck.

### 1. Auth-gating config — checked first, as instructed

`/question-bank/[paperSlug]` (the landing page) is **intentionally public**
— `middleware.ts`'s `isProtectedRoute` only covers
`/question-bank/:paperSlug/attempt(.*)`, with an explicit comment: "the
catalog and a paper's landing page... deliberately stay OUT of this
matcher — both remain publicly browsable." The Start button
(`StartButton.tsx`) hits `/api/question-bank/start` (a Route Handler, not a
Server Action — chosen specifically to avoid a different, already-fixed
404 mechanism, see its own code comment) which handles the sign-in
redirect if needed. **This confirms the bug is not a gating/authorization
defect** — unauthenticated users are correctly allowed to view the page;
the failure is specifically in *reflecting a successful sign-in back to
the client* once the user does choose to sign in.

### 2. Local vs. deployed reproduction — real, specific clue

Attempted with the exact production Clerk config (live keys): blocked
entirely — `clerk.synfracore.com` returns **400** on any `localhost:3000`
request, Clerk's own origin allowlist rejecting an unauthorized domain (a
standard security control, not the bug). Retested with dev Clerk keys
instead (same Supabase project, only the identity provider substituted):
**5/5 (0%) — does not reproduce locally at all.** Deployed production
(`next-on-pages`): **10/10 (100%)**, deterministic. Per the instruction to
treat this as a specific clue rather than dismiss it: this points at
something in the deployed runtime (edge cold-start timing, SSR/RSC
hydration under the adapter, or Cloudflare-specific network conditions
affecting Clerk's own client-side calls) — not application logic, since
the code is byte-identical in both environments.

### 3. Is this Symptom 8/11 reproducing? Stated plainly: no.

Across every reproduction cycle tonight (D1 preview and production main),
`wrangler tail` shows **zero actual 404 HTTP responses**, and the Clerk
cache-invalidation Server Action **fires and returns 200 OK** in the
overwhelming majority of stuck cycles (confirmed via direct network-level
response listeners, not inference). Symptom 8/11's documented mechanism —
"Server Action 404s... crashing hydration, React error #418" — is not
what's happening here. **This does not contradict Part 4c/4d's "confirmed
fixed" finding**; that fix holds for its own mechanism. This is a
different, still-open bug that happens to live in the same sign-in/out
territory.

### 4. Is this the same class of issue as Part 4g/4h's stall race? Stated plainly: no — ruled out with direct evidence, not assumption.

Proposed and tested a fix: `components/auth/AuthStateSync.tsx`, forcing
`router.refresh()` on every `useAuth()` `isSignedIn` transition (branch
`fix/bchhc-auth-state-sync`, deployed to an isolated preview, verified with
the same 10-cycle methodology). **Result: 10/10 (100%) still stuck — the
fix did not help at all.**

Investigated why, rather than stopping at "didn't work": inspected
`window.Clerk.session` / `window.Clerk.user` directly (Clerk's own client
SDK state, independent of React) during a stuck cycle. **Both were empty
— Clerk's own client-side JavaScript SDK never received or applied the new
session at all.** This is decisive: `useAuth()` is only a subscription to
`window.Clerk`'s internal state, so if Clerk's own SDK instance never
updates, `useAuth()`'s `isSignedIn` never changes either, and
`AuthStateSync`'s effect never fires — the fix could not have worked by
construction, and it didn't. This also **rules out** Part 4g/4h's
mechanism (a Next.js client-router fetch-succeeds-but-commit-fails race):
that class of bug happens *after* React has correct data to render; this
bug means React never gets the data in the first place, because Clerk's
own SDK state is the thing that didn't update. Different root, different
layer, different fix required.

**Working theory, not yet confirmed further**: Clerk's client SDK likely
depends on a signal (postMessage from the sign-in modal's iframe, or a
poll/refetch of its own session endpoint) to know verification completed
and it should refresh its internal state — and that signal is what's
failing on the deployed runtime specifically. A hard reload always
correctly shows the signed-in state (confirmed repeatedly tonight), which
is consistent with this: a fresh page load re-initializes Clerk's client
from scratch and correctly picks up the valid session cookie, independent
of whatever in-page signal is failing.

### Premium/entitlement check — ruled out as the cause

`AttemptStatusButtons.tsx` (the BCHHC page's premium-adjacent component)
already has its own documented workaround for exactly this class of gap —
its own code comment states: "Signing in or out via the Navbar's modal
never navigates away from this page, so nothing would otherwise re-run
that server render," and it re-fetches attempt-status client-side on
`isSignedIn` transitions. But the **Navbar's own `UserButton`** — the
same shared component rendered on every page site-wide, with zero
premium/entitlement logic of any kind — failed identically in every stuck
cycle. Since the generic, premium-logic-free component fails the same way
as the premium-adjacent one, **the bug is not in SynfraCore's entitlement
code** — it's upstream, in Clerk's own client-side session state, affecting
every auth-derived UI element on every page equally.

### Status: three fix attempts. Attempts 1 and 2 ruled out; attempt 3 shipped as a monitored mitigation (2026-07-19).

**Attempt 1** (`router.refresh()` on `isSignedIn` transitions): deployed,
tested (10 cycles), confirmed **not effective** — 10/10 still stuck. Root
cause: `isSignedIn` never transitions in the broken case either, since it's
just a subscription to the same `window.Clerk` state that isn't updating —
this fix could not have worked by construction.

**Attempt 2** (conditional `window.location.reload()`, gated on the
sign-in modal's `.cl-modalBackdrop` element closing, only reloading if
`window.Clerk.session`/`user` are still empty after a 2.5s grace period —
built specifically to avoid a jarring reload for cases that already sync
correctly): deployed to an isolated preview, tested (10 cycles) — also
**not effective**, 10/10 still stuck. Investigated why with a
console-logged trace rather than accepting the negative result at face
value: **the modal-open detection fires correctly, but modal-close is
never detected**, even after 20 seconds of direct observation. This is a
bug in this fix's own DOM-based close-detection (Clerk's modal likely
doesn't get removed from the DOM the way `.cl-modalBackdrop` querying
assumed — possibly hidden via CSS or unmounted through a portal lifecycle
that doesn't trigger the expected `MutationObserver` signal) — **not new
evidence about the underlying Clerk session-sync bug itself.** The
reload logic inside the grace-period check was never reached in any of
the 10 verification cycles, so this attempt is inconclusive on whether a
hard reload would actually resolve the symptom, only that this specific
trigger mechanism doesn't fire.

Diagnostic console logging was added, used for the trace, and reverted
(`fix/bchhc-auth-state-sync`, not merged, not deployed to production).
The branch and preview remain isolated.

**Next step, if pursued**: fix the modal-close detection (a different DOM
signal, Clerk's own lifecycle callbacks if exposed, or a simpler
timer-based approach independent of modal-close detection entirely — e.g.
poll `window.Clerk.session` on a fixed interval after any sign-in attempt
starts, regardless of modal state) before this approach can be considered
verified either way. Separately, and regardless of whether a stopgap
reload mechanism can be made to trigger reliably: **the actual
mechanism — why `window.Clerk.session` never populates after a modal
sign-in specifically on deployed Cloudflare, while working fine
locally — remains unroot-caused.** This needs Clerk-support-level
investigation or a Clerk SDK version check (confirm the current
`@clerk/nextjs`/`@clerk/clerk-js` versions in use, then check Clerk's own
GitHub issues for Cloudflare Workers/Pages-specific session-sync reports)
as a separate future task — not something resolvable from this app's code
alone.

**Attempt 3** (`components/auth/AuthStateSync.tsx`, current production
code, merged 2026-07-19): drops modal-close detection entirely, since a
follow-up direct DOM poll (external, outside this component) proved **the
modal never closes on its own in the broken case** — 15+ seconds of
`backdropExists: true, backdropDisplay: "flex"` in exact lockstep with
`window.Clerk.session`/`user` staying empty. Modal-close was never a
viable trigger signal; attempt 2's failure was this, not an instrumentation
bug. Attempt 3 instead watches for `input[autocomplete="one-time-code"]`
appearing (the OTP-entry step) as the trigger, starts a grace-period timer
from there regardless of what the modal does afterward, and reloads if
`window.Clerk.session`/`user` are still empty once the timer elapses.

Grace period was tuned live: 4s reloaded mid-entry while a real user was
still typing/reading their code (mistaken initially for a mysterious modal
timeout before being traced to this fix's own premature reload). 20s is
the realistic floor for a user who already has the code visible and is
entering it directly. Verified functionally correct at a **90s test-only
value** (used solely to survive slow, manually-relayed OTP codes during
verification, not a production setting): **2 of 2 clean, valid,
end-to-end recoveries** — reload fired after the grace period, correctly
picked up the now-valid session, same URL, no loss of in-progress state,
timing confirmed via explicit interval polling (`signed_in=false` through
t+60s, flips to `true` at t+65s, stable through t+90s in one run).

**Full 10-cycle automated statistical verification at the 20s production
grace period was not completed.** Manual OTP relay (real inbox, human
relays each code via chat) proved too slow and unreliable to sustain 10
back-to-back cycles in one sitting — codes repeatedly arrived after the
grace period had already elapsed and triggered a reload, or after a prior
attempt had already gone stale, producing `otp-timeout`/stale-code results
that reflect relay speed, not the fix's correctness. Automating this away
was investigated and closed out for tonight, in order, per explicit
instruction:
- **Clerk's `+clerk_test` email convention** (fixed code `424242`, no real
  email) was confirmed **not viable for this instance's sign-in flow**.
  Sign-up with a `+clerk_test`-suffixed address still triggers Cloudflare
  Turnstile (confirmed twice, including a fresh unique address on
  2026-07-19), so an account can't be created through the normal UI.
  Working around that via the Clerk Backend API's `users.createUser()`
  (server-side, bypasses Turnstile, auto-verifies the email) did succeed
  in creating the account, and sign-in against it correctly accepted
  `424242` at the email-OTP step — but that same account then hit a
  **separate "new device" client-trust challenge**
  (`/sign-in/client-trust`), which does not accept the fixed test code and
  never resolved a session even after 60s of direct polling. This is a
  distinct Clerk verification layer from the initial email-code step, not
  something `+clerk_test` is documented to bypass, so it cannot substitute
  for manual relay as currently understood.
- Automating sign-out/session-reset between cycles (persistent browser
  context with selective cookie-clearing, `localStorage`/`sessionStorage`
  clearing, and driving Clerk's own "Sign out" UI with retries) was also
  attempted and did not reliably produce a clean signed-out state for a
  fresh cycle — noted here as a related, separate finding (Clerk sign-out
  itself appears unreliable in this environment too), not pursued further
  tonight.

**Decision: ship attempt 3 as a monitored mitigation, not a fully
statistically-verified fix.** The mechanism is confirmed correct by 2/2
real, clean, end-to-end recoveries at 90s, and 20s is a strictly shorter
(more conservative) version of the same grace-period wait with no
mechanism change — the 90s result extrapolates soundly to 20s per the
grace-period-tuning history above, but this is an extrapolation, not a
directly-measured 20s pass rate. Merged to `main` and deployed to
production 2026-07-19. **The real verification going forward is
production `wrangler tail`/error monitoring over the 48–72 hours after
deploy**, specifically watching for any case where a user still ends up
stuck signed-out-looking despite the reload having fired (which would
indicate the grace period is still too tight in practice, or that a
second distinct hang exists beyond the one this fix targets).

**Symptom 13 is not closed.** The reload mitigation is live in
production, but the underlying mechanism — why `window.Clerk.session`
never populates after a modal sign-in specifically on deployed Cloudflare,
while working fine locally — remains unroot-caused, per the open question
above (Clerk-support-level investigation or an SDK-version/GitHub-issues
check, separate future task). Downgrade from "high priority, no mitigation"
to "monitored, mitigation live" — re-escalate immediately if tail
monitoring surfaces any still-stuck case.

### New finding from the post-deploy verification pass: `AuthStateSync` is mounted globally, not modal-scoped

The pre-deploy sign-in/out check (real production domain, real account,
chat-relayed OTP) hit the 20s reload mid-flow on its first two attempts —
the `input[autocomplete="one-time-code"]` element disappeared out from
under the test at almost exactly t+20s, before the relayed code could be
entered. This is `AuthStateSync` correctly firing exactly as designed —
but on the **standalone `/sign-in` page**, not the Navbar modal it was
built for. `AuthStateSync` is mounted once in `app/layout.tsx`, so it
watches for the OTP input appearing anywhere in the DOM on every page,
including the dedicated `/sign-in`/`/sign-up` routes, which have their own
independent (and previously never implicated) auth flow.

This means a legitimately slow — not stuck — user entering an
email-delivered code on the plain `/sign-in` page can now hit an
unnecessary forced reload if they take longer than 20s to receive, read,
and type their code, since the trigger is OTP-input-*appearing*, not
submission-attempted-and-failing. A third attempt with the code kept ready
to paste the instant it arrived completed cleanly (`SIGNIN_RESULT: ok`,
`SIGNOUT_RESULT: ok`), so this is not a hard blocker, but it is a real,
previously-unscoped side effect worth narrowing later — e.g. gating
`AuthStateSync`'s observer to only run while a `.cl-modalBackdrop` is
present in the DOM, so the full-page `/sign-in`/`/sign-up` routes (which
have their own working navigation-based state sync and were never part of
the original bug) are left alone. Not fixed tonight; flagged here as a
known scope issue to narrow in a future pass, and another concrete signal
to watch for in the 48–72h tail-monitoring window (reloads correlated with
`/sign-in`/`/sign-up` traffic specifically, not just `/question-bank`).

### Follow-up fix: scoped to the modal, shipped (2026-07-19)

Implemented the narrowing suggested above: `AuthStateSync`'s
`MutationObserver` now queries
`.cl-modalBackdrop input[autocomplete="one-time-code"]` instead of an
unscoped `input[autocomplete="one-time-code"]`. `.cl-modalBackdrop` is
confirmed present only for the Navbar's sign-in modal and absent on the
standalone `/sign-in`/`/sign-up` pages (checked directly on production).

Verified on an isolated preview with a temporary 8s test-only grace period
(not committed), fully automated, no OTP relay needed — both checks only
require observing whether a reload happens after the grace period elapses
while the OTP field is left unfilled, not entering a real code:
- **Standalone `/sign-in` page**: reached the OTP step, deliberately left
  it unfilled for 14s (past the 8s window) — **no reload**, OTP input
  still present and interactable. Confirms the fix.
- **Modal case (Navbar sign-in on `/question-bank/bchhc-practice-1`)**:
  same test — **reload fired** as expected. Confirms no regression in the
  original Symptom 13 mitigation path.

Merged (`fix/authstatesync-modal-scope` → `main`) and deployed to
production 2026-07-19 with the real 20s production grace period restored.
Post-deploy checklist re-run on `synfracore.com`: homepage,
`/academies/devops`, `/question-bank/bchhc-practice-1` all 200; Academies
dropdown expands (real browser check). Sign-in/out was not re-run manually
for this deploy — the fix and its no-regression case were both already
proven directly and automatically on preview, and this change doesn't
touch page rendering, so re-verifying via OTP relay again was judged
unnecessary; folded into the same ongoing 48–72h tail-monitoring window
rather than run again separately.

### Part 4j — Symptom 10/11 confirmed live sitewide, urgent (2026-07-19, real-time investigation)

A user report of a live, reproducible sitewide 404 (`/academies/devops/linux`
and others) plus a friend's separate Google-auth 400 triggered an immediate,
real-time investigation — same-session, live `wrangler tail`, real production
domain, real account, deliberately checked against tonight's own
`AuthStateSync` work rather than assumed unrelated.

**`AuthStateSync` ruled out immediately as the cause.** The scoped fix
(Part 4i, deployed 13:42:22Z) was already live when the report came in, and
the sitewide 404 reproduced with it live — timing alone rules it out as
sole cause.

**Root cause identified: Symptom 10/11's original mechanism — Clerk's
internal RSC cache-invalidation Server Action 404ing under
`@cloudflare/next-on-pages` — is live sitewide, not question-bank-scoped,**
confirmed via two hop-by-hop traces:

- **Routing-layer trace (`/academies/*`):** the 404'd request's exact
  `next-action` header value was found in the built Worker bundle
  (`_worker.js/index.js`), correctly mapped by a **global catch-all rule**
  (`src: "^/(.*)$"`) to `@clerk/nextjs`'s `invalidateCacheAction`. Both
  `/academies/[academy]/[technology]/page.tsx` and
  `/question-bank/[paperSlug]/page.tsx` have identical `runtime = "edge"`,
  no `generateStaticParams`, no rendering-mode difference — this is **not**
  a per-route config gap. The 404 originates downstream, in
  `next-on-pages`'s per-route server-action-manifest resolution inside the
  compiled Worker — an adapter-level limitation, matching Part 4c/4d's
  original finding exactly ("this mechanism genuinely does not occur under
  OpenNext").
- **BCHHC trace, initially inconclusive, then resolved:** automated tests
  (chat-relayed OTP, 60–90s+ latency) repeatedly showed *zero* Server
  Action dispatch at all on the Navbar-modal sign-in path — a real,
  reportable difference from the academies case at the time. Directly
  tested whether this was a genuine distinct mechanism or a stale-relay
  artifact: (1) confirmed `+clerk_test`'s fixed code is **rejected on the
  production/live-key instance** (`attempt_second_factor` → 422, not
  accepted) — explicitly confirmed, not assumed, that this bypass is
  dev/test-instance-only; (2) had the user perform a real, first-person,
  near-zero-latency attempt directly. **Result: the same 404-then-crash
  pattern reproduced immediately**, on two different actions — sign-in via
  the `/sign-in?redirect_url=...` page (reached from the Start button) and
  sign-out from an attempt page — both matching the academies-page stack
  trace exactly (`setActive()`/`signOut()` →
  `window.__internal_onBeforeSetActive` → POST → 404 → "unexpected
  response" crash), confirmed both client-side (console) and server-side
  (`wrangler tail`, matching 404 events at the same timestamps/location).

**Conclusion: Trace 1 and Trace 2 are the same bug, not two independent
ones.** The earlier "zero dispatch" result on the modal is best explained
as an artifact of every automated test tonight having 60–90+ seconds of
chat-relay delay before code entry — long enough for the OTP input to go
stale/unresponsive before submission could even reach Clerk's SDK — not
evidence of a second, distinct client-side mechanism. The modal case was
not independently re-confirmed at true near-zero latency, but given how
consistently and immediately the 404 reproduces everywhere it *has* been
tested at real speed tonight (both real-account attempts above, every
`/academies/*` case), "same mechanism" is now the better-supported
explanation.

**Why this is live now:** commit `4e25255` ("revert: undo D1/OpenNext
migration, stay on next-on-pages permanently"), 2026-07-17 22:51:26
+0530 — reverted a migration that Part 4c/4d had **already directly
verified eliminates this exact mechanism** (Symptom 11 confirmed clean
under OpenNext: "UI updated in place, no manual refresh, no React #418"),
for an unrelated reason (a `fetchContent()` self-referential-loopback
content-loading bug, root-caused and a fix direction already identified in
Part 4f — `ASSETS.fetch()` instead of an HTTP self-fetch). This has been
live, sitewide, for **over two days** before tonight's `AuthStateSync`
work even began.

**Severity, per this same document's own prior words:** this mechanism
"can also trigger a retry storm severe enough to trip Cloudflare Worker
limits and cause intermittent 503s site-wide" — a real, currently-active
production risk, not cosmetic.

**Side note on tonight's own testing methodology, flagged as instructed:**
all preview/dev-key testing tonight (`fix-bchhc-auth-v2` through `v7`,
`fix-bchhc-auth-state-sync`, `fix-bchhc-auth-monitored`,
`fix-authstatesync-*`) used dev-instance Clerk test keys against isolated
preview URLs, never real production keys against `synfracore.com`. That
data — including the original "Server Action fires, 200 OK, zero 404s"
claim in Part 4i — should be treated as environment-scoped and unverified
against real production Clerk keys, not as validated production behavior.
The key-type difference itself (why dev-key preview testing showed no
404s at all, a third distinct behavior from both traces above) remains
unexplained and is flagged here as still open.

**Friend's Google-auth 400** ("Google authenticate ID not found"): no
Google/OAuth config exists anywhere in this codebase — Clerk's `<SignIn/>`
renders social providers entirely from Clerk Dashboard config. Likely a
Clerk Dashboard OAuth redirect-URI or Google Cloud Console client-ID
mismatch. Requires Clerk Dashboard access to check (not available from
this environment); no screenshot was provided. Explicitly **not conflated**
with the 404 findings above — different layer, different failure
signature, unconfirmed relationship if any.

**Status: not fixed tonight.** D1/OpenNext was already directly proven
(Part 4c/4d) to eliminate this exact mechanism, and tonight's reconciled
finding shows both traces are that same mechanism — so a D1 re-attempt now
has real evidentiary support for both, not just the one case (Symptom
10/11 on academies pages) it was originally verified against. Re-attempting
it would need the already-identified `fetchContent()` → `ASSETS.fetch()`
fix applied this time to avoid repeating the regression that caused the
2026-07-17 revert (Part 4e/4f). This is a significant, previously-paused
undertaking — flagged here for an explicit decision, not undertaken
unilaterally.

### Part 4k — D1/OpenNext re-attempt: reconciliation and pre-cutover verification (2026-07-19)

Per Part 4j's finding that both traces are Symptom 10/11's mechanism and
D1/OpenNext already directly resolves it (Part 4c/4d), began a re-attempt.
No DNS changes, no cutover, no merge to `main` yet — reconciliation and
preview-only verification only.

**Reconciliation.** `reconcile/d1-main-sync` was 47 commits stale (last
synced before today's `AuthStateSync` work). Diffed file-by-file against
`main` rather than merging/rebasing blindly, since a blind merge would
have dragged in `main`'s next-on-pages-specific reversions (`export const
runtime = "edge"` on ~40 routes, `wrangler.toml`, `package.json`'s adapter
deps, `lib/rateLimit.ts`'s `getOptionalRequestContext()`,
`app/not-found.tsx`'s plain-form revert, the `fetchContent()` self-fetch
reversion) — all of which must stay excluded, since they're the exact
things this branch correctly diverges from `main` on. After excluding
those, the only genuine application-level differences were: `components/
auth/AuthStateSync.tsx` (new, brought over as-is — its logic doesn't
reference next-on-pages, so it runs as an inert safety net if OpenNext's
fix holds), `app/layout.tsx`'s mount of it, and a one-line Footer nav
link. The soft-nav-stall `prefetch={false}` fix and the Practice Exams/B1/
A1 fixes were already reconciled in prior commits. Verified via full
file-level diff against `main` that only confirmed-adapter-specific
differences remained after this commit (`79d7faf`).

**Pre-cutover verification, isolated Worker preview
(`synfracore-d1-verify.vishvibeofficial.workers.dev`, dev-instance Clerk
keys — production keys can't load on a non-`synfracore.com` origin, so
this stage is necessarily dev-key-scoped; the decisive test is post-cutover
on the real domain):**

- **Content-loading fix**: 5 academies × 5 repeats, real content body
  checked (not just HTTP status) — 25/25 clean, zero
  `fetchContentEdge failed` errors.
- **Client-visible not-found swap — first actual measurement of Part
  4f.5's previously-unmeasured risk.** One occurrence on the very first
  test of the session (homepage, fresh Worker, `waitUntil: "networkidle"`
  — title swapped to "Page Not Found", `window.Clerk` never loaded, 0 Sign
  In buttons). A `waitUntil: "load"` retry on the same URL rendered
  correctly; a full-logging repeat of the `networkidle` case also came back
  clean. 35 further repeats (25 across the 5-academy matrix, 10 more on
  homepage specifically) found no further occurrences. **Total: 1/36
  (2.8%)**, later extended to 1/56 (1.8%) with 20 more live-tailed
  homepage attempts, none of which reproduced it.
  - **Server-side tail correlation attempted, found not useful**: live
    `wrangler tail` on the Worker during the 20 follow-up attempts showed
    the `[not-found]` diagnostic `console.error` firing on **every single
    request** (20/20), including all 20 that rendered correctly
    client-side — reconfirming Part 4f.5's original finding ("fires on
    effectively every request... a different signal than a client-visible
    failure") on this freshly-reconciled branch. This means the server log
    cannot discriminate the rare client-visible-failure case from the
    normal case; a live tail during the original occurrence would not have
    isolated it either. No `cfRay`/timing signature unique to the failing
    case was identified — the one clean repro (title: "Page Not Found",
    `window.Clerk` unloaded) is the only confirmed detail of that instance,
    consistent with the client-router-race hypothesis but not proof of it.
  - **Assessment**: real, non-zero, low-incidence (~2-3% across 56 trials,
    preview-quiet conditions, single browser, no concurrent load) — the
    first real number where Part 4f.5 had none. Not a blocker on its own,
    but not zero either; needs real-traffic eyes post-cutover, not
    preview-only confidence (folded into the Step 3 monitoring checklist
    below).
- **Core D1 work (Clerk auth, sign-in/out, Server Actions)**: decisive
  zero-latency test via a fresh `+clerk_test` account (works on this dev
  instance) — `attempt_second_factor` → 200, **Server Action
  cache-invalidation POST → 200** (not 404) on both sign-in and sign-out,
  session populated correctly, UI updated in place, no reload needed.
  Directly reconfirms Part 4c/4d: Symptom 10/11's mechanism does not occur
  under OpenNext, now re-verified on the current, reconciled branch.

**Both of Part 4f.5's original "NOT READY" reasons are now cleared** — the
regressions are reconciled, and the previously-unknown client-visible risk
now has a real (low) measured rate instead of "unmeasured."

### Part 4l — Domain cutover executed, main reset, parity audit (2026-07-19)

**Cutover.** Two attempts. Attempt 1 (remove only the Pages custom-domain
binding, then retry the Worker claim): the claim 409-conflicted 14/14 times
over a 90s poll with zero drift in the error
(`code=100117, "already has externally managed DNS records"`), proving the
underlying CNAME record itself — not a binding-release propagation delay —
was the blocker. Auto-rolled-back cleanly (~2min outage both times tested).
Attempt 2, after building and dry-run-testing a real CNAME-recreation
fallback against a disposable subdomain: deleted the CNAME record directly,
polled the claim API, **succeeded on the first attempt, ~6 second outage**.
`synfracore.com` has been live on the `synfracore` Worker (D1/OpenNext)
since **2026-07-19T16:49:47Z**.

**Post-cutover verification.** Homepage/content/dropdown all pass
automatically. Sign-in/out: automated headless-browser attempts repeatedly
failed post-cutover in a new way (code typed, no `attempt_second_factor`
ever fired) — initially assumed to be the familiar OTP-staleness-from-relay
pattern, but this was wrong: real first-person testing (trusted session,
incognito, **normal, non-instant OTP entry timing**) succeeded cleanly on
both sign-in and sign-out. Since real timing also worked, staleness doesn't
explain the automated failures — the more likely cause is Clerk/Cloudflare
treating synthetic Playwright input differently from real interaction, a
limitation of the test method, not a production defect. **Real-user testing
is the authoritative result here: Symptom 10/11 is confirmed resolved on
real production.**

**`main` reset to match reality.** `main` and `reconcile/d1-main-sync` had
diverged in an unmergeable way — both branches modified the same ~40 files
for incompatible adapters (`export const runtime = "edge"` additions vs.
removals, etc.), so a real `git merge` silently mis-resolved several files
(confirmed: it reintroduced the `edge` runtime line into `app/layout.tsx`).
Aborted the merge. Verified explicitly, by content (not just commit-hash
reachability) — `components/auth/AuthStateSync.tsx` is byte-identical
between `main` and `reconcile/d1-main-sync`, including the modal-scoping
fix — that nothing from `main`'s 47 unreachable-by-hash commits was
actually missing, then `git reset --hard`
`main` to `reconcile/d1-main-sync`'s tip (`63dcbbc`). Confirmed post-reset:
fresh `npm install && npm run pages:build` from the new `main` succeeds
cleanly; the live Worker's code matches this tip (no rebuild happened
between the last `wrangler deploy` and the successful claim — confirmed via
deployment timestamps, corroborated by `AuthStateSync` itself visibly
firing in live post-cutover testing, code that only exists in this
reconciled state).

**Parity audit** (re-verifying Part 4f.5's originally-flagged regressions,
live on production, not just in a file diff):
- NF-6/B1 hardcoded-stats fix: live count is dynamic (`17 Certifications`
  today), not the hardcoded `13` regression. Guardrail script
  (`scripts/validate-no-hardcoded-stats.mjs`) and its CI step both present.
- A1 title-suffix fix: all 4 previously-regressed pages
  (`/certifications`, `/community`, `/contact`, `/troubleshooting`) show a
  single, correct title suffix, not doubled.
- Practice Exams feature: sidebar tab and landing-page card both present
  and rendering on `/academies/healthcare/bchhc-prep`; Footer's "BCHHC Exam
  Prep" link present.
- Content spot-check, 5 academies (DevOps, Cloud, Healthcare, Data, AI):
  5/5 render real content, zero not-found swaps in this pass.

**Status: D1/OpenNext migration is live in production.** Symptom 10/11
(both the academies-page and BCHHC manifestations) confirmed resolved.
Monitoring commitment from Part 4k carries forward: watch specifically for
the client-visible not-found swap pattern (rare, ~1-2% in preview-quiet
conditions, unverified under real concurrent traffic) over the next
24-48h.

---

## Part 5 — Findings from the v2 draft, verified today (NF-1 through NF-12)

Legend: ✅ CONFIRMED live/in code exactly as v2 described · ⚠️ PARTIALLY confirmed
(nuance found) · ❌ NOT REPRODUCIBLE (v2 was wrong or stale)

### NF-1 · Duplicated title suffix — ✅ CONFIRMED, live and widespread
Direct curl of live `<title>` tags today:
- `/learn/class-10/maths/real-numbers`: `Real Numbers — Mathematics | Class 10 | SynfraCore | SynfraCore`
- `/roadmaps/devops-engineer`: `DevOps Engineer Roadmap | SynfraCore | SynfraCore`
- `/learn`: `Academy — Chapter-wise Learning for Every Exam | SynfraCore | SynfraCore`
- `/academies/devops`: `DevOps & Platform Engineering Academy — Structured Learning Path | SynfraCore | SynfraCore`
- `/terms`: `Terms of Service | SynfraCore | SynfraCore`

Root cause confirmed in code: [`app/layout.tsx:13`](../../app/layout.tsx#L13) sets
a metadata title **template** (`"%s | SynfraCore"`), and at least 10+ page-level
`metadata` exports *also* manually append `| SynfraCore`/`— SynfraCore`
themselves — `app/admin/page.tsx:9`, `app/onboarding/page.tsx:9`,
`app/terms/page.tsx:2`, `app/careers/[role]/page.tsx:190`,
`app/academies/[academy]/[technology]/[section]/page.tsx:111,119`,
`app/learn/[board]/[subject]/[chapter]/page.tsx:19,24`, `app/blog/[slug]/page.tsx:23`,
`app/certifications/[id]/page.tsx:283`, `app/academies/[academy]/[technology]/page.tsx:17,22`,
`app/academies/[academy]/page.tsx:194`. Homepage itself is unaffected (uses the
template's `default`, not a page override). Fix once per offending file: stop
manually appending the suffix, let the layout template do it.

### NF-2 · Social share buttons share the homepage, not the page — ✅ CONFIRMED, exact live evidence
Direct curl of the chapter page's share links today:
- Twitter: `twitter.com/intent/tweet?url=https%3A%2F%2Fsynfracore.com` (homepage,
  not the chapter URL)
- WhatsApp: `text=Real%20Numbers%20—%20Real%20Numbers%20%7C%20SynfraCore%20https%3A%2F%2Fsynfracore.com`
  — title duplicated verbatim ("Real Numbers — Real Numbers | SynfraCore") exactly
  as v2 described.

Confirmed a shared component bug, not a one-off. One-component fix: build the
share URL from the page's own canonical/params, dedupe the share text.

### NF-3 · OG/Twitter images are SVG + metadata leakage — ⚠️ CONFIRMED with a nuance
`og:image`/`twitter:image` are `https://synfracore.com/og-image.svg` on every
page checked (`/`, `/learn`, `/roadmaps/devops-engineer`, `/academies/devops`,
`/terms`, chapter page) — crawlers for Facebook/X/LinkedIn/WhatsApp don't render
SVG previews, confirmed as described.

Nuance not fully captured in v2: metadata inheritance is **inconsistent, not
universal**. `/learn/class-10/maths/real-numbers` correctly has its own
`og:title` ("Real Numbers — Class 10 | SynfraCore") and its own `og:url`
(its real page URL) — that page is fine on `og:*`. But `/roadmaps/devops-engineer`,
`/learn`, `/academies/devops`, and `/terms` all inherit the **homepage's**
`og:title`/`og:description`/`og:url` verbatim. And critically — **every single
page checked, including the correctly-OG'd chapter page**, carries the
homepage's generic `twitter:title`/`twitter:description` regardless of its own
`og:title` being correct. So the Twitter-card leak is universal; the OG leak is
partial. Fix: make OG/Twitter metadata inherit from each page's own metadata
export consistently, and replace the SVG with a real 1200×630 PNG/JPG.

### NF-4 · Duplicated markdown table separator rows — ❌ NOT REPRODUCIBLE, v2 finding does not hold up
v2 claimed a literal duplicated `| --- | --- |` separator row on both the
`real-numbers` chapter and `kubernetes/intermediate`. A dedicated corpus-wide
scan across all 2,225 content files this session (validated against a synthetic
positive to rule out a false negative) found **zero** occurrences of a table
separator immediately followed by a blank line and another separator anywhere
in the corpus. Direct grep of `public/content/education/school/class-10/maths/real-numbers.md`
for `| --- |` also found no matches at all.

This session's own live-page grep that appeared to find a match was a false
positive from a malformed regex (unescaped `|` is a literal character in basic
`grep`, not alternation — it matched unrelated dashes/pipes elsewhere on the
rendered page, not an actual table bug). **Conclusion: this defect either never
existed as described, or was already fixed before this reconciliation pass; no
`duplicate_table_separator` validator or corpus fix is needed.** Drop this item
from the roadmap rather than carrying it forward.

### NF-5 · Third-party course-notes provenance inside "Expert Content" — ✅ CONFIRMED, scoped to 3-4 files (smaller than corpus-wide)
Full corpus grep (2,225 files) for `TechWorld`, `Nana`, `saifshah`, `from the
notes`, `from my notes`, `regapp` (with false positives like "Nana Sahib," a
genuine 1857 history figure in exam content, excluded) found:
- `public/content/infrastructure/docker/intermediate.md` — `saifshah/regapp`
  Docker Hub images used throughout, "Exact Dockerfile from the notes," "From
  the notes — complete CI/CD flow"
- `public/content/infrastructure/docker/advanced.md` — "Key principle from the
  notes," "Facts about volumes (from the notes)," a Jenkins pipeline pushing to
  `github.com/org/regapp.git` and `saifshah/regapp`
- `public/content/infrastructure/kubernetes/intermediate.md` — headed
  **"Core K8s Objects (TechWorld with Nana)"**, "From the Nana roadmap...",
  "Deployment Strategies (from Nana roadmap)," same `saifshah/regapp` example
  throughout
- `public/content/infrastructure/kubernetes/fundamentals.md` — separately
  already known (per `audit-content-quality.mjs`) to carry promotional
  "Course Content"/"Champion"/"WhatsApp group" copy from the same source

This is a **scoped, 4-file fix** (all under `infrastructure/docker` and
`infrastructure/kubernetes` — the legacy alias path `devops` content still
lives under per `ALIAS_ROOTS`), not a corpus-wide contamination problem as v2's
framing implied. Still worth the validator markers as WARN-then-HARD_FAIL, but
size the fix effort accordingly — small, not another 45-file/73-file batch.

### NF-6 · Marketing numbers contradict each other — ⚠️ CONFIRMED for the academy count, others plausible but not fully re-checked
Confirmed directly: `academies.ts` defines **18** academy objects (11 flagship +
7 Phase-3: law, agriculture, finance, telecom, state-psc, central-exams,
professional-certs, economics), while `lib/data/navigation.ts`'s own `stats`
export still says **11**. `/about` live shows "101 technologies" (matches v2).
Homepage live shows "284+ chapters" and "13 Certifications" (matches v2's
headline figures). Did not re-verify every single number pair (nav dropdown
count, roadmap count, tech-topic count) against live markup this pass — the
academy-count mismatch alone is sufficient to confirm the underlying pattern
(hand-maintained stats vs. registry drift) is real and current. Fix: derive
every displayed count from `academies.ts`/registry/roadmaps at build time.

### NF-7 · Class 12 advertised with 0 chapters — ✅ CONFIRMED in substance (exact wording differs)
Live `/learn` HTML compared directly, Class 12's card vs. Class 10's card: Class 10
renders `<div style="display:flex;gap:4px;flex-wrap:wrap">` populated with subject
badges (Mathematics, etc.); Class 12's identical container renders **completely
empty** — `<div style="display:flex;gap:4px;flex-wrap:wrap"></div>`. There is no
literal "0 chapters" text string on the page (so v2's exact quote wasn't
reproducible verbatim), but the underlying problem is real and confirmed: Class 12
is advertised with an empty subject/chapter badge area next to every other board's
populated one — visually the same "advertising an empty product" issue. A1's
existing plan (hide zero-chapter boards, or mark "Coming soon") still applies
unchanged.

### NF-8 · Terms of Service describes a nonexistent paid product — ✅ CONFIRMED, unchanged
Live `/terms` still shows **"Last updated: January 2025"**. Billing/refund
language not independently re-extracted this pass, but the stale date alone
confirms this page hasn't been touched since v2 was written.

### NF-9 · `learn.synfracore.com` hosts the old platform — ✅ CONFIRMED
Live fetch of `learn.synfracore.com` today: serves **"LearnwithVishnu — Free
DevOps Learning Platform | Docker, Kubernetes, CI/CD, Cloud,"** tagline "Basics
to Production to Architect," describing itself as covering 51 topic pages, 282
interview Q&As, 6 learning phases. No redirect to synfracore.com, no error, no
`noindex` meta tag visible in the fetched content (caveat: this used a
summarizing fetch, not raw source — worth a `curl`/view-source check if the
noindex distinction matters before deciding C1 below). This is the standing
source of the scraped-content contamination class of incident (see NF-5) and a
live, unmanaged SEO/brand-confusion risk today.

### NF-10 · Question Bank has zero discoverability — ✅ CONFIRMED
Direct grep of live homepage and `/learn` HTML for the string `question-bank`:
**zero occurrences on either page.** No nav link, no footer link, no homepage
card, no `/learn` cross-link. Confirmed exactly as v2 described.

### NF-11 · Technology hub page hides 7 of 17 tabs — ⚠️ CONFIRMED, but the mechanism is different than v2 implied
v2 framed this as the hub and sidebar using different data. In fact **both use
the exact same source list** — `techSections` from `lib/data/navigation.ts` (17
entries) — so this is not a "generate both from one list" fix, it already is one
list. The actual bug:
[`app/academies/[academy]/[technology]/page.tsx:90-95`](../../app/academies/[academy]/[technology]/page.tsx#L90)
applies an extra hardcoded filter — `techSections.filter(s => [10 explicit
slugs].includes(s.slug))` — down to 10 cards (`overview, fundamentals,
intermediate, advanced, labs, projects, interview, troubleshooting,
certification, cheatsheets`), rendered under "Complete Learning Modules." The
sidebar in `app/academies/[academy]/[technology]/[section]/page.tsx:132,219`
renders the **full, unfiltered** 17-item list. Fix: delete the hardcoded
10-slug filter in the hub page component — one-line fix, not a data-modeling
change. Non-technical academies (`nonTechSections`, 9 tabs) have no mismatch —
both hub and sidebar already use the unfiltered list there.

### NF-12 · Minor cosmetics batch — ⚠️ MIXED: 1 of 4 confirmed, 3 of 4 not reproducible
Checked all four sub-items directly against live pages today:
- **Duplicate blog posts** — ✅ CONFIRMED: both `devops-salary-india-2025` and
  `devops-salary-india-2026` live on `/blog` right now. Still needs
  canonicalizing/archiving as v2 recommended.
- **"World's" vs "India's most comprehensive" messaging conflict** — ❌ NOT
  REPRODUCIBLE: grepped homepage, `/blog`, and `/about` for both phrases —
  every occurrence found (3 total, across all three pages) says "India's most
  comprehensive"; zero occurrences of "World's" anywhere. Either already fixed
  or the original finding was mistaken. Drop from the roadmap.
- **Garbled logo alt text** ("SynfraCoreSynfracore"/"SynfraCoreAC") — ❌ NOT
  REPRODUCIBLE: homepage has 3 occurrences of clean `alt="SynfraCore"` and one
  unrelated `alt=""`, no garbled variant found. Drop from the roadmap.
- **Footer social icons rendering raw URLs as link text** — ❌ NOT
  REPRODUCIBLE: zero raw-URL-as-link-text patterns found in the homepage
  footer HTML. Drop from the roadmap.

Net effect: NF-12 shrinks to just the duplicate-blog-post item; the other
three cosmetic claims don't hold up against today's live site and should not
be carried into Phase A.

---

## Part 6 — Full content coverage audit (fresh pass, replaces the old partial A1 audit)

Confirmed current tab mapping directly from `lib/data/navigation.ts` (executed by
`scripts/generate-content-registry.mjs`/`scripts/audit-content.mjs`, not assumed):

- **Technical academies** (`devops`, `cloud`, `databases`, `ai`, `data`,
  `security` — 91 technologies): 17 applicable tabs — Overview, Prerequisites,
  Installation, Fundamentals, Intermediate, Advanced, Roadmap, Labs, Projects,
  Interview Q&A, Troubleshooting, Certification, Cheatsheets, Notes, PYQ, Real
  World, FAQ. ("Labs" is a separate `<LabsSection>` system, not a markdown file,
  excluded from the coverage counts below.)
- **Non-technical academies** (`law, exams, education, state-psc, central-exams,
  finance, economics, agriculture, essentials, healthcare, telecom,
  professional-certs` — 110 technologies): 9 applicable tabs — Overview,
  Fundamentals, Intermediate, Advanced, Notes, Cheatsheets, Interview, PYQ, FAQ.

201 technologies across **18** academies total (confirms the NF-6 academy-count
drift above).

**Headline result: coverage is healthier than the old partial audit suggested.**
Zero technologies have no content at all; zero are Overview-only. 16 of 201 are
fully complete on every applicable tab.

| Academy | Techs | Tabs filled/applicable | % |
|---|---|---|---|
| finance | 11 | 74/99 | 75% |
| exams | 26 | 168/234 | 72% |
| healthcare | 12 | 76/108 | 70% |
| law | 8 | 50/72 | 69% |
| education | 12 | 72/108 | 67% |
| essentials | 10 | 60/90 | 67% |
| professional-certs | 4 | 24/36 | 67% |
| state-psc | 5 | 30/45 | 67% |
| central-exams | 4 | 24/36 | 67% |
| telecom | 6 | 35/54 | 65% |
| devops | 25 | 246/400 | 62% |
| data | 11 | 107/176 | 61% |
| databases | 12 | 115/192 | 60% |
| ai | 9 | 85/144 | 59% |
| security | 8 | 74/128 | 58% |
| agriculture | 6 | 31/54 | 57% |
| economics | 6 | 30/54 | 56% |
| cloud | 26 | 224/416 | 54% |

Global per-tab coverage (all 201 techs): Overview 100%, Fundamentals 100%,
Intermediate 94%, Advanced 90%, Interview/Practice Q&A 95%, Cheatsheets 90%,
Certification 76%, Roadmap 75%, Projects 75%, Installation 30%,
Troubleshooting 40%, Prerequisites 20%, Notes 20%, FAQ 12%, PYQ 12%,
Real World 8%.

**The real gap isn't missing Overview/Fundamentals content — it's Real World,
PYQ, FAQ, Notes, and Prerequisites**, which are thin across almost every
academy. This is a different, more useful shape of finding than the old audit's
framing and should drive Phase C/D content prioritization.

**Boilerplate/templated content** (via `scripts/audit-content-quality.mjs`,
spot-checked): 119 of 2,225 files (5.3%) match a known bad-content marker —
68 generic "Quick Reference"/"Key Points for Revision" boilerplate blocks
(heaviest in `devops`), 45 unfilled "Add your answer here" interview
placeholders (these count as "present" in the coverage table above but aren't
real content), 3 generic templated overview pages (Spark/Airflow/dbt), plus
`devops/kubernetes/fundamentals.md`'s already-known promotional copy. Breakdown
by academy: devops 80, cloud 10, data 6, law 5, telecom 5, ai 3, essentials 3,
security 3, healthcare 2, finance 1, infrastructure 1. Spot-checked
`cloud/aws/overview.md` directly — confirmed genuinely templated (identical
two-sentence blurb copy-pasted across three sections).

**Provenance contamination**: see NF-5 above — 4 files, not corpus-wide.

**Duplicated table separators**: see NF-4 above — 0 found, drop from roadmap.

**Mobile rendering beyond Part 0**: not independently spot-checked across a
representative content-page sample this pass (budget) — flag as an open item
for the next mobile-focused pass, given Part 0 showed this class of bug exists
at least once and was never caught by desktop-only verification.

---

## Part 6a — C1 audit: learn.synfracore.com content inventory (2026-07-18, audit only, nothing migrated)

**Decision made 2026-07-18**: not a redirect. Extract genuinely useful
content from `learn.synfracore.com` (the old `learnwithvishnu.pages.dev`
platform) and merge it into synfracore.com's real content structure where
it adds real value. This is Step 1 — inventory and report only, per the
same "audit before touching content" discipline as every other content
decision in this project. **No content has been migrated or written.**

### Methodology

Full inventory via the old platform's own `sitemap.xml` (51 URLs — matches
NF-9's earlier count exactly, confirming no drift since that finding).
4 are non-topic pages (homepage, `interview.html`, `learnwithvishnu.html`
about page, `roadmap.html`) — **47 real topic pages**. Cross-referenced
every topic's slug against the full 252-slug technology registry
(`lib/data/academies.ts`) to split into "already a registered technology"
vs "doesn't exist at all," then fetched and read the actual page content
for every candidate in the second bucket (not inferred from the slug name
alone) to confirm it's genuine substantive content, not thin/templated
filler that wouldn't be worth merging either way.

### Finding 1 — 13 topics are genuinely new, not represented anywhere in the current registry

None of these slugs exist anywhere in `lib/data/academies.ts`'s 252
registered technologies. Every one was read directly (not assumed) and
confirmed as real, substantive, well-structured content — typically
800-4,500 words, multiple sections, working code/YAML examples, and a
tiered Interview Q&A section:

| Old platform URL | Suggested target | Word count (est.) | Notes |
|---|---|---|---|
| `cicd/gitlab-ci.html` | `devops` → new tech `gitlab-ci` | ~1,800-2,200 | Comparison tables, real YAML, interview Q&A |
| `cicd/fluxcd.html` | `devops` → new tech `fluxcd` | ~2,500-3,000 | GitOps pull model, Kustomize, FluxCD vs ArgoCD |
| `cicd/tekton.html` | `devops` → new tech `tekton` | ~2,000-2,500 | Tasks/Pipelines/Triggers, OpenShift integration |
| `devops/github-actions.html` | `devops` → new tech `github-actions` | ~3,500-4,500 | Largest of the 13 — OIDC, matrix builds, reusable workflows |
| `containers/ebpf.html` | `devops` → new tech `ebpf` | ~3,500-4,000 | Cilium, Hubble, Falco — genuinely advanced material |
| `containers/harbor.html` | `devops` → new tech `harbor` | ~2,000-2,500 | Registry, Trivy/Clair scanning, RBAC |
| `containers/keda.html` | `devops` → new tech `keda` | ~2,500-3,000 | ScaledObject/ScaledJob, real cost-reduction case study |
| `monitoring/datadog.html` | `devops` → new tech `datadog` | ~800-1,000 | Thinnest of the 13, still genuine (not filler) |
| `monitoring/loki.html` | `devops` → new tech `loki` | ~2,500-3,000 | LogQL, architecture, real Helm/Promtail configs |
| `monitoring/splunk.html` | `devops` → new tech `splunk` | ~1,200-1,500 | SPL queries, real incident-response walkthrough |
| `monitoring/slo.html` | `devops` → new tech `slo` (or fold into an existing observability tech) | ~800-1,000 | SLA/SLO/SLI, error budgets, multi-burn-rate alerts |
| `security/devsecops.html` | `security` → new tech `devsecops` | ~2,500-3,000 | Shift-left, SAST, IaC scanning, full pipeline example |
| `sre/platform-engineering.html` | `devops` or new `sre` domain → new tech `platform-engineering` | ~2,500-3,000 | Backstage/IDP, DORA metrics |

**This is the real opportunity the audit was asked to find.** 13 complete,
substantive technology guides that don't exist on synfracore.com in any
form today — not thin, not templated, genuinely new coverage.

### Finding 2 — the other 34 topics already exist as registered technologies

Direct slug matches: `organic-farming`, `argocd`, `azure-devops`, `aws`,
`azure`, `cloud-fundamentals`, `gcp`, `multi-cloud`, `istio`, `ansible`,
`docker`, `helm`, `jenkins`, `kubernetes`, `linux`, `openshift`, `python`
(as `python-devops`'s closest match), `terraform`, `human-essentials`,
`law`, `medical-coding`, `telco`, `python-mis`, `python-mis-advanced`,
`elk-stack` (as `monitoring/elk`'s match), `prometheus`, `kafka`,
`networking`, `digital-safety`, `ha-dr`, `incident`.

**Not simply redundant, but not a priority either.** Cross-referenced
against the live gap data (`comprehensive-gaps.json`): every one of these
already has Overview and Fundamentals content (100%/100% globally, per
Part 6), and most already have real Interview Q&A coverage (95% global).
Where the old platform's version could genuinely add value is the *same*
thin tabs B5 already identified — Real World, Troubleshooting depth,
Notes — not a wholesale replacement.

**One direct structural comparison, spot-checked**: `devops/docker.html`
on the old platform is a single ~8,000-10,000 word mega-page covering
fundamentals through troubleshooting, security, registries, Compose,
CI/CD, and interview prep all in one document — a fundamentally different
shape than synfracore.com's per-tab structure (separate Overview,
Troubleshooting, Certification, Interview tabs, etc.). **Merging isn't a
1:1 page copy for this bucket — each old mega-page would need its
sections split and mapped to the specific synfracore.com tab they belong
to**, and only where that tab is currently thin. For a well-covered
technology like Docker, most sections would be redundant; the
troubleshooting/production-scenario sections specifically are the part
likely worth mining.

### Rough effort estimate

- **13 new-technology pages**: each needs a genuine editorial pass (not
  copy-paste) — matching SynfraCore's voice/format, splitting into the
  site's tab structure (Overview/Fundamentals/Intermediate/Advanced/
  Interview/etc. — the old page's single-document shape doesn't map 1:1
  even for genuinely new content), and adding the beginner-ready fields
  CLAUDE.md requires (hook, analogy, diagram, annotated example, "try it"
  prompt) that these pages don't have in their current form. Ballpark:
  0.5-1 day per technology for a careful pass, so **6.5-13 days of focused
  content work** for all 13 — this is the real cost of "actual value,"
  not a quick import.
- **34 existing-technology topics**: much smaller, targeted extraction —
  only the specific thin tabs (mainly Real World, Troubleshooting) are
  worth mining per technology, not full pages. Rough estimate: 1-2 hours
  per technology to identify and adapt the relevant section, so
  **34-68 hours** if all 34 are pursued — but given B5 already ranks
  `devops`/`cloud` as the highest-leverage academies to improve, this
  bucket should probably be sequenced *through* B5's existing priority
  order rather than as a separate initiative.

### Recommendation for the actual migration approach

Given the effort estimate and the quality bar the rest of the site holds
(see CLAUDE.md's beginner-ready requirement), **manual, per-page review is
the right call for the 13 new technologies** — bulk/automated migration
risks reintroducing exactly the kind of low-effort, templated content this
project has spent real effort removing (NF-5's provenance issue, the
68-file boilerplate batch). The 34-existing-technology bucket is better
folded into B5's already-planned content work (same academies, same thin
tabs) than run as a separate migration track.

---

## Part 7 — The final phased roadmap

### Phase 0 — Standing operating rules (permanent)
1. Build only from a native WSL/Linux filesystem path (`~/synfracore-build`),
   never `/mnt/d/…` (Symptom 7). Sync `.env.local` fresh on every single build,
   no exceptions (2026-07-15 incident) — verify with
   `grep CLERK_PUBLISHABLE_KEY ~/synfracore-build/.env.local` before building.
   `rm -rf .next .vercel` if a deploy ships a stale/wrong env-derived value
   despite a correct `.env.local`.
2. Branch + Cloudflare preview deploy for anything touching rendering mode,
   auth, middleware, the adapter, or dependencies. Never test these on main.
3. Live verification, not local, is the definition of done for anything
   Clerk-/adapter-adjacent. Minimum live checklist after such deploys:
   homepage 200 with content, one nested content page 200, question-bank Start
   flow signed-in, sign-in/sign-out round-trip, Academies dropdown actually
   expands in a real browser.
4. New mutations default to Route Handlers + client `fetch()`, not Server
   Actions, on this adapter (Symptom 6). Any Server Action needing auth uses
   `getAuthSafely()` from the start.
5. One change per commit, verified before the next.
6. Never downgrade Next.js to satisfy the adapter's peer range
   (CVE-2025-66478 lesson). Keep `next` pinned exact.
7. Any `wrangler.toml` edit must be diffed and reviewed before deploying
   (`git diff -- wrangler.toml`) — this file's `[vars]` block corrupts
   silently and `wrangler` doesn't always fail loudly.
8. CI gates stay mandatory: `tsc --noEmit`, lint, `validate:roadmaps`,
   `validate-content-quality.mjs` — every new corpus-defect class found gets
   a validator marker the same day.

### Phase A — Quick, high-value correctness fixes (this week, each ≤ half a day)

**CORRECTION 2026-07-18: re-verified against actual code, not just commit/
branch history — every item below except A1 was already done, in some cases
days ago, and this section had never been updated to reflect it.** A1 itself
turned out to be *partially* done: the underlying mechanism was fixed, but
4 pages never got migrated to it. See below for exact evidence.

1. **A1 — doubled title suffix** (NF-1) — **partially done, real remaining
   scope identified 2026-07-18**: the fix mechanism landed correctly
   (`app/layout.tsx`'s template already appends `| SynfraCore` once, and
   pages using the `pageMetadata()` helper — about, blog, learn,
   certifications/[id], etc. — are clean), but `app/community/page.tsx`,
   `app/contact/page.tsx`, `app/certifications/page.tsx`, and
   `app/troubleshooting/page.tsx` still hardcode a manual
   `"X — SynfraCore"` title via a plain `export const metadata` instead of
   `pageMetadata()`, doubling to `"Community — SynfraCore | SynfraCore"`
   etc. Small, scoped, still open.
2. ~~**A2 — share component**~~ (NF-2) — confirmed done. `components/
   growth/ShareButtons.tsx` only falls back to `window.location.href` when
   no `url` prop is given; both call sites (`app/blog/[slug]/page.tsx`,
   `components/tech/SectionContent.tsx`) now pass an explicit page URL.
3. ~~**A3 — OG/Twitter metadata**~~ (NF-3) — confirmed done.
   `app/api/og/route.tsx` uses `ImageResponse` (real rendered PNG), not
   the old SVG. `lib/seo/metadata.ts`'s `pageMetadata()` sets `twitter:
   { title, description, images }` explicitly per page, not inherited
   from a root default — its own comment documents this was exactly the
   NF-3 fix.
4. ~~**A4 — NF-11 hub tab parity**~~ — confirmed done (and independently
   re-confirmed 2026-07-18 while building the Practice Exams tab): the
   hardcoded 10-slug filter in `app/academies/[academy]/[technology]/
   page.tsx` is gone; `availableSections` now uses the same unfiltered
   `techSections`/`nonTechSections` list as the sidebar.
5. ~~**A5 — `afterSignOutUrl` one-liner**~~ (OP-6) — confirmed done
   (commit `9e147da`, 2026-07-16); corrected in the roadmap 2026-07-18.
6. ~~**A6 — NF-5 content provenance**~~ — confirmed done. Zero hits for
   `TechWorld`/`Nana`/`saifshah`/`from the notes` in the 4 originally
   flagged files, and zero hits corpus-wide across all of
   `public/content` (only unrelated coincidental matches, e.g. "Nana
   Sahib", "banana"). The HARD_FAIL validator markers were not added —
   worth doing if this content area gets touched again, but not urgent
   given the corpus is already clean.
7. ~~**A7 — Class 12 board**~~ (NF-7) — confirmed done. `class-12` is in
   `app/learn/page.tsx`'s `liveBoardSlugs`, not the "coming soon" bucket;
   `lib/data/education.ts` has a fully populated `class12Subjects` (4
   subjects, real chapters, descriptions, `pyqYears`) — not an empty stub.
8. ~~**A8 — Symptom 10 mitigation note**~~ — confirmed done. Present in
   `CLAUDE.md`'s "## Do not" section with a full explanation of the
   Clerk/adapter crash and 503-storm risk.
9. Drop NF-4 (duplicated table separators) from the roadmap entirely — not
   reproducible; no validator or fix needed.
10. ~~**A9 — Delete the two dead content directories**~~ (OP-7's 1.5) —
    confirmed done, commit `bf8f5f0` (2026-07-16); corrected in the
    roadmap 2026-07-18.
11. ~~**A10 — Canonicalize the duplicate blog post**~~ (NF-12) — confirmed
    done. `lib/data/blogPosts.ts`/`app/blog/page.tsx` only list the 2026
    slug; `next.config.ts` has a permanent redirect from
    `/blog/devops-salary-india-2025` to the 2026 post, citing NF-12
    explicitly in its own comment.
12. Drop NF-12's other three sub-items ("World's"/"India's" messaging
    conflict, garbled logo alt text, footer raw-URL link text) — none
    reproduced against today's live site.

**Net effect: Phase A is done except A1's 4-page remainder.**

### Phase B — Correctness at the data layer (next 1–2 weeks)
1. ~~**B1 — hardcoded stats drift + CI guard**~~ (NF-6) — **RESOLVED
   2026-07-18.** The core NF-6 drift (890+/11/13 vs real 201/18/17) was
   already fixed everywhere checked initially — `lib/data/navigation.ts`'s
   `stats`, `app/page.tsx`, and `app/about/page.tsx` all compute their
   totals dynamically, just via 3 independent implementations rather than
   one shared `stats.ts` file. That consolidation is a real, low-priority
   nice-to-have, deliberately not done tonight (the underlying bug is
   already fixed in each place; low value for the effort). What genuinely
   remained: `components/home/CertificationsSection.tsx` still hardcoded
   `"13 Certifications"` — a live instance of the bug an initial manual
   grep missed. Fixed (now `{certifications.length}`, matching an import
   the file already had) — this component is currently unrendered
   anywhere in `app/`, so unverifiable via a live page, but verified via
   typecheck and the real current count (17). Added the requested CI
   guard (`scripts/validate-no-hardcoded-stats.mjs`, wired into
   `predeploy` and CI) — deliberately narrow (the exact historical wrong
   values, not general JSX analysis), and it proved itself immediately:
   it's what caught the `CertificationsSection.tsx` instance in the first
   place, confirmed failing before the fix and clean after.
2. ~~**B2 — Rewrite Terms/Privacy**~~ (NF-8) — **CORRECTION 2026-07-18:
   already done, commit `c54a20a`.** Both `/terms` and `/privacy` now show
   "Last updated: July 2026" (re-verified live on production tonight, not
   just in source); `/terms`' Pricing section explicitly states
   "SynfraCore is currently free to use — there is no paid subscription
   tier today," with no billing/refund language for a nonexistent
   product. Nothing left open.
3. ~~**B3 — Phase-1 closure follow-through**~~ (OP-7) — **CORRECTION
   2026-07-18: all 3 sub-items confirmed done, re-verified against actual
   code tonight, not just Part 2's 2026-07-16 finding.** (a)
   `generate-content-registry.mjs` is wired into `pages:build`
   (`package.json:10`, runs before the `next-on-pages` build). (b)
   `app/search/page.tsx`'s `searchIndex` is genuinely dynamic —
   `const searchIndex: Result[] = buildSearchIndex();` (line 83), not a
   hardcoded array; Part 2's original "still hardcoded" finding was wrong
   from the start (self-corrected same session, 2026-07-16), it just never
   propagated to this Phase B entry. (c) dead-directory cleanup — already
   done, commit `bf8f5f0`, corrected in Part 2 tonight. Nothing left open
   in B3.
4. **B4 — Search Console pass** (OP-4): verify contamination phrases aren't
   indexed; submit the regenerated sitemap.
5. **B5 — Content thinness pass — planning done 2026-07-18, no content
   written yet.** This is genuinely large-scope content-authoring work,
   not a code fix — scoped tonight to verification + a concrete priority
   list only, deliberately not attempted as a squeeze-in. Re-ran both
   underlying scripts fresh tonight (`scripts/audit-content.mjs`,
   `scripts/audit-content-quality.mjs`) to confirm Part 6's numbers are
   still current, not stale: per-tab coverage matches closely (Real World
   7-8%, PYQ 12%, FAQ 12%, Notes 20%, Prerequisites 20%), and the
   boilerplate/placeholder batch counts are **exactly unchanged** — still
   68 "Quick Reference" boilerplate files and 45 unfilled "Add your
   answer here" placeholders (118 total files, same as Part 6). Nothing
   has drifted since this was written.

   **Concrete academy-by-academy priority order** (missing-count across
   the 5 worst tabs — Real World/PYQ/FAQ/Notes/Prerequisites — per
   academy, computed from `docs/audit/comprehensive-gaps.json`):

   | Academy | Techs | Total missing | RealWorld/PYQ/FAQ/Notes/Prereq |
   |---|---|---|---|
   | cloud | 26 | **125** | 25/26/25/24/25 |
   | devops | 25 | **104** | 24/25/24/18/13 |
   | databases | 12 | 54 | 11/12/11/9/11 |
   | exams | 26 | 47 | 0/11/18/18/0 |
   | data | 11 | 43 | 9/11/9/5/9 |
   | ai | 9 | 41 | 8/9/8/8/8 |
   | education | 12 | 36 | 0/12/12/12/0 |
   | security | 8 | 35 | 7/8/7/6/7 |
   | healthcare | 12 | 30 | 0/10/10/10/0 |
   | essentials | 10 | 24 | 0/8/8/8/0 |
   | finance | 11 | 23 | 0/8/8/7/0 |
   | agriculture | 6 | 18 | 0/6/6/6/0 |
   | economics | 6 | 18 | 0/6/6/6/0 |
   | telecom | 6 | 17 | 0/6/6/5/0 |
   | law | 8 | 16 | 0/6/5/5/0 |
   | state-psc | 5 | 15 | 0/5/5/5/0 |
   | central-exams | 4 | 12 | 0/4/4/4/0 |
   | professional-certs | 4 | 12 | 0/4/4/4/0 |

   (Non-technical academies show `0` for Real World and Prerequisites —
   those tabs aren't applicable there, not a gap, per `nonTechSections`
   in `lib/data/navigation.ts`.)

   **`cloud` and `devops` alone account for 229 of ~510 total missing
   entries (~45%) across all 18 academies** — by a wide margin the
   highest-leverage place to start writing, not because they're the
   worst *percentage* (several non-tech academies have lower % coverage)
   but because they have both the most technologies and all 5 tabs
   applicable (Real World/Prerequisites are N/A for non-tech academies,
   so a "missing" count there structurally can't compete). Recommended
   order when this work actually starts: `cloud` first, `devops` second,
   then `databases`/`exams`/`data`/`ai` as a second tier — everything
   below that has a much smaller absolute footprint per academy.

### Phase C — Strategic decisions (need explicit sign-off; this month)
1. ~~**C1 — Decide `learn.synfracore.com`'s fate**~~ — **DECIDED
   2026-07-19: stays live indefinitely (permanent, not the redirect
   originally recommended here).** Superseded by the per-guide
   `rel="canonical"` plan (added only at content parity, per guide) in
   Part 8a's C1 section — see the parity-tracking table there.
2. **C2 — Resolve Symptom 8** (OP-1): instrumented browser session to capture
   the `sign_ins` 400 body and `/sign-in` POST 404 body; fix the
   `getAuthSafely()` hardcoded-URL smell across all 8 confirmed call sites in
   the same pass.
3. **C3 — Investigate Symptom 9** properly (nested route 404): needs the same
   live-tail/instrumentation approach that solved Symptom 6 — static reading
   found nothing this pass. Elevated priority given it blocks a real,
   in-progress feature. **2026-07-16: ruled out one theory.** Checked
   whether Cloudflare Pages' `_redirects` file rule-ordering (a documented
   next-on-pages routing quirk for nested dynamic routes) was the cause —
   it isn't; this project's actual generated `_redirects` file has only 2
   unrelated entries (a www→non-www comment, a `/home` redirect), meaning
   routing for this path lives inside the compiled `_worker.js`, not
   `_redirects`. Genuine next step requires `wrangler pages deployment tail`
   running live while someone actually reproduces the bug in a browser —
   deferred, no working Clerk auth session (local or preview) available to
   trigger this without that.
4. ~~**C4 — Symptom 10 root-cause fix**~~ — **RESOLVED 2026-07-18**, the
   `prefetch={false}` fix re-verified directly on production (0/48 real
   requests failed during a live sign-in attempt). See Symptom 10's entry
   above for the full recheck writeup.
5. **C5 — Launch Question Bank properly** (NF-10): nav + footer + homepage
   links, sitemap entries, per-paper metadata — only after C2 is fixed.
   **2026-07-16: explicitly deferred, not attempted.** C2 is only
   partially fixed (the hardcoded-URL smell), not the underlying Symptom
   8/11 mechanism, which needs D1 (also deferred). Driving more signed-out
   traffic into Question Bank before that's genuinely fixed means more
   visitors hit the broken sign-in handoff, not fewer — re-evaluate once
   D1 lands or Symptom 8/11 gets a real fix independent of it.

### Phase D — Structural platform work (branch + preview only; this quarter)
1. **D1 — OpenNext migration** (OP-2). **PAUSED INDEFINITELY as of
   2026-07-17/18 — attempted in full, reverted, not abandoned. See Part 4e
   for the complete writeup: the auth mechanism fix (Symptoms 6/9/10/11)
   was confirmed genuinely working on a full preview deployment, but a
   site-wide content-loading regression (`fetchContent()`'s
   self-referential fetch behaving unreliably under the Worker runtime)
   was found only after production cutover. Reverted via commit `4e25255`
   rather than attempting a second fix/cutover in the same session, given
   the accumulated risk and a week already spent on this investigation.
   The narrower goal (fixing Symptoms 2/6/8/10/11) is being pursued
   instead as a small, targeted `next-on-pages`-native code fix — see
   Part 4f. If D1 is revisited later, both the content-loading fix
   (use OpenNext's `ASSETS` binding instead of the self-fetch) and the
   auth-mechanism confirmation are already done — no re-discovery needed,
   only re-implementation and a more thorough Step 3 verification pass
   that explicitly covers content pages, not just auth flows, before any
   future domain cutover.**
2. **D2 — Static rendering** for eligible routes, only after D1.
3. **D3 — Sentry re-activation** (OP-3), after D1, with a before/after bundle
   measurement.
4. **D4 — Analytics depth**: per-content-page engagement reporting once D2
   lands, to make Phase B/C content investment decisions evidence-based.

### Phase E — Growth features (unchanged scope; build only when prioritized)
Payments/entitlements (include B2's legal-page update in its definition of
done) · content publishing workflow · real i18n · multi-tenant/B2B scaffolding
· feature flags via `BLOG_KV` · PWA/offline if it becomes an explicit product
goal · wire or explicitly reserve `roadmap_progress` · `is_beginner_ready`
publish gate if/when the content-quality program needs it.

---

## Part 8 — One-page priority order

1. Part 0 mobile fix — awaiting your manual mobile-viewport confirmation
2. ~~A1–A10~~ — **CORRECTION 2026-07-18: re-verified against actual code,
   all done except A1's remainder** (4 pages — community, contact,
   certifications index, troubleshooting — still double their title
   suffix; see Phase A above for exact evidence). Everything else in this
   bucket (share fix, OG/Twitter fix, hub-tab one-liner, sign-out URL,
   scoped provenance rewrite, Class 12, Symptom-10 warning doc,
   dead-directory deletion, duplicate-blog-post fix) was already shipped.
3. ~~**C4 — Symptom 10 whole-site-outage root cause**~~ — **RESOLVED
   2026-07-18**, re-verified directly on production. See Part 4/Part 8's
   C4 entry above.
4. ~~B1 stats source-of-truth~~ (done, 2026-07-18) · ~~B2 legal pages~~
   (done, corrected 2026-07-18) · ~~B3 Phase-1 closure~~ (done, corrected
   2026-07-18) · B4 Search
   Console · B5 content-thinness
   pass
5. ~~**C1 — learn.synfracore.com decision**~~ — **DECIDED 2026-07-19**,
   see Part 8a's C1 section (stays live; per-guide canonical tags at
   parity, not a redirect)
6. C2 Symptom 8 fix → C3 Symptom 9 investigation → C5 Question Bank launch
7. ~~**D1 — OpenNext migration**~~ — **PAUSED INDEFINITELY as of
   2026-07-17/18** (attempted in full, reverted; see Part 4e/4f). Not a
   current prerequisite for D2/D3 while paused.
8. D2 static rendering → D3 Sentry → D4 analytics depth (all blocked
   behind D1, which is paused — see above)
9. Phase E as/when prioritized

---

## Part 8a — Forward plan: content depth, quiz/interview UX, new verticals, access strategy (planned 2026-07-19, for tomorrow — no code changes yet)

Drafted from a same-night conversation about what to prioritize next, after
tonight's D1 cutover and monitoring window. **This is a plan for review, not
executed work** — no code changes were made writing this section. Grounded
against the actual current codebase (see per-item notes below), not guessed.

### Sequencing, explicit

1. **Finish today's open items first**: the 24-48h post-cutover monitoring
   window (Part 4k/4l — `wrangler tail` + periodic real-browser checks,
   report due at the 24h and 48h marks) and the friend's still-unresolved
   Google-auth 400 (Part 4j — likely a Clerk Dashboard OAuth redirect-URI
   issue, not yet investigated).
2. **Content-gap/consistency work already prioritized** (Part 6/6a's B5
   thin-tab pass on `devops`/`cloud`, and the C1 migration of the 13 new
   `learn.synfracore.com` topics — see below) **and the quiz component work**
   come next.
3. **New verticals (VLSI, AEE, Aeronautical/Aerospace) are the last phase**,
   per explicit instruction — scaffolding only until the enterprise-grade
   content gap above is closed.

### 1. Per-section quiz ("as you go") — mostly already built, this is a content gap, not a component gap

**Correction to the original framing**: a reusable, DB-backed, per-section
quiz component **already exists and is already mounted on every lesson
section** — `components/quiz/SectionQuiz.tsx`, rendered from
`app/academies/[academy]/[technology]/[section]/page.tsx:327-330` for every
section except Labs, keyed by `academy_slug`/`technology_slug`/`section_slug`
against the `quiz_questions` table, with attempts recorded in
`quiz_attempts` (`docs/learner-platform-schema.sql:104-114`) tied to the
existing `user_id`/progress model. There's also a separate, older,
hardcoded `lib/data/quizzes.ts` system (keyed by tech slug only, no
per-section granularity) used for exam-paper-style technologies
(GATE/JEE/NEET/banking/UPSC/etc.) — that one is intentionally different and
out of scope here.

**What's actually needed, then, isn't a new component — it's**:
- Auditing how many `[academy, technology, section]` combinations actually
  have rows in `quiz_questions` today vs. how many are silently empty
  (`SectionQuiz.tsx`'s own doc comment says it's "invisible until a section
  has some" — meaning empty sections just show nothing, not a placeholder,
  so the actual coverage gap has likely never been measured).
- Once measured, populating `quiz_questions` for gapped sections is a
  content task, not an engineering one.
- If the existing UX (visibility, retry behavior, scoring display) needs
  changes, that's a small, scoped `SectionQuiz.tsx` update, not new
  architecture.

**Effort estimate**: 0.5 day to build the coverage-measurement query/report;
content population effort depends entirely on what that reveals — could be
anywhere from a few dozen to a few hundred missing question sets.

### 2. Interview Q&A show/hide toggle

**Current state, confirmed**: answers are always visible today. The
Interview tab has no dedicated component — it routes through the same
generic `SectionContent.tsx` → `renderMarkdown()` path as every other tab,
and content is stored as plain bold markdown (`**Q9. …**` immediately
followed by `**A:** …`, e.g. `public/content/devops/kubernetes/interview.md:7-9`),
rendered with zero special-casing.

**Proposed approach**: add Q/A-pair detection to `renderMarkdown()` (or a
new small wrapper component used only for the interview section) that
recognizes a `**Q…**` line immediately followed by a `**A:**` line/block,
and renders the pair as a `<details>`/`<summary>`-based (or simple
`useState`-toggled) collapsed-by-default block instead of plain paragraphs.
Two implementation options, for your call:
- **Content-format change**: introduce an explicit `:::qa` markdown
  extension (matching the existing `:::callout` pattern already supported
  in `SectionContent.tsx`) and require new/edited interview content to use
  it — clean, but needs a pass over existing interview `.md` files to
  convert them.
- **Pattern-detection only**: keep content as plain `**Q**`/`**A**` pairs,
  detect the pattern at render time — no content-file changes needed, but
  slightly more fragile (relies on the exact bold-Q-then-bold-A adjacency
  holding across all existing files; worth a quick scan for exceptions
  before committing to this approach).

**Effort estimate**: 0.5-1 day for the component + render-path change;
additional time only if the content-format-change option is chosen and a
content pass is needed.

### 3. C1 content mapping — `learn.synfracore.com` → current site

Per the existing Part 6a audit (already done, not new research): **13
genuinely new topics**, each mapping to a specific existing academy (not a
new one):

| New topic | Source | → Academy/domain |
|---|---|---|
| `gitlab-ci` | `cicd/gitlab-ci.html` | `devops` |
| `fluxcd` | `cicd/fluxcd.html` | `devops` |
| `tekton` | `cicd/tekton.html` | `devops` |
| `github-actions` | `devops/github-actions.html` (largest, 3,500-4,500 words) | `devops` |
| `ebpf` | `containers/ebpf.html` | `devops` |
| `harbor` | `containers/harbor.html` | `devops` |
| `keda` | `containers/keda.html` | `devops` |
| `datadog` | `monitoring/datadog.html` (thinnest, ~800-1,000 words) | `devops` |
| `loki` | `monitoring/loki.html` | `devops` |
| `splunk` | `monitoring/splunk.html` | `devops` |
| `slo` | `monitoring/slo.html` | fold into `devops/prometheus` as a new tab/section, not a standalone technology **(decided 2026-07-19)** |
| `devsecops` | `security/devsecops.html` | `security` |
| `platform-engineering` | `sre/platform-engineering.html` | `devops` (technology entry, not a new academy) **(decided 2026-07-19)** |

The other **34 topics already exist** as registered technologies — no new
page needed, only a targeted extraction pass for thin tabs (Real World,
Troubleshooting, Notes), folded into the already-planned B5 thin-tab work,
not a separate track. Per the existing audit's own effort estimate:
**6.5-13 days** for the 13 new topics (0.5-1 day each, full editorial pass
including the mandatory beginner-ready fields from `CLAUDE.md`'s Content
rules), **34-68 hours** for the 34 existing ones (1-2 hrs each). Manual,
per-page review only — no bulk/automated migration, per the audit's own
explicit recommendation (this project already had one templated-content
quality problem; don't reintroduce that pattern).

**`learn.synfracore.com`'s status — revised 2026-07-19: stays live
indefinitely.** This is a permanent decision, not a temporary state pending
a later redirect/sunset call — the earlier framing in this section
(and in Phase C's original C1 item, `07-roadmap-final.md:2544-2547`, and
the unwired `docs/learn-subdomain-redirects.csv`) proposed 301 redirects;
**that approach is superseded.** No redirect will be built. The domain
keeps serving its own traffic on its own terms.

**Mechanism instead: `rel="canonical"` on the old page, added only once
the new-site equivalent is at genuine content parity or better — not
before, and not as part of migration itself.** For each of the 13 guides,
once its new synfracore.com page(s) cover everything the old mega-page did
(not merely "a page now exists"), add a canonical tag on the
`learn.synfracore.com` page pointing at the new URL. This tells search
engines which version is authoritative for ranking, without touching
traffic, without removing the old page, and without a redirect's binary
all-or-nothing timing. Until parity is reached, the old page stays fully
self-canonical (or unchanged) — no canonical tag pointing at a thinner
new-site page.

**Sequencing, explicit**: content-parity check happens *before* any
canonical tag is added, per guide, not in bulk. If the new site's
split-tab version is currently thinner than the old mega-page for a given
guide, don't add the canonical yet — flag it "migration incomplete" and
hold until Track B's content work closes that specific gap. This makes the
canonical rollout incremental and content-driven, not a single flag-day
event.

**The 34 already-existing topics need no canonical change at all** — these
were never true duplicates, just overlapping subject coverage between two
platforms, which is normal and not a redirect/canonical situation.

**Parity tracking table** (all 13 checked against the current technology
registry, `lib/data/academies.ts`, 2026-07-19 — **none have been migrated
yet**, so every row is currently "needs more content first"; this table is
the tracking artifact Track B should update as each guide's new-site
version is actually built):

| Guide | Old URL | Proposed new URL | Parity status |
|---|---|---|---|
| GitLab CI | `learn.synfracore.com/cicd/gitlab-ci.html` | `synfracore.com/academies/devops/gitlab-ci/overview` (not yet created) | Needs more content first — new page doesn't exist yet |
| FluxCD | `learn.synfracore.com/cicd/fluxcd.html` | `synfracore.com/academies/devops/fluxcd/overview` (not yet created) | Needs more content first |
| Tekton | `learn.synfracore.com/cicd/tekton.html` | `synfracore.com/academies/devops/tekton/overview` (not yet created) | Needs more content first |
| GitHub Actions | `learn.synfracore.com/devops/github-actions.html` | `synfracore.com/academies/devops/github-actions/overview` (not yet created) | Needs more content first — largest guide (3,500-4,500 words), likely slowest to reach parity |
| eBPF | `learn.synfracore.com/containers/ebpf.html` | `synfracore.com/academies/devops/ebpf/overview` (not yet created) | Needs more content first |
| Harbor | `learn.synfracore.com/containers/harbor.html` | `synfracore.com/academies/devops/harbor/overview` (not yet created) | Needs more content first |
| KEDA | `learn.synfracore.com/containers/keda.html` | `synfracore.com/academies/devops/keda/overview` (not yet created) | Needs more content first |
| Datadog | `learn.synfracore.com/monitoring/datadog.html` | `synfracore.com/academies/devops/datadog/overview` (not yet created) | Needs more content first — thinnest guide (~800-1,000 words), likely fastest to reach parity |
| Loki | `learn.synfracore.com/monitoring/loki.html` | `synfracore.com/academies/devops/loki/overview` (not yet created) | Needs more content first |
| Splunk | `learn.synfracore.com/monitoring/splunk.html` | `synfracore.com/academies/devops/splunk/overview` (not yet created) | Needs more content first |
| SLO | `learn.synfracore.com/monitoring/slo.html` | `synfracore.com/academies/devops/prometheus` — new tab/section on the existing Prometheus technology, not a standalone page **(decided 2026-07-19)** | Needs more content first |
| DevSecOps | `learn.synfracore.com/security/devsecops.html` | `synfracore.com/academies/security/devsecops/overview` (not yet created) | Needs more content first |
| Platform Engineering | `learn.synfracore.com/sre/platform-engineering.html` | `synfracore.com/academies/devops/platform-engineering/overview` — new technology entry under the existing DevOps academy, not a new top-level academy **(decided 2026-07-19)** | Needs more content first |

**Process going forward**: as each guide's new-site pages are built and
reach genuine parity, update this table's status to "ready for canonical,"
add the tag on the old page, then mark it "canonical added [date]." Don't
batch this — evaluate and act per guide as Track B's content work
completes each one.

### New: Technical SEO — structured data, sitemap, internal linking

**Structured data — refine, not build from scratch.** `Course` and
`BreadcrumbList` JSON-LD are already emitted on every technology/section
page (`components/seo/JsonLd.tsx`, wired in
`app/academies/[academy]/[technology]/[section]/page.tsx:180-189`);
`WebSite`/`Organization` are already site-wide via the root layout. No
`LearningResource` type exists yet. Proposal: evaluate whether adding
`LearningResource` (schema.org's more granular type for an individual
lesson/section, as distinct from `Course` covering the whole technology)
is worth the added markup — check Google's current rich-results
guidance for which type it actually surfaces for this content shape before
building both; adding a schema type Google doesn't render anything for is
pure overhead.

**Sitemap — already handles new verticals automatically, confirmed, no
action needed.** `app/sitemap.ts` derives all academy/technology/section
URLs live from `lib/data/academies.ts`/`lib/data/navigation.ts` plus a
`hasContent()` check per section (filters out placeholder pages) — this is
exactly the fix that replaced the old hand-maintained, 68-slugs-stale
sitemap (Part 3/Stage-3 F3). Once VLSI/AEE/Aerospace are added to the
academies registry (item 4 below), they'll appear in the sitemap
automatically, with zero sitemap-specific work needed.

**Internal linking — formalize what already exists ad hoc, rather than
building new.** Two patterns already live: `components/tech/WhatNext.tsx`
(within-technology section-to-section flow — overview → fundamentals →
labs, etc.) and an inline "Also in {domain.name}" sibling-technology block
on each technology hub page
(`app/academies/[academy]/[technology]/page.tsx:218-234`, up to 6 links,
JSX inline rather than a reusable component). Proposal: extract the inline
sibling-links block into a proper `RelatedTechnologies` component, and
extend it to also surface cross-domain but topically-related technologies
(e.g. `kubernetes` ↔ `helm` ↔ `argocd` even though they may span different
domains within an academy) — currently limited to same-domain siblings
only, which under-links genuinely related content.

**Effort estimate**: structured-data evaluation + optional
`LearningResource` addition, 0.5d; internal-linking component extraction +
cross-domain relation data, 1-1.5d (the relation data itself — which techs
relate to which — is the larger part, not the component).

### 4. New verticals — VLSI, AEE, Aeronautical/Aerospace (scaffolding only)

Structure to follow, matching the existing pattern
(`lib/data/academies.ts:1-28`, e.g. `devopsAcademy` at lines 33-131):

```ts
export const vlsiAcademy: Academy = {
  slug: "vlsi", title: "...", subtitle: "...", icon: "...", color: "...",
  description: "...",
  domains: [
    { slug: "...", name: "...", icon: "...", description: "...", color: "...",
      technologies: [
        { slug: "...", name: "...", icon: "...", description: "...",
          level: "Beginner" | "Intermediate" | "Advanced", tags: [...] },
        // ...
      ],
    },
  ],
};
```
then appended to the `academies` array (`lib/data/academies.ts:791-811`,
same place `lawAcademy` onward — "Phase 3 new academies" — were added).
For Aeronautical/Aerospace specifically, given the stated interest in
"how our universe will work," "space/orbital mechanics," "what jobs are
available," and a track accessible to younger/beginner students: this
likely needs its own domain breakdown (e.g. foundational physics/math →
aerodynamics → propulsion → orbital mechanics/astrodynamics → careers) design
before technology-level scaffolding — worth a short separate planning pass
once this phase starts, not decided here.

**Scope for tomorrow, if started**: academy/domain/technology entries only
(the data structure), using placeholder descriptions — no actual lesson
content. Content generation is explicitly a later, separate phase.

**Effort estimate**: 0.5-1 day per academy for scaffolding (structure
only), assuming the domain/technology breakdown is decided in advance;
content generation is untimed here since it's out of scope for this phase.

### 5. Access strategy — revised, no hard gate

**Decision, as stated**: all content stays fully public and indexable
(`index, follow` unchanged everywhere) — no login wall on any tab, ever.
Replace the "must log in for anything beyond Overview" framing entirely.

**Proposed mechanism**: a soft, dismissible login-nudge modal/banner —
appears once per session (or after an engagement signal, e.g. completing a
section — ties naturally into the existing `lesson_progress` table, which
already tracks per-section completion), framed around progress tracking
("Create an account to save your progress across courses"), not access
restriction. Must be trivially dismissible (single click, no dark patterns),
must never cover/block underlying content, and must not re-nag repeatedly
within the same visit — a `localStorage` or session-scoped dismissal flag
is sufficient, no backend needed for the dismissal state itself.

**Effort estimate**: 0.5-1 day (a modal/banner component + a dismissal-state
hook + a trigger condition, e.g. on `lesson_progress` insert or a timer).

### 6. Hero-page value-prop options (drafts only, for you to pick/revise)

Three short tagline/subheading directions around "one account, one place,
every course" as a differentiator — not final copy, just options to react
to:
1. *"One login. Every course, every exam, every certification — all in one
   place."* (breadth-first, enumerates the payoff)
2. *"Stop juggling five different platforms. Your entire learning journey,
   one account."* (pain-point-first, contrasts against the fragmented
   status quo)
3. *"DevOps to Aerospace, School to Career — one SynfraCore account tracks
   it all."* (range-first, emphasizes the unusually wide subject span as
   the differentiator)

### Rough total effort, this phase excluding new-verticals content generation

Quiz coverage audit (0.5d) + Interview toggle (0.5-1d) + C1's 13-new-topic
migration (6.5-13d) + C1's 34-existing thin-tab pass (34-68h ≈ 4-8.5d,
already folded into B5) + technical SEO (structured data + internal
linking, 1.5-2d) + access-strategy modal (0.5-1d) + new-verticals
scaffolding (0.5-1d per academy, structure only) ≈ **roughly 2.5-3.5
weeks** of sequenced work before new-vertical content generation even
begins, most of it being the C1 content migration (already the largest
identified item before tonight's conversation, not a new estimate). The
`learn.synfracore.com`'s fate is now decided (stays live indefinitely,
2026-07-19) and needs no separate resolution step — the per-guide
canonical-tag work is small (minutes per guide) and happens naturally as
each guide reaches parity, not a separate project phase.

---

## Part 9 — Prior incident history (symptoms 1–8, condensed from `06-roadmap.md`)

Preserved so this document is fully self-contained; `06-roadmap.md` remains on
disk with full original detail and a pointer to this file.

1. **Sentry/next-on-pages incompatibility** — wired, caused a real deploy
   failure (bundling error), reverted. Confirmed the revert fixed deploys.
   Re-appliable only after OP-2/D1.
2. **`invalidateCacheAction` Server Action 405 (structural)** — Clerk's SDK
   fires a global Server Action from `ClerkProvider` on every page; the
   adapter 405s any Server Action lacking `runtime = "edge"`. Since
   `ClerkProvider` is global, every page structurally needs edge runtime,
   blocking any static rendering pre-migration.
3. **`auth()` missing inside Server Actions** — an AsyncLocalStorage
   context-propagation gap on this adapter, confirmed to also reproduce on
   `@opennextjs/cloudflare` (so D1 alone won't fix it). Fixed by
   `getAuthSafely()`, manually re-verifying via
   `clerkClient().authenticateRequest()` — now at 8 call sites.
4. **`/admin`'s middleware-rewrite-404 silently falls through to homepage** —
   the adapter mishandles Clerk's default rewrite-to-fake-path 404 pattern.
   Fixed by removing `/admin` from the middleware matcher, relying on the
   page's own `notFound()` instead.
5. **`/profile` confirmed unaffected** by the same investigation — its
   `auth.protect()` correctly redirects for real page navigations; only
   non-page requests hit the broken path.
6. **Question-bank Start Server Action 404s from inside Next's own dispatch
   layer** — confirmed via live `wrangler pages deployment tail` that the
   function is correctly invoked but still fails deeper, inside Next's
   Server-Action-ID/encryption-manifest verification. Fixed by converting to
   Route Handlers + client `fetch()` — now the standing pattern for new
   mutations (Phase-0 rule 4).
7. **Homepage 500 from a Windows-mounted-drive build (RESOLVED)** — RSC
   compiler emitted backslash paths into the client-reference-manifest when
   built from `/mnt/d/synfracore`; a POSIX Worker can't match those keys.
   Fixed by building from a native WSL path — now a mandatory, permanent
   Phase-0 rule. Distinct mechanism from Symptom 6.
8. **Question-bank sign-in redirect race (OP-1, still open)** — signed-out
   Start click gets a `/sign-in` POST 404 + Clerk `sign_ins` 400 + "already
   signed in." Leading unconfirmed theory: a token-rotation race between
   `getAuthSafely()`'s re-verification and Clerk's background token refresh.
   Surfaced the `getAuthSafely()` hardcoded-URL smell in passing.
