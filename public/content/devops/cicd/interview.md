# CI/CD Pipelines — Interview Q&A

**Q: What's the actual difference between Continuous Delivery and Continuous Deployment?**
A: Continuous Delivery means every change that passes automated checks is *ready* to deploy, but a human explicitly approves the actual production release. Continuous Deployment removes that human gate entirely — a passing pipeline deploys to production automatically. The confusion between these two is extremely common, including among practitioners, so stating the distinction precisely and confidently is itself a signal in an interview.

**Q: Walk me through what happens when a developer pushes a commit, from push to production.**
A: Trigger detected → ephemeral build environment spins up → dependencies installed (ideally from cache) → build runs → test suite runs, pipeline halts here on failure → artifact packaged (e.g. Docker image) and pushed to a registry → deployed to staging automatically → either an automated gate or manual approval → deployed to production, ideally via a progressive strategy (canary/blue-green) rather than an instant full cutover. A strong answer names *why* each gate exists, not just that it exists.

**Q: Your pipeline is slow — 15 minutes for a change that should take 2. How do you approach diagnosing it?**
A: Don't guess — most CI/CD platforms show a per-stage timing breakdown; start there. Common real causes, roughly in order of likelihood: no dependency caching (reinstalling from scratch every run), a serial test suite that could be parallelized/sharded, an oversized Docker build context being sent to the daemon on every build, or a slow, non-cached base image pull. The interview signal here is diagnostic process, not naming the answer immediately — "I'd check the timing breakdown first" is a stronger answer than guessing a cause outright.

**Q: How do you handle secrets in a CI/CD pipeline?**
A: Never in the pipeline file or source control — always via the CI/CD platform's own secrets store, injected as environment variables at runtime. At a more advanced level: scope secrets to only the jobs that need them (a test job shouldn't have production deploy credentials), and prefer short-lived OIDC-federated credentials over long-lived static keys where the cloud provider supports it, since a leaked short-lived token is far less damaging than a leaked permanent key.

**Q: What would you do if a bad deploy just went to production and users are seeing errors right now?**
A: Roll back first, diagnose second — restoring service takes priority over root-causing while users are actively affected. If the deployment strategy supports it (blue-green, or a still-running previous version), rollback should be a routing change, not a rebuild — that's the entire point of designing for rollback ahead of time rather than improvising it during an incident. Only after service is restored does root-cause investigation happen, ideally as a written postmortem.

**Q: When would you choose canary deployment over blue-green, or vice versa?**
A: Blue-green is simpler and gives an instant, complete rollback, but costs double the infrastructure during the transition and doesn't limit *how many* users see a bad deploy before someone notices — it's all-or-nothing once switched. Canary limits blast radius (only a small traffic percentage sees the new version first) and can catch problems via real metrics before most users are affected, but requires more sophisticated automated monitoring/rollback logic to deliver that benefit — a canary without automated rollback is just a slower, more complex blue-green. Choose based on whether you have (or can build) genuine automated health-check-driven rollback; without it, blue-green's simplicity often wins.

**Q: What's GitOps, and why would a team adopt it over a CI pipeline deploying directly?**
A: In GitOps, the CI pipeline stops at updating a Git repository with the new artifact reference — a controller running inside the target cluster (ArgoCD, Flux) watches that repo and pulls the change itself. The pipeline never holds direct production credentials. The main driver is security: it shrinks a compromised CI/CD platform's blast radius from "can deploy anything to production" to "can write to a Git repo," at the cost of some added architectural complexity and a small latency increase.

**Q: How do you decide what should block a merge versus what should just warn?**
A: Anything that indicates the code is actually broken (failing tests, a build that doesn't compile) should hard-block. Things that are advisory quality signals (a linter warning, a coverage percentage dropping slightly, a non-critical security advisory on a dependency) are often better as visible warnings than hard blocks, especially early in a team's CI maturity — overly strict gates that block on noisy or low-value signals train developers to route around the pipeline (force-merge, disable checks) rather than respect it, which is a worse outcome than a slightly imperfect gate.
