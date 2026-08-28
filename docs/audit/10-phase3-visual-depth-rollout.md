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

Batch 1 was fully verified live and deployed (Version ID
`c6cf21f8-68d4-4f71-b849-3c1ba238bd9d`). While verifying live, found and fixed
a real flakiness bug in the verification method itself: `ThemeProvider.tsx`
applies the `light` class inside a mount-time `useEffect`, so directly poking
`classList` (the original approach in `scripts/verify-diagram-theming.mjs`)
races that effect and produces false-negative "colors didn't differ" results
intermittently. Fixed by clicking the real `aria-label="Toggle theme"` button
instead — same code path a real user triggers, no race. Confirmed stable
across repeated runs after the fix. See commit `091df04`.

**Batch 2** (2026-08-27): git, linux, ansible, prometheus, grafana, terraform
— overview.md only, one file per technology (all 6 self-contained overview
pages, not a fundamentals/intermediate continuation like batch 1). Status:
**done** — content, predeploy/typecheck, and full live Playwright dark/light
verification all clean (WSL networking was blocked by VPN interference
partway through the first verification pass; resumed and completed once
access returned).

| Technology | overview.md | Notes |
|---|---|---|
| git | **content done (batch 2)** — FlowDiagram (working-tree→staging→repo→remote), ConceptBoxGrid (3 branching strategies) | self-mapped; live-verified ✅ before VPN block |
| linux | **content done (batch 2)** — added prerequisite line + kernel/Bash grounding (previously missing), ConceptBoxGrid (USE method) | self-mapped; live-verified ✅ before VPN block |
| ansible | **content done (batch 2)** — FlowDiagram (control node→SSH→managed nodes), ConceptBoxGrid (Ansible vs Chef/Puppet/SaltStack) | infrastructure/ansible alias; live-verified ✅ |
| prometheus | **content done (batch 2)** — stack FlowDiagram (6-step scrape→alert pipeline), ConceptBoxGrid (4 metric types) | infrastructure/prometheus alias; live-verified ✅ |
| grafana | **content done (batch 2)** — ConceptBoxGrid (8 dashboard panel types) | infrastructure/grafana alias; live-verified ✅ |
| terraform | **content done (batch 2)** — ConceptBoxGrid (Terraform vs CloudFormation/Ansible/Pulumi/CDK), FlowDiagram (init→plan→apply→destroy) | infrastructure/terraform alias; live-verified ✅. Note: a code-fence edit initially broke this file's structure (closed a bash block early, orphaning the "State operations" section as unfenced text) — caught via a fence-balance grep check and fixed before commit. Worth doing that same balance check on any edit that inserts a new fenced block mid-existing-block. |

**Batch 3** (2026-08-27): github-actions, argocd, helm, jenkins, nginx, python
— overview.md only. Status: **done** — content, predeploy/typecheck, and full
live Playwright dark/light verification all clean.

| Technology | overview.md | Notes |
|---|---|---|
| github-actions | **content done (batch 3)** — added prerequisite line + CI/CD grounding (previously missing), removed a stray leftover `​```bash\n1\n​```​` artifact found in the source, FlowDiagram (test/scan parallel → deploy) | self-mapped; live-verified ✅ |
| argocd | **content done (batch 3)** — ConceptBoxGrid (4 GitOps principles), FlowDiagram (git push→ArgoCD watches→drift→sync) | infrastructure/argocd alias; live-verified ✅ |
| helm | **content done (batch 3)** — stack FlowDiagram (Chart+Values=Rendered YAML→cluster) | infrastructure/helm alias; live-verified ✅ |
| jenkins | **content done (batch 3)** — FlowDiagram (git push→controller→agents→registry→k8s) | infrastructure/jenkins alias; live-verified ✅ |
| nginx | **content done (batch 3)** — added front-desk analogy (previously missing), ConceptBoxGrid (6 core functions) | infrastructure/nginx alias; live-verified ✅ |
| python | **content done (batch 3)** — ConceptBoxGrid (Bash vs Python decision rule) | infrastructure/python alias; live-verified ✅ |

**Batch 4** (2026-08-27): cicd, fluxcd, gitlab-ci, istio, tekton, shell-scripting
— overview.md only. Status: **done** — content, predeploy/typecheck, JSON
block validation, and full live Playwright dark/light verification all clean.

