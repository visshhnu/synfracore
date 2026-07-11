# Chaos Engineering — Notes

## Core mental model

- Chaos engineering discovers failure modes nobody has thought of yet — HA/DR design defends against failure modes that *are* already known. They're complementary, not competing practices.
- An experiment without a precise, falsifiable steady-state definition isn't a real experiment — "things look fine" isn't a claim that can fail.
- Blast radius is the entire safety model. Start with one pod, in staging, with a tested abort mechanism, before anything bigger.
- A "Pass" verdict is only as trustworthy as the steady-state definition and blast radius behind it — a vague check or an under-scoped experiment can pass without proving anything real.

## Tool selection, at a glance

- **LitmusChaos** — Kubernetes-native, CRD-based (`ChaosEngine`), the common starting point for teams fully on Kubernetes.
- **Chaos Mesh** — Kubernetes-native, particularly strong for network-specific experiments (latency, packet loss, partition).
- **AWS FIS** — managed, AWS-native (EC2/ECS/EKS/RDS), built-in `stopConditions` tied to CloudWatch alarms.
- **Gremlin** — enterprise SaaS, polished UI and governance, real license cost versus the open-source options.
- **Toxiproxy** — application/test-level network fault injection, not a full production chaos platform.

## Failure categories worth testing, beyond "kill the pod"

- Infrastructure: pod/instance termination, AZ failure, disk exhaustion, CPU/memory stress
- Network: added latency, packet loss, service-to-service partition — reveals timeout/cascading-failure gaps that hard-kill tests miss entirely
- Application: forced error responses, slow endpoints, dropped DB connections, corrupted cache entries
- Security (less common, genuinely underused): simulate a revoked credential, a NetworkPolicy violation, or a condition a SIEM/Falco rule is supposed to catch — tests whether security controls actually work, not just whether they're configured

## Game days — what makes them actually useful

- Define the scenario and hypothesis ahead of time; keep exact trigger timing unknown to the responder to simulate a real page
- Run the same incident-response process (severity, comms, incident commander) that would apply to a real outage
- Time-to-detect and time-to-mitigate are the metrics that matter — not just pass/fail
- A blameless retro afterward, focused on the gaps found (monitoring, alerting, runbooks) — the gaps are the actual output of a game day, not a side note

## Maturity progression

- Ad hoc → Structured (regular game days, blameless retros) → Automated (known-safe experiments run in CI/CD against every release) → Continuous (automated gates + ongoing exploratory game days for high-risk scenarios)
- Most teams plateau at "Structured" — moving to "Automated" requires a track record of a specific experiment run manually and safely, many times, before trusting it to block a pipeline
- Higher-risk experiments (full AZ/region failure, security chaos) need explicit organizational buy-in and a scheduled window — never treated as routine automated gates

## Common mistakes worth remembering

- Assuming the abort/kill-switch mechanism works without ever actually testing it before the real experiment
- A label selector matching more resources than intended — verify exact match scope before applying anything destructive
- Running the experiment against production due to a misconfigured namespace/env var, when staging was intended
- Concluding "the system is resilient" from a network-chaos experiment without first confirming the injection actually landed on the real traffic path
