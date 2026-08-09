# Istio / Service Mesh Learning Roadmap

**Goal**: From zero service-mesh experience to production-grade Istio operations

## Learning Phases

### Phase 1: Service Mesh Fundamentals (2-3 days)

- The problem service meshes solve — mTLS/retries/tracing implemented independently per team vs. centrally
- Sidecar proxy pattern (Envoy) — control plane vs. data plane
- Istio vs. Linkerd — when to choose each
- Sidecar injection and verifying it actually happened

### Phase 2: mTLS and Security (2-3 days)

- SPIFFE identity and Istio's built-in Certificate Authority
- STRICT vs. PERMISSIVE mTLS modes
- `PeerAuthentication` policy — namespace-wide vs. workload-specific

### Phase 3: Traffic Management (3-4 days)

- `VirtualService` and `DestinationRule` — routing, retries, circuit breakers
- Canary, A/B, and blue-green traffic splitting
- `istioctl proxy-config` for inspecting live Envoy configuration

### Phase 4: Advanced Operations (1-2 weeks)

- Multi-cluster mesh federation
- Performance tuning and resource overhead management
- Observability integration — Kiali, Grafana dashboards via `istioctl dashboard`
- Sidecar-vs-ambient mesh architecture tradeoffs `(needs verification — recheck against current source for Istio's current ambient mesh maturity/recommendation status)`

### Phase 5: Troubleshooting and Interview Readiness (ongoing)

- Diagnosing stale proxy sync and `istioctl analyze` findings
- Debugging mTLS traffic failures after enabling STRICT mode
- Practice explaining the sidecar-proxy value proposition using Overview's own "airport customs at every doorway" analogy — a strong, memorable interview answer pattern

## Job Roles This Enables

- Platform Engineer (networking/security focus)
- Site Reliability Engineer
- Kubernetes/Cloud-Native Infrastructure Engineer
- Security Engineer (zero-trust networking focus)

## Target Certifications

`(needs verification — recheck against current source for CNCF's current Istio-relevant certification offerings, if any)`

## How to Use This Roadmap

1. Work through phases in order — Phase 3's traffic management assumes Phase 2's mTLS/security model is already solid, since traffic rules and security policy interact directly
2. This technology doesn't have a separate Labs tab — the Fundamentals/Intermediate/Advanced code blocks and a real cluster (per the Installation section's demo profile) are the hands-on material
3. Build the portfolio projects in `projects.md` after Phase 3 — demonstrating real canary traffic splitting with verified mTLS enforcement is far more convincing than describing the YAML
4. Run `istioctl analyze` habitually during learning, not just when something breaks — it builds the instinct for what a valid Istio configuration actually looks like
5. Compare Istio's sidecar-proxy approach against eBPF/Cilium's kernel-level approach if you've studied both — being able to articulate the tradeoff (application-layer richness vs. per-pod resource overhead) is a genuine senior-level architectural discussion point

## Prerequisites

See `prerequisites.md` in this section for what you should know before starting.

## Revision Notes
```
Total time: 3-4 weeks (part-time)
Sidecar injection issues (a pod missing its Envoy sidecar) are the
single most common early-stage stumbling block — always verify
injection actually happened before debugging anything downstream of it
```
