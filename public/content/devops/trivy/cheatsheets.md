# Trivy Quick Reference Cheatsheet

## Core Scans

```bash
trivy image nginx:1.25                       # scan an image
trivy image --severity HIGH,CRITICAL nginx    # filter by severity
trivy image --exit-code 1 nginx               # non-zero exit on findings

trivy fs ./my-app                              # scan a local directory
trivy repo https://github.com/example/repo    # scan a remote repo, no clone needed
trivy config ./terraform/                      # scan IaC for misconfigurations
trivy k8s cluster                              # scan a live K8s cluster
```

## CI Gate Pattern

```bash
trivy image --severity HIGH,CRITICAL --exit-code 1 myapp:latest
# 0 = no matching findings, gate passes
# 1 = findings present, gate fails
```

## SBOM

```bash
trivy image --format cyclonedx --output sbom.json myapp:latest
trivy image --format spdx-json --output sbom.spdx.json myapp:latest
trivy sbom sbom.json                           # scan an existing SBOM
```

## Secret & License Scanning

```bash
trivy image --scanners secret myapp:latest
trivy repo --scanners secret https://github.com/example/repo
trivy image --scanners license myapp:latest
```

## .trivyignore

```
CVE-2023-12345  # accepted risk, no fix available, reviewed 2026-06-01
CVE-2023-67890  # false positive for our usage, confirmed with vendor
```

## Air-Gapped / Offline

```bash
trivy image --download-db-only --cache-dir ./db-cache myapp:latest
trivy image --skip-db-update --cache-dir ./db-cache myapp:latest
```

## Custom Policy (Rego)

```bash
trivy config --policy ./custom-policy.rego ./k8s-manifests/
```

## VEX

```bash
trivy image --vex openvex.json myapp:latest
```

## Kubernetes Operator

```bash
kubectl get vulnerabilityreports -A
kubectl describe vulnerabilityreport <name> -n <namespace>
```

## Output Formats

```
table (default)   json   cyclonedx   spdx-json   sarif   template
```
