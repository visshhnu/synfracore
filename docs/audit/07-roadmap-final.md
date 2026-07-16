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
- **OP-6 · `afterSignOutUrl` — confirmed still missing.**
  [`components/layout/Navbar.tsx:305`](../../components/layout/Navbar.tsx#L305) has
  bare `<UserButton />`, no props.
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
  - *1.5 dead-directory cleanup*: **confirmed, two concrete findings.**
    (a) `public/content/{education` is a malformed, empty junk directory
    (containing an equally malformed empty subdirectory literally named
    `{java,c-programming,cpp},exams`) — a failed shell brace-expansion,
    0 files, safe to delete outright, zero data risk.
    (b) `public/content/monitoring/` (24 files: `datadog`, `elk-stack`,
    `grafana`, `loki` subfolders) is genuinely orphaned — it is **not** in
    `ALIAS_ROOTS` in `scripts/generate-content-registry.mjs` (only
    `devops: ["devops", "infrastructure"]` is registered), so the registry
    never scans it and no page ever renders it. Checked for data-loss risk
    before recommending deletion: `elk-stack`'s content is safely duplicated
    under `devops/elk-stack` and `infrastructure/elk-stack` already (plus a
    stray `devops/elk`), and `loki` is not a registered technology slug in
    `academies.ts` at all — so `monitoring/` is pure dead weight, not a
    content-loss bug. Safe to delete entirely.
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

### Symptom 10 · Retry-storm resource exhaustion causing intermittent whole-site 503s (open, currently active/self-mitigating — RE-CONFIRMED LIVE TODAY)
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

Given the whole-site blast radius, this needs priority attention ahead of most
other open items — see Part 6 priority order.

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
  describes) is genuinely unconfirmed either way.**
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
1. **A1 — Fix the doubled title suffix** (NF-1): remove the manual
   `| SynfraCore` append from the 10+ page-level metadata exports listed
   above; let the layout template handle it. Verify on all 5 route types
   checked live today.
2. **A2 — Fix the share component** (NF-2): build the URL from the page's own
   canonical/params, dedupe the WhatsApp/Twitter text. One shared component.
3. **A3 — Fix OG/Twitter metadata** (NF-3): replace `og-image.svg` with a
   1200×630 PNG; make every page's `og:title`/`og:url` and — critically, since
   this leak is universal even on pages with correct OG — `twitter:title`/
   `twitter:description` inherit from that page's own metadata, never a root
   default. Validate with X/LinkedIn/Facebook debugger tools.
4. **A4 — NF-11 one-line fix**: delete the hardcoded 10-slug filter in
   `app/academies/[academy]/[technology]/page.tsx:90-95` so the hub grid
   matches the sidebar's full 17-tab list.
