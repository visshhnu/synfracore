# Istio / Service Mesh

> **mTLS, traffic management, observability without code changes**

**Category:** Containers & Orchestration  
**Learning Path:** What → Why → Architecture → Setup → Real Examples → Production → Interview Prep

---

## What is Istio / Service Mesh?

Without a service mesh: every microservice team must implement mTLS, retries, circuit breakers, and distributed tracing independently in their code. Service mesh moves all of this into a sidecar proxy (Envoy) injected alongside every pod — zero application code changes. Istio is the most feature-rich but complex. Linkerd is simpler and lighter (Rust-based proxy).

## Why Istio / Service Mesh?

mTLS (mutual TLS) means both sides of every connection authenticate each other — unlike regular TLS where only the server proves identity. With Istio, every pod has a certificate (SPIFFE identity) injected by Istio CA. All service-to-service traffic is automatically encrypted and authenticated with no code changes. STRICT mode means non-mTLS traffic is rejected.

---

## Learning Modules

### Module 01 — What is a Service Mesh?
*Why it exists and what problem it solves*

Without a service mesh: every microservice team must implement mTLS, retries, circuit breakers, and distributed tracing independently in their code. Service mesh moves all of this into a sidecar proxy (Envoy) injected alongside every pod — zero application code changes. Istio is the most feature-rich but complex. Linkerd is simpler and lighter (Rust-based proxy).

**Topics covered:**

- The problem: 50 microservices, each needing mTLS + retries + tracing — 🟢 Beginner
- Sidecar proxy pattern (Envoy) — 🟡 Intermediate
- Control plane vs data plane — 🟡 Intermediate
- Istio vs Linkerd — when to choose each — 🟡 Intermediate

```bash
# Without service mesh — each team implements separately:
# Team A: adds retry logic in Python code
# Team B: adds circuit breaker in Java code
# Team C: adds mTLS certificates manually
# Result: inconsistent, hard to audit, hard to change

# With Istio service mesh:
# - mTLS between ALL services automatically (zero trust)
# - Retries configured in YAML (no code change)
# - Circuit breaker in YAML (no code change)
# - Distributed tracing automatically injected
# - Traffic routing in YAML (canary, A/B, blue-green)

# Sidecar injection — Envoy proxy added to every pod:
kubectl label namespace production istio-injection=enabled
# Every new pod gets: app-container + envoy-sidecar
# All traffic goes THROUGH Envoy — Envoy enforces all policies

# Istio vs Linkerd decision:
# Istio:   more features, Envoy proxy, larger footprint
#          choose when: need advanced traffic management,
#          multi-cluster, JWT auth, WASM extensions
# Linkerd: simpler, Rust proxy (smaller, faster),
#          choose when: want mTLS + basic observability only,
#          performance-sensitive, K8s-only
```

### Module 02 — mTLS — Zero Trust Networking
*Automatic encryption between all services*

mTLS (mutual TLS) means both sides of every connection authenticate each other — unlike regular TLS where only the server proves identity. With Istio, every pod has a certificate (SPIFFE identity) injected by Istio CA. All service-to-service traffic is automatically encrypted and authenticated with no code changes. STRICT mode means non-mTLS traffic is rejected.

**Topics covered:**

- What mTLS provides — 🟢 Beginner
- STRICT vs PERMISSIVE mode — 🟡 Intermediate
- PeerAuthentication policy — 🟡 Intermediate
- Verify mTLS is working — 🟡 Intermediate

```bash
# Enable STRICT mTLS for entire namespace
apiVersion: security.istio.io/v1beta1
kind: PeerAuthentication
metadata:
  name: default
  namespace: production
spec:
  mtls:
    mode: STRICT    # Reject any non-mTLS traffic

# Verify mTLS is working between services
kubectl exec -it payment-pod -c istio-proxy -- \\
  openssl s_client -connect orders-service:8080 2>/dev/null \\
  | grep "Verify return code"
# Should show: Verify return code: 0 (ok)

# Check peer authentication policies
kubectl get peerauthentication -A

# AuthorizationPolicy — which service can call which
apiVersion: security.istio.io/v1beta1
kind: AuthorizationPolicy
metadata:
  name: payment-authz
  namespace: production
spec:
  selector:
    matchLabels:
      app: payment
  rules:
  - from:
    - source:
        principals:
        - "cluster.local/ns/production/sa/orders-sa"
    # Only the orders service account can call payment
    to:
    - operation:
        methods: ["POST"]
        paths: ["/api/payment/process"]
```

### Module 03 — Traffic Management
*Canary, circuit breaker, retries, fault injection*

