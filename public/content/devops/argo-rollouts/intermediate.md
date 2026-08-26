# Argo Rollouts — Traffic Providers, Experiments & Rollback Mechanics

## Traffic providers: how canary weights actually route real traffic

A `setWeight: 10` step in a Rollout's spec is a declared intent — something still has to actually enforce that 10% of real traffic hits the new pods. Argo Rollouts doesn't do this itself; it integrates with a traffic-management layer:

```
Istio          — VirtualService/DestinationRule weighted routing (most granular:
                 header-based routing, fault injection, mTLS-aware)
AWS ALB        — TargetGroupBinding, adjusts target group weights directly
NGINX Ingress  — canary annotations on a second Ingress resource
SMI            — Service Mesh Interface, a vendor-neutral traffic-split spec
                 (works with Linkerd, and others implementing SMI)
Ambassador, Traefik, and others — via their own supported integrations
```

Without a configured traffic provider, a Rollout can still run its canary *steps* (scaling new/old pod counts per the step schedule), but without precise traffic-percentage enforcement at the routing layer, actual user traffic split follows basic Kubernetes Service load-balancing across however many pods exist at each replica count — a rougher approximation of the declared weight, not an exact guarantee. Choosing and correctly configuring a traffic provider is what makes `setWeight: 10` mean "exactly 10% of requests," not "roughly however the Service happens to balance load right now."

## Background analysis vs. inline analysis steps

```yaml
strategy:
  canary:
    analysis:
      templates:
      - templateName: error-rate-check
      startingStep: 2          # BACKGROUND: starts running at step 2,
                                # continues in parallel with later steps
    steps:
    - setWeight: 10
    - pause: {duration: 5m}
    - setWeight: 50
    - analysis:                # INLINE: runs at this specific step,
        templates:              # rollout pauses HERE until this analysis
        - templateName: error-rate-check   # resolves
    - setWeight: 100
```

**Background analysis** runs continuously alongside the whole rollout once triggered, checking metrics repeatedly across multiple steps — good for catching a regression that only shows up gradually. **Inline analysis** (an `analysis` step in the `steps` list) runs once at that specific point and blocks progression until it resolves — good for a clear go/no-go gate at a specific weight. Real rollout strategies frequently combine both: background analysis catching slow-building issues throughout, plus inline gates at key weight thresholds.

## The Experiment CRD: testing a new version alongside stable, without shifting production traffic

```yaml
apiVersion: argoproj.io/v1alpha1
kind: Experiment
metadata:
  name: new-algorithm-test
spec:
  duration: 1h
  templates:
  - name: baseline
    specRef: stable
  - name: canary
    specRef: canary
  analyses:
  - name: baseline-vs-canary
    templateName: success-rate
    args:
    - name: service-name
      value: canary
```

An `Experiment` runs a separate, temporary set of pods (baseline and canary versions) side by side, generating and comparing their own metrics — without touching the main Rollout's live traffic split at all. This is the right tool when you want to validate a new version's behavior under controlled conditions (a specific test duration, specific comparison metrics) before ever exposing it to a percentage of real production traffic, which is a distinct use case from the Rollout's own canary steps.

## Rollback mechanics: automatic vs. manual, and what actually happens

```bash
kubectl argo rollouts abort payment-service     # stop the current rollout,
                                                  # scale canary to 0, traffic
                                                  # fully back to stable
kubectl argo rollouts undo payment-service      # roll back to the previous
                                                  # revision entirely — a new
                                                  # rollout TO the old version
```

**Automatic rollback** (triggered by a failed AnalysisRun) behaves like `abort` — the canary is scaled down and traffic returns fully to the stable version, without a human needing to intervene. **`undo`** is different: it initiates a new rollout *to* the previous ReplicaSet's version, going through canary steps again in reverse (unless configured otherwise) — not an instant revert. Knowing which one actually applies in a given failure matters: an automated AnalysisTemplate failure triggers the abort-style behavior by default, not `undo`.

## Promote: manual and full

```bash
kubectl argo rollouts promote payment-service           # advance past current pause
kubectl argo rollouts promote payment-service --full     # skip ALL remaining
                                                            # steps, go straight
                                                            # to 100%
```

`promote` without `--full` only advances past the *current* pause step — the rollout still executes every remaining step in sequence, including any remaining analysis gates. `--full` skips directly to 100% traffic, bypassing all remaining steps and analysis — appropriate for a case where you're confident enough to skip the rest of the gradual rollout, but it does mean forfeiting whatever protection the skipped analysis steps would have provided.

## Try It (2 Minutes)

Using the traffic providers list above:

1. A team runs Argo Rollouts with `setWeight: 10` in their canary steps, but hasn't configured Istio, ALB, NGINX canary annotations, or any other traffic provider. Does 10% of real traffic actually reach the new pods precisely?
2. What's the difference in scope between an `Experiment` and a canary's own analysis steps?
3. If an automated AnalysisTemplate fails during a canary rollout, does that trigger `abort`-style behavior or `undo`-style behavior by default?

You should land on: no — without a configured traffic provider, actual routing follows basic Service load-balancing across current pod counts, not a precise enforced percentage; an Experiment runs separate, temporary baseline/canary pods to compare metrics without touching the live Rollout's traffic at all, while canary analysis steps evaluate the actual in-progress rollout itself; a failed AnalysisTemplate triggers abort-style behavior (scale down canary, full traffic back to stable) by default, not undo.
