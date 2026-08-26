# SonarQube Advanced — Custom Rules, Scaling & Enterprise Patterns

## Custom Rules and Rule Templates

```java
// Simplified conceptual illustration of a custom rule check --
// real custom rules are implemented via SonarQube's plugin API
// (Java-based rule engine, language-specific AST visitors)
public class NoHardcodedPasswordRule extends IssuableSubscriptionVisitor {
  // Flags any string literal assigned to a variable/field named
  // something matching /password|secret|apikey/i
}
```

Beyond SonarQube's extensive built-in rule set, organizations with genuinely specific standards (an internal API usage convention, a deprecated internal library that should never be called) can write custom rules via SonarQube's plugin architecture, or use rule templates (parameterized versions of certain built-in rule patterns, configurable without writing a full custom plugin) for simpler customizations.

## SonarQube vs. SonarCloud vs. SonarLint

```
SonarQube  — self-hosted server; full control over infrastructure
             and data residency; you operate the database,
             Elasticsearch, and Compute Engine yourself

SonarCloud — SonarSource's own hosted SaaS; no infrastructure to
             manage; tightly integrated with GitHub/GitLab/
             Azure DevOps/Bitbucket Cloud

SonarLint  — an IDE plugin giving real-time, LOCAL analysis
             feedback as a developer types, before code is even
             committed -- can optionally "connect" to a SonarQube/
             SonarCloud server to stay in sync with that project's
             actual configured Quality Profile
```

These three products address genuinely different points in the workflow — SonarLint shifts feedback to the earliest possible moment (while writing code, before commit); SonarQube/SonarCloud provide the shared, authoritative, CI-integrated analysis and historical tracking that a single developer's local IDE session can't provide on its own (team-wide visibility, PR decoration, Quality Gate enforcement).

## Compute Engine and Analysis Processing at Scale

```
Scanner       -- runs the actual code analysis, produces a report
Compute Engine -- server-side component that processes uploaded
                  scanner reports, computing metrics/issues and
                  persisting results -- processes reports from a
                  QUEUE, meaning a burst of many simultaneous
                  analyses can create a real processing backlog
```

At real scale (many projects, many CI pipelines triggering analysis simultaneously), the Compute Engine's report-processing queue becomes a genuine operational consideration — a burst of analyses arriving faster than Compute Engine can process them results in delayed Quality Gate results, which matters directly for CI pipelines waiting on that gate status before proceeding.

## Elasticsearch Backend — search and indexing

```
SonarQube uses an embedded Elasticsearch instance for indexing
issues/search functionality within its own web UI -- a real
infrastructure dependency worth knowing about when troubleshooting
performance or planning resource allocation for a self-hosted
SonarQube deployment, distinct from the primary database (which
stores the authoritative data).
```

This is a genuinely important operational detail for anyone administering a self-hosted SonarQube instance — Elasticsearch has its own resource requirements (memory, particularly) and its own failure modes, separate from the primary database's own health.

## Portfolio and Application Views (Enterprise/higher editions)

```
Portfolio  — aggregates quality/security metrics across MULTIPLE
             projects, useful for an organization-wide view rather
             than one project at a time
Application — groups multiple related SonarQube projects
              (e.g. microservices belonging to one larger system)
              into a single combined quality view
```

For organizations with many projects (particularly microservices architectures where "the application" spans many separately-scanned repositories), Portfolio and Application views provide an aggregated view SonarQube's default per-project dashboard doesn't offer on its own — genuinely useful once project count grows past what's reasonable to review one dashboard at a time.

## Security Hotspot Review Workflow, in depth

```
Hotspot states:
  TO_REVIEW       -- flagged, awaiting human judgment
  ACKNOWLEDGED    -- reviewed, confirmed as a real risk requiring
                     a fix (effectively promotes it to Vulnerability
                     severity in practical terms)
  SAFE            -- reviewed, confirmed NOT exploitable in this
                     specific context, with a documented reason
```

The review workflow itself is the point — a Hotspot sitting in TO_REVIEW indefinitely provides no real security value, since nobody has actually made the judgment call the classification exists specifically to require. A mature SonarQube adoption tracks Hotspot review completion as its own metric, not just Bug/Vulnerability counts, since an unreviewed backlog of Hotspots represents genuine unassessed risk.

## Try It (2 Minutes)

Using the Compute Engine section above:

1. If a CI pipeline's Quality Gate check seems to be taking unusually long to return a result, despite the scanner itself completing quickly, what's a likely bottleneck to investigate?
2. What's the practical difference between SonarLint and SonarQube, in terms of WHEN feedback is delivered?
3. Why does a Security Hotspot sitting indefinitely in TO_REVIEW status provide little real security value?

You should land on: the Compute Engine's report-processing QUEUE — a burst of simultaneous analyses across many projects/pipelines can create a backlog delaying when results (and therefore the Quality Gate status) actually become available, even though the scanner itself already finished uploading its report; SonarLint delivers feedback in the IDE as code is being written, before commit; SonarQube delivers feedback after analysis (CI-triggered, or on-demand), later in the workflow but with team-wide, historical, gate-enforced visibility SonarLint alone doesn't provide; an unreviewed Hotspot represents a flagged-but-unassessed risk — nobody has made the human judgment call about whether it's actually exploitable, so it provides neither the confidence of a confirmed-safe finding nor the urgency of a confirmed real vulnerability.
