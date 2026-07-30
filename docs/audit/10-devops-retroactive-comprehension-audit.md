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

## Batch 3 — Git, CI/CD Pipelines (cicd domain)

CI/CD (`devops/cicd/*`) is entirely self-hosted, no aliasing. Git
(`devops/git/*`) is split: overview/fundamentals/interview/troubleshooting
are self-hosted, advanced/certification/cheatsheets/installation/
intermediate/prerequisites/projects/roadmap are aliased to
`infrastructure/git/*` — checked both roots per the batch-1 lesson.

**CI/CD — passes on accuracy and tab-depth, failed `is_beginner_ready`,
fixed.** Read `overview.md` in full: hook present, terminology (CI/CD,
GitOps) defined before use, pipeline-stage table and GitHub Actions
example both accurate, deployment-strategy comparison table correct
(rolling/blue-green/canary/recreate downtime and rollback tradeoffs all
check out). But neither `overview.md` nor `fundamentals.md` had an
analogy, diagram, or try-it — same gap as Shell Scripting, batch 1.
**Fixed:** added an airport-security-checkpoint analogy to `overview.md` —
verified genuinely explanatory, not decorative: it maps the fail-fast
mechanic (a failed check stops you right there) directly onto why a
failed pipeline stage blocks deployment — plus a pipeline-stages ASCII
diagram matching the stage list beneath it, and a Try It that has the
reader push a real GitHub Actions workflow with a deliberately failing
step and watch the deploy step get skipped, not just failed (confirmed
this matches actual GitHub Actions behavior — a job stops at a failing
step by default, downstream steps show as skipped). A relay-race analogy
(baton handoff = artifact handoff, dropped baton = failed stage) plus a
stage-flow diagram and a local `set -e`/`false` fail-fast demo were added
to `fundamentals.md` — verified the demo's bash behavior is correct
(`set -e` does exit immediately on `false`, the "Deploy stage..." line
genuinely never prints).