| Technology | overview.md | Notes |
|---|---|---|
| cicd | **content done (batch 4)** — FlowDiagram (commit→build→test→package→staging→production), ConceptBoxGrid (4 deployment strategies) | self-mapped; live-verified ✅ |
| fluxcd | **content done (batch 4)** — added prerequisite line cross-referencing ArgoCD for GitOps grounding (previously missing), FlowDiagram (GitOps loop), ConceptBoxGrid (5 Flux controllers) | self-mapped; live-verified ✅ |
| gitlab-ci | **content done (batch 4)** — added prerequisite line + grounding (previously missing), ConceptBoxGrid (3 runner executor types) | self-mapped; live-verified ✅ |
| istio | **content done (batch 4)** — FlowDiagram (control plane → Envoy sidecar push), ConceptBoxGrid (Istio vs Linkerd) | self-mapped; live-verified ✅ |
| tekton | **content done (batch 4)** — added prerequisite line + grounding vs. server-based CI/CD (previously missing), FlowDiagram (Task→Pipeline→PipelineRun→Trigger) | self-mapped; live-verified ✅ |
| shell-scripting | **content done (batch 4)** — stack FlowDiagram (5-step script execution order, replacing the ASCII box diagram) | infrastructure/shell-scripting alias; live-verified ✅ |

**Batch 5** (2026-08-27): ebpf, harbor, keda, elk-stack, kafka, platform-engineering
— overview.md only. Status: **done** — content, predeploy/typecheck, JSON block
validation, and full live Playwright dark/light verification all clean.

| Technology | overview.md | Notes |
|---|---|---|
| ebpf | **content done (batch 5)** — added prerequisite line + kernel-level grounding (previously missing), ConceptBoxGrid (5 eBPF-based tools) | self-mapped; live-verified ✅ |
| harbor | **content done (batch 5)** — added prerequisite line + registry grounding (previously missing), FlowDiagram (3-layer scanning) | self-mapped; live-verified ✅. Note: same fence-closing mistake as terraform in batch 2 — caught and fixed via the fence-balance check before commit. |
| keda | **content done (batch 5)** — added prerequisite line (previously missing), ConceptBoxGrid (4 trigger types) | self-mapped; live-verified ✅ |
| elk-stack | **content done (batch 5)** — stack FlowDiagram (6-step log pipeline), ConceptBoxGrid (5 Elasticsearch fundamentals terms) | infrastructure/elk-stack alias; live-verified ✅ |
| kafka | **content done (batch 5)** — ConceptBoxGrid (Kafka vs RabbitMQ) | self-mapped; live-verified ✅ |
| platform-engineering | **content done (batch 5)** — added prerequisite line (previously missing), ConceptBoxGrid (DevOps vs SRE vs Platform Engineering) | self-mapped; live-verified ✅ |

**Batch 6** (2026-08-27): vault, trivy, sonarqube, backstage, datadog, loki —
overview.md only. Status: **done** — content, predeploy/typecheck (including
the new automated fence check), JSON block validation, and full live
Playwright dark/light verification all clean.

As predicted, vault/trivy/sonarqube (built earlier this session, pre-Phase-3)
and backstage/datadog/loki (also pre-existing, high quality) needed only a
prerequisite-line + visuals pass, not a rewrite — this batch moved noticeably
faster than batches needing real depth-rubric work.

