# Chaos Engineering — Fundamentals

## Running your first experiment: pod-delete, the "hello world" of chaos

The simplest possible chaos experiment — kill one replica of a deployment and confirm the system absorbs it without user-visible impact — is deliberately the right starting point, not a toy example to skip past. It exercises the entire chaos-engineering loop (steady state, hypothesis, controlled injection, observation) with a failure mode Kubernetes is explicitly designed to handle, so a failed experiment here reveals something genuinely wrong (a missing PodDisruptionBudget, insufficient replica count, a readiness probe that doesn't actually reflect real health) rather than an edge case:

```bash
# LitmusChaos — pod-delete experiment via a ChaosEngine resource
apiVersion: litmuschaos.io/v1alpha1
kind: ChaosEngine
metadata:
  name: nginx-chaos
  namespace: production
spec:
  appinfo:
    appns: production
    applabel: app=nginx
    appkind: deployment
  chaosServiceAccount: litmus-admin
  experiments:
    - name: pod-delete
      spec:
        components:
          env:
            - name: TOTAL_CHAOS_DURATION
              value: "30"
            - name: CHAOS_INTERVAL
              value: "10"
            - name: FORCE
              value: "false"
```
`FORCE: "false"` matters specifically — it lets the pod terminate gracefully (respecting `terminationGracePeriodSeconds` and any pre-stop hooks) rather than a hard kill, which is the more realistic failure mode for most real-world pod loss (node drain, rolling update) versus an actual crash.

## Defining steady state before touching anything

A chaos experiment without a precise, pre-defined "normal" is unfalsifiable — there's no way to tell whether an observed change during the experiment is real impact or just ordinary variance. Steady state has to be a specific, measurable claim, not a vague sense of "things look fine":

```
Bad steady-state definition:  "The service should keep working"
Good steady-state definition: "p99 latency stays under 200ms and
                                error rate stays under 0.1%, measured
                                over the 5 minutes before and during
                                the experiment"
```
This is exactly the discipline the scientific method section of the Overview tab is describing — a hypothesis has to be falsifiable to be useful, and "keep working" isn't falsifiable in any concrete sense.

## Blast radius: the single most important safety concept

Blast radius is the actual scope of what an experiment can affect if it goes wrong — and the entire practice of chaos engineering depends on that scope being deliberately, conservatively small at the start, expanding only as confidence is earned:

- **Start with one pod**, not a whole deployment — killing every replica simultaneously isn't an experiment, it's a self-inflicted outage
- **Start in staging**, and only move to production once staging experiments consistently confirm the hypothesis and the team has practiced responding
- **Always have a working abort mechanism** — LitmusChaos experiments respect `TOTAL_CHAOS_DURATION` as a hard stop, but a manual kill switch (deleting the ChaosEngine resource) should be tested and ready before the experiment starts, not something assumed to work

## Choosing a tool for where you're actually running

| Tool | Best fit | Why |
|---|---|---|
| LitmusChaos | Kubernetes-native, CNCF project | Deep native integration via CRDs (ChaosEngine, ChaosExperiment); the most common starting point for teams already fully on Kubernetes |
| Chaos Mesh | Kubernetes, especially network-heavy experiments | Purpose-built network chaos (latency, packet loss, partition) beyond what LitmusChaos covers as thoroughly |
| AWS Fault Injection Simulator | AWS-native workloads (EC2, ECS, EKS, RDS) | Managed service, no cluster-side tooling to install, integrates directly with AWS's own IAM/CloudWatch |
| Gremlin | Enterprise, mixed/hybrid infrastructure | SaaS platform with a polished UI and built-in safety controls, at real license cost — the tradeoff is convenience and governance vs. the open-source tools' zero licensing cost |
| Toxiproxy | Application-level network fault injection in tests | Lightweight proxy for simulating latency/failures in integration tests, not a full production chaos platform |

For a team just starting out on Kubernetes, LitmusChaos or Chaos Mesh are the practical defaults — both are free, both integrate natively, and the choice between them mostly comes down to whether network-specific experiments (Chaos Mesh's real strength) are the immediate priority.

## The habit that actually matters more than any specific tool

Chaos engineering's real value isn't in any single experiment — it's in making failure injection a routine, scheduled practice (a recurring "game day," covered on the Intermediate tab) rather than a one-off exercise run once and never repeated. A system that passed a chaos experiment six months ago, with no repeat testing since, provides very little actual confidence about today's system — deployments, dependency changes, and scaling since then can all have silently reintroduced the exact failure mode that experiment once ruled out.
