# Practice-Exam Coverage — Future Rollout Tracker

**Started:** 2026-08-31. **Last updated:** 2026-08-31 (AWS SAA + Security+
batch completed, seeded, and deployed — see "Current real state" below).
**Status: FUTURE INITIATIVE, NOT ACTIVE WORK** beyond the Healthcare
CPT/CCS note added below. This doc exists to record the scope and rationale
so it isn't lost — it is explicitly **not** a commitment to start building
the broader 260-technology rollout now. Read this before assuming any
technology beyond the ones listed below has real practice-exam
infrastructure — most don't.

## The gap this tracks

The platform has 260 technologies across 20 academies (see
`docs/audit/10-phase3-visual-depth-rollout.md` for the content-depth/visual
rollout covering all of them). Real, premium, DB-backed practice-exam
infrastructure (the `question_papers` / `questions` / `question_options` /
`question_answers` schema — see `docs/question-bank-schema.sql`) exists for a
tiny fraction of that: **7 technologies/certifications, out of 260.**

## Current real state (verified live against the database, 2026-08-31)

**Seeded and live in production — all at BCHHC's 10-paper depth:**

| exam_type | Technology/cert | Papers | Total questions |
|---|---|---|---|
| `bchhc` | Healthcare/BCHHC-prep | 10 | 1,000 |
| `kubernetes` | DevOps/Kubernetes (CKA/CKAD/KCNA/CKS) | 4 | 133 |
| `terraform` | DevOps/Terraform | 4 | 103 |
| `docker` | DevOps/Docker | 4 | 95 |
| `ansible` | DevOps/Ansible | 4 | 88 |
| `aws-saa` | AWS Solutions Architect Associate | 10 | 200 |
| `comptia-sec-plus` | CompTIA Security+ | 10 | 200 |

AWS SAA and Security+ were built alternating (so neither sat at zero for
long), each reaching 10 papers/200 questions, then seeded into production
and deployed together — see the per-paper `docs/aws_saa_seed_paper_{1..10}.sql`
and `docs/secplus_seed_paper_{1..10}.sql` git history for the full build
record, including every bug caught and fixed along the way (section below).

**Wired to a UI entry point:** every `exam_type` with real papers above is
wired to a technology tab (`technologyExamTypeMap` in
`lib/data/navigation.ts`), a certification page (`certificationExamTypeMap`),
or both — and, as of the same 2026-08-31 session, to the grouped `/question-bank`
catalog page itself (`examTypeGroupMap`, same file), which groups papers by
academy (Healthcare / DevOps / Cloud / Security) with a per-exam_type
sub-heading within each group.

## Content priority for the next batch (flagged here, not started)

**Healthcare should get CPT and CCS practice-paper content next**, alongside
or immediately after this AWS SAA/Security+ batch — both certs already have
real lesson content built on the platform (see the Healthcare academy), just
missing the exam-paper layer BCHHC, AWS SAA, and Security+ now all have. This
would make Healthcare the first academy group holding **multiple** certs
under one `/question-bank` group section (BCHHC + CPT + CCS, and potentially
more later) — the same pattern DevOps already uses for its four
(Kubernetes/Terraform/Docker/Ansible). `examTypeGroupMap` already supports
this correctly with no structural change needed: adding `cpt`/`ccs` entries
with `group: "Healthcare"` is sufficient once real papers exist for them.
Not started — flagged here specifically so it isn't lost, per this doc's
whole purpose.

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
6. **Hold DB seeding for explicit confirmation, then re-verify against the
   LIVE database (not just the seed files against each other) immediately
   before actually running it.** Every paper built this session was
   committed to git as a record immediately, but held unseeded until
   explicit sign-off — seeding is a production-data change, held to the
   same confirmation discipline as a `wrangler deploy`. When the go-ahead
   came, the pre-existing cross-file UUID collision check (item 3 above)
   was re-run one more time against the *live* database's actual UUIDs
   (not just the 20 seed files against each other) immediately before
   running the real inserts — cheap, and the only way to be certain
   against what's actually live at that moment, not what was live when an
   earlier check happened to run. Writing the actual SQL-parsing insert
   script itself caught one more real bug an unbalanced-quote in
   `secplus_seed_paper_10.sql` that had passed every earlier
   UUID/referential/distractor-language check (none of which validate raw
   SQL string-literal syntax) — fixed before it reached the database. A raw
   quote-balance check (every `''`-stripped line has an even quote count)
   is now part of the standing per-paper verification sequence, not just a
   one-off catch.
7. **A deploy following the seed can surface real wiring gaps a data-only
   check won't catch.** After seeding, verifying the actual cert detail
   pages live turned up `certificationExamTypeMap` genuinely missing entries
   for `aws-saa`/`comptia-sec-plus` (a 2-line fix, deployed the same
   session) — the papers existed and `/question-bank` already listed them,
   but their own certification pages showed no Practice Exams section at
   all until that map was extended. Checking the specific UI surface a
   new exam_type is supposed to appear on — not just "did the insert
   succeed" — is what catches this class of gap.

## Where the actual SQL files live

`docs/aws_saa_seed_paper_{1..10}.sql` and `docs/secplus_seed_paper_{1..10}.sql`
(this session's full batch, seeded and live), `docs/bchhc_seed_papers_1_6.sql`
and `docs/bchhc_seed_papers_7_10.sql` (pre-existing, already live). No seed
files exist yet for Kubernetes/Terraform/Docker/Ansible — those were seeded
directly, before this file-based-record convention was established; if they
ever need to be regenerated or extended, there is no existing `.sql` record
to build from, only the live database rows themselves.
