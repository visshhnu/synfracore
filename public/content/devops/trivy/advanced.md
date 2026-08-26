# Trivy Advanced — Custom Policies, Air-Gapped Environments & VEX

## Custom Misconfiguration Policies with Rego

```rego
# custom-policy.rego -- flag any Kubernetes Pod without resource limits set
package custom.kubernetes.resources

deny[msg] {
  input.kind == "Pod"
  container := input.spec.containers[_]
  not container.resources.limits
  msg := sprintf("Container '%s' has no resource limits set", [container.name])
}
```

Apply it against a manifest directory:

```bash
trivy config --policy ./custom-policy.rego ./k8s-manifests/
```

Trivy's built-in misconfiguration checks cover a broad set of common, well-known bad patterns out of the box — but an organization's OWN specific policies (a required label convention, a mandated resource-limit policy, an internal naming standard) go beyond what a generic tool ships with. Trivy supports custom policies written in Rego (the same policy language Open Policy Agent uses), letting an organization extend Trivy's checks with genuinely organization-specific rules rather than being limited to only the built-in defaults.

## Air-Gapped / Offline Environments

```bash
# On a machine WITH internet access: download the vulnerability DB
trivy image --download-db-only --cache-dir ./trivy-db-cache myapp:latest

# Transfer ./trivy-db-cache to the air-gapped environment through
# an approved internal channel

# On the air-gapped machine: scan using the pre-downloaded DB,
# skipping any attempt to reach the internet
trivy image --skip-db-update --cache-dir ./trivy-db-cache myapp:latest
```

For highly-regulated or genuinely air-gapped environments where scanning infrastructure can't reach the internet directly, Trivy supports a disconnected workflow — downloading the vulnerability database once on a connected machine, distributing it through an approved internal process, and running scans against that local copy. This requires an explicit, deliberate process for keeping the offline database current, since it won't auto-update the way a connected deployment would.

## VEX (Vulnerability Exploitability eXchange)

```json
{
  "@context": "https://openvex.dev/ns/v0.2.0",
  "statements": [{
    "vulnerability": {"name": "CVE-2023-12345"},
    "products": [{"@id": "pkg:oci/myapp@sha256:..."}],
    "status": "not_affected",
    "justification": "vulnerable_code_not_in_execute_path"
  }]
}
```

Use it during a scan:

```bash
trivy image --vex openvex.json myapp:latest
```

VEX is a structured, machine-readable format for expressing "this vulnerability exists in a component we ship, but our specific usage isn't actually exploitable" — a formalized, auditable alternative to an informal `.trivyignore` entry. This matters especially at scale/for compliance: a bare `.trivyignore` suppression is a local, tool-specific decision; a VEX statement is a portable, standardized claim that can be shared with downstream consumers of an image or SBOM, letting them make their own informed risk decisions rather than just seeing a suppressed finding with no context.

## Trivy in a Multi-Stage CI/CD Pipeline

```yaml
# Illustrative CI pipeline stage ordering
stages:
  - build          # build the image
  - scan-image     # trivy image --exit-code 1 --severity HIGH,CRITICAL
  - scan-config    # trivy config --exit-code 1 --severity HIGH,CRITICAL (parallel-safe)
  - push           # only reached if both scan stages passed
  - deploy
  - scan-cluster   # scheduled, separate from the deploy pipeline itself --
                    # periodic trivy k8s re-scan of already-running workloads
```

A mature pipeline separates build-time gating (blocking a bad deploy before it happens) from ongoing cluster scanning (catching newly-discovered vulnerabilities in already-deployed workloads) — these address genuinely different risk windows, and conflating them (only ever scanning at build time, never re-checking what's already running) leaves a real gap.

## Comparing Findings Across Scans (Trend Tracking)

```bash
# JSON output enables programmatic comparison across scans over time
trivy image --format json --output scan-$(date +%Y%m%d).json myapp:latest

# A team can build (or use existing) tooling to diff successive
# JSON reports -- surfacing NEWLY introduced findings specifically,
# distinct from findings that were already present and accepted
```

Beyond a single pass/fail gate, archiving structured JSON output over time enables trend analysis — is the count of accepted-but-unfixed findings growing or shrinking over successive builds? Is a specific dependency repeatedly the source of new findings, suggesting it should be replaced rather than continuously patched? This kind of longitudinal view requires deliberately archiving and comparing scan output, not something a single scan invocation provides on its own.

## Performance Considerations at Scale

```bash
# --cache-dir persists the vulnerability DB between runs -- without
# a shared/persistent cache, every CI run redownloads the full DB,
# adding real time and unnecessary network load
trivy image --cache-dir /shared/trivy-cache myapp:latest
```

At real CI/CD scale (many pipeline runs per day across many repositories), a shared, persistent cache directory for the vulnerability database avoids every single run redownloading the entire database from scratch — a meaningful performance and reliability improvement, especially in ephemeral CI runner environments that would otherwise start from a completely cold cache every single time.

## Try It (2 Minutes)

Using the VEX section above:

1. What's the key difference between a `.trivyignore` entry and a VEX statement, beyond just file format?
2. In an air-gapped environment, what would happen if the local vulnerability database is never updated after initial setup?
3. Why does separating build-time scanning from scheduled cluster re-scanning matter, rather than relying on build-time scanning alone?

You should land on: `.trivyignore` is a local, tool-specific suppression with no standard structure for sharing WHY across tools/organizations; VEX is a portable, standardized format expressing exploitability status that can be shared with downstream consumers, carrying structured justification; an outdated offline database means scans would miss any vulnerability discovered/added to the database after that snapshot, silently growing more inaccurate over time without an explicit process to refresh it; build-time scanning only catches what's known at build time — a vulnerability discovered in an already-deployed image's dependencies later requires re-scanning what's actually running to catch, which build-time-only gating structurally cannot do.
