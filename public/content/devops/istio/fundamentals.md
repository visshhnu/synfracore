# Istio — Fundamentals

**Analogy** — `istiod` (the control plane) is like a building's central security office issuing instructions, and each Envoy sidecar is like a guard stationed at one specific door, following those instructions. The security office doesn't check anyone's ID itself — it decides the policy ("this door allows badge type A only after 6pm") and pushes it out to every guard. Each guard then enforces that policy locally, in real time, without radioing back to the office for every single person who walks through. That's exactly the control-plane/data-plane split below: `istiod` computes and distributes config, Envoy sidecars are the ones actually intercepting and enforcing it on live traffic.

```
istiod (control plane)  --pushes Envoy xDS config-->  Envoy sidecar (data plane)
   "the policy office"                                  "the guard at this pod's door"
                                                                  │
                                                    intercepts ALL traffic in/out of the pod
```

## What is Istio?

| Without Istio | With Istio |
|---|---|
| Each service implements its own retries, timeouts | An Envoy sidecar handles all traffic policies |
| Plain HTTP between pods (insecure) | Automatic mTLS between all services |
| Manual canary deployment code | Weight-based routing in a VirtualService |
| Add a tracing SDK to each service | Automatic trace header propagation |
| No circuit breaking | Outlier detection in a DestinationRule |

```bash
istioctl install --set profile=default -y
kubectl label namespace production istio-injection=enabled
# every new pod in "production" now gets an Envoy sidecar automatically
```

## Traffic Management

```yaml
# VirtualService — 90/10 canary split, plus retries and a beta-user override
apiVersion: networking.istio.io/v1alpha3
kind: VirtualService
metadata: { name: payment-api }
spec:
  hosts: [payment-api]
  http:
    - match:
        - headers: { x-canary-user: { exact: "true" } }
      route: [{ destination: { host: payment-api, subset: v2 } }]
    - route:
        - destination: { host: payment-api, subset: v1 }
          weight: 90
        - destination: { host: payment-api, subset: v2 }
          weight: 10
      retries: { attempts: 3, perTryTimeout: 5s, retryOn: 5xx,reset,connect-failure }
      timeout: 30s
      fault:
        delay: { percentage: { value: 1.0 }, fixedDelay: 2s }  # chaos-test 1% of traffic
---
# DestinationRule — subsets plus a circuit breaker
apiVersion: networking.istio.io/v1alpha3
kind: DestinationRule
metadata: { name: payment-api }
spec:
  host: payment-api
  trafficPolicy:
    outlierDetection:
      consecutive5xxErrors: 5
      interval: 30s
      baseEjectionTime: 30s
      maxEjectionPercent: 50
  subsets:
    - name: v1
      labels: { version: v1 }
    - name: v2
      labels: { version: v2 }
```

## mTLS & Authorization

```yaml
# Enforce strict mTLS mesh-wide
apiVersion: security.istio.io/v1beta1
kind: PeerAuthentication
metadata: { name: default, namespace: istio-system }
spec:
  mtls: { mode: STRICT }
---
# Only allow the order-service to call payment-api on this specific path
apiVersion: security.istio.io/v1beta1
kind: AuthorizationPolicy
metadata: { name: payment-api-authz, namespace: production }
spec:
  selector: { matchLabels: { app: payment-api } }
  action: ALLOW
  rules:
    - from:
        - source: { principals: ["cluster.local/ns/production/sa/order-service"] }
      to:
        - operation: { paths: ["/api/v1/charge"], methods: ["POST"] }
```

## Istio Architecture — Control Plane and Data Plane

| Component | Plane | What it does |
|---|---|---|
| istiod | Control Plane | The brain — manages Envoy config, issues mTLS certs, handles service discovery; one istiod manages the whole mesh |
| Envoy sidecar | Data Plane | A proxy injected into every pod, intercepting all inbound/outbound traffic, enforcing policies, collecting telemetry |
| Pilot | Control Plane (inside istiod) | Converts Istio config (VirtualService, DestinationRule) into Envoy xDS config and pushes it to sidecars |
| Citadel | Control Plane (inside istiod) | Certificate Authority — issues and rotates mTLS certificates for every service |
| Galley | Control Plane (inside istiod) | Validates Istio config before it's applied |

```bash
# Manual injection, without a namespace label
istioctl kube-inject -f deployment.yaml | kubectl apply -f -
# Verify a pod actually got the sidecar: it should show TWO containers
kubectl describe pod mypod -n production   # your-app AND istio-proxy
```

## Circuit Breaker — What Outlier Detection Does

When a pod returns 5 consecutive 5xx errors within 30 seconds, Istio ejects it from the load-balancing pool for 30 seconds — traffic stops going to that pod, it can recover, and it's re-admitted afterward. This prevents a single failing pod from degrading the whole service, without needing any application-level circuit-breaker code.

## mTLS and Observability

With Istio, every service-to-service call is automatically encrypted and mutually authenticated with no code changes required — Envoy sidecars handle the TLS handshake, and each service has a SPIFFE-format identity certificate issued by Citadel.

**Built-in observability — the three signals:**

| Signal | What Istio provides | Where to view |
|---|---|---|
| Metrics | Request rate, error rate, latency (P50/P95/P99) per service pair, automatically from every Envoy sidecar | Prometheus + Grafana (Istio dashboards built-in) |
| Traces | Distributed traces across microservices — Envoy propagates trace headers | Jaeger or Zipkin |
| Logs | Access logs for every request — source, destination, status code, duration | ELK or Loki |

Zero instrumentation is required — install Istio, label the namespaces, and every service automatically gets request metrics, traces, and logs. This is Istio's biggest operational value: instant observability across all microservices without changing a single line of application code.

## Try It (2 Minutes)

Using the two-container pod from the Overview tab's Try It (`nginx` + `istio-proxy`):

1. Run `istioctl proxy-config listeners <nginx-pod-name>` — this asks the Envoy sidecar directly what it's currently configured to intercept, straight from the "guard's" own local config, not from `istiod`.
2. Run `istioctl proxy-status` — this shows every sidecar in the mesh and whether it's in sync with `istiod`'s latest pushed config (`SYNCED`) or lagging (`STALE`). That distinction — "the office issued new instructions" vs. "this specific guard has actually received and applied them" — is exactly the control-plane/data-plane split above, and it's the first thing to check when a policy change (a new `VirtualService`, a stricter `PeerAuthentication`) doesn't seem to be taking effect on one particular pod.

## Interview Questions

**What is a service mesh and when do you actually need Istio?**
A service mesh is a dedicated infrastructure layer for managing service-to-service communication — it handles traffic management (retries, timeouts, circuit breaking, canary deployments), security (mTLS between all services, authorization policies), and observability (distributed tracing, per-service-pair metrics), all without requiring changes to application code. The sidecar proxy (Envoy, in Istio's case) is injected into every pod and intercepts all traffic. Istio genuinely becomes necessary once there are more than roughly 5 microservices with real cross-cutting concerns — you don't want to reimplement retries and circuit breaking inside every individual service — and specifically once mTLS between all services, fine-grained traffic-splitting for canary deployments, or automatic distributed tracing without an SDK in every service become genuine requirements. For a smaller number of services, or where these specific needs aren't yet real, Istio's operational complexity (an extra control plane, sidecar resource overhead, a genuinely non-trivial learning curve) can outweigh its benefit — it's a deliberate architectural investment, not a default every Kubernetes cluster should reach for.
