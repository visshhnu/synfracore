# GitHub Actions — PYQ (Previously Asked / Practice Questions)

**Framing note:** GitHub doesn't administer a proctored public certification with a leaked-question archive. What follows is built from this guide's own Overview/Intermediate/Advanced/Troubleshooting material, framed as practice questions grounded in real, documented GitHub Actions behavior.

---

### 1. (Domain: Security) Why is pinning `actions/checkout@v4` to a version tag considered less secure than pinning to a full commit SHA, even though both are more secure than `@master`?

**Answer:** A version tag like `@v4` can technically be moved to point at a different commit by the action's maintainer (or an attacker who compromises the maintainer's account), whereas a full commit SHA is immutable — it can never be silently repointed. `@v4` is a meaningful security improvement over `@master` (which moves constantly by design), but a full SHA pin is the maximally secure option since it guarantees byte-for-byte identical action code on every run, regardless of what happens to the tag afterward.

---

### 2. (Domain: OIDC) A workflow using `role-to-assume` fails with "not authorized to perform sts:AssumeRoleWithWebIdentity." The workflow YAML has `permissions: id-token: write` set correctly. What's the most likely cause?

**Answer:** A mismatch between the IAM role's trust policy `sub` claim condition and the workflow's actual `sub` claim value — this is the single most common OIDC setup failure. The trust policy might be scoped to the wrong repo, wrong branch, or wrong environment relative to what the actual workflow run's OIDC token presents. The fix is checking the trust policy condition against the workflow's real `sub` claim, not the workflow YAML itself, which is often already correct.

---

### 3. (Domain: Matrix Strategy) Why does a matrix build across Node 18/20/22 create genuinely separate job runs rather than one job looping over three values?

**Answer:** Each matrix combination runs as an independent job with its own fresh runner/VM, in parallel — this is architecturally different from a loop inside a single job, which would run sequentially on one runner. The matrix approach means a failure in the Node 18 run doesn't block or delay the Node 20/22 runs from completing, and all three genuinely run simultaneously (subject to available runner capacity).

---

### 4. (Domain: Reusable Workflows) What does the explicit `secrets:` block in a `workflow_call` reusable workflow actually enforce, that implicit secret inheritance wouldn't?

**Answer:** It makes secret passing to a reusable workflow deliberate and auditable — the caller must explicitly pass each required secret by name, and the reusable workflow's interface clearly documents exactly which secrets it needs. Without this explicit declaration, a caller might assume secrets are automatically available (implicit inheritance) when they're not, or a reusable workflow might have access to more than intended — the explicit block removes that ambiguity.

---

### 5. (Domain: Self-Hosted Runners) Why does Advanced specifically flag self-hosted runners on a public repository as a real security risk, distinct from the general self-hosted-vs-hosted tradeoff?

**Answer:** GitHub-hosted runners are ephemeral and isolated per run by design — a malicious pull request's workflow runs on infrastructure GitHub controls and tears down immediately after. A self-hosted runner on a public repo doesn't automatically get that isolation — a malicious fork's PR could potentially run arbitrary code on infrastructure the org itself controls, which is a materially different threat model than the general cost/performance tradeoff of self-hosted vs. GitHub-hosted runners on a private repo.

---

### 6. (Domain: Concurrency) What specific production problem does `concurrency: { group: deploy-${{ github.ref }}, cancel-in-progress: true }` prevent?

**Answer:** Two rapid pushes to the same ref triggering overlapping deploy workflows that race each other — without concurrency control, both deploys could run simultaneously against the same target, potentially deploying in the wrong order or corrupting state from concurrent modification. `cancel-in-progress: true` specifically cancels the earlier, now-superseded run rather than letting both complete, ensuring only the latest push's deploy actually finishes.

---

### 7. (Domain: Artifact Attestation) What does `actions/attest-build-provenance` prove, and what's the GitHub-native use case for it?

**Answer:** It generates a signed attestation describing what workflow run, source commit, and build parameters produced a specific artifact — cryptographically verifiable proof of build provenance. This addresses the same supply-chain security concern as Tekton Chains in a Kubernetes-native CI context, but natively within GitHub's own ecosystem, useful for any organization needing to prove an artifact was genuinely built by their expected pipeline rather than tampered with or built by an unauthorized process.

---

### 8. (Domain: Larger Runners) When would a team choose a GitHub-hosted "larger runner" over the standard `ubuntu-latest`, and what's the tradeoff worth modeling explicitly?

**Answer:** Larger runners provide more CPU/memory/disk at a higher per-minute cost — worth it for genuinely resource-intensive builds (large monorepos, heavy test suites) that are CPU- or memory-bound. The tradeoff worth modeling explicitly: a build that's I/O-bound rather than CPU-bound may see little to no speedup from more cores, while still paying the larger runner's premium rate — "bigger is always faster" is not a safe assumption without checking what's actually the bottleneck.

---

### 9. (Domain: Environment Protection) How do environment protection rules (required reviewers, wait timer) interact with an otherwise fully automated OIDC-based deployment?

**Answer:** They sit as a human-approval gate in front of automated deployment — the workflow can be triggered automatically (on push to `main`, for instance) and use OIDC for credential-free cloud authentication, but execution pauses at the environment-gated job until a required reviewer approves. This lets a team keep deployment mechanics fully automated while still requiring explicit human sign-off before production changes actually execute.

---

### 10. (Domain: Composite Actions) What's the practical benefit of building a composite action versus just repeating the same 4-5 steps in every workflow that needs them?

**Answer:** A composite action centralizes the logic in one place — fixing a bug or updating a step only requires editing the composite action once, rather than finding and updating every workflow that duplicated those steps independently. This is the same maintainability argument as any shared-code abstraction; the tradeoff is an extra layer of indirection (a workflow author needs to know the composite action exists and what it does) versus everything being visible inline in one workflow file.
