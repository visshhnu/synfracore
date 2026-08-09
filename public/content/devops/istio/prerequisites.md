# Istio / Service Mesh — Prerequisites

## What to Know Before Starting Istio

Overview states this directly: solid Kubernetes knowledge is required, not optional — Istio is a layer on top of a running cluster, not a replacement for understanding Kubernetes itself.

## Required (Must Have)

### 1. Solid Kubernetes Fundamentals
```bash
kubectl get pods, kubectl label namespace, kubectl apply -f
```
- Pods, Deployments, Services — you need working knowledge, not just familiarity
- What a sidecar container is, conceptually, before Envoy's sidecar-injection model will make sense

### 2. Basic Networking and TLS Concepts
- What TLS is, and specifically what makes **mutual** TLS (mTLS) different — both sides authenticating each other, not just the server
- Basic load-balancing concepts
- What a certificate is and, at a high level, what a Certificate Authority does

### 3. Basic Understanding of Microservices Communication Problems
- Why retries, circuit breakers, and distributed tracing matter in a system with many services calling each other
- Overview's own framing is the fastest way to internalize this: without a service mesh, every team implements these independently, inconsistently, in their own application code

## Nice to Have (Speeds Up Learning)

### Docker Basics
Understanding what a sidecar container actually is at the container level (not just conceptually) makes Envoy's injection model concrete rather than abstract.

### Prior CNI/Networking-Tool Exposure
If you've been through this site's eBPF & Cilium section, understanding the tradeoffs between a sidecar-proxy approach (Istio) and an eBPF-based datapath approach (Cilium) becomes a genuinely comparable, concrete architectural discussion rather than two unrelated tools.

### Distributed Tracing Concepts
Basic familiarity with what a trace/span is (this site's Datadog or Prometheus/Grafana sections touch on this) makes Istio's automatic tracing injection land as a clear benefit rather than an abstract feature.

## What You Do NOT Need

- Envoy proxy configuration expertise — Istio abstracts Envoy's raw configuration behind its own CRDs (`VirtualService`, `DestinationRule`)
- Prior Linkerd or other service-mesh experience
- Deep PKI/certificate-authority administration experience — Istio's built-in CA handles certificate issuance automatically

## Time Estimate

If you have the prerequisites above:
- Fundamentals: 1-2 days
- Intermediate + Advanced: 5-7 days
- Job-ready (comfortable with mTLS modes, traffic management, and the sidecar-injection model): 2-3 weeks

## Start Here

Go to the **Installation** section to install Istio onto a cluster, then proceed to **Fundamentals**.
