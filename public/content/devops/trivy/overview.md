# Trivy

> **All-in-one vulnerability, misconfiguration, and secret scanner**

**Category:** Security & Secrets Management
**Learning Path:** What → Why → Learning Modules → Production Example → Interview Prep

---

**Before you start:** basic Docker/container comfort and a general sense of what a CVE (a publicly known software vulnerability) is are assumed. No prior security-scanning-tool experience is needed.

## What is Trivy?

Trivy (from Aqua Security) is an open-source scanner covering a genuinely wide range of security-relevant targets from one tool: container images, filesystems, Git repositories, Kubernetes clusters, and Infrastructure-as-Code configuration (Terraform, CloudFormation, Kubernetes manifests, Dockerfiles). It detects known vulnerabilities (CVEs), misconfigurations, exposed secrets, and license issues.

```conceptgrid
{
  "boxes": [
    { "title": "Image / FS / Repo", "description": "Known CVEs in installed OS packages and language dependencies", "color": "blue" },
    { "title": "Config (IaC)", "description": "Misconfigurations in Terraform, Kubernetes manifests, Dockerfiles, CloudFormation", "color": "purple" },
    { "title": "Secrets", "description": "Accidentally-committed credentials, API keys, private keys", "color": "red" },
    { "title": "SBOM / License", "description": "Full component inventory (CycloneDX/SPDX) and license compliance", "color": "green" }
  ]
}
```

## Why Trivy?

Before a tool like Trivy, a team typically needed several separate tools — one for image CVE scanning, another for IaC misconfiguration checks, another for secret detection — each with its own setup, output format, and CI integration. Trivy consolidates these into one consistent tool with one consistent output format, which matters practically: a single CI gate can check images, IaC, and secrets together rather than maintaining and reconciling several separate scanning pipelines.

---

## Learning Modules

### Module 01 — Image & Filesystem Scanning
*CVE detection in container images and local files*

Trivy scans a container image's layers, identifying OS packages (apt/yum-installed) and language-specific dependencies (npm, pip, Maven, etc.) against a continuously-updated vulnerability database, reporting any known CVEs found — with severity ratings so a team can prioritize what actually matters.

**Topics covered:**

- Image scanning fundamentals — 🟢 Beginner
- Severity levels and filtering — 🟢 Beginner
- Filesystem and repository scanning — 🟡 Intermediate

```bash
# Scan a container image for vulnerabilities
trivy image nginx:1.25

# Filter to only HIGH and CRITICAL severity (the common CI-gate pattern)
trivy image --severity HIGH,CRITICAL nginx:1.25

# Scan a local filesystem/directory instead of an image
trivy fs ./my-app

# Scan a remote Git repository directly, no local clone needed
trivy repo https://github.com/example/repo
```

### Module 02 — IaC Misconfiguration Scanning
*Terraform, Kubernetes manifests, Dockerfiles*

Beyond vulnerabilities in installed packages, Trivy scans Infrastructure-as-Code configuration itself for known-bad patterns — an S3 bucket with public read access, a Kubernetes Pod running as root with no resource limits, a Dockerfile missing a non-root USER instruction — catching security misconfigurations before they're ever deployed, not after.

**Topics covered:**

- Terraform misconfiguration scanning — 🟡 Intermediate
- Kubernetes manifest scanning — 🟡 Intermediate
- Dockerfile best-practice checks — 🟢 Beginner

```bash
# Scan Terraform configuration for misconfigurations
trivy config ./terraform/

# Scan a Kubernetes manifest directory
trivy config ./k8s-manifests/

# Scan a Dockerfile specifically
trivy config Dockerfile
```

### Module 03 — Secret & SBOM Scanning
*Exposed credentials and software bill of materials*

Trivy also scans for accidentally-committed secrets (API keys, private keys, tokens matching known patterns) within images/filesystems/repos, and can generate an SBOM (Software Bill of Materials) — a complete, structured inventory of every component in an image or codebase, increasingly required for supply-chain security compliance.

**Topics covered:**

- Secret scanning — 🟡 Intermediate
- SBOM generation (CycloneDX, SPDX formats) — 🔴 Advanced
- License scanning — 🟡 Intermediate

