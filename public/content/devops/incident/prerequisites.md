# Incident Management — Prerequisites

## What You Need Before Starting

Incident Management is less about a specific technical tool and more about a decision-making discipline applied under pressure to systems you already need to understand — it sits on top of general operational/DevOps knowledge rather than being a from-scratch starting point.

### 1. Basic familiarity with how production systems generally fail (required)

You don't need deep expertise, but you should understand at a conceptual level what "a deployment causing an outage" or "a service returning errors" actually looks like operationally — this course's material assumes you can follow along with examples like `kubectl rollout undo` or "the connection pool exhausted" without every term needing to be defined from scratch. If you haven't touched this platform's DevOps-adjacent technologies yet (Linux, Networking, or basic Kubernetes concepts), spending some time there first will make the incident-response examples land as concrete rather than abstract.

### 2. Some exposure to monitoring/alerting concepts (recommended)

Understanding, at a basic level, that systems get monitored and that alerts fire based on defined thresholds (even without deep expertise in a specific tool like Prometheus or Datadog) helps the MTTD/MTTA/MTTR metrics in this course's material feel concrete rather than abstract — knowing roughly what "an alert fires, someone gets paged" means in practice is enough to start.

### 3. Comfort with the idea of structured communication under pressure (helpful, builds with practice)

This isn't a technical prerequisite so much as a mindset one — a meaningful part of incident management is about *how* you communicate during a stressful, uncertain situation (regular updates even without new information, clear handoffs, admitting uncertainty rather than guessing confidently). If structured communication under pressure feels unfamiliar or uncomfortable, that's completely normal and exactly what this material and practice (real incidents, or simulated "game days," as covered in this course's own FAQ) is meant to build over time — it's not something you need to already have mastered before starting.

### 4. Basic understanding of what a deployment/release process looks like (recommended)

Since a large share of real incidents correlate with recent deployments, understanding conceptually that code gets deployed, that deployments can be rolled back, and that a "recent change" is one of the first things worth checking during triage will make this course's Response Framework module click faster. If you're unfamiliar with CI/CD concepts generally, this platform's dedicated CI/CD-adjacent technologies are worth at least a light pass first.

### 5. What you do *not* need yet

- Prior on-call or incident-response experience — this course is designed to build that foundation, not assume it already exists
- Deep expertise in any specific monitoring/alerting/incident-tooling product (PagerDuty, OpsGenie, Datadog) — the concepts transfer across tools, and this course focuses on the underlying practice rather than any one vendor's interface
- A formal ITSM/ITIL background — ITIL Foundation (covered in this course's own PYQ material) is one path to formalize this knowledge, but it's not a prerequisite to start learning the practical skill here

### Quick self-check

Given the scenario "a deployment went out 20 minutes ago, and error rates just started climbing" — does it make immediate sense why "what changed recently" would be one of the very first questions to ask, before diving into deep application-level debugging? If yes, you're ready for this course's Fundamentals section. If that connection isn't obvious yet, it's worth spending a little time understanding basic deployment/release concepts first — this course builds directly on that intuition rather than establishing it from zero.
