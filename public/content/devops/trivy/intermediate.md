# Trivy Intermediate — SBOM, Secrets & License Scanning

## SBOM — Software Bill of Materials

```bash
# Generate an SBOM in CycloneDX format (widely used, tool-agnostic)
trivy image --format cyclonedx --output sbom.json myapp:latest

# Generate an SBOM in SPDX format (another widely-adopted standard)
trivy image --format spdx-json --output sbom.spdx.json myapp:latest

# Scan an EXISTING SBOM file against the vulnerability database
# (useful when the SBOM was generated elsewhere, or earlier)
trivy sbom sbom.json
```

An SBOM is a complete, structured inventory of every component (every OS package, every language dependency, down to specific versions) in an image or codebase — increasingly required for supply-chain security compliance (frameworks like Executive Order 14028 in the US government context, and various industry supply-chain security standards reference SBOM as a baseline requirement). Generating an SBOM once and re-scanning it later against an updated vulnerability database (`trivy sbom`) is meaningfully faster than re-scanning the full original image again, since Trivy doesn't need to re-inspect the image's actual layers a second time.

## Secret Scanning — built in, not a separate tool

```bash
# Secret scanning runs as part of a standard image/fs/repo scan by default
trivy image myapp:latest
# Findings include: AWS access keys, private keys, GitHub tokens,
# generic high-entropy strings matching common secret patterns, etc.

# Explicitly scope to ONLY secret scanning
trivy image --scanners secret myapp:latest

# Scan a repository (including its Git history) for committed secrets
trivy repo --scanners secret https://github.com/example/repo
```

Secret scanning uses a combination of known-pattern matching (recognizable formats like AWS access key prefixes) and entropy-based heuristics (a string that "looks" like a secret based on its randomness) — meaning it can catch both well-known credential formats and generic high-entropy strings that don't match a specific known pattern, though the entropy-based detection naturally has a higher false-positive rate than exact pattern matching.

## License Scanning

```bash
trivy image --scanners license myapp:latest
```

License scanning identifies the licenses of dependencies found in an image — relevant for organizations with policies restricting certain license types (e.g. avoiding copyleft licenses like GPL in commercially-distributed proprietary software, where GPL's terms could create real legal obligations incompatible with a closed-source distribution model). This is a genuinely different concern from vulnerability scanning — a dependency can be perfectly secure (zero known CVEs) while still carrying a license that's a real problem for a specific organization's distribution model.

## Scanning a Live Kubernetes Cluster

```bash
# Scans workloads ALREADY RUNNING in a cluster, not just build-time
# image scanning before deployment
trivy k8s --report summary cluster

# Scope to a specific namespace
trivy k8s --namespace production --report summary cluster
```

`trivy k8s` addresses a genuinely different gap than build-time image scanning — an image can be scanned clean at build time, then a new vulnerability affecting an already-installed package gets discovered in the vulnerability database AFTER the image is already deployed and running. Cluster scanning catches this class of "vulnerability discovered after deployment" issue, which build-time-only scanning structurally cannot.

## Trivy Operator — continuous, automated cluster scanning

Beyond running `trivy k8s` manually/on a schedule, the Trivy Operator runs as a Kubernetes-native controller, automatically scanning workloads as they're deployed (and periodically re-scanning existing ones) and exposing results as native Kubernetes custom resources (`VulnerabilityReport`, `ConfigAuditReport`, etc.) — making scan results queryable via `kubectl` and integrable with standard Kubernetes tooling/dashboards, rather than requiring a separate external reporting system.

```bash
# Once the Trivy Operator is installed, scan reports are native
# Kubernetes resources
kubectl get vulnerabilityreports -A
kubectl describe vulnerabilityreport <report-name> -n <namespace>
```

## Multiple Scanners in One Run

```bash
# Run vulnerability, misconfiguration, and secret scanning together
# in a single invocation (this is actually the default behavior for
# most target types)
trivy image --scanners vuln,misconfig,secret myapp:latest
```

Trivy's default behavior for most scan targets already runs multiple scanner types together — the explicit `--scanners` flag is for narrowing to specific ones (useful when only one type of check is relevant for a given CI stage) rather than something required to enable the additional checks in the first place.

## Try It (2 Minutes)

Using the SBOM section above:

1. Why is re-scanning an already-generated SBOM (`trivy sbom`) typically faster than re-running a full `trivy image` scan on the same image again?
2. Can an image with zero known CVEs still fail a license-scanning check?
3. Why does `trivy k8s` catch vulnerabilities that build-time `trivy image` scanning might miss?

You should land on: SBOM scanning works from the already-extracted component inventory, skipping the need to re-inspect the image's actual layers again; yes — license scanning checks dependency licenses against policy, a completely separate concern from vulnerability status, so a secure, zero-CVE image can still carry a license that violates an organization's distribution policy; because a vulnerability can be discovered (added to the database) AFTER an image was already scanned clean and deployed — cluster scanning re-checks already-running workloads against the current database, catching this class of issue build-time-only scanning structurally can't.
