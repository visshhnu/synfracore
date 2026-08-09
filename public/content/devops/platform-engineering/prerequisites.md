# Platform Engineering vs SRE vs DevOps — Prerequisites

## What to Know Before Starting This Guide

Platform Engineering isn't a single tool with an install command — it's an organizational and technical discipline. The prerequisites here are about having enough surrounding context (in DevOps practices, Kubernetes, and internal-tooling concepts) that the material lands as applied engineering, not abstract organizational theory.

## Required (Must Have)

### 1. General DevOps/CI-CD Practice Familiarity
- What CI/CD, Infrastructure as Code, and monitoring are, at a working level
- Basic comfort with the idea that "automate the repetitive parts of shipping software" is the underlying goal all three terms (DevOps, SRE, Platform Engineering) share, per Overview's own framing

### 2. Kubernetes Fundamentals
```bash
kubectl get pods, kubectl apply -f
```
Most real Internal Developer Platform tooling (Backstage, Crossplane, the golden-path templates this guide describes) provisions and manages Kubernetes-native resources — you don't need deep K8s administration expertise, but the CRD/manifest mental model needs to already be familiar.

### 3. Basic Organizational/Team-Structure Awareness
- What it means for one team to depend on another team's tooling or capabilities
- Basic familiarity with the idea of a "platform team" existing separately from application teams (even if you've never worked on one) — Team Topologies' framing, referenced throughout this guide, assumes this baseline

## Nice to Have (Speeds Up Learning)

### Terraform Basics
Intermediate's Crossplane material and Advanced's build-vs-buy/funding-model discussions connect directly to infrastructure-as-code concepts — prior exposure to this site's Terraform section makes those sections faster to absorb.

### Prior Experience on Either Side of a Platform Team Relationship
If you've ever been a developer waiting on a slow internal provisioning process, or on a team building internal tooling other teams depend on, the motivations behind golden paths and self-service IDPs will feel concrete rather than abstract.

### SRE Concepts (SLOs, Error Budgets)
Since this guide explicitly compares Platform Engineering against SRE and DevOps, basic familiarity with SLO/error-budget thinking (this site's SRE-adjacent content, or general familiarity with the Google SRE book's core ideas) makes the three-way comparison land faster.

## What You Do NOT Need

- Prior Backstage or Crossplane hands-on experience — both are introduced from scratch in Intermediate
- A management or team-lead role — the material is written for an individual engineer's understanding, not requiring organizational authority to apply
- Deep Kubernetes operator/CRD-authoring experience — using existing platform tooling is different from building your own

## Time Estimate

If you have the prerequisites above:
- Overview + Fundamentals-equivalent understanding: 1 day
- Intermediate + Advanced: 3-4 days
- Interview-ready (comfortable articulating the DevOps/SRE/Platform Engineering distinction and defending real organizational tradeoffs): 1-2 weeks

## Start Here

Go to the **Installation** section to get a first golden-path capability running hands-on, then proceed to **Fundamentals**.
