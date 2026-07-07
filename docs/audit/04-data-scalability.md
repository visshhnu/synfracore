# Stage 4 — Data & Scalability Audit

**Scope**: database schema design, query patterns, N+1 risks, indexing, pagination, caching layers, search architecture, content management workflow, readiness for millions of users and future i18n/multi-tenant/enterprise use. Schema decisions that will be painful to migrate later, with migration-safe alternatives proposed now.

**Method**: read every table definition across all 3 SQL files, cross-referenced every table name against actual query code in `lib/supabase/queries.ts`/`ensureUser.ts` (not assumed usage), read the search implementation, checked git-confirmed history of an actual slug rename already in production.

---

## Finding 1 — Two entirely disconnected database schemas exist; the original 15-table schema is 100% dead code
**Severity: Critical**

**Current implementation**: `docs/synfracore-schema.sql` defines 15 tables implementing a fully relational, database-driven course model: `academies` (DB table, separate from the `lib/data/academies.ts` catalog), `courses`, `modules`, `lessons` (with `content_body`, `hook_text`, `analogy_text`, `diagram_url` — the "5-part beginner-ready" content template described in the file's own header), `progress` (keyed by `lesson_id UUID`), `certificates`, `xp_ledger`, `streaks`, `challenges`, `challenge_submissions`, `badges`, `user_badges`, `plans`, `subscriptions`.

**Verified**: grepped every query in `lib/supabase/queries.ts` and `lib/supabase/ensureUser.ts` (the only two files that issue application-level Supabase queries) — **none of these 15 tables are referenced anywhere.** Not `lessons`, not `courses`, not `progress`, not `xp_ledger`, not `challenges`, nothing. The application's actual content model is what's been the subject of this whole engagement: static markdown files under `public/content/`, resolved via `lib/data/academies.ts` (a TypeScript catalog, not the `academies` DB table) and the content registry — a completely different architecture than what this schema implements.

**The actually-used schema** is entirely in `docs/learner-platform-schema.sql`: `user_domain_preferences`, `lesson_progress`, `bookmarks`, `quiz_questions`, `quiz_attempts`, `recent_activity` — all keyed by **TEXT slugs** (`academy_slug`, `technology_slug`, `section_slug`), matching the real static-content architecture, not UUID foreign keys into a `lessons` table that's never populated.

**Why this is Critical, not just untidy**: `docs/synfracore-schema.sql` reads as the platform's canonical, authoritative schema — it's the file CLAUDE.md's setup instructions reference, it has the most detailed comments, and it's the first schema file alphabetically. A future engineer (or a future instance of whoever maintains this) has every reason to trust it as ground truth and build against `lessons`/`courses`/`progress`, when doing so would connect to tables the live application never reads or writes. If this schema was ever actually executed against production (per `docs/rls-policies.sql`, which also RLS-protects all 15 of these dead tables), the live database is carrying 15 fully-configured, RLS-enabled, indexed tables that store nothing and do nothing — dead weight that actively misleads anyone reading the schema to understand the system.

**Business impact**: real risk of wasted future engineering effort building against the wrong schema, plus genuine confusion about "what is the real data model" for anyone onboarding onto this codebase.

**Recommended fix**: don't delete `synfracore-schema.sql` outright (it may still hold useful historical design thinking, e.g. the XP/challenges/certificates vision) — but clearly mark it **superseded/not in use** at the top of the file, and make `learner-platform-schema.sql` (plus `synfracore-schema.sql`'s `users` table, which *is* real and used) the documented canonical schema. If the original schema was ever run against production, drop the 14 unused tables (keep `users`) after confirming zero rows/zero references anywhere.

**Breaking or non-breaking**: non-breaking if done as documentation-first (mark superseded); the actual `DROP TABLE` step is only needed if these tables were ever provisioned in production, and should be done as its own careful, verified, reversible step (see migration strategy).

**Migration strategy**: (1) add a prominent header comment to `synfracore-schema.sql` stating it's superseded except for the `users` table; (2) query production for row counts on all 14 unused tables (`SELECT count(*) FROM lessons`, etc.) to confirm they're genuinely empty before considering any `DROP TABLE`; (3) only after confirming zero data and zero remaining references, drop them in a dedicated migration, not bundled with unrelated work.

**Rollback strategy**: if tables are dropped, restore from the schema file (they contain no data to lose, by the confirmation step above) — genuinely low-risk given they're confirmed unused first.

