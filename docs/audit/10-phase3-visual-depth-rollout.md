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
