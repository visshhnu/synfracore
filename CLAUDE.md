# SynfraCore — Project Context for Claude Code

## What this is
A unified learning platform: one account, one dashboard, multiple "academies"
(DevOps, Cloud/AI, Exam Prep, etc.) as modular content under the same core.
Full product blueprint, schema, wireframe, and pitch doc are in `/docs`.

## Stack
- Frontend: Next.js (App Router)
- Database: Supabase (Postgres only — NOT using Supabase's own Auth)
- Auth/Identity: Clerk — handles sign-in, sessions, user management
- Payments: Razorpay (India) + Stripe (global) — not yet integrated
- AI Assistant: Claude API

## Auth architecture — READ THIS FIRST
This project uses **Clerk for authentication** and **Supabase purely as the
database**, connected via Supabase's native Third-Party Auth integration
(NOT the deprecated JWT template method).

- Clerk issues the session token (JWT) after sign-in.
- Supabase trusts that JWT directly via the Third-Party Auth provider setup
  (Authentication → Sign In / Providers → Clerk, in the Supabase dashboard).
- The `users.id` column in Postgres stores Clerk's user ID (the JWT `sub`
  claim) as TEXT — it is NOT a Postgres-generated UUID.
- All Row-Level Security policies must check `auth.jwt()->>'sub'` against
  `user_id`, e.g.:
  ```sql
  create policy "user reads own progress"
    on progress for select
    using ( (select auth.jwt()->>'sub') = user_id );
  ```
  Do NOT use `auth.uid()` — that only applies to Supabase's own native auth,
  which this project does not use.

## Environment variables (set in `.env.local`, never commit this file)
Full list with descriptions lives in `.env.example` (safe to commit — names
only, no real values) — copy it to `.env.local` and fill in real values.
```
NEXT_PUBLIC_CLERK_PUBLISHABLE_KEY=
CLERK_SECRET_KEY=
NEXT_PUBLIC_SUPABASE_URL=
NEXT_PUBLIC_SUPABASE_ANON_KEY=
SUPABASE_SERVICE_ROLE_KEY=        # Clerk webhook sync + question-bank grading — server-only, never NEXT_PUBLIC_
CLERK_WEBHOOK_SIGNING_SECRET=     # Clerk webhook sync only
ANTHROPIC_API_KEY=                # /api/ai — server-only
AI_ASSISTANT_ENABLED=false        # /api/ai kill switch — "true" to enable, defaults closed
RESEND_API_KEY=                   # /api/digest, /api/subscribe — both degrade gracefully if unset
DIGEST_SECRET=                    # /api/digest shared secret
NEXT_PUBLIC_CF_BEACON_TOKEN=      # Cloudflare Web Analytics beacon token — app/layout.tsx, no-op if unset
```
Real values live only in `.env.local` and in the Cloudflare dashboard for
the `synfracore` Worker (or as `wrangler secret put <NAME>` for the
non-`NEXT_PUBLIC_` secrets) for production — never in this file, never in
a commit, never pasted into chat. (Updated 2026-07-19: production moved
from a Cloudflare Pages project to a Cloudflare Worker as part of the
D1/OpenNext migration — see the "Deploying to production" section below
and `docs/audit/07-roadmap-final.md` Part 4l for the full cutover record.)

## Deploying to production — MANDATORY pre-deploy checklist (no exceptions)
This exists because of a real incident (2026-07-13, see `docs/audit/06-roadmap.md`'s
7th symptom): the homepage went down in production for hours because a build was
run from a Windows-mounted WSL drive path, and because a `wrangler.toml` edit
introduced a duplicate secret binding that silently broke deploys until it was
finally diffed. Both were avoidable. Follow this exactly, every time, not just
when something feels risky — the incident that prompted this felt like a routine
analytics change right up until the site went down.

**Updated 2026-07-19: production now runs on `@opennextjs/cloudflare` (D1),
deployed as a Cloudflare Worker (`synfracore`), not `@cloudflare/next-on-pages`
on a Pages project.** The commands below reflect this; the original Pages-based
commands and `wrangler.toml` are kept in git history but are no longer what
production runs. See `docs/audit/07-roadmap-final.md` Part 4l for the full
migration/cutover record — this was a re-attempt of a migration first tried
2026-07-17 and reverted the same night for an unrelated content-loading bug
(fixed this time before re-attempting).

