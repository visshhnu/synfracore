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
```
NEXT_PUBLIC_CLERK_PUBLISHABLE_KEY=
CLERK_SECRET_KEY=
NEXT_PUBLIC_SUPABASE_URL=
NEXT_PUBLIC_SUPABASE_ANON_KEY=
```
Real values live only in `.env.local` and in the Vercel/host dashboard for
production — never in this file, never in a commit, never pasted into chat.

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

## Do not
- Do not use Supabase Auth alongside Clerk — pick one identity system (Clerk).
- Do not commit `.env.local` or any real key.
- Do not launch new academies beyond the 3 flagship ones until the auth +
  dashboard shell is stable (see phased plan in `/docs`).
