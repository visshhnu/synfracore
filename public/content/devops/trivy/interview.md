# Trivy Interview Questions

**Q: What's the difference between Trivy's vulnerability scanning and its misconfiguration scanning?**
A: Vulnerability scanning checks installed packages/dependencies against a database of known CVEs — a problem in code that was written elsewhere and shipped with a known flaw. Misconfiguration scanning checks the IaC/manifest structure itself (a Terraform resource, a Kubernetes Pod spec, a Dockerfile) against known-bad patterns — a problem in how something is CONFIGURED, independent of whether any installed package has a CVE. A perfectly patched image can still be deployed with a dangerous configuration, which is exactly why both checks matter separately.

**Q: How does `--exit-code` actually make Trivy function as a CI gate?**
A: Without it, Trivy reports findings but always exits 0, meaning a CI pipeline step succeeds regardless of what was found — purely informational. `--exit-code 1` (combined with severity filtering) makes Trivy's own exit status reflect whether matching findings were present, which is what a CI system actually checks to decide pass/fail — turning Trivy from a reporting tool into an enforced quality gate.

**Q: Why might scanning the exact same, unchanged image produce different results weeks apart?**
A: Trivy's vulnerability database is a real, periodically-updated dependency — a new CVE affecting a package that was already installed in that image can be discovered and added to the database after the image was originally scanned clean. The image itself hasn't changed; the database's knowledge has.

**Q: What's the purpose of a `.trivyignore` file, and what's the risk of using it carelessly?**
A: It suppresses specific findings from failing a scan/gate — appropriate for genuinely reviewed, accepted risks (a CVE with no available fix). The risk is treating it as a way to silence inconvenient findings without documentation or review — an undocumented, unreviewed ignore list defeats the purpose of scanning in the first place, since it becomes indistinguishable from simply not checking for those issues.

**Q: What's an SBOM, and why does it matter beyond just running a vulnerability scan?**
A: A Software Bill of Materials is a complete, structured inventory of every component (down to specific versions) in an image or codebase. It matters for supply-chain security compliance and enables re-scanning against an updated vulnerability database later without re-inspecting the original image's layers again — and provides a portable, standard artifact other tools/consumers can also check, not just Trivy's own point-in-time scan result.

**Q: What's the difference between VEX and a `.trivyignore` entry?**
A: `.trivyignore` is a local, tool-specific suppression with no standardized structure — it silences a finding for Trivy specifically, without any portable explanation. VEX (Vulnerability Exploitability eXchange) is a structured, standardized format expressing exploitability status with justification, portable across tools and shareable with downstream consumers of an image or SBOM — a more formalized, auditable way to communicate the same kind of "this doesn't actually affect us" decision.

**Q: Why does cluster scanning (`trivy k8s`) matter in addition to build-time image scanning?**
A: Build-time scanning only reflects what's known at the moment of the build — a vulnerability discovered in an already-installed package AFTER an image is deployed and running won't be caught by a one-time build-time gate. Cluster scanning re-checks already-running workloads against the current vulnerability database on a schedule, catching this "discovered after deployment" class of issue that build-time-only gating structurally can't.

**Q: What's a custom Rego policy used for in Trivy, beyond the built-in misconfiguration checks?**
A: Trivy ships with a broad set of common, well-known misconfiguration checks, but an organization's own specific policies (a required label convention, a mandated resource-limit rule) go beyond generic defaults. Custom Rego policies (the same language Open Policy Agent uses) let an organization extend Trivy with genuinely organization-specific rules.

**Q: How would you handle Trivy scanning in an air-gapped environment with no internet access?**
A: Download the vulnerability database once on a connected machine, transfer it through an approved internal channel, and configure Trivy to use that local cache (`--skip-db-update --cache-dir`) rather than attempting to reach the internet directly. This requires a deliberate, ongoing process for periodically refreshing that offline database, since it won't auto-update on its own.

**Q: How would you design a CI/CD pipeline incorporating Trivy for a containerized application with Terraform infrastructure?**
A: Add an image scan stage after build (severity-filtered, exit-code-gated) before the image is pushed; add a separate config scan stage against the Terraform directory before `terraform apply` runs; use a documented `.trivyignore` for specific reviewed exceptions; archive JSON/SBOM reports for audit purposes; and separately schedule periodic cluster re-scans of already-deployed workloads, distinct from the build-time gate, to catch vulnerabilities discovered after deployment.

## Skills Employers Value

```
CI GATE TUNING: setting severity thresholds and exit-code gating
  that catch real risk without drowning teams in noise
DOCUMENTED RISK ACCEPTANCE: using .trivyignore/VEX with genuine
  review and justification, not as a way to silence findings
MULTI-TARGET COVERAGE: understanding image, IaC, secret, and SBOM
  scanning as distinct, complementary checks, not interchangeable
CONTINUOUS SCANNING DISCIPLINE: re-scanning already-deployed
  artifacts on a schedule, not just gating new builds
SALARY: DevSecOps/security-scanning expertise is increasingly
  valued within DevOps/platform roles `(needs verification --
  recheck current salary bands against current industry survey
  data before citing a specific figure)`
```
