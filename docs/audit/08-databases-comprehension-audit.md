# Databases Academy — Comprehension Audit (Phase 9)

Same method as the DevOps (18-technology) and Cloud (26-technology) comprehension
audits in `07-roadmap-final.md`. Persona: Senior Content Auditor & Technical QA
Lead (cross-cutting) for orchestration; Senior CS/Database Faculty persona for
the actual per-technology reads.

Three lessons carried forward from the Cloud retrospective, applied from batch 1
onward:

1. Before writing any prerequisite note, grep the file for the concept it
   claims to assume — don't assert without checking.
2. Verify audit-trail entries independently, including your own — don't trust
   a prior finding at face value.
3. When rewording template-shared interview questions, confirm they're
   genuinely differentiated per technology, not the same question with names
   swapped.

A fourth lesson added from this audit's own Batch 4, applied from batch 5
onward:

4. As part of the four-source comparison, explicitly check whether a
   `docs/Vishnu prepared content/` folder exists for the technology, and if
   so, diff its file list against what's actually live — not just its
   content. A fully-drafted, reviewed file that was never promoted is a
   different failure mode from a comprehension defect in a live file (see
   "Content Pipeline / Promotion Gaps" below), and won't be caught by
   reading only the live files.

## Content Pipeline / Promotion Gaps (tracked separately from the 7 standards)

This is a distinct defect category from the usual comprehension-audit
findings below — not "a live file has a comprehension/correctness problem"
but "reviewed, corrected content exists and was never shipped." Logged here
on its own so it isn't buried inside a single batch's findings list.

**Batch 4 — MongoDB, confirmed.** `docs/Vishnu prepared content/MongoDB —
done 1/` contained 16 files against 11 live; the 5 missing
(`prerequisites.md`, `faq.md`, `pyq.md`, `real-world-scenarios.md`,
`notes.md`) were fully drafted and had already gone through what the
prepared folder's own `notes.md` describes as "a senior-instructor review
pass" — including a factual correction (MongoDB certification pricing) that
never made it into the live file it was correcting. Full detail under Batch
4 below.

**Not yet checked, flagged for a future pass (not urgent, not blocking):**
this same "source exists, never promoted" gap has not been checked for:
- The remaining Databases technologies in this audit (batches 5-6 below) —
  now checked as a standing part of the four-source comparison per lesson 4
  above, going forward from this point.
- The already-completed DevOps (18-technology) and Cloud (26-technology)
  comprehension audits in `07-roadmap-final.md` — those audits predate this
  check existing at all, so technologies marked clean there were never
  evaluated against this specific gap.
- Any other academy (Healthcare, Exam Prep, etc.) with content authored
  through the same prepared-content-folder workflow.

This is worth a dedicated, low-priority retroactive pass once the current
Databases audit lands — not scoped into this phase, since it's a
fundamentally different check (comparing file *existence* across two
directory trees) than the per-technology comprehension read this phase is
built around, and doing it properly means enumerating every technology's
prepared-content folder across every academy, not just spot-checking.

## Batch Order (dependency/traffic reasoning)

Registry-checked against `lib/data/academies.ts`'s `databasesAcademy` —
confirmed 12 technologies across 4 domains, matching content on disk under
`public/content/databases/`:

| # | Batch | Domain | Reasoning |
|---|-------|--------|-----------|
| 1 | PostgreSQL / MySQL | Relational | Highest-traffic, most-deployed RDBMS pair — everything else in the academy either builds on or gets compared against these two. Audited first. |
| 2 | SQL Mastery / Database Design | Relational | Conceptual prerequisites for the rest of the relational domain (query language + schema design), but lower standalone traffic than a named product — audited second rather than first since batch 1's two techs are what most learners land on directly. |
| 3 | Oracle / Performance Tuning | Relational | Enterprise/advanced RDBMS content, assumes the SQL fluency from batch 2. |
| 4 | MongoDB / Cassandra | NoSQL | Document + wide-column NoSQL — first domain switch, most-deployed NoSQL pair. |
| 5 | DynamoDB / Cloud Databases | NoSQL | Managed/cloud-native NoSQL — depends on general cloud concepts, audited after the foundational NoSQL pair. |
| 6 | Redis / Elasticsearch | Cache / Search | Most specialized, narrowest-audience technologies — cache and search are typically a second-database addition, not a first choice, so audited last. |

This mirrors the grouping already used in the Phase 4 content-authoring
batches. Starting batch 1.

---

## Batch 1: PostgreSQL + MySQL

**Registry-check:** both slugs (`postgresql`, `mysql`) confirmed live in
`lib/data/academies.ts` under the `relational` domain; on-disk content at
`public/content/databases/{postgresql,mysql}/` matches. PostgreSQL has 11
files (adds `installation.md`, `troubleshooting.md` beyond the standard set);
MySQL has 9 files (no installation/troubleshooting tabs — not flagging this
asymmetry, it's consistent with how other techs in this codebase vary tab
counts). No `docs/Vishnu prepared content/` source folder exists for either
(only Elasticsearch and MySQL have prepared-content folders, and MySQL's
doesn't overlap with this batch's findings below) — four-source comparison
reduced to three sources (live file, prior audit findings [none existed for
Databases before this], `docs/learnwithsynfracore/` [no Databases-specific
content found there]) for both technologies.

