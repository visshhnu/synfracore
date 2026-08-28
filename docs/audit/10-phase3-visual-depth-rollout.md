# Phase 3 — Visual + Depth-Rubric Rollout Tracker

**Started:** 2026-08-27
**Purpose:** track progress of the platform-wide rollout of the depth-rubric
content standard (Tier 0 = zero-jargon beginner grounding, terms defined
inline at first use, explicit prerequisites) and the FlowDiagram/ConceptBoxGrid
visual components (`components/tech/FlowDiagram.tsx`,
`components/tech/ConceptBoxGrid.tsx`, wired into `renderMarkdown()` in
`components/tech/SectionContent.tsx` via ` ```flow ` / ` ```conceptgrid `
fenced blocks), across every technology on the platform. Read this file
before starting a new Phase 3 batch — do not re-derive what's already done
by re-scanning content from scratch.

**Prior phases (context, not tracked in the table below):**
- **Phase 0** (2026-08-27): audit only. Found 5/304 technologies had any
  diagram, 5-tech gap-check done. Full report in chat history, not a separate
  doc.
- **Phase 1** (2026-08-27): built `FlowDiagram`/`ConceptBoxGrid`, retrofitted
  the 5 pre-existing hand-SVG pages onto them (`ai/ai-fundamentals`,
  `cloud/aws-vpc`, and the 3 `infrastructure/*` pages aliased into
  `devops/{kubernetes,docker,networking}` — **overview.md only**).
- **Phase 2** (2026-08-27): pilot combining depth-rubric rewrite + visuals on
  4 technologies spanning previously-visual-empty academies: `healthcare/cpt`,
  `security/security-fundamentals`, `databases/sql`, `databases/mongodb`
  (all overview.md). Also fixed a live production bug found along the way —
  `quiz_questions.options` stored as a JSON string across all 189
  Healthcare-academy rows, crashing any page with a quiz widget
  (`lib/supabase/queries.ts`, defensive parse, no DB write).

## Rubric variants — read before starting an academy

**Standard variant** (used for CPT/Security Fundamentals/SQL/MongoDB in
Phase 2): Tier 0 (`overview.md`) must ground "why does this exist" with a
concrete real-world analogy, assume zero prior background, define every
technical term inline at first use, and state prerequisites explicitly.
Applies to: DevOps, Cloud, AI, Databases, Healthcare, Security, Data/BI,
Education, and all tail-vertical academies.

**Exam-prep variant** — applies ONLY to the exam-prep cluster (`exams`,
`central-exams`, `state-psc`, `professional-certs`): use **lighter** Tier-0
grounding. A learner searching for exam-prep content has already decided to
take that exam — don't spend space re-explaining why the exam exists or
over-defining terms someone preparing for it likely already knows. Technical
terms specific to the exam's subject matter still need definitions (same
zero-jargon discipline), but the "why does this exist, real-world analogy"
framing that CPT/SQL needed is not required here. **Visual components are
still fully in scope** — exam-stage timelines and syllabus breakdowns are
natural `FlowDiagram`/`ConceptBoxGrid` fits. Do not apply the standard
variant's full grounding treatment here by default — it was flagged as a
mismatch during Phase 3 planning, not yet re-confirmed with the user for
each sub-academy.

## Known complications — check before starting an academy

- **DevOps**: `public/content/infrastructure/*` is a physical-file backing
  store aliased into several `devops/*` technology slugs via the content
  registry (`lib/content/index.ts`) — NOT a registered academy itself (it's
  the one top-level `public/content/` directory with no matching academy
  slug). Before starting work on any DevOps technology, live-grep for a
  duplicate `infrastructure/<slug>` or `devops/<slug>` counterpart — the
  same discipline that caught and fixed the `azure-devops` duplicate
  (deleted `devops/azure-devops`, kept `cloud/azure-devops` as canonical)
  earlier this engagement. Don't assume a technology is duplicate-free
  without checking.
- **Cloud**: same aliasing risk, one confirmed precedent (`azure-devops`).
  Live-grep-check each technology the same way.
- **Education**: standing memory flags `os/dbms/cn/system-design/
  placement-prep` intermediate+advanced.md as unedited generic-template
  stubs, not real content — these need a genuine content build, not just a
  depth-rubric polish pass. Check `docs/audit/09-contentscope-classification.md`
  and the `project_education_generic_template_stub_gap` memory before
  assuming this academy is polish-only.
- **Other academies**: not yet individually re-audited for orphan/duplicate
  slugs beyond the top-level directory check done during Phase 3 planning.
  Absence of a note here is not confirmation of cleanliness — check live if
  something looks off, same as every other "don't assume, verify" pattern
  established this engagement.

## Pacing model (established Phase 3 planning, 2026-08-27)

- Batch size: 4-6 technologies/session as default; 3-4 for academies needing
  heavy depth-rubric rework (undefined terms, no grounding); 6-8 for content
  already reasonably grounded and mainly needing visuals.
- Verification: `predeploy`/typecheck per-technology (fast, catches errors
  immediately). Full native-WSL build + Playwright dark/light + crash
  verification runs **once per batch**, immediately before that batch's
  commit/deploy — not once per technology (Phase 2's per-technology cadence
  was deliberately slower for pilot-validation purposes; not the ongoing
  model).

---

## Academy rollout order

