# Istio Certification Guide

*(Format, pricing, and domain weightings below are current as of the
Linux Foundation/CNCF program at the time this was written — verify against
[training.linuxfoundation.org](https://training.linuxfoundation.org/certification/istio-certified-associate-ica/)
before relying on exact numbers, since certification programs revise
pricing and curricula periodically.)*

## Certification Available

| Cert | Full Name | Issued By | Format | Duration | Passing |
|------|-----------|-----------|--------|----------|---------|
| **ICA** | Istio Certified Associate | Linux Foundation / CNCF | Open-book, remote-proctored, hands-on + multiple-choice | 2 hours | 68% |

Unlike Jenkins' CJE/CJPE (vendor-issued by CloudBees), the ICA is a
CNCF-backed certification — the same certifying body behind Kubernetes'
CKA/CKAD — reflecting Istio's status as a CNCF graduated project. It's
open-book specifically because the exam is performance-based: you're
tested on actually operating a live Istio installation against real
tasks, not on memorizing documentation you're allowed to reference during
the exam itself.

## Exam Domains

| Domain | Weight | Key Topics |
|--------|--------|------------|
| Installation, Upgrade & Configuration | 20% | `istioctl`/Helm installation, sidecar vs. ambient mode setup, canary and in-place control-plane upgrades |
| Traffic Management | 35% | Ingress/egress routing, `VirtualService`/`DestinationRule`, traffic shifting, resilience (circuit breaking, outlier detection, timeouts, retries), fault injection |
| Securing Workloads | 25% | `AuthorizationPolicy`, authentication (mTLS, JWT via `RequestAuthentication`), edge/gateway TLS |
| Troubleshooting | 20% | Config-authoring issues, control-plane diagnostics, data-plane (sidecar) diagnostics |

Traffic Management is the single largest domain at 35% — consistent with
it also being the platform capability most site content emphasizes
(canary `VirtualService` splits, `DestinationRule` circuit breaking) since
it's genuinely the most commonly exercised Istio skill in real production
use, not just on the exam.

## Core Commands to Know Cold

```bash
# Installation & profiles
istioctl install --set profile=default -y
istioctl install --set profile=ambient -y
istioctl x precheck                    # pre-upgrade compatibility check

# Verification & troubleshooting -- these ARE the Troubleshooting domain
istioctl proxy-status                  # mesh-wide sidecar sync state
istioctl proxy-config all <pod> -n ns  # one pod's actual live Envoy config
istioctl analyze -n <namespace>        # catches config conflicts kubectl won't
istioctl analyze -f my-config.yaml     # validate BEFORE applying

# Injection
kubectl label namespace <ns> istio-injection=enabled
istioctl kube-inject -f deploy.yaml | kubectl apply -f -
```

## Sample Task Pattern (Performance-Based Section)

```yaml
# A typical exam-style task: "route 20% of traffic for `reviews` to v2,
# with a 3-retry policy on 5xx errors" -- this is exactly the
# VirtualService/DestinationRule pairing from the Fundamentals tab,
# which is why Traffic Management is worth practicing hands-on, not
# just reading about
apiVersion: networking.istio.io/v1alpha3
kind: VirtualService
metadata: { name: reviews }
spec:
  hosts: [reviews]
  http:
    - route:
        - destination: { host: reviews, subset: v1 }
          weight: 80
        - destination: { host: reviews, subset: v2 }
          weight: 20
      retries: { attempts: 3, perTryTimeout: 2s, retryOn: 5xx }
---
apiVersion: networking.istio.io/v1alpha3
kind: DestinationRule
metadata: { name: reviews }
spec:
  host: reviews
  subsets:
    - { name: v1, labels: { version: v1 } }
    - { name: v2, labels: { version: v2 } }
```

## Study Resources

- **Istio Service Mesh Essentials (LFS245)** — the Linux Foundation's own
  companion training course, often bundled with the ICA exam voucher
- **Istio official docs** (istio.io/latest/docs) — the exam is open-book
  against exactly this documentation, so practicing navigating it quickly
  is itself a real exam skill
- **A local `kind`/`minikube` cluster with Istio installed** — since the
  exam is hands-on/performance-based, practicing the actual `istioctl`
  commands above against a real cluster matters more than reading alone

## Revision Notes
```
ICA: CNCF/Linux Foundation, 2hr, open-book, hands-on + MCQ, 68% pass

DOMAIN WEIGHTS (heaviest first):
  Traffic Management     35%  -- VirtualService/DestinationRule/retries
  Securing Workloads     25%  -- AuthorizationPolicy/mTLS/JWT
  Installation/Upgrade   20%  -- istioctl/Helm, sidecar vs ambient
  Troubleshooting        20%  -- proxy-status/proxy-config/analyze

MUST KNOW COMMANDS:
  istioctl analyze          -- catches config conflicts kubectl won't
  istioctl proxy-status     -- mesh-wide sync state (SYNCED/STALE)
  istioctl proxy-config all -- one pod's actual live Envoy config

COMMON TASK SHAPE: given a scenario, write/fix a VirtualService +
DestinationRule pair -- this is the single most exam-relevant pattern,
matching Traffic Management's 35% weight.
```
