# Practice-Exam Coverage — Future Rollout Tracker

**Started:** 2026-08-31
**Status: FUTURE INITIATIVE, NOT ACTIVE WORK.** This doc exists to record the
scope and rationale so it isn't lost once the current session's work (AWS SAA
+ Security+ papers, working toward BCHHC parity) wraps up — it is explicitly
**not** a commitment to start building it now. Read this before assuming any
technology beyond the ones listed below has real practice-exam
infrastructure — most don't.

## The gap this tracks

The platform has 260 technologies across 20 academies (see
`docs/audit/10-phase3-visual-depth-rollout.md` for the content-depth/visual
rollout covering all of them). Real, premium, DB-backed practice-exam
infrastructure (the `question_papers` / `questions` / `question_options` /
`question_answers` schema — see `docs/question-bank-schema.sql`) exists for a
tiny fraction of that: **6 technologies/certifications, out of 260.**

## Current real state (verified live against the database, 2026-08-31)

**Seeded and live in production:**

| exam_type | Technology/cert | Papers | Total questions |
|---|---|---|---|
| `bchhc` | Healthcare/BCHHC-prep | 10 | 1,000 |
| `kubernetes` | DevOps/Kubernetes (CKA/CKAD) | 4 | 133 |
| `terraform` | DevOps/Terraform | 4 | 103 |
| `docker` | DevOps/Docker | 4 | 95 |
| `ansible` | DevOps/Ansible | 4 | 88 |

**Built and verified, held for DB-seeding confirmation (not yet live)** — see
the current session's work:

| exam_type | Cert | Papers built | Questions | Target |
|---|---|---|---|---|
| `aws-saa` | AWS Solutions Architect Associate | 5 | 100 | 10 papers (BCHHC parity) |
| `comptia-sec-plus` | CompTIA Security+ | 3 | 60 | 10 papers (BCHHC parity) |

Both are being built toward the same 10-papers depth BCHHC already has,
alternating between the two certs so neither sits at zero for long — this is
the CURRENT session's active work, tracked here for continuity but not the
subject of this doc's "future" framing.

**Wired to a certification page but with zero real papers behind them:**
None currently — every `exam_type` with real papers above is either wired to
a technology tab (`technologyExamTypeMap` in `lib/data/navigation.ts`) or a
certification page (`certificationExamTypeMap`, added Phase-4-audit-response
2026-08-30), or both.

## The future scope this doc exists to record

**Eventually, every technology on the platform should have the same tier of
real, premium practice-exam content that BCHHC/Kubernetes/Terraform/Docker/
Ansible/AWS-SAA/Security+ are getting** — not just study-guide markdown
content (which nearly every technology already has), but actual DB-backed
question papers with verified answer keys, wired to a real "Practice Exams"
UI entry point the way `app/certifications/[id]/page.tsx` and the technology
section page's "Practice Exams" sidebar tab both already support.

**This is explicitly a future initiative, sized for its real scale — not
something to start now:**
- 260 technologies, most with zero papers currently.
- Even at a modest "4 shorter papers per technology" pace (matching
  Kubernetes/Terraform/Docker/Ansible's scale, not BCHHC's 10×100), that's
  roughly 1,000+ papers and ~20,000+ individually-verified questions to
  reach full platform coverage — an effort on the order of magnitude of the
  entire Phase 3 visual/depth rollout (260 technologies), possibly larger
  given the extra verification rigor real exam questions require compared to
  a content depth-rubric pass.
- **Do not start broad platform-wide practice-exam work from this doc
  without an explicit go-ahead** — this is a scope record, not a work order.
  When that go-ahead happens, treat it as its own phased rollout (likely
  cert-cluster by cert-cluster, mirroring how Phase 3 went academy by
  academy) rather than attempting it in one continuous push.

## Process and lessons learned this session (read before building any future paper)

These apply to every future practice-exam paper, for any technology, not
just AWS SAA/Security+:

1. **Never hand-track UUIDs across a long file.** Two of the early papers
   built this session (AWS SAA Papers 1 and 3) each had a real duplicate-UUID
   bug from manual copy-paste tracking across a ~200-line file — caught before
   shipping, but only by disciplined verification, not avoided. Use
   `scripts/fill-seed-uuids.mjs`: write the SQL with `{{TOKEN}}` placeholders
   (`{{Q1}}`, `{{Q1_O1}}`, etc.) instead of real UUIDs, then run the script
   to mechanically replace every distinct token with a fresh, guaranteed-
   unique UUID. This eliminated the entire bug class — zero structural
   collisions across every paper written after adopting it.
2. **Structural/referential integrity checks are necessary but not
   sufficient.** A `correct_option_id` pointing to the wrong-but-still-valid
   option (AWS SAA Paper 4's Q6) passed every foreign-key/uniqueness check
   while shipping a factually wrong answer key. Two additional checks catch
   what referential integrity can't:
   - A manual re-read of every question against its marked-correct answer
     before finalizing.
   - A "distractor-language sanity scan" (grep the correct answer's own
     text for dismissive phrasing like "cannot"/"never"/"is not possible"/
     "no AWS service" — language that's almost always written into
     deliberately-wrong distractors, not correct answers). This has one
     known false-positive mode (a correct answer legitimately using a word
     like "never" as accurate technical description, not distractor
     framing — confirmed once, in AWS SAA Paper 5) — always manually verify
     a flag before "fixing" it, don't auto-correct on a match alone.
3. **Cross-file UUID collisions are a real, separate risk from within-file
   ones.** AWS SAA Paper 3 reused 4 option UUIDs already committed in
   Security+ Paper 1 — a different bug shape than the within-file
   duplicates, and the within-file-only checker didn't catch it. Run a
   second check comparing every seed file's UUIDs against every OTHER seed
   file in the repo before committing a new one — cheap to do (a single
   Node script over all `docs/*_seed_*.sql` files) and has caught a real
   issue every few papers.
4. **Domain-weighting the paper against the certification's real exam
   blueprint** (pulled from `app/certifications/[id]/page.tsx`'s
   `certDetail` domain breakdown where one exists) keeps practice content
   representative of the actual exam, not an arbitrary topic mix.
5. **Distinct topics per paper, explicitly cross-referenced against every
   prior paper for that same cert** — each new paper's header comment
   should state what's already been covered, and new questions should
   consciously avoid re-testing the same scenario a prior paper already
   used, so 10 papers add up to broad real coverage rather than repeating
   a smaller pool of scenarios 10 times.
6. **Hold DB seeding for explicit confirmation.** Every paper built this
   session was committed to git as a record immediately, but none were
   executed against the live Supabase database without explicit sign-off —
   seeding is a production-data change, held to the same confirmation
   discipline as a `wrangler deploy`.

## Where the actual SQL files live

`docs/aws_saa_seed_paper_{1..5}.sql`, `docs/secplus_seed_paper_{1..3}.sql`
(current session, growing), `docs/bchhc_seed_papers_1_6.sql` and
`docs/bchhc_seed_papers_7_10.sql` (pre-existing, already live). No seed
files exist yet for Kubernetes/Terraform/Docker/Ansible — those were seeded
directly, before this file-based-record convention was established this
session; if they ever need to be regenerated or extended, there is no
existing `.sql` record to build from, only the live database rows
themselves.
