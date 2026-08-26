# Argo Rollouts — Real World Scenarios

A note on framing: all three scenarios below are illustrative/composite — common, well-documented patterns from production Argo Rollouts usage industry-wide, not one specific traceable company's incident.

---

## Scenario 1 (illustrative/composite): The canary that "passed" analysis because no traffic provider was configured

**The pattern:** A team adopts Argo Rollouts specifically for its automated-analysis safety net, converts a critical service's `Deployment` to a `Rollout` with a well-designed canary strategy (10% → analysis → 50% → analysis → 100%), and ships a genuinely broken version. The AnalysisTemplate queries Prometheus for error rate and reports healthy at every step — the rollout proceeds all the way to 100%, and the broken version is now fully live. Post-incident investigation finds the root cause: no traffic provider (Istio, ALB, etc.) was ever configured, so the "10% canary" never actually received any real user traffic at all — the metrics query was checking the STABLE version's error rate the whole time, since the canary pods weren't receiving meaningful traffic to generate their own distinct metrics.

**Why this is a genuinely easy trap, not a configuration oversight anyone would obviously catch:** the Rollout object itself doesn't fail or warn when no traffic provider is configured — canary steps still execute, pods still scale according to the step schedule, and analysis still runs and reports a result. Everything about the rollout's own status output looks like it's working correctly; the missing piece (real traffic actually being split by percentage) has no direct signal from the Rollout's own status unless you specifically know to check for a configured traffic-provider integration.

**What actually prevents this:**
- **Explicitly verify a traffic provider is configured and actually splitting traffic** before trusting any canary's analysis results — check the Rollout's `status.canary.weights` (when a traffic provider is active, this reflects real enforced weights) rather than assuming `setWeight` in the spec alone means anything is actually being enforced.
- **Scope AnalysisTemplate queries to the canary specifically** (e.g., a Prometheus query filtered by a pod-template-hash or version label unique to canary pods), so that even a misconfigured traffic split produces an analysis result that's visibly meaningless (near-zero traffic to filter on) rather than silently defaulting to reading the stable version's healthy metrics.
- **Test the traffic-provider integration itself** with a deliberately broken canary version in a non-production environment first, confirming the analysis actually catches it — validating the safety mechanism itself, not just assuming it works because the Rollout object is configured correctly.

---

## Scenario 2 (illustrative/composite): The analysis threshold that was technically correct but operationally useless

**The pattern:** A team sets an AnalysisTemplate's success condition to `result[0] >= 0.95` (95% success rate) with a `failureLimit: 1`, believing this provides solid protection. A genuinely bad deploy that produces roughly 90% success rate ships — but the analysis interval is set to `count: 5` checks at 1-minute intervals, and the specific 5-minute window sampled happens to catch a temporarily quiet traffic period where the failure rate's absolute number of failed requests is low enough that the aggregate query (summed over a longer rate window than the check interval) doesn't clearly cross the threshold until several minutes after the rollout has already fully promoted to 100%.

**Why a technically well-configured threshold still failed to protect the rollout:** the interaction between the analysis check interval, the underlying metrics query's own time window (a `rate()` query over `[2m]` inside a check that only samples every `1m`), and real traffic volume at the moment of deployment isn't obvious from reading the AnalysisTemplate YAML alone — a threshold that would clearly catch the same regression during peak traffic can miss it, or catch it too late, during a low-traffic window, simply because fewer absolute data points are feeding the same rate calculation.

**What actually prevents this:**
- **Test AnalysisTemplates against both high- and low-traffic conditions**, not just once during a convenient testing window — a threshold validated only during peak traffic can behave very differently during an off-peak deploy.
- **Align the metrics query's own time window with the check interval and count**, rather than treating them as independently chosen numbers — a `rate()` window meaningfully wider than the check interval can smooth over exactly the kind of short, sharp regression the analysis exists to catch.
- **Set `failureLimit` conservatively for genuinely critical services**, and pair automated analysis with a documented expectation that a human reviews rollout results directly for the highest-stakes deploys, rather than treating full automation as sufficient on its own for every service regardless of criticality.

---

## Scenario 3 (illustrative/composite): The force-unlock-adjacent mistake — `promote --full` used to unblock a stuck pipeline

**The pattern:** A CI/CD pipeline stage waiting on a canary's inline analysis step times out repeatedly because the configured metrics provider (a Datadog integration) has an intermittent connectivity issue unrelated to the actual deployed version's health. Under pressure to unblock a release, an engineer runs `kubectl argo rollouts promote payment-service --full` to force the rollout to completion, reasoning that the deployed code itself was already reviewed and tested pre-merge. The actual deployed version has a genuine, unrelated regression that the analysis step — had it actually been allowed to run against working metrics — would have caught.

**Why this is an understandable shortcut, not a reckless one:** `--full` is a real, documented Argo Rollouts command specifically for cases where a team is confident enough to skip remaining steps — using it to work around an infrastructure problem (a flaky metrics provider) rather than a code-confidence problem is a reasonable-sounding distinction in the moment, but it discards the actual safety check regardless of *why* it wasn't able to run, not just in cases where the check itself was the problem.

**What actually prevents this:**
- **Treat a failing/flaky analysis provider as its own incident to fix, not a rollout blocker to bypass** — fixing the Datadog connectivity issue (or falling back to an alternate configured provider) preserves the actual safety check, where `--full` discards it entirely regardless of root cause.
- **Reserve `--full` for genuine code-confidence decisions, documented as such**, separate from infrastructure-problem workarounds — if the actual reason is "our monitoring is broken," that's a different, worse justification than "we've reviewed this thoroughly and are confident," even though both can feel like the same kind of pressure in the moment.
- **Have a documented fallback metrics provider or manual-review process for when the primary analysis provider is down**, so "the analysis system itself is broken" has a safer resolution path than skipping analysis altogether.
