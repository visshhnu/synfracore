# eBPF & Cilium — Real World Scenarios

A note on framing: all three scenarios below are illustrative/composite — common, well-documented patterns from production Cilium/eBPF usage industry-wide, not one specific traceable company's incident.

---

## Scenario 1 (illustrative/composite): The L7 policy that was accidentally scoped to the wrong pods

**The pattern:** A platform team writes a `CiliumNetworkPolicy` intended to restrict a checkout service's access to a payment API's sensitive endpoints, using an `endpointSelector` they believe correctly scopes to the payment service specifically. The policy deploys without error, but during a later security audit, traffic from an entirely unrelated internal tool is discovered to have had the same access the whole time — the `endpointSelector`'s label match was broader than intended, matching a wider set of pods than the single service the team believed it was scoping to.

**Why this is a genuinely easy trap, not an obvious misconfiguration:** a `CiliumNetworkPolicy` that's syntactically valid and technically enforcing *some* restriction gives real confidence that "the policy is working" — nothing about a successful deploy or the absence of obvious errors signals that the label selector matched a broader set of pods than intended. The policy was doing exactly what it was configured to do; the configuration itself just didn't match the team's actual intent.

**What actually prevents this:**
- **Use `hubble observe --verdict DROPPED` (and, just as importantly, verdict ALLOWED for unexpected sources) during and after policy rollout** — actively watching real flow data against the new policy is the fastest way to catch a scope mismatch, rather than assuming the policy is correct because it deployed cleanly.
- **Test a new or modified policy against a known-should-be-denied scenario deliberately**, not just confirming known-legitimate traffic still works — a policy that only ever gets tested against traffic it's supposed to allow never gets the chance to reveal an overly broad scope.
- **Treat `endpointSelector` label design with the same rigor as any access-control configuration** — a specific, narrowly-scoped label set, reviewed explicitly for what else in the cluster might match it, rather than a convenient but loosely-specified selector.

---

## Scenario 2 (illustrative/composite): The Hubble UI that looked broken but was actually a two-flag gap

**The pattern:** A team enables Hubble during a Cilium upgrade, expecting the Hubble UI to show live flow data. The UI loads but shows an empty, perpetually-loading view. The team spends real time investigating what they assume is a Cilium or Hubble bug — checking pod health, restarting components, reviewing upgrade logs — before discovering the actual cause: `hubble.relay.enabled=true` was set, but per-node Hubble flow collection itself had been left disabled in an earlier, partial configuration change, meaning the relay had nothing to aggregate even though it was running correctly.

**Why this specific gap is easy to lose time chasing:** the two flags (`hubble.relay.enabled` and per-node Hubble collection) are conceptually related but genuinely independent — a partial configuration (one enabled, one not) produces a UI symptom (empty view) that looks exactly like a broken deployment, rather than an incomplete one. Nothing in the UI itself distinguishes "relay is running but has nothing to show" from "relay itself isn't working."

**What actually addresses this:**
- **Check `hubble observe` at the CLI directly against a single node first**, before assuming a UI problem is a deeper Cilium issue — if CLI-level flow observation works but the UI doesn't, that specifically isolates the problem to relay/UI wiring, not flow collection itself, cutting investigation time significantly.
- **Treat Hubble's full setup as a documented, explicit two-flag checklist** rather than a single "enable Hubble" step, precisely because the partial-enablement state produces a misleading, bug-like symptom rather than an obvious configuration error.
- **Verify both flags explicitly after any Cilium upgrade or Helm values change**, since an upgrade that resets or partially reapplies Helm values is a realistic way this exact partial state can reoccur even after being fixed once.

---

## Scenario 3 (illustrative/composite): The Egress Gateway that stopped working after a node label change

**The pattern:** A team sets up an Egress Gateway policy routing a payment service's outbound traffic through a designated gateway node, presenting a consistent IP to an external partner's allowlisted firewall. This works correctly for months. During a routine node-pool relabeling exercise (part of an unrelated infrastructure cleanup), the `egress-gateway: "true"` label is inadvertently removed from the designated gateway node as part of a broader label-standardization change. Outbound traffic to the partner's API silently starts failing at the partner's firewall, since it's no longer originating from the expected, allowlisted IP.

**Why this is an easy, non-obvious failure to introduce:** the node relabeling change was made for entirely unrelated reasons, by a team that had no reason to know a specific label on that specific node was load-bearing for an Egress Gateway policy — nothing about a generic node-label cleanup task would prompt checking whether any `CiliumEgressGatewayPolicy` depends on the labels being changed. The failure surfaces externally (at the partner's firewall) rather than internally, adding further delay to diagnosis.

**What actually addresses this:**
- **Document which node labels are load-bearing for Egress Gateway (or any other label-selector-dependent) policies explicitly**, in a place infrastructure changes are likely to be cross-checked against, not just in the policy YAML itself where a broader infrastructure team is unlikely to look.
- **Add a Cilium status/policy-health check specifically verifying Egress Gateway's configured node selector still matches at least one real node**, as an automated guard against exactly this kind of silent breakage from an unrelated change.
- **When diagnosing an external-partner-reported connectivity failure, check Egress Gateway policy health early**, not last — a change with no internal symptom and only an external, partner-reported failure is a specific pattern worth having a fast diagnostic path for.
