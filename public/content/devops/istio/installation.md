# Istio / Service Mesh — Installation Guide

## Install the `istioctl` CLI

```bash
curl -L https://istio.io/downloadIstio | sh -
cd istio-*
export PATH=$PWD/bin:$PATH

istioctl version
```

## Install Istio — Demo Profile (Learning/Evaluation)

The `demo` profile enables every core feature for hands-on learning, matching Overview's own quick-start path:

```bash
istioctl install --set profile=demo -y

# Verify the control plane is running
kubectl get pods -n istio-system
```

## Install Istio — Production Profile

For anything beyond local learning, the `production` profile applies more conservative, production-appropriate defaults:

```bash
istioctl install --set profile=production -y
```

## Enable Sidecar Injection for a Namespace

Istio doesn't automatically inject the Envoy sidecar into every pod cluster-wide — it's opt-in per namespace:

```bash
kubectl label namespace production istio-injection=enabled

# Existing pods need to be restarted to actually receive the sidecar —
# labeling the namespace alone only affects NEW pods going forward
kubectl rollout restart deployment -n production
```

## Enable STRICT mTLS

The production-appropriate mTLS mode — rejecting any non-mTLS traffic, per Overview's STRICT/PERMISSIVE distinction:

```yaml
apiVersion: security.istio.io/v1beta1
kind: PeerAuthentication
metadata: { name: default, namespace: production }
spec:
  mtls: { mode: STRICT }
```

```bash
kubectl apply -f peer-authentication-strict.yaml
```

## Verify Everything Works

```bash
# 1. Confirm the control plane and all proxies are healthy and in sync
istioctl proxy-status

# 2. Run Istio's own configuration analyzer
istioctl analyze
# Catches common misconfigurations before they cause a real outage

# 3. Confirm a pod actually received the sidecar
kubectl get pod <pod-name> -n production -o jsonpath='{.spec.containers[*].name}'
# Should show both the application container AND istio-proxy

# 4. Confirm mTLS is actually being enforced, not just configured
istioctl proxy-config listeners <pod-name> -n production
```

## Common Installation Issues

**Pods in a labeled namespace still show only the application container, no sidecar**
Labeling the namespace only affects pods created *after* the label was applied — existing pods need `kubectl rollout restart` (or manual pod deletion/recreation) to actually receive the sidecar injection.

**`istioctl proxy-status` shows a proxy as `STALE`**
```bash
kubectl logs -n istio-system deploy/istiod
# A stale proxy means the sidecar hasn't received its latest
# configuration from istiod — check istiod's own health and logs
# first, before assuming the specific proxy/pod is the problem
```

**`istioctl analyze` reports configuration warnings after install**
Run this immediately after every install and after every significant config change — it's specifically designed to catch issues (missing `DestinationRule`, conflicting `VirtualService` rules) before they manifest as a confusing runtime symptom.

**Traffic fails after enabling STRICT mTLS**
Confirm every service actually receiving traffic in that namespace has the sidecar injected — a service without the sidecar can't participate in mTLS at all, and STRICT mode will reject its traffic outright rather than falling back to plaintext.

## What's Installed

After a successful installation:
- **istiod** — the control plane: certificate authority, configuration distribution, and service discovery
- **Envoy sidecars** — injected per-pod in labeled namespaces, forming the data plane that actually intercepts and enforces policy on traffic
- Istio CRDs — `VirtualService`, `DestinationRule`, `PeerAuthentication`, and others, used to configure traffic management and security policy declaratively

## Next Steps

Go to the **Fundamentals** section to configure mTLS and your first traffic-management rules.