| Technology | overview.md | Notes |
|---|---|---|
| vault | **content done (batch 6)** — added prerequisite line (previously missing), FlowDiagram (auth→token→secrets engine), ConceptBoxGrid (KV/database/PKI engines) | self-mapped; live-verified ✅ |
| trivy | **content done (batch 6)** — added prerequisite line (previously missing), ConceptBoxGrid (4 scan types) | self-mapped; live-verified ✅ |
| sonarqube | **content done (batch 6)** — added prerequisite line + static-analysis grounding (previously missing), ConceptBoxGrid (4 issue types) | self-mapped; live-verified ✅ |
| backstage | **content done (batch 6)** — added prerequisite line (previously missing), ConceptBoxGrid (Catalog/Templates/TechDocs/Plugins) | self-mapped; live-verified ✅ |
| datadog | **content done (batch 6)** — added prerequisite line cross-referencing Prometheus/Grafana/ELK (previously missing), ConceptBoxGrid (tool-mapping grid). Also fixed a real pre-existing defect: stray quadruple-backslash (`\\\\`) artifacts in bash line-continuations that would break if copy-pasted — should be single `\` | self-mapped; live-verified ✅ |
| loki | **content done (batch 6)** — added prerequisite line cross-referencing Prometheus/Grafana (previously missing), ConceptBoxGrid (3 observability pillars). Also fixed the same double-backslash artifact class (a YAML value and a regex pattern) | self-mapped; live-verified ✅ |

**Flagged, not fixed — backlog item found during batch 6:** the same
double-backslash artifact (`\\` where a single `\` was intended, in bash
line-continuations and YAML/regex values) exists in at least 18 content files
across multiple academies, most not touched this session:
`cloud/azure-devops/intermediate.md`, `cloud/multi-cloud/overview.md`,
`data/python-mis/overview.md`, `devops/gitlab-ci/fundamentals.md`,
`devops/gitlab-ci/troubleshooting.md`, `security/devsecops/overview.md`,
`security/ethical-hacking/intermediate.md`, `security/soc/certification.md`,
and others (`grep -rl '\\\\\\\\' public/content/` finds the full current
list — `devops/argo-rollouts/overview.md` and `devops/ha-dr/overview.md`
were fixed inline in batch 7 below since already being edited, and are no
longer on this list). Likely the same generation/edit pass that caused the
literal-`\n` bug found in Part 2. Not fixed wholesale — out of scope for a
depth-rubric batch, flagged for a dedicated cleanup pass. Lower severity
than the fence/newline bugs (doesn't break rendering, just makes example
commands wrong if copy-pasted verbatim).

**Batch 7 — final DevOps batch** (2026-08-28): argo-rollouts, ha-dr,
incident, chaos-engineering, capacity-planning, automation, splunk,
openshift — overview.md only. Status: **done** — content, predeploy
(including the fence check), JSON block validation for every new
`flow`/`conceptgrid` block, and a full live Playwright dark/light + crash
verification cycle (all 8 pages) all clean. Academies dropdown hover
verified separately. **This completes the DevOps academy's overview.md
pass — all 41 DevOps technologies now have the depth-rubric + visual
treatment on overview.md.**

| Technology | overview.md | Notes |
|---|---|---|
| argo-rollouts | **content done (batch 7)** — added prerequisite line (previously missing), fixed a double-backslash artifact, FlowDiagram (canary weight → analysis → pass/rollback) | self-mapped; live-verified ✅ |
| ha-dr | **content done (batch 7)** — already had a prerequisite line, fixed several double-backslash artifacts (Azure CLI failover/scale/traffic-manager commands), ConceptBoxGrid (4 DR strategies: Backup&Restore/Pilot Light/Warm Standby/Active-Active) | self-mapped; live-verified ✅ |
| incident | **content done (batch 7)** — already had a prerequisite line and strong existing content (P1-P4 severity, 6-phase framework, blameless post-mortem), added ConceptBoxGrid (P1-P4 severity matrix) and stack FlowDiagram (6-phase incident response framework) | self-mapped; live-verified ✅ |
| chaos-engineering | **content done (batch 7)** — already had a prerequisite line, added stack FlowDiagram (7-step scientific method loop) and ConceptBoxGrid (Infrastructure/Network/Application experiment categories) | self-mapped; live-verified ✅ |
| capacity-planning | **content done (batch 7)** — already had a prerequisite line, added FlowDiagram (5-step capacity planning loop) and ConceptBoxGrid (Load/Stress/Soak testing) | self-mapped; live-verified ✅ |
| automation | **content done (batch 7)** — already had a prerequisite line, added ConceptBoxGrid (5 SRE automation types) | self-mapped; live-verified ✅ |
| splunk | **content done (batch 7)** — added prerequisite line (previously missing), converted the existing hand-drawn ASCII architecture diagram to a FlowDiagram, added ConceptBoxGrid (Enterprise/Cloud/Free tier comparison) | self-mapped; live-verified ✅ |
| openshift | **content done (batch 7)** — already had a prerequisite line, added ConceptBoxGrid (4 OCP node types) | `devops/openshift/overview` aliases to `infrastructure/openshift/overview.md` — edited the infrastructure/ copy, confirmed via registry grep; live-verified ✅ |

Other DevOps tiers (advanced.md, roadmap.md, etc.) not yet tracked
per-technology — will be added to this table if/when the depth-rubric+visual
treatment expands to those tiers.
