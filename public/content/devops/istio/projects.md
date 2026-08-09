# Istio / Service Mesh — Portfolio Projects

Build these 3 projects to prove Istio mastery. Each includes code, architecture, and interview talking points.

---

## Project 1: Zero-Trust mTLS Rollout

**Level:** Beginner | **Time:** 1 day | **GitHub:** `istio-zero-trust-mtls`

**What you build:** A multi-service namespace migrated from no mTLS to STRICT mTLS, demonstrating the PERMISSIVE-then-STRICT rollout pattern Overview describes for avoiding breakage during migration.

### Rollout sequence
```yaml
# Step 1: PERMISSIVE — accepts both plaintext and mTLS,
# safe to apply without breaking existing traffic
apiVersion: security.istio.io/v1beta1
kind: PeerAuthentication
metadata: { name: default, namespace: production }
spec: { mtls: { mode: PERMISSIVE } }
```
```yaml
# Step 2: STRICT — only after confirming every service actually
# has the sidecar and mTLS traffic is flowing correctly
spec: { mtls: { mode: STRICT } }
```

### Interview points
- Explaining exactly why PERMISSIVE is the correct first step in a real production migration, not a shortcut — it lets you confirm sidecar injection is complete across every service before cutting off plaintext traffic entirely
- Using `istioctl proxy-config listeners` to verify mTLS is actually being enforced, not just configured — the distinction between "the YAML says STRICT" and "traffic is actually behaving as STRICT"
- SPIFFE identity as the mechanism making zero-trust concrete — every service has a verifiable identity, not just an IP address

### Steps
1. Deploy 3+ services in a namespace with sidecar injection enabled
2. Apply PERMISSIVE mode first and confirm existing traffic still works
3. Verify mTLS is actually happening for sidecar-injected traffic using `istioctl proxy-config`
4. Switch to STRICT mode and confirm plaintext traffic now fails while mTLS traffic succeeds
5. Document the full before/during/after rollout with real `istioctl` output in the README

---

## Project 2: Canary Deployment With Traffic Splitting

**Level:** Intermediate | **Time:** 2 days | **GitHub:** `istio-canary-traffic-split`

**What you build:** A canary release of a new service version, splitting live traffic 90/10 between stable and canary using `VirtualService`/`DestinationRule`, with real observed metrics comparing the two.

### Traffic split configuration
```yaml
apiVersion: networking.istio.io/v1beta1
kind: DestinationRule
metadata: { name: payment-api }
spec:
  host: payment-api
  subsets:
    - { name: stable, labels: { version: v1 } }
    - { name: canary, labels: { version: v2 } }
---
apiVersion: networking.istio.io/v1beta1
kind: VirtualService
metadata: { name: payment-api }
spec:
  hosts: [payment-api]
  http:
    - route:
        - { destination: { host: payment-api, subset: stable }, weight: 90 }
        - { destination: { host: payment-api, subset: canary }, weight: 10 }
```

### Interview points
- Zero application code changes required to implement this — the entire traffic-splitting logic lives in Istio configuration, not in the application's own routing or feature-flag code
- Being able to explain the incremental-rollout pattern concretely: start at a small canary percentage, watch real error-rate/latency metrics (via the Grafana/Kiali dashboards `istioctl dashboard` exposes), and increase the weight only once the canary proves healthy
- `DestinationRule` subsets vs. `VirtualService` routing — explaining the division of responsibility (subsets define *what groups exist*, VirtualService defines *how traffic is routed to them*) rather than conflating the two objects

### Steps
1. Deploy two versions of a service (v1/v2) with version labels
2. Configure the `DestinationRule` and `VirtualService` for a 90/10 split
3. Generate real traffic and confirm the actual observed split matches the configured weights
4. Compare error rate/latency between stable and canary using Istio's built-in observability (Kiali/Grafana)
5. Document the rollout decision process (what would have stopped the rollout) in the README, not just the final working config

---

## Project 3: Multi-Cluster Mesh With Resilience Testing

**Level:** Advanced | **Time:** 3-4 days | **GitHub:** `istio-multi-cluster-resilience`

**What you build:** A two-cluster Istio mesh federation with cross-cluster service communication, plus circuit-breaker and retry policies tested under deliberately induced failure.

### Circuit breaker and retry policy
```yaml
apiVersion: networking.istio.io/v1beta1
kind: DestinationRule
metadata: { name: payment-api }
spec:
  host: payment-api
  trafficPolicy:
    connectionPool:
      http: { http1MaxPendingRequests: 10, maxRequestsPerConnection: 2 }
    outlierDetection:
      consecutive5xxErrors: 3
      interval: 30s
      baseEjectionTime: 60s
```

### Interview points
- Multi-cluster federation as the concrete answer to "what does Istio look like beyond a single cluster" — a genuinely advanced topic most candidates can't speak to concretely
- `outlierDetection`'s circuit-breaker behavior — being able to explain exactly what happens when a backend starts returning 5xx errors (ejected from the load-balancing pool for `baseEjectionTime`, automatically, with zero application code involved)
- The core service-mesh value proposition made concrete under failure: retries, circuit breaking, and mTLS all continue to function correctly during a real induced failure, entirely from mesh configuration

### Steps
1. Set up mesh federation across two clusters (kind clusters work for local testing)
2. Confirm cross-cluster service-to-service calls succeed with mTLS intact
3. Configure the circuit-breaker policy above on one service
4. Deliberately inject failures (kill pods, introduce latency) and confirm the circuit breaker actually ejects the unhealthy backend
5. Document the full failure-injection test — what was configured, what failure was induced, what the observed mesh behavior was — in the README

---

## Portfolio Checklist
- [ ] All repos public on GitHub with clear READMEs
- [ ] README includes the full Istio CRD YAML and how to reproduce the setup
- [ ] Can explain the sidecar-proxy model and mTLS STRICT/PERMISSIVE distinction without notes in an interview
- [ ] Project 2 includes real observed traffic-split metrics, not just the configuration
- [ ] Project 3 documents an actual failure-injection test and the mesh's real observed response, not just the policy configuration