**Lesson 1 check (prerequisite notes) — corrected below.** Initial pass
concluded there was nothing to check because neither technology has an
inline "Before you start" line the way DevOps/Cloud overview.md files do.
That was verified against the wrong convention: this academy doesn't use an
inline note at all — it uses a dedicated `prerequisites.md` tab, already
registered as a valid section slug in `lib/data/navigation.ts` and already
in use by 3 of this academy's 12 technologies (`sql`, `database-design`,
`elasticsearch`). PostgreSQL and MySQL — the two most-trafficked
technologies in the whole academy — had neither the tab nor any inline
equivalent, despite both `roadmap.md` files explicitly stating SQL fluency
is an assumed prerequisite. This is the real Standard 6 gap, just
implemented as a missing tab rather than a missing/wrong inline claim.
Fixed — see finding 6.

**Lesson 3 check (interview-question differentiation):** compared both
`interview.md` files question-by-question. Genuinely differentiated, not a
template with names swapped — PostgreSQL's set covers MVCC/VACUUM, GIN/BRIN
indexing, JSONB, and recursive CTEs; MySQL's set covers
InnoDB-vs-MyISAM storage engines, binlog replication formats, and the
isolation-level table framed around MySQL's REPEATABLE READ default (vs.
PostgreSQL's READ COMMITTED default). No shared question stems, no
copy-swap pattern.

### Findings

**1. FIXED — `mysql/advanced.md` had a spliced-in duplicate cheatsheet
(contamination signature).** Lines 135–170 were a full "MySQL Cheatsheet" H2
section (`SHOW FULL PROCESSLIST`, backup commands, `innodb_buffer_pool_size`
tuning, etc.) that near-verbatim duplicated content already in the dedicated
`mysql/cheatsheets.md` tab — same commands, same comments, in several lines
character-for-character identical (`mysqldump -u root -p --single-transaction
mydb > backup.sql`, `SHOW STATUS LIKE 'Innodb_buffer_pool_read...'`, the
8GB `innodb_buffer_pool_size` example). This is exactly the "spliced
boilerplate" pattern the standing QA process checks for. Confirmed
PostgreSQL's `advanced.md` has no equivalent block — this is an isolated
MySQL-only defect, not a systemic template issue. Removed the duplicate
section; `advanced.md` now ends at the ProxySQL section, with the
Cheatsheet tab remaining the single source for that reference material.

**2. FIXED — PostgreSQL's core progression (Overview → Fundamentals →
Intermediate → Advanced) never actually explained MVCC before using the
term.** `overview.md` uses "MVCC" unexplained in a comparison table row
("Concurrency: MVCC, no read locks"). It's never defined in `fundamentals.md`,
`intermediate.md`, or `advanced.md` — the only real explanations live in
`interview.md` and `roadmap.md`, both of which sit outside the core tab
sequence a beginner follows. `roadmap.md` itself calls MVCC "the single most
distinctive PostgreSQL topic and the one most tutorials skip," which made the
gap in the actual teaching tabs harder to justify. Added a short MVCC
explanation to `fundamentals.md`'s Performance section, positioned right
before the `VACUUM`/`ANALYZE` block it motivates (dead-row accumulation from
MVCC is *why* `VACUUM` matters, which the code block previously asserted
without explaining).