1. **Build only from a native WSL/Linux filesystem path — never `/mnt/d/synfracore`
   or any other Windows-mounted drive path.** Native filesystem builds are also
   ~2-4x faster (confirmed: ~50s vs ~120-200s), which is a useful tell if a build
   is unexpectedly slow — it may mean you're on the wrong filesystem. If working
   from `D:\synfracore` on Windows, sync to a native WSL path first: `rsync -a
   --delete --exclude='.next' --exclude='.open-next' --exclude='.git'
   --exclude='node_modules' /mnt/d/synfracore/ ~/synfracore-build/`, then run
   `npm run pages:build` (runs `opennextjs-cloudflare build` under the hood)
   and `wrangler deploy` from that native path, not from `/mnt/d`.
   - **`.env.local` MUST be copied fresh — `cp /mnt/d/synfracore/.env.local
     ~/synfracore-build/.env.local` — on every single build, no exceptions,
     even if you're confident nothing in it changed.** It's excluded from the
     rsync above (most `.gitignore`-style excludes catch it) and is NOT a
     one-time setup step — a real incident (2026-07-15) happened because a
     stale native-directory `.env.local` sat unsynced across several builds
     after a Clerk key rotation, silently baking the OLD dev-mode publishable
     key back into production and breaking sign-in/sign-out for hours,
     specifically *because* someone (an earlier build) had correctly synced it
     once and every later build assumed that was still good enough. It wasn't.
     `NEXT_PUBLIC_*` values are baked into the client bundle from whatever
     `.env.local` the build machine has at build time — completely
     independent of `wrangler.toml`'s `[vars]` or Cloudflare's dashboard
     secrets, which only affect server-side runtime reads, not the client
     bundle. After copying, verify with `grep CLERK_PUBLISHABLE_KEY
     ~/synfracore-build/.env.local` and confirm it matches
     `d:\synfracore\.env.local` before building.
   - If a deploy goes out with a wrong/stale env-derived value anyway (same
     failure mode as above), a stale `.next` build cache can also be the
     cause even with a correct `.env.local` — `rm -rf .next .vercel` in the
     native build directory before rebuilding to rule this out; confirmed
     this exact class of bug twice now (once for the 7th roadmap symptom's
     RSC-manifest paths, once for this Clerk key regression).
2. **Any `wrangler.jsonc` edit must be diffed and reviewed before deploying** —
   run `git diff -- wrangler.jsonc` and actually read it. Its `vars` block is
   easy to corrupt silently (a malformed line, or a value duplicated as both
   a plain var and a Dashboard Secret — this exact failure mode already
   happened once, on the old `wrangler.toml`) and `wrangler` doesn't always
   fail loudly on it.
3. **After every deploy, before considering it done, check all of the
   following — not just the one feature that was being worked on:**
   - Homepage (`/`) returns 200 with real content (not a blank/error page).
   - At least one nested content page (e.g. an `/academies/...` or
     `/learn/...` page) returns 200 with real content.
   - The question-bank Start flow works signed-in (`/question-bank/<paper>` →
     click Start → an attempt is actually created).
   - Sign-in and sign-out both complete successfully.
   - The Academies dropdown in the navbar actually expands (hover/click) —
     this is a real browser/JS check, not just an HTTP status check.
4. **A deploy is not verified until ALL of the above pass — not just the
   specific feature that was being changed.** The homepage incident above
   happened while working on an unrelated analytics feature; the homepage
   itself hadn't been touched, and would have been broken for hours longer
   if it hadn't been checked independently of the feature actually being
   shipped.

## Setup steps (do these once, in order)
1. Supabase: create a project if not already done → copy Project URL + anon key.
2. Clerk: in the Clerk Dashboard, go to the Supabase integration setup page
   and activate it → copy the Clerk domain it reveals.
3. Supabase: Authentication → Sign In / Providers → Add provider → Clerk →
   paste the Clerk domain from step 2.
4. Run `synfracore-schema.sql` (in `/docs`) against the Supabase database.
5. Add RLS policies per table using the `auth.jwt()->>'sub'` pattern above —
   do this for every table that has a `user_id` column.
6. Install packages: `@clerk/nextjs` and `@supabase/supabase-js`.
7. Wrap the app in `<ClerkProvider>` (root layout).
8. Create the Supabase client using Clerk's session token as the accessToken
   (native integration pattern — see Supabase's Clerk docs for the current
   `accessToken` callback syntax, since this API evolves).

## Content rules (enforced at the schema level — see synfracore-schema.sql)
Every "Overview" and "Fundamentals" lesson MUST have: a plain-English hook,
one analogy, one diagram, one annotated example, and one 2-minute "try it"
prompt before it can be considered beginner-ready (`is_beginner_ready` column).
Do not generate or accept lesson content that skips these fields.

## Challenges system
Challenges have a `tier` (micro | skill | build | hackathon | exam_sprint)
and `difficulty`. Always filter what's shown to a user by matching their
average completed-lesson difficulty — never surface an advanced challenge
to a beginner. Leaderboards must be filtered by tier, never global.

