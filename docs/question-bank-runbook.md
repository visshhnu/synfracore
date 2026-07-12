# Question Bank — Apply & Verify Runbook

Reference steps for applying `docs/question-bank-schema.sql` and the
`docs/bchhc_seed_papers_*.sql` seed files to Supabase, and for verifying
the answer-security model actually holds at the database layer (not just
trusting that the RLS policy exists). Not README material — operational
reference only.

## 1. Apply the schema + seed data via service-role connection

Use the **direct Postgres connection string** (not the pooler, and never
the anon/publishable key) — found in Supabase Dashboard → Project Settings
→ Database → Connection string → URI. This connects as the `postgres`
role, which has `BYPASSRLS`, satisfying the schema's stated requirement
that only a service-role connection can write `question_answers`.

```bash
# Never commit this — export it in your shell only
export SUPABASE_DB_URL="postgresql://postgres:[PASSWORD]@[HOST]:5432/postgres"

# Apply in order, stop on first error
psql "$SUPABASE_DB_URL" -v ON_ERROR_STOP=1 -f docs/question-bank-schema.sql
psql "$SUPABASE_DB_URL" -v ON_ERROR_STOP=1 -f docs/bchhc_seed_papers_1_6.sql
psql "$SUPABASE_DB_URL" -v ON_ERROR_STOP=1 -f docs/bchhc_seed_papers_7_10.sql
```

(Equivalent alternative: paste each file into the Supabase Dashboard's SQL
Editor and run — that also executes as the postgres/service role.)

Sanity check row counts landed:

```bash
psql "$SUPABASE_DB_URL" -c "SELECT slug, question_count FROM question_papers ORDER BY sort_order;"
psql "$SUPABASE_DB_URL" -c "SELECT count(*) FROM questions;"          -- expect 1000
psql "$SUPABASE_DB_URL" -c "SELECT count(*) FROM question_options;"   -- expect 4000
psql "$SUPABASE_DB_URL" -c "SELECT count(*) FROM question_answers;"   -- expect 1000
```

## 1a. Verify `service_role` actually has table-level access (don't skip this)

This bit for real (2026-07-13): `service_role` had `REFERENCES`/`TRIGGER`/
`TRUNCATE` on every question-bank table but not `SELECT`/`INSERT`/`UPDATE`/
`DELETE`, so every grading Server Action failed with "permission denied for
table X" despite RLS being configured correctly. `schema.sql` now includes
an explicit `GRANT` block specifically to prevent this on a fresh apply, but
confirm it actually landed:

```sql
SELECT grantee, table_name, privilege_type
FROM information_schema.role_table_grants
WHERE table_schema = 'public'
  AND grantee = 'service_role'
  AND table_name IN ('question_papers', 'questions', 'question_options', 'question_answers', 'paper_attempts', 'attempt_responses')
ORDER BY table_name, privilege_type;
```

Every one of the 6 tables should show `SELECT`, `INSERT`, `UPDATE`, and
`DELETE` for `service_role`. If any are missing, re-run just the `GRANT`
block from `schema.sql` (it's idempotent, safe to run alone) — table-level
GRANTs are a prerequisite Postgres evaluates *before* RLS policies, so a
perfectly correct RLS policy still fails outright without this.

## 2. Verify `question_answers` is actually unreadable as anon/authenticated

Don't just trust the policy exists — hit the real PostgREST API with the
**anon (publishable) key**, the same one shipped to the browser:

```bash
export SUPABASE_URL="https://[project-ref].supabase.co"
export SUPABASE_ANON_KEY="[the NEXT_PUBLIC_SUPABASE_ANON_KEY value]"

curl -i "$SUPABASE_URL/rest/v1/question_answers?select=*" \
  -H "apikey: $SUPABASE_ANON_KEY" \
  -H "Authorization: Bearer $SUPABASE_ANON_KEY"
```

The schema file has no explicit `GRANT`/`REVOKE` statements for `anon`/
`authenticated` (only for `service_role`, added after the incident noted in
§1a — that one was necessary because service_role's queries must actually
succeed, whereas anon/authenticated are supposed to get nothing back from
this specific table either way), so which of two outcomes you'll see for
this check isn't knowable from static inspection alone — both are "secure,"
but they mean different things, so note which one you actually get:

- **`200 OK` with `[]`** — table-level SELECT is granted (Supabase's
  default for `public` schema tables), but RLS silently filters every row
  since zero policies exist. No data leaks, but the table is technically
  queryable.
- **`401`/`403` with a `permission denied for table question_answers`-style
  error** — SELECT was never granted to `anon` at all, so it fails before
  RLS even evaluates.

Either is fine from a security standpoint (zero rows exposed either way),
but for a real logged-in user's perspective too (`authenticated` role, not
`anon`), grab a live Clerk session JWT from the browser's dev tools while
signed into the app (Application → Cookies/local storage → the Clerk
session token, or via `window.Clerk.session.getToken()` in the console)
and repeat with that as the Bearer token instead of the anon key. Since
Supabase trusts Clerk's JWT directly (per this project's Third-Party Auth
setup), that request is evaluated as `authenticated`, and should show the
same zero-row/denied result — `question_answers` has no policy for either
role.

## 3. Verify `questions` / `question_options` ARE readable (the public half should work)

```bash
curl -i "$SUPABASE_URL/rest/v1/questions?select=*&limit=3" \
  -H "apikey: $SUPABASE_ANON_KEY" \
  -H "Authorization: Bearer $SUPABASE_ANON_KEY"

curl -i "$SUPABASE_URL/rest/v1/question_options?select=*&limit=3" \
  -H "apikey: $SUPABASE_ANON_KEY" \
  -H "Authorization: Bearer $SUPABASE_ANON_KEY"

curl -i "$SUPABASE_URL/rest/v1/question_papers?select=slug,title,is_premium&limit=5" \
  -H "apikey: $SUPABASE_ANON_KEY" \
  -H "Authorization: Bearer $SUPABASE_ANON_KEY"
```

Expect `200 OK` with real rows on all three — question text, option text,
and paper catalog metadata, but critically **no `correct_option_id` or
`explanation` anywhere in these responses**, since that data physically
doesn't exist outside `question_answers`.
