# Stage 5 — Operational Readiness Audit

**Scope**: logging, monitoring, analytics hooks, CI/CD readiness, testing coverage, deployment strategy, environment config, failure recovery, offline behavior, feature-flag readiness, documentation quality, missing admin/business features.

**Method**: searched for every category of tooling (test frameworks, error-tracking SDKs, analytics SDKs, service workers, payment SDKs) rather than assuming absence — every "zero found" below is a confirmed search result, not a guess. Read `README.md` and `CLAUDE.md` in full and checked their claims against the actual codebase.

---

## Answering your specific question: slug-rename safety
**Confirmed: no safeguard exists. The next slug rename carries the identical silent-orphan risk Stage 4 found.**

Searched the entire codebase for any `slug_aliases`/alias-table/redirect-map pattern — the only match was Stage 4's own audit document proposing one. The only rename-handling mechanism anywhere is the single hardcoded entry in `next.config.ts`:
```ts
{ source: "/academies/infrastructure/:path*", destination: "/academies/devops/:path*" }
```
This is a **URL-level redirect only** — it fixes navigation for a human clicking an old link, and does nothing at the data level. There is no code anywhere that would remap `academy_slug`/`technology_slug` values in Supabase queries, and no table that tracks "this slug used to be called that." The `infrastructure → devops` rename happened to orphan zero rows (verified together this session), which is fortunate timing, not a safeguard working as designed — the next rename, whenever it happens, has no more protection than this one did.

This is captured below as **Finding 6**, explicitly flagged for the Stage 6 roadmap as a concrete, scoped item (add a `slug_aliases` table + a documented rename procedure) rather than a one-off historical footnote.

---

## Finding 1 — README.md actively misdescribes the deployment pipeline and undercounts the product by roughly 4x
**Severity: Critical**

**Verified inaccuracies in `README.md`**, checked line-by-line against the real codebase:

| README claims | Actual (verified) |
|---|---|
| "Framework: Next.js 16" | `next@15.5.19` (`package.json`/`npm ls`) |
| "Deploy: Vercel" + full `vercel --prod` instructions | 100% Cloudflare Pages via `@cloudflare/next-on-pages` + `wrangler pages deploy` (`package.json`'s actual `deploy` script, `wrangler.toml`) — there is no Vercel project, no `vercel.json`, nothing Vercel-related anywhere in the repo |
| "6 Academies · 50+ Technologies · 13 Certifications" | 244 technology entries (Stage 1 count) across at least 15 academies (devops, cloud, databases, ai, data, security, healthcare, essentials, education, exams, law, agriculture, finance, telecom, economics, state-psc, central-exams, professional-certs) and 17 certifications (`lib/data/navigation.ts`) |
| Academy table lists only Infrastructure/Cloud/AI/Data/Healthcare/Cybersecurity | Entirely omits Law, Agriculture, Finance, Telecom, Economics, State PSC, Essentials, Education, Exams, Central Exams, Professional Certs — the majority of this entire engagement's roadmap-fixing work (advocate-career, judiciary, UPSC, banking, agriculture, telecom, NEET, JEE) touched academies this README doesn't mention exist |
| "`[section]/page.tsx` # AI-generated content", "SectionContent (AI-powered)" | Describes AI generation as the primary content mechanism; actual primary mechanism is pre-written static markdown (Stage 1), and `/api/ai` is now deliberately gated off by default (`AI_ASSISTANT_ENABLED=false`) as of this session's security fix |

**Why this is Critical, not just stale**: a README's deployment section is the one place a future engineer (including a future instance of whoever's doing this work) goes to actually ship a change. Following this README's "Deploy to Vercel" instructions would not work at all — there's no Vercel project configured — and would waste real time before someone discovers the actual pipeline is Cloudflare/wrangler, buried only in `package.json` and `wrangler.toml` with no top-level explanation. The product-scope inaccuracies (6 vs 15+ academies) similarly risk a future contributor — or a business stakeholder — operating on a fundamentally wrong picture of what the platform actually is.

**Business impact**: wasted engineering time on the wrong deployment path; wrong mental model of product scope for anyone using this file as an entry point (which is the entire purpose of a README).

**Recommended fix**: rewrite `README.md`'s Tech Stack, Deploy, and academy-count sections to match verified reality — Next.js version, Cloudflare Pages/wrangler deployment steps (`npm run deploy`), and either an accurate academy count or a pointer to `lib/data/academies.ts` as the live source of truth rather than a hand-counted, guaranteed-to-drift number in prose (the same "don't hand-maintain a number that's derivable from code" lesson from Stages 1/3/4).