---

## Finding 2 — Admin user list: unbounded full-table scan + in-memory counting instead of database aggregation
**Severity: High**

**Current implementation**: `lib/supabase/queries.ts`'s `getAllUsersForAdmin()`:
```ts
const { data: users } = await supabase.from("users").select("*").order("created_at", { ascending: false });
// no .limit() — fetches every row in the table
const ids = users.map(u => u.id);
const [{ data: prefs }, { data: progress }, { data: quiz }] = await Promise.all([
  supabase.from("user_domain_preferences").select("user_id").in("user_id", ids),
  supabase.from("lesson_progress").select("user_id").in("user_id", ids),
  supabase.from("quiz_attempts").select("user_id").in("user_id", ids),
]);
const count = (rows, id) => (rows ?? []).filter(r => r.user_id === id).length; // JS-side counting
```

**Why it's a problem**: this fetches **every row from four tables** on every single admin page load, with no `LIMIT`, no pagination, no cursor — and then computes per-user counts by filtering arrays in JavaScript (`O(users × rows)` in the worst case for the `count()` helper, since it re-filters the *entire* `prefs`/`progress`/`quiz` array for every single user) instead of using SQL `GROUP BY`/`COUNT(*)`, which the database is built to do efficiently at any scale.

**Why it will not survive real growth**: with 100 users and a few hundred progress rows, this is invisible. With 10,000 users and their accumulated `lesson_progress`/`quiz_attempts` rows (easily hundreds of thousands of rows at that scale, given these are per-lesson-view and per-quiz-attempt event tables), this endpoint pulls potentially hundreds of thousands of rows into a single edge function invocation's memory, then runs an O(n×m) nested filter over them — this is a near-certain edge-runtime timeout or memory failure well before reaching "millions of users," likely well before reaching even tens of thousands.

**Business impact**: the admin dashboard — the one page an operator needs to work reliably — is the single most likely page to fail catastrophically as the platform grows, at exactly the moment (real user growth) when an admin most needs it to work.

**Technical impact**: this is a correctness-preserving-but-not-scaling pattern — it works today because the data is small, not because the approach is sound.

