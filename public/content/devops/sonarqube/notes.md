# SonarQube Key Notes

## Issue Types Quick Reference

| Type | Meaning |
|---|---|
| Bug | Code likely to produce incorrect behavior |
| Vulnerability | A security weakness with known exploitation risk |
| Code Smell | Maintainability concern, not strictly incorrect |
| Security Hotspot | Security-sensitive pattern requiring human review |

## Severity Levels

```
BLOCKER > CRITICAL > MAJOR > MINOR > INFO
```

## Core Architecture

| Component | Role |
|---|---|
| SonarScanner | Runs the actual code analysis, produces a report |
| SonarQube Server | Receives reports, stores results, serves UI/API |
| Compute Engine | Server-side: processes uploaded reports from a queue |
| Database | Authoritative data store |
| Elasticsearch (embedded) | Search/indexing for the web UI |

## Quality Profile vs. Quality Gate

```
Quality Profile — WHICH rules run, at what severity (per language/project)
Quality Gate    — WHAT COMBINATION of results = pass/fail
```

## Default Gate ("Sonar way"), scoped to New Code

```
0 new Bugs
0 new Vulnerabilities
Security Hotspots reviewed
Coverage on New Code >= 80%
Duplicated lines on New Code < 3%
```

## New Code Definitions

```
Previous version        — since the last release/tag
Number of days           — e.g. last 30 days
Reference branch          — diff against main/baseline (clearest for
                             feature-branch workflows)
```

## Scanner Invocation Quick Reference

```bash
sonar-scanner -Dsonar.projectKey=<key> -Dsonar.sources=. \
  -Dsonar.host.url=<url> -Dsonar.login=<token>

# PR analysis
-Dsonar.pullrequest.key=<n> -Dsonar.pullrequest.branch=<branch> \
  -Dsonar.pullrequest.base=main

# Branch analysis
-Dsonar.branch.name=<branch>

# Coverage import (example: JaCoCo)
-Dsonar.coverage.jacoco.xmlReportPaths=<path>
```

## Security Hotspot States

```
TO_REVIEW    — flagged, awaiting human judgment
ACKNOWLEDGED — confirmed real risk, needs a fix
SAFE          — confirmed not exploitable in context, documented
```

## Product Comparison

| Product | Feedback Point | Hosting |
|---|---|---|
| SonarLint | Real-time, in IDE, before commit | Local, optionally connected |
| SonarQube | After analysis (CI-triggered/on-demand) | Self-hosted |
| SonarCloud | After analysis | SonarSource-hosted SaaS |

## Key Gotcha: 0% Coverage

```
SonarQube does NOT run tests itself -- it IMPORTS a coverage
report the project's own tooling generated. 0% coverage almost
always means the report wasn't generated or the path is
misconfigured, not that tests genuinely don't exist.
```
