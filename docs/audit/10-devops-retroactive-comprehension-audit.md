# DevOps Academy — Retroactive Standard-9 Comprehension Audit

Scope correction, verified directly against git history (not taken on trust from
prior docs): `docs/audit/08-databases-comprehension-audit.md` asserts (three times)
that DevOps already has an "already-completed 18-technology comprehension audit"
in `07-roadmap-final.md`. No such section exists there — verified by direct grep.
What actually happened, reconstructed from `git log --grep="comprehension"` with
timestamps:

- The beginner-simulation-read standard (CLAUDE.md item 9 / "Standard 9") was
  added in commit `a3ed43a`, 2026-07-28 10:18.
- Seven DevOps "Phase 7" batches ran that same morning. Four of them —
  **Docker/Kubernetes** (09:07), **Networking/Git/CI-CD/Shell-Scripting** (09:15),
  **Terraform/Ansible/Jenkins/Prometheus/Grafana** (09:23), **Helm/ArgoCD/Istio**
  (09:43) — all committed *before* `a3ed43a`, i.e. under the old word-count +
  contamination-signature heuristic only. That's **14 technologies** needing a
  genuine retroactive spot-check.
- **Linux** does not appear in any comprehension-audit commit at all, ever —
  not pre-standard, not post-standard. It has never had this check. Treated as
  a first-time full read, not a spot-check.
- The remaining three batches — HA/DR/Incident/ELK-Stack, Chaos
  Engineering/Capacity Planning/SRE Automation, and Kafka/Python/Nginx/OpenShift
  (11:23–12:09) — ran *after* the standard landed and are genuinely clean.
  Cloud (Phase 8) and Databases (Phase 9) are entirely post-standard too. None
  of these need work here.

Real scope: **15 technologies** (14 retroactive + Linux first-time), not the
18+26 originally assumed. Registry currently lists 25 DevOps technologies, not
18 — the extra 10 are exactly the already-clean post-standard set, so the
retroactive scope is unaffected by the count drift.