**Git — passes on accuracy and tab-depth, failed `is_beginner_ready`,
fixed.** Three-trees model, branches-as-pointers, merge vs. rebase, revert
vs. reset all correctly sequenced Overview → Fundamentals, no dead
cross-references (checked: Overview's one Prerequisites pointer is valid).
Neither tab had an analogy, diagram, or try-it. **Fixed:** added a
"track changes in a shared document" analogy plus a working-directory →
staging → local-repo → remote diagram and a staging-snapshot try-it to
`overview.md` — the try-it's claim that this exact confusion is covered
in the Fundamentals tab was independently verified, not assumed:
Fundamentals' Three Trees section literally opens with "most early
confusion about 'why didn't my commit include that change' comes from
not having a clear mental model of them," so the cross-reference is real,
not dead. Added a packing-a-box-before-mailing analogy plus a three-stage
diagram and a branches-are-pointers try-it to `fundamentals.md` — the
try-it's git commands (`git branch`, `git switch`) and its claim that
`main`'s file content stays untouched after committing on a separate
branch were checked against actual git behavior and are correct (branch
creation is a pointer operation, not a copy).

### Batch 3 status: flagged vs fixed vs deferred

- **Fixed:** CI/CD and Git both missing `is_beginner_ready` scaffolding in
  Overview and Fundamentals — analogy, diagram, and try-it added to all 4
  files, each independently verified genuinely pedagogical (accurate
  mechanics, real cross-references) rather than just present.
- **Flagged, not fixed:** none this batch.
- **Deferred:** none.

## Batch 4 — Terraform, Ansible, Jenkins (iac + cicd domains)

All three aliased `devops/*` → `infrastructure/*` (checked the real, served
files per the batch-1 lesson).

**Terraform — passes on accuracy and tab-depth, failed `is_beginner_ready`,
fixed.** `overview.md`'s IaC definition, "Why Terraform Over Alternatives"
comparison, and IAM guidance all check out; `fundamentals.md`'s HCL syntax
coverage is correct. Neither tab had an analogy, diagram, or try-it —
terser, more reference-sheet-style writing than CI/CD or Git, with
near-zero connecting prose before this pass. **Fixed:** added a
blueprint-vs-building-by-memory analogy + a plan/apply flow diagram to
`overview.md`, plus a Try It using the real `hashicorp/local` provider to
run a full plan → apply → drift-detection cycle with no cloud account
needed — verified this is genuine, correct Terraform behavior (the `local`
provider and `local_file` resource are real, and `terraform plan` does
detect and offer to recreate a manually-deleted managed file). Added a
shopping-list-with-substitutions analogy (`variable`/`resource`/`output`
blocks) + a diagram to `fundamentals.md`, plus a Try It that extends the
Overview's own `local_file` example with a variable override
(`terraform apply -var="message=..."`) and `terraform output` — verified
both commands are correct, real Terraform CLI syntax and behavior, and the
example deliberately builds on Overview's rather than introducing an
unrelated one.

**Ansible — passes on accuracy and tab-depth, failed `is_beginner_ready`,
fixed.** Agentless architecture, module/task/playbook/inventory concepts,
and the lab setup are all accurate. Neither tab had an analogy, diagram,
or try-it. **Fixed:** added a substitute-teacher-vs-permanent-teacher
analogy (agentless vs. agent-based config management) to `overview.md`,
plus a Try It using `ansible localhost -m file -a "path=/tmp/demo.txt
state=touch"` run twice to demonstrate idempotency directly —
independently verified via a targeted check (not assumed from memory):
the `file` module's `state=touch` genuinely reports `changed=false` on a
second run against an already-existing file, so the try-it's claimed
output is correct. Added a recipe-card-to-multiple-kitchens analogy
(inventory/playbook/task/module) + a diagram to `fundamentals.md`, plus a
Try It that runs the file's own "first playbook" example locally via
`ansible_connection=local` and explicitly ties its idempotent second-run
behavior back to the Overview Try It's ad-hoc-command version — a real,
checked cross-reference, not just an assertion.

**Jenkins — passes on accuracy and tab-depth, failed `is_beginner_ready`,
fixed.** Controller/Agent architecture and declarative pipeline syntax
both accurate. Neither tab had an analogy, diagram, or try-it. **Fixed:**
added an air-traffic-control-tower analogy (Controller coordinates,
Agents execute) + a Try It running the real `jenkins/jenkins:lts-jdk17`
Docker image end-to-end (init password from container logs, a Freestyle
job, Console Output) to `overview.md` — verified the image name, port
mapping (8080 web UI / 50000 agent JNLP), and initial-setup-password
behavior are all accurate to how Jenkins' Docker image actually works.
Added an assembly-line-with-quality-gates analogy (`stages` block) + a
diagram to `fundamentals.md`, plus a Try It using a minimal declarative
pipeline with a deliberately failing `Test` stage — verified this is
correct declarative-pipeline behavior: a failed stage stops the pipeline,
and downstream stages show as skipped in the Stage View, not failed.

**Pattern confirmation:** all three technologies in this batch had the
identical defect as Shell Scripting (batch 1), CI/CD, and Git (batch 3) —
accurate, correctly-sequenced content that nonetheless failed
`is_beginner_ready` purely on missing analogy/diagram/try-it scaffolding.
Terraform in particular was the terse-reference-sheet end of this pattern
rather than the dense-prose end (CI/CD, Git) — both ends of that spectrum
had the same underlying gap.

### Batch 4 status: flagged vs fixed vs deferred

- **Fixed:** Terraform, Ansible, and Jenkins all missing `is_beginner_ready`
  scaffolding in Overview and Fundamentals — analogy, diagram, and try-it
  added to all 6 files, each independently verified genuinely pedagogical
  and technically accurate (tool behavior checked, not assumed) rather
  than just present.
- **Flagged, not fixed:** none this batch.
- **Deferred:** none.

## Batch 5 — Prometheus, Grafana (monitoring domain)

Both aliased `devops/*` → `infrastructure/*` (checked the real, served files).

**Prometheus — passes on accuracy and tab-depth, failed `is_beginner_ready`,
fixed.** Architecture (scrape → TSDB → PromQL/Alertmanager), "How It Works"
pull-model diagram, and the metric-type coverage in Fundamentals all check
out. Neither `overview.md` nor `fundamentals.md` had an analogy, diagram,
or try-it. **Fixed:** added a security-camera-vs-clipboard-check analogy
to `overview.md` — verified it correctly ties into the file's own
"was it slow before the last deployment?" retrospective-query point — plus
a Try It running the real `prom/prometheus` Docker image and watching its
own `/targets` self-scrape `Last Scrape` timestamp advance on its own every
~15s, confirmed accurate to Prometheus's actual default scrape interval and
self-monitoring config. Added a utility-meter analogy (Counter=odometer,
Gauge=live dial, Histogram=bucketed meter, correctly explaining why
percentiles need buckets and can't be reconstructed from a running total)
plus a Try It using the real `prometheus-client` Python library to run a
live Counter and observe why `rate()` — not the raw value — is the useful
number, to `fundamentals.md`. Verified the Python `Counter`/
`start_http_server` usage, the `/metrics` endpoint behavior, and the
claimed `rate(...[1m])` output (~1/sec, matching a once-per-second
increment) are all correct.

**Grafana — passes on accuracy and tab-depth, `fundamentals.md` was
already partially fixed by an earlier, unrelated commit (`85e787c`) that
added a hook, analogy, and try-it — this batch closed the one remaining
gap (a missing diagram) rather than duplicating existing work; `overview.md`
needed the full scaffolding.** **Fixed:** added a universal-remote-vs-TV
analogy to `overview.md` (Grafana queries/renders, doesn't store or
generate data itself) plus a diagram, and a Try It using the real
`grafana/grafana` Docker image with Grafana's actual built-in **TestData
DB** data source (a genuine, built-in fixture Grafana ships specifically
for demos, not an invented one) and its "Random Walk" scenario — verified
accurate. Added a docker-compose flow diagram to `fundamentals.md`,
connecting the file's existing setup instructions to the provisioning/
auto-connect behavior already documented there — checked for duplication
against the existing hook/analogy/try-it first, confirmed this only fills
the one actual gap.

### Batch 5 status: flagged vs fixed vs deferred

- **Fixed:** Prometheus (Overview + Fundamentals, full scaffolding) and
  Grafana (Overview full scaffolding, Fundamentals missing diagram only)
  — all additions independently verified genuinely pedagogical and
  technically accurate (Docker images, CLI behavior, and library usage
  all checked, not assumed).
- **Flagged, not fixed:** none this batch.
- **Deferred:** none.

## Remaining batches (not yet started)

- Batch 6: Helm, ArgoCD, Istio — closes the 15-technology retroactive audit
