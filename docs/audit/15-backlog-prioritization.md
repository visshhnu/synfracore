# Backlog Prioritization — 2026-09-03

A status check across 11 candidate backlog items, ranked by value-per-effort,
with each premise verified directly against current file/content state
rather than trusted as-described — same discipline as the render-location
correction in `docs/audit/13-brand-logo-rollout.md`. Several turned out
stale or wrong.

## Dropped — already done or not pursuing

- **Education stubs** (os/dbms/cn/system-design/placement-prep
  intermediate+advanced) — verified all 10 files directly: real,
  topic-specific worked examples (subnetting, Banker's algorithm, BCNF
  decomposition, consistent hashing, DP), 750-1150 words each. Already
  complete; the earlier "unedited template" finding is stale.
- **Data/BI stubs** (dbt/airflow/spark overview) — verified all 3 directly:
  full beginner-ready structure (hook, analogy, real code, diagram, working
  "try it"). Already complete.
- **Telecom telco wrong-product** — verified all 4 tabs (overview/
  fundamentals/intermediate/interview): consistently about the telecom
  industry (spectrum licensing, interconnection billing, OSS/BSS), not a
  misplaced technical topic. Already fixed.
- **Interview Prep placeholders (~155, 16 files)** — could not locate the
  described artifact. Checked all 285 `interview.md` files sitewide for
  placeholder patterns (none found), checked `app/` for a dedicated
  Interview Prep feature (none exists). The only "155" reference anywhere
  in the repo is an unrelated, already-fixed architecture finding (brace-
  expansion directory bug, `docs/audit/01`). Dropped as a stale/confused
  reference — not pursuing without a concrete pointer to the actual files.

## Corrected, not dropped

- **Istio missing tabs** — real gap was 3 tabs (`advanced`, `certification`,
  `intermediate`), not 6 of 10. The existing 12 tabs already carried
  substantial real content. Built this pass — see below.

## This session's batch — built, verified, deployed

1. **Score gauge** (`components/question-bank/ResultsSummary.tsx`) — a
   static SVG circular-progress ring replacing the plain text score
   display on every exam Results page. Pure Server Component (no client
   JS needed — results are already fully known at render time), reuses
   the existing pct-based color thresholds (`#10B981`/`#F59E0B`/`#EF4444`)
   already used elsewhere in the same file. Verified via a standalone
   static-HTML harness against the real `--border`/`--text-4` CSS variable
   values from `app/globals.css`, both themes, before deploying (browser
   isn't attachable to a real signed-in attempt without a disposable test
   account, so this substituted a component-level visual check driven by
   the actual production CSS values rather than skipping verification).
2. **Istio's 3 missing tabs** (`public/content/devops/istio/`):
   - `intermediate.md` — ambient mode (ztunnel/waypoint), multi-cluster
     mesh topology, `EnvoyFilter`, `Sidecar` resource scoping.
   - `advanced.md` — deep `istioctl` diagnostics, a real conflicting-
     VirtualService root-cause pattern, sidecar performance overhead,
     Flagger-automated canary analysis, JWT-based `RequestAuthentication`.
   - `certification.md` — the **Istio Certified Associate (ICA)**, a real
     Linux Foundation/CNCF exam, confirmed via live web search before
     writing (not assumed) since no other CNCF-adjacent technology on this
     site — Prometheus, Helm, ArgoCD, Kafka, Linux — has a certification
     tab, which was itself the signal to verify rather than assume Istio
     has one too. Domain weightings (Traffic Management 35%, Securing
     Workloads 25%, Installation/Upgrade 20%, Troubleshooting 20%), format
     (2hr, open-book, hands-on + MCQ, 68% pass), sourced from
     `training.linuxfoundation.org`/`devopscube.com` — flagged inline as
     `(needs verification — recheck against current source)` per CLAUDE.md's
     Volatile Core policy, since certification programs revise pricing and
     curricula periodically.
   - `lib/content/index.ts` regenerated via the real generator
     (`npm run generate:content-registry`, run natively in WSL per the
     standing content-registry regen policy) — diffed to confirm exactly 3
     new entries added, zero drops, before committing.

## Held for separate phased treatment — not started this checkpoint

- **20 DevOps technologies with zero quiz content** (networking, istio,
  ebpf, harbor, keda, cicd, gitlab-ci, fluxcd, tekton, github-actions,
  ha-dr, incident, chaos-engineering, capacity-planning, automation, kafka,
  platform-engineering, datadog, loki, splunk) — confirmed accurate and
  current (the exact corrected list from `docs/audit/07` post-Phase-A).
  ~400 questions to author; large enough for its own phased batch like
  `docs/audit/12`.