**3. No dead references found** in either technology — all internal
cross-tab mentions (PostgreSQL's `installation.md` → "Fundamentals" tab;
MySQL's `roadmap.md` → its own Projects/Certification/Interview tabs) point
at tabs that exist.

**4. No duplicate-H1 or wrong-domain template leaks** — verified
programmatically (H1 count outside code fences) across all 20 files in this
batch; every file has exactly one top-level heading.

**5. Volatility tiering already correctly applied** — both `certification.md`
files (Volatile Core: exam formats) already carry `(needs verification)` tags
on pricing/exam-code claims, and MySQL's fundamentals/certification files
correctly flag the 8.0 EOL date and exam-content-currency as unverified. No
action needed; noting this as a positive finding so it isn't re-litigated in
a future retroactive spot-check.

**6. FIXED — PostgreSQL and MySQL were both missing the `prerequisites.md`
tab this academy already uses as its Standard 6 convention.** Confirmed by
checking the two other Databases technologies with existing prior content
that use it (`sql/prerequisites.md`, `database-design/prerequisites.md`) plus
`elasticsearch/prerequisites.md` — all three follow the same shape ("What You
Need Before Starting" numbered list tagged required/recommended/helpful, a
"what you do NOT need yet" section, a "Quick self-check"). Created
`postgresql/prerequisites.md` and `mysql/prerequisites.md` following that
exact convention, cross-checked against each tech's own Overview/Fundamentals
content rather than asserted from assumption (both explicitly point back to
this platform's own SQL Mastery technology as the real prerequisite, matching
what each tech's own `roadmap.md` already independently states).

**Registry caveat — RESOLVED, not just flagged.** `lib/content/index.ts` is
generated by `scripts/generate-content-registry.mjs`, which requires
esbuild's Linux binary; this sandbox's mounted `node_modules` is the
Windows-built copy CLAUDE.md's Phase-0 deploy rule already warns about, so
the two new prerequisite entries were initially added by hand rather than
by regenerating. That is not an acceptable final state for a generated
file — a hand edit matching the expected pattern is not the same guarantee
as the generator itself confirming it, and it was corrected before this
batch was considered closed:

1. Followed CLAUDE.md's own documented Phase-0 procedure for exactly this
   situation — `rsync`'d the repo (excluding `.next`/`.git`/`node_modules`)
   to a native Linux path in this same sandbox, ran a fresh `npm install`
   there (pulling the correct `@esbuild/linux-x64` binary, confirmed
   present), and copied `.env.local` across per the same procedure.
2. Removed the two hand-added entries from a copy of the registry and ran
   `npm run generate:content-registry` for real. It independently
   re-added both: `databases/postgresql/prerequisites` and
   `databases/mysql/prerequisites`.
3. Diffed the regenerated file against the original hand-patch —
   **byte-identical.**
4. Copied the regenerator's output back over the live
   `lib/content/index.ts`, so the file now shipping is generator-produced,
   not manually written, even though the content didn't change.

No separate agent or environment did this verification — it was done in
this same session by working around the sandbox's node_modules mismatch
directly, the same way CLAUDE.md instructs for a real deploy. Temporary
build directory and logs cleaned up afterward.

### Status at close of batch 1
- **Flagged:** none outstanding.
- **Fixed:** mysql/advanced.md duplicate cheatsheet splice (finding 1);
  postgresql/fundamentals.md missing MVCC explanation (finding 2); missing
  prerequisites.md tab for both technologies (finding 6); registry entries
  for both, confirmed via a real regenerator run rather than left as a
  hand-patch (see above).
- **Deferred:** none.

Batch 1 closed.

---

## Batch 2: SQL Mastery + Database Design

**Registry-check:** both slugs confirmed in `lib/data/academies.ts` under `relational`. `sql` has 10 files (adds `faq.md`, `pyq.md`, `real-world-scenarios.md`); `database-design` has 13 (adds `installation.md`, `notes.md`, `troubleshooting.md`, `real-world-scenarios.md`, `faq.md` — the most tabs of any Databases technology so far). Both already had `prerequisites.md` before this batch started (confirmed in Batch 1's corrected lesson-1 check) — used as the reference implementation for fixing PostgreSQL/MySQL.

**Prerequisites-convention check:** both already have a `prerequisites.md` tab matching the established shape. No gap here.

**Lesson 3 check (interview differentiation):** SQL's `interview.md` (LeetCode-pattern-focused: RANK/DENSE_RANK, self-joins, cancellation-rate CASE/SUM) and Database Design's `interview.md` (schema-judgment-focused: normalization reasoning, multi-tenant tradeoffs, partitioning vs. sharding) are genuinely different in both content and *kind* of question — one tests query-writing, the other tests design judgment. No template-swap pattern.

**Standard 9 note worth flagging explicitly:** Database Design's core tabs are unusually short by line count (`advanced.md` 21 lines, `intermediate.md` 23, `fundamentals.md` 33 — vs. `overview.md` at 151), which on a word-count-only heuristic would look like thin/incomplete content. Read in full: this is dense, high-signal writing, not a stub — each tab explicitly says what it's building on ("Overview covers X as a rule; here's what actually breaks without it") and adds genuine new judgment-level content (the *why*, not a restatement of the *what*) rather than repeating Overview. This is the same standing-instructions point about word-count heuristics being insufficient, just observed here in the opposite direction from a defect — worth recording so a future pass doesn't mistake shortness alone for incompleteness.

### Findings

**1. FIXED — `sql/fundamentals.md` had an incoherent multi-table JOIN example.** The file's own stated design promise ("every later section reuses these same tables... the shape is introduced once, here, and never silently changes") was violated by its own JOIN section: `FROM Employees e JOIN Departments d ... JOIN Orders o ON o.customer_id = e.id` joins Orders to Employees via `customer_id = e.id` — but `Orders.customer_id` was established earlier in the same file (Cascading Delete section) as a foreign key to `Customers(id)`, a completely different entity from `Employees`. This isn't a stylistic nitpick — it silently cross-matches unrelated entities that happen to share numeric IDs, which is exactly the kind of bug this course's own NULL/`NOT IN` and integer-division sections warn readers about elsewhere. Replaced with a genuine 3-table chain using tables that are actually related in the established schema (`Students` → `Enrollments` → `Courses`).

**2. FIXED — a real, silent integer-division bug repeated 3 times across `sql/intermediate.md`, `sql/advanced.md`, and `sql/cheatsheets.md`.** All three "cancellation rate" / rate-from-CASE-SUM examples wrote `SUM(CASE WHEN ... THEN 1 ELSE 0 END) / COUNT(*)` without forcing decimal division. On MySQL this returns a decimal correctly; on PostgreSQL and SQL Server, integer / integer truncates to an integer, so this would silently return `0` for every row, no error — exactly the kind of "looks right, is wrong" bug this course otherwise takes real care to call out (it already does so correctly elsewhere, e.g. `sql/pyq.md` question 10 already uses `* 100.0` for exactly this reason, and several date-function sections carefully scope MySQL-only vs. portable syntax). Fixed all three instances with `* 1.0` and an explanatory comment; left the one genuinely MySQL-scoped division example (`intermediate.md`'s "Average sessions per user," explicitly under a "Both queries below use MySQL's DATE_SUB/DATE_ADD" heading) untouched since it's correctly scoped already.

**3. No dead references found.** Verified specifically (per lesson 2, not taken on trust) two cross-tab claims that looked like exactly the failure pattern from the Cloud audit: (a) `sql/interview.md`, `sql/faq.md`, and `sql/pyq.md` all claim "see the Real World tab" for a CTE-materialization bug — confirmed `sql/real-world-scenarios.md` Scenario 3 genuinely covers this in depth, not a stub; (b) `database-design/real-world-scenarios.md` claims "this page's Troubleshooting section covers tracing the full cascade chain" — confirmed `database-design/troubleshooting.md`'s "`ON DELETE CASCADE` deleted more data than expected" section genuinely does this. Also verified `database-design/advanced.md`'s cross-*academy* reference to "CQRS's read-side pattern from the Cloud Architecture Patterns technology" — confirmed that technology and CQRS content genuinely exist in `public/content/cloud/architecture-patterns/`.

**4. No duplicate-H1 or spliced-boilerplate contamination** — verified programmatically across all 23 files in this batch (10 SQL + 13 Database Design); every file has exactly one top-level heading, and no cheatsheet/reference-tab content was found duplicated into a core teaching tab (the pattern found in MySQL's `advanced.md` in Batch 1).

### Status at close of batch 2
- **Flagged:** none outstanding.
- **Fixed:** sql/fundamentals.md incoherent JOIN example (finding 1); integer-division bug across sql/intermediate.md, sql/advanced.md, sql/cheatsheets.md (finding 2).
- **Deferred:** none.

Batch 2 closed.

---

## Batch 3: Oracle + Performance Tuning

**Registry-check:** both slugs confirmed in `lib/data/academies.ts` under
`relational`. Oracle has 10 files including `labs.md` (a valid, registered
section slug — `labs` exists in `lib/data/navigation.ts` — used by only a
handful of technologies sitewide). Performance Tuning has 8 files. Neither
had a `prerequisites.md` tab. No `docs/Vishnu prepared content/` folder
exists for either.

**Prerequisites-convention check — real gap again, fixed.** Same pattern as
Batch 1: both technologies lack the tab. Oracle's own `roadmap.md` already
states "this platform's own SQL technology is a genuine prerequisite,"
identical in wording to MySQL's pre-fix roadmap. Performance Tuning has no
explicit prerequisite statement anywhere in any of its 8 files, despite
every example being written directly against PostgreSQL/MySQL syntax with
no onboarding. Added `prerequisites.md` for both, following the established
convention, then regenerated `lib/content/index.ts` properly from the start
this time (native-Linux rsync + fresh `npm install` + real generator run,
per the procedure verified in Batch 1) rather than hand-patching — confirmed
it added exactly `databases/oracle/prerequisites` and
`databases/performance-tuning/prerequisites`, nothing else changed.

**Lesson 1 check (verify before asserting) — a real claim checked out, not a defect.** `oracle/labs.md` closes with: "Each of Overview, Fundamentals,
Intermediate, and Advanced has a short practice quiz built into the page
itself." This is exactly the shape of claim that turned out false three
times in the Cloud audit, so it was checked rather than trusted either way.
Confirmed genuine: `docs/quiz-questions-databases-batch3.sql` is explicitly
labeled "Quiz coverage for databases/oracle and databases/performance-tuning"
and contains real seeded questions keyed to `('databases', 'oracle',
'overview'|'fundamentals'|'intermediate'|'advanced', ...)` — all four,
matching the claim exactly — plus a genuine platform feature backing it
(`components/tech/LabEnvironment.tsx`'s `InteractiveConsole`, `app/labs/page.tsx`'s "SQL Console"). Not a dead reference.

**Lesson 3 check (interview differentiation):** Oracle's `interview.md`
(architecture/SGA, PL/SQL, Data Guard, RAC-focused) and Performance Tuning's
`interview.md` (diagnostic-process-focused: distinguishing a slow query from
a lock-blocked one, OLTP vs. OLAP tuning) are genuinely distinct in both
subject and framing. No overlap or template-swap.

**Standard 9 note:** both technologies are dense and properly progressive
throughout — Performance Tuning in particular builds real depth (Fundamentals
covers what an index is and reads one basic plan; Intermediate adds composite/
covering indexes, partitioning, replication lag, caching; Advanced adds
locking/deadlocks, bloat/autovacuum internals, OLTP vs. OLAP, sharding) with
no repeated or skipped content between tabs.

### Findings

**1. FIXED — missing `prerequisites.md` for both technologies** (see above;
same Standard 6 gap as Batch 1, caught this time during the registry-check
step itself rather than after the fact).

**2. No dead references found.** Cross-tab claims checked: Performance
Tuning's Troubleshooting explicitly says "covered on the Advanced tab" for
bloat — confirmed Advanced genuinely covers bloat/autovacuum in depth, not a
passing mention. Oracle's `labs.md` quiz claim (above) — confirmed genuine.

**3. No duplicate-H1 or spliced-boilerplate contamination** — verified
programmatically across all 18 files in this batch (10 Oracle + 8
Performance Tuning); every file has exactly one top-level heading. Oracle's
`advanced.md` does contain its own "Performance Tuning" section
(`EXPLAIN PLAN`, hints, `DBMS_STATS`) that overlaps in *topic* with the
separate Performance Tuning technology — checked whether this was the
MySQL-style splice pattern from Batch 1: it isn't. The content is genuinely
Oracle-flavored (`DBMS_XPLAN`, Oracle hint syntax, `DBMS_STATS.GATHER_TABLE_STATS`)
rather than duplicated PostgreSQL/MySQL text, and belongs there as
Oracle-specific tuning syntax distinct from the other technology's
general-purpose coverage.

### Status at close of batch 3
- **Flagged:** none outstanding.
- **Fixed:** missing prerequisites.md for Oracle and Performance Tuning
  (finding 1), registry updated via a verified real generator run.
- **Deferred:** none.

Batch 3 closed.

---

## Batch 4: MongoDB + Cassandra

**Registry-check:** both slugs confirmed in `lib/data/academies.ts` under
`nosql`. MongoDB had 11 live files; Cassandra had 9. Both lacked
`prerequisites.md`.

**Four-source comparison surfaced a real deployment gap, not just a
prerequisites gap.** MongoDB has a `docs/Vishnu prepared content/MongoDB —
done 1/` source folder with **16** files — 5 more than the 11 live:
`prerequisites.md`, `faq.md`, `pyq.md`, `real-world-scenarios.md`, and
`notes.md` were fully drafted, reviewed (the folder's own `notes.md` states
it's "consolidated... with corrections folded in from a senior-instructor
review pass"), and never promoted to `public/content/databases/mongodb/`.
This is exactly the class of gap the four-source comparison step exists to
catch, and it hadn't come up in Batches 1-3 because none of those
technologies had a prepared-content folder to compare against.

Checked whether the already-live 11 files were faithfully promoted from the
prepared source, since the discrepancy raised the question of whether
promotion generally was incomplete or just missing for these 5: diffed all
11 (ignoring line-ending differences — the prepared folder is CRLF, live is
LF). Three (`advanced.md`, `overview.md`, `troubleshooting.md`) differ only
in having an inline "CORRECTED —" label stripped from a code comment.
`installation.md` and `roadmap.md` differ more substantively — in the
**good** direction: the prepared versions assert specific, confident version
numbers and prices (MongoDB 8.0, exact `background: true` deprecation
version); the live versions replace those with `(needs verification)` hedges
per this project's own Volatile Core tiering rule. That's a correct editorial
improvement already applied, not a regression — left alone. The other 4
(`cheatsheets.md`, `intermediate.md`, `projects.md`) are byte-identical.

**`certification.md` is the one already-live file that's actually wrong,
not just unhedged.** It states "Free exam" for both MongoDB Associate
Developer and Associate DBA. The prepared source already has this corrected
— genuinely $150, not free (the free part is a 50%-discounted-after-prep
exam fee, not a free exam) — and explains exactly where the "free" claim
likely originated. This wasn't a volatility-hedge gap like installation.md/
roadmap.md; it was a flat factual error sitting live. Fixed, using the same
hedging convention already established in this tech's own installation.md/
roadmap.md rather than re-asserting the prepared source's confident $150
figure unhedged.

**Fixed, not just flagged:**
1. `mongodb/certification.md` — corrected the "Free exam" claim to $150,
   with a needs-verification hedge, matching the convention already used
   elsewhere in this same tech.
2. Promoted the 5 missing files (`prerequisites.md`, `faq.md`, `pyq.md`,
   `real-world-scenarios.md`, `notes.md`) from the prepared source to live.
   Cross-checked their internal claims before promoting, not just copied
   blind (lesson 1): `faq.md`'s reference to "the HA/DR technology's own
   emphasis on this exact point" — confirmed `ha-dr` is a real, registered
   Cloud technology. `real-world-scenarios.md`'s reference to "this course's
   own Portfolio Project 3" (`rs.stepDown()` mid-write) — confirmed
   `projects.md`'s Project 3 genuinely does this. Added a needs-verification
   hedge to `notes.md`'s and `pyq.md`'s specific pricing/version figures for
   consistency with the rest of the tech, since those are Volatile Core
   facts per the standing content-tiering rule.
3. `mongodb/prerequisites.md` and `cassandra/prerequisites.md` — same
   Standard 6 gap as Batches 1 and 3, both added following the established
   convention.
4. `cassandra/advanced.md` — the exact same spliced-cheatsheet contamination
   pattern found in Batch 1's `mysql/advanced.md`: a full "Cassandra
   Cheatsheet" section (CQLSH commands, `nodetool` reference, CQL quick
   reference) duplicating `cassandra/cheatsheets.md` near-verbatim. Removed,
   leaving Advanced scoped to its actual unique content (compaction
   strategies). Checked MongoDB's `advanced.md` for the same pattern — clean,
   isolated to Cassandra.

**Registry updates — real generator used directly both times, no hand-patch
at any point this batch**, per this session's own standing procedure (native
Linux rsync + fresh `npm install` + `npm run generate:content-registry`):
first run added exactly the 5 new MongoDB entries, second run added exactly
the 1 new Cassandra entry — both confirmed against the expected file list
before being copied back over the live `lib/content/index.ts`.

**Lesson 3 check (interview differentiation):** MongoDB's `interview.md`
(CAP theorem position, aggregation vs. MapReduce, sharding/replication
specifics) and Cassandra's `interview.md` (LSM-tree write path, tombstones,
multi-DC replication) share zero question stems despite both covering
"consistency levels" — MongoDB frames it around replica-set write/read
concern, Cassandra around the ring/RF/coordinator model. Genuinely
differentiated.

**No duplicate-H1 issues** — verified programmatically across all 26 files
in this batch (16 MongoDB + 10 Cassandra, post-promotion/post-addition).

### Status at close of batch 4
- **Flagged:** none outstanding.
- **Fixed:** MongoDB certification.md factual error; 5 missing MongoDB files
  promoted from prepared source; prerequisites.md added for both
  technologies; Cassandra's spliced cheatsheet in advanced.md removed;
  registry updated via real generator runs, verified both times.
- **Deferred:** none.

Batch 4 closed.

---

## Batch 5: DynamoDB + Cloud Databases

**Registry-check:** both slugs confirmed in `lib/data/academies.ts` under
`nosql`. DynamoDB had 9 live files, no `prerequisites.md`. Cloud Databases
had 8 files, also no `prerequisites.md`. Neither has a
`docs/Vishnu prepared content/` source folder (lesson 4 check, now standing
for every remaining technology per the user's instruction) — no promotion
gap to flag for either.

**Prerequisites-convention check — one real gap, one genuine structural
exception, not a mechanical apply-everywhere.** DynamoDB lacked the tab
despite every example running against real AWS CLI/`boto3` syntax with no
onboarding — same Standard 6 gap as Batches 1/3/4. Added
`dynamodb/prerequisites.md` (AWS account + CLI familiarity, basic Python as
helpful-not-required, JSON-attribute-syntax familiarity, explicit
NoSQL/relational-background non-requirements, a self-check on
access-pattern-first modeling instinct).

Cloud Databases was checked against the same convention and **deliberately
not given a `prerequisites.md`** — this is a comparison/strategy reference
across managed database services (RDS, Aurora, Cosmos DB, managed
PostgreSQL/MySQL offerings, etc.), not a hands-on skill course with its own
Overview→Fundamentals→Advanced teaching progression the other 11
technologies share. It has no Certification, Projects, or Roadmap tabs
either — the same structural pattern, not an oversight isolated to
prerequisites. Forcing the convention onto a technology that isn't shaped
like the others would be applying the letter of Standard 6 without its
actual intent (orienting a learner before a teaching sequence that, here,
doesn't exist in the same form). No action taken; reasoning logged so this
isn't re-flagged as a gap in a future pass.

**Findings:**

1. **FIXED — `dynamodb/advanced.md` had the same spliced-cheatsheet
   contamination pattern found in Batch 1 (MySQL) and Batch 4 (Cassandra).**
   A duplicate "DynamoDB Cheatsheet" section overlapped `dynamodb/cheatsheets.md`
   near-verbatim. Removed; `advanced.md` now ends cleanly at the Global
   Tables section. This is the 3rd instance of the pattern across 5
   technologies audited so far — flagged at the time as worth an explicit
   check in every remaining batch, which is why Batch 6 below checks it
   for both remaining technologies rather than waiting to notice it
   incidentally.
2. **No dead references found** in either technology.
3. **No duplicate-H1 or contamination issues** in Cloud Databases' 8 files.

**Registry update — regression found and corrected in this session, not
carried forward silently.** The `dynamodb/prerequisites` entry was
regenerated via the standing verified procedure (native-Linux rsync + fresh
`npm install` + real `generate:content-registry` run) and this batch's
own record at the time stated the diff had been confirmed clean and the
entry copied to the live `lib/content/index.ts`. **That was wrong.** Batch
6's registry run (below) re-generated `databases/dynamodb/prerequisites` as
a fresh "added" entry against the then-current live file — which only
happens if it was never actually live. Root cause: this batch's own
troubleshooting notes describe a `grep -n` call across two files that
printed coincidentally-matching line numbers, which was misread as
confirming the entry already existed, when a clean `diff` (not run at the
time) would have shown it was still missing. The entry sat unregistered —
meaning `dynamodb/prerequisites.md` existed on disk but was never actually
reachable as a tab — from this batch's close until it was caught and fixed
in Batch 6. Logged here rather than silently patched over, per the standing
fixed-backlog rule (no known bug sits unfixed because it belongs to a
closed batch) — see Batch 6 for the correction.

### Status at close of batch 5
- **Flagged:** none outstanding at the time of this batch's own close —
  see Batch 6 for a correction to this batch's registry-verification claim,
  found during Batch 6's own registry run.
- **Fixed:** dynamodb/advanced.md duplicate cheatsheet splice (finding 1);
  dynamodb/prerequisites.md created.
- **Deferred:** none.

Batch 5 closed (registry-verification claim corrected retroactively in
Batch 6 — see below).

---

## Batch 6: Redis + Elasticsearch (last Databases batch)

**Registry-check:** both slugs confirmed in `lib/data/academies.ts` — Redis
under `cache`, Elasticsearch under `search`. Redis had 11 live files, no
`prerequisites.md`. Elasticsearch had 14 files including `prerequisites.md`
already.

**Lesson 4 check (prepared-content promotion gap):** Elasticsearch has a
`docs/Vishnu prepared content/Databases → Elasticsearch/` folder with 5
files (`faq.md`, `notes.md`, `prerequisites.md`, `pyq.md`,
`real-world-scenarios.md`) — all 5 already exist live, so no missing-file
gap like MongoDB's. Diffed each anyway rather than assuming "all present
means fully promoted": 3 of 5 (`faq.md`, `notes.md`, `pyq.md`) differ from
the prepared source, but only in the same direction as MongoDB's
`installation.md`/`roadmap.md` in Batch 4 — live versions have dates/prices
softened to `(needs verification)` hedges the prepared draft didn't have.
Correct editorial improvement already applied, not a regression or a
promotion gap. Redis has no prepared-content folder.

**Prerequisites-convention check — real gap, fixed.** Redis lacked
`prerequisites.md` despite having the full skill-technology tab set
(certification, installation, projects, roadmap, troubleshooting) — the
same shape as PostgreSQL/MySQL/Oracle/Performance Tuning/MongoDB/Cassandra/
DynamoDB before their fixes, not a Cloud-Databases-style structural
exception. Added `redis/prerequisites.md` (command-line comfort as
required, basic programming in any language as recommended, prior
NoSQL/Redis experience explicitly listed as not required, a self-check on
the `SET NX PX`-vs-`SETNX`+`EXPIRE` atomicity distinction).

**Spliced-cheatsheet check — explicitly run on both, per this batch's own
instruction, given the pattern had hit 3 of 5 technologies checked so far.**
Confirmed present in **both**:

1. **FIXED — `redis/advanced.md`** had a duplicate "Redis Cheatsheet" H2
   section (SERVER/KEY MANAGEMENT/DEBUGGING subsections) overlapping
   `redis/cheatsheets.md`. Removed; file now ends at the Production
   Configuration section's `io-threads 4` line.
2. **FIXED — `elasticsearch/advanced.md`** had a duplicate "Elasticsearch
   Cheatsheet" H2 section (CLUSTER/INDEX MANAGEMENT/SEARCH/ALIASES
   subsections), including a zero-downtime-alias-swap example
   near-byte-identical to `elasticsearch/cheatsheets.md`. Removed; file now
   ends at the ILM `PUT /_index_template/logs-template` block.

This brings the running total to **5 of 12 Databases technologies** with
this exact contamination signature: mysql (Batch 1), cassandra (Batch 4),
dynamodb (Batch 5), redis and elasticsearch (Batch 6) — worth naming
explicitly as a systemic authoring-pipeline pattern rather than a series of
isolated coincidences. Every technology in this academy has now been
checked for it; none remain unchecked.

**Full comprehension read (all remaining files):** Redis's
overview/fundamentals/intermediate/interview/certification/installation/
troubleshooting/projects/roadmap and Elasticsearch's
overview/fundamentals/intermediate/interview/certification/projects/roadmap
were read in full. Both are dense, correctly progressive (Redis:
data-structure fundamentals → caching/rate-limiting patterns → Lua/Pub-Sub/
Streams → persistence/HA/cluster; Elasticsearch: core concepts/CRUD →
relevance tuning/percolator/vector search → ILM/performance → cluster
operations), with terms defined before first use and no dead cross-tab
references found. Both already carry correct `(needs verification)` hedges
on certification pricing (Redis's and Elasticsearch's cert tables) and on
volatile factual claims (Elasticsearch overview's AGPLv3-licensing-change
date). No further findings.

**Registry update — the Batch 5 regression caught and corrected here.**
Ran the standing verified procedure (native-Linux rsync + fresh
`npm install`, confirmed `@esbuild/linux-x64` present + `.env.local` copied
and verified matching + `generate:content-registry`) to register
`redis/prerequisites`. The generator's output reported **both**
`databases/dynamodb/prerequisites` and `databases/redis/prerequisites` as
newly "added" — meaning the live `lib/content/index.ts` did not actually
contain the DynamoDB entry Batch 5 believed it had confirmed and copied.
Diffed the live file directly to confirm (`grep` for both slugs against the
live file returned nothing before this fix), copied the regenerated file
over the live one, and re-diffed to confirm both entries are now present
and the files are byte-identical. This is a real regression that sat
unnoticed for one full batch — logged per the fixed-backlog rule rather
than treated as already closed just because it belonged to Batch 5.

**Lesson 3 check (interview differentiation):** Redis's `interview.md`
(data-structure selection, RDB/AOF, Sentinel/Cluster, cache-invalidation
strategy, rate-limiting/distributed-lock correctness) and Elasticsearch's
`interview.md` (cluster/node-type architecture, query DSL, text-vs-keyword
mapping, performance/ILM, ELK integration) share no question stems despite
both technologies supporting "search"-adjacent use cases in practice.
Genuinely differentiated.

**No duplicate-H1 or other contamination issues** found across the
remaining files in either technology.

### Status at close of batch 6
- **Flagged:** none outstanding.
- **Fixed:** redis/advanced.md and elasticsearch/advanced.md duplicate
  cheatsheet splices (5th and 4th confirmed instances of the pattern,
  respectively, by audit order); redis/prerequisites.md created; the
  Batch 5 registry regression (`databases/dynamodb/prerequisites` never
  actually live) caught and corrected, along with registering the new
  `databases/redis/prerequisites` entry.
- **Deferred:** none.

Batch 6 closed. **All 12 Databases technologies audited.**

---

## Databases Academy Audit — Closing Summary (12/12 complete)

All 6 batches / 12 technologies closed: PostgreSQL, MySQL, SQL Mastery,
Database Design, Oracle, Performance Tuning, MongoDB, Cassandra, DynamoDB,
Cloud Databases, Redis, Elasticsearch.

**Totals across the academy:**
- **7 technologies** were missing the `prerequisites.md` Standard 6 tab and
  got one added: PostgreSQL, MySQL, Oracle, Performance Tuning, MongoDB,
  Cassandra, DynamoDB, Redis (8, not 7 — every technology in the
  skill-course shape except the 4 that already had it: SQL Mastery,
  Database Design, Cloud Databases [deliberately exempt, see Batch 5], and
  Elasticsearch).
- **5 of 12 technologies** had the spliced-cheatsheet contamination
  pattern (duplicate reference material inside an Advanced tab): MySQL,
  Cassandra, DynamoDB, Redis, Elasticsearch — all fixed. Every technology
  in the academy has now been explicitly checked for this; none remain
  unchecked.
- **1 content-pipeline promotion gap** (MongoDB) — 5 fully-drafted,
  reviewed files that existed in `docs/Vishnu prepared content/` but were
  never shipped, including a live factual error (certification pricing)
  the prepared source had already corrected. Promoted and fixed.
- **1 registry regression** (DynamoDB's `prerequisites` entry, Batch 5) —
  caused by misreading `grep` output as confirming an entry's presence
  instead of running a clean diff; caught one batch later during Batch 6's
  own registry run and corrected.
- A handful of standalone content bugs: an incoherent cross-entity JOIN
  example (SQL Mastery), a repeated silent integer-division truncation bug
  (SQL Mastery, 3 instances), a missing MVCC explanation ahead of where it's
  used (PostgreSQL).

**Open, explicitly-deferred items (not started, not urgent, logged for a
future pass):**
1. Retroactive four-source/promotion-gap check (lesson 4) against the
   already-completed DevOps (18-technology) and Cloud (26-technology)
   audits in `07-roadmap-final.md`, and against any other academy
   (Healthcare, Exam Prep, etc.) using the same prepared-content-folder
   workflow — those audits predate this check existing.
2. The Standard 9 retroactive spot-check (beginner-simulation read, not
   just word-count/contamination-signature heuristics) for
   DevOps/Cloud/Databases/Healthcare technologies previously marked clean
   under the older heuristic — logged as lower-priority in the standing
   instructions, not scoped into this phase.

Databases academy comprehension audit (Phase 9) — **closed.**
