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
| 1 | DevOps | 41 | **Done** (2026-08-28, batch 7) — see table below | infrastructure/* aliasing |
| 2 | Cloud | 25 (not 26 — `terraform` doesn't belong to Cloud, see orphan finding below) | **Done** (2026-08-28, batch 4) — see table below | azure-devops-style aliasing risk (confirmed once, resolved); also surfaced an orphaned-content case (`cloud/terraform`), see below |
| 3 | AI | 9 | **Done** (2026-08-28, batch 1) — see table below | None found — all 9 self-mapped, no aliasing |
| 4 | Exams cluster (exams, central-exams, state-psc, professional-certs) | 26+5+5+4=40 | **Done** (2026-08-28, batch 7) — see table below | Exam-prep rubric variant — see above; surfaced and fixed 2 real live-production bugs (cloud/terraform orphan, gate-ece stale alias), see below |
| 5 | Databases | 12 | **Done** (2026-08-28, batch 2) — see table below | None found — all self-mapped, no aliasing |
| 6 | Healthcare | 13 | **Done** (2026-08-28, batch 2) — see table below | None found — all self-mapped, no aliasing; BCHHC mock-exam data permanently excluded (see feedback memory), respected throughout |
| 7 | Security | 9 | **Done** (2026-08-28, batch 1) — see table below | None found — all 8 self-mapped, no aliasing |
| 8 | Data (Analytics & BI) | 14 | **13/14 done, deployed live** (2026-08-28) — see table below | dbt/airflow/spark are generic-template stubs, flagged and deferred (need real content authoring, not just visuals) — 13/14 otherwise self-mapped, no aliasing |
| 9 | Education | 12 | **12/12 overview.md pass done** (2026-08-28) — see table below | Deeper intermediate/advanced-tier stub gap known for os/dbms/cn/system-design/placement-prep — still open, unrelated to this overview.md pass; all 12 overview.md files confirmed real content, no aliasing |
| 10 | Essentials | 10 | **10/10 done** (2026-08-28) — see table below | **Live content bug found + fixed**: mental-health/overview.md was serving Sleep content, not mental-health content — rewritten from scratch |
| 11 | Law | 9 (corrected from an earlier unverified estimate of 12) | **9/9 done** (2026-08-28) — see table below | None found — all self-mapped, no aliasing |
| 12 | Finance | 11 (corrected from a stated estimate of 12) | **11/11 done** (2026-08-28) — see table below | None found — all self-mapped, no aliasing |
| 13 | Agriculture | 6 (corrected from a stated estimate of 7) | **6/6 done** (2026-08-28) — see table below | None found — all self-mapped, no aliasing |
| 14+ | Telecom, Economics, Aerospace, VLSI | 7/7/8/8 | Not started | None known |

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

---

## Cloud — technology-level tracking (25 technologies — see orphaned `terraform` finding in batch 4 below; not a real 26th Cloud technology)

Same aliasing risk as DevOps's infrastructure/* pattern: `azure-devops` was
already found duplicated between `cloud/azure-devops` and `devops/azure-devops`
earlier this engagement (kept `cloud/azure-devops` as canonical, deleted the
DevOps duplicate). Every file's registry mapping is live-grepped individually
before editing, not assumed from the technology name.

**Batch 1** (2026-08-28): aws-ec2, aws-s3, aws-iam, aws-lambda, aws-rds —
overview.md only. Status: **done** — content, predeploy (fence check),
JSON block validation, and full live Playwright dark/light + crash
verification cycle all clean. Academies dropdown hover verified separately.

| Technology | overview.md | Notes |
|---|---|---|
| aws-ec2 | **content done (batch 1)** — added analogy + try-it prompt (previously missing, now fully depth-rubric complete), FlowDiagram (instance lifecycle), ConceptBoxGrid (AMI/Security Groups/Key Pairs/Elastic IP) | self-mapped; live-verified ✅ |
| aws-s3 | **content done (batch 1)** — already fully depth-rubric complete (hook/analogy/diagram/example/try-it), converted the existing ASCII request-flow diagram to a FlowDiagram, added ConceptBoxGrid (storage class tiers) | self-mapped; live-verified ✅ |
| aws-iam | **content done (batch 1)** — added hook + analogy + try-it prompt (previously missing, now fully depth-rubric complete), converted the existing ASCII policy-evaluation diagram to a FlowDiagram, added ConceptBoxGrid (Users/Groups/Roles/Policies) | self-mapped; live-verified ✅ |
| aws-lambda | **content done (batch 1)** — already fully depth-rubric complete (hook/analogy/diagram/try-it), converted the existing ASCII event-source diagram to a FlowDiagram, added ConceptBoxGrid (cold-start optimization strategies) | self-mapped; live-verified ✅ |
| aws-rds | **content done (batch 1)** — already had analogy/diagram/try-it, converted the existing ASCII architecture diagram to a stack FlowDiagram, added ConceptBoxGrid (RDS vs Aurora vs Self-Managed) | self-mapped; live-verified ✅ |

No double-backslash or fence-imbalance defects found in this batch.

**Batch 2** (2026-08-28): aws, azure, aws-eks, azure-aks, azure-devops,
architecture-patterns — overview.md only. Status: **done** — content,
predeploy (fence check), JSON block validation, and full live Playwright
dark/light + crash verification cycle all clean. Academies dropdown hover
verified separately.

| Technology | overview.md | Notes |
|---|---|---|
| aws | **content done (batch 2)** — added hook + analogy + try-it prompt (previously missing, now fully depth-rubric complete), ConceptBoxGrid (Compute/Storage/Networking/Database/IAM) | self-mapped; live-verified ✅ |
| azure | **content done (batch 2)** — already fully depth-rubric complete (hook/analogy/diagram/try-it), converted the existing ASCII hierarchy diagram to a stack FlowDiagram, added ConceptBoxGrid (Identity/Compute/Storage/Networking/Monitor) | self-mapped; live-verified ✅ |
| aws-eks | **content done (batch 2)** — already fully depth-rubric complete, converted the "who manages what" ASCII diagram to a ConceptBoxGrid, added FlowDiagram (4-step upgrade process) | self-mapped; live-verified ✅ |
| azure-aks | **content done (batch 2)** — already fully depth-rubric complete, converted the nested ASCII control-plane/node-pool diagram to a stack FlowDiagram, added ConceptBoxGrid (4 key AKS features) | self-mapped; live-verified ✅ |
| azure-devops | **content done (batch 2)** — already fully depth-rubric complete, converted the ASCII Boards→Repos→Pipelines→Artifacts diagram to a stack FlowDiagram, added ConceptBoxGrid (5 Azure DevOps services) | self-mapped; live-verified ✅ |
| architecture-patterns | **content done (batch 2)** — already fully depth-rubric complete, simplified the ASCII fan-out diagram to a 3-step stack FlowDiagram, added ConceptBoxGrid (6 core patterns) | self-mapped; live-verified ✅ |

No double-backslash or fence-imbalance defects found in this batch.

**Batch 3** (2026-08-28): azure-entra, azure-vms, azure-vnets, bigquery,
cloud-fundamentals, cloud-run — overview.md only. Status: **done** —
content, predeploy (fence check), JSON block validation, and full live
Playwright dark/light + crash verification cycle all clean. Academies
dropdown hover verified separately.

| Technology | overview.md | Notes |
|---|---|---|
| azure-entra | **content done (batch 3)** — already fully depth-rubric complete, converted the ASCII auth-flow diagram to a stack FlowDiagram, added ConceptBoxGrid (Tenant/User-Group/Service Principal/Managed Identity) | self-mapped; live-verified ✅ |
| azure-vms | **content done (batch 3)** — already fully depth-rubric complete, converted the ASCII provisioning diagram to a stack FlowDiagram, added ConceptBoxGrid (6 VM series) | self-mapped; live-verified ✅ |
| azure-vnets | **content done (batch 3)** — already fully depth-rubric complete, added ConceptBoxGrid (VNet/Subnets/IP Addressing/DNS) and FlowDiagram (hub-spoke architecture) | self-mapped; live-verified ✅ |
| bigquery | **content done (batch 3)** — already fully depth-rubric complete, converted the ASCII query-execution diagram to a FlowDiagram, added ConceptBoxGrid (BigQuery ML/Streaming/Federated/BI Engine) | self-mapped; live-verified ✅ |
| cloud-fundamentals | **content done (batch 3)** — already fully depth-rubric complete, replaced the 2D ASCII deployment×service matrix with two ConceptBoxGrids (4 deployment models, 4 service models) | self-mapped; live-verified ✅ |
| cloud-run | **content done (batch 3)** — already fully depth-rubric complete, converted the ASCII request-flow diagram to a FlowDiagram, added ConceptBoxGrid (4 key features) | self-mapped; live-verified ✅ |

No double-backslash or fence-imbalance defects found in this batch.

**Batch 4 — final Cloud batch** (2026-08-28): cloud-security,
cloudformation, cost-optimization, gke, landing-zones, multi-cloud,
networking-security, route53 — overview.md only. Status: **done** —
content, predeploy (fence check), JSON block validation, and full live
Playwright dark/light + crash verification cycle all clean. Academies
dropdown hover verified separately. **This completes the Cloud academy's
overview.md pass — Cloud's real technology count is 25 (not 26 — see the
orphaned-terraform finding below), all 25 now have the depth-rubric +
visual treatment.**

| Technology | overview.md | Notes |
|---|---|---|
| cloud-security | **content done (batch 4)** — already fully depth-rubric complete, converted the shared-responsibility ASCII box diagram to a ConceptBoxGrid, added a second ConceptBoxGrid (6 security pillars) | self-mapped; live-verified ✅ |
| cloudformation | **content done (batch 4)** — already fully depth-rubric complete, converted the deploy-lifecycle ASCII diagram to a FlowDiagram, added ConceptBoxGrid (Template/Stack/StackSet/Change Set) | self-mapped; live-verified ✅ |
| cost-optimization | **content done (batch 4)** — already fully depth-rubric complete, converted the waste-accumulation ASCII diagram to a FlowDiagram, added ConceptBoxGrid (On-Demand/Reserved/Savings Plan/Spot) | self-mapped; live-verified ✅ |
| gke | **content done (batch 4)** — already fully depth-rubric complete, converted the control-plane/Standard/Autopilot ASCII diagram to a ConceptBoxGrid | self-mapped; live-verified ✅ |
| landing-zones | **content done (batch 4)** — already fully depth-rubric complete, converted the without/with comparison to a ConceptBoxGrid, added a second ConceptBoxGrid (4 Control Tower OUs). Hit and fixed the fence-closing mistake live during this edit (inserting mid-block reopened as unfenced text) — caught immediately by the automated fence checker before commit, exactly the failure mode it was built for | self-mapped; live-verified ✅ |
| multi-cloud | **content done (batch 4)** — already fully depth-rubric complete, converted the Terraform/AWS/Azure ASCII diagram to a stack FlowDiagram, added ConceptBoxGrid (3 multi-cloud patterns). Also fixed a pre-existing double-backslash artifact (`ciliumclustermesh connect \\` — also had a missing space, `cilium clustermesh`) — this file was on the batch-6 double-backslash backlog list, now resolved and removed from it | self-mapped; live-verified ✅ |
| networking-security | **content done (batch 4)** — already fully depth-rubric complete, converted the subnet-layering ASCII diagram to a stack FlowDiagram, added ConceptBoxGrid (3 Zero Trust principles) | self-mapped; live-verified ✅ |
| route53 | **content done (batch 4)** — already fully depth-rubric complete, converted the DNS-resolution ASCII diagram to a FlowDiagram, added ConceptBoxGrid (6 routing policies) | self-mapped; live-verified ✅ |

**Orphaned content found, not deployed — `cloud/terraform`:**
`public/content/cloud/terraform/` is a full 6-tier content set (overview,
fundamentals, intermediate, advanced, interview, cheatsheets) that exists
on disk and is mapped in the content registry (`cloud/terraform/overview`
self-maps), but "terraform" was never registered under the Cloud academy
in `lib/data/academies.ts` — only under DevOps (`devops/terraform` →
aliases to `infrastructure/terraform/overview.md`, already depth-rubric +
visual complete since DevOps batch 2). Requesting `/academies/cloud/
terraform/overview` 307-redirects to `/academies` — confirming it is
genuinely unreachable, not just unlinked. Depth-rubric content + visuals
were added to `cloud/terraform/overview.md` before this was discovered;
per user direction (2026-08-28) the edit is being **left in the working
tree, uncommitted and undeployed** — not counted toward Cloud's technology
total. **Follow-up, not yet actioned:** user is leaning toward *deleting*
`public/content/cloud/terraform/` entirely, matching the precedent where
the `devops/azure-devops` duplicate was deleted in favor of the canonical
`cloud/azure-devops` copy earlier this engagement — DevOps's Terraform
page is already the real, live, enhanced one, so a second orphaned copy
just recreates the same duplication problem. Not acted on yet — flagged
here for a dedicated cleanup pass.

**RESOLVED 2026-08-28:** per confirmed user direction, `public/content/
cloud/terraform/` (all 6 tiers) was deleted entirely. Confirmed no other
references existed first — `lib/data/academies.ts` (navigation), `lib/
data/labs*` (labs), `next.config.ts` (redirects), and `docs/slug-aliases-
schema.sql` all came back clean; only the content registry had entries,
and those were removed by regenerating `lib/content/index.ts` via the
real generator (native WSL) per the standing regen-gate rule — diffed
against the pre-deletion registry and confirmed the only change was the
6 dead `cloud/terraform/*` entries dropping out, nothing else touched.
`npm run predeploy` clean afterward (2579 files, down from 2585).

---

## AI — technology-level tracking (9 technologies)

Registry-checked all 9 remaining technologies before editing (learned
directly from the Cloud `terraform` orphan above) — all 9 confirmed
self-mapped in the content registry AND genuinely registered under the
`ai` academy in `lib/data/academies.ts` (`foundations`/`llm-apps`/`mlops`
sections). No aliasing or orphan risk found this batch.

**Unlike DevOps/Cloud, none of these 8 files had any depth-rubric
elements** (no prerequisite line, hook, analogy, or try-it prompt) —
this was a real content-authoring batch, not primarily a visual pass,
much closer in effort to early DevOps batches than late Cloud batches.

**Batch 1 — full AI batch** (2026-08-28): ai-agents, langchain,
llm-engineering, llmops, openai, prompt-engineering, python-for-ai, rag —
overview.md only. Status: **done** — content, predeploy (fence check),
JSON block validation, and full live Playwright dark/light + crash
verification cycle all clean. Academies dropdown hover verified
separately. **This completes the AI academy's overview.md pass — all 9
AI technologies (8 this batch + ai-fundamentals from Phase 1) now have
the depth-rubric + visual treatment.**

| Technology | overview.md | Notes |
|---|---|---|
| ai-agents | **content done (batch 1)** — added prerequisite line + hook + analogy + try-it (previously missing entirely), converted the agent-loop ASCII diagram to a FlowDiagram, added ConceptBoxGrid (Memory/Tools/Planning/Action) | self-mapped; live-verified ✅ |
| langchain | **content done (batch 1)** — added prerequisite line + hook + analogy + try-it (previously missing entirely), added ConceptBoxGrid (4 core concepts). Also fixed a real pre-existing bug: the "LangChain vs Raw API" code block used escaped backtick sequences (`\`\`\``) instead of real fences, so it never rendered as a code block at all — fixed to real fences | self-mapped; live-verified ✅ |
| llm-engineering | **content done (batch 1)** — added prerequisite line + hook + analogy + try-it (previously missing entirely), converted the tokenizer/transformer ASCII diagram to a FlowDiagram, added ConceptBoxGrid (RAG vs Fine-Tuning) | self-mapped; live-verified ✅ |
| llmops | **content done (batch 1)** — added prerequisite line + hook + analogy + try-it (previously missing entirely), converted the MLOps-vs-LLMOps ASCII comparison to a ConceptBoxGrid, added a second ConceptBoxGrid (4 core LLMOps components) | self-mapped; live-verified ✅ |
| openai | **content done (batch 1)** — added prerequisite line + hook + analogy + try-it (previously missing entirely), added ConceptBoxGrid (4 model categories) | self-mapped; live-verified ✅ |
| prompt-engineering | **content done (batch 1)** — added prerequisite line + hook + analogy + try-it (previously missing entirely), added ConceptBoxGrid (5 core principles) | self-mapped; live-verified ✅ |
| python-for-ai | **content done (batch 1)** — added prerequisite line + analogy + try-it (already had an implicit hook via its "why separate from DevOps Python" framing), added ConceptBoxGrid (4 core practice areas) | self-mapped; live-verified ✅ |
| rag | **content done (batch 1)** — added prerequisite line + hook + analogy + try-it (previously missing entirely), converted both the "problem RAG solves" and RAG-architecture ASCII diagrams to FlowDiagrams | self-mapped; live-verified ✅ |

No double-backslash artifacts found in this batch (the langchain fence
bug above is a different, previously-uncatalogued defect class — escaped
literal backticks instead of real fence markers — not the `\\`
line-continuation bug tracked elsewhere in this document).

---

## Exams cluster — technology-level tracking (40 technologies: exams 26,
## central-exams 5, state-psc 5, professional-certs 4)

Uses the **exam-prep rubric variant** (see "Rubric variants" section
above): no hook/analogy/why-this-exists grounding — a learner here has
already committed to the exam. Content in this cluster already reads in
a distinct, consistent style (`What this technology covers` / `Why it
matters` / a quick-map table / `How to use this technology's sections`)
rather than the DevOps/Cloud/AI hook-analogy-diagram-tryit shape — this
batch confirmed that style already satisfies the exam-prep variant and
did not need restructuring, only visuals added on top.

Registry-checked all 4 professional-certs technologies AND confirmed
each is genuinely registered under the `professional-certs` academy in
`lib/data/academies.ts` before editing (same discipline as the AI batch,
following the Cloud `terraform` orphan lesson) — all 4 confirmed clean.

**Batch 1 — professional-certs (full academy)** (2026-08-28): pmp, itil,
scrum, six-sigma — overview.md only. Status: **done** — content,
predeploy (fence check), JSON block validation, and full live Playwright
dark/light + crash verification cycle all clean. Academies dropdown
hover verified separately. **This completes the professional-certs
academy's overview.md pass.**

Every file got the same two-visual treatment: a `ConceptBoxGrid`
converting the file's existing "quick map" comparison table (exam
domains, SVS components, certification landscape, belt hierarchy), and
a `FlowDiagram` converting the "How to use this technology's sections"
prose into a visual study-path timeline (Fundamentals → Intermediate →
Advanced → Interview/Cheatsheets) — this same study-path FlowDiagram
pattern is expected to repeat across every technology in this cluster,
since all of them share the same five-tier structure and closing
paragraph shape.

| Technology | overview.md | Notes |
|---|---|---|
| pmp | **content done (batch 1)** — ConceptBoxGrid (3 PMP exam domains with weights), FlowDiagram (study path) | self-mapped; live-verified ✅ |
| itil | **content done (batch 1)** — ConceptBoxGrid (5 Service Value System components), FlowDiagram (study path) | self-mapped; live-verified ✅ |
| scrum | **content done (batch 1)** — ConceptBoxGrid (4 Agile Manifesto values), ConceptBoxGrid (3 certifications: CSM/PSM I/SAFe), FlowDiagram (study path) | self-mapped; live-verified ✅ |
| six-sigma | **content done (batch 1)** — ConceptBoxGrid (4 belt levels), FlowDiagram (study path) | self-mapped; live-verified ✅ |

No double-backslash or fence-imbalance defects found in this batch.

**Batch 2 — exams/banking-ssc cluster** (2026-08-28): banking-exam,
banking-exams, quant-aptitude, reasoning-ability, english-language,
banking-awareness — overview.md only. Status: **done** — content,
predeploy (fence check), JSON block validation, and full live Playwright
dark/light + crash verification cycle all clean. Academies dropdown
hover verified separately.

`quant-aptitude`, `reasoning-ability`, `english-language`, and
`banking-awareness` share an identical structure ("Why This Section
Exists Separately" / "Core Topic Map" table / a numbered strategy list /
"Study Approach") — applied the same two-visual pattern uniformly: a
`ConceptBoxGrid` for the highest-weightage topics from the Core Topic
Map, and a `FlowDiagram` converting the numbered strategy steps into a
visual sequence. `banking-exam` and `banking-exams` are two separate,
overlapping technologies both covering SBI/IBPS/RBI exam prep (not a
duplication bug — both are genuinely registered as distinct
technologies with distinct descriptions) — each got a `FlowDiagram` for
its exam-stage timeline (Prelims → Mains → Interview → Final Merit) plus
one more visual for its own content (a prep-plan `FlowDiagram` for
`banking-exam`, an SBI-vs-IBPS `ConceptBoxGrid` for `banking-exams`).

| Technology | overview.md | Notes |
|---|---|---|
| banking-exam | **content done (batch 2)** — FlowDiagram (IBPS PO exam-stage timeline), FlowDiagram (90-Day prep plan) | self-mapped; live-verified ✅ |
| banking-exams | **content done (batch 2)** — FlowDiagram (SBI PO exam-stage timeline), ConceptBoxGrid (SBI PO vs IBPS PO) | self-mapped; live-verified ✅ |
| quant-aptitude | **content done (batch 2)** — ConceptBoxGrid (4 highest-weightage topics), FlowDiagram (study approach) | self-mapped; live-verified ✅ |
| reasoning-ability | **content done (batch 2)** — ConceptBoxGrid (4 core topics), FlowDiagram (puzzle-solving method) | self-mapped; live-verified ✅ |
| english-language | **content done (batch 2)** — ConceptBoxGrid (4 core topics), FlowDiagram (RC strategy) | self-mapped; live-verified ✅ |
| banking-awareness | **content done (batch 2)** — ConceptBoxGrid (4 topic areas), FlowDiagram (current-affairs building method) | self-mapped; live-verified ✅ |

No double-backslash or fence-imbalance defects found in this batch.

**Batch 3 — SSC/RRB + GATE group** (2026-08-28): ssc-cgl, ssc-exam,
rrb-ntpc, gate, gate-cse, gate-ece — overview.md only. Status: **done** —
content, predeploy (fence check), JSON block validation, and full live
Playwright dark/light + crash verification cycle all clean. Academies
dropdown hover verified separately.

**Found and fixed a real live-production content bug while checking
registry aliasing for this batch** (before any content edits):
`exams/gate-ece/overview` was registry-aliased to `exams/gate-cse/overview`
— a wrong-technology mismatch (GATE ECE students were served GATE CSE
overview content), not a thin/duplicate case. A real, complete, on-topic
`gate-ece/overview.md` existed on disk the whole time; every other
`gate-ece/*` tier was already correctly self-mapped — only this one key
was stale. Confirmed live via curl before fixing. Fixed by adding the key
to `STALE_ALIAS_FIX_KEYS` in `scripts/generate-content-registry.mjs`
(the same mechanism already used for several `devops/*` technologies)
and regenerating `lib/content/index.ts` via the real generator (native
WSL) — diffed against the pre-fix registry and confirmed only that one
line changed. Committed separately from this batch's visual work
(`35e1618`), deployed together with batch 3. Live-verified post-fix that
`gate-ece/overview` now renders its own ECE content, not CSE's.

| Technology | overview.md | Notes |
|---|---|---|
| ssc-cgl | **content done (batch 3)** — FlowDiagram (4-tier exam pattern), ConceptBoxGrid (3 most sought-after posts) | self-mapped; live-verified ✅ |
| ssc-exam | **content done (batch 3)** — ConceptBoxGrid (4 major SSC exams), FlowDiagram (CGL Tier I/II pattern) | self-mapped; live-verified ✅ |
| rrb-ntpc | **content done (batch 3)** — ConceptBoxGrid (RRB vs other exams comparison), FlowDiagram (4 exam stages) | self-mapped; live-verified ✅ |
| gate | **content done (batch 3)** — ConceptBoxGrid (4 key papers), ConceptBoxGrid (MCQ/MSQ/NAT question types) | self-mapped; live-verified ✅ |
| gate-cse | **content done (batch 3)** — ConceptBoxGrid (question-type marks breakdown), FlowDiagram (12-month prep timeline) | self-mapped; live-verified ✅ |
| gate-ece | **content done (batch 3)** — ConceptBoxGrid (4 heaviest-weight subjects), FlowDiagram (study sequence). **Also the stale-alias fix target above** — this file's content is now genuinely reachable for the first time | self-mapped (fixed this batch); live-verified ✅, ECE-specific content confirmed rendering |

No double-backslash or fence-imbalance defects found in this batch.

**Batch 4 — NEET + JEE core sciences** (2026-08-28): neet-biology,
neet-physics, neet-chemistry, jee-maths, jee-physics, jee-chemistry —
overview.md only. Status: **done** — content, predeploy (fence check),
JSON block validation, and full live Playwright dark/light + crash
verification cycle all clean. Academies dropdown hover verified
separately.

**Fence-closing mistake happened again during this batch** (in
`neet-physics/overview.md`) — inserting a `​```conceptgrid` block mid-way
through an existing multi-section `​```` block closed that block early,
leaving the following "LEAST TIME-EFFICIENT" section as unfenced text.
Caught immediately by a manual fence-balance sanity check run right
after the edit (before moving to the next file), fixed before it ever
reached predeploy/commit. This is the same recurring bug class the
automated `validate:content-fences` check exists for — worth noting it
can still happen mid-edit, the automated check is what catches it before
commit, not a preventer of the mistake itself.

Each file's weightage/marks-distribution table converted to a
`ConceptBoxGrid` (top 3-4 highest-weighted topics); JEE's month/3-month
prep plans converted to `FlowDiagram`s; `jee-chemistry` additionally got
a `ConceptBoxGrid` for the SN1/SN2/E1/E2 reaction-mechanism comparison
already present in its Organic Chemistry section.

| Technology | overview.md | Notes |
|---|---|---|
| neet-biology | **content done (batch 4)** — ConceptBoxGrid (4 high-weightage topics), FlowDiagram (score-vs-college tiers) | self-mapped; live-verified ✅ |
| neet-physics | **content done (batch 4)** — ConceptBoxGrid (4 important chapters), FlowDiagram (month-wise plan). Fence-closing mistake caught and fixed mid-edit (see above) | self-mapped; live-verified ✅ |
| neet-chemistry | **content done (batch 4)** — ConceptBoxGrid (Inorganic/Organic/Physical strategy), FlowDiagram (study plan sequence) | self-mapped; live-verified ✅ |
| jee-maths | **content done (batch 4)** — ConceptBoxGrid (4 high-weightage topics), FlowDiagram (3-month plan) | self-mapped; live-verified ✅ |
| jee-physics | **content done (batch 4)** — ConceptBoxGrid (4 weightage topics), ConceptBoxGrid (Main vs Advanced strategy) | self-mapped; live-verified ✅ |
| jee-chemistry | **content done (batch 4)** — ConceptBoxGrid (Physical/Organic/Inorganic weightage), ConceptBoxGrid (SN1/SN2/E1/E2 mechanisms) | self-mapped; live-verified ✅ |

No double-backslash artifacts found in this batch.

**Batch 5 — JEE tail + UPSC group** (2026-08-28): jee-advanced,
neet-mocktests, jee-main, upsc-prelims, upsc-mains, upsc-ethics —
overview.md only. Status: **done** — content, predeploy (fence check),
JSON block validation, and full live Playwright dark/light + crash
verification cycle all clean. Academies dropdown hover verified
separately. **This completes the entire engineering-exams domain within
the `exams` academy** (all NEET/JEE technologies now have visuals).

| Technology | overview.md | Notes |
|---|---|---|
| jee-advanced | **content done (batch 5)** — ConceptBoxGrid (JEE Main vs Advanced), FlowDiagram (JOSAA counselling process) | self-mapped; live-verified ✅ |
| neet-mocktests | **content done (batch 5)** — FlowDiagram (mock test schedule phases), ConceptBoxGrid (subject-wise revision strategy) | self-mapped; live-verified ✅ |
| jee-main | **content done (batch 5)** — ConceptBoxGrid (JEE Main vs Advanced), FlowDiagram (prep priorities) | self-mapped; live-verified ✅ |
| upsc-prelims | **content done (batch 5)** — ConceptBoxGrid (Paper I vs CSAT), FlowDiagram (monthly prep schedule) | self-mapped; live-verified ✅ |
| upsc-mains | **content done (batch 5)** — ConceptBoxGrid (4 GS papers), FlowDiagram (answer-writing structure) | self-mapped; live-verified ✅ |
| upsc-ethics | **content done (batch 5)** — ConceptBoxGrid (3 ethics theories), FlowDiagram (case-study answer format) | self-mapped; live-verified ✅ |

No double-backslash or fence-imbalance defects found in this batch.

**Batch 6 — civil-services tail + all central-exams** (2026-08-28):
state-psc (`exams` academy), upsc-interview, ctet-paper1, ctet-paper2,
psu-technical, nda-prep, hal-trainee-prep — overview.md only. Status:
**done** — content, predeploy (fence check), JSON block validation, and
full live Playwright dark/light + crash verification cycle all clean.
Academies dropdown hover verified separately (both `exams` and
`central-exams` top-level links confirmed visible on hover). **This
completes the entire `exams` academy's overview.md pass (26/26) and the
entire `central-exams` academy's overview.md pass (5/5).**

`ctet-paper1`, `ctet-paper2`, `psu-technical`, and `nda-prep` share the
same "What this technology covers / Why it matters / quick-map table /
How to use this technology's sections" structure already seen in
professional-certs — applied the identical two-visual pattern
(ConceptBoxGrid for the quick-map, FlowDiagram for the study-path
closing paragraph). `hal-trainee-prep` has a different structure
(no closing study-path paragraph) — got a ConceptBoxGrid for its exam
sections and a FlowDiagram for its recruitment-cycle timeline instead.

| Technology | overview.md | Notes |
|---|---|---|
| state-psc (exams) | **content done (batch 6)** — FlowDiagram (Prelim/Main/Interview stages), ConceptBoxGrid (4 state-specific prep additions) | self-mapped; live-verified ✅ |
| upsc-interview | **content done (batch 6)** — ConceptBoxGrid (4 question categories), ConceptBoxGrid (Do's vs Don'ts) | self-mapped; live-verified ✅ |
| ctet-paper1 | **content done (batch 6)** — ConceptBoxGrid (4 exam sections), FlowDiagram (study path) | self-mapped; live-verified ✅ |
| ctet-paper2 | **content done (batch 6)** — ConceptBoxGrid (4 sections incl. track choice), FlowDiagram (study path) | self-mapped; live-verified ✅ |
| psu-technical | **content done (batch 6)** — ConceptBoxGrid (2 recruitment routes), FlowDiagram (3-stage selection), FlowDiagram (study path) | self-mapped; live-verified ✅ |
| nda-prep | **content done (batch 6)** — ConceptBoxGrid (Maths/GAT/SSB), FlowDiagram (study path) | self-mapped; live-verified ✅ |
| hal-trainee-prep | **content done (batch 6)** — ConceptBoxGrid (3 exam sections), FlowDiagram (recruitment cycle timeline) | self-mapped; live-verified ✅ |

No double-backslash or fence-imbalance defects found in this batch.

**Batch 7 — final batch, entire `state-psc` academy** (2026-08-28):
tnpsc, kpsc, mpsc, appsc, tspsc — overview.md only. Status: **done** —
content, predeploy (fence check), JSON block validation, and full live
Playwright dark/light + crash verification cycle all clean. Academies
dropdown hover verified separately.

All 5 files share the identical professional-certs-style structure —
applied the same ConceptBoxGrid (Group/exam-level quick-map) +
FlowDiagram (study-path) pattern used across the rest of this cluster.

| Technology | overview.md | Notes |
|---|---|---|
| tnpsc | **content done (batch 7)** — ConceptBoxGrid (Group I-IV), FlowDiagram (study path) | self-mapped; live-verified ✅ |
| kpsc | **content done (batch 7)** — ConceptBoxGrid (KAS/FDA/SDA), FlowDiagram (study path) | self-mapped; live-verified ✅ |
| mpsc | **content done (batch 7)** — ConceptBoxGrid (MCS/Group A/B), FlowDiagram (study path) | self-mapped; live-verified ✅ |
| appsc | **content done (batch 7)** — ConceptBoxGrid (Group I-IV), FlowDiagram (study path) | self-mapped; live-verified ✅ |
| tspsc | **content done (batch 7)** — ConceptBoxGrid (Group I-IV), FlowDiagram (study path) | self-mapped; live-verified ✅ |

No double-backslash or fence-imbalance defects found in this batch.

## Exams cluster — COMPLETE (2026-08-28)

All 43 technologies across all 4 academies now have the depth-rubric
(where needed) + visual treatment: `exams` (26/26), `central-exams`
(5/5), `professional-certs` (4/4), `state-psc` (5/5) = **43/43**.
Along the way this cluster also surfaced and fixed two real
live-production bugs unrelated to visuals: the `cloud/terraform` orphan
(deleted) and the `exams/gate-ece` stale-alias-to-gate-cse bug (fixed).
The `banking-exam` vs `banking-exams` non-duplication was independently
verified with pasted live-content evidence three times over the course
of this cluster after repeated user requests for direct confirmation.

---

## Databases — technology-level tracking (12 technologies)

Standard rubric variant (not exam-prep) — Databases needs the full
hook/analogy/try-it/prerequisite treatment like DevOps/Cloud/AI, not the
lighter exams-cluster style. Registry-checked all 10 remaining
technologies before editing — all self-mapped, no aliasing found.

**Batch 1** (2026-08-28): postgresql, mysql, redis, oracle, cassandra,
dynamodb — overview.md only. Status: **done** — content, predeploy
(fence check), JSON block validation, and full live Playwright
dark/light + crash verification cycle all clean. Academies dropdown
hover verified separately.

None of these 6 files had any depth-rubric elements (no prerequisite
line, hook, analogy, or try-it) — added all of them from scratch, plus
visuals converting each file's existing comparison table/concept list
into a ConceptBoxGrid.

| Technology | overview.md | Notes |
|---|---|---|
| postgresql | **content done (batch 1)** — added prerequisite + hook + analogy + try-it (previously missing), ConceptBoxGrid (JSONB/arrays/full-text/generated columns) | self-mapped; live-verified ✅ |
| mysql | **content done (batch 1)** — added prerequisite + hook + analogy + try-it (previously missing), ConceptBoxGrid (choose MySQL vs choose PostgreSQL) | self-mapped; live-verified ✅ |
| redis | **content done (batch 1)** — added prerequisite + hook + analogy + try-it (previously missing), ConceptBoxGrid (4 top use cases) | self-mapped; live-verified ✅ |
| oracle | **content done (batch 1)** — added prerequisite + hook + analogy + try-it (previously missing), ConceptBoxGrid (Tablespace/Sequence/PL-SQL/RAC) | self-mapped; live-verified ✅ |
| cassandra | **content done (batch 1)** — added prerequisite + hook + analogy + try-it (previously missing), ConceptBoxGrid (4 "use Cassandra for" cases). Caught and fixed a duplicate "## Architecture" heading introduced mid-edit before it reached predeploy | self-mapped; live-verified ✅ |
| dynamodb | **content done (batch 1)** — added prerequisite + hook + analogy + try-it (previously missing), ConceptBoxGrid (core concepts), ConceptBoxGrid (Provisioned vs On-Demand) | self-mapped; live-verified ✅ |

No double-backslash or fence-imbalance defects found in this batch.

**Batch 2 — final batch** (2026-08-28): database-design,
performance-tuning, cloud-databases, elasticsearch — overview.md only.
Status: **done** — content, predeploy (fence check), JSON block
validation, and full live Playwright dark/light + crash verification
cycle all clean. Academies dropdown hover verified separately. **This
completes the entire Databases academy's overview.md pass — 12/12
technologies (10 from this Phase 3 pass + sql/mongodb from Phase 2).**

None of these 4 files had any depth-rubric elements — added
prerequisite + hook + analogy + try-it from scratch to each, plus
ConceptBoxGrids/FlowDiagrams converting each file's existing
tables/lists into visuals. Caught and fixed a stray duplicate heading
introduced mid-edit in `database-design/overview.md` before it reached
predeploy or commit — same class of self-caught mistake as cassandra in
batch 1.

| Technology | overview.md | Notes |
|---|---|---|
| database-design | **content done (batch 2)** — added prerequisite + hook + analogy + try-it, ConceptBoxGrid (4 normal forms), ConceptBoxGrid (CAP theorem). Fixed a stray duplicate heading introduced mid-edit | self-mapped; live-verified ✅ |
| performance-tuning | **content done (batch 2)** — added prerequisite + hook + analogy + try-it, FlowDiagram (5-step tuning hierarchy), ConceptBoxGrid (EXPLAIN plan node types) | self-mapped; live-verified ✅ |
| cloud-databases | **content done (batch 2)** — added prerequisite + hook + analogy + try-it, ConceptBoxGrid (4-provider landscape) | self-mapped; live-verified ✅ |
| elasticsearch | **content done (batch 2)** — added prerequisite + hook + analogy + try-it, ConceptBoxGrid (core concepts), ConceptBoxGrid (4 excellent-for use cases) | self-mapped; live-verified ✅ |

No double-backslash or fence-imbalance defects found in this batch.

## Databases academy — COMPLETE (2026-08-28)

All 12 technologies now have the depth-rubric + visual treatment:
sql and mongodb (Phase 2 pilot) + postgresql, mysql, redis, oracle,
cassandra, dynamodb (batch 1) + database-design, performance-tuning,
cloud-databases, elasticsearch (batch 2) = **12/12**.

---

## Healthcare — technology-level tracking (13 technologies)

Standard rubric variant. **Domain-sensitive content** — medical
coding/clinical terminology — so the same accuracy discipline used for
the CCS build earlier this engagement applies throughout: mark
unverified specifics clearly with `(needs verification — ...)`, never
overstate certainty on a medical/coding claim. **Standing exclusion**
(see `feedback_bchhc_mock_exam_permanent_exclusion` memory): never touch
the 10 BCHHC mock exam papers or their backing DB/quiz_questions data in
any Healthcare batch — `bchhc-prep`'s markdown tabs remain in scope, the
exam-bank content does not. This batch touched none of that (overview.md
only, none of the 6 files below are `bchhc-prep`).

Registry-checked all 6 files before editing — self-mapped, no aliasing.

**Batch 1** (2026-08-28): anatomy-physiology, medical-terminology,
medical-coding, icd-10-cm, hcpcs, coding-guidelines — overview.md only.
Status: **done** — content, predeploy (fence check), JSON block
validation, and full live Playwright dark/light + crash verification
cycle all clean. Academies dropdown hover verified separately.

All 6 files were already fully depth-rubric complete (hook/analogy/
try-it, and already carrying appropriate `(needs verification)` tags on
FY2026 guideline specifics) — this batch was visuals only, no new
medical claims introduced. Each file's existing ASCII diagram converted
to a FlowDiagram; each file's existing comparison table/category list
converted to a ConceptBoxGrid.

| Technology | overview.md | Notes |
|---|---|---|
| anatomy-physiology | **content done (batch 1)** — FlowDiagram (diagnosis→system→chapter), ConceptBoxGrid (4 body systems) | self-mapped; live-verified ✅ |
| medical-terminology | **content done (batch 1)** — FlowDiagram (prefix+root+suffix word-build), ConceptBoxGrid (4 common roots) | self-mapped; live-verified ✅ |
| medical-coding | **content done (batch 1)** — FlowDiagram (documentation→codes translation), ConceptBoxGrid (3 code sets) | self-mapped; live-verified ✅ |
| icd-10-cm | **content done (batch 1)** — FlowDiagram (code structure breakdown), ConceptBoxGrid (3 high-complexity areas) | self-mapped; live-verified ✅ |
| hcpcs | **content done (batch 1)** — ConceptBoxGrid (CPT vs HCPCS), ConceptBoxGrid (4 code category letters) | self-mapped; live-verified ✅ |
| coding-guidelines | **content done (batch 1)** — ConceptBoxGrid (4 authoritative sources), ConceptBoxGrid (inpatient vs outpatient uncertain-diagnosis rule) | self-mapped; live-verified ✅ |

No double-backslash or fence-imbalance defects found in this batch.

**Batch 2 — final batch** (2026-08-28): ccs, mock-exams,
home-health-coding, patient-documentation, bchhc-prep, healthcare-admin
— overview.md only. Status: **done** — content, predeploy (fence check),
JSON block validation, and full live Playwright dark/light + crash
verification cycle all clean. Academies dropdown hover verified
separately. **This completes the entire Healthcare academy's
overview.md pass — 13/13 technologies.**

All 6 files were already fully depth-rubric complete, with genuinely
strong existing accuracy discipline — `bchhc-prep` and `mock-exams` both
already carried an explicit `(needs verification — certifying body
unclear, sources vary between BMSCC/AHCC/WellSky)` note on the BCHHC
credential, and `home-health-coding` already had a self-correction note
about an earlier oversimplified PDGM group count. This batch was visuals
only — no new medical/coding claims introduced, existing verification
caveats left untouched. `bchhc-prep/overview.md` is markdown-tab content
(in scope per the standing exclusion); no exam-bank tables or
`quiz_questions` rows were touched by this or any batch in this academy.

| Technology | overview.md | Notes |
|---|---|---|
| ccs | **content done (batch 2)** — ConceptBoxGrid (CPC/CCA vs CCS scope), ConceptBoxGrid (exam format facts) | self-mapped; live-verified ✅ |
| mock-exams | **content done (batch 2)** — ConceptBoxGrid (4 exam credentials), FlowDiagram (how-to-use-this-section steps) | self-mapped; live-verified ✅ |
| home-health-coding | **content done (batch 2)** — FlowDiagram (OASIS→HIPPS→payment), ConceptBoxGrid (4 OASIS assessment timepoints) | self-mapped; live-verified ✅ |
| patient-documentation | **content done (batch 2)** — ConceptBoxGrid (4 documentation deficiencies), FlowDiagram (5-step CDI workflow) | self-mapped; live-verified ✅ |
| bchhc-prep | **content done (batch 2)** — ConceptBoxGrid (key numbers), FlowDiagram (section progression). Markdown-tab content, standing BCHHC exam-bank exclusion respected | self-mapped; live-verified ✅ |
| healthcare-admin | **content done (batch 2)** — FlowDiagram (revenue cycle, stack layout), ConceptBoxGrid (4 key regulations) | self-mapped; live-verified ✅ |

No double-backslash or fence-imbalance defects found in this batch.

## Healthcare academy — COMPLETE (2026-08-28)

All 13 technologies now have the depth-rubric + visual treatment: cpt
(Phase 2 pilot) + anatomy-physiology, medical-terminology,
medical-coding, icd-10-cm, hcpcs, coding-guidelines (batch 1) + ccs,
mock-exams, home-health-coding, patient-documentation, bchhc-prep,
healthcare-admin (batch 2) = **13/13**. The BCHHC mock-exam exam-bank
exclusion (10 papers + backing DB/quiz_questions data) was respected
throughout — never touched in any batch.

## Security — technology-level tracking (9 technologies)

| Technology | Registry key | Rubric status before | Work done | Status |
|---|---|---|---|---|
| security-fundamentals | security/security-fundamentals/overview | Full rubric (Phase 2 pilot) | — | Done (Phase 2) |
| network-security | security/network-security/overview | None | Prerequisite/hook/analogy/try-it added; "Defense in Depth" ASCII → `stack` FlowDiagram (5 steps); attack-vector ConceptBoxGrid (4 boxes) | Done |
| ethical-hacking | security/ethical-hacking/overview | None | Prerequisite/hook/analogy/try-it added; authorization-type ConceptBoxGrid (3 boxes); 5-phase methodology → `flow` FlowDiagram | Done |
| pen-testing | security/pen-testing/overview | None | Prerequisite/hook/analogy/try-it added; pen-test-type ConceptBoxGrid (4 boxes); 7-step PTES → consolidated 5-step `flow` FlowDiagram | Done |
| soc | security/soc/overview | None | Prerequisite/hook/analogy/try-it added; SOC team structure → `stack` FlowDiagram (4 tiers); SIEM platforms ConceptBoxGrid (4 boxes); Ransomware playbook 7 steps → `stack` FlowDiagram | Done |
| siem | security/siem/overview | None | Prerequisite/hook/analogy/try-it added; "What SIEM Does" pipeline → `flow` FlowDiagram (5 steps); Major SIEM Platforms ConceptBoxGrid (4 boxes) | Done |
| cloud-security | security/cloud-security/overview | None | Prerequisite/hook/analogy/try-it added; AWS Security Services ConceptBoxGrid (4 boxes); Azure Security Controls → `stack` FlowDiagram (5 steps) | Done |
| incident-response | security/incident-response/overview | None | Prerequisite/hook/analogy/try-it added; NIST 4-phase framework → `flow` FlowDiagram; severity-tier ConceptBoxGrid (4 boxes: P1-P4) | Done |
| devsecops | security/devsecops/overview | None (already had extensive interview-prep depth, but no hook/analogy/try-it/prerequisite) | Prerequisite/hook/analogy/try-it added; 5-layer defense-in-depth → `flow` FlowDiagram; tool-category ConceptBoxGrid (4 boxes) | Done |

**Batch 1 notes (2026-08-28):** All 9 technologies in `lib/data/academies.ts`'s
Security navigation confirmed self-mapped in the content registry, no
aliasing risk (single grep query). `public/content/security/` folder itself
contains 30+ misplaced files from unrelated academies (banking, medical,
exam-prep, CS-fundamentals) — correctly excluded from scope by cross-checking
against the real navigation definition rather than the folder listing.
All 8 remaining files needed full standard-rubric treatment (none had any
prerequisite/hook/analogy/try-it elements). Fence-balance manually verified
per-file immediately after each edit (all balanced); batch-wide
`validate-content-fences.mjs` clean (2579 files); all 17 new
`flow`/`conceptgrid` JSON blocks across the 8 files parsed successfully;
`npm run predeploy` exit 0 (pre-existing `empty_code_block`/`abrupt_cutoff`
WARN-only false positives spot-checked in all 8 files — all are the known
adjacent-fence pattern, not real issues). One native-WSL build + live
Playwright verification cycle run for all 8 pages: all return HTTP 200,
zero crashes, diagrams render (`[data-diagram-box]` count 8-19 per page),
Academies dropdown expands with security links present. Not yet deployed —
awaiting explicit deploy instruction.

## Security academy — COMPLETE, deployed live (2026-08-28)

All 9 technologies now have the depth-rubric + visual treatment:
security-fundamentals (Phase 2 pilot) + network-security, ethical-hacking,
pen-testing, soc, siem, cloud-security, incident-response, devsecops
(batch 1) = **9/9**. This finished in a single batch as anticipated.
Deployed and live-verified (all 9 pages 200, diagrams render in both
themes, Academies dropdown working, `npm run predeploy` exit 0).

## Data (Analytics & BI) — technology-level tracking (14 technologies)

| Technology | Registry key | Rubric status before | Work done | Status |
|---|---|---|---|---|
| excel | data/excel/overview | None | Prerequisite/hook/analogy/try-it added; case-study workflow → `flow` FlowDiagram (5 steps); chart-type ConceptBoxGrid (4 boxes) | Done (batch 1) |
| pandas | data/pandas/overview | None | Prerequisite/hook/analogy/try-it added (Excel-intuition framing); typical-workflow → `flow` FlowDiagram (5 steps) | Done (batch 1) |
| power-bi | data/power-bi/overview | None | Prerequisite/hook/analogy/try-it added; core workflow → `flow` FlowDiagram (5 steps); Import/DirectQuery/Live ConceptBoxGrid (3 boxes) | Done (batch 1) |
| tableau | data/tableau/overview | None | Prerequisite/hook/analogy/try-it added; Tableau products ConceptBoxGrid (4 boxes); LOD expressions ConceptBoxGrid (3 boxes) | Done (batch 1) |
| sql | data/sql/overview | None | Prerequisite/hook/analogy/try-it added; SQL category ConceptBoxGrid (4 boxes: DDL/DML/DQL/DCL-TCL) | Done (batch 1) |
| mis-overview | data/mis-overview/overview | None (had extensive interview-prep depth, no hook/analogy/try-it) | Prerequisite/hook/analogy/try-it added (bridge-path framing); 6-module learning path → `stack` FlowDiagram | Done (batch 1) |
| dashboarding | data/dashboarding/overview | None | Prerequisite/hook/analogy/try-it added; dashboard-types ConceptBoxGrid (4 boxes); build-process → `flow` FlowDiagram (4 steps) | Done (batch 2) |
| data-visualization | data/data-visualization/overview | None | Prerequisite/hook/analogy/try-it added; chart-type ConceptBoxGrid (4 boxes) | Done (batch 2) |
| dbt | data/dbt/overview | **Generic-template stub — no tool-specific depth** | Flagged, not edited — see stub-content note below | **Flagged, deferred** |
| airflow | data/airflow/overview | **Generic-template stub — no tool-specific depth** | Flagged, not edited — see stub-content note below | **Flagged, deferred** |
| spark | data/spark/overview | **Generic-template stub — no tool-specific depth** | Flagged, not edited — see stub-content note below | **Flagged, deferred** |
| cloud-data-warehouses | data/cloud-data-warehouses/overview | None (already had strong vendor-comparison depth) | Prerequisite/hook/analogy/try-it added; vendor-landscape ConceptBoxGrid (4 boxes); pipeline-position → `flow` FlowDiagram | Done (batch 2) |
| python-mis | data/python-mis/overview | None | Prerequisite/hook/analogy/try-it added (Excel-intuition framing); 5-module learning path → `stack` FlowDiagram | Done (batch 2) |
| python-mis-advanced | data/python-mis-advanced/overview | None | Prerequisite/hook/analogy/try-it added; 3-phase learning path → `flow` FlowDiagram | Done (batch 2) |

**Batch 1 notes (2026-08-28):** All 14 technologies in `lib/data/academies.ts`'s
Data (Analytics & BI) navigation confirmed self-mapped in the content
registry (`data/*`), no aliasing risk. Started with the 6 core
analysis/BI/engineering technologies (excel, pandas, power-bi, tableau, sql,
mis-overview) — all needed full standard-rubric treatment (none had any
prerequisite/hook/analogy/try-it elements, despite some, like mis-overview,
already having strong interview-prep depth). Note: `data/sql/overview.md` was
confirmed distinct from the earlier Phase 2 `databases/sql/overview.md`
pilot — different registry key, different (much shorter) content, no
duplication. Fence-balance manually verified per-file (all balanced);
batch-wide `validate-content-fences.mjs` clean (2579 files); all 7 new
`flow`/`conceptgrid` JSON blocks parsed successfully (one file,
`data/excel/overview.md`, has pre-existing CRLF line endings unrelated to
this edit — confirmed harmless, only affected a local ad-hoc JSON-check
script's regex, not the site's own fence/JSON validators); `npm run
predeploy` exit 0 (new `empty_code_block` WARN-only false positives
spot-checked — all the known adjacent-fence pattern). One native-WSL build +
live Playwright verification cycle run for all 6 pages: all render with no
crashes, diagrams present (4-9 per page), Academies dropdown works. Deployed
and live-verified (2026-08-28): all 6 pages 200, diagrams render in both
themes, Academies dropdown working, `npm run predeploy` exit 0.

**Batch 2 notes (2026-08-28) — STUB CONTENT FOUND (dbt/airflow/spark):**
Reading all 8 remaining technologies before editing (per standing QA
process) surfaced that `data/dbt/overview.md`, `data/airflow/overview.md`,
and `data/spark/overview.md` are generic-template stubs — nearly identical
boilerplate ("This page covers the fundamentals of X including installation,
core concepts... The complete X curriculum covers: Architecture and how it
works, Installation and configuration...") with zero tool-specific depth: no
actual DAG example for Airflow, no dbt model/schema.yml example, no Spark
RDD/DataFrame code. This is the same pattern previously flagged for
Education's `os/dbms/cn/system-design/placement-prep` stubs (see
[[project_education_generic_template_stub_gap]]). Flagged to the user
mid-batch rather than silently patching a rubric onto thin stub text; user
confirmed: flag and defer, finish the other 5 real technologies now, log
dbt/airflow/spark as an open backlog item requiring genuine content
authoring (not a visual/rubric pass) before they can be marked done. **Data
academy is 13/14 with real depth-rubric+visual treatment; 3/14
(dbt/airflow/spark) remain generic stubs and are explicitly NOT counted as
complete.**

The other 5 (dashboarding, data-visualization, cloud-data-warehouses,
python-mis, python-mis-advanced) all had genuine existing depth, just no
rubric elements — completed with full standard-rubric treatment.
Fence-balance manually verified per-file (all balanced); batch-wide
`validate-content-fences.mjs` clean (2579 files); all 7 new
`flow`/`conceptgrid` JSON blocks parsed successfully; `npm run predeploy`
exit 0 (no new WARN-only false positives even). One native-WSL build + live
Playwright verification cycle run for all 5 pages: all render with no
crashes, diagrams present (3-8 per page), Academies dropdown works. Deployed
and live-verified (2026-08-28): all 5 pages 200, diagrams render in both
themes, Academies dropdown working, `npm run predeploy` exit 0.

## Data (Analytics & BI) academy — EFFECTIVELY COMPLETE for this pass, 13/14 (2026-08-28)

11 of 14 technologies (batches 1+2) now have real depth-rubric + visual
treatment; dbt, airflow, and spark remain flagged generic-template stubs,
logged as an open backlog item requiring genuine content authoring — not
counted as done, not silently patched over. **13/14 done, 3/14 flagged.**

## Education — technology-level tracking (12 technologies)

| Technology | Registry key | Rubric status before | Work done | Status |
|---|---|---|---|---|
| maths | education/maths/overview | None (dense, real reference content) | Prerequisite/hook/analogy/try-it added; board-exam marks-weight ConceptBoxGrid (4 boxes) | Done (batch 1) |
| science | education/science/overview | None (dense, real reference content) | Prerequisite/hook/analogy/try-it added; Class 12 marks-weight ConceptBoxGrid (4 boxes) | Done (batch 1) |
| cs-school | education/cs-school/overview | None | Prerequisite/hook/analogy/try-it added; "what to learn next" roadmap → `flow` FlowDiagram (5 steps) | Done (batch 1) |
| dsa | education/dsa/overview | Had strong hook-adjacent prose, no formal rubric headers | Prerequisite line added; formal "Why This Exists (The Hook)"/Analogy/Try-it added; course sequencing → `flow` FlowDiagram (3 steps) | Done (batch 1) |
| os | education/os/overview | None (dense, real GATE-prep content) | Prerequisite/hook/analogy/try-it added; process-states → `flow` FlowDiagram (5 states) | Done (batch 1) |
| dbms | education/dbms/overview | None (dense, real GATE-prep content) | Prerequisite/hook/analogy/try-it added; ACID ConceptBoxGrid (4 boxes) | Done (batch 1) |
| cn | education/cn/overview | None (dense, real GATE-prep content) | Prerequisite/hook/analogy/try-it added; HTTP/1.1 vs 2 vs 3 ConceptBoxGrid (3 boxes) | Done (batch 2) |
| system-design | education/system-design/overview | None (dense, real content) | Prerequisite/hook/analogy/try-it added; 5-step approach → `flow` FlowDiagram | Done (batch 2) |
| placement-prep | education/placement-prep/overview | None (dense, real content) | Prerequisite/hook/analogy/try-it added; hiring-funnel → `flow` FlowDiagram (6 steps) | Done (batch 2) |
| java | education/java/overview | None | Prerequisite/hook/analogy/try-it added; JDK/JRE/JVM → `stack` FlowDiagram | Done (batch 2) |
| c-programming | education/c-programming/overview | None | Prerequisite/hook/analogy/try-it added; compilation-pipeline → `flow` FlowDiagram (4 steps) | Done (batch 2) |
| cpp | education/cpp/overview | None | Prerequisite/hook/analogy/try-it added; C++ standards ConceptBoxGrid (4 boxes) | Done (batch 2) |

**Batch 1 notes (2026-08-28):** All 12 technologies in `lib/data/academies.ts`'s
Education navigation confirmed self-mapped in the content registry
(`education/*`), no aliasing risk. Read all 12 `overview.md` files before
editing any, specifically to check for the previously-flagged
[[project_education_generic_template_stub_gap]] stub pattern — **none of the
12 overview.md files are stubs**; the previously-flagged gap is specific to
the `intermediate.md`/`advanced.md` tiers for os/dbms/cn/system-design/
placement-prep (still open, unrelated to this Tier-0 overview.md pass, not
re-verified here). All 12 overview.md files are genuinely dense,
high-quality reference content (GATE-prep style for os/dbms/cn/
system-design, CBSE-board-style for maths/science) — none needed content
authoring, only rubric+visual treatment. dsa/overview.md was a partial case:
it already had strong hook-like prose ("Why It's Central to Software
Engineering Interviews") but lacked the formal rubric headers and an
explicit Analogy/Try-it — added those without disturbing the existing good
content. Fence-balance manually verified per-file (all balanced); batch-wide
`validate-content-fences.mjs` clean (2579 files); all 6 new
`flow`/`conceptgrid` JSON blocks parsed successfully; `npm run predeploy`
exit 0 (new `empty_code_block` WARN-only false positives spot-checked — all
the known adjacent-fence pattern). One native-WSL build + live Playwright
verification cycle run for all 6 pages: all render with no crashes, diagrams
present (3-5 per page), Academies dropdown works. Deployed and
live-verified (2026-08-28): all 6 pages 200, diagrams render in both
themes, Academies dropdown working, `npm run predeploy` exit 0.

**Batch 2 notes (2026-08-28):** Read the remaining 6 files (cn,
system-design, placement-prep, java, c-programming, cpp) before editing —
confirmed all genuinely dense, real content (GATE-prep style for
cn/system-design, campus-placement-strategy style for placement-prep,
language-fundamentals style for java/c-programming/cpp), no stubs found.
Completed full standard-rubric treatment on all 6. Fence-balance manually
verified per-file (all balanced); batch-wide `validate-content-fences.mjs`
clean (2579 files); all 6 new `flow`/`conceptgrid` JSON blocks parsed
successfully; `npm run predeploy` exit 0 (new `empty_code_block` WARN-only
false positives spot-checked — all the known adjacent-fence pattern,
including two pre-existing ones in c-programming/java unrelated to this
edit). One native-WSL build + live Playwright verification cycle run for
all 6 pages: all render with no crashes, diagrams present (3-6 per page),
Academies dropdown works. Deployed and live-verified (2026-08-28): all 6
pages 200, diagrams render in both themes, Academies dropdown working,
`npm run predeploy` exit 0.

## Education academy — overview.md pass COMPLETE, 12/12, deployed live (2026-08-28)

All 12 technologies (maths, science, cs-school, dsa, os, dbms — batch 1;
cn, system-design, placement-prep, java, c-programming, cpp — batch 2) now
have real depth-rubric + visual treatment. This is specifically the Tier-0
`overview.md` pass — the previously-flagged
[[project_education_generic_template_stub_gap]] at the intermediate.md/
advanced.md tiers for os/dbms/cn/system-design/placement-prep remains open
and unrelated to this completion; it was not re-verified or addressed here
and should not be assumed fixed by this batch.

## Essentials — technology-level tracking (10 technologies)

| Technology | Registry key | Rubric status before | Work done | Status |
|---|---|---|---|---|
| human-essentials | essentials/human-essentials/overview | None | Prerequisite/hook/analogy/try-it added; 4-module overview → `flow` FlowDiagram | Done (batch 1) |
| gut-health | essentials/gut-health/overview | None | Prerequisite/hook/analogy/try-it added; verification-caveat note added for specific figures; gut-diversity-damage ConceptBoxGrid (4 boxes) | Done (batch 1) |
| hygiene | essentials/hygiene/overview | None | Prerequisite/hook/analogy/try-it added; highest-impact-habits ConceptBoxGrid (4 boxes) | Done (batch 1) |
| nutrition | essentials/nutrition/overview | None | Prerequisite/hook/analogy/try-it added; verification-caveat note added; overview → `flow` FlowDiagram (4 steps) | Done (batch 1) |
| mental-health | essentials/mental-health/overview | **CONTENT BUG: live-serving a Sleep article, not mental-health content** | **Rewrote overview.md from scratch** matching fundamentals/intermediate/advanced tiers' real content, with full standard rubric + visuals (conditions ConceptBoxGrid, bio-psycho-social FlowDiagram) | Done (batch 1) — bug fixed |
| sleep-health | essentials/sleep-health/overview | None | Prerequisite/hook/analogy/try-it added; verification-caveat note added; sleep-stages → `flow` FlowDiagram | Done (batch 1) |
| daily-movement | essentials/daily-movement/overview | None | Prerequisite/hook/analogy/try-it added; verification-caveat note added; desk-workers ConceptBoxGrid (4 boxes) | Done (batch 2) |
| personal-finance | essentials/personal-finance/overview | None | Prerequisite/hook/analogy/try-it added; verification-caveat note added; wealth-building overview → `flow` FlowDiagram (4 steps) | Done (batch 2) |
| digital-safety | essentials/digital-safety/overview | None | Prerequisite/hook/analogy/try-it added; verification-caveat note added; threat-type ConceptBoxGrid (4 boxes) | Done (batch 2) |
| first-aid | essentials/first-aid/overview | None | Prerequisite/hook/analogy/try-it added; explicit "not a substitute for certified training" caveat added; medical-emergencies ConceptBoxGrid (4 boxes) | Done (batch 2) |

**Batch 1 notes (2026-08-28) — LIVE CONTENT BUG FOUND AND FIXED:** All 10
technologies confirmed self-mapped in the content registry
(`essentials/*`), no aliasing risk. While reading `essentials/mental-
health/overview.md` before editing, discovered it was live-serving an
entire article titled "Sleep — The Most Underrated Health Intervention"
instead of mental-health content — confirmed via live curl showing the
wrong `<h1>` and body text at
`https://synfracore.com/academies/essentials/mental-health/overview`. The
other tiers for this technology (`fundamentals.md`/`intermediate.md`/
`advanced.md`) were correctly about mental health — only `overview.md` had
the wrong file substituted, likely dating to the original 2026-06-26
content-authoring commit (`d796d85`). This is distinct from
`essentials/sleep-health/overview.md`, which has its own separate,
different "Sleep & Recovery" article — not a duplicate/alias, a genuine
wrong-content bug. Flagged to the user immediately with live evidence before
proceeding; user confirmed: write correct content now as part of this
batch. Authored a new `mental-health/overview.md` from scratch, matching
the depth and style of the existing (correct) fundamentals/intermediate/
advanced tiers for this technology — common conditions, the bio-psycho-
social model, evidence-based self-care, when to seek help, India crisis
helplines — with full standard-rubric treatment (prerequisite line
including a crisis-safety note, hook, analogy, try-it) plus a
ConceptBoxGrid and FlowDiagram. Live-verified post-fix: the page now
renders mental-health content, not the Sleep article.

Domain-sensitivity note (Volatile Core content per standing QA process):
gut-health, nutrition, and sleep-health all contain specific supplement
dosages, percentages, and timelines stated as fact without
"(needs verification)" caveats — added a general verification-caveat note
to the prerequisite line of each during this batch, but did NOT audit or
verify the specific claims themselves (out of scope for a visual/rubric
pass). A dedicated accuracy pass on these specific figures — the same
discipline already applied to Healthcare and CCS content earlier in this
engagement — is a worthwhile lower-priority follow-up, not done here.

Fence-balance manually verified per-file (all balanced, including
mental-health's full rewrite); batch-wide `validate-content-fences.mjs`
clean (2579 files); all 7 new `flow`/`conceptgrid` JSON blocks parsed
successfully; `npm run predeploy` exit 0 (sleep-health's new
`empty_code_block`+`abrupt_cutoff` WARN-only flags manually verified as
false positives — file reads completely and ends cleanly, no truncation).
One native-WSL build + live Playwright verification cycle run for all 6
pages: all render with no crashes, diagrams present (4-7 per page),
mental-health confirmed NOT showing the old Sleep content, Academies
dropdown works. Deployed and live-verified (2026-08-28) — the mental-health
fix was prioritized: live curl confirmed the page now serves "Mental
Wellness — Overview" correctly (not the Sleep article), sleep-health
independently confirmed unaffected; all 6 pages 200, diagrams render in
both themes, Academies dropdown working, `npm run predeploy` exit 0.

**Batch 2 notes (2026-08-28):** Read the remaining 4 files (daily-movement,
personal-finance, digital-safety, first-aid) before editing — confirmed all
genuinely dense, real content, no stubs, no further content-mismatch bugs
found. Completed full standard-rubric treatment on all 4, adding
verification-caveat notes to personal-finance (India tax/interest-rate
figures change) and digital-safety (India IT Act/DPDP Act provisions
change) alongside the existing pattern from batch 1, plus an explicit
"not a substitute for certified training" caveat on first-aid given its
domain (medical emergency response). Fence-balance manually verified
per-file (all balanced); batch-wide `validate-content-fences.mjs` clean
(2579 files); all 4 new `flow`/`conceptgrid` JSON blocks parsed
successfully; `npm run predeploy` exit 0 (first-aid's new
`empty_code_block` WARN-only flag confirmed as the known adjacent-fence
pattern). One native-WSL build + live Playwright verification cycle run
for all 4 pages: all render with no crashes, diagrams present (4 per
page), Academies dropdown works. Not yet deployed — awaiting explicit
deploy instruction.

## Essentials academy — COMPLETE, 10/10, deployed live (2026-08-28)

All 10 technologies (human-essentials, gut-health, hygiene, nutrition,
mental-health, sleep-health — batch 1; daily-movement, personal-finance,
digital-safety, first-aid — batch 2) now have real depth-rubric + visual
treatment. Batch 1 also fixed a live content-mismatch bug on mental-health
(was serving Sleep content) — see the batch 1 notes above for full detail.
Domain-sensitivity verification-caveat notes were added across gut-health,
nutrition, sleep-health, daily-movement, personal-finance, digital-safety,
and first-aid; the underlying specific claims themselves were not audited
line-by-line (flagged as a lower-priority follow-up, same as noted in
batch 1). Both batches deployed and live-verified (2026-08-28) — the
mental-health fix specifically confirmed live via curl before batch 2 was
even started, per explicit priority.

## Law — technology-level tracking (9 technologies)

Note: the "Academy rollout order" table previously estimated 12
technologies for Law based on an unverified early count — the actual,
confirmed count is **9**, corrected here and in that table.

| Technology | Registry key | Rubric status before | Work done | Status |
|---|---|---|---|---|
| legal-fundamentals | law/legal-fundamentals/overview | None | Prerequisite/hook/analogy/try-it added; verification-caveat note (BNS/BNSS/BSA 2023 transition); law-hierarchy → `stack` FlowDiagram | Done (batch 1) |
| constitutional-law | law/constitutional-law/overview | None | Prerequisite/hook/analogy/try-it added; Article 32 writs ConceptBoxGrid (4 boxes) | Done (batch 1) |
| clat-prep | law/clat-prep/overview | None (already had `(needs verification)` tags on dates/eligibility — good existing discipline) | Prerequisite/hook/analogy/try-it added (standard variant applies — Law is a tail-vertical academy, not the exam-prep cluster); section-weighting ConceptBoxGrid (4 boxes) | Done (batch 1) |
| aibe-bar-exam | law/aibe-bar-exam/overview | None | Prerequisite/hook/analogy/try-it added; verification-caveat note (fees/passing marks); enrollment-process → `flow` FlowDiagram (5 steps) | Done (batch 1) |
| judiciary-exams | law/judiciary-exams/overview | None | Prerequisite/hook/analogy/try-it added; verification-caveat note (state-varying salary/pattern); three-tier-entry → `stack` FlowDiagram | Done (batch 1) |
| consumer-protection | law/consumer-protection/overview | None | Prerequisite/hook/analogy/try-it added; three-tier-redressal → `stack` FlowDiagram | Done (batch 1) |
| civil-law-procedure | law/civil-law-procedure/overview | None | Prerequisite/hook/analogy/try-it added; study-approach → `flow` FlowDiagram (3 steps) | Done (batch 2) |
| legal-career-growth | law/legal-career-growth/overview | None | Prerequisite/hook/analogy/try-it added; 3-stage career arc → `flow` FlowDiagram | Done (batch 2) |
| law | law/law/overview | None | Prerequisite/hook/analogy/try-it added; verification-caveat note added; 3-module overview → `flow` FlowDiagram | Done (batch 2) |

**Batch 1 notes (2026-08-28):** All 9 technologies in `lib/data/academies.ts`'s
Law navigation confirmed self-mapped in the content registry (`law/*`), no
aliasing risk. Confirmed the rubric-variant question before starting:
Law's exam-flavored technologies (clat-prep, aibe-bar-exam, judiciary-exams)
still use the **standard** rubric variant, not the lighter exam-prep
variant — per the tracker's own "Rubric variants" section, the exam-prep
variant applies ONLY to the `exams`/`central-exams`/`state-psc`/
`professional-certs` cluster; all tail-vertical academies (including Law)
use the standard variant regardless of a technology's exam-prep flavor.
All 6 files read were genuinely dense, real content, no stubs. Added
domain-sensitivity verification-caveat notes to legal-fundamentals (the
2023 IPC/CrPC/Evidence Act → BNS/BNSS/BSA transition), aibe-bar-exam (fees/
passing marks), and judiciary-exams (state-varying salary/pattern
specifics) — did not audit the underlying claims themselves, consistent
with the pattern established in Essentials. Fence-balance manually
verified per-file (all balanced); batch-wide `validate-content-fences.mjs`
clean (2579 files); all 6 new `flow`/`conceptgrid` JSON blocks parsed
successfully; `npm run predeploy` exit 0 (new `empty_code_block` WARN-only
flags confirmed as the known adjacent-fence pattern). One native-WSL build
+ live Playwright verification cycle run for all 6 pages: all render with
no crashes, diagrams present (3-5 per page), Academies dropdown works.
Deployed and live-verified (2026-08-28): all 6 pages 200, diagrams render
in both themes, Academies dropdown working, `npm run predeploy` exit 0.

**Batch 2 notes (2026-08-28):** Read the remaining 3 files
(civil-law-procedure, legal-career-growth, law) before editing — confirmed
all genuinely dense, real content, no stubs. Completed full standard-rubric
treatment on all 3, adding a verification-caveat note to `law`
(India employment-law/DPDP Act specifics). Fence-balance manually verified
per-file (all balanced); batch-wide `validate-content-fences.mjs` clean
(2579 files); all 3 new `flow` JSON blocks parsed successfully; `npm run
predeploy` exit 0 (no new WARN-only flags even). One native-WSL build +
live Playwright verification cycle run for all 3 pages: all render with no
crashes, diagrams present (3 per page), Academies dropdown works. Not yet
deployed — awaiting explicit deploy instruction.

## Law academy — COMPLETE, 9/9, deployed live (2026-08-28)

All 9 technologies (legal-fundamentals, constitutional-law, clat-prep,
aibe-bar-exam, judiciary-exams, consumer-protection — batch 1;
civil-law-procedure, legal-career-growth, law — batch 2) now have real
depth-rubric + visual treatment. Confirmed and applied the standard rubric
variant throughout (not the lighter exam-prep variant, which is scoped only
to the exams/central-exams/state-psc/professional-certs cluster) — see the
batch 1 notes above for the full reasoning. The technology count was
corrected from an earlier unverified estimate of 12 to the actual,
confirmed 9. Both batches deployed and live-verified (2026-08-28).

## Finance — technology-level tracking (11 technologies)

Note: the user's stated estimate of 12 technologies for Finance was
corrected during a live registry check — the actual, confirmed count is
**11**, corrected here and in the "Academy rollout order" table.

| Technology | Registry key | Rubric status before | Work done | Status |
|---|---|---|---|---|
| accounting-basics | finance/accounting-basics/overview | Informal hook/prerequisite prose already present, no formal rubric headers | Formalized into "Before you start"/hook/analogy/try-it; accounting-cycle → `flow` FlowDiagram (5 steps) | Done (batch 1) |
| gst-taxation | finance/gst-taxation/overview | Same informal-prose pattern | Formalized rubric headers; GST-structure ConceptBoxGrid (4 boxes) | Done (batch 1) |
| direct-tax | finance/direct-tax/overview | Same informal-prose pattern | Formalized rubric headers; five-heads-of-income ConceptBoxGrid (4 boxes) | Done (batch 1) |
| financial-markets | finance/financial-markets/overview | Same informal-prose pattern | Formalized rubric headers; instrument-types ConceptBoxGrid (4 boxes) | Done (batch 1) |
| ca-cs-foundation | finance/ca-cs-foundation/overview | Same informal-prose pattern | Formalized rubric headers; three-institutes ConceptBoxGrid (3 boxes) | Done (batch 1) |
| banking-rbi | finance/banking-rbi/overview | None (dense reference content, no prose hooks at all) | Prerequisite/hook/analogy/try-it added; verification-caveat note (rates/ratios/salaries change); 5-Cs-of-credit ConceptBoxGrid (4 boxes) | Done (batch 1) |
| sebi-nism | finance/sebi-nism/overview | None | Prerequisite/hook/analogy/try-it added; verification-caveat note (fees/limits change); capital-market-structure ConceptBoxGrid (3 boxes) | Done (batch 2) |
| ca-articleship | finance/ca-articleship/overview | None | Prerequisite/hook/analogy/try-it added; 3-year exposure → `flow` FlowDiagram | Done (batch 2) |
| ca-intermediate | finance/ca-intermediate/overview | None | Prerequisite/hook/analogy/try-it added; CA exam path → `flow` FlowDiagram (4 steps) | Done (batch 2) |
| ca-final | finance/ca-final/overview | Had a strong existing hook ("Why This Is Not Just GST"), no formal rubric headers | Formalized into "Before you start"/hook/analogy/try-it; Group I/II papers ConceptBoxGrid (4 boxes) | Done (batch 2) |
| credit-analysis | finance/credit-analysis/overview | None | Prerequisite/hook/analogy/try-it added; 5-Cs-of-credit ConceptBoxGrid (4 boxes) | Done (batch 2) |

**Batch 1 notes (2026-08-28):** All 11 technologies in `lib/data/academies.ts`'s
Finance navigation confirmed self-mapped in the content registry
(`finance/*`), no aliasing risk. This corrected the user's stated estimate
of 12 to the actual confirmed count of 11 — flagged and corrected
immediately, same discipline as the earlier Law correction (stated 12,
actual 9). Five of the six files read (accounting-basics, gst-taxation,
direct-tax, financial-markets, ca-cs-foundation) already had a distinctive,
consistent informal-prose pattern — a "What this technology covers" +
"Why it matters" structure with prerequisite framing and existing
`(needs verification)` tags on volatile figures — good existing discipline,
just not in the site's formal rubric header format. Formalized these into
"Before you start" + "Why This Exists (The Hook)" + Analogy + Try-it
without disturbing the existing good content, same approach as Education's
dsa/overview.md earlier. banking-rbi was the one exception — pure dense
reference content with no prose hooks at all — needed full standard
treatment plus a new verification-caveat note. Fence-balance manually
verified per-file (all balanced); batch-wide `validate-content-fences.mjs`
clean (2579 files); all 6 new `flow`/`conceptgrid` JSON blocks parsed
successfully; `npm run predeploy` exit 0 (financial-markets' new
`abrupt_cutoff` WARN-only flag manually verified as a false positive — file
ends cleanly with a complete sentence in an italicized disclaimer). One
native-WSL build + live Playwright verification cycle run for all 6 pages:
all render with no crashes, diagrams present (3-5 per page), Academies
dropdown works. Deployed and live-verified (2026-08-28): all 6 pages 200,
diagrams render in both themes, Academies dropdown working, `npm run
predeploy` exit 0.

**Batch 2 notes (2026-08-28):** Read the remaining 5 files (sebi-nism,
ca-articleship, ca-intermediate, ca-final, credit-analysis) before editing
— confirmed all genuinely dense, real content, no stubs. ca-final was a
partial case similar to Education's dsa/overview.md and Finance's earlier
5 batch-1 files: it already had a strong existing hook ("Why This Is Not
'Just GST'") but lacked the formal rubric headers — formalized without
disturbing the existing good content. Added a verification-caveat note to
sebi-nism (NISM fees/SEBI limits change). Fence-balance manually verified
per-file (all balanced); batch-wide `validate-content-fences.mjs` clean
(2579 files); all 5 new `flow`/`conceptgrid` JSON blocks parsed
successfully; `npm run predeploy` exit 0 (new `empty_code_block` WARN-only
flags confirmed as the known adjacent-fence pattern). One native-WSL build
+ live Playwright verification cycle run for all 5 pages: all render with
no crashes, diagrams present (3-4 per page), Academies dropdown works. Not
yet deployed — awaiting explicit deploy instruction.

## Finance academy — COMPLETE, 11/11, deployed live (2026-08-28)

All 11 technologies (accounting-basics, gst-taxation, direct-tax,
financial-markets, ca-cs-foundation, banking-rbi — batch 1; sebi-nism,
ca-articleship, ca-intermediate, ca-final, credit-analysis — batch 2) now
have real depth-rubric + visual treatment. The technology count was
corrected from the user's stated estimate of 12 to the actual, confirmed
11 — see the batch 1 notes above. Both batches deployed and live-verified
(2026-08-28).

## Agriculture — technology-level tracking (6 technologies)

Note: the user's stated estimate of 7 technologies for Agriculture was
corrected during a live registry check — the actual, confirmed count is
**6**, corrected here and in the "Academy rollout order" table.

| Technology | Registry key | Rubric status before | Work done | Status |
|---|---|---|---|---|
| organic-farming | agriculture/organic-farming/overview | None (module-based style, no rubric) | Prerequisite/hook/analogy/try-it added; 6-module overview → `stack` FlowDiagram | Done |
| soil-science | agriculture/soil-science/overview | Informal hook/prerequisite prose already present (same Finance-batch-1-style pattern), no formal rubric headers | Formalized into "Before you start"/hook/analogy/try-it; soil-types ConceptBoxGrid (4 boxes) | Done |
| horticulture | agriculture/horticulture/overview | Same informal-prose pattern | Formalized rubric headers; technology-coverage ConceptBoxGrid (4 boxes) | Done |
| icar-ibps-afo | agriculture/icar-ibps-afo/overview | None (dense reference content) | Prerequisite/hook/analogy/try-it added; verification-caveat note (MSP/scheme amounts change); cropping-seasons ConceptBoxGrid (3 boxes) | Done |
| crop-science | agriculture/crop-science/overview | None (dense reference content) | Prerequisite/hook/analogy/try-it added; IPM-principles ConceptBoxGrid (4 boxes) | Done |
| agri-business | agriculture/agri-business/overview | Same informal-prose pattern as soil-science/horticulture | Formalized rubric headers; technology-coverage ConceptBoxGrid (4 boxes) | Done |

**Notes (2026-08-28):** All 6 technologies in `lib/data/academies.ts`'s
Agriculture navigation confirmed self-mapped in the content registry
(`agriculture/*`), no aliasing risk. This corrected the user's stated
estimate of 7 to the actual confirmed count of 6 — same live-verification
discipline as the Law (12→9) and Finance (12→11) corrections. Read all 6
files before editing any; 3 (soil-science, horticulture, agri-business)
shared the same informal-hook prose pattern seen in Finance batch 1 —
formalized without disturbing the existing good content. organic-farming
had a completely different module-based style (with placeholder "Add your
real experience here" text in its Interview Prep section — noted but out
of scope, since that's the Interview tier not Tier-0 overview.md).
icar-ibps-afo and crop-science were dense reference content needing full
standard treatment; icar-ibps-afo also got a verification-caveat note given
its volatile MSP/scheme-amount figures. Since Agriculture has only 6
technologies total, this single batch completes the entire academy.
Fence-balance manually verified per-file (all balanced); batch-wide
`validate-content-fences.mjs` clean (2579 files); all 6 new
`flow`/`conceptgrid` JSON blocks parsed successfully; `npm run predeploy`
exit 0 (organic-farming's `abrupt_cutoff` WARN-only flag manually verified
as a pre-existing false positive — file ends with a trailing `---` divider
unrelated to this edit). One native-WSL build + live Playwright
verification cycle run for all 6 pages: all render with no crashes,
diagrams present (3-6 per page), Academies dropdown works. Not yet
deployed — awaiting explicit deploy instruction.

## Agriculture academy — COMPLETE, 6/6 (2026-08-28)

All 6 technologies now have real depth-rubric + visual treatment,
completed in a single batch since the academy only has 6 technologies
total (corrected from a stated estimate of 7).
