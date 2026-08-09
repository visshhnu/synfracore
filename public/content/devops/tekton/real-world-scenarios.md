# Tekton — Real World Scenarios

A note on framing: all three scenarios below are illustrative/composite — common, well-documented patterns from production Tekton usage industry-wide, not one specific traceable company's incident.

---

## Scenario 1 (illustrative/composite): The Workspace binding that silently pointed nowhere

**The pattern:** A team builds a Pipeline chaining `git-clone` and a custom build Task, both referencing a shared `Workspace`. The Pipeline runs without any error, but the build Task's output is empty — no source code was actually present when the build step ran. Investigation reveals the `PipelineRun`'s Workspace binding referenced a `PersistentVolumeClaim` that existed but wasn't the one `git-clone` had actually written to — a naming mismatch between two similarly-named PVCs created during earlier testing.

**Why this is a genuinely easy trap, not an obvious configuration mistake:** Tekton doesn't validate that a bound Workspace actually contains meaningful data before running a Task against it — from Tekton's perspective, both Tasks successfully mounted *a* volume and completed without error, which is all the scheduler and reconciliation loop actually check. The failure is entirely semantic (wrong PVC, not a broken PVC), which produces no error signal anywhere in the pipeline's execution.

**What actually prevents this:**
- **Use clearly distinct, purpose-specific PVC names** rather than generic ones that are easy to confuse during iterative pipeline development — a naming convention tying the PVC name directly to the specific Pipeline/environment it belongs to reduces this exact ambiguity.
- **Add an explicit verification step early in the Pipeline** (a simple `ls` or file-existence check right after `git-clone`) that fails loudly if expected content isn't present, rather than letting a downstream Task silently proceed against empty or wrong data.
- **Clean up test/development PVCs regularly** rather than letting similarly-named leftover volumes from earlier iterations accumulate and become a source of exactly this kind of mismatch.

---

## Scenario 2 (illustrative/composite): The matrix pipeline that quietly multiplied cluster cost

**The pattern:** A team adopts `matrix` strategy to test across multiple language runtime versions, expanding from a single test Task to a 5-value matrix. Shortly after, cluster resource usage during CI hours increases noticeably, and a cost review flags a real, unexpected increase in compute spend attributable to CI workloads specifically. The root cause: the matrix expansion was applied without adjusting per-TaskRun resource requests, so 5 parallel TaskRuns each requested the same resource allocation the single, non-matrix Task previously used — a straightforward but easy-to-overlook multiplication effect.

**Why this is an easy oversight, not a reckless decision:** `matrix` strategy's value proposition (test across N combinations without duplicating YAML) is genuinely compelling and easy to adopt quickly — but the resource-cost implication (N times the compute, all requested simultaneously) isn't something the `matrix` syntax itself surfaces or warns about. The YAML change is small (a few lines adding a matrix block); the infrastructure cost implication is proportionally much larger and easy to miss in a quick pipeline update.

**What actually addresses this:**
- **Explicitly review and right-size resource requests when introducing or expanding a matrix strategy**, treating it as a genuine capacity-planning decision, not just a testing-convenience YAML change.
- **Set cluster-level resource quotas for CI namespaces** so a matrix expansion (intentional or accidental) hits an explicit, visible limit rather than silently consuming unbounded cluster capacity.
- **Monitor CI-attributable cluster cost as its own tracked signal**, the same way this guide's own portfolio material recommends tracking real Kubernetes autoscaling behavior — a matrix-driven cost increase is a real, measurable, and preventable pattern once it's being watched for.

---

## Scenario 3 (illustrative/composite): The supply-chain attestation that was signing the wrong thing

**The pattern:** A security-conscious team adopts Tekton Chains for build provenance, and cosign verification passes cleanly on every release image — giving genuine confidence the supply-chain security control is working. Months later, a deeper security audit discovers the attestation, while cryptographically valid, was describing a different build step than the team assumed — a pipeline refactor had reordered Tasks such that the image Chains was signing wasn't actually the final, fully-tested image, but an intermediate build artifact from an earlier stage that happened to share a naming pattern.

**Why cryptographic validity gave false confidence here:** cosign verification confirms the attestation is genuine and untampered — it says nothing about whether the attestation describes the *thing you actually think it describes*. A valid signature on the wrong artifact passes every technical verification check while providing none of the intended security guarantee, and nothing about a clean `cosign verify-attestation` output would surface this kind of semantic mismatch.

**What actually addresses this:**
- **Explicitly verify what artifact an attestation actually references**, not just that verification passes — cross-check the attestation's subject against the specific image tag/digest actually being deployed, especially after any pipeline restructuring.
- **Treat a Pipeline restructuring (reordering Tasks, renaming outputs) as requiring an explicit re-audit of what Tekton Chains is now signing**, since a structural change can silently shift which artifact the attestation describes without any error or warning.
- **Periodically test the full chain end-to-end deliberately** — deploy a genuinely tampered or wrong artifact in a test environment and confirm verification correctly rejects it, rather than only ever observing the "happy path" of legitimate builds passing verification.
