# Terraform — Real World Scenarios

A note on framing: all three scenarios below are illustrative/composite — common, well-documented patterns from production Terraform usage industry-wide, not one specific traceable company's incident.

---

## Scenario 1 (illustrative/composite): The manual console change that Terraform tried to silently revert

**The pattern:** During an active incident, an on-call engineer makes a quick, manual change directly in the cloud console — adjusting a security group rule to unblock a critical, time-sensitive issue, fully intending to update the Terraform configuration to match afterward. The incident resolves, and in the aftermath, the follow-up Terraform update gets deprioritized and forgotten. Weeks later, a routine `terraform apply` for an unrelated change picks up the drift and silently reverts the security group rule back to its original, Terraform-defined state — reintroducing the original problem the manual change had fixed, with no one immediately connecting the two events.

**Why this is a genuinely easy trap, not a reckless practice:** the manual out-of-band change was a reasonable, arguably correct incident-response decision in the moment — waiting for a proper Terraform PR/review cycle during an active incident isn't always realistic. The failure isn't the manual change itself; it's the gap between "we'll update Terraform to match later" and that follow-up actually happening, which is exactly the kind of good intention that competes with other priorities and quietly falls through.

**What actually prevents this:**
- **Treat any manual, out-of-band infrastructure change as requiring an immediate, tracked follow-up task**, not an informal intention — a ticket or PR opened at the moment of the manual change, not planned for "later" without a concrete tracking mechanism.
- **Run `terraform plan` (not `apply`) regularly against production as a drift-detection habit**, surfacing exactly this kind of divergence proactively, before an unrelated `apply` accidentally reverts it — catching drift on a plan-only basis gives a safe opportunity to reconcile it deliberately.
- **When `terraform plan` shows an unexpected change, investigate the reason before applying**, per this guide's own Troubleshooting guidance — an unexpected plan output is a signal to understand why state and configuration diverged, not just a diff to accept and apply mechanically.

---

## Scenario 2 (illustrative/composite): The forced-replacement change that took down a stateful resource

**The pattern:** A team makes what looks like a minor configuration change to a database resource — adjusting a single attribute for what seems like a routine tuning update. `terraform plan` output is reviewed quickly (the change looks small) and approved. `terraform apply` executes exactly what the plan showed: the specific attribute change requires resource replacement, not an in-place update, per that provider's resource schema — the database is destroyed and recreated, and its data is gone, since replacement wasn't anticipated for what looked like a small tuning change.

**Why a "small" change produced such a large consequence:** not every resource attribute supports in-place update — some, by the cloud provider's own resource design, require full replacement if changed, and this isn't always intuitive from the attribute's name or apparent significance. `terraform plan` genuinely did show the replacement (Terraform doesn't hide this), but a quick review of what looked like a minor change didn't register the destroy-then-create action shown in the plan output as the serious, data-loss-risking operation it actually was.

**What actually prevents this:**
- **Read `terraform plan` output for the actual action symbols, not just the attribute diff** — Terraform explicitly marks a forced replacement differently from an in-place update in its plan output; treating every plan review as requiring confirmation of *which* action type is shown, not just what changed, is the direct habit that catches this.
- **Check provider documentation for any attribute change on a stateful resource specifically** — before applying, confirm whether the specific attribute being changed is documented as requiring replacement, especially for databases or anything holding data that can't simply be recreated without loss.
- **Use `prevent_destroy` lifecycle blocks on genuinely critical, stateful resources** — this Terraform-native safeguard causes `apply` to fail loudly rather than silently executing a destroy, specifically protecting against exactly this class of accidental data-loss event even when a plan is approved too quickly.

---

## Scenario 3 (illustrative/composite): The state lock that got force-unlocked while the original operation was still running

**The pattern:** A CI pipeline's `terraform apply` step runs longer than usual due to a genuinely large, slow-to-provision set of resources. A team member, working on an unrelated task, sees a state lock error when attempting their own local `terraform apply`, assumes it's a stuck/orphaned lock from a previous failed run, and force-unlocks it — while the CI pipeline's apply is, in fact, still actively running. Both operations now proceed against the same state concurrently, and the resulting state file becomes corrupted, requiring manual reconstruction.

**Why this is an easy, understandable mistake under pressure:** a state lock error looks identical whether it's from a legitimately still-running operation or a genuinely stuck/orphaned one from a crashed process — nothing about the error message itself distinguishes the two cases. Force-unlocking is a real, documented Terraform command for exactly the legitimate "stuck lock" scenario, which makes it a reasonable-seeming action to reach for without additional verification, especially for someone focused on their own unrelated task and just wanting to proceed quickly.

**What actually prevents this:**
- **Always verify no other legitimate operation is genuinely still running before force-unlocking**, per this guide's own explicit Troubleshooting guidance — checking the CI pipeline's own status/logs directly, not just assuming a lock is stuck based on how long it's been held.
- **Make CI pipeline Terraform runs visible to the whole team** (a Slack notification on apply start/completion, a visible dashboard) so a team member encountering a lock has an immediate, easy way to check whether it corresponds to a known, legitimately in-progress operation before considering force-unlock at all.
- **Treat state corruption recovery as a rare-but-real risk worth having a documented runbook for**, given that even a well-understood safeguard (force-unlock) can be misapplied under exactly the ambiguous circumstances this scenario describes — having a clear recovery process reduces the damage when this does happen, even with good general practices in place.
