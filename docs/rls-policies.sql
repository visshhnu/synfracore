-- ============================================================
-- SynfraCore — Row-Level Security policies
-- Run AFTER synfracore-schema.sql, and after Clerk is wired up
-- as a Supabase Third-Party Auth provider (see CLAUDE.md step 3).
--
-- Every policy checks the Clerk JWT `sub` claim, never auth.uid()
-- (auth.uid() only applies to Supabase's own native auth, which
-- this project does not use).
-- ============================================================

-- ---------- users ----------
alter table users enable row level security;

create policy "user reads own record"
  on users for select
  using ( (select auth.jwt()->>'sub') = id );

create policy "user inserts own record"
  on users for insert
  with check ( (select auth.jwt()->>'sub') = id );

create policy "user updates own record"
  on users for update
  using ( (select auth.jwt()->>'sub') = id )
  with check ( (select auth.jwt()->>'sub') = id );

-- ---------- progress ----------
alter table progress enable row level security;

create policy "user reads own progress"
  on progress for select
  using ( (select auth.jwt()->>'sub') = user_id );

create policy "user inserts own progress"
  on progress for insert
  with check ( (select auth.jwt()->>'sub') = user_id );

create policy "user updates own progress"
  on progress for update
  using ( (select auth.jwt()->>'sub') = user_id )
  with check ( (select auth.jwt()->>'sub') = user_id );

-- ---------- certificates ----------
alter table certificates enable row level security;

create policy "user reads own certificates"
  on certificates for select
  using ( (select auth.jwt()->>'sub') = user_id );

-- ---------- xp_ledger ----------
alter table xp_ledger enable row level security;

create policy "user reads own xp"
  on xp_ledger for select
  using ( (select auth.jwt()->>'sub') = user_id );

-- ---------- streaks ----------
alter table streaks enable row level security;

create policy "user reads own streak"
  on streaks for select
  using ( (select auth.jwt()->>'sub') = user_id );

create policy "user updates own streak"
  on streaks for update
  using ( (select auth.jwt()->>'sub') = user_id )
  with check ( (select auth.jwt()->>'sub') = user_id );

-- ---------- challenge_submissions ----------
alter table challenge_submissions enable row level security;

create policy "user reads own submissions"
  on challenge_submissions for select
  using ( (select auth.jwt()->>'sub') = user_id );

create policy "user inserts own submission"
  on challenge_submissions for insert
  with check ( (select auth.jwt()->>'sub') = user_id );

-- ---------- user_badges ----------
alter table user_badges enable row level security;

create policy "user reads own badges"
  on user_badges for select
  using ( (select auth.jwt()->>'sub') = user_id );

-- ---------- subscriptions ----------
alter table subscriptions enable row level security;

create policy "user reads own subscriptions"
  on subscriptions for select
  using ( (select auth.jwt()->>'sub') = user_id );

-- ---------- Public read-only content tables ----------
-- academies, courses, modules, lessons, challenges, badges, plans have no
-- user_id column — they're catalog/content data. Enable RLS with an
-- open read policy so the anon key can list them, but leave writes to
-- the Supabase dashboard / service role (no app-layer authoring yet).
alter table academies enable row level security;
alter table courses enable row level security;
alter table modules enable row level security;
alter table lessons enable row level security;
alter table challenges enable row level security;
alter table badges enable row level security;
alter table plans enable row level security;

create policy "public reads academies" on academies for select using ( true );
create policy "public reads courses" on courses for select using ( true );
create policy "public reads modules" on modules for select using ( true );
create policy "public reads lessons" on lessons for select using ( true );
create policy "public reads challenges" on challenges for select using ( true );
create policy "public reads badges" on badges for select using ( true );
create policy "public reads plans" on plans for select using ( true );
