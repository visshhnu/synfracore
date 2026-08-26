# Trivy Troubleshooting Guide

## Issue 1: Scan hangs or fails while downloading the vulnerability database

**Symptom:** `trivy image` appears stuck, or fails with a database-download timeout/connection error.

**Root Cause:** No/limited internet access from the scanning environment (a CI runner with restricted egress, an air-gapped host), or a rate limit / temporary unavailability of the database source.

**Debug steps:**
```bash
# Test basic connectivity to the DB source directly
curl -v https://ghcr.io/v2/aquasecurity/trivy-db/manifests/2

# Check whether a cached DB already exists locally
ls -la ~/.cache/trivy/db/
```

**Fix:**
```bash
# Use a persistent, shared cache directory so the DB is downloaded
# once and reused, rather than every run attempting a fresh download
trivy image --cache-dir /shared/trivy-cache myapp:latest

# For genuinely restricted environments, use the offline/air-gapped
# workflow instead of expecting direct internet access
trivy image --skip-db-update --cache-dir /shared/trivy-cache myapp:latest
```

---

## Issue 2: A CI pipeline's Trivy gate suddenly starts failing with no code changes

**Symptom:** A previously-passing build now fails Trivy's scan gate, despite no changes to the application code or Dockerfile.

**Root Cause:** Almost always the vulnerability database itself updated, surfacing a newly-discovered CVE affecting an already-installed dependency that was present all along — not a regression in the code.

**Debug steps:**
```bash
# Compare current findings against a previous scan's archived JSON
# output (if available) to confirm this is a NEW finding, not
# something that was always there and only now being caught
trivy image --format json --output current-scan.json myapp:latest
diff <(jq '.Results[].Vulnerabilities[].VulnerabilityID' previous-scan.json) \
     <(jq '.Results[].Vulnerabilities[].VulnerabilityID' current-scan.json)
```

**Fix:** Confirm whether a fix/patched version is available for the newly-flagged package and upgrade if so; if no fix is available yet, add a documented, reviewed `.trivyignore` entry rather than treating this as a code problem to chase down — the root cause is a database update, not a code regression, so the fix (or accepted exception) should be scoped accordingly.

---

## Issue 3: A finding Trivy reports doesn't actually seem to apply to how the application uses that package

**Symptom:** A CVE is flagged for an installed package, but the specific vulnerable code path isn't actually reachable/used by the application.

**Root Cause:** Trivy's vulnerability scanning is generally based on package/version presence, not deep static analysis of whether the specific vulnerable function is actually called — a package containing a CVE-affected function is flagged even if the application never invokes that particular function.

**Debug steps:**
```bash
# Confirm the specific finding and affected package/version
trivy image --format json myapp:latest | jq '.Results[].Vulnerabilities[] | select(.VulnerabilityID=="CVE-2023-12345")'
```

**Fix:** If confirmed genuinely not exploitable for this specific usage (verified, not just assumed), document this properly — ideally as a VEX statement with explicit justification (`vulnerable_code_not_in_execute_path` or similar), or at minimum a well-documented `.trivyignore` entry — rather than silently ignoring it without record. Don't assume non-exploitability without actually verifying the specific usage pattern, since this reasoning is a common source of incorrectly-dismissed real risk if done carelessly.

---

## Issue 4: `trivy config` reports misconfigurations that conflict with the team's own intentional design decisions

**Symptom:** Trivy's built-in misconfiguration checks flag something the team has deliberately configured that way for a legitimate reason.

**Root Cause:** Trivy's default policies are general-purpose best practices, not aware of any specific organization's deliberate, justified exceptions to a general rule.

**Debug steps:**
```bash
# Identify the specific check ID being triggered
trivy config --format json ./terraform/ | jq '.Results[].Misconfigurations[]'
```

**Fix:** Use a documented `.trivyignore` entry (config scanning supports ignoring specific check IDs the same way image scanning ignores specific CVEs) for genuinely deliberate, reviewed exceptions — or, if the team wants a genuinely different DEFAULT policy set entirely (not just isolated exceptions), consider whether a custom Rego policy set better reflects the organization's actual standards than repeatedly overriding the built-in default checks one at a time.

---

## Issue 5: Secret scanning produces a high volume of false positives

**Symptom:** Trivy's secret scanner flags many strings that aren't actually secrets (test fixtures, example configuration, randomly-generated non-sensitive IDs).

**Root Cause:** Entropy-based secret detection (flagging strings that "look" sufficiently random) inherently trades off precision for broader coverage — genuinely random-looking non-secret strings (test data, generated IDs, hashes used for non-secret purposes) can trigger the same heuristic that catches real leaked credentials.

**Debug steps:**
```bash
# Review specifically WHICH detection rule triggered each finding --
# pattern-based matches (a recognizable credential format) are
# generally more reliable than pure entropy-based flags
trivy image --format json myapp:latest | jq '.Results[].Secrets[]'
```

**Fix:** For confirmed false positives in test fixtures or example files specifically, exclude those paths from scanning (via `.trivyignore` path-based rules, or scan-scope configuration) rather than ignoring the secret scanner's findings broadly — narrowly excluding known-safe locations preserves the scanner's real value everywhere else, unlike disabling secret scanning entirely to avoid noise from a few known-safe files.
