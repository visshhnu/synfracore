# Trivy Fundamentals — Scan Types, Severity & CI Gating

**Analogy** — Trivy is like a building inspector who checks several genuinely different things in one visit, not just one narrow thing repeated. A single inspection covers structural integrity (vulnerabilities in installed packages), code violations (IaC misconfigurations), and whether anyone left a spare key under the doormat (exposed secrets) — rather than needing three separate inspectors, each only qualified to check one of those things.

## Scan Targets — what Trivy can actually scan

```bash
trivy image <image>          # a container image (local or from a registry)
trivy fs <path>               # a local filesystem/directory
trivy repo <git-url>          # a remote Git repository, cloned automatically
trivy config <path>           # IaC configuration (Terraform, K8s manifests, Dockerfiles)
trivy k8s <context>            # a live Kubernetes cluster, scanning running workloads
trivy sbom <sbom-file>         # an existing SBOM file, checked against the vuln DB
```

Each of these is a genuinely different scan TARGET, but they share the same underlying vulnerability database and much of the same reporting format — which is exactly the consolidation benefit Trivy provides over needing separate tools per target type.

## Severity Levels

```
UNKNOWN   — severity not yet determined/classified
LOW       — minimal practical risk
MEDIUM    — real but moderate risk
HIGH      — significant risk, generally worth prioritizing
CRITICAL  — severe risk, generally the top priority to address
```

Severity comes from the underlying vulnerability database's own classification (commonly aligned with CVSS scoring) — filtering scan output/gating by severity (`--severity HIGH,CRITICAL`) is the standard way to focus CI gating on what actually warrants blocking a merge, rather than drowning a team in LOW/MEDIUM findings that may not be worth immediate action.

## Exit Codes — how Trivy drives CI/CD gating

```bash
# By default, trivy exits 0 regardless of findings -- it just reports
trivy image myapp:latest

# --exit-code makes Trivy's exit status reflect whether matching
# findings were found, which is what actually fails a CI job
trivy image --exit-code 1 --severity HIGH,CRITICAL myapp:latest
# Exit 0: no HIGH/CRITICAL findings
# Exit 1: at least one HIGH/CRITICAL finding was found
```

This distinction matters practically — without `--exit-code`, Trivy runs and reports findings but a CI pipeline step succeeds regardless, meaning the scan is purely informational rather than an actual gate. `--exit-code` combined with severity filtering is what turns Trivy from a reporting tool into an enforced quality gate.

## Vulnerability Database — a real, updating dependency

Trivy's vulnerability database aggregates data from multiple sources (NVD, GitHub Security Advisories, language-ecosystem-specific advisory databases, vendor security bulletins) and updates regularly. This has a genuinely important practical implication: **scanning the exact same image twice, days apart, can produce different results** — not because the image changed, but because the database learned about a new vulnerability affecting a package that was already there. Understanding this prevents a confusing "why did this suddenly start failing, nothing changed" moment.

```bash
# Trivy auto-updates its DB by default when online; explicitly
# trigger an update
trivy image --download-db-only

# Skip auto-update for a specific run (useful for reproducible,
# offline, or rate-limited scenarios)
trivy image --skip-db-update myapp:latest
```

## .trivyignore — documented, reviewed exceptions

```
# .trivyignore
CVE-2023-12345  # accepted risk, no fix available upstream, reviewed 2026-06-01 by security team
CVE-2023-67890  # false positive for our specific usage, confirmed with vendor
```

A `.trivyignore` file suppresses specific findings from failing the scan — but the file's value depends entirely on discipline: each entry should carry a documented reason and review date, not just a bare CVE ID silencing an inconvenient finding. An undocumented, unreviewed ignore list defeats the purpose of scanning in the first place, since it becomes indistinguishable from simply not scanning for those specific issues at all.

## Try It (2 Minutes)

Using the exit-code section above:

1. Running `trivy image myapp:latest` (no `--exit-code` flag) finds 3 CRITICAL vulnerabilities. Does this fail a CI pipeline step by default?
2. What flag combination would make a CI pipeline actually fail on those findings?
3. Why might scanning the exact same, unchanged image produce different results a month later?

You should land on: no — without `--exit-code`, Trivy reports findings but exits 0 regardless, so the CI step succeeds even with findings present; `--exit-code 1` combined with `--severity` filtering (e.g. `HIGH,CRITICAL`) makes the exit status actually reflect matching findings, failing the CI step; the vulnerability database itself updates over time, so a new CVE affecting an already-installed package can be discovered and added to the database after the image was originally scanned clean.
