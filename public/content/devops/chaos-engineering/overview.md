# Chaos Engineering Overview

## What is Chaos Engineering?

Chaos Engineering is the practice of deliberately injecting failures into a system in a controlled way to discover weaknesses BEFORE they cause real production incidents.

**Core difference from HA and DR:**
- HA/DR designs systems that survive known failure modes
- Chaos Engineering discovers failure modes you have not thought of yet

## The Scientific Method

1. Define steady state (normal metrics: RPS, latency, error rate)
2. Form a hypothesis ("Killing one replica will not affect user latency")
3. Design the experiment with minimum blast radius
4. Run the experiment (start in staging)
5. Observe and measure
6. Fix weaknesses found
7. Repeat until confident

## Common Chaos Experiments

**Infrastructure:**
- Kill random Kubernetes pod or EC2 instance
- Terminate an entire Availability Zone
- Exhaust disk space on a node
- CPU stress or memory exhaustion

**Network:**
- Add 100ms latency between services
- Drop 10% of packets
- Block connectivity between specific services

**Application:**
- Return HTTP 500 from one microservice
- Slow down specific API endpoints
- Kill database connections
- Corrupt cache entries

## Tools

| Tool | Best For |
|------|---------|
| LitmusChaos | Kubernetes-native experiments |
| Chaos Mesh | Kubernetes plus rich network experiments |
| AWS Fault Injection Simulator | EC2, ECS, EKS, RDS on AWS |
| Gremlin | Enterprise SaaS platform |
| Toxiproxy | Network latency and failure injection |

## Safety Rules

1. Start in staging, never production first
2. Always have a kill switch to abort the experiment
3. Keep blast radius small (one pod, not the entire AZ)
4. Monitor all dashboards during the experiment
5. Run during business hours so the team can respond
