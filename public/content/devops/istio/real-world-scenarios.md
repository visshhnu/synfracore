# Istio / Service Mesh — Real World Scenarios

A note on framing: all three scenarios below are illustrative/composite — common, well-documented patterns from production Istio usage industry-wide, not one specific traceable company's incident.

---

## Scenario 1 (illustrative/composite): The one service that broke when STRICT mTLS rolled out

**The pattern:** A platform team rolls out STRICT mTLS across a namespace, having verified the migration plan and tested in a staging environment beforehand. In production, every service continues working correctly except one — a legacy service that suddenly can't receive any traffic at all. Investigation reveals that service had been deployed via a slightly different, older deployment pipeline that didn't include the standard sidecar-injection label configuration the rest of the namespace used — it had simply never received an Envoy sidecar, invisible until STRICT mode started rejecting its now-unmeshed plaintext traffic outright.

**Why this specific gap survived staging testing:** the staging environment's version of this legacy service happened to have been deployed more recently, through the newer pipeline that did include correct sidecar injection — the production instance's deployment history diverged from staging in a way nobody had specifically audited before the mTLS migration. The migration plan's verification step (confirm every service has a sidecar) was sound in principle but wasn't actually exhaustively checked against production's real, as-deployed state.

**What actually prevents this:**
- **Before switching to STRICT mode, explicitly verify sidecar presence for every single service in the target namespace**, not just spot-check a representative sample — `kubectl get pods -o jsonpath` scripted across the entire namespace is a direct, exhaustive check that would have caught this specific legacy service.
- **Audit deployment pipeline consistency across all services in a namespace before a mesh-wide security change**, since a service deployed through an older or different pipeline is exactly the kind of gap that's easy to miss when reasoning about "the namespace" as a uniform whole rather than checking each service's actual deployment history.
- **Roll out STRICT mode incrementally, service by service or in small batches, rather than namespace-wide in one step**, giving each step a smaller blast radius and making it easier to isolate exactly which service breaks, rather than discovering the gap across an entire namespace-wide cutover at once.

---

## Scenario 2 (illustrative/composite): The canary that never actually got real traffic

**The pattern:** A team configures a 90/10 canary traffic split between a stable and new version of a service, and monitors the canary's error rate and latency for a planned validation window before deciding whether to promote it. The canary shows suspiciously perfect metrics — zero errors, excellent latency — for the entire window, and the team promotes it to 100% traffic, confident based on the clean canary data. Shortly after full promotion, the new version's real, previously-hidden bug surfaces under full production load. Investigation reveals the `DestinationRule` subset selector for the canary version had a label mismatch, meaning the "10%" weighted traffic split was actually being routed entirely to the stable version — the canary pods received essentially zero real traffic the entire time, which is why its metrics looked suspiciously perfect.

**Why "clean canary metrics" gave false confidence here:** a canary with genuinely zero traffic and a canary with genuinely healthy traffic both produce the same superficial signal — no errors, good latency — making it easy to interpret "no problems observed" as "the canary is healthy" rather than considering "the canary might not be receiving traffic at all." Nothing about the dashboard the team was watching distinguished between these two very different underlying situations.

**What actually addresses this:**
- **Explicitly verify actual traffic volume reaching the canary subset, not just its error rate/latency metrics** — a request-count metric specifically scoped to the canary subset would have immediately shown zero or near-zero traffic, a clear, direct signal distinct from "healthy traffic."
- **Cross-check the `DestinationRule` subset label selector against the actual labels on the canary version's pods** before trusting a canary rollout — this is exactly the kind of selector/label mismatch this guide's own material warns about in other contexts (Cilium's `endpointSelector`, Kubernetes Service selectors), applying identically here.
- **Treat "suspiciously perfect" canary metrics as worth investigating, not just celebrating** — a canary with zero errors and zero visible degradation over a meaningful traffic volume and time window is expected; the same result with an unverified or low traffic volume should raise the specific question "is this canary actually receiving real traffic," not just "is it doing well."

---

## Scenario 3 (illustrative/composite): The circuit breaker that ejected a healthy backend during a deploy

**The pattern:** A team configures `outlierDetection` circuit breaking with a relatively aggressive threshold (`consecutive5xxErrors: 3`) for a production service. During a routine, otherwise-healthy rolling deployment, the brief moment when old pods are terminating and new pods are still starting up produces a short burst of 5xx errors from pods in the process of shutting down — enough to trigger the circuit breaker and eject several backends from the load-balancing pool, right in the middle of an otherwise normal deployment, causing a brief but real availability dip that wouldn't have happened without the circuit breaker's specific threshold configuration.

**Why an aggressive circuit-breaker threshold interacted badly with normal deployment behavior:** the circuit breaker was configured with a threshold reasonable for detecting a genuinely failing backend during steady-state operation, but rolling deployments have a structurally different, expected pattern of brief errors from terminating pods — a pattern the threshold wasn't specifically designed to accommodate. The circuit breaker did exactly what it was configured to do; the configuration simply hadn't accounted for this specific, recurring, non-failure scenario.

**What actually addresses this:**
- **Coordinate `outlierDetection` thresholds with the deployment strategy's own graceful-shutdown behavior** — ensuring pods have a genuine grace period to stop accepting new requests before actually terminating (via `preStop` hooks and appropriate `terminationGracePeriodSeconds`) reduces the burst of errors from terminating pods in the first place, addressing the root cause rather than just the circuit breaker's sensitivity to it.
- **Tune circuit-breaker thresholds with real deployment-time error patterns in mind, not just steady-state failure scenarios** — treating rolling deployments as a distinct, expected traffic pattern worth explicitly testing the circuit breaker configuration against, not an edge case discovered accidentally in production.
- **Monitor circuit-breaker ejection events as their own explicit signal**, distinct from general error-rate monitoring — an ejection event correlating precisely with deployment timing is a clear, diagnosable pattern once it's being tracked as its own metric, rather than blending into general noise during a deploy window.