**Breaking or non-breaking**: non-breaking — documentation only.

**Migration strategy**: one-pass rewrite; verify the new deploy instructions actually work by following them once.

**Rollback strategy**: not applicable.

---

## Finding 2 — Zero test coverage of any kind, and zero CI/CD; the only safety net is one manually-run custom script
**Severity: High**

**Verified**: no `.test.`/`.spec.` files exist anywhere in the repo. No test framework is installed (`package.json` has no `jest`, `vitest`, `playwright`, `cypress`, or `@testing-library/*`). This restates and extends Stage 1 Finding 6 (no CI/CD) — combined, this means: **there is no automated verification of any kind between writing code and it reaching production**, except `scripts/validate-roadmaps.ts` (excellent for what it checks, but scoped only to roadmap routing, and only runs when someone remembers to type the command).

**Why it's a problem**: every fix made across this entire multi-session engagement (roadmap routing, RLS policies, error boundaries, the `/api/ai` security fix, the sitemap regeneration) is currently protected from regression by nothing except a human noticing something looks wrong in production. For a codebase this size (2,000+ content pages, 100 TS/TSX files, 28,000+ LOC), this is a significant and growing risk with every change.

**Business impact**: every future change carries unbounded regression risk; bugs are found in production (as has repeatedly happened this engagement) rather than before shipping.

**Recommended fix**: this doesn't need to be "add full test coverage" as a single project — start narrow and high-value: (1) wire `npm run validate:roadmaps` into a GitHub Actions workflow on every push (near-zero effort, already recommended in Stage 1); (2) add a small number of integration tests for the highest-risk, highest-blast-radius code paths first — `ensureUserRecord()`, the RLS-dependent query functions in `queries.ts`, and the `/api/ai` auth gate just added — rather than attempting broad coverage immediately.

**Breaking or non-breaking**: non-breaking, purely additive.

**Migration strategy**: CI workflow first (cheapest, highest immediate value), then incrementally add tests to new/touched code going forward rather than a dedicated "add tests" sprint retrofitting everything at once.

**Rollback strategy**: not applicable — additive only.

---

## Finding 3 — No error tracking/observability service; this has already caused repeated, confirmed multi-session debugging cycles
**Severity: High**

**Verified**: no Sentry, Datadog, LogRocket, Bugsnag, or Rollbar (or any equivalent) anywhere in `package.json` or the codebase. Production error visibility is limited to `console.error` calls (31 across the codebase) landing in Cloudflare's Functions logs.

**This already happened, not hypothetical**: earlier in this same engagement, the dashboard/onboarding crash investigation went through multiple rounds of "still same issue" screenshots specifically because Cloudflare's function logs weren't being checked/weren't accessible in practice — the eventual fix was a *temporary diagnostic banner rendering the raw error directly on the page* (since removed as a security fix in Stage 2), specifically because there was no other way to see what was actually failing in production. That workaround being necessary at all is direct, first-party evidence of this exact gap.

**Business impact**: every future production error repeats the same expensive pattern — screenshots, guessing, temporary unsafe diagnostics — instead of a developer simply opening an error-tracking dashboard and seeing the real stack trace, request context, and affected-user count immediately.

**Recommended fix**: add Sentry (or an equivalent) — it has a Cloudflare Workers/edge-runtime-compatible SDK, a free tier appropriate for this project's current scale, and directly replaces the "add a temporary raw-error banner" pattern with a proper, permanent, secure solution.

**Breaking or non-breaking**: non-breaking, additive.

**Migration strategy**: add the SDK, wire it into the existing `console.error` call sites (many already exist and are well-placed, e.g. `ensureUser.ts`, `queries.ts` — these become `Sentry.captureException()` calls alongside or instead of `console.error`), verify against a deliberately-triggered test error before relying on it.

**Rollback strategy**: remove the SDK; no data/schema impact.

---

## Finding 4 — Zero analytics; no visibility into real user behavior across 2,000+ pages
**Severity: Medium**

**Verified**: no Google Analytics, PostHog, Plausible, Mixpanel, or Amplitude anywhere in `app/layout.tsx` or elsewhere.

**Why it's a problem**: this is a content-heavy platform where prioritization decisions (which academies to expand, which content is thin-but-popular vs comprehensive-but-unvisited) should be informed by real usage data — currently there's no way to know which of the 2,000+ pages get visited at all, where users drop off, or which roadmaps/academies drive the most engagement.