```bash
# Secret scanning is included by default in a standard scan
trivy image myapp:latest
# (secrets are one of several scanner types Trivy runs together)

# Generate an SBOM in CycloneDX format
trivy image --format cyclonedx --output sbom.json myapp:latest

# License scanning
trivy image --scanners license myapp:latest
```

---

## Production Example

```bash
# Production Runbook — "our CI pipeline needs to block a merge if a
# new HIGH/CRITICAL vulnerability is introduced, without blocking on
# pre-existing, already-known-and-accepted lower-priority findings"

# Step 1: Run a baseline scan and confirm current state
trivy image --severity HIGH,CRITICAL myapp:current

# Step 2: Use --exit-code to make Trivy's own exit status drive CI
# gating -- 0 = no matching findings, 1 = findings present (customizable)
trivy image --severity HIGH,CRITICAL --exit-code 1 myapp:new-build
# A nonzero exit code here fails the CI job automatically

# Step 3: For findings that are genuinely accepted risk (a CVE with
# no available fix, assessed and accepted by the security team),
# use a .trivyignore file rather than just lowering severity globally
cat .trivyignore
# CVE-2023-12345  # accepted risk, no fix available, reviewed 2026-06-01

# Step 4: Generate a JSON report for audit/tracking purposes
# alongside the pass/fail CI gate itself
trivy image --format json --output scan-results.json myapp:new-build

# Step 5: Combine with IaC scanning in the same pipeline stage,
# not as an afterthought -- catching a misconfigured Terraform
# change alongside image vulnerabilities in one consistent gate
trivy config --exit-code 1 --severity HIGH,CRITICAL ./terraform/

# INTERVIEW POINT:
# "The .trivyignore file with a documented, reviewed reason per entry
# is what separates a genuine risk-acceptance decision from just
# silencing an inconvenient finding -- an unreviewed, undocumented
# ignore list defeats the whole point of scanning in the first place."
```

---

## Interview Prep

**PSR Formula:** Answer every question: **Problem → Solution → Result**. 45-90 seconds max.

### Common Interview Questions

**Q1. What is Trivy and why would you use it in production?**

**A:** **Problem:** container images and IaC configuration routinely contain known vulnerabilities, misconfigurations, or accidentally-committed secrets that manual review doesn't reliably catch, especially at the pace of continuous deployment. **Solution:** Trivy automatically scans images, filesystems, repositories, and IaC configuration for CVEs, misconfigurations, and secrets in one consistent tool, integrated directly into CI/CD as an automated gate. **Result:** known, fixable security issues get caught before deployment rather than discovered later in production (or by an attacker) — shifting security checks left in the pipeline where they're cheaper and faster to fix.

---

**Q2. How does Trivy work internally? Explain the architecture.**

**A:** **Problem:** understanding what Trivy actually checks against matters for trusting and correctly interpreting its results. **Solution:** Trivy maintains (and regularly updates) a local vulnerability database aggregated from multiple upstream sources (NVD, vendor-specific advisories, language-ecosystem advisory databases). For image scanning, it inspects each layer's installed OS packages and language dependencies, cross-referencing them against that database; for IaC scanning, it applies a set of built-in policy rules (and supports custom Rego-based policies) against the configuration's actual structure. **Result:** because the vulnerability database is a real, periodically-updated dependency, a scan's results can differ across runs if the DB has updated between them — worth knowing when reasoning about why a previously-clean scan later shows a new finding on the exact same image.

---

**Q3. What are the main scan types Trivy supports?**

**A:** **Problem:** "Trivy" covers several genuinely distinct scanning capabilities worth separating. **Solution:** image/filesystem/repo scanning (known CVEs in installed packages), config scanning (IaC misconfigurations in Terraform, Kubernetes manifests, Dockerfiles, CloudFormation), secret scanning (accidentally-committed credentials), license scanning, and SBOM generation. **Result:** knowing which scan type addresses which concern is what lets a team build a genuinely comprehensive CI gate — a pipeline only running image CVE scans is still blind to a misconfigured Terraform change or a leaked API key in the same repository.

---

**Q4. How do you handle failures/findings in a Trivy-gated CI pipeline?**

