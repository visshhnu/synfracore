# GitHub Actions — Real World Scenarios

A note on framing: all three scenarios below are illustrative/composite — common, well-documented patterns from production GitHub Actions usage industry-wide, not one specific traceable company's incident.

---

## Scenario 1 (illustrative/composite): The OIDC trust policy that was scoped one level too broad

**The pattern:** A team sets up OIDC-based cloud deployment for their main application repository, with an IAM trust policy scoped to the repository (`repo:myorg/myapp:*`). Deployment works correctly for months. During a routine security review, an auditor points out that the wildcard `*` after the repo name means the trust policy accepts the OIDC token from *any* branch or workflow in that repository — including a developer's experimental feature branch, which could theoretically assume the same production deployment role as the intended `main`-branch deploy workflow.

**Why this is a genuinely easy trap, not an obvious oversight:** scoping the trust policy to the repository felt like meaningful, deliberate security scoping at the time it was configured — and it is more secure than no scoping at all. The gap is specifically the difference between "scoped to this repo" and "scoped to this repo AND this specific branch/environment," which isn't an obvious distinction unless you're already thinking adversarially about exactly what a malicious or compromised branch could do with that access.

**What actually prevents this:**
- **Scope the `sub` claim condition to the specific branch or environment**, not just the repository — `repo:myorg/myapp:ref:refs/heads/main` (or better, an `environment:` claim scoped to `production`) rather than a repo-wide wildcard.
- **Treat OIDC trust policy scope as something to actively audit periodically**, not a one-time setup decision — the same way any IAM permission should be revisited as understanding of the actual risk model matures.
- **Use GitHub Environments with protection rules as an additional layer**, so even a correctly-scoped trust policy still requires the deploy job to pass through a required-reviewer gate before executing, rather than relying on OIDC scoping as the sole control.

---

## Scenario 2 (illustrative/composite): The unpinned action that changed behavior mid-pipeline

**The pattern:** A workflow has used `some-org/some-action@master` for a specific build step for a long time, working reliably. One day, without any change to the team's own repository, the workflow starts failing — the action's maintainer pushed a breaking change directly to `master` as part of unrelated ongoing development on their own action. Because the workflow references `@master` rather than a pinned version, every workflow run automatically picked up the new, breaking behavior with zero warning.

**Why this is a common, easy-to-overlook risk:** `@master` (or `@main`) feels convenient — it means always getting the "latest" version without needing to update version references manually. The risk is invisible during normal operation, since most of the time an action's `master` branch doesn't introduce breaking changes — the failure mode only manifests the one time it does, at a moment entirely outside the consuming team's control or awareness.

**What actually addresses this:**
- **Pin every third-party action to at minimum a version tag, ideally a full commit SHA**, per this guide's own security guidance — this is exactly the practice that would have prevented this specific failure, since the workflow would have kept running the known-good, previously-tested version until a deliberate update.
- **Use a tool like Dependabot to manage action version updates deliberately**, so upgrades happen as reviewed, intentional pull requests rather than silently and automatically via an unpinned reference.
- **Treat any unpinned `@master`/`@main` action reference found in an existing workflow as a real, prioritized remediation item**, not a low-priority cleanup task — it's a genuine, if usually dormant, production risk.

---

## Scenario 3 (illustrative/composite): The self-hosted runner fleet that accidentally accepted fork PR workflows

**The pattern:** A team sets up a self-hosted ARC runner fleet for cost and custom-hardware reasons, on a repository that's public (open-source). The default GitHub Actions workflow configuration, without additional restriction, allows workflows triggered by pull requests from forks to run using the repository's configured runners — including the self-hosted fleet. A security review discovers this means any external contributor's pull request could, in principle, execute arbitrary code on the org's own self-hosted infrastructure, simply by opening a PR containing a modified workflow file.

**Why this is a common, easy-to-miss configuration gap:** the default behavior wasn't maliciously exploited in this scenario — it was caught proactively — but the underlying risk was present from the moment the self-hosted fleet was connected to a public repository without additional restriction. Nothing about setting up self-hosted runners for legitimate cost/performance reasons inherently prompts a review of fork-PR workflow permissions specifically; the two configuration decisions (self-hosted runners, public repo) were each individually reasonable and only combine into a real risk together.

**What actually addresses this:**
- **Require explicit approval for workflow runs from first-time (or all external) contributors** — a setting GitHub provides specifically for this scenario, gating fork-PR-triggered workflow execution behind a maintainer's explicit approval rather than running automatically.
- **Never use `pull_request_target` for workflows that check out and execute fork PR code on self-hosted runners** — this trigger type runs with the base repository's permissions and secrets, which combined with fork PR code execution on self-hosted infrastructure is a materially more dangerous combination than the standard `pull_request` trigger.
- **Treat "self-hosted runners + public repository" as a combination requiring an explicit, documented security review**, not an incidental configuration detail — this guide's own Advanced material names this specific combination as a real, non-theoretical risk pattern.