5. **A5 — `afterSignOutUrl` one-liner** (OP-6) on `Navbar.tsx:305`.
6. **A6 — NF-5 scoped provenance fix**: rewrite the 4 identified files
   (`infrastructure/docker/{intermediate,advanced}.md`,
   `infrastructure/kubernetes/{intermediate,fundamentals}.md`) to original
   voice with generic image names; add `TechWorld`/`Nana`/`saifshah`/`from
   the notes` as HARD_FAIL markers to the content validator (corpus-wide grep
   already confirms no other hits, so HARD_FAIL from day one is safe here,
   unlike NF-4's dropped WARN-first plan).
7. **A7 — Hide or "Coming soon"-label the Class 12 board** (NF-7, confirmed
   empty subject-badge area on `/learn` today): one-line filter, or a badge,
   per the original recommendation.
8. **A8 — Symptom 10 mitigation note**: add the "don't sign out from a
   question-bank page" interim warning somewhere a developer will actually
   see it (CLAUDE.md's Do-Not section is the natural place) — currently
   undocumented anywhere in the repo.
9. Drop NF-4 (duplicated table separators) from the roadmap entirely — not
   reproducible; no validator or fix needed.
10. **A9 — Delete the two dead content directories** (OP-7's 1.5, confirmed):
    `public/content/{education` (malformed empty junk dir) and
    `public/content/monitoring/` (24 orphaned files, confirmed safely
    duplicated elsewhere for `elk-stack`, confirmed `loki` isn't even a
    registered technology). Zero data-loss risk either way — both are
    unreachable through the registry today.
11. **A10 — Canonicalize the duplicate blog post** (NF-12, confirmed):
    `devops-salary-india-2025` vs `devops-salary-india-2026` — archive or
    redirect the older one.
12. Drop NF-12's other three sub-items ("World's"/"India's" messaging
    conflict, garbled logo alt text, footer raw-URL link text) — none
    reproduced against today's live site.

### Phase B — Correctness at the data layer (next 1–2 weeks)
1. **B1 — Single source of truth for displayed stats** (NF-6): a build-time
   `stats.ts` derived from `academies.ts`/registry/roadmaps; fixes the
   confirmed 18-vs-11 academy-count drift as its first concrete case. Add a
   CI check that fails if a known stat literal reappears in JSX.
2. **B2 — Rewrite Terms/Privacy** (NF-8) to match the real product; remove
   billing/refund language until payments exist; re-date past January 2025.
3. **B3 — Phase-1 closure follow-through** (OP-7): wire
   `generate-content-registry.mjs` into the build step; build a real
   search-index generator to replace the hardcoded `searchIndex` array in
   `app/search/page.tsx`; verify/complete 1.5's dead-directory cleanup.
4. **B4 — Search Console pass** (OP-4): verify contamination phrases aren't
   indexed; submit the regenerated sitemap.
5. **B5 — Content thinness pass**: use Part 6's per-tab numbers (Real World
   8%, PYQ 12%, FAQ 12%, Notes 20%, Prerequisites 20%) to prioritize which
   tabs get written next, academy-by-academy, rather than treating "coverage"
   as a single number. Also fold in the 68-file "Quick Reference" boilerplate
   batch and the 45-file "Add your answer here" placeholder batch found in
   Part 6 — these were not previously tracked as a discrete item.

### Phase C — Strategic decisions (need explicit sign-off; this month)
1. **C1 — Decide `learn.synfracore.com`'s fate** (NF-9, confirmed live today
   still serving the full old platform, unmanaged). Recommended: map its top
   URLs to synfracore.com equivalents and 301 the subdomain; `noindex` it
   immediately if not ready to commit. Highest-leverage single SEO decision
   available.
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
4. **C4 — Symptom 10 root-cause fix**: the Clerk retry-storm is a whole-site
   availability risk (re-confirmed live today), materially more severe than
   most other open items — do not let it sit behind lower-severity work
   just because it happens to self-recover.
5. **C5 — Launch Question Bank properly** (NF-10): nav + footer + homepage
   links, sitemap entries, per-paper metadata — only after C2 is fixed.

### Phase D — Structural platform work (branch + preview only; this quarter)
1. **D1 — OpenNext migration** (OP-2). **Re-assessed 2026-07-16 (see Part 4a
   below) — payoff is confirmed partial, not full, and scope is larger than
   this roadmap previously described.** Search upstream issues for the
   esbuild alias error first; if unresolved, file a minimal repro and pause —
   don't brute-force. Once building, validate on a `workers.dev` preview with
   the full Phase-0 checklist plus a Server Action test and a
   middleware-rewrite test. Budget this as its own dedicated project, not a
   quick swap — 50+ files need `export const runtime = "edge"` removed,
   `wrangler.toml` needs a full rewrite, an R2 bucket needs manual setup in
   the Cloudflare dashboard for the incremental cache, and
   `lib/rateLimit.ts`'s `BLOG_KV` binding access needs rewriting for the
   Workers `env` argument pattern instead of a `globalThis` read.
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
2. A1–A10 (this week — title fix, share fix, OG/Twitter fix, hub-tab
   one-liner, sign-out URL, scoped provenance rewrite, Class 12 hide/label,
   Symptom-10 warning doc, dead-directory deletion, duplicate-blog-post fix)
3. **C4 — Symptom 10 whole-site-outage root cause** (elevated above its old
   position given the live re-confirmation today — this is a standing
   availability risk, not just an SEO/content item)
4. B1 stats source-of-truth · B2 legal pages · B3 Phase-1 closure · B4 Search
   Console · B5 content-thinness pass
5. **C1 — learn.synfracore.com decision** (highest-leverage single SEO call)
6. C2 Symptom 8 fix → C3 Symptom 9 investigation → C5 Question Bank launch
7. **D1 — OpenNext migration** (prerequisite for D2/D3)
8. D2 static rendering → D3 Sentry → D4 analytics depth
9. Phase E as/when prioritized

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
