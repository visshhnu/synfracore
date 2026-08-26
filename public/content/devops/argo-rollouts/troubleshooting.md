# Argo Rollouts Troubleshooting Guide

## Issue 1: Rollout stuck in "Progressing" state indefinitely

**Symptom:** `kubectl argo rollouts get rollout <name> --watch` shows the rollout stuck at a step, never advancing.

**Root Cause:** Usually one of: (a) a `pause: {duration: ...}` step is still waiting out its duration, (b) an inline `analysis` step's AnalysisRun hasn't resolved yet (still running, or stuck itself), or (c) the step is a `pause: {}` with no duration — an indefinite pause requiring manual `promote`.

**Debug steps:**
```bash
kubectl argo rollouts get rollout <name>
# Check the specific current step and whether it's a duration-based
# pause, an analysis step, or an indefinite manual pause

kubectl get analysisrun -l rollouts-pod-template-hash=<hash>
kubectl describe analysisrun <analysisrun-name>
# If an AnalysisRun exists and is itself stuck/pending, the metrics
# provider query is the next thing to check
```

**Fix:**
```bash
# If it's an indefinite manual pause, waiting for a human decision:
kubectl argo rollouts promote <name>

# If an AnalysisRun is stuck because the metrics provider is
# unreachable, fix the provider connectivity first — don't
# reflexively --full promote past it (see real-world-scenarios.md's
# Scenario 3 for why that specific shortcut is risky)
```

---

## Issue 2: Canary traffic doesn't match the declared `setWeight`

**Symptom:** `setWeight: 10` is set, but observed traffic split doesn't reflect 10% going to canary pods.

**Root Cause:** No traffic provider (Istio, ALB, NGINX canary annotations, SMI) is configured — without one, traffic split follows basic Kubernetes Service load-balancing across current pod counts, not an enforced percentage.

**Debug steps:**
```bash
kubectl get rollout <name> -o yaml | grep -A5 "trafficRouting"
# If this section is empty/absent, no traffic provider is configured

kubectl argo rollouts get rollout <name>
# Check status.canary.weights — populated only when a traffic
# provider is actively enforcing the split
```

**Fix:** Configure an actual traffic provider (`trafficRouting.istio`, `trafficRouting.alb`, `trafficRouting.nginx`, etc.) in the Rollout spec — canary steps executing without one is a silent gap, not an error state.

---

## Issue 3: AnalysisRun reports success/failure that doesn't match actual application health

**Symptom:** Analysis passes, but the deployed version is actually broken (or vice versa — analysis fails on a healthy version).

**Root Cause:** Most commonly, the metrics query isn't correctly scoped to the canary pods specifically — it may be reading aggregate metrics across both stable and canary (diluting a real canary-specific regression), or reading stable-only metrics if traffic isn't actually reaching canary pods at all (see Issue 2).

**Debug steps:**
```bash
kubectl describe analysisrun <analysisrun-name>
# Check the actual query result value against the successCondition

# Manually run the same metrics query directly against the provider
# (e.g. the same PromQL query in Prometheus's own UI) to confirm
# what it's actually returning and whether it's scoped correctly
```

**Fix:** Scope the query with a label filter unique to canary pods (commonly `rollouts-pod-template-hash`), so the analysis is measuring the canary version specifically, not an aggregate that includes stable traffic.

---

## Issue 4: `promote` doesn't advance the rollout

**Symptom:** `kubectl argo rollouts promote <name>` returns success but the rollout doesn't visibly progress.

**Root Cause:** Usually a permissions/RBAC issue (the command silently succeeds against the API but the controller can't act), or the rollout is actually stuck on something other than a promotable pause (e.g., a failed AnalysisRun that needs to be addressed, not just promoted past).

**Debug steps:**
```bash
kubectl auth can-i update rollouts.argoproj.io/payment-service
kubectl argo rollouts get rollout <name>
# Confirm what state the rollout is actually in before assuming
# `promote` is the right action for the current blocker
```

**Fix:** If it's an RBAC issue, grant the correct verb on the `rollouts` resource. If the rollout is blocked by a failed AnalysisRun rather than a plain pause, `promote` won't resolve the underlying failure — investigate and fix (or explicitly `abort`/`undo`) instead.

---

## Issue 5: Automatic rollback didn't trigger despite a clearly broken deploy

**Symptom:** A broken version reaches 100% traffic without any automatic rollback.

**Root Cause:** Most commonly, no `analysis` step (inline or background) is actually configured in the Rollout's canary strategy at all — canary steps without any analysis attached will simply proceed through weight increases on their own schedule with no automated health check gating them, same as a plain rolling update with extra steps.

**Debug steps:**
```bash
kubectl get rollout <name> -o yaml | grep -A10 "strategy:"
# Confirm whether any `analysis` block actually exists in the
# canary steps or as a background analysis reference — a Rollout
# with only setWeight/pause steps and no analysis has no automated
# health gate at all, by design
```

**Fix:** Add an `analysis` step (inline) or a background `analysis.templates` reference to the canary strategy — automated rollback only exists where an AnalysisTemplate is actually wired into the rollout's steps; it isn't an automatic property of using a `Rollout` object instead of a `Deployment`.
