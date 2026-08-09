# Kubernetes — Real World Scenarios

A note on framing: all three scenarios below are illustrative/composite — common, well-documented patterns from production Kubernetes usage industry-wide, not one specific traceable company's incident.

---

## Scenario 1 (illustrative/composite): The Service that routed to nothing after a routine label cleanup

**The pattern:** A team performs a routine cleanup of Pod labels across their Deployments, standardizing naming conventions for consistency. The Deployment's Pod template labels get updated as part of this change and deploy successfully — new Pods come up healthy and pass their own readiness checks. Shortly after, the team discovers the associated Service has stopped routing any traffic at all, even though every individual Pod is genuinely healthy and running.

**Why this is a genuinely easy trap, not an obvious oversight:** the Deployment change and the Service definition are two separate Kubernetes objects, each independently valid — the Deployment's YAML is syntactically correct and its Pods pass health checks, and the Service's YAML is also syntactically correct. Nothing in either object's individual validation catches that the Service's `selector` field, left unchanged during the label cleanup, no longer matches the Pods' newly-updated labels. Both objects look fine in isolation; the failure only exists in the relationship between them.

**What actually prevents this:**
- **Treat any Pod label change as requiring an explicit check of every Service selector that might reference those labels** — this is a real, structural dependency between two objects that Kubernetes itself doesn't validate for you at apply time.
- **Use `kubectl get endpoints <service-name>` as a standard post-deploy verification step**, not just checking Pod status — an empty endpoints list is the direct, fast signal that a Service has zero matching Pods, catching this exact failure mode before it becomes a production incident.
- **Consider using a consistent, deliberately stable label (like `app: my-service`) specifically for Service selection**, kept separate from other labels used for organizational/reporting purposes that are more likely to be "cleaned up" in future refactors — reducing the surface area of labels a Service selector actually depends on.

---

## Scenario 2 (illustrative/composite): The RBAC permission that worked in staging but not in production

**The pattern:** A team deploys a new service with a ServiceAccount and associated Role/RoleBinding, tests it thoroughly in staging where everything works correctly, and promotes the same manifests to production. In production, the service immediately fails with Forbidden errors on an action that worked fine in staging. Investigation reveals the production cluster's RBAC was configured slightly differently — a pre-existing, broader ClusterRoleBinding in staging had been incidentally granting the needed permission, while production's more tightly-scoped RBAC setup (a deliberate security improvement over staging) had no equivalent broader grant.

**Why this is an easy, non-obvious environment-parity gap:** the manifests deployed to both environments were genuinely identical — the difference lived entirely in each cluster's own pre-existing RBAC configuration, which isn't part of the application's own deployed manifests and therefore isn't something a straightforward "diff the YAML between environments" check would catch. Staging "working" gave false confidence specifically because staging's RBAC happened to be more permissive in a way nobody had deliberately relied on or even known about.

**What actually addresses this:**
- **Define every RBAC requirement explicitly within the application's own deployed manifests**, rather than relying on any pre-existing, broader cluster-level grant that happens to cover the need — this makes the actual required permissions visible, reviewable, and portable across environments rather than implicit and environment-dependent.
- **Audit staging's RBAC configuration for unintentional over-permissiveness relative to production**, since staging environments commonly accumulate looser security postures over time for convenience — this guide's own recommended discipline of least-privilege RBAC should apply consistently, not just in the environment considered "real."
- **Test genuinely least-privilege RBAC in staging deliberately**, matching production's actual security posture, rather than treating staging's more permissive setup as an acceptable testing shortcut — this specific class of gap only gets caught if staging is deliberately made to mirror production's constraints, not just its application code.

---

## Scenario 3 (illustrative/composite): The scheduling deadlock nobody could explain from the Pod status alone

**The pattern:** A team scales up a Deployment during a planned capacity increase, and the new replicas sit in `Pending` status indefinitely. The team initially assumes insufficient cluster capacity and adds more Nodes — the Pods still don't schedule. After genuine confusion and wasted time provisioning unnecessary additional capacity, `kubectl describe pod` on one of the pending Pods reveals the actual cause: a `nodeSelector` requiring a specific label that had been present on the original Nodes but was never applied to the newly-added ones, an oversight in the Node-provisioning automation.

**Why "add more capacity" was a reasonable but wrong first response:** `Pending` Pods are, in the team's prior experience, most commonly caused by genuine resource exhaustion — the instinct to add capacity is well-founded in general, just not for this specific cause. Nothing about a Pod stuck in `Pending` inherently signals *which* of several possible causes (resource exhaustion, unsatisfied node selector, taints without tolerations) is actually responsible, without actually reading the Events section of `kubectl describe pod`, which the team hadn't checked first.

**What actually addresses this:**
- **Always run `kubectl describe pod` and read the Events section before assuming a specific cause for `Pending` status** — this single command directly states the actual scheduling failure reason (insufficient resources vs. unsatisfied node affinity/selector vs. untolerated taint), removing the need to guess.
- **Verify newly-provisioned Nodes carry all labels the cluster's existing scheduling constraints expect**, as an explicit step in Node-provisioning automation — this is exactly the gap that caused the deadlock, and it's a checkable, automatable verification rather than something that has to be manually remembered.
- **Treat "we added capacity and Pods still won't schedule" as a strong signal to check scheduling constraints specifically**, since that specific combination (more capacity available, Pods still Pending) rules out pure resource exhaustion as the cause and points directly at a selector/affinity/taint mismatch instead.