Method: same as Cloud Phase 8 / Databases Phase 9 — four-source comparison,
the 7 standards, plus the beginner-simulation read (undefined terms before
first use, tab-depth sequencing, dead references, prerequisite-statement
accuracy checked against the file's actual content, not assumed).

## Batch 1 — Linux, Networking, Shell-Scripting (os-linux domain)

**Linux (first-time check, 12 files: overview/fundamentals/intermediate/
interview/cheatsheets/faq/installation/notes/prerequisites/pyq/
real-world-scenarios/troubleshooting) — passes.** Terms defined before first
use across Overview → Fundamentals → Intermediate (e.g. cgroups/OOM killer
introduced in Overview module list, actually explained in Intermediate with
the `kubectl describe pod` → `OOMKilled` connection spelled out). No
duplicate H1s, no dead references, no cross-tab content repetition. Tab
depth genuinely increases: Overview stays conceptual, Fundamentals gives
runnable commands, Intermediate adds troubleshooting judgment (e.g. why
`vmstat` before `iostat`, what `CLOSE-WAIT` vs `TIME-WAIT` actually implies).

**Fixed:** `prerequisites.md` claimed the course covers `ip` "at the level
needed here" as a networking command taught alongside `ss`. Verified: `ip`
never appears in overview/fundamentals/intermediate/interview — only in
`cheatsheets.md` and `notes.md` (reference-only tabs, not taught). Same
prerequisite-overclaim pattern already found three times in Cloud Phase 8
(Lambda, Azure VMs, Cloud Networking & Security) — a fourth instance, this
time in DevOps. Narrowed the claim to `ss` only and pointed to
Cheatsheets/Notes for `ip` as a reference, not a taught command.

**Networking (retroactive spot-check, 7 files) — passes, one label fix.**
Content itself is accurate and well-sequenced: OSI model, DNS resolution
chain, TLS, CIDR, load balancing, and Kubernetes networking all define terms
before use and build on each other correctly (e.g. CoreDNS introduced
conceptually in "Why", then given a concrete `nslookup`/`resolv.conf`
walkthrough in the Learning Modules). No dead references, no duplicate
boilerplate.

**Fixed:** the page's own "Learning Path" label (`What → Why → Architecture
→ Setup → Real Examples → Production → Interview Prep`) didn't match its
actual section headers (`What → Why → Learning Modules → Production Example
→ Interview Prep`) — a stale label from an earlier draft. Corrected to match
the real structure.

**Shell Scripting (retroactive spot-check) — corrected during review, real
defect exists but is narrower than first diagnosed.** The initial pass of
this audit checked only `public/content/devops/shell-scripting/` on disk,
found a single `overview.md`, and concluded the technology was missing
Fundamentals/Intermediate/Advanced/Interview tabs entirely. That check
missed `lib/content/index.ts`: every `devops/shell-scripting/*` slug —
including `overview` itself — is aliased to `infrastructure/shell-scripting/*`,
a genuinely complete 14-file, ~12,600-word set (same shadowing pattern
already documented in `docs/quiz-questions-openshift-python-shell.sql`'s
own header comments). The technology is not missing tabs; the on-disk
`devops/shell-scripting/overview.md` is simply dead weight, correctly
shadowed and never served.

The real defect, checking the file set that's actually live
(`infrastructure/shell-scripting/*`): `overview.md` and `fundamentals.md`
are both pure command/code reference — `grep -il "analog\|diagram\|try it"`
across all 14 files returns nothing for either. `overview.md` has a
plain-English hook ("Shell scripting is the glue of DevOps...") and does
explain *why* `set -euo pipefail` matters in prose, but neither file has
an analogy, a diagram, or a 2-minute try-it prompt — failing CLAUDE.md's
`is_beginner_ready` bar (hook + analogy + diagram + annotated example +
try-it, all required), just not for the reason or with the scope first
assumed. This is "add pedagogical scaffolding to 2 existing, otherwise
solid files," not "write 5 tabs from scratch."

**Fixed (follow-up to the correction above):** added the missing scaffolding
to `infrastructure/shell-scripting/overview.md` and `fundamentals.md` — an
analogy (script-as-recipe-card for Overview; variable/conditional/loop as
labeled-box/fork-in-road/repeat-block for Fundamentals), an ASCII diagram
in each (script execution order; Bash control-flow at a glance), and a
2-minute Try It exercise in each (a `set -euo pipefail` failure demo;
a `${1:-default}` argument-fallback demo). Both files otherwise already had
solid annotated examples, so this closes the `is_beginner_ready` gap
without a rewrite.

### Batch 1 status: flagged vs fixed vs deferred

- **Fixed:** Linux prerequisite overclaim (`ip` command); Networking
  Learning Path label mismatch; Shell Scripting's missing
  analogy/diagram/try-it scaffolding in `overview.md` and `fundamentals.md`.
- **Corrected during review:** Shell Scripting's initial diagnosis (single
  file, missing tabs entirely) was wrong — it checked the shadowed
  `devops/shell-scripting/` directory, not the aliased, complete,
  ~12,600-word `infrastructure/shell-scripting/*` set the registry
  actually serves. See corrected finding above.
- **Deferred:** none — all batch 1 findings are now either fixed or
  corrected. Linux, Networking, and Shell Scripting are all clean under
  the full standard as of this commit.

## Batch 2 — Docker, Kubernetes (containers domain)

Both aliased across `devops/` and `infrastructure/` roots (`lib/content/index.ts`)
— checked every tab against its real, served source, not just the shadowed
`devops/` directory, per the lesson from batch 1's Shell Scripting correction.

**Docker (12 tabs: overview/fundamentals/intermediate/advanced(infra)/
interview/cheatsheets/troubleshooting/certification(infra)/installation(infra)/
prerequisites(infra)/projects(infra)/roadmap(infra)) — passes cleanly, no
fixes needed.** Terms defined before use throughout (namespaces/cgroups
introduced conceptually in Overview, `CMD` vs `ENTRYPOINT` and volumes vs.
bind mounts genuinely explained from scratch in Fundamentals, not assumed).
Tab depth increases correctly: Fundamentals covers single-container
mechanics, Intermediate adds multi-stage builds/exit-code troubleshooting/
Compose, Advanced adds Swarm orchestration and a full CI/CD pipeline. No
dead references, no duplicate H1s, prerequisites.md's claims match what's
actually taught. This is the cleanest technology checked in this audit so
far.

**Kubernetes (13 tabs: overview/fundamentals/intermediate/advanced(self)/
interview/cheatsheets(self)/certification(infra)/installation(infra)/
labs(infra)/prerequisites(infra)/projects(infra)/roadmap(infra)/
troubleshooting(infra) — note `devops/kubernetes/troubleshooting.md` exists
on disk but is shadowed by the infra alias, same dead-weight pattern as
Shell Scripting's old overview.md; not re-flagging as a separate defect,
just noting for awareness) — passes, two fixes.** Content itself is
excellent: the Overview→Fundamentals→Intermediate→Advanced progression
genuinely deepens (Overview stays conceptual, Fundamentals introduces
`kubectl`/Pod/Deployment/Service YAML, Intermediate adds StatefulSet/RBAC/
storage classes, Advanced covers QoS eviction order, scheduler internals,
HPA/VPA/CA/KEDA, PDBs) — the strongest tab-depth example seen in this audit.
Interview tab's Q8 (Cluster Autoscaler/GPU-node debugging) is correctly
cross-referenced from Advanced's Cluster Autoscaler section — verified, not
a dead reference.

**Fixed:**
1. Same stale "Learning Path" label mismatch as Networking in batch 1 —
   overview.md claimed `What → Why → Architecture → Setup → Real Examples →
   Production → Interview Prep`, actual structure is `What → Why → Learning
   Modules → Production Example → Interview Prep`. This is now the third
   instance of this exact mismatch (Networking, Kubernetes, and by pattern
   likely worth a quick grep across the rest of the DevOps academy once this
   audit's remaining batches are done).
2. `fundamentals.md`'s ConfigMaps/Secrets section claimed "see Docker's own
   Fundamentals tab on why secrets shouldn't live in an image" — verified via
   grep, Docker's Fundamentals tab never mentions secrets at all; that
   content is in Docker's Intermediate tab (`.dockerignore` note) and
   Overview's security interview answer. Corrected the cross-reference to
   point at the right tabs.

### Batch 2 status: flagged vs fixed vs deferred

- **Fixed:** Kubernetes Learning Path label mismatch; Kubernetes → Docker
  cross-reference pointing at the wrong tab.
- **Flagged, not fixed:** none — both fixes were small, in-scope corrections.
- **Deferred:** worth a sitewide grep for the "Learning Path" stale-label
  pattern once all 6 batches are done, given it's now hit 2 of 5 technologies
  checked (Networking, Kubernetes) — logged here rather than expanding this
  batch's scope.

## Remaining batches (not yet started)

- Batch 3: Git, CI/CD Pipelines — content and audit findings for this batch
  were staged on disk alongside batch 1/2, but were not part of this
  review round's scope and have not been independently verified or merged
  yet. Left staged, untouched, for a dedicated review pass.
- Batch 4: Terraform, Ansible, Jenkins
- Batch 5: Prometheus, Grafana
- Batch 6: Helm, ArgoCD, Istio — closes the 15-technology retroactive audit
