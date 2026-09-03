# Istio — Advanced

## Debugging a Mesh at Scale — istioctl's Deeper Diagnostics

```bash
# Compare a live pod's actual Envoy config against what istiod intended
# to push -- the single most useful command for "why isn't my policy
# taking effect on this one pod specifically"
istioctl proxy-config all <pod-name> -n production

# Full config-sync analysis across the WHOLE mesh at once, not one pod --
# flags every sidecar that's STALE, NOT_SENT, or otherwise out of sync
istioctl proxy-status

# Ask istiod to explain WHY a specific config change did or didn't apply
# to a specific workload -- traces the actual selector-matching logic,
# not just "here's the resulting config"
istioctl analyze -n production

# Validate a config file BEFORE applying it -- catches selector typos,
# conflicting VirtualServices on the same host, and other errors that
# `kubectl apply` alone would accept silently
istioctl analyze -f virtualservice.yaml
```

`istioctl analyze` is the tool most experienced Istio operators reach for
first, specifically because most real production Istio incidents are
config-authoring mistakes (two `VirtualService`s claiming the same host,
a `Sidecar` egress scope excluding a service that's actually called) that
`kubectl apply` happily accepts — Kubernetes' own API validation has no
way to know Istio's routing semantics.

## Root Cause Pattern: Conflicting VirtualServices

```
Symptom: traffic to a host works inconsistently -- sometimes routes
correctly, sometimes 404s or goes to the wrong subset, with no error
in application logs (because the request never reached the application
at all -- it was misrouted by Envoy before it got there).

Real root cause, most often: TWO VirtualServices define routing rules
for the SAME host, typically because two teams (or two Helm charts)
each shipped their own VirtualService for a shared host without
realizing the other existed. Istio doesn't reject the second one at
apply time -- it merges/overrides in a way that depends on export/
precedence rules that are genuinely easy to get wrong.

Diagnosis:
  kubectl get virtualservice -A -o json | \
    jq -r '.items[] | select(.spec.hosts[] == "payment-api") | .metadata.namespace + "/" + .metadata.name'
  # if this returns more than one VirtualService for the same host,
  # that's very likely the actual bug -- not a mesh/network issue

Fix: consolidate to one VirtualService per host, or use `exportTo` to
scope each VirtualService to only the namespace that should see it.
```

## Performance: Sidecar Resource Overhead in Practice

```
Each Envoy sidecar adds real, measurable overhead that matters at scale:
  - Memory: typically 40-100MB baseline per sidecar, more under load or
    with a large mesh-wide config (every sidecar holds routing config
    for every reachable service unless scoped with a Sidecar resource,
    see Intermediate tab).
  - Latency: roughly 1-3ms added per hop (request passes through the
    caller's outbound sidecar AND the callee's inbound sidecar -- two
    proxy hops per service-to-service call, not one).
  - CPU: proportional to request volume, since every request is
    actually processed (TLS termination, routing decision, telemetry
    collection) by Envoy, not just passed through.

At genuinely high scale (thousands of pods), this overhead is the
concrete argument for ambient mode's per-node ztunnel model (Intermediate
tab) over sidecar-per-pod -- the savings are real, but only for the
portion of traffic that doesn't need L7 features from a waypoint.
```

## Progressive Delivery: Automating Canary Analysis

```yaml
# Flagger (a separate CNCF project, commonly paired with Istio) automates
# what a manual canary rollout does by hand: gradually shift traffic
# weight while a metrics check gates each step, roll back automatically
# on failure -- rather than a human watching dashboards and editing
# VirtualService weights manually.
apiVersion: flagger.app/v1beta1
kind: Canary
metadata: { name: payment-api }
spec:
  provider: istio
  targetRef:
    apiVersion: apps/v1
    kind: Deployment
    name: payment-api
  service:
    port: 9898
  analysis:
    interval: 1m
    threshold: 5          # 5 consecutive failed checks -> automatic rollback
    maxWeight: 50
    stepWeight: 10         # shift 10% more traffic every interval, up to maxWeight
    metrics:
      - name: request-success-rate
        thresholdRange: { min: 99 }
        interval: 1m
      - name: request-duration
        thresholdRange: { max: 500 }   # ms
        interval: 1m
```

Flagger generates and manages the underlying `VirtualService`/
`DestinationRule` weight changes itself — the manual 90/10 split shown in
Fundamentals is exactly what this automates, gated on real success-rate
and latency metrics instead of a fixed time delay.

## Security Hardening: Beyond Basic mTLS

```yaml
# JWT-based end-user authentication, layered ON TOP of service-to-service
# mTLS -- mTLS proves "this call came from the order-service," a
# RequestAuthentication additionally proves "this call is on behalf of
# a specific logged-in user," which mTLS alone cannot express
apiVersion: security.istio.io/v1beta1
kind: RequestAuthentication
metadata: { name: jwt-auth, namespace: production }
spec:
  selector: { matchLabels: { app: payment-api } }
  jwtRules:
    - issuer: "https://auth.example.com"
      jwksUri: "https://auth.example.com/.well-known/jwks.json"
---
# Require the JWT to actually be present and valid -- RequestAuthentication
# alone only VALIDATES a JWT if one is provided, it doesn't require one
apiVersion: security.istio.io/v1beta1
kind: AuthorizationPolicy
metadata: { name: require-jwt, namespace: production }
spec:
  selector: { matchLabels: { app: payment-api } }
  action: DENY
  rules:
    - from:
        - source: { notRequestPrincipals: ["*"] }
```

This two-resource pattern (`RequestAuthentication` + a `DENY` rule on
`notRequestPrincipals`) is the standard way to make a JWT mandatory, not
optional — a common point of confusion, since `RequestAuthentication` by
itself only validates a token IF one is sent, silently allowing
unauthenticated requests through otherwise.
