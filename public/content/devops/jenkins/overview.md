# Jenkins

> **The leading open-source automation server**

**Category:** CI/CD
**Learning Path:** What → Why → Learning Modules → Production Example → Interview Prep

---

## What is Jenkins?

Jenkins has a controller (formerly "master") that schedules jobs and a fleet of agents that actually run them. The controller should never run build jobs itself — a hung, memory-heavy, or malicious build running on the controller can degrade or take down the entire instance, not just that one job. Agent isolation exists specifically to contain that blast radius. Plugins extend Jenkins to almost any tool or workflow, but every installed plugin is also a dependency that can break on a core upgrade or need its own security patching — plugin sprawl is a real, common source of fragile Jenkins instances in practice.

## Why Jenkins?

Before Pipeline as Code, CI/CD steps lived disconnected in a UI-configured job — changing the build process meant clicking through Jenkins' UI, with no review, no history, and no guarantee the job definition matched what was actually in the repository at any given commit. Declarative Pipeline fixes this: the entire pipeline is defined in a `Jenkinsfile` checked into the same repository it builds, reviewed via the same pull-request process as application code, and exactly reproducible for any given commit. The `post` block (`always`, `success`, `failure`, `unstable`) is the reason cleanup and notifications are reliable — it runs regardless of which stage the pipeline reached or failed at, unlike code placed inside a specific stage that an earlier failure would skip entirely.

---

## Learning Modules

### Module 01 — Jenkins Architecture
*Controller, Agents, Plugins*

**Topics covered:**

- Controller-Agent architecture — 🟢 Beginner
- Controller vs Agent responsibilities — 🟢 Beginner
- Plugin ecosystem and upgrade risk — 🟡 Intermediate

### Module 02 — Declarative Pipelines
*Jenkinsfile as Code*

**Topics covered:**

- Pipeline syntax (stages, steps, agent) — 🟢 Beginner
- post conditions (always, success, failure) — 🟢 Beginner
- Environment and credentials — 🟡 Intermediate
- Parallel stages — 🟡 Intermediate

### Module 03 — Shared Libraries
*DRY pipelines across teams*

Shared Libraries prevent copy-paste pipelines across many teams. A change to the standard build process (adding a security scan step, say) otherwise means editing every single service's Jenkinsfile individually. Centralize common functions in a library repo's `vars/` directory; teams import with `@Library`, pinned to a tagged version rather than a floating branch, so a library change can't silently alter every consuming pipeline's behavior the moment someone pushes to its default branch.

**Topics covered:**

- Library structure (vars/, src/) — 🟡 Intermediate
- @Library annotation and version pinning — 🟡 Intermediate
- Implicit vs explicit loading — 🟡 Intermediate
- Versioned libraries — 🔴 Advanced

### Module 04 — Production Patterns
*High availability, security, scaling*

Production Jenkins runs agents on Kubernetes for dynamic, ephemeral provisioning rather than a fixed pool of always-on machines. Credentials live in Jenkins' Credentials Store or an external secrets manager (HashiCorp Vault) for automatic rotation. Configuration as Code (CasC) defines the Jenkins instance's own configuration — security realm, authorization, plugins — as versioned YAML instead of manual UI clicks, making disaster recovery and replicating a second instance actually tractable.

**Topics covered:**

- Jenkins HA with active/standby controller — 🔴 Advanced
- Credentials management (Vault) — 🔴 Advanced
- Agent autoscaling on Kubernetes — 🔴 Advanced
- Pipeline performance optimization — 🔴 Advanced

---

## Production Example

```groovy
// Production Runbook — "the pipeline used to take 10 minutes, now takes 40"

// Step 1: Look at real data before guessing at a cause.
// Jenkins' Stage View (or Blue Ocean's timeline) shows per-stage timing
// directly -- start there, not with a hunch.

// Step 2: Check the usual suspects, roughly in likely-impact order:
//   - Dependency caching broke or was never configured (full reinstall
//     every build instead of restoring from a cache)
//   - A new stage was added that could run in parallel with an existing
//     one but doesn't
//   - Agent provisioning overhead increased (a Kubernetes agent pod's
//     startup time, or a static agent pool got busier)
//   - A specific step's underlying dependency (an external API call, a
//     slow test) genuinely got slower -- needs its own investigation

// Step 3: If it's dependency caching, add explicit caching instead of a
// clean install every time:
pipeline {
    agent { kubernetes { yaml '''...''' } }
    stages {
        stage('Checkout') {
            steps {
                checkout scm
                cache(maxCacheSize: 250, caches: [
                    arbitraryFileCache(
                        path: 'node_modules',
                        cacheValidityDecidingFile: 'package-lock.json'
                    )
                ]) {
                    sh 'npm ci'
                }
            }
        }
    }
}

// Step 4: If independent stages are running sequentially, parallelize them
stage('Test') {
    parallel {
        stage('Unit') { steps { sh 'npm run test:unit' } }
        stage('Lint') { steps { sh 'npm run lint' } }
        stage('Security Scan') { steps { sh 'trivy fs .' } }
    }
}

// Step 5: Confirm the fix actually worked -- compare Stage View timing
// before/after, don't just assume the change helped.
```

---

## Interview Prep

!!! tip "PSR Formula"
    Answer every question: **Problem → Solution → Result**. 45-90 seconds max.

### Common Interview Questions