| Order | Academy | Techs | Status | Complication |
|---|---|---|---|---|
| 1 | DevOps | 41 | **In progress** — see table below | infrastructure/* aliasing |
| 2 | Cloud | 26 | Not started (1 tech done: aws-vpc, Phase 1) | azure-devops-style aliasing risk |
| 3 | AI | 9 | Not started (1 tech done: ai-fundamentals, Phase 1) | None known |
| 4 | Exams cluster (exams, central-exams, state-psc, professional-certs) | 26+6+6+5=43 | Not started | Exam-prep rubric variant — see above |
| 5 | Databases | 12 | Not started (2 techs done: sql, mongodb, Phase 2) | None known |
| 6 | Healthcare | 13 | Not started (1 tech done: cpt, Phase 2) | None known |
| 7 | Security | 9 | Not started (1 tech done: security-fundamentals, Phase 2) | None known |
| 8 | Data (Analytics & BI) | 14 | Not started | None known |
| 9 | Education | 12 | Not started | Generic-template stubs, see above |
| 10+ | Essentials, Law, Finance, Agriculture, Telecom, Economics, Aerospace, VLSI | 10/10/12/7/7/7/8/8 | Not started | None known |

## DevOps — technology-level tracking (41 technologies)

Batch 1 (2026-08-27): kubernetes, docker, networking — fundamentals.md +
intermediate.md. Status: **done**.

**Important correction found during batch 1** — the "infrastructure/kubernetes
alias" note below (carried over from Phase 3 planning) turned out to be only
partially right. Live-checking the registry (`lib/content/index.ts`) before
editing revealed the aliasing is **per-tier, not per-technology**:
`overview`/`fundamentals`/`intermediate` for kubernetes and docker, and
`overview`/`fundamentals` for networking, are genuinely self-mapped to their
own real files directly under `devops/*` (confirmed via git history — these
already had substantial, high-quality, pre-existing content from earlier in
this engagement, predating today's Phase 0-3 work, plus a `devops/*`-targeted
diagram commit from Phase 1 that a since-superseded summary had mis-attributed
to `infrastructure/*` alone). Only `devops/networking/intermediate`
specifically is aliased to `infrastructure/networking/intermediate.md` (no
`devops/networking/intermediate.md` file exists at all). **Lesson for future
batches**: live-grep the registry mapping per file, not per technology —
aliasing can differ tier-by-tier within the same technology.

Content quality for all 6 files was already at the depth-rubric bar (real
definitions, real "Assumed from Overview" prerequisite chaining, no
undefined-term violations found) — this batch was visuals-only, no rewrite
needed, confirming the Step 2 pacing prediction that already-grounded content
batches faster.

| Technology | overview.md | fundamentals.md | intermediate.md | Notes |
|---|---|---|---|---|
| kubernetes | done (Phase 1) | **done (batch 1)** — ConceptBoxGrid, ConfigMap vs Secret | **done (batch 1)** — ConceptBoxGrid, Service types | self-mapped, not infrastructure-aliased for these 3 tiers |
| docker | done (Phase 1) | **done (batch 1)** — ConceptBoxGrid, Volume vs Bind Mount | **done (batch 1)** — FlowDiagram, multi-stage build | self-mapped, not infrastructure-aliased for these 3 tiers |
| networking | done (Phase 1) | **done (batch 1)** — ConceptBoxGrid, L4 vs L7 LB | **done (batch 1)** — ConceptBoxGrid, LB algorithms | fundamentals self-mapped; intermediate genuinely aliased to infrastructure/networking/intermediate.md (edited there) |
| linux | not started | not started | not started | |
| shell-scripting | not started | not started | not started | |
| helm | not started | not started | not started | |
| istio | not started | not started | not started | |
| ebpf | not started | not started | not started | |
| harbor | not started | not started | not started | |
| keda | not started | not started | not started | |
| cicd | not started | not started | not started | |
| git | not started | not started | not started | |
| jenkins | not started | not started | not started | |
| argocd | not started | not started | not started | |
| argo-rollouts | not started | not started | not started | |
| gitlab-ci | not started | not started | not started | |
| fluxcd | not started | not started | not started | |
| tekton | not started | not started | not started | |
| github-actions | not started | not started | not started | |
| terraform | not started | not started | not started | infrastructure/terraform alias |
| ansible | not started | not started | not started | |
| prometheus | not started | not started | not started | |
| grafana | not started | not started | not started | |
| elk-stack | not started | not started | not started | |
| ha-dr | not started | not started | not started | |
| incident | not started | not started | not started | |
| chaos-engineering | not started | not started | not started | |
| capacity-planning | not started | not started | not started | |
| automation | not started | not started | not started | |
| kafka | not started | not started | not started | |
| platform-engineering | not started | not started | not started | |
| backstage | not started | not started | not started | |
| datadog | not started | not started | not started | |
| loki | not started | not started | not started | |
| splunk | not started | not started | not started | |
| python | not started | not started | not started | |
| nginx | not started | not started | not started | |
| openshift | not started | not started | not started | |
| vault | not started | not started | not started | |
| trivy | not started | not started | not started | |
| sonarqube | not started | not started | not started | |

Other DevOps tiers (advanced.md, roadmap.md, etc.) not yet tracked
per-technology — will be added to this table if/when the depth-rubric+visual
treatment expands to those tiers.
