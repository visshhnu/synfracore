# Trivy — PYQ (Practice Questions)

**Framing note:** Trivy doesn't have a formal, proctored vendor certification exam — there's no official leaked-question archive to draw from. What follows is built from this guide's own Overview/Fundamentals/Intermediate/Advanced material, framed as practice questions grounded in real, documented Trivy behavior.

---

### 1. (Domain: Core Concepts) Why does Trivy consolidate vulnerability, misconfiguration, and secret scanning into one tool rather than requiring separate tools per check type?

**Answer:** Before a consolidated tool, a team typically needed separate tools for image CVE scanning, IaC misconfiguration checks, and secret detection, each with its own setup and output format. One consistent tool with one consistent output format lets a single CI gate check images, IaC, and secrets together, rather than maintaining and reconciling several separate scanning pipelines with different integration points.

---

### 2. (Domain: CI/CD Integration) What's the practical effect of running `trivy image myapp:latest` WITHOUT the `--exit-code` flag in a CI pipeline?

**Answer:** Trivy reports whatever findings it discovers, but exits with status 0 regardless — meaning the CI pipeline step succeeds even if HIGH or CRITICAL vulnerabilities were found. This makes the scan purely informational rather than an enforced gate; `--exit-code` (combined with severity filtering) is required to make Trivy's exit status actually reflect the presence of matching findings.

---

### 3. (Domain: Vulnerability Database) An image scanned clean last month now shows 2 new CRITICAL findings, despite never being rebuilt. What's the most likely explanation?

**Answer:** Trivy's vulnerability database is periodically updated from multiple upstream sources — a CVE affecting a package that was already installed in that image can be discovered and added to the database after the original clean scan. The image's actual content is unchanged; the database's knowledge about known vulnerabilities has grown.

---

### 4. (Domain: Risk Management) What's the difference between a `.trivyignore` entry and simply lowering the severity threshold globally to avoid a specific finding?

**Answer:** A `.trivyignore` entry (with a documented reason) suppresses a SPECIFIC, reviewed finding while leaving the overall severity threshold intact for everything else — a targeted, auditable exception. Globally lowering the severity threshold to avoid one inconvenient finding weakens the gate for EVERY finding at that severity level, not just the specific one intended, a much broader and less deliberate change.

---

### 5. (Domain: SBOM) Why might a team generate and archive an SBOM at build time, separate from just running a standard vulnerability scan?

**Answer:** An SBOM is a complete, structured, portable inventory of every component in an image — useful for supply-chain security compliance requirements, and it enables later re-scanning against an UPDATED vulnerability database (`trivy sbom`) without needing to re-inspect the original image's actual layers again, which is faster than a full re-scan and doesn't require the original image artifact still being available.

---

### 6. (Domain: Config Scanning) Why can a container image with zero known CVEs still represent a real security risk when deployed?

**Answer:** CVE scanning only covers known vulnerabilities in installed packages/dependencies — it says nothing about how the resulting infrastructure or workload is actually CONFIGURED. A zero-CVE image deployed with a dangerous configuration (a publicly-exposed database, an over-privileged Kubernetes Pod with no resource limits) still carries real risk that only misconfiguration scanning (`trivy config`) would catch, a genuinely separate concern from package-level vulnerabilities.

---

### 7. (Domain: Secret Scanning) What are the two general mechanisms Trivy's secret scanning uses to detect exposed credentials?

**Answer:** Known-pattern matching (recognizing specific, well-known credential formats like AWS access key prefixes) and entropy-based heuristics (flagging strings that "look" like secrets based on their randomness, even without matching a specific known format). Pattern matching is more precise for known formats; entropy-based detection catches a broader range of generic secrets at the cost of a higher false-positive rate.

---

### 8. (Domain: Air-Gapped Environments) What's required to keep Trivy's vulnerability database current in an air-gapped environment with no direct internet access?

**Answer:** A deliberate, ongoing process: periodically download the updated database on a connected machine, transfer it through an approved internal channel, and refresh the air-gapped environment's local cache — the offline database does NOT auto-update on its own the way a normally-connected deployment would, so staying current requires an explicit recurring process, not a one-time setup.

---

### 9. (Domain: VEX) How does a VEX statement differ from an informal `.trivyignore` suppression, in terms of what it actually communicates?

**Answer:** `.trivyignore` is a local, tool-specific suppression with no standardized structure for expressing WHY — it silences a finding for Trivy specifically. VEX (Vulnerability Exploitability eXchange) is a structured, standardized, portable format expressing exploitability status with an explicit justification, shareable with downstream consumers of an image or SBOM who can then make their own informed decisions, rather than only seeing a locally-suppressed finding with no accompanying context.

---

### 10. (Domain: Kubernetes) Why does periodic cluster scanning (`trivy k8s`, or the Trivy Operator) matter in addition to build-time image scanning, rather than being redundant with it?

**Answer:** Build-time scanning only reflects what's known AT THE MOMENT of the build — it structurally cannot catch a vulnerability discovered in an already-installed package after that image has already been built and deployed. Cluster scanning re-checks already-running workloads against the CURRENT vulnerability database on an ongoing basis, catching this "discovered after deployment" class of risk that a one-time build-time gate alone leaves uncovered.
