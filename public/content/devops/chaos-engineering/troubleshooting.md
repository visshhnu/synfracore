# Chaos Engineering — Troubleshooting

## An experiment "passed" but you don't actually trust the result

The most common source of a falsely reassuring chaos experiment isn't a bug in the tooling — it's an under-specified steady-state definition or a blast radius so conservative it never really stressed anything. Before trusting a "Pass" verdict, check specifically: was the steady-state metric precise enough to actually fail if something went wrong (a vague "still responding" check passes even when latency triples), and did the experiment's duration and scope actually exercise the failure path being tested (killing one pod out of twenty replicas barely stresses anything if load balancing across the other nineteen was never in question). A pass on a poorly-scoped experiment is worse than no experiment at all, because it creates false confidence rather than an honest "we haven't verified this yet."

## The experiment itself caused an unintended outage

This is the scenario every safety rule (staging-first, small blast radius, a working abort mechanism) exists to prevent — when it happens anyway, the actual root cause is almost always one of a small number of things: the abort/kill-switch mechanism was assumed to work but was never actually tested before the real experiment ran; the blast radius was larger than intended because a label selector matched more resources than expected (a `matchLabels: {app: api}` selector catching every service with that label across multiple unrelated deployments, for instance); or the experiment ran against production when the intent was staging, due to a misconfigured namespace or environment variable. The fix in every case is the same discipline: dry-run the abort mechanism specifically before ever running the actual experiment, and verify the selector's exact match scope in a read-only check before applying anything that can terminate resources.

## LitmusChaos experiment stuck in "Running" and never resolves

```bash
# Check the actual experiment pod's status and logs directly —
# the ChaosResult resource alone often doesn't show why it's stuck
kubectl get pods -n litmus -l chaosUID
kubectl logs -n litmus <experiment-runner-pod-name>

# Common causes surfaced in the logs:
# - chaosServiceAccount lacks RBAC permissions for the target resource kind
# - TOTAL_CHAOS_DURATION set far longer than intended (check for a units mistake — seconds vs minutes)
# - the target application's labels/namespace don't match appinfo, so the runner finds nothing to act on and hangs waiting
```
The RBAC cause is the one worth checking first in practice — LitmusChaos experiments run under a dedicated service account that needs explicit permissions for whatever resource kind (pods, deployments, network policies) the experiment manipulates, and a missing permission typically manifests as a silently-stuck runner rather than a clear, immediately obvious error.

## Network chaos experiment shows no measurable effect

If a Chaos Mesh `NetworkChaos` latency injection doesn't produce any observable change in the target service's actual response times, the most common cause isn't that the injection failed — it's that the `selector` matched the wrong pods, or matched pods that aren't actually on the traffic path being tested (a canary/preview deployment instead of the real production replicas, for instance). Confirm the injection actually landed before concluding the system is resilient:

```bash
# Confirm chaos is actually active on the target pod
kubectl describe podchaos latency-payment-api -n production
# Check the "Events" section for confirmation the sidecar/iptables rule was applied

# Directly verify from inside a pod that traffic is actually delayed
kubectl exec -it <target-pod> -- curl -w "%{time_total}\n" -o /dev/null -s http://downstream-service/health
```
A negative result (no observed impact) is only meaningful once you've confirmed the chaos was actually applied to the traffic path in question — otherwise it's evidence the experiment didn't run correctly, not evidence the system is resilient.

## Team pushback: "this is too risky to run against anything real"

This is a legitimate, common objection, not something to override by simply insisting — and the actual fix isn't a bigger argument, it's a smaller experiment. Restart from the most conservative possible scope: staging only, one pod, business hours, full team watching live, with an explicitly pre-tested abort mechanism demonstrated to the room before the real experiment starts. A track record of several small, successful, genuinely low-risk experiments is what typically earns the trust needed to expand scope later — trying to skip straight to a larger, more convincing experiment to win the argument faster usually has the opposite effect if anything goes even slightly wrong.
