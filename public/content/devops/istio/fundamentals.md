# Istio

Containers › Istio
🕸️**Istio**
BeginnerEngineerProductionArchitectService mesh — traffic management, mTLS, circuit breaking, canary deployments
[What is Istio](#sec-what)[Traffic Management](#sec-traffic)[mTLS & Security](#sec-security)[Interview Q&A](#sec-interview)


## 🕸️ What is Istio?›


#### Why service mesh?

| Without Istio | With Istio |
|---|---|
| Each service implements retries, timeouts | Envoy sidecar handles all traffic policies |
| Plain HTTP between pods (insecure) | Automatic mTLS between all services |
| Manual canary deployment code | Weight-based routing in VirtualService |
| Add tracing SDK to each service | Automatic trace headers propagation |
| No circuit breaking | Outlier detection in DestinationRule |


Install Istio + enable sidecar injectionCopy

```

```


## 🔀 Traffic Management›


VirtualService canary + retries + fault injection + circuit breakerCopy

```

```


## 🔒 mTLS & Authorization›


PeerAuthentication mTLS + AuthorizationPolicy + JWTCopy

```

```


## 🏗️ Istio Architecture — Control Plane and Data Plane›


#### Two planes — one manages, one handles traffic

| Component | Plane | What it does |
|---|---|---|
| istiod | Control Plane | The brain: manages Envoy config, issues mTLS certs, handles service discovery. One istiod manages the whole mesh. |
| Envoy sidecar | Data Plane | A proxy injected into every pod. Intercepts all inbound/outbound traffic. Enforces policies, collects telemetry. |
| Pilot | Control Plane (inside istiod) | Converts Istio config (VirtualService, DestinationRule) into Envoy xDS config and pushes to sidecars. |
| Citadel | Control Plane (inside istiod) | Certificate Authority — issues and rotates mTLS certificates for every service. |
| Galley | Control Plane (inside istiod) | Validates Istio config before applying. |


#### Sidecar injection — automatic vs manual

```
# Enable automatic injection for a namespace
kubectl label namespace production istio-injection=enabled

# After labeling: every new pod gets an Envoy sidecar injected automatically
# Verify: kubectl describe pod mypod -n production
# You will see two containers: your-app AND istio-proxy

# Manual injection (without namespace label)
istioctl kube-inject -f deployment.yaml | kubectl apply -f -
```


## 🔀 Traffic Management — VirtualService and DestinationRule›


#### The two core Istio objects for traffic control

**VirtualService** = routing rules. Where does traffic go? Split percentages, match on headers, retry logic.

**DestinationRule** = what happens after routing. Connection pools, outlier detection, load balancing, mTLS mode.


```
# VirtualService — route 90% to v1, 10% to v2 (canary)
apiVersion: networking.istio.io/v1alpha3
kind: VirtualService
metadata:
name: payment-api
spec:
hosts:
- payment-api                  # matches the K8s Service name
http:
- match:
- headers:
x-canary-user:
exact: "true"          # beta users always get v2
route:
- destination:
host: payment-api
subset: v2
- route:                       # everyone else: 90/10 split
- destination:
host: payment-api
subset: v1
weight: 90
- destination:
host: payment-api
subset: v2
weight: 10
retries:
attempts: 3
perTryTimeout: 5s
retryOn: 5xx,reset,connect-failure
timeout: 30s

---
# DestinationRule — define subsets and circuit breaker
apiVersion: networking.istio.io/v1alpha3
kind: DestinationRule
metadata:
name: payment-api
spec:
host: payment-api
trafficPolicy:
connectionPool:
http:
http2MaxRequests: 1000
http1MaxPendingRequests: 100
outlierDetection:             # circuit breaker
consecutive5xxErrors: 5     # eject after 5 consecutive 5xx
interval: 30s
baseEjectionTime: 30s
maxEjectionPercent: 50      # eject max 50% of endpoints
subsets:
- name: v1
labels:
version: v1
- name: v2
labels:
version: v2
```


#### Circuit breaker — what outlier detection does

When a pod returns 5 consecutive 5xx errors in 30 seconds, Istio ejects it from the load balancing pool for 30 seconds. Traffic stops going to that pod. It can recover and be re-admitted. This prevents a single failing pod from degrading the whole service.


## 🔐 mTLS and Observability›


#### mTLS — automatic mutual TLS between all services

With Istio, every service-to-service call is automatically encrypted and mutually authenticated — no code changes required. Envoy sidecars handle the TLS handshake. Each service has a SPIFFE-format identity certificate issued by Citadel.


```
# Enforce strict mTLS across entire mesh
apiVersion: security.istio.io/v1beta1
kind: PeerAuthentication
metadata:
name: default
namespace: istio-system    # applies mesh-wide
spec:
mtls:
mode: STRICT   # reject all non-mTLS traffic

# Allow permissive (both mTLS and plaintext) during migration
# mode: PERMISSIVE
```


#### Built-in observability — the three signals

| Signal | What Istio provides | Where to view |
|---|---|---|
| Metrics | Request rate, error rate, latency (P50/P95/P99) per service pair — automatically from every Envoy sidecar | Prometheus + Grafana (Istio dashboards built-in) |
| Traces | Distributed traces across microservices — Envoy propagates trace headers | Jaeger or Zipkin |
| Logs | Access logs for every request — source, destination, status code, duration | ELK or Loki |


Zero instrumentation required. Install Istio, label namespaces — every service automatically gets request metrics, traces, and logs. This is Istio's biggest operational value: instant observability across all microservices without changing any application code.


## 🎯 Interview Questions›


All
Architect
Engineer
Production


ISTIO · ARCHITECT
What is a service mesh and when do you actually need Istio?
A service mesh is a dedicated infrastructure layer for managing service-to-service communication. It handles traffic management (retries, timeouts, circuit breaking, canary deployments), security (mTLS between all services, authorization policies), and observability (distributed tracing, metrics per service pair) without requiring changes to application code. The sidecar proxy (Envoy in Istio) is injected into every pod and intercepts all traffic. When do you NEED Istio: more than 5 microservices with cross-cutting concerns (you do not want to implement retries and circuit breaking in every service), need mTLS b