**Business impact**: content and product decisions are currently made without any usage signal — including, notably, this audit's own findings about thin/orphaned content (Stage 1) can't be prioritized by "which of these would actually get traffic" without this data.

**Recommended fix**: add a privacy-respecting analytics tool (Plausible or PostHog both fit a Cloudflare-hosted site well) — low integration effort, immediate value for content/product prioritization.

**Breaking or non-breaking**: non-breaking, additive.

---

## Finding 5 — Documented environment variables are significantly incomplete; no `.env.example`
**Severity: Medium**

**Verified**: `CLAUDE.md`'s "Environment variables" section lists exactly 4: `NEXT_PUBLIC_CLERK_PUBLISHABLE_KEY`, `CLERK_SECRET_KEY`, `NEXT_PUBLIC_SUPABASE_URL`, `NEXT_PUBLIC_SUPABASE_ANON_KEY`. The application actually requires at least 6 more, confirmed by direct code reference this engagement: `SUPABASE_SERVICE_ROLE_KEY` (Clerk webhook), `CLERK_WEBHOOK_SIGNING_SECRET` (Clerk webhook), `ANTHROPIC_API_KEY` (`/api/ai`), `AI_ASSISTANT_ENABLED` (`/api/ai` kill switch, added this session), `RESEND_API_KEY` (`/api/digest`, `/api/subscribe`), `DIGEST_SECRET` (`/api/digest`). No `.env.example` file exists to serve as a definitive, always-current checklist.

**Why it's a problem**: anyone setting up a fresh environment (a new contributor, or a disaster-recovery redeploy from scratch) has no single accurate place to find every required variable — `CLAUDE.md` alone would leave the webhook, AI, and email features silently non-functional with no indication why, in the same "fails quietly rather than loudly" pattern already found and fixed for Clerk key misconfiguration.

**Recommended fix**: add a `.env.example` file (safe to commit — no real values, just variable names and one-line descriptions) covering every variable found above, and update `CLAUDE.md`'s list to match it.

**Breaking or non-breaking**: non-breaking, additive documentation.

---

## Finding 6 — No slug-rename safety mechanism (your question this turn) — capture as a concrete Stage 6 item
**Severity: Medium**

Fully detailed at the top of this document. Summary for the roadmap: **add a `slug_aliases` table** (`old_slug`, `new_slug`, `slug_type` — academy/technology/section) that application queries can consult as a fallback when a direct match isn't found, **and document a mandatory rename procedure** (update code → add alias row → optionally backfill existing rows) so this isn't just schema sitting unused, but a checklist a future rename is required to follow. This is scoped specifically enough to be a single, concrete Stage 6 roadmap item, not an open-ended architecture change.

---

## Finding 7 — No feature-flag system; one ad-hoc env-var boolean is the only precedent
**Severity: Medium**

