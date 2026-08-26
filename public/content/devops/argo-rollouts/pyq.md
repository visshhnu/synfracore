# Argo Rollouts — PYQ (Practice Questions)

**Framing note:** Argo Rollouts doesn't have its own standalone certification exam. There is a CNCF-affiliated "Certified Argo Project Associate" (CAPA) covering the broader Argo project family (ArgoCD, Argo Rollouts, Argo Workflows, Argo Events) together `(needs verification — recheck CAPA's current status, scope, and whether Argo Rollouts content is weighted significantly within it, since certification programs are revised periodically)`. What follows is built from this guide's own Overview/Intermediate/Advanced/Troubleshooting material, framed as practice questions grounded in real, documented Argo Rollouts behavior — not sourced from any leaked exam archive.

---

### 1. (Domain: Core Concepts) What does a standard Kubernetes `Deployment`'s rolling update lack that `Rollout` specifically adds?

**Answer:** A standard rolling update proceeds based purely on pod readiness (did the container start and pass its readiness probe) — it has no concept of real application-level health signals like error rate or latency, so a version that starts fine but produces bad results rolls out to 100% with no automatic check catching it. `Rollout` adds precise, controllable traffic-weight steps and optional metric-based analysis that can gate progression or trigger automatic rollback, closing exactly this gap.

---

### 2. (Domain: Traffic Management) Why doesn't `setWeight: 10` alone guarantee exactly 10% of real traffic reaches the canary?

**Answer:** `setWeight` is a declared intent within the Rollout spec — actually enforcing that precise percentage at the routing layer requires a configured traffic provider (Istio, AWS ALB, NGINX canary annotations, or an SMI-compliant mesh). Without one, the canary/stable ReplicaSets still scale according to the step schedule, but real traffic split follows basic Kubernetes Service load-balancing across whatever pods currently exist — an approximation, not a precisely enforced percentage.

---

### 3. (Domain: Analysis) What's the difference between an inline analysis step and background analysis?

**Answer:** Inline analysis is placed directly in the `steps` list — the rollout pauses at that specific point and blocks progression until the analysis resolves, acting as a specific go/no-go gate. Background analysis runs continuously in parallel starting from a defined `startingStep`, without blocking step progression itself, and is better suited to catching regressions that build up gradually across the whole rollout rather than at one specific checkpoint.

---

### 4. (Domain: Rollback) If an AnalysisTemplate's failure condition is met during a canary, what happens by default?

**Answer:** The rollout behaves like an automatic `abort` — the canary is scaled down and traffic returns fully to the stable version, without requiring manual intervention. This is different from `undo`, which initiates an entirely new rollout back to the previous revision, going through progressive steps again rather than an immediate stable-traffic restoration.

---

### 5. (Domain: Experiments) When would you use an `Experiment` resource instead of a canary's own analysis steps?

**Answer:** An `Experiment` runs a temporary, separate set of baseline and canary pods specifically to compare their metrics over a defined duration, without touching the live Rollout's actual production traffic at all. This is the right choice when you want controlled, isolated validation before ever exposing the new version to real traffic — as opposed to canary analysis steps, which evaluate the actual in-progress rollout that IS currently receiving a percentage of live traffic.

---

### 6. (Domain: Strategies) What's the fundamental resource-cost tradeoff between canary and blue-green strategies?

**Answer:** Canary shifts traffic gradually, so resource cost at any point is proportional to the current step's replica split between stable and canary — never running two full duplicate deployments simultaneously except transiently. Blue-green routes 100% of traffic to either the active or preview version at any given moment, but requires running full duplicate capacity (both versions fully scaled) throughout the transition period, in exchange for instant, complete rollback by simply switching routing back.

---

### 7. (Domain: Manual Control) What's the difference between `kubectl argo rollouts promote <name>` and `promote <name> --full`?

**Answer:** `promote` without `--full` only advances past the current pause step — the rollout continues to execute every remaining step in sequence, including any remaining analysis gates. `--full` skips directly to 100% traffic, bypassing all remaining steps and analysis entirely — a deliberate decision to forfeit whatever protection those remaining steps would have provided, not a routine action.

---

### 8. (Domain: Integration) How do ArgoCD and Argo Rollouts divide responsibility when used together?

**Answer:** ArgoCD handles WHAT gets deployed — syncing the desired state from Git as the source of truth. Argo Rollouts handles HOW the deployment actually proceeds — the canary or blue-green mechanics once a new version is being rolled out. Used together, a Git push changes the image tag, ArgoCD detects and syncs the change, and Argo Rollouts takes over executing the actual progressive rollout — giving full GitOps and progressive delivery simultaneously rather than requiring a choice between them.

---

### 9. (Domain: Operations) Does `kubectl argo rollouts restart` go through the same canary/blue-green steps as a normal version-change rollout?

**Answer:** No. `restart` recreates all pods (useful for picking up a ConfigMap/Secret change that doesn't itself trigger a version-based rollout) but does not execute canary/blue-green steps — it's closer to a rolling pod restart than a safety-checked progressive delivery event, and shouldn't be treated as a substitute for a real canary rollout when actual application code has changed.

---

### 10. (Domain: Capacity Planning) Why does capacity planning for an application using canary rollouts need to account for more than its steady-state replica count?

**Answer:** During an active canary, both stable and canary ReplicaSets run simultaneously at whatever proportion the current step dictates, meaning total resource consumption can temporarily exceed the steady-state Deployment-equivalent footprint — especially at intermediate weights like 50%. A namespace or cluster sized exactly for one full replica count can hit resource pressure specifically during its own canary rollouts if this temporary overhead isn't budgeted for in advance.