**Recommended fix**: replace the four separate fetches + JS counting with either (a) a Postgres view/function using `GROUP BY user_id, COUNT(*)` for each metric, joined once, or (b) at minimum add `.limit(50)` with real pagination (cursor on `created_at`) to the `users` query, and use `.select("user_id", { count: "exact", head: true })`-style aggregate queries (Supabase supports count-only queries that don't transfer row data) instead of fetching full rows just to count them.

**Breaking or non-breaking**: non-breaking — same function signature/return shape, internal query strategy only.

**Migration strategy**: start with adding pagination to the `users` query (cheapest, immediately reduces the primary risk) and switching the three count queries to Supabase's `{ count: "exact", head: true }` pattern per user (or a single grouped RPC function) as the complete fix.

**Rollback strategy**: revert the query changes; no schema changes required for the pagination-first step.

---

## Finding 3 — Content management requires manually touching up to 4 separate hand-maintained files for one new page, with no single source of truth
**Severity: High**

This finding ties together evidence from across this whole audit (Stage 1 Finding 2, Stage 3 Finding 3, now the search index below) into one coherent operational-scalability picture, specifically through the "content management workflow" lens.

**Verified list of files that must all be manually kept in sync for one new technology page to be fully live, discoverable, and searchable**:
1. `lib/data/academies.ts` — the technology must exist here to route at all.
2. `lib/content/index.ts` — the content registry, confirmed already drifted (6 broken entries, 236 orphaned files as of Stage 1).
3. `app/sitemap.ts` — now auto-generated from #1/#2 as of this session's fixes, no longer a manual step.
4. **`app/search/page.tsx`'s `searchIndex` array** — a fourth, entirely separate hardcoded array (confirmed: `const searchIndex: Result[] = [...]` with hand-written `title`/`url`/`category`/`tags` entries) that is the *only* way a page is findable through the site's own search feature. New technologies are not automatically searchable; a page must be manually added here too.

**Why it's a problem**: this is the fourth confirmed instance of the exact same "separately hand-maintained list, kept in sync only by a human remembering" pattern found repeatedly across this audit (content registry, the old sitemap, roadmap `steps[]`/`techLinks[]`, and now search). Adding one real, live technology page currently requires a human to remember and correctly update up to 3 remaining files (post-sitemap-fix) with zero tooling enforcing consistency between them, and zero automated check catching a missed one (unlike the roadmap linkage, which at least has `validate-roadmaps.ts`).

**Business impact**: content velocity is bottlenecked by how many of these files a content-adder remembers to touch — every one of the drift incidents already found and fixed this engagement (68 missing sitemap entries, 236 orphaned content files) is evidence this isn't a hypothetical risk, it's the demonstrated default outcome of this workflow.

**Recommended fix**: consistent with Stage 1/3's registry-generator recommendation — the search index should also be generated from `getAllTechnologies()` + the content registry (title = `{tech.name} — {section label}`, tags = `tech.tags`, category = academy title) rather than hand-typed. This closes the loop: one real source of truth (`academies.ts` + the content registry) driving routing, the registry, the sitemap, and search, instead of four independently-drifting lists.

**Breaking or non-breaking**: non-breaking — `Result[]` shape stays the same, only its source changes from hand-typed to generated.

**Migration strategy**: write a small function (co-located with or reusing the sitemap generator's logic) that produces `Result[]` entries from `getAllTechnologies()` × registered sections, run it, and confirm the existing hand-typed entries are a subset of the generated output before fully switching over.

**Rollback strategy**: revert to the static array; no data implications.

---

## Finding 4 — Search architecture: a small, hand-typed, permanently-incomplete subset standing in for full-text search across 2,000+ real pages
**Severity: Medium**

(Distinct from Finding 3's "how it's maintained" angle — this is about whether the *architecture itself* is the right one for the platform's actual scale.)

**Current implementation**: `app/search/page.tsx` holds a hardcoded `searchIndex: Result[]` array covering a hand-picked subset of pages, searched client-side (presumably substring/tag matching over this small array — no server-side full-text search, no relevance ranking beyond whatever client-side logic exists).

**Why it's a problem beyond the maintenance angle**: even if Finding 3's fix makes this array complete and auto-generated, a client-side array of 2,000+ full entries (title/url/category/tags for every section of every technology) sent to every visitor who opens `/search` is itself not the right architecture at that scale — it's a meaningfully sized JS payload for a feature that fundamentally needs server-side (or build-time-indexed) full-text search with relevance ranking, typo tolerance, and highlighting, none of which a hand-rolled client-side tag-match can provide well as the catalog grows toward "millions of users" searching across thousands of pages.

**Business impact**: search is a primary content-discovery path for a platform this content-heavy; a weak search experience (small coverage today, and even at full coverage, no real relevance ranking) directly undermines the platform's own stated value of "one platform, everything you need," if users can't reliably find what's already there.

**Recommended fix**: this is a genuine architecture decision, not a quick fix — options in increasing order of effort: (a) generate a proper build-time search index (e.g., via a static JSON built from all markdown frontmatter/headings, loaded lazily rather than bundled into the search page's JS), (b) adopt a dedicated search service (Algolia, Typesense, Meilisearch — all have generous free/self-hosted tiers appropriate for this content volume) for real full-text search with ranking. Given the "millions of users" framing in this stage's scope, (b) is the right target architecture; (a) is a reasonable, lower-effort intermediate step.

**Breaking or non-breaking**: non-breaking to ship incrementally — the search *page* and its UI don't need to change, only what powers results.

**Migration strategy**: ship Finding 3's "generate the array correctly" fix first (immediate, low-effort correctness win), then evaluate a dedicated search service as a separate, deliberate project once content volume/traffic justifies the operational overhead of running one.

**Rollback strategy**: not applicable at the "immediate fix" stage; a future search-service migration would run in parallel with the existing client-side search until cut over, so it's inherently reversible during rollout.

---

## Finding 5 — `roadmap_progress` table: defined, RLS-protected, indexed — and never queried by any application code
**Severity: Low**

**Verified**: `docs/learner-platform-schema.sql` defines `roadmap_progress` with a full RLS policy set (`learner-platform-schema.sql:172-178`) and an index (`idx_roadmap_progress_user`) — but a repo-wide search confirms **zero application code reads or writes this table**. It's a smaller-scale instance of Finding 1's pattern (schema built ahead of the feature that would use it — presumably intended for tracking progress through the 22 roadmaps this engagement spent so much time fixing routing for — but the feature was never wired up).

**Recommended fix**: either wire up roadmap-progress tracking (mark roadmap steps complete as a user finishes each linked academy page) as a real feature, or note it explicitly as "reserved for a planned feature" so it isn't mistaken for dead/erroneous schema during a future cleanup pass (avoid it being accidentally dropped alongside Finding 1's genuinely-dead tables).

**Breaking or non-breaking**: non-breaking either way (leaving as-is, or building the feature).

---

## Finding 6 — No multi-tenant/organization schema exists; retrofitting B2B seats later means touching every user-scoped RLS policy
**Severity: Medium (forward-looking — flagging now per your explicit ask about future B2B readiness)**

**Current state**: every table's RLS policy is a direct `user_id = (select auth.jwt()->>'sub')` check — there is no `organization_id`/`tenant_id` concept anywhere in either schema, and no `organizations`/`organization_members` table.

**Why this matters for future migration pain, specifically**: if a B2B/enterprise "seats" model is ever built (a company buys N seats, an admin manages members, content/reporting is scoped per-organization), every single existing RLS policy across both schema files (`users`, `lesson_progress`, `bookmarks`, `quiz_attempts`, `recent_activity`, `user_domain_preferences`, plus whatever's added later) would need to be individually rewritten to add an organization-scoped OR-branch (`user_id = ... OR (org_id = ... AND is_org_admin())`) — a wide-blast-radius change touching every user-data table at once, with real risk of a policy gap (a table someone forgets to update) during the transition.

**Recommended fix — do now, costs almost nothing while unused**: add an `organizations` table and an `organization_members` join table (`user_id`, `org_id`, `role`) today, even with zero product surface using them yet. This doesn't require touching any existing RLS policy right now — it's purely additive scaffolding. When B2B is actually built, the *existing* tables' policies can be extended one at a time as each is brought into scope, rather than a single big-bang migration across everything simultaneously, and new tables built for the B2B feature can reference `organization_members` from day one.

**Breaking or non-breaking**: non-breaking — purely additive tables, unused until a feature references them.

**Migration strategy**: add the two tables in the next schema migration alongside whatever else is being worked on; no urgency to use them, just to have the foreign-key target ready so future work doesn't start from zero.

**Rollback strategy**: drop the two unused tables; trivial, since nothing depends on them until deliberately wired up.

---

## Finding 7 — Current "i18n" is a client-side machine-translation widget, not stored/indexable multi-language content
**Severity: Medium (forward-looking — flagging now per your explicit ask about future i18n readiness)**

**Current implementation**: `components/layout/Navbar.tsx`'s `LanguageSwitcher` sets a `googtrans` cookie and reloads the page, invoking the Google Website Translator widget — a client-side, on-the-fly machine translation layer over the existing English DOM. No translated content is stored anywhere (no `locale` column on any table, no per-language content files), and no locale-aware routing exists (`/hi/academies/...` style paths, or equivalent).

**Why this matters for future migration pain**: if real i18n is ever wanted (translated content that's actually stored, versioned, and — critically for an SEO-driven platform — indexable by search engines per-language via `hreflang`), the current approach provides zero foundation for that. Google Translate's client-side widget output is not crawlable as distinct per-language pages, so it provides no SEO benefit in the languages it "supports" today, only an accessibility convenience for a visitor already on the page. A real i18n implementation later would be a from-scratch content-and-routing architecture change, not an extension of the current widget.

**Recommended fix**: no urgency to build real i18n now, but when it's prioritized, plan for locale-prefixed routing (Next.js App Router's built-in i18n routing, or `next-intl`) with actual translated content stored per-locale — the content registry pattern already being fixed for the English case (Stage 1 Finding 2, Stage 3 Finding 3) should be designed with an eventual `locale` dimension in mind (e.g., `{locale}/{academy}/{technology}/{section}` as the registry key shape) so adding real translations later extends the existing pattern rather than requiring a second, parallel content system.

**Breaking or non-breaking**: no change recommended now — this is a documented readiness gap for when i18n is actually prioritized, not an action item today.

---

## Finding 8 — Content is keyed by mutable TEXT slugs with no alias/rename-safety mechanism — a slug rename has already silently orphaned data once
**Severity: Medium**

**This already happened, not hypothetical**: `next.config.ts` contains a permanent redirect: `/academies/infrastructure/:path* → /academies/devops/:path*` — confirming the `infrastructure` academy slug was renamed to `devops` at some point in this project's history. Every user-data table (`lesson_progress`, `bookmarks`, `quiz_attempts`, `recent_activity`) stores `academy_slug` as plain TEXT with no foreign key to a stable, renameable-safe identifier.

**Why it's a problem**: any `lesson_progress`/`bookmarks`/`quiz_attempts` row that was written while the academy was still called `infrastructure` now has `academy_slug = 'infrastructure'` — a value the application never queries for anymore (every current query filters by `'devops'`). The URL-level redirect in `next.config.ts` fixes navigation for a human clicking an old link, but does nothing for the *data* — any pre-rename progress/bookmark/quiz-attempt rows are permanently orphaned, invisible to the user they belong to, with no migration ever performed to re-key them.

**Business impact**: silent, permanent user data loss (from the user's perspective — "my progress disappeared") on every future slug rename, unless someone remembers to also run a `UPDATE ... SET academy_slug = 'new' WHERE academy_slug = 'old'` across every affected table at the same time as the code-level rename — nothing currently prompts or enforces that.

**Recommended fix**: two complementary options, not mutually exclusive: (1) going forward, whenever a slug rename is made in `lib/data/academies.ts`/`lib/data/navigation.ts`, add a corresponding data migration (`UPDATE` statement across all slug-keyed tables) as a mandatory paired step — document this explicitly as a required part of any future rename; (2) for defense-in-depth, consider a small `slug_aliases` table (`old_slug`, `new_slug`, `slug_type`) that application queries could optionally consult as a fallback when a direct match isn't found, so historical data remains reachable even if the paired-migration step is ever missed.

**Breaking or non-breaking**: non-breaking — this is a process/tooling recommendation plus an optional additive table, not a change to existing data or queries.

**Migration strategy**: immediately, check whether the `infrastructure → devops` rename already orphaned any real user rows (`SELECT count(*) FROM lesson_progress WHERE academy_slug = 'infrastructure'` etc., across all slug-keyed tables) — if the count is non-zero, those specific users' data can still be recovered with a one-time `UPDATE` today, before more time passes.

**Rollback strategy**: not applicable — this is a data-integrity check and process fix, not a risky change.

---

## What was checked and found solid (no finding needed)

- **RLS/indexing on the tables that ARE actually used**: every real query in `queries.ts` has a supporting index (`idx_lesson_progress_user`, `idx_bookmarks_user`, `idx_quiz_attempts_user`/`_topic`, `idx_recent_activity_user`, `idx_domain_prefs_user`) — the *used* schema is well-indexed for its actual query patterns.
- **Dashboard query pattern**: `app/dashboard/page.tsx` fires its 5 independent per-user queries via `Promise.all` (parallel), not sequentially — a reasonable pattern, not an N+1 risk, even though it could theoretically be fewer round-trips via a combined Postgres function.
- **Defensive error handling in the data layer**: every function in `queries.ts` catches its own errors and returns a safe empty value rather than throwing — good resilience pattern, consistent with the error-boundary hardening done earlier this engagement.

---

## Summary table

| # | Finding | Severity |
|---|---|---|
| 1 | Two disconnected schemas — original 15-table schema 100% dead/unused, risks misleading future work | **Critical** |
| 2 | Admin user list: unbounded scan + in-memory counting, won't survive real growth | High |
| 3 | Content workflow requires manually syncing up to 4 files; 4th confirmed drift instance (search index) | High |
| 4 | Search architecture: hand-typed subset, no real full-text/relevance ranking at scale | Medium |
| 6 | No multi-tenant/org schema — B2B retrofit would touch every existing RLS policy at once | Medium (forward-looking) |
| 7 | "i18n" is a client-side translation widget, no stored/indexable multi-language content | Medium (forward-looking) |
| 8 | Slug-keyed content with no rename-safety — already silently orphaned data once (`infrastructure→devops`) | Medium |
| 5 | `roadmap_progress` table built, never wired to a feature | Low |

**Recommended order of attack**: 8's data-recovery check (immediate, cheap, possibly recovers real user data today) → 2 (High, real growth risk) → 1 (Critical but not urgent-today since the dead tables aren't actively harmful, just misleading — schedule deliberately) → 3/4 together (same generator-pattern fix as Stage 1/3) → 6 and 7 (no action needed now, just keep in mind for whenever those features are actually prioritized) → 5 (whenever roadmap-progress tracking is prioritized as a feature, or explicitly documented as reserved).
