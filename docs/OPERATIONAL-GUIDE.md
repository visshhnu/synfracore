# SynfraCore — Operational Guide

This is the practical reference: how the platform is built, how to deploy it
safely, how to author premium exam content without corrupting data, and
where to look for more detail. It's meant to be picked up cold — by a future
session, a new collaborator, or anyone explaining the system to someone
else.

For the detailed engineering history (audits, incidents, rollout logs), see
`docs/audit/` — this document is the short, current version of "how things
actually work," not a replacement for that history.

---

## 1. Architecture Overview

**What this is**: a single-account, multi-"academy" learning platform
(DevOps, Cloud, Healthcare Coding, Exam Prep, and ~20 more), covering both
technology and non-technology (competitive exams, healthcare, life
essentials) content under one product.

**The actual current stack** — this matters because some older docs
describe a stack that hasn't been true since mid-2026:

| Layer | Technology | Notes |
|---|---|---|
| Frontend | Next.js (App Router) | TypeScript throughout |
| Hosting/Deploy | **Cloudflare Workers**, via `@opennextjs/cloudflare` | **Not** `@cloudflare/next-on-pages`, **not** a Cloudflare Pages project. Migrated 2026-07-19 — see `docs/audit/07-roadmap-final.md` Part 4l for the full cutover record. |
| Database-adjacent edge storage | D1 | Used by the OpenNext adapter, not the primary app database |
| Primary database | **Supabase (Postgres only)** | Supabase's own Auth is **not** used — see below |
| Auth | **Clerk** | Issues the session JWT; Supabase trusts it via native Third-Party Auth (not the deprecated JWT-template method) |
| Payments | Razorpay (India) + Stripe (global) | Not yet integrated |
| AI | Anthropic Claude API | Gated behind `AI_ASSISTANT_ENABLED`, off by default |

**Auth model, precisely**: Clerk issues the JWT. Supabase trusts it
directly (Authentication → Sign In / Providers → Clerk in the Supabase
dashboard). The `users.id` column is Clerk's user ID as **TEXT**, not a
Postgres UUID. Every RLS policy checks `auth.jwt()->>'sub'` — never
`auth.uid()`, which only works with Supabase's own native auth.

**If you find a doc that describes Cloudflare Pages, `wrangler.toml`, or
`wrangler pages deploy`**: it's stale. The real config file is
`wrangler.jsonc`, and the real deploy command is `wrangler deploy` (see
Section 2). `README.md` and `CLAUDE.md` are the two files that should
always reflect the current stack — if either drifts, fix it there, not just
here.

