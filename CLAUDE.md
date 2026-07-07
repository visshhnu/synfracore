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
SUPABASE_SERVICE_ROLE_KEY=        # Clerk webhook sync only — server-only, never NEXT_PUBLIC_
CLERK_WEBHOOK_SIGNING_SECRET=     # Clerk webhook sync only
ANTHROPIC_API_KEY=                # /api/ai — server-only
AI_ASSISTANT_ENABLED=false        # /api/ai kill switch — "true" to enable, defaults closed
RESEND_API_KEY=                   # /api/digest, /api/subscribe — both degrade gracefully if unset
DIGEST_SECRET=                    # /api/digest shared secret
```
Real values live only in `.env.local` and in the Cloudflare Pages dashboard
(or as `wrangler pages secret put <NAME>` for the non-`NEXT_PUBLIC_` secrets)
for production — never in this file, never in a commit, never pasted into chat.

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
