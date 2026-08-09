# Jenkins — PYQ (Previously Asked / Practice Questions)

**Framing note:** Jenkins (via CloudBees) doesn't administer a proctored public certification with a leaked-question archive the way some vendor exams do. What follows is built from this guide's own Overview/Intermediate/Advanced/Troubleshooting material, framed as practice questions grounded in real, documented Jenkins behavior.

---

### 1. (Domain: Architecture) Why should the Jenkins controller never run build jobs directly, even for a "quick, harmless" job?

**Answer:** A hung, memory-heavy, or malicious build running on the controller can degrade or take down the entire Jenkins instance, not just that one job — the controller is responsible for scheduling and coordinating every job across the whole instance, so resource exhaustion there has a blast radius far beyond a single build. Agent isolation exists specifically to contain that blast radius to just the affected agent, which is why "just this once, it's a quick job" is a real, avoidable risk rather than a harmless shortcut.

---

### 2. (Domain: Pipeline as Code) What specific problems did moving from UI-configured jobs to a `Jenkinsfile` checked into the repository solve?

**Answer:** UI-configured jobs had no review process (changes made by clicking through the UI directly), no change history, and no guarantee the job's actual configuration matched what was in the repository at any given commit — the pipeline definition and the code it built could silently diverge. A `Jenkinsfile` checked into the same repository it builds is reviewed via the normal pull-request process like any code change, has full Git history, and is exactly reproducible for any specific commit, since the pipeline definition travels with the code itself.

---

### 3. (Domain: post block) Why does cleanup/notification logic belong in a pipeline's `post` block rather than as the final steps of the last stage?

**Answer:** The `post` block (with conditions like `always`, `success`, `failure`, `unstable`) runs regardless of which stage the pipeline actually reached or failed at. Code placed as the final steps of the last stage only runs if every prior stage succeeded — if the pipeline fails at an earlier stage, those "final" cleanup/notification steps are simply skipped entirely, which is exactly the scenario where reliable cleanup and failure notification matter most.

---

### 4. (Domain: Shared Libraries) Why does this guide specifically recommend pinning a Shared Library import to a tagged version rather than a floating branch?

**Answer:** Importing from a floating branch (like the library's default branch) means every consuming pipeline's behavior can change the instant anyone pushes a new commit to that branch — a library change intended for one team's pipeline could silently and immediately alter the behavior of every other team's pipeline importing the same unpinned reference. Pinning to a specific tagged version means a library update only affects a consuming pipeline when that pipeline's `@Library` reference is deliberately updated, giving teams control over when they adopt a change.

---

### 5. (Domain: Plugin Ecosystem) Why is Jenkins' plugin ecosystem described as both a major strength and a real, recurring operational risk?

**Answer:** Plugins are what let Jenkins extend to almost any tool or workflow, which is a genuine strength — but every installed plugin is also a dependency that can break on a Jenkins core upgrade, or need its own security patching independent of core. As the number of installed plugins grows ("plugin sprawl"), the surface area of things that can break during any given upgrade grows correspondingly, making plugin management an ongoing operational cost, not a one-time setup decision.

---

### 6. (Domain: Controller-Agent Architecture) What's the practical benefit of running builds on a fleet of agents rather than a single, larger controller machine?

**Answer:** Beyond the blast-radius isolation (a failed or resource-heavy build on one agent doesn't affect the controller or other agents), a fleet of agents allows horizontal scaling of build capacity and can support genuinely different environments per agent (different OS, different installed toolchains) for jobs with different requirements — a single controller machine, even a large one, can't provide that same environment diversity or fault isolation.

---

### 7. (Domain: Pipeline Syntax) What's the difference between a `stage` and a `step` in a Declarative Pipeline?

**Answer:** A `stage` is a logical, named grouping of work (e.g., "Build," "Test," "Deploy") that appears as a distinct visual segment in Jenkins' pipeline visualization — it's the organizational unit humans reason about when reading pipeline status. A `step` is an individual action within a stage (running a shell command, checking out code, archiving an artifact) — stages group steps into meaningful phases, but the actual work happens at the step level.

---

### 8. (Domain: Troubleshooting) A Jenkins core upgrade causes several previously-working pipelines to fail. What's the most likely category of cause, given this guide's own framing of plugin risk?

**Answer:** Plugin version incompatibility — a core upgrade can change APIs or behavior that installed plugins depend on, and a plugin that isn't yet updated to support the new core version can break in ways that manifest as pipeline failures, even though the pipeline's own Jenkinsfile didn't change. This is exactly the "plugin sprawl" risk this guide names directly — more installed plugins means more individual compatibility surfaces that can break on any given core upgrade.

---

### 9. (Domain: Credentials) Why does Jenkins provide a dedicated credentials management system rather than relying on environment variables set directly in a Jenkinsfile?

**Answer:** Credentials embedded directly in a Jenkinsfile (checked into a repository) would be visible to anyone with repository read access and preserved in Git history indefinitely, even if later removed. Jenkins' credentials system stores sensitive values separately, injecting them into a pipeline's execution environment at runtime without ever exposing the actual secret value in the Jenkinsfile itself or in build logs (which Jenkins also masks credential values from by default).

---

### 10. (Domain: Parallel Stages) When would a team use parallel stages in a Jenkins pipeline, and what's the tradeoff versus running everything sequentially?

**Answer:** Parallel stages are used when multiple independent pieces of work (running different test suites, building multiple independent components) don't depend on each other's output and can genuinely execute simultaneously, reducing total pipeline wall-clock time. The tradeoff is increased resource demand — running stages in parallel requires enough available agent capacity to actually execute them simultaneously, and debugging a parallel pipeline's output can be less straightforward than following a purely sequential, linear log.