**A:** **Problem:** a CI gate that blocks on EVERY finding, including low-severity or already-accepted ones, quickly becomes noise teams learn to ignore or bypass entirely. **Solution:** filter by severity (`--severity HIGH,CRITICAL`) to focus CI gating on what actually matters for blocking a merge, and use a `.trivyignore` file — with a documented reason per entry — for specific, reviewed, genuinely-accepted findings (a CVE with no available fix yet), rather than either blocking on everything or silently lowering the bar globally. **Result:** a well-tuned gate blocks genuinely actionable, high-severity issues while making deliberate risk acceptance explicit and auditable, rather than an all-or-nothing choice between excessive noise and no real gating at all.

---

**Q5. What is your production experience with Trivy?**

**A:** This is a genuinely personal question — answer with a real incident using the Problem → Solution → Result structure: a CVE caught before a production deploy, a `.trivyignore` decision that later needed revisiting when a fix became available, or integrating Trivy alongside existing CI/CD tooling. Interviewers are listening for whether you've actually operated a scanning gate against a real pipeline's real friction, not just run `trivy image` once locally.

---

**Q6. How do you monitor and keep Trivy's scanning effective over time?**

**A:** **Problem:** a vulnerability scanner is only as good as its database's currency, and a `.trivyignore` list that's never revisited can silently accumulate stale, no-longer-justified exceptions. **Solution:** ensure Trivy's vulnerability database updates regularly (automatic by default when online; requires a deliberate offline-update process in air-gapped environments); periodically re-scan already-deployed images, not just new builds, since a previously-clean image can develop new findings as the database updates; periodically audit `.trivyignore` entries against whether a fix has since become available. **Result:** treating scanning as a one-time gate at build time misses vulnerabilities discovered in already-deployed images after the fact — genuinely mature usage re-scans running/deployed artifacts on a schedule, not just new builds.

---

**Q7. What are the security considerations when using Trivy itself?**

**A:** **Problem:** Trivy needs to pull its vulnerability database from the internet by default, which can be a real constraint or exposure surface depending on the environment. **Solution:** for air-gapped/highly-regulated environments, Trivy supports offline database updates (downloading and distributing the DB through an approved internal channel rather than each scan reaching the internet directly); scan results themselves (especially secret-scanning findings) are sensitive and should be handled with the same access control as any other security-relevant data, not casually posted in an open CI log. **Result:** these are genuine operational security considerations specific to running a scanner itself, distinct from what the scanner is protecting against in the scanned targets.

---

**Q8. How does Trivy compare to alternatives?**

**A:** This usually means a specific comparison. Trivy vs. Grype (Anchore): both are open-source image vulnerability scanners with broadly similar core capability; Trivy's broader scope (also covering IaC, secrets, SBOM, Kubernetes cluster scanning in one tool) is a real differentiator over a narrower, image-scanning-focused tool. Trivy vs. a cloud provider's native scanner (like Amazon ECR scanning): native scanners integrate simply within one cloud's registry but lack Trivy's portability across different environments/registries and its broader scan-type coverage. State the specific tool being compared and the actual tradeoff, rather than reciting a generic list.

---

**Q9. Why does Trivy's IaC/config scanning matter as much as its image scanning, even though "vulnerability scanner" often implies just CVE detection?**

**A:** A perfectly patched, zero-CVE container image can still be deployed with a genuinely dangerous configuration — a publicly-exposed database, an over-privileged Kubernetes Pod, a Terraform-provisioned resource with no encryption. CVE scanning alone is blind to this entire class of risk, which is exactly why Trivy's config-scanning capability (checking the actual IaC/manifest structure against known-bad patterns) addresses a genuinely separate, equally real risk category — not a redundant feature layered onto vulnerability scanning, but a distinct necessary check.

---

**Q10. Walk through how you'd add Trivy to an existing CI/CD pipeline for a containerized application with Terraform-provisioned infrastructure.**

**A:** Add an image scan stage after the image build step (`trivy image --severity HIGH,CRITICAL --exit-code 1`) so the pipeline fails on genuinely high-severity vulnerabilities before the image is ever pushed to a registry. Add a separate config scan stage against the Terraform directory (`trivy config --severity HIGH,CRITICAL --exit-code 1 ./terraform/`) to catch IaC misconfigurations before `terraform apply` runs. Set up a `.trivyignore` file for any specific, reviewed, genuinely-accepted findings, with a documented reason per entry. Generate and archive a JSON or SBOM report alongside the pass/fail gate for audit purposes, and schedule periodic re-scans of already-deployed images separately from the build-time gate, since new vulnerabilities can be discovered in an image after it's already deployed.
