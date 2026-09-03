# Istio — Intermediate

## Ambient Mode — Sidecar-less Istio

```
Sidecar mode (the default, covered in Fundamentals):
  Every pod gets its own Envoy sidecar container injected alongside it.
  Pro: full L7 feature set, isolated per-pod.
  Con: real resource overhead per pod (one more container, one more
  memory/CPU footprint, multiplied across every pod in the mesh).

Ambient mode (newer, opt-in alternative — no sidecars at all):
  ztunnel: one small per-node proxy handling L4 (mTLS, basic routing)
    for every pod on that node — shared, not per-pod.
  waypoint proxy: a separate, optional per-namespace/per-service-account
    Envoy proxy that only gets deployed where L7 features (retries,
    fault injection, fine-grained routing) are actually needed.

Why this split exists: most services in a mesh only ever need mTLS and
basic routing (L4) — ambient mode gives them that for free via ztunnel,
with zero per-pod overhead, and only pays the full sidecar-equivalent
cost (a waypoint) for the specific services that actually use L7
features. This is a genuine architecture trade-off, not a strict
upgrade — sidecar mode is still the right default for meshes that use
L7 traffic management (canary splits, fault injection) broadly across
most services, since ambient's savings come specifically from services
that DON'T need L7.
```

```bash
# Enable ambient mode for a namespace (no pod restarts, no sidecar injection)
istioctl install --set profile=ambient -y
kubectl label namespace production istio.io/dataplane-mode=ambient

# Deploy a waypoint only for a service that needs L7 features
istioctl waypoint apply --service-account payment-api -n production
```

## Multi-Cluster Service Mesh

```
Why: a single mesh spanning multiple Kubernetes clusters — common for
multi-region failover, or splitting a mesh across separate teams'
clusters while still allowing cross-cluster service calls with the
same mTLS/traffic-management guarantees as within one cluster.

Primary-remote topology (most common pattern):
  One cluster runs the full istiod control plane ("primary").
  Other clusters ("remote") run only Envoy sidecars/ztunnel, with their
  configuration pushed from the primary cluster's istiod over the
  network — no separate control plane per cluster to manage.

Cross-cluster service discovery requires:
  1. A shared root CA (both clusters' workload certs must chain to the
     same root, or cross-cluster mTLS fails identity verification).
  2. East-west gateway — a dedicated Istio ingress gateway configured
     specifically for cluster-to-cluster traffic (distinct from the
     regular north-south ingress gateway handling external traffic).
  3. Remote secret — a kubeconfig for the remote cluster, applied to
     the primary so istiod can watch the remote cluster's services.
```

## Custom Envoy Filters — When VirtualService Isn't Enough

```yaml
# EnvoyFilter — add a custom Lua script to modify request headers,
# for a case VirtualService's built-in fields don't cover
apiVersion: networking.istio.io/v1alpha3
kind: EnvoyFilter
metadata: { name: add-request-id, namespace: production }
spec:
  workloadSelector:
    labels: { app: payment-api }
  configPatches:
    - applyTo: HTTP_FILTER
      match:
        context: SIDECAR_INBOUND
        listener:
          filterChain:
            filter: { name: envoy.filters.network.http_connection_manager }
      patch:
        operation: INSERT_BEFORE
        value:
          name: envoy.filters.http.lua
          typed_config:
            "@type": type.googleapis.com/envoy.extensions.filters.http.lua.v3.Lua
            inlineCode: |
              function envoy_on_request(request_handle)
                request_handle:headers():add("x-request-id", "generated-here")
              end
```

`EnvoyFilter` is Istio's escape hatch for anything `VirtualService`/
`DestinationRule` don't expose directly — genuinely low-level (it patches
Envoy's own config structures), and the Istio project itself recommends
using it only when no higher-level API covers the need, since `EnvoyFilter`
resources aren't guaranteed API-stable across Istio/Envoy version upgrades
the way `VirtualService` is.

## Sidecar Resource — Scoping What Each Proxy Knows About

```yaml
# Without this, every Envoy sidecar in the mesh holds config for EVERY
# service in the mesh, even ones it never talks to -- fine for small
# meshes, a real memory/CPU cost at hundreds of services.
apiVersion: networking.istio.io/v1beta1
kind: Sidecar
metadata: { name: payment-api-sidecar, namespace: production }
spec:
  workloadSelector:
    labels: { app: payment-api }
  egress:
    - hosts:
        - "production/inventory-api.production.svc.cluster.local"
        - "production/user-api.production.svc.cluster.local"
        - "istio-system/*"   # always needed: talks to istiod
```

Scoping each sidecar's config to only the services it actually calls is a
standard production optimization once a mesh grows past roughly 50-100
services — reduces each Envoy's memory footprint and the volume of config
istiod has to push on every change, without changing any traffic-routing
behavior.

## Transition to Advanced

You're ready for advanced Istio topics when you can:
- Explain when ambient mode's per-node ztunnel is enough vs. when a
  specific service genuinely needs a waypoint proxy for L7 features
- Describe what a shared root CA and an east-west gateway are for in a
  multi-cluster mesh, and why cross-cluster mTLS fails without them
- Justify when `EnvoyFilter` is the right tool vs. reaching for it as a
  first resort when a higher-level Istio API would do
