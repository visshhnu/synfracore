# SRE Automation — Notes

## Core mental model

- Toil is specifically manual + repetitive + automatable + tactical + scales with growth — not just "work that feels tedious." All five criteria matter for deciding what's actually worth automating.
- Automation's speed is both its value (react in seconds, not minutes) and its central risk (a wrong action executes just as fast as a right one, before a human can catch it).
- A failure mode is a good automation candidate specifically when it's well-understood, safe to retry, and has a deterministic fix — ambiguous or side-effect-risky failures should route to a human with pre-gathered context instead.

## Automation types, from the Overview/Fundamentals content

- Runbook automation — converting a human-followed runbook into an executable script triggered from alerts
- Auto-remediation — Kubernetes' own OOMKill restart is the baseline example; custom remediation follows the same pattern for other well-understood failures
- Capacity auto-scaling — autoscaling itself is a form of SRE automation, eliminating manual "watch a dashboard, add replicas" toil
- GitOps deployment automation — removes manual `kubectl apply` risk while deliberately keeping a human review checkpoint (PR merge) before deploy
- Alert correlation — groups many symptom alerts into one root-cause incident, the source of a large share of real MTTR improvement

## Guardrails that matter for automated remediation specifically

- Circuit breakers — a hard cap on repeated automated attempts within a time window, escalating to a human once exceeded, prevents an unfixable failure from looping indefinitely
- Explicit allowlists for alert-to-action mapping — automating "whatever alert comes in triggers some action" is how automation ends up acting on something nobody intended
- Automation actions must emit their own visible signal every time they fire — otherwise a slowly-worsening problem an auto-remediation is quietly compensating for can go unnoticed far longer than without automation
- Input validation on anything from an external trigger (an alert webhook) before it's used to target a destructive/state-changing action — treat it with the same discipline as user input

## Automating away the signal — the subtlest failure mode

- Automated remediation that "successfully" suppresses a symptom (e.g. auto-restart before an OOM) can make a real, worsening underlying issue (a memory leak) invisible to normal monitoring for a long time
- The fix: track the automation's own trigger rate as an alertable metric — a rising remediation-action count for one service is itself a signal worth investigating, not a silent background process

## Validating automation

- Automated remediation is a hypothesis ("when X fails, this fixes it") until actually tested against a real triggering condition — chaos engineering is the deliberate way to test that hypothesis before a real incident is the first test
- Automation that worked when written can silently break after an unrelated change (a deprecated API, a renamed label convention, an expired credential) — regular validation catches this drift before it matters

## Maturity progression

- Reactive (manual runbook execution) → Triggered (automated, but no circuit breaker/escalation) → Guarded (circuit breakers + escalation + visibility in place) → Validated (regularly chaos-tested against real triggering conditions)
- Most teams plateau at "Triggered" — moving to "Guarded" is mostly a design discipline, not new tooling, and is worth prioritizing before expanding automation's scope further