**Current state**: `AI_ASSISTANT_ENABLED` (added this session, Stage 2's fix) is the only feature-flag-like mechanism anywhere in the codebase — a plain env var requiring a full redeploy to toggle, with no per-user targeting, no percentage rollout, no kill-switch-without-redeploy capability.

**Why it's worth flagging now, not urgent**: this pattern works fine for a single binary on/off switch, but doesn't scale to "roll out the SynfraAI tutor to 10% of users first" or "let admins toggle a feature without waiting for a deploy" — both plausible needs given the planned tutor feature and the admin dashboard's own growth trajectory.

**Recommended fix**: no urgency to adopt a dedicated flag service (LaunchDarkly, etc.) at current scale — the existing Cloudflare KV namespace (`BLOG_KV`, already proven working) could hold simple flag values readable without a redeploy, as a lower-effort intermediate step before a dedicated service is ever justified.

**Breaking or non-breaking**: non-breaking, additive, no urgency.

---

## Finding 8 — No payments/entitlements integration; even the vestigial schema for it is part of the dead schema from Stage 4
**Severity: Medium (expected at this stage, but worth precisely scoping)**

**Verified**: `CLAUDE.md` already states Razorpay/Stripe are "not yet integrated" — confirmed accurate, zero payment SDK code exists anywhere. Additionally: the `plans`/`subscriptions` tables that would represent entitlements already exist in `docs/synfracore-schema.sql` — but per Stage 4 Finding 1, that entire schema is dead/unused, so there isn't even live, connected scaffolding to build payments against; a real payments feature would need its own schema designed against the *actual* (learner-platform) schema generation, not the old one.

**Recommended fix**: no action needed now (matches `CLAUDE.md`'s own stated phasing — "not yet integrated" is accurate, not a bug) — but when payments are built, design the entitlements schema against `learner-platform-schema.sql`'s real, connected tables, not by resurrecting `synfracore-schema.sql`'s `plans`/`subscriptions`, which would repeat Finding 1's disconnection problem.

---

## Finding 9 — No content publishing workflow; every content change requires a developer, a git commit, and a redeploy
**Severity: Medium**

**Verified**: no CMS, no admin content-authoring UI, no draft/staging/scheduled-publish mechanism anywhere. Content changes are, and can only be, direct markdown file edits plus (per Stage 1) manual registry/sitemap/search-index updates, committed to git, deployed via `wrangler pages deploy`.

**Why it's worth flagging under "missing business features," not just architecture**: this means a non-technical content editor (a subject-matter expert who could otherwise write a lesson) currently cannot contribute content at all without developer involvement for every single change — a real operational bottleneck on content velocity as the platform's content ambitions (visible in this engagement's own roadmap-fixing scope, spanning law/medicine/agriculture/telecom/exams content well beyond a typical dev-team's own expertise) clearly exceed what a small engineering team can author unassisted.

**Recommended fix**: no specific tool prescribed here (this is a genuine product/roadmap decision, not a quick fix) — but worth deliberately scoping as its own initiative: options range from a lightweight git-based CMS (Tina CMS, Decap CMS — both work well with a markdown-file content model like this one, minimal architecture change) to a full headless CMS migration (bigger lift, cleaner long-term). Flagging the need and the low-effort option (git-based CMS, since content is already markdown-in-git) rather than prescribing a specific solution.

---

## Finding 10 — PWA manifest exists but no service worker; "offline behavior" is currently none
**Severity: Low**

**Verified**: `public/site.webmanifest` is correctly configured (icons, standalone display, theme color) and referenced in `app/layout.tsx`'s metadata — but no service worker is registered anywhere (`navigator.serviceWorker` never referenced in the codebase). The manifest currently provides only "Add to Home Screen" cosmetic installability, no actual offline page caching.

**Recommended fix**: no urgency — genuinely offline-capable behavior (e.g., "keep previously-viewed lesson content available without a connection") would be a deliberate feature decision given the platform's content volume (2,000+ pages can't reasonably all be cached offline; a scoped subset — bookmarked/in-progress content — would be the realistic target). Not an action item now, just noting the manifest doesn't currently deliver what a manifest usually implies.

---

## What was checked and found solid (no finding needed)

- **Failure recovery for the auth-critical paths**: `error.tsx` boundaries on dashboard/admin/onboarding, defensive try/catch throughout `ensureUser.ts` and every function in `queries.ts` (each catches its own errors, returns safe empty values) — good, deliberate resilience patterns already in place for the highest-traffic authenticated surface, even though Stage 1 already correctly flagged their *coverage* as limited to 3 of 35+ routes.
- **`CLAUDE.md` itself** (distinct from `README.md`) is accurate and well-maintained for the specific architecture decisions it documents (Clerk/Supabase Third-Party Auth pattern, the `auth.jwt()->>'sub'` requirement, setup steps) — the env-var *list* within it is incomplete (Finding 5), but its actual content is correct and has clearly been kept current throughout this engagement, unlike `README.md`.

---

## Summary table

| # | Finding | Severity |
|---|---|---|
| 1 | README.md wrong on deployment (Vercel vs actual Cloudflare) and undercounts product ~4x | **Critical** |
| 2 | Zero test coverage, zero CI/CD — no automated verification before production | High |
| 3 | No error tracking/APM — already caused confirmed repeated debugging pain this engagement | High |
| 4 | Zero analytics — no usage visibility across 2,000+ pages | Medium |
| 5 | Documented env vars incomplete (4 of ~10 needed), no `.env.example` | Medium |
| 6 | No slug-rename safety mechanism — your question this turn, scoped as a Stage 6 item | Medium |
| 7 | No feature-flag system beyond one ad-hoc env var | Medium |
| 8 | No payments/entitlements (expected at this stage; scoping note for when it's built) | Medium |
| 9 | No content publishing workflow — every change needs a developer + redeploy | Medium |
| 10 | PWA manifest without a service worker — no real offline behavior | Low |

**Recommended order of attack**: 1 (Critical, cheap, prevents wasted future time) → 3 (High, already-proven pain point, directly improves on a pattern this engagement had to work around) → 2's CI-workflow half (High, cheap) → 5 (cheap, prevents future silent failures) → 6 (scoped Stage 6 item per your ask) → 4, 7, 9 (all genuine but not urgent) → 8, 10 (no action needed yet, just documented).
