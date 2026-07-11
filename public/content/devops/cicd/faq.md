# CI/CD Pipelines FAQ

**Q: Is Jenkins outdated? Should I even bother learning it?**
A: Jenkins is old (originally released as Hudson in 2004) but still widely deployed, especially in larger, established enterprises with existing infrastructure investment. It's not the default recommendation for a new project today — hosted CI (GitHub Actions, GitLab CI) has less operational overhead — but "outdated" overstates it. If a job posting or existing employer infrastructure specifically uses Jenkins, it's worth learning; as a first CI/CD tool to learn with no specific target, a hosted platform is the more efficient starting point.

**Q: Do I need to learn Kubernetes to understand CI/CD, or are they separate skills?**
A: Separate, though commonly paired. CI/CD is about the automated build-test-deploy pipeline itself; Kubernetes is one possible *deployment target* among several (a VM, a PaaS, serverless, and Kubernetes are all valid targets). You can build genuinely solid CI/CD skill deploying to a simple PaaS with zero Kubernetes knowledge — don't let "I don't know K8s yet" block starting on CI/CD fundamentals.

**Q: What's the difference between CI/CD and DevOps generally — is CI/CD just another name for DevOps?**
A: No — CI/CD is a specific practice (automated build/test/deploy pipelines) that supports the broader DevOps philosophy (breaking down silos between development and operations, shared ownership of reliability). DevOps also encompasses things CI/CD doesn't directly cover: incident response culture, infrastructure as code, observability/monitoring practices, and organizational/cultural changes. CI/CD is one of DevOps's most concrete, most commonly-interviewed-on technical practices, but it's a subset, not a synonym.

**Q: How long should a CI pipeline realistically take to run?**
A: There's no universal fixed target, but the guiding principle is fast feedback — the longer a pipeline takes, the more a developer's attention drifts elsewhere while waiting, and the more expensive context-switching becomes when it finally reports a failure. Many teams treat "under 10 minutes for the CI stage" as a practical working target worth actively engineering for (caching, parallelization — see Intermediate) once a pipeline starts creeping past that, though the right number genuinely depends on the project's size and test suite.

**Q: My team is small (2-3 people) — is full CI/CD overkill for us?**
A: The core CI part (automated test-on-every-push) is valuable at almost any team size — it catches integration problems regardless of headcount, and it's cheap to set up on GitHub Actions/GitLab CI with essentially no infrastructure cost for a small project. Full progressive-delivery patterns (canary, blue-green, multi-region) are genuinely overkill for a 3-person team's early-stage project — save that complexity for when your actual traffic/risk profile justifies the added operational overhead, not before.

**Q: Should pipeline configuration live in the same repo as the application code, or a separate repo?**
A: Same repo, in almost every common case — this is the standard, deliberate practice (see Fundamentals), because it keeps the pipeline definition version-controlled and reviewed alongside the code it builds. The one common exception is GitOps deployment repos (see Advanced), which are intentionally separate from the application repo — but that's a *deployment manifest* repo, not the CI pipeline definition itself, which still lives with the application code.

**Q: Is it bad practice to let a pipeline auto-deploy to a staging environment but require manual approval for production?**
A: That's not bad practice — it's the standard, recommended pattern (see Intermediate's environment promotion section), and it's specifically what "Continuous Delivery" (as distinct from full Continuous Deployment) means in practice. Auto-deploying to staging maximizes fast feedback where mistakes are cheap; a manual gate before production adds a deliberate checkpoint where mistakes are expensive. This combination is one of the most common, well-regarded setups in real organizations, not a compromise or a lesser version of "real" CI/CD.