- **SSC/Banking premium papers** — lesson content exists (400-900
  words/topic) but lacks the beginner-ready hook/analogy/try-it structure
  CLAUDE.md requires; premise holds. Two-stage effort (fix lesson depth
  first, then author premium papers on top) — don't build premium papers
  on the current thin lessons.
- **Roadmap tree-redesign pilot build** — draft exists
  (`docs/audit/14-roadmap-tree-redesign.md`), zero component code written.
  Deferred until higher-reach items are done.
- **AWS/Azure real brand logos** — confirmed zero simple-icons coverage
  for AWS/Azure and every individual service under both (real trademark-
  related exclusion, not a gap to eventually fill from the same source).
  Would need an entirely separate asset pipeline (official brand press-
  kit SVGs, not npm) plus a licensing/usage-guideline review — real new
  infrastructure cost for a purely cosmetic gap. Lowest value-per-effort
  on the list.

## Held items — progress (2026-09-03 continuation)

**Item 1 (20 DevOps zero-quiz technologies) — CLOSED.** Queried the live DB
directly before authoring anything: all 20 already had full or
intentionally-sized coverage except `istio` (only had overview+fundamentals
because intermediate/advanced didn't exist until this session's earlier
content batch). Authored 10 questions for istio's gap, verified via the
full pipeline (within-file dedup, cross-DB collision check against all
25,042 live UUIDs), applied. Net effort: ~10 questions instead of the
originally-scoped ~400 — premise was 95% already stale.

**Item 2 (SSC/Banking) — 2a and first premium papers done.**
- 2a: Initially misdiagnosed the `/learn/ssc/*`/`/learn/banking/*` content
  (33 files, rewritten with hook/analogy/diagram/try-it) as orphaned/
  unreachable — that was a genuine diagnostic error on my part, corrected
  after tracing the real route (`app/learn/[board]/[subject]/[chapter]`,
  backed by `lib/data/education.ts`'s `sscSubjects`/`bankingSubjects`).
  They were live and correct all along. Separately, also patched the
  `/academies/exams/banking-ssc/*` shared technologies (`quant-aptitude`,
  `reasoning-ability`, `english-language`, `banking-awareness`, `ssc-exam`,
  `banking-exam` — 9 files) for the same missing-Analogy/Try-It gap.
- 2b: Two full premium papers built and deployed, same pipeline as NEET/
  JEE/HAL (fresh-UUID fill, cross-file collision check, stem-registry
  dedup, generator's own distractor-language scan):
  - **SSC CGL Tier 1 Full Mock Paper 1** — 100 questions, real structure
    (4 sections x 25: Reasoning/GA/Quant/English, 200 marks, -0.5 negative
    per section 1-3, matching the researched current SSC pattern).
  - **IBPS PO Prelims Full Mock Paper 1** — 89 questions (Reasoning 39/
    Quant 25/English 25, close to but not exactly the real 40/30/30 split
    — logged here rather than silently presented as exact), -0.25 negative
    per the researched current IBPS pattern.
  - Both added to `examTypeGroupMap` (`ssc-cgl`, `ibps-po`) so they group
    correctly in the `/question-bank` catalog.
  - Caught and fixed 4 real authoring bugs before applying (2 malformed
    `correct` fields from copy-paste artifacts, 2 wrong answer indices from
    arithmetic slips) — none reached production, all caught by the
    generator's own checks plus a manual re-read.
  - Noted, not caused by this work: a pre-existing React hydration error
    (#418) on the Start-button-to-sign-in-redirect flow, confirmed
    identical on an unrelated already-live paper (Ansible) — sitewide
    pre-existing quirk, not a regression.
- **Not yet done**: additional SSC/Banking premium papers beyond these two
  flagships (SSC CHSL, IBPS Clerk, SBI PO, etc.) — same pattern, more
  volume, left for a future batch given the scale already covered this
  session.

## Next up (approved, not started)

**Essentials domain-sensitivity fact-check pass** — confirmed 8 of 10
essentials domains (`daily-movement`, `first-aid`, `gut-health`,
`human-essentials`, `hygiene`, `mental-health`, `nutrition`,
`personal-finance`, `sleep-health` minus the 2 already tagged) contain
specific numeric health/safety claims (dosages, BMI thresholds, blood
pressure ranges) but only `gut-health` and `mental-health` carry the
`(needs verification)` tag CLAUDE.md's own Volatile Core policy requires
for this class of content. 7 files are currently non-compliant with the
project's own written rule — a real, not cosmetic, gap. This is the
approved next piece of work.
