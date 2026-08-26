# SonarQube Troubleshooting Guide

## Issue 1: Code coverage shows 0% despite tests genuinely existing and passing

**Symptom:** SonarQube's dashboard reports 0% coverage on a project the team knows has meaningful test coverage locally.

**Root Cause:** SonarQube doesn't run tests itself — it imports a coverage report the project's own test tooling generates. 0% almost always means the report was never actually generated as part of the CI run before the scan, or the configured report path doesn't match where the report was actually produced.

**Debug steps:**
```bash
# Confirm the coverage report file actually exists at the expected
# path, BEFORE the sonar-scanner step runs in the CI pipeline
ls -la target/site/jacoco/jacoco.xml   # (example: JaCoCo path)

# Confirm the scanner property matches that exact path
grep -r "sonar.coverage" sonar-project.properties
```

**Fix:** Ensure the test/coverage-report-generation step runs and completes successfully BEFORE the sonar-scanner step in the CI pipeline (a common mistake is ordering the scan before tests finish, or the scan running in a different working directory than where the report was generated), and confirm the report path property exactly matches the actual output location.

---

## Issue 2: Quality Gate status shows "PENDING" or is delayed long after the scanner finished

**Symptom:** The scanner completes and uploads successfully, but the CI pipeline's Quality Gate check remains pending for an unusually long time.

**Root Cause:** Server-side report processing (via Compute Engine) happens from a queue, separate from the scanner's own upload step — a burst of simultaneous analyses across the server (many projects/pipelines triggering scans around the same time) can create a real processing backlog.

**Debug steps:**
```bash
# Check the Compute Engine's background task status for this
# specific analysis via the SonarQube API
curl -u <token>: "https://sonarqube.example.com/api/ce/task?id=<task-id>"
```

**Fix:** If genuinely queue-bound (confirmed via the Compute Engine task status, not just assumed), this is a server capacity/scaling consideration rather than something fixable per-scan — for a self-hosted instance experiencing this regularly, reviewing Compute Engine worker count/server resources is the actual fix; for occasional bursts, waiting it out is reasonable if it's not a chronic pattern.

---

## Issue 3: A finding that seems clearly wrong/inapplicable keeps appearing on every scan

**Symptom:** The same finding, believed to be a false positive for this codebase's specific pattern, reappears on every analysis despite being reviewed and dismissed once already.

**Root Cause:** A one-time "resolve as false positive" action in the UI only applies to that specific issue instance — if the same PATTERN exists elsewhere in the code (or the exact line changes slightly across commits, technically becoming a "new" issue instance each time), the underlying rule keeps firing fresh each time rather than the dismissal persisting indefinitely for that pattern generally.

**Debug steps:**
```bash
# Confirm whether this is genuinely the SAME issue reappearing
# (dismissal didn't persist) versus a NEW instance of the same
# underlying pattern elsewhere/after a code change
```

**Fix:** For a genuinely persistent false-positive PATTERN across the codebase (not just one specific instance), consider adjusting the Quality Profile to disable or reconfigure that specific rule for this project, rather than repeatedly dismissing individual instances one at a time — a rule generating persistent, genuine false positives for a codebase's specific patterns is a signal the Quality Profile itself needs tuning, not that the dismissal mechanism is broken.

---

## Issue 4: PR decoration isn't appearing on pull requests despite the scan completing successfully

**Symptom:** `sonar-scanner` with PR parameters completes without error, but no inline comments or gate status check appears on the actual pull request.

**Root Cause:** Commonly a missing or misconfigured integration between SonarQube and the source control platform (GitHub/GitLab/etc.) — PR decoration requires a properly configured ALM (Application Lifecycle Management) integration with appropriate permissions, separate from the scanner analysis itself succeeding.

**Debug steps:**
```bash
# Check SonarQube server logs for PR decoration-specific errors
# around the time of the analysis

# Verify the ALM integration configuration in SonarQube's own
# admin settings (DevOps Platform Integration) is correctly set
# up and the token/credentials used have sufficient permissions
```

**Fix:** Correctly configure the DevOps Platform Integration in SonarQube's admin settings, ensuring the credentials used have write access to post PR comments/status checks on the source control platform — a successful scanner run alone doesn't guarantee this separate integration is correctly wired.

---

## Issue 5: A previously-passing Quality Gate suddenly starts failing with no obvious code changes

**Symptom:** A build that passed the Quality Gate now fails, despite the team believing nothing significant changed.

**Root Cause:** Commonly one of: the New Code period definition shifted in a way that now includes different code than before (e.g. a "number of days" window), a Quality Profile/Gate configuration was changed (by someone else, possibly without wide team visibility), or a coverage report genuinely stopped being generated correctly in a recent pipeline change, causing the coverage condition to newly fail.

**Debug steps:**
```bash
# Compare the specific failing condition(s) against the previous
# passing run -- SonarQube's UI shows exactly which gate condition(s)
# failed, not just an overall pass/fail
```

**Fix:** Identify the SPECIFIC failing condition first (coverage, new bugs, duplication, etc.) rather than assuming the cause — the fix differs entirely depending on whether it's a genuine new issue, a configuration change, or a broken coverage report pipeline, and treating all three the same way wastes time chasing the wrong root cause.
