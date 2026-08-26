# Trivy Key Notes

## Scan Targets Quick Reference

| Command | Target |
|---|---|
| `trivy image` | Container image (local or registry) |
| `trivy fs` | Local filesystem/directory |
| `trivy repo` | Remote Git repository |
| `trivy config` | IaC (Terraform, K8s manifests, Dockerfiles, CloudFormation) |
| `trivy k8s` | Live Kubernetes cluster (already-running workloads) |
| `trivy sbom` | An existing SBOM file, checked against the vuln DB |

## Scanner Types

| Scanner | Checks For |
|---|---|
| `vuln` | Known CVEs in OS packages and language dependencies |
| `misconfig` | IaC/manifest misconfigurations (default rules + custom Rego) |
| `secret` | Accidentally-committed credentials |
| `license` | Dependency license compliance |

## Severity Levels

```
UNKNOWN < LOW < MEDIUM < HIGH < CRITICAL
```
CI gating commonly filters to `HIGH,CRITICAL` to avoid noise from lower-severity findings.

## CI Gating Essentials

```
--severity HIGH,CRITICAL    # filter to what matters for blocking
--exit-code 1                # make Trivy's exit status reflect findings
                               # (default: always exits 0, purely informational)
```

## Key Files

| File | Purpose |
|---|---|
| `.trivyignore` | Suppress specific findings — document reason + review date per entry |
| Custom `.rego` policy | Extend misconfiguration checks with org-specific rules |
| VEX document | Standardized, portable exploitability-status claims |

## SBOM Formats

```
CycloneDX   — widely used, tool-agnostic
SPDX        — another widely-adopted standard format
```

## Air-Gapped Workflow

```
1. On a connected machine: trivy image --download-db-only --cache-dir <dir>
2. Transfer <dir> through an approved internal channel
3. On the air-gapped machine: trivy image --skip-db-update --cache-dir <dir>
4. Repeat periodically -- offline DB does NOT auto-update
```

## Why Results Can Change on an Unchanged Image

```
Trivy's vulnerability DB updates over time. A new CVE affecting an
ALREADY-INSTALLED package can be discovered and added to the
database after the image was originally scanned clean -- the image
didn't change, the database's knowledge did.
```

## Trivy Operator (Kubernetes-native continuous scanning)

```
Runs as a controller, auto-scanning on deploy + periodic re-scans
Results exposed as native K8s CRDs: VulnerabilityReport, ConfigAuditReport
kubectl get vulnerabilityreports -A
```