??? question "What is Jenkins and why would you use it in production?"
    **Problem:** manual build/test/deploy steps are slow and error-prone, and every developer's local environment drifts slightly differently. **Solution:** Jenkins automates the pipeline — every commit triggers a build, test run, and (if configured) deployment, defined as code in a `Jenkinsfile` rather than manual steps. **Result:** consistent, auditable delivery — the same pipeline runs identically for every commit, and the pipeline definition itself is reviewed the same way application code is.

??? question "How does Jenkins work internally? Explain the architecture."
    **Problem:** understanding what's actually orchestrating vs. actually executing matters for both scaling and debugging. **Solution:** the controller schedules jobs, stores configuration, and serves the UI; agents (permanent, Docker, Kubernetes, or cloud-provisioned) are where build steps actually execute, each agent offering one or more executors (concurrent build slots). **Result:** this separation is exactly why the controller should never run builds directly — a bad build can crash an agent without threatening the controller's own stability, which affects every other job on the instance.

??? question "What are the main components of Jenkins?"
    **Problem:** "Jenkins" names several distinct pieces useful to separate when reasoning about a pipeline. **Solution:** the controller (orchestration, UI, job config); agents/nodes (execution); executors (concurrent build slots per agent); the workspace (a build's working directory on its agent); and the `Jenkinsfile` (the pipeline definition itself, checked into source control). **Result:** knowing this separation clarifies questions like "why did my build fail on one agent but not another" — workspace state and agent-specific tooling, not the pipeline definition, are usually the answer.

??? question "How do you handle failures in Jenkins?"
    **Problem:** a failed stage partway through a pipeline can leave a workspace dirty, a deployment half-applied, or a team unnotified. **Solution:** `post { failure {} }` and `post { always {} }` blocks run regardless of which stage failed — use them for cleanup (`cleanWs()`), notifications (Slack/email), and automatic rollback (`kubectl rollout undo`, or re-deploying a known-good `stable`-tagged image). **Result:** failures become visible and recoverable automatically, rather than requiring someone to notice a broken pipeline and manually clean up.

??? question "What is your production experience with Jenkins?"
    This is a genuinely personal question — answer with a real incident using the Problem → Solution → Result structure: a pipeline that started silently failing, a credential rotation that broke builds, a shared library change that had unexpected blast radius. Interviewers are listening for whether you've actually operated Jenkins under real constraints, not just written a Jenkinsfile once.

??? question "How do you monitor and observe Jenkins in production?"
    **Problem:** a Jenkins instance itself can degrade (disk filling with old build artifacts, a plugin leaking memory) independently of any individual pipeline's health. **Solution:** the Stage View/Blue Ocean for per-pipeline timing, `Manage Jenkins → Manage Nodes` for agent/executor health, disk usage monitoring on the controller (`df -h /var/lib/jenkins`), and a Build Discarder policy on every job so artifacts don't accumulate indefinitely. **Result:** most real Jenkins outages trace back to disk exhaustion or a stuck/offline agent — both are visible well before they cause an outage if actually monitored.

??? question "What are the security considerations for Jenkins?"
    **Problem:** Jenkins often has broad credentials (cloud, registry, deployment) and, by default, weak authorization. **Solution:** matrix-based or role-based authorization instead of "any logged-in user can do anything," a controller with zero executors (enforcing agent isolation at the config level, not just convention), Groovy sandbox script approval for untrusted pipeline sources, credentials referenced by ID and never as literal values in a Jenkinsfile, and a deliberate (not blind auto-update) plugin patching cadence. **Result:** these mirror standard least-privilege and secrets-hygiene principles, applied specifically to Jenkins' permission and credentials model.

??? question "How does Jenkins compare to alternatives?"
    This usually means a specific comparison — most often GitHub Actions. Jenkins is self-hosted (you manage infrastructure and scaling) with a mature plugin ecosystem (1800+) and works with any VCS; GitHub Actions is cloud-managed, GitHub-native, and has a simpler YAML setup with a usage-based free tier. Choose Jenkins for complex, non-GitHub, or highly customized pipelines needing full infrastructure control; choose GitHub Actions for GitHub-hosted projects wanting managed infrastructure with less operational overhead.

??? question "Explain Jenkins' Controller-Agent architecture, concretely."
    The controller never runs build steps — it schedules work and distributes it to agents based on label matching (`agent { label 'docker' }`). Agents can be permanent (always-on VMs, predictable capacity, no per-build startup cost) or ephemeral Kubernetes pods (spun up per build, torn down after, no idle cost, but real per-build pod startup latency, commonly 10-30 seconds). At real scale, a hybrid of both is common: a small static pool for latency-sensitive builds, Kubernetes agents absorbing burst capacity.

??? question "Explain Declarative Pipeline syntax, concretely."
    `pipeline { agent + environment + stages { stage { steps + post } } + post }` is the full shape. `agent` defines where it runs; `environment` sets variables (including credentials, via `credentials()`, which auto-creates `_USR`/`_PSW` variables for a username/password credential); `stages` are sequential by default, or `parallel {}` for concurrent; `when` gates a stage's execution (branch, environment variable, expression); `post` runs cleanup/notification regardless of outcome. Declarative is preferred over Scripted (raw Groovy) for anything that fits this structure — better validation, better readability, drop into a `script {}` block only for logic Declarative genuinely can't express.

---

## Official Resources

- [Jenkins User Documentation](https://www.jenkins.io/doc/)
- [Pipeline Syntax Reference](https://www.jenkins.io/doc/book/pipeline/syntax/)
- [Shared Libraries Guide](https://www.jenkins.io/doc/book/pipeline/shared-libraries/)