## Renaming a slug (academy/technology/section) — MANDATORY procedure
`academy_slug`/`technology_slug`/`section_slug` are stored as plain TEXT in
every user-data table (`lesson_progress`, `bookmarks`, `quiz_attempts`,
`recent_activity`) — not a foreign key to a stable ID. Renaming a slug in
`lib/data/academies.ts`/`lib/data/navigation.ts` without also fixing the
already-written rows **silently orphans that data** — a user's progress
under the old slug becomes permanently unreachable, since every query
filters by the new slug going forward. This already happened once
(`infrastructure` → `devops`, see the redirect in `next.config.ts`) and
happened to orphan zero rows — that was luck, not a safeguard.

Whenever a slug is renamed, do **all** of these, not just the code change:
1. Update the slug in code (`academies.ts`/`navigation.ts`/wherever it's defined).
2. Insert a row into `slug_aliases` recording the rename (see
   `docs/slug-aliases-schema.sql`):
   ```sql
   INSERT INTO slug_aliases (slug_type, old_slug, new_slug)
   VALUES ('academy', 'old-slug-here', 'new-slug-here');
   ```
3. Backfill every affected table so existing rows point at the new slug —
   this is the step that actually prevents data loss:
   ```sql
   UPDATE lesson_progress   SET academy_slug = 'new-slug-here' WHERE academy_slug = 'old-slug-here';
   UPDATE bookmarks         SET academy_slug = 'new-slug-here' WHERE academy_slug = 'old-slug-here';
   UPDATE quiz_attempts     SET academy_slug = 'new-slug-here' WHERE academy_slug = 'old-slug-here';
   UPDATE recent_activity   SET academy_slug = 'new-slug-here' WHERE academy_slug = 'old-slug-here';
   ```
   (Adjust column name to `technology_slug`/`section_slug` if that's what's being renamed.)
4. Add the URL-level redirect in `next.config.ts` (`redirects()`), as already
   done for the `infrastructure → devops` case — this fixes navigation for
   humans clicking old links, but does **not** substitute for step 3.

**If a slug is renamed a second time**, build a single CLI that updates
BOTH of the two places a rename is currently tracked in one step — don't
fix one without the other:
1. The `slug_aliases` DB table (this section, for database rows).
2. `scripts/generate-content-registry.mjs`'s `ALIAS_ROOTS` map (for content
   folder paths on disk — see the Phase 1.3/1.4 commit).

These exist separately today because only one rename has ever happened.
A second rename is a pattern worth automating — and worth unifying, since
right now nothing reminds a future maintainer that both need updating,
not just one.

`slug_aliases` is currently a record of renames only — no application code
consults it as a runtime fallback yet. If step 3 is ever skipped by
mistake, that table at least preserves *what* the old slug used to mean,
making manual recovery possible later even though it won't happen
automatically.

## Do not
- Do not use Supabase Auth alongside Clerk — pick one identity system (Clerk).
- Do not commit `.env.local` or any real key.
- Do not launch new academies beyond the 3 flagship ones until the auth +
  dashboard shell is stable (see phased plan in `/docs`).
- **Symptom 10/11 is RESOLVED as of 2026-07-19** — production now runs on
  `@opennextjs/cloudflare` (D1), which does not have the Server-Action-404
  mechanism that `@cloudflare/next-on-pages` had. The old restriction ("do
  not sign in/out from a `/question-bank` page") no longer applies; this was
  confirmed directly on production, not just in preview, including a
  same-domain full parity/regression audit. Full record:
  `docs/audit/07-roadmap-final.md` Part 4l. **Still open**: a 24-48h
  post-cutover monitoring window (started 2026-07-19T16:49:47Z) watching for
  the rare (~1-2% in preview-quiet conditions, unverified under real
  concurrent traffic) client-visible not-found-swap symptom and any
  recurrence of the Server-Action-404 pattern — check Part 4l/4k for current
  status before assuming this is fully closed if reading this soon after
  that date.
- **Symptom 13** (BCHHC/question-bank sign-in state not syncing client-side
  without a reload) is **mitigated, not root-caused** —
  `components/auth/AuthStateSync.tsx`, mounted in the root layout, forces a
  reload if `window.Clerk.session`/`user` are still empty a grace period
  after the sign-in modal's OTP step is seen, scoped to the modal only (not
  the standalone `/sign-in`/`/sign-up` pages). This was very likely the same
  underlying Symptom 10/11 mechanism the whole time (see Part 4j), so it may
  now be largely redundant with the D1 migration's fix — kept in place as a
  monitored safety net rather than removed, since removing it hasn't been
  separately verified safe. See `docs/audit/07-roadmap-final.md` Part 4i for
  the fix's own history and Part 4j/4l for the mechanism analysis.