**Content storage**: markdown files under `public/content/{academy}/
{technology}/{section}.md`, indexed by a generated registry
(`lib/content/index.ts`, built by `scripts/generate-content-registry.mjs`
— see Section 3's registry-regen rule). Two parallel content systems exist
for exam-prep material: `/academies/{academy}/{technology}/{section}` (the
main academy system) and `/learn/{board}/{subject}/{chapter}` (a
chapter-wise system for board/competitive exams, backed by
`lib/data/education.ts`) — the same subject can legitimately have content
in both, they're not duplicates of each other.

---

## 2. Deploy Process

This is the exact mandatory checklist used throughout this engagement. It
exists because of two real production incidents — a homepage outage from
building on a Windows-mounted drive, and a Clerk key regression from a
stale `.env.local`. Follow every step, every time, even when the change
feels trivial.

### Pre-deploy

1. **Sync to a native filesystem path.** Never build from a Windows-mounted
   drive (`/mnt/d/...` in WSL). Native builds are also 2-4x faster — if a
   build is unexpectedly slow, that's a sign you're on the wrong filesystem.
   ```bash
   rsync -a --delete --exclude='.next' --exclude='.open-next' \
     --exclude='node_modules' /mnt/d/synfracore/ ~/synfracore-build/
   ```
   Do **not** exclude `.git` — the build reads real commit history to
   compute per-file "last updated" dates.

2. **Copy `.env.local` fresh, every single time**, even if you're sure
   nothing changed:
   ```bash
   cp /mnt/d/synfracore/.env.local ~/synfracore-build/.env.local
   grep NEXT_PUBLIC_CLERK_PUBLISHABLE_KEY ~/synfracore-build/.env.local
   grep NEXT_PUBLIC_CLERK_PUBLISHABLE_KEY /mnt/d/synfracore/.env.local
   ```
   Confirm both greps match. `NEXT_PUBLIC_*` values are baked into the
   client bundle at build time from whatever `.env.local` the build machine
   has — completely independent of Cloudflare's dashboard secrets, which
   only affect server-side runtime reads.

3. **Diff `wrangler.jsonc` before deploying if it changed**:
   ```bash
   cd ~/synfracore-build && git diff -- wrangler.jsonc
   ```
   Actually read the diff. Its `vars` block is easy to corrupt silently.

4. **Clear caches and build**:
   ```bash
   rm -rf .next .open-next .vercel
   npm run pages:build
   ```
   This runs the content-registry generator, labs-existence check,
   content-dates generator, and `opennextjs-cloudflare build` in sequence.

### Deploy

5. ```bash
   npx wrangler deploy
   ```
   Confirm the asset-upload list in the output matches what you expect to
   have changed — an unexpected file in that list is worth investigating
   before trusting the deploy.

### Post-deploy verification — not optional, not partial

A deploy is not done until **all** of these pass, not just the specific
feature you changed (a real incident happened once specifically because
only the changed feature was checked):

- [ ] Homepage (`/`) returns 200 with real content
- [ ] At least one nested content page returns 200 with real content
- [ ] The question-bank Start flow works signed-in (or, for changes that
      don't touch auth/question-bank code, a documented reason why this
      check doesn't apply — don't just skip it silently)
- [ ] Sign-in and sign-out both complete
- [ ] The Academies dropdown actually expands — a real browser check via
      Playwright (`page.getByRole("button", {name: /academies/i})`,
      click, confirm content appears), not just an HTTP status check

Use a quick Playwright script for the browser-dependent checks — launch
headless Chromium, hit the real production URL, check what a user would
see. Delete the script afterward; these are one-off verification tools,
not permanent test suites.

---

## 3. Content-Authoring Pipeline for Premium Exam Papers

This is the proven, repeatable process for building a full mock exam paper
(SSC, Banking, JEE, NEET, HAL, CPT, CCS-style). Follow it in order — every
step exists because skipping it once caused a real bug earlier in this
engagement.

### Step 1 — Research the real exam pattern first

Before writing a single question, confirm the actual current official
structure: section count, question count per section, marks, negative
marking, time limit. Use live web search against official or
authoritative sources (the exam body's own site, or well-established prep
platforms citing it) — never assume a pattern from memory or invent one.
Tag anything you're not fully certain of as `(needs verification)` rather
than stating it as settled fact (see Section 4's evergreen-content rule).

### Step 2 — Author questions in a data file, not raw SQL

Write a `<key>-data.mjs` file (pattern: `docs/{exam}-build/{key}-data.mjs`)
exporting `PAPER` (metadata: slug, title, exam_type, question count, time
limit, marking scheme) and `SECTIONS` (an array of `{name, subject,
sourceNote, questions}`, where each question is `{topic, stem, options,
correct, explanation}` for MCQ, or `{topic, stem, answerType: "numeric",
numericAnswer, explanation}` for numeric-entry).

### Step 3 — Generate SQL with placeholder UUIDs

```bash
node docs/{exam}-build/gen.mjs {key}
```
This produces `docs/{key}_seed.sql` with `{{TOKEN}}` placeholders instead
of real UUIDs, and runs several checks automatically: within-file
duplicate-stem detection, a distractor-language sanity scan (flags phrases
like "cannot"/"never"/"impossible" landing on the *correct* answer, since
that's a common authoring mistake), and quote-balance checking. **Read its
output before continuing** — don't just check the exit code.

### Step 4 — Fill real UUIDs

```bash
node scripts/fill-seed-uuids.mjs docs/{key}_seed.sql
```
Every `{{TOKEN}}` gets a fresh, real UUID, consistently substituted
everywhere it appears in the file.

### Step 5 — Cross-file collision check

```bash
node docs/{exam}-build/collision_check.mjs {key}
```
Checks the new file's UUIDs against **every UUID already live in
production** (`question_papers`, `questions`, `question_options`) — not
just other files in the same batch. This exists because of a real incident
where two papers independently reused option UUIDs; a within-file-only
check would never have caught it.

### Step 6 — Stem-registry dedup check

```bash
node docs/{exam}-build/check-stems.mjs {key}
```
Checks question text against a persistent registry of every stem ever
written for that exam family, catching near-duplicate questions across
papers written in different sessions.

### Step 7 — Apply to production

```bash
node docs/{exam}-build/seed.mjs {key}
```
Applies the SQL directly via the Supabase service-role client, in
foreign-key-safe order. Confirm the row counts in its output match what
you expect (papers/questions/options/answers) before moving on.

### Step 8 — Register the exam type

If this is a new `exam_type`, add it to `examTypeGroupMap` in
`lib/data/navigation.ts` so the paper groups correctly on the
`/question-bank` catalog page.

### Step 9 — Verify live, same as any deploy

Fetch the new paper's page directly (expect 200), confirm the catalog
shows the new group, and confirm the Start button is present and
(for an unauthenticated check) correctly redirects to sign-in.

**A note on `quiz_questions` (the simpler, in-lesson quiz system)**: this
is a different, simpler table (auto-generated UUIDs via Supabase insert, no
`question_papers`/`question_options` join) — Steps 3-4's UUID-placeholder
machinery doesn't apply. The equivalent integrity check there is a direct
stem-duplicate check against the live DB for that specific technology,
which is small enough to write as a one-off script per batch.

---

## 4. Standing Content Policies

**The evergreen-content rule** (from `CLAUDE.md`'s content-volatility
tiering): content is either *Stable Core* (CS fundamentals, math, core
language syntax — audit only if an error is flagged) or *Volatile Core*
(cloud APIs, medical coding guidelines, exam formats, certification
pricing, health/financial figures). Volatile Core content must carry a
`(needs verification — recheck against current source)` tag rather than
being stated as settled fact. This isn't optional politeness — it's the
line between "the site is honest about what might have changed" and "the
site silently goes stale." When in doubt about whether something counts as
volatile, err toward tagging it.

**The BCHHC exam-bank permanent exclusion**: never read, edit, or query the
BCHHC (Board Certified Home Health Coder) mock-exam question bank — the 10
mock exam papers, or their backing `question_papers`/`paper_attempts` data.
This is a standing, permanent exclusion, not scoped to whichever batch
first raised it. It extends to **new** `quiz_questions` content too — both
`healthcare/bchhc-prep` and `healthcare/mock-exams` are off-limits for any
new quiz-question authoring, even though `quiz_questions` isn't the
exam-bank table system. The markdown content tabs for `bchhc-prep` (its
overview/fundamentals/certification/advanced pages) remain normal, in-scope
work — only the actual exam questions and their DB-backed data are
off-limits. **Linking to** `bchhc-prep`'s existing pages (e.g. from a
roadmap) is fine; touching its backing data is not.

**The exam-prep lighter-grounding rubric variant**: the standard
depth-rubric (Tier 0 = ground "why does this exist" with a real-world
analogy, assume zero prior background, define every term inline) applies
to most academies — but the exam-prep cluster (`exams`, `central-exams`,
`state-psc`, `professional-certs`) uses a **lighter** variant. A learner
searching for exam-prep content has already decided to take that exam —
don't spend space re-explaining why the exam exists. Technical terms
specific to the subject matter still need definitions (same zero-jargon
discipline), but the "why does this exist" framing isn't required.
Visual components (`FlowDiagram`, `ConceptBoxGrid` for exam-stage
timelines and syllabus breakdowns) are still fully in scope either way.

**Sourcing discipline**: exam patterns, marking schemes, brand/trademark
terms, and any other externally-verifiable fact are researched from real,
official, or clearly authoritative sources (the exam body's own site,
a vendor's own documentation/brand pages) — never assumed from memory,
never scraped from a competing platform's content. When a specific figure
or claim can't be confirmed against a real source, it gets the
`(needs verification)` tag rather than being stated as fact. This applies
equally to exam patterns (Section 3) and to anything trademark-sensitive
(e.g. verifying AWS's and Microsoft's actual published icon-usage terms
directly, rather than assuming what's probably allowed).

**Content-registry regen gate**: whenever a change touches
`lib/content/index.ts`, regenerate it with the real generator —
```bash
npm run generate:content-registry
```
— run from a native filesystem path (same requirement as the deploy
checklist), then diff the result against whatever was there before. Never
hand-patch this file directly; it's generated, and a manual edit can drift
from what the generator would actually produce in ways that are easy to
miss in review.

**Slug renames**: renaming a technology/academy/section slug requires four
things, not just the code change — see `CLAUDE.md`'s "Renaming a slug"
section for the full procedure (insert a `slug_aliases` row, backfill every
user-data table referencing the old slug, add a `next.config.ts` redirect).
Skipping the backfill step silently orphans real user data.

---

## 5. Where to Find Things

`docs/audit/` holds the detailed engineering history — numbered
roughly chronologically, each covering a distinct phase or topic:

| File | Covers |
|---|---|
| `01-architecture.md` | Original architecture/code-organization audit (folder structure, component design, technical debt) |
| `02-security.md` | Auth/security audit (Clerk+Supabase RLS design, API routes, secrets handling, dependency risk) |
| `03-performance-seo-a11y.md` | Rendering strategy, caching, Core Web Vitals, SEO metadata, accessibility |
| `04-data-scalability.md` | DB schema design, query patterns, scalability readiness |
| `05-operations.md` | Logging, monitoring, CI/CD readiness, testing coverage |
| `06-roadmap.md` | **Deprecated** — superseded by `07-roadmap-final.md`, kept for historical detail only |
| `07-roadmap-final.md` | The big one — consolidated roadmap, incident history (including the deploy-checklist-originating incidents), the OpenNext/D1 migration record, comprehension-audit methodology |
| `08-databases-comprehension-audit.md` | Databases academy content-comprehension pass |
| `09-contentscope-classification.md` | 63-technology content classification/tiering pass |
| `10-devops-retroactive-comprehension-audit.md` | DevOps academy retroactive content audit |
| `10-phase3-visual-depth-rollout.md` | The depth-rubric + visual-component rollout across academies (defines the standard and exam-prep rubric variants referenced in Section 4) |
| `11-healthcare-retroactive-comprehension-audit.md` | Healthcare academy retroactive content audit |
| `12-practice-exam-coverage-rollout.md` | Practice-exam-paper coverage tracker (future-initiative sizing) |
| `13-brand-logo-rollout.md` | Real brand-logo icon rollout — simple-icons (55 entries) and the official AWS/Azure Architecture Icons (14 entries) |
| `14-roadmap-tree-redesign.md` | Roadmap branching-UI redesign — pilot, full audit of all 27 roadmaps, and the shipped forks/track-groups |
| `15-backlog-prioritization.md` | Value-per-effort ranking of a specific backlog sweep, including several premises that turned out stale on direct verification |

Two other docs live at `docs/` top level:
- `PROJECT_SUMMARY.md` — a higher-level product summary
- `question-bank-runbook.md` — operational notes specific to the
  question-bank/exam-paper system

**When picking up a task**: check this guide first for the general
process, then the specific `docs/audit/` file for detailed history if you
need it. Don't assume an old audit doc's "still open" claims are current —
several turned out to be already resolved (see `15-backlog-prioritization.md`
for examples) simply because the doc wasn't updated after the work
happened. Verify against the live site/current code before trusting a
tracker's claim, especially an older one.

---

## 6. Current Known-Open Items (as of 2026-09-04)

This section is a snapshot, not a permanent record — update it as items
get resolved or as new ones surface, rather than letting it go stale the
way some older tracker docs did.

**Real technical bugs — re-verified 2026-09-04, all confirmed resolved
or stale, not open:**
- Sign-in redirect race (Symptom 8) and nested dynamic-route 404 on
  question-bank attempt pages (Symptom 9) — same root mechanism
  (Clerk's `invalidateCacheAction` Server Action 404ing under
  `next-on-pages`), confirmed RESOLVED by the 2026-07-19 D1/OpenNext
  cutover, verified live on production (`07-roadmap-final.md`'s
  consolidated Symptom 8-13 summary). The "still open" line elsewhere in
  that doc is from its archived pre-migration incident list (Part 9),
  superseded by the fix.
- The hydrate-then-404 mechanism — never reproduced since 2026-07-17
  (74+ attempts); diagnostic instrumentation (`app/not-found.tsx` +
  `NotFoundDiagnosticsBeacon`) confirmed still live. Treat as
  closed/monitored, not open.
- A pre-existing React hydration warning (`#418` in production, tied to
  Navbar's inline `<style>` tag) — confirmed cosmetic/dev-console-only
  across multiple unrelated pages this session, never blocking, but never
  formally root-caused either. Still genuinely open (not covered by the
  2026-09-04 re-verification above).

**Content work, sized and ready for a dedicated session:**
- **Healthcare batch — CLOSED 2026-09-04, re-verified against commit
  history and live files, not still open:** `medical-coding/
  intermediate.md` contamination deleted (`3860ed9`); Batches 3-4
  (Coding Guidelines, Mock Exams, Home Health Coding, Patient
  Documentation, BCHHC Prep, Healthcare Admin) were in fact completed,
  not still pending; BCHHC Prep's pre-2022 OASIS content (ROC-timing,
  OT-cannot-complete-OASIS) both corrected and sitewide-swept (`ae0bf36`,
  `a09a0db`). See `docs/audit/11-healthcare-retroactive-comprehension-
  audit.md`'s final tally.
- **New, small (found during the above close-out):**
  `coding-guidelines/projects.md` still carries leftover DevOps-flavored
  contamination boilerplate ("Cloud and infrastructure tools evolve
  rapidly...") — same signature already cleaned from 4 sibling
  `interview.md` files, just missed in that pass. Small, single-file fix.
- **SSC/Banking premium papers**: two flagship papers shipped (SSC CGL
  Tier 1, IBPS PO Prelims) — matching NEET/JEE's scale (5 papers each)
  would need a similarly-sized future batch
- **`upsc-ias` roadmap fork**: genuinely large — 48 real optional subjects
  exist, even an MVP of the 5-8 most popular ones means authoring
  full multi-tab content per subject

**Built and deployed 2026-09-04 (no longer open):**
- `state-psc-officer`'s first step forks into all 5 state technologies
  (TNPSC/KPSC/MPSC/APPSC/TSPSC), no `recommendedSlug` (no technically-
  better default among them)
- `telecom-engineer`'s exam-path step forks into GATE ECE (recommended,
  per the roadmap's own existing `timelineNote`) vs. BSNL JTO Prep
- `banking-finance-analyst`'s credentialing step forks into CA/CS/CMA
  Foundation vs. the already-existing, already-complete
  `exams/banking-exams` technology (no new content needed — the original
  "needs one new technology authored" estimate was wrong, scope was
  smaller than assumed)

**Sentry re-activation (D3)**: not blocked anymore — the old blocker was
`next-on-pages`-specific; Sentry has documented Next.js-on-Cloudflare
support via `@opennextjs/cloudflare`, and `wrangler.jsonc` already has
the one required prerequisite (`nodejs_compat`). Deliberately held, not
installed yet — do a canary deploy and a bundle-size check (Cloudflare's
3MB gzip free-tier limit) in its own dedicated session, not bundled into
unrelated work.

**Housekeeping, low priority:**
- CLAUDE.md/`06-roadmap.md`/`07-roadmap-final.md` reconciliation — several
  items they list as open (the OpenNext migration, a peer-dependency
  finding tied to the old Pages-based stack) are actually resolved and
  just need the docs marked closed
- The 24-48h post-cutover monitoring window noted in CLAUDE.md
  (started 2026-07-19) is long past due for formal closure
- Retroactive four-source/promotion-gap spot-checks against
  DevOps/Cloud/Databases content (logged as low-priority in their own
  source docs)
- The unused `contentScope: "guide"` schema field — a real but small
  design loose end
- An orphaned `security/banking-exams` content folder looks like the same
  duplicate-academy-placement pattern already found and deleted at
  `security/home-health-coding` — flagged 2026-09-04, not investigated or
  touched yet