Traffic management in Istio is done through two CRDs: VirtualService (routing rules — where traffic goes) and DestinationRule (behaviour rules — how traffic behaves at destination). Together they enable canary deployments with exact traffic weights, circuit breakers that open when backends are unhealthy, and retry policies without changing application code.

**Topics covered:**

- VirtualService — traffic routing rules — 🟡 Intermediate
- DestinationRule — subset definitions — 🟡 Intermediate
- Canary deployment with traffic weights — 🔴 Advanced
- Circuit breaker with outlier detection — 🔴 Advanced
- Retry and timeout policies — 🟡 Intermediate
- Fault injection for testing — 🔴 Advanced

```bash
# VirtualService + DestinationRule — canary deployment
apiVersion: networking.istio.io/v1alpha3
kind: VirtualService
metadata:
  name: payment
spec:
  hosts: [payment]
  http:
  # Canary: 10% of traffic to v2, 90% to v1
  - route:
    - destination:
        host: payment
        subset: v1
      weight: 90
    - destination:
        host: payment
        subset: v2
      weight: 10
    # Retry policy — automatic, no code change needed
    retries:
      attempts: 3
      perTryTimeout: 2s
      retryOn: "5xx,connect-failure"
    timeout: 10s
---
apiVersion: networking.istio.io/v1alpha3
kind: DestinationRule
metadata:
  name: payment
spec:
  host: payment
  subsets:
  - name: v1
    labels: {version: v1}
  - name: v2
    labels: {version: v2}
  trafficPolicy:
    # Circuit breaker — open if 5 errors in 30 seconds
    outlierDetection:
      consecutive5xxErrors: 5
      interval: 30s
      baseEjectionTime: 30s
      maxEjectionPercent: 50  # Eject max 50% of endpoints

# Fault injection — test how your service handles failures
apiVersion: networking.istio.io/v1alpha3
kind: VirtualService
metadata:
  name: payment-fault-test
spec:
  hosts: [payment]
  http:
  - fault:
      delay:
        percentage: {value: 10}   # Inject 500ms delay for 10% of requests
        fixedDelay: 500ms
      abort:
        percentage: {value: 5}    # Return 500 for 5% of requests
        httpStatus: 500
    route:
    - destination:
        host: payment
```

---

## Production Example

```bash
# Istio Installation and Verification

# Install Istio (production profile)
istioctl install --set profile=production -y

# Verify installation
kubectl get pods -n istio-system
# istiod-xxx      Running  ← control plane
# istio-ingressgateway Running  ← ingress

# Enable sidecar injection on namespace
kubectl label namespace production istio-injection=enabled

# Verify sidecar injected into a pod
kubectl get pod payment-xxx -o jsonpath='{.spec.containers[*].name}'
# Output: payment istio-proxy   ← two containers = sidecar injected

# Key Istio CLI commands
istioctl analyze                          # Find config issues
istioctl proxy-status                     # All proxy sync status
istioctl proxy-config routes payment-xxx  # Routes for a specific pod
istioctl dashboard kiali                  # Service mesh topology UI
istioctl dashboard grafana                # Istio metrics dashboards
istioctl dashboard jaeger                 # Distributed traces

# Check traffic policy is applied
kubectl get virtualservice -A
kubectl get destinationrule -A
kubectl get peerauthentication -A
kubectl get authorizationpolicy -A

# COMMON TROUBLESHOOTING:
# Pod not getting sidecar:
#   kubectl describe pod xxx | grep "istio"
#   Check namespace label: kubectl get ns production --show-labels
# mTLS failing:
#   istioctl authn tls-check payment.production
# Traffic not routing correctly:
#   istioctl proxy-config routes payment-pod --name 8080
```

---

## Interview Prep

!!! tip "PSR Formula"
    Answer every question: **Problem → Solution → Result**. 45-90 seconds max.

### Common Interview Questions

??? question "What is Istio / Service Mesh and why would you use it in production?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How does Istio / Service Mesh work internally? Explain the architecture."
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "What are the main components of Istio / Service Mesh?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How do you handle failures in Istio / Service Mesh?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "What is your production experience with Istio / Service Mesh?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How do you monitor and observe Istio / Service Mesh in production?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "What are the security considerations for Istio / Service Mesh?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How does Istio / Service Mesh compare to alternatives?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "Explain What is a Service Mesh? in Istio / Service Mesh."
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "Explain mTLS — Zero Trust Networking in Istio / Service Mesh."
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

---

## Official Resources

- [Istio Documentation](https://istio.io/latest/docs/)
- [Kiali — Service Mesh Observability](https://kiali.io/docs/)
- [Linkerd Documentation](https://linkerd.io/2.15/overview/)

---

*Part of [LearnwithVishnu](https://learnwithvishnu.pages.dev) — Basics → Production → Architect*